From: Carlos Santos <casantos@datacom.ind.br>
Date: Thu, 20 Jul 2017 07:57:26 -0300
Subject: [Buildroot] [PATCH v2 (2017.05.x)] protobuf: don't download patch
	from Github
In-Reply-To: <20170719223906.764e5ccf@windsurf>
References: <20170719223906.764e5ccf@windsurf>
Message-ID: <1500548246-25269-1-git-send-email-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patches downloaded from Github are not stable, so bring them in the
tree.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 package/protobuf/0001-Fix-freebsd-build.patch | 145 ++++++++++++++++++++++++++
 package/protobuf/protobuf.hash                |   1 -
 package/protobuf/protobuf.mk                  |   2 -
 3 files changed, 145 insertions(+), 3 deletions(-)
 create mode 100644 package/protobuf/0001-Fix-freebsd-build.patch

diff --git a/package/protobuf/0001-Fix-freebsd-build.patch b/package/protobuf/0001-Fix-freebsd-build.patch
new file mode 100644
index 0000000..96ce511
--- /dev/null
+++ b/package/protobuf/0001-Fix-freebsd-build.patch
@@ -0,0 +1,145 @@
+From 416f90939d4de58fe1a4e2489120010313183291 Mon Sep 17 00:00:00 2001
+From: Feng Xiao <xfxyjwf@gmail.com>
+Date: Tue, 14 Mar 2017 23:12:52 +0000
+Subject: [PATCH] Fix freebsd build.
+
+It turns out system headers included by generated plugin.pb.h file already contains
+major/minor macro definitions when built on FreeBSD and we need to add #undefs to
+the generated header file.
+
+This change also fixes another compile error regarding EXPECT_DEATH on FreeBSD.
+
+Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
+---
+ src/google/protobuf/compiler/cpp/cpp_file.cc      | 46 +++++++++++++++++++++++
+ src/google/protobuf/compiler/cpp/cpp_file.h       |  9 +++++
+ src/google/protobuf/compiler/plugin.pb.h          |  6 +++
+ src/google/protobuf/stubs/stringpiece_unittest.cc |  2 +
+ 4 files changed, 63 insertions(+)
+
+diff --git a/src/google/protobuf/compiler/cpp/cpp_file.cc b/src/google/protobuf/compiler/cpp/cpp_file.cc
+index 0e5e2f1..f2e013c 100644
+--- a/src/google/protobuf/compiler/cpp/cpp_file.cc
++++ b/src/google/protobuf/compiler/cpp/cpp_file.cc
+@@ -54,6 +54,39 @@ namespace google {
+ namespace protobuf {
+ namespace compiler {
+ namespace cpp {
++namespace {
++// The list of names that are defined as macros on some platforms. We need to
++// #undef them for the generated code to compile.
++const char* kMacroNames[] = {"major", "minor"};
++
++bool IsMacroName(const string& name) {
++  // Just do a linear search as the number of elements is very small.
++  for (int i = 0; i < GOOGLE_ARRAYSIZE(kMacroNames); ++i) {
++    if (name == kMacroNames[i]) return true;
++  }
++  return false;
++}
++
++void CollectMacroNames(const Descriptor* message, vector<string>* names) {
++  for (int i = 0; i < message->field_count(); ++i) {
++    const FieldDescriptor* field = message->field(i);
++    if (IsMacroName(field->name())) {
++      names->push_back(field->name());
++    }
++  }
++  for (int i = 0; i < message->nested_type_count(); ++i) {
++    CollectMacroNames(message->nested_type(i), names);
++  }
++}
++
++void CollectMacroNames(const FileDescriptor* file, vector<string>* names) {
++  for (int i = 0; i < file->message_type_count(); ++i) {
++    CollectMacroNames(file->message_type(i), names);
++  }
++}
++
++
++}  // namespace
+ 
+ // ===================================================================
+ 
+@@ -103,10 +136,23 @@ FileGenerator::FileGenerator(const FileDescriptor* file, const Options& options)
+ 
+ FileGenerator::~FileGenerator() {}
+ 
++void FileGenerator::GenerateMacroUndefs(io::Printer* printer) {
++  vector<string> names_to_undef;
++  CollectMacroNames(file_, &names_to_undef);
++  for (int i = 0; i < names_to_undef.size(); ++i) {
++    printer->Print(
++        "#ifdef $name$\n"
++        "#undef $name$\n"
++        "#endif\n",
++        "name", names_to_undef[i]);
++  }
++}
++
+ void FileGenerator::GenerateHeader(io::Printer* printer) {
+   printer->Print(
+     "// @@protoc_insertion_point(includes)\n");
+ 
++  GenerateMacroUndefs(printer);
+ 
+   GenerateForwardDeclarations(printer);
+ 
+diff --git a/src/google/protobuf/compiler/cpp/cpp_file.h b/src/google/protobuf/compiler/cpp/cpp_file.h
+index 25d6eab..e3fbb96 100644
+--- a/src/google/protobuf/compiler/cpp/cpp_file.h
++++ b/src/google/protobuf/compiler/cpp/cpp_file.h
+@@ -133,6 +133,15 @@ class FileGenerator {
+ 
+   void GenerateProto2NamespaceEnumSpecializations(io::Printer* printer);
+ 
++  // Sometimes the names we use in a .proto file happen to be defined as macros
++  // on some platforms (e.g., macro/minor used in plugin.proto are defined as
++  // macros in sys/types.h on FreeBSD and a few other platforms). To make the
++  // generated code compile on these platforms, we either have to undef the
++  // macro for these few platforms, or rename the field name for all platforms.
++  // Since these names are part of protobuf public API, renaming is generally
++  // a breaking change so we prefer the #undef approach.
++  void GenerateMacroUndefs(io::Printer* printer);
++
+   const FileDescriptor* file_;
+   const Options options_;
+ 
+diff --git a/src/google/protobuf/compiler/plugin.pb.h b/src/google/protobuf/compiler/plugin.pb.h
+index 1b91dac..d6afb21 100644
+--- a/src/google/protobuf/compiler/plugin.pb.h
++++ b/src/google/protobuf/compiler/plugin.pb.h
+@@ -30,6 +30,12 @@
+ #include <google/protobuf/unknown_field_set.h>
+ #include <google/protobuf/descriptor.pb.h>
+ // @@protoc_insertion_point(includes)
++#ifdef major
++#undef major
++#endif
++#ifdef minor
++#undef minor
++#endif
+ namespace google {
+ namespace protobuf {
+ class DescriptorProto;
+diff --git a/src/google/protobuf/stubs/stringpiece_unittest.cc b/src/google/protobuf/stubs/stringpiece_unittest.cc
+index a52d81f..a6a8759 100644
+--- a/src/google/protobuf/stubs/stringpiece_unittest.cc
++++ b/src/google/protobuf/stubs/stringpiece_unittest.cc
+@@ -783,11 +783,13 @@ TEST(FindOneCharTest, EdgeCases) {
+   EXPECT_EQ(StringPiece::npos, a.rfind('x'));
+ }
+ 
++#ifdef PROTOBUF_HAS_DEATH_TEST
+ #ifndef NDEBUG
+ TEST(NonNegativeLenTest, NonNegativeLen) {
+   EXPECT_DEATH(StringPiece("xyz", -1), "len >= 0");
+ }
+ #endif  // ndef DEBUG
++#endif  // PROTOBUF_HAS_DEATH_TEST
+ 
+ }  // namespace
+ }  // namespace protobuf
+-- 
+2.7.5
+
diff --git a/package/protobuf/protobuf.hash b/package/protobuf/protobuf.hash
index 8c2ade3..9ec6bc7 100644
--- a/package/protobuf/protobuf.hash
+++ b/package/protobuf/protobuf.hash
@@ -1,3 +1,2 @@
 # Locally calculated
 sha256 51d773e4297238b282eaa4c1dd317099675b12eef2b414732b851c00459225c6 protobuf-cpp-3.2.0.tar.gz
-sha256 da80c39838515913633f4cbd875fdd4ad711be95c83a50ff5096b9f1254033b3 416f90939d4de58fe1a4e2489120010313183291.patch
diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
index 2cd10eb..bd36ee4 100644
--- a/package/protobuf/protobuf.mk
+++ b/package/protobuf/protobuf.mk
@@ -23,8 +23,6 @@ endif
 
 PROTOBUF_INSTALL_STAGING = YES
 
-PROTOBUF_PATCH = https://github.com/google/protobuf/commit/416f90939d4de58fe1a4e2489120010313183291.patch
-
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 PROTOBUF_DEPENDENCIES += zlib
 endif
-- 
2.7.5
