Return-Path: <SRS0=BoAS=M7=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66EE1C4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 18:02:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B46F460E97
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 18:02:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B46F460E97
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5ABA782CE5;
	Sun,  8 Aug 2021 18:02:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PgmUUbZ7jXpK; Sun,  8 Aug 2021 18:02:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9144F8274D;
	Sun,  8 Aug 2021 18:02:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A67BB1BF575
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 18:02:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 94E9040171
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 18:02:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zUihXHNUB9fl for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 18:02:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 35627400F2
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 18:02:30 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id cf5so21081768edb.2
 for <buildroot@buildroot.org>; Sun, 08 Aug 2021 11:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6BzWtJSlub+zLgv7scK+NlKP1qWuPTEKpUj+BiLEZBM=;
 b=bLSdJtQhKgp12qvPlM9nnc9Xgfog/kzkvi8qOayrDllZ0EyOcoA9DP6F2lChqXjTWN
 TfQOpgRsy0xCOOoCOJQ4P6iThFn2TL6qyrl+fAUmV8R+kKTG/MxMIduuLgyT8LEfM53P
 huwTEw0eU3Mcu49zAaCBkHJO0sxmlB0SV9RcqevkgYLge9zMte/m/uuTeSD0E6Xv3TOx
 Rv2UYCIxiJoCs78QPS0w5B6y2fmBN+mZOumpb5Nuw8Z1wupu2DLEi3ru2qkmDZ1XEbCu
 cVExOemTKvwglN0KINSDOm85Fd8JZI0HQPrO4N1z28smoqRJjw3EE3SbRtQrW59qLpeU
 018w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=6BzWtJSlub+zLgv7scK+NlKP1qWuPTEKpUj+BiLEZBM=;
 b=Eg4J1xY58wL2UjH+KvhgtLVvMUnG1CZdzyrtC6i6muWbiuDifyv+EXZhU0slEA3ip0
 t1sNVZ2S7ivqABAevjvITZ9pN9q8s0i1t/ZJ7fqEuONeCAD0AM+sijwm5dYS+ImjSmX9
 VfSThiJXQxDIuYQrAkyGxpPf/WvQRoHjEOQzI4yjbRtm4l2iZ1KOcwjbrXgTrMN9r2Nx
 PDgSkAOBH7dOv8sKolRFEhN8blGnJPrzrTfh6cPJKRKDfymG62kaq7A0aPYEeIzFgF92
 MW2gwXzVD3u6Az48W1u8SyXVGN72LlKyzOoxORbm+GfOYHvYKlIMZg8QMbEpqVFfXNtE
 OdwQ==
X-Gm-Message-State: AOAM531HW/P84xg/BQsBOADaE/WMJv2Uxw7AZ8vAU/bMNzcwGUEcqApr
 XqUkYFFp4fNxTTuOqfqAnvVYaqHUVAut3g==
X-Google-Smtp-Source: ABdhPJzpDGvVaPrYPx+8UrFsKArq9bwfpNVu17ai2T9bVkHkRtHysaOHvyHjkeDM/fi4ZbQ3eJxguw==
X-Received: by 2002:a05:6402:5145:: with SMTP id
 n5mr24861373edd.178.1628445748310; 
 Sun, 08 Aug 2021 11:02:28 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id bm26sm5186026ejb.16.2021.08.08.11.02.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Aug 2021 11:02:27 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1mCn7y-0006YC-JX; Sun, 08 Aug 2021 20:02:26 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun,  8 Aug 2021 20:02:23 +0200
Message-Id: <20210808180223.25135-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/nodejs: security bump to version 12.22.4
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
Cc: Daniel Price <daniel.price@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fixes the following security issues:

- CVE-2021-22930: Use after free on close http2 on stream canceling (High)

  Node.js is vulnerable to a use after free attack where an attacker might
  be able to exploit the memory corruption, to change process behavior.

Drop 0002-Fix-build-with-ICU-68.patch as this is now fixed upstream since
https://github.com/nodejs/node/commit/e459c79b02

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../nodejs/0002-Fix-build-with-ICU-68.patch   | 101 ------------------
 package/nodejs/nodejs.hash                    |   4 +-
 package/nodejs/nodejs.mk                      |   2 +-
 3 files changed, 3 insertions(+), 104 deletions(-)
 delete mode 100644 package/nodejs/0002-Fix-build-with-ICU-68.patch

