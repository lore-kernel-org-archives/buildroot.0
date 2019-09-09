From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon,  9 Sep 2019 11:31:40 -0500
Subject: [Buildroot] [PATCH] package/protobuf-c: bump 1.3.2
Message-ID: <20190909163140.63127-1-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 .../0001-Add-std-to-some-types.patch          | 110 ------------
 .../0002-Fix-build-with-protobuf-3.6.x.patch  | 160 ------------------
 package/protobuf-c/protobuf-c.hash            |   3 +-
 package/protobuf-c/protobuf-c.mk              |   2 +-
 4 files changed, 3 insertions(+), 272 deletions(-)
 delete mode 100644 package/protobuf-c/0001-Add-std-to-some-types.patch
 delete mode 100644 package/protobuf-c/0002-Fix-build-with-protobuf-3.6.x.patch

diff --git a/package/protobuf-c/0001-Add-std-to-some-types.patch b/package/protobuf-c/0001-Add-std-to-some-types.patch
deleted file mode 100644
index 8f1a5d0be0..0000000000
--- a/package/protobuf-c/0001-Add-std-to-some-types.patch
+++ /dev/null
@@ -1,110 +0,0 @@
-From 034e603d2a5e629c1c3fbac405638f8afb3ead51 Mon Sep 17 00:00:00 2001
-From: Fredrik Gustafsson <iveqy@iveqy.com>
-Date: Sun, 11 Mar 2018 08:57:46 +0100
-Subject: [PATCH] Add std:: to some types
-
-This is required for compilation to succeed on debian jessie with g++
-6.3.0.
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from: https://github.com/protobuf-c/protobuf-c/pull/309]
----
- protoc-c/c_file.h       |  2 +-
- protoc-c/c_generator.cc |  8 ++++----
- protoc-c/c_helpers.cc   | 12 ++++++------
- 3 files changed, 11 insertions(+), 11 deletions(-)
-
-diff --git a/protoc-c/c_file.h b/protoc-c/c_file.h
-index ed38ce4..84df522 100644
---- a/protoc-c/c_file.h
-+++ b/protoc-c/c_file.h
-@@ -104,7 +104,7 @@ class FileGenerator {
-   scoped_array<scoped_ptr<ExtensionGenerator> > extension_generators_;
- 
-   // E.g. if the package is foo.bar, package_parts_ is {"foo", "bar"}.
--  vector<string> package_parts_;
-+  std::vector<string> package_parts_;
- 
-   GOOGLE_DISALLOW_EVIL_CONSTRUCTORS(FileGenerator);
- };
-diff --git a/protoc-c/c_generator.cc b/protoc-c/c_generator.cc
-index a0d0cb6..79a272f 100644
---- a/protoc-c/c_generator.cc
-+++ b/protoc-c/c_generator.cc
-@@ -80,13 +80,13 @@ namespace c {
- //   "foo=bar,baz,qux=corge"
- // parses to the pairs:
- //   ("foo", "bar"), ("baz", ""), ("qux", "corge")
--void ParseOptions(const string& text, vector<pair<string, string> >* output) {
--  vector<string> parts;
-+void ParseOptions(const string& text, std::vector<std::pair<string, string> >* output) {
-+  std::vector<string> parts;
-   SplitStringUsing(text, ",", &parts);
- 
-   for (unsigned i = 0; i < parts.size(); i++) {
-     string::size_type equals_pos = parts[i].find_first_of('=');
--    pair<string, string> value;
-+    std::pair<string, string> value;
-     if (equals_pos == string::npos) {
-       value.first = parts[i];
-       value.second = "";
-@@ -105,7 +105,7 @@ bool CGenerator::Generate(const FileDescriptor* file,
-                             const string& parameter,
-                             OutputDirectory* output_directory,
-                             string* error) const {
--  vector<pair<string, string> > options;
-+  std::vector<std::pair<string, string> > options;
-   ParseOptions(parameter, &options);
- 
-   // -----------------------------------------------------------------
-diff --git a/protoc-c/c_helpers.cc b/protoc-c/c_helpers.cc
-index b79b5b0..71b8682 100644
---- a/protoc-c/c_helpers.cc
-+++ b/protoc-c/c_helpers.cc
-@@ -177,7 +177,7 @@ string ToCamel(const string &name) {
- }
- 
- string FullNameToLower(const string &full_name) {
--  vector<string> pieces;
-+  std::vector<string> pieces;
-   SplitStringUsing(full_name, ".", &pieces);
-   string rv = "";
-   for (unsigned i = 0; i < pieces.size(); i++) {
-@@ -188,7 +188,7 @@ string FullNameToLower(const string &full_name) {
-   return rv;
- }
- string FullNameToUpper(const string &full_name) {
--  vector<string> pieces;
-+  std::vector<string> pieces;
-   SplitStringUsing(full_name, ".", &pieces);
-   string rv = "";
-   for (unsigned i = 0; i < pieces.size(); i++) {
-@@ -199,7 +199,7 @@ string FullNameToUpper(const string &full_name) {
-   return rv;
- }
- string FullNameToC(const string &full_name) {
--  vector<string> pieces;
-+  std::vector<string> pieces;
-   SplitStringUsing(full_name, ".", &pieces);
-   string rv = "";
-   for (unsigned i = 0; i < pieces.size(); i++) {
-@@ -214,7 +214,7 @@ void PrintComment (io::Printer* printer, string comment)
- {
-    if (!comment.empty())
-    {
--      vector<string> comment_lines;
-+      std::vector<string> comment_lines;
-       SplitStringUsing (comment, "\r\n", &comment_lines);
-       printer->Print ("/*\n");
-       for (int i = 0; i < comment_lines.size(); i++)
-@@ -503,8 +503,8 @@ void SplitStringToIteratorUsing(const string& full,
- 
- void SplitStringUsing(const string& full,
-                       const char* delim,
--                      vector<string>* result) {
--  std::back_insert_iterator< vector<string> > it(*result);
-+                      std::vector<string>* result) {
-+  std::back_insert_iterator< std::vector<string> > it(*result);
-   SplitStringToIteratorUsing(full, delim, it);
- }
- 
diff --git a/package/protobuf-c/0002-Fix-build-with-protobuf-3.6.x.patch b/package/protobuf-c/0002-Fix-build-with-protobuf-3.6.x.patch
deleted file mode 100644
index 1469e01015..0000000000
--- a/package/protobuf-c/0002-Fix-build-with-protobuf-3.6.x.patch
+++ /dev/null
@@ -1,160 +0,0 @@
-From 67e5187e96baac2e16d88ac01471c5ce7cdc3c53 Mon Sep 17 00:00:00 2001
-From: ilovezfs <ilovezfs@icloud.com>
-Date: Wed, 20 Jun 2018 08:08:53 -0700
-Subject: [PATCH] Fix build with protobuf 3.6.x
-
-Adapt to changes from https://github.com/google/protobuf/pull/4387.
-
-scoped_ptr and scoped_array were removed in favor of std::unique_ptr
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from: https://github.com/protobuf-c/protobuf-c/pull/328]
----
- protoc-c/c_field.cc     | 2 +-
- protoc-c/c_field.h      | 2 +-
- protoc-c/c_file.cc      | 8 ++++----
- protoc-c/c_file.h       | 8 ++++----
- protoc-c/c_generator.cc | 4 ++--
- protoc-c/c_helpers.cc   | 2 +-
- protoc-c/c_message.cc   | 6 +++---
- protoc-c/c_message.h    | 6 +++---
- 8 files changed, 19 insertions(+), 19 deletions(-)
-
-diff --git a/protoc-c/c_field.cc b/protoc-c/c_field.cc
-index 9fa56ef..eaa38d2 100644
---- a/protoc-c/c_field.cc
-+++ b/protoc-c/c_field.cc
-@@ -189,7 +189,7 @@ void FieldGenerator::GenerateDescriptorInitializerGeneric(io::Printer* printer,
- FieldGeneratorMap::FieldGeneratorMap(const Descriptor* descriptor)
-   : descriptor_(descriptor),
-     field_generators_(
--      new scoped_ptr<FieldGenerator>[descriptor->field_count()]) {
-+      new std::unique_ptr<FieldGenerator>[descriptor->field_count()]) {
-   // Construct all the FieldGenerators.
-   for (int i = 0; i < descriptor->field_count(); i++) {
-     field_generators_[i].reset(MakeGenerator(descriptor->field(i)));
-diff --git a/protoc-c/c_field.h b/protoc-c/c_field.h
-index 91f1a03..efd5a29 100644
---- a/protoc-c/c_field.h
-+++ b/protoc-c/c_field.h
-@@ -117,7 +117,7 @@ class FieldGeneratorMap {
- 
-  private:
-   const Descriptor* descriptor_;
--  scoped_array<scoped_ptr<FieldGenerator> > field_generators_;
-+  std::unique_ptr<std::unique_ptr<FieldGenerator>[] > field_generators_;
- 
-   static FieldGenerator* MakeGenerator(const FieldDescriptor* field);
- 
-diff --git a/protoc-c/c_file.cc b/protoc-c/c_file.cc
-index 9851768..6dae516 100644
---- a/protoc-c/c_file.cc
-+++ b/protoc-c/c_file.cc
-@@ -83,13 +83,13 @@ FileGenerator::FileGenerator(const FileDescriptor* file,
-                              const string& dllexport_decl)
-   : file_(file),
-     message_generators_(
--      new scoped_ptr<MessageGenerator>[file->message_type_count()]),
-+      new std::unique_ptr<MessageGenerator>[file->message_type_count()]),
-     enum_generators_(
--      new scoped_ptr<EnumGenerator>[file->enum_type_count()]),
-+      new std::unique_ptr<EnumGenerator>[file->enum_type_count()]),
-     service_generators_(
--      new scoped_ptr<ServiceGenerator>[file->service_count()]),
-+      new std::unique_ptr<ServiceGenerator>[file->service_count()]),
-     extension_generators_(
--      new scoped_ptr<ExtensionGenerator>[file->extension_count()]) {
-+      new std::unique_ptr<ExtensionGenerator>[file->extension_count()]) {
- 
-   for (int i = 0; i < file->message_type_count(); i++) {
-     message_generators_[i].reset(
-diff --git a/protoc-c/c_file.h b/protoc-c/c_file.h
-index ed38ce4..e86cc44 100644
---- a/protoc-c/c_file.h
-+++ b/protoc-c/c_file.h
-@@ -98,10 +98,10 @@ class FileGenerator {
-  private:
-   const FileDescriptor* file_;
- 
--  scoped_array<scoped_ptr<MessageGenerator> > message_generators_;
--  scoped_array<scoped_ptr<EnumGenerator> > enum_generators_;
--  scoped_array<scoped_ptr<ServiceGenerator> > service_generators_;
--  scoped_array<scoped_ptr<ExtensionGenerator> > extension_generators_;
-+  std::unique_ptr<std::unique_ptr<MessageGenerator>[] > message_generators_;
-+  std::unique_ptr<std::unique_ptr<EnumGenerator>[] > enum_generators_;
-+  std::unique_ptr<std::unique_ptr<ServiceGenerator>[] > service_generators_;
-+  std::unique_ptr<std::unique_ptr<ExtensionGenerator>[] > extension_generators_;
- 
-   // E.g. if the package is foo.bar, package_parts_ is {"foo", "bar"}.
-   vector<string> package_parts_;
-diff --git a/protoc-c/c_generator.cc b/protoc-c/c_generator.cc
-index a0d0cb6..fe3ad26 100644
---- a/protoc-c/c_generator.cc
-+++ b/protoc-c/c_generator.cc
-@@ -149,7 +149,7 @@ bool CGenerator::Generate(const FileDescriptor* file,
- 
-   // Generate header.
-   {
--    scoped_ptr<io::ZeroCopyOutputStream> output(
-+    std::unique_ptr<io::ZeroCopyOutputStream> output(
-       output_directory->Open(basename + ".h"));
-     io::Printer printer(output.get(), '$');
-     file_generator.GenerateHeader(&printer);
-@@ -157,7 +157,7 @@ bool CGenerator::Generate(const FileDescriptor* file,
- 
-   // Generate cc file.
-   {
--    scoped_ptr<io::ZeroCopyOutputStream> output(
-+    std::unique_ptr<io::ZeroCopyOutputStream> output(
-       output_directory->Open(basename + ".c"));
-     io::Printer printer(output.get(), '$');
-     file_generator.GenerateSource(&printer);
-diff --git a/protoc-c/c_helpers.cc b/protoc-c/c_helpers.cc
-index b79b5b0..f2ab448 100644
---- a/protoc-c/c_helpers.cc
-+++ b/protoc-c/c_helpers.cc
-@@ -559,7 +559,7 @@ static int CEscapeInternal(const char* src, int src_len, char* dest,
- }
- string CEscape(const string& src) {
-   const int dest_length = src.size() * 4 + 1; // Maximum possible expansion
--  scoped_array<char> dest(new char[dest_length]);
-+  std::unique_ptr<char[]> dest(new char[dest_length]);
-   const int len = CEscapeInternal(src.data(), src.size(),
-                                   dest.get(), dest_length, false);
-   GOOGLE_DCHECK_GE(len, 0);
-diff --git a/protoc-c/c_message.cc b/protoc-c/c_message.cc
-index 6b22c71..85a946e 100755
---- a/protoc-c/c_message.cc
-+++ b/protoc-c/c_message.cc
-@@ -83,11 +83,11 @@ MessageGenerator::MessageGenerator(const Descriptor* descriptor,
-   : descriptor_(descriptor),
-     dllexport_decl_(dllexport_decl),
-     field_generators_(descriptor),
--    nested_generators_(new scoped_ptr<MessageGenerator>[
-+    nested_generators_(new std::unique_ptr<MessageGenerator>[
-       descriptor->nested_type_count()]),
--    enum_generators_(new scoped_ptr<EnumGenerator>[
-+    enum_generators_(new std::unique_ptr<EnumGenerator>[
-       descriptor->enum_type_count()]),
--    extension_generators_(new scoped_ptr<ExtensionGenerator>[
-+    extension_generators_(new std::unique_ptr<ExtensionGenerator>[
-       descriptor->extension_count()]) {
- 
-   for (int i = 0; i < descriptor->nested_type_count(); i++) {
-diff --git a/protoc-c/c_message.h b/protoc-c/c_message.h
-index 8b115d1..63aa97a 100644
---- a/protoc-c/c_message.h
-+++ b/protoc-c/c_message.h
-@@ -126,9 +126,9 @@ class MessageGenerator {
-   const Descriptor* descriptor_;
-   string dllexport_decl_;
-   FieldGeneratorMap field_generators_;
--  scoped_array<scoped_ptr<MessageGenerator> > nested_generators_;
--  scoped_array<scoped_ptr<EnumGenerator> > enum_generators_;
--  scoped_array<scoped_ptr<ExtensionGenerator> > extension_generators_;
-+  std::unique_ptr<std::unique_ptr<MessageGenerator>[] > nested_generators_;
-+  std::unique_ptr<std::unique_ptr<EnumGenerator>[] > enum_generators_;
-+  std::unique_ptr<std::unique_ptr<ExtensionGenerator>[] > extension_generators_;
- 
-   GOOGLE_DISALLOW_EVIL_CONSTRUCTORS(MessageGenerator);
- };
diff --git a/package/protobuf-c/protobuf-c.hash b/package/protobuf-c/protobuf-c.hash
index 03c2e70e96..4f9c75a02f 100644
--- a/package/protobuf-c/protobuf-c.hash
+++ b/package/protobuf-c/protobuf-c.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 fd8f6f5d6927330cf2b8b4ec8332de8b1ee2b8f2480b52ee3f221aad6de2082c protobuf-c-1.3.0.tar.gz
+sha256	5205312e561b75b9d2db671b22f28d67afb5c7d1fef94a6f2d29d775ca4e0519  protobuf-c-1.3.2.tar.gz
+sha256	20e800cad4550f4b19bb37fc9577dac21de13333ae66497c4c45ae489c35c34a  LICENSE
diff --git a/package/protobuf-c/protobuf-c.mk b/package/protobuf-c/protobuf-c.mk
index 74fe295640..2770d35b7b 100644
--- a/package/protobuf-c/protobuf-c.mk
+++ b/package/protobuf-c/protobuf-c.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROTOBUF_C_VERSION = 1.3.0
+PROTOBUF_C_VERSION = 1.3.2
 PROTOBUF_C_SITE = $(call github,protobuf-c,protobuf-c,v$(PROTOBUF_C_VERSION))
 PROTOBUF_C_DEPENDENCIES = host-protobuf-c
 HOST_PROTOBUF_C_DEPENDENCIES = host-protobuf host-pkgconf
-- 
2.17.1
