Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BFFFC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:06:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C4B560187
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:06:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2C4B560187
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 063FD6065D;
	Tue,  3 Aug 2021 22:06:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TDc14M8I9kVy; Tue,  3 Aug 2021 22:06:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 485E7605D4;
	Tue,  3 Aug 2021 22:06:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 11E7C1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B47C83A9D
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FQIgRt0oHCOw for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 731448356C
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id BDB2A86AA7; Tue,  3 Aug 2021 21:10:09 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 19 Jul 2021 23:03:09 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a244355fa842aa4b457ae64349008c73ab4cdc60
X-Git-Newrev: 6507ac846cf82bb061ab1ca4575d62e2c9b5048e
X-Patchwork-Hint: ignore
Message-Id: <20210803211009.BDB2A86AA7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/nodejs: fix build with
 ICU 69
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7206074942462688846=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============7206074942462688846==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=6507ac846cf82bb061ab1ca4575d62e2c9b5048e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes:
../deps/v8/src/objects/js-list-format.cc: In static member function ‘static v8::internal::MaybeHandle<v8::internal::JSListFormat> v8::internal::JSListFormat::New(v8::internal::Isolate*, v8::internal::Handle<v8::internal::Map>, v8::internal::Handle<v8::internal::Object>, v8::internal::Handle<v8::internal::Object>)’:
../deps/v8/src/objects/js-list-format.cc:173:67: error: ‘static icu::ListFormatter* icu::ListFormatter::createInstance(const icu::Locale&, const char*, UErrorCode&)’ is private within this context
  173 |       icu_locale, GetIcuStyleString(style_enum, type_enum), status);
      |                                                                   ^
In file included from ../deps/v8/src/objects/js-list-format.cc:25:
/home/buildroot/buildroot/output/per-package/host-icu/host/include/unicode/listformatter.h:267:27: note: declared private here
  267 |     static ListFormatter* createInstance(const Locale& locale, const char* style, UErrorCode& errorCode);
      |                           ^~~~~~~~~~~~~~

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/nodejs/0002-Fix-build-with-ICU-68.patch | 101 ++++++++++++++++++++++++
 1 file changed, 101 insertions(+)

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

--===============7206074942462688846==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============7206074942462688846==--