diff --git a/package/nodejs/0002-Fix-build-with-ICU-68.patch b/package/nodejs/0002-Fix-build-with-ICU-68.patch
deleted file mode 100644
index 2d6ac010d2..0000000000
--- a/package/nodejs/0002-Fix-build-with-ICU-68.patch
+++ /dev/null
@@ -1,101 +0,0 @@
-From 1504de672ec44080d08a97c479a23727a9c31d8b Mon Sep 17 00:00:00 2001
-From: James Hilliard <james.hilliard1@gmail.com>
-Date: Mon, 19 Jul 2021 03:35:30 -0600
-Subject: [PATCH] Fix build with ICU >= 68.
-
-Adapted from:
-https://chromium-review.googlesource.com/c/v8/v8/+/2477751
-
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-[Upstream status:
-https://github.com/nodejs/node/pull/39440]
----
- deps/v8/src/objects/js-list-format.cc | 32 +++++++++++++++++++++++++++
- 1 file changed, 32 insertions(+)
-
-diff --git a/deps/v8/src/objects/js-list-format.cc b/deps/v8/src/objects/js-list-format.cc
-index 4f303b1874..2101f8e507 100644
---- a/deps/v8/src/objects/js-list-format.cc
-+++ b/deps/v8/src/objects/js-list-format.cc
-@@ -29,6 +29,7 @@ namespace v8 {
- namespace internal {
- 
- namespace {
-+#if U_ICU_VERSION_MAJOR_NUM < 68
- const char* kStandard = "standard";
- const char* kOr = "or";
- const char* kUnit = "unit";
-@@ -41,8 +42,24 @@ const char* kUnitNarrow = "unit-narrow";
- 
- const char* GetIcuStyleString(JSListFormat::Style style,
-                               JSListFormat::Type type) {
-+#else
-+UListFormatterWidth GetIcuWidth(JSListFormat::Style style) {
-+  switch (style) {
-+    case JSListFormat::Style::LONG:
-+      return ULISTFMT_WIDTH_WIDE;
-+    case JSListFormat::Style::SHORT:
-+      return ULISTFMT_WIDTH_SHORT;
-+    case JSListFormat::Style::NARROW:
-+      return ULISTFMT_WIDTH_NARROW;
-+  }
-+  UNREACHABLE();
-+}
-+
-+UListFormatterType GetIcuType(JSListFormat::Type type) {
-+#endif
-   switch (type) {
-     case JSListFormat::Type::CONJUNCTION:
-+#if U_ICU_VERSION_MAJOR_NUM < 68
-       switch (style) {
-         case JSListFormat::Style::LONG:
-           return kStandard;
-@@ -51,7 +68,11 @@ const char* GetIcuStyleString(JSListFormat::Style style,
-         case JSListFormat::Style::NARROW:
-           return kStandardNarrow;
-       }
-+#else
-+      return ULISTFMT_TYPE_AND;
-+#endif
-     case JSListFormat::Type::DISJUNCTION:
-+#if U_ICU_VERSION_MAJOR_NUM < 68
-       switch (style) {
-         case JSListFormat::Style::LONG:
-           return kOr;
-@@ -60,7 +81,11 @@ const char* GetIcuStyleString(JSListFormat::Style style,
-         case JSListFormat::Style::NARROW:
-           return kOrNarrow;
-       }
-+#else
-+      return ULISTFMT_TYPE_OR;
-+#endif
-     case JSListFormat::Type::UNIT:
-+#if U_ICU_VERSION_MAJOR_NUM < 68
-       switch (style) {
-         case JSListFormat::Style::LONG:
-           return kUnit;
-@@ -69,6 +94,9 @@ const char* GetIcuStyleString(JSListFormat::Style style,
-         case JSListFormat::Style::NARROW:
-           return kUnitNarrow;
-       }
-+#else
-+      return ULISTFMT_TYPE_UNITS;
-+#endif
-   }
-   UNREACHABLE();
- }
-@@ -170,7 +198,11 @@ MaybeHandle<JSListFormat> JSListFormat::New(Isolate* isolate, Handle<Map> map,
-   icu::Locale icu_locale = r.icu_locale;
-   UErrorCode status = U_ZERO_ERROR;
-   icu::ListFormatter* formatter = icu::ListFormatter::createInstance(
-+#if U_ICU_VERSION_MAJOR_NUM < 68
-       icu_locale, GetIcuStyleString(style_enum, type_enum), status);
-+#else
-+      icu_locale, GetIcuType(type_enum), GetIcuWidth(style_enum), status);
-+#endif
-   if (U_FAILURE(status)) {
-     delete formatter;
-     FATAL("Failed to create ICU list formatter, are ICU data files missing?");
--- 
-2.25.1
-
diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index d94942e7c0..7d11a8d104 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,5 +1,5 @@
-# From https://nodejs.org/dist/v12.22.3/SHASUMS256.txt
-sha256  350211fae3a688f41889680c8efcf689353a2e36b62b9dc2b408340986857190  node-v12.22.3.tar.xz
+# From https://nodejs.org/dist/v12.22.4/SHASUMS256.txt
+sha256  44cd4eab131e5282fc923e9e720d983a0b44c12e4aa4f6c3598dc97ae1e4cd4c  node-v12.22.4.tar.xz
 
 # Hash for license file
 sha256  221417a7ca275112a5ac54639b36ee3c5184e74631ea1e1b01b701293b655190  LICENSE
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 2731a7c667..08d2f6d7c1 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NODEJS_VERSION = 12.22.3
+NODEJS_VERSION = 12.22.4
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = host-python host-nodejs c-ares \
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
