From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 19 Jul 2021 04:03:52 -0600
Subject: [Buildroot] [PATCH 1/1] package/nodejs: fix build with ICU 69
Message-ID: <20210719100352.3541635-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Fixes:
../deps/v8/src/objects/js-list-format.cc: In static member function ?static v8::internal::MaybeHandle<v8::internal::JSListFormat> v8::internal::JSListFormat::New(v8::internal::Isolate*, v8::internal::Handle<v8::internal::Map>, v8::internal::Handle<v8::internal::Object>, v8::internal::Handle<v8::internal::Object>)?:
../deps/v8/src/objects/js-list-format.cc:173:67: error: ?static icu::ListFormatter* icu::ListFormatter::createInstance(const icu::Locale&, const char*, UErrorCode&)? is private within this context
  173 |       icu_locale, GetIcuStyleString(style_enum, type_enum), status);
      |                                                                   ^
In file included from ../deps/v8/src/objects/js-list-format.cc:25:
/home/buildroot/buildroot/output/per-package/host-icu/host/include/unicode/listformatter.h:267:27: note: declared private here
  267 |     static ListFormatter* createInstance(const Locale& locale, const char* style, UErrorCode& errorCode);
      |                           ^~~~~~~~~~~~~~

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../nodejs/0002-Fix-build-with-ICU-68.patch   | 101 ++++++++++++++++++
 1 file changed, 101 insertions(+)
 create mode 100644 package/nodejs/0002-Fix-build-with-ICU-68.patch

diff --git a/package/nodejs/0002-Fix-build-with-ICU-68.patch b/package/nodejs/0002-Fix-build-with-ICU-68.patch
new file mode 100644
index 0000000000..2d6ac010d2
--- /dev/null
+++ b/package/nodejs/0002-Fix-build-with-ICU-68.patch
@@ -0,0 +1,101 @@
+From 1504de672ec44080d08a97c479a23727a9c31d8b Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Mon, 19 Jul 2021 03:35:30 -0600
+Subject: [PATCH] Fix build with ICU >= 68.
+
+Adapted from:
+https://chromium-review.googlesource.com/c/v8/v8/+/2477751
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[Upstream status:
+https://github.com/nodejs/node/pull/39440]
+---
+ deps/v8/src/objects/js-list-format.cc | 32 +++++++++++++++++++++++++++
+ 1 file changed, 32 insertions(+)
+
+diff --git a/deps/v8/src/objects/js-list-format.cc b/deps/v8/src/objects/js-list-format.cc
+index 4f303b1874..2101f8e507 100644
+--- a/deps/v8/src/objects/js-list-format.cc
++++ b/deps/v8/src/objects/js-list-format.cc
+@@ -29,6 +29,7 @@ namespace v8 {
+ namespace internal {
+ 
+ namespace {
++#if U_ICU_VERSION_MAJOR_NUM < 68
+ const char* kStandard = "standard";
+ const char* kOr = "or";
+ const char* kUnit = "unit";
+@@ -41,8 +42,24 @@ const char* kUnitNarrow = "unit-narrow";
+ 
+ const char* GetIcuStyleString(JSListFormat::Style style,
+                               JSListFormat::Type type) {
++#else
++UListFormatterWidth GetIcuWidth(JSListFormat::Style style) {
++  switch (style) {
++    case JSListFormat::Style::LONG:
++      return ULISTFMT_WIDTH_WIDE;
++    case JSListFormat::Style::SHORT:
++      return ULISTFMT_WIDTH_SHORT;
++    case JSListFormat::Style::NARROW:
++      return ULISTFMT_WIDTH_NARROW;
++  }
++  UNREACHABLE();
++}
++
++UListFormatterType GetIcuType(JSListFormat::Type type) {
++#endif
+   switch (type) {
+     case JSListFormat::Type::CONJUNCTION:
++#if U_ICU_VERSION_MAJOR_NUM < 68
+       switch (style) {
+         case JSListFormat::Style::LONG:
+           return kStandard;
+@@ -51,7 +68,11 @@ const char* GetIcuStyleString(JSListFormat::Style style,
+         case JSListFormat::Style::NARROW:
+           return kStandardNarrow;
+       }
++#else
++      return ULISTFMT_TYPE_AND;
++#endif
+     case JSListFormat::Type::DISJUNCTION:
++#if U_ICU_VERSION_MAJOR_NUM < 68
+       switch (style) {
+         case JSListFormat::Style::LONG:
+           return kOr;
+@@ -60,7 +81,11 @@ const char* GetIcuStyleString(JSListFormat::Style style,
+         case JSListFormat::Style::NARROW:
+           return kOrNarrow;
+       }
++#else
++      return ULISTFMT_TYPE_OR;
++#endif
+     case JSListFormat::Type::UNIT:
++#if U_ICU_VERSION_MAJOR_NUM < 68
+       switch (style) {
+         case JSListFormat::Style::LONG:
+           return kUnit;
+@@ -69,6 +94,9 @@ const char* GetIcuStyleString(JSListFormat::Style style,
+         case JSListFormat::Style::NARROW:
+           return kUnitNarrow;
+       }
++#else
++      return ULISTFMT_TYPE_UNITS;
++#endif
+   }
+   UNREACHABLE();
+ }
+@@ -170,7 +198,11 @@ MaybeHandle<JSListFormat> JSListFormat::New(Isolate* isolate, Handle<Map> map,
+   icu::Locale icu_locale = r.icu_locale;
+   UErrorCode status = U_ZERO_ERROR;
+   icu::ListFormatter* formatter = icu::ListFormatter::createInstance(
++#if U_ICU_VERSION_MAJOR_NUM < 68
+       icu_locale, GetIcuStyleString(style_enum, type_enum), status);
++#else
++      icu_locale, GetIcuType(type_enum), GetIcuWidth(style_enum), status);
++#endif
+   if (U_FAILURE(status)) {
+     delete formatter;
+     FATAL("Failed to create ICU list formatter, are ICU data files missing?");
+-- 
+2.25.1
+
-- 
2.25.1
