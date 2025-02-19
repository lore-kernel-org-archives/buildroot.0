Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50723C021B0
	for <buildroot@archiver.kernel.org>; Wed, 19 Feb 2025 16:59:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6D9D89384;
	Wed, 19 Feb 2025 16:59:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I-DZZ_a8oczt; Wed, 19 Feb 2025 16:59:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5DF6989381
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5DF6989381;
	Wed, 19 Feb 2025 16:59:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C518127
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 16:06:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F0468903E
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 16:06:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bYv2Oq8wx2ok for <buildroot@buildroot.org>;
 Wed, 19 Feb 2025 16:06:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=frank.vanbever@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E620E8903F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E620E8903F
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E620E8903F
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 16:06:03 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4397dff185fso36040685e9.2
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 08:06:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739981160; x=1740585960;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=C7pVGXKRWO5oqwDUxPkMieAVz3ZqwHmsdnEPp+rRhCg=;
 b=SAjGxXRPJnoRhS7+JsT0VN28GesaRFtU7cd1S077bOh/2sS7CjK1SQvdXBfRaCgq4b
 5PXeChZ5AuKpDj4sNJI2cXvKjCgKcgoZ/sYWn2VmKQls/Zo2bJoDmBtJUZFCDeAP8Fn1
 CUxvkAjik3nVjnhm6qd8mv51k0RPhGcRxzUtUgS0VHxYydYr8ZQrx6F5mGSomD6sFrdP
 4U4hqjTw0nKyBkox0KtV3MWPqd3FJakr53i4k54w8AAPkE6wtUb15PYuge3n4Y3RY2DB
 czMWp40g3fHA+RBPbFwjZGDXGIg7AkHYp/RaZQ6iFzVbLfk2woZ29bDalxblh9NtNpjJ
 F95g==
X-Gm-Message-State: AOJu0YxY5WuvcmxInn+Xs6FHDfjR2pN3Mu0mvNtgM81p1SOAwTdCJkAl
 SLkbXKyWCq+JqXyOqpfvGoiFKBgJYD6m/ddFtqsmbpT/AlsEGKnzRIBuZM6325fqiQosBEe6F0q
 X
X-Gm-Gg: ASbGncsw+Z8DHDCKY5sJHdc5KWrq8Y1WJ4t8y6Rpp1nKZBTjSAnSFfpABS2Qg4hSlEq
 j/XCK0BwiwsCrPaIFP5L2JZ0l0/yQqrwNBorqvQm0JwxDlNaiUZOB73+ZlF0kD2463/Nqz4PRZC
 wZlx29Io3qJ9PDhyyEanPOXUTAQ8/Cz0NwB2B1bPT1Ae0dIpxNTaLEkUYdZgWmrmp7Cv6WKmg/s
 jtThAVCwWCAVrV0H9X2j4M00uxLvAD+b4zIUT8GpUUHAhleHNGjZriUECwf6ljbF5oMUi85cM9a
 93Ls07Wn8LhWEptOxqnL/DVnF2dpVNZNmbghdZrcNzKItF23
X-Google-Smtp-Source: AGHT+IFkBwd7HNKXjt+KuGz//GrMW/whMfsCRUMvQmbWvoH5qBhRscKyBXz8b/pFLaeZI37GcMnmiA==
X-Received: by 2002:a05:600c:1c8f:b0:439:6925:4d42 with SMTP id
 5b1f17b1804b1-43999d72a62mr44803985e9.5.1739981159869; 
 Wed, 19 Feb 2025 08:05:59 -0800 (PST)
Received: from wintermute.. (94.105.104.76.dyn.edpnet.net. [94.105.104.76])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4395a1b8397sm215927785e9.36.2025.02.19.08.05.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 08:05:59 -0800 (PST)
To: buildroot@buildroot.org
Cc: Frank Vanbever <frank.vanbever@mind.be>
Date: Wed, 19 Feb 2025 17:05:43 +0100
Message-ID: <20250219160543.263046-1-frank.vanbever@mind.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1739981160; x=1740585960; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=C7pVGXKRWO5oqwDUxPkMieAVz3ZqwHmsdnEPp+rRhCg=;
 b=g9DjzOl3lBUWWQqZEd4XQt+a7nHfSHuPTeEteosLfQKyDxLENtnwliOcYRGp2y6sKk
 Hb5SHebZkpSWO709YvC1KqDKth0Ko+6eej5XOPLFjw2lAO+CjaXpiRuvLV8Oya2+E61Q
 /ZP6+iax2msYK4pJ0s59NWWHQ7hme8ynx69H2v7KH14KG0l2MIxm6eIxj56qxuLBYEb2
 adFz6z9+MvTH9/uPFzHMo9kgrwLwegjaR0ZNaPZTzy+pAPi6X7LzHdupF3G2lrZAie6m
 G+UT+hJU97vZ7NRHKLWcApeXlwMxVuHXqEjG0zDOFDQD2qMRnuSNMHjHTLxuGw7+DcIH
 +6vg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=g9DjzOl3
Subject: [Buildroot] [PATCH 1/1] package/libmodsecurity: bump to version
 3.0.13
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Frank Vanbever via buildroot <buildroot@buildroot.org>
Reply-To: Frank Vanbever <frank.vanbever@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Drop 0001-configure.ac-drop-usage-of-git-at-configure-time.patch
  The package originally had to be reconfigured to patch in uclinux
  support. The fix has been merged upstream [1]. We no longer need to
  reconfigure the package so we can drop this patch.

[1] https://github.com/owasp-modsecurity/ModSecurity/pull/2235

Signed-off-by: Frank Vanbever <frank.vanbever@mind.be>
---
 ...-drop-usage-of-git-at-configure-time.patch | 80 -------------------
 ...=> 0001-modsecurity.pc.in-add-lstdc.patch} |  0
 package/libmodsecurity/libmodsecurity.hash    |  4 +-
 package/libmodsecurity/libmodsecurity.mk      |  4 +-
 4 files changed, 3 insertions(+), 85 deletions(-)
 delete mode 100644 package/libmodsecurity/0001-configure.ac-drop-usage-of-git-at-configure-time.patch
 rename package/libmodsecurity/{0002-modsecurity.pc.in-add-lstdc.patch => 0001-modsecurity.pc.in-add-lstdc.patch} (100%)

diff --git a/package/libmodsecurity/0001-configure.ac-drop-usage-of-git-at-configure-time.patch b/package/libmodsecurity/0001-configure.ac-drop-usage-of-git-at-configure-time.patch
deleted file mode 100644
index 6853b19ccd..0000000000
--- a/package/libmodsecurity/0001-configure.ac-drop-usage-of-git-at-configure-time.patch
+++ /dev/null
@@ -1,80 +0,0 @@
-From d242b011a8f0d84781bbf7667a44a12646903ca4 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Sun, 1 Aug 2021 23:21:35 +0200
-Subject: [PATCH] configure.ac: drop usage of git at configure time
-
-The usage of git is only to print some messages at configure time,
-which is not very useful, and causes a significant number of warning
-when regenerating the configure script.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Signed-off-by: Frank Vanbever <frank.vanbever@mind.be>
----
- configure.ac | 23 -----------------------
- 1 file changed, 23 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 66d6f4f2..746b1fb4 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -3,7 +3,6 @@
- 
- # Get the hash of the last commit, to be used if it is not an
- # official release.
--AC_DEFUN([MSC_GIT_HASH], m4_esyscmd_s(git log -1 --format="%h" --abbrev-commit))
- AC_DEFUN([MSC_MAJOR], m4_esyscmd_s(cat headers/modsecurity/modsecurity.h | grep "define MODSECURITY_MAJOR " | awk {'print $3'} | sed 's/\"//g'))
- AC_DEFUN([MSC_MINOR], m4_esyscmd_s(cat headers/modsecurity/modsecurity.h | grep "define MODSECURITY_MINOR " | awk {'print $3'} | sed 's/\"//g'))
- AC_DEFUN([MSC_PATCHLEVEL], m4_esyscmd_s(cat headers/modsecurity/modsecurity.h | grep "define MODSECURITY_PATCHLEVEL " | awk {'print $3'} | sed 's/\"//g'))
-@@ -25,9 +24,6 @@ m4_define([msc_version],
- m4_define([msc_version_with_patchlevel],
-     [msc_version_major.msc_version_minor.msc_version_patchlevel])
- 
--m4_define([msc_version_git],
--    [m4_esyscmd_s(git describe)])
--
- m4_define([msc_version_info],
-     [msc_version_c_plus_a:msc_version_patchlevel:msc_version_minor])
- 
-@@ -73,11 +69,6 @@ AC_MSG_ERROR([\
- 
-    ])
- fi
--# Libinjection version
--AC_DEFUN([LIBINJECTION_VERSION], m4_esyscmd_s(cd "others/libinjection" && git describe && cd ../..))
--
--# SecLang test version
--AC_DEFUN([SECLANG_TEST_VERSION], m4_esyscmd_s(cd "test/test-cases/secrules-language-tests" && git log -1 --format="%h" --abbrev-commit && cd ../../..))
- 
- 
- # Check for yajl
-@@ -224,10 +215,6 @@ AC_SUBST([MSC_VERSION_WITH_PATCHLEVEL])
- MSC_VERSION=msc_version
- AC_SUBST([MSC_VERSION])
- 
--MSC_GIT_VERSION=msc_version_git
--AC_SUBST([MSC_GIT_VERSION])
--
--
- AC_ARG_ENABLE(debug-logs,
-     [AS_HELP_STRING([--disable-debug-logs],[Turn off the SecDebugLog feature])],
- 
-@@ -419,16 +406,6 @@ AC_OUTPUT
- 
- 
- # Print a fancy summary
--echo " "
--echo " "
--echo "ModSecurity - ${MSC_GIT_VERSION} for $PLATFORM"
--echo " "
--echo " Mandatory dependencies"
--AS_ECHO_N("   + libInjection                                  ....")
--echo LIBINJECTION_VERSION
--AS_ECHO_N("   + SecLang tests                                 ....")
--echo SECLANG_TEST_VERSION
--
- echo " "
- echo " Optional dependencies"
- 
--- 
-2.39.2
-
diff --git a/package/libmodsecurity/0002-modsecurity.pc.in-add-lstdc.patch b/package/libmodsecurity/0001-modsecurity.pc.in-add-lstdc.patch
similarity index 100%
rename from package/libmodsecurity/0002-modsecurity.pc.in-add-lstdc.patch
rename to package/libmodsecurity/0001-modsecurity.pc.in-add-lstdc.patch
diff --git a/package/libmodsecurity/libmodsecurity.hash b/package/libmodsecurity/libmodsecurity.hash
index dbe43d18e7..704b5541ad 100644
--- a/package/libmodsecurity/libmodsecurity.hash
+++ b/package/libmodsecurity/libmodsecurity.hash
@@ -1,5 +1,5 @@
-# From https://github.com/owasp-modsecurity/ModSecurity/releases/download/v3.0.12/modsecurity-v3.0.12.tar.gz.sha256
-sha256  a36118401641feef376bb469bf468abf94b7948844976a188a6fccb53390b11f  modsecurity-v3.0.12.tar.gz
+# From https://github.com/owasp-modsecurity/ModSecurity/releases/download/v3.0.13/modsecurity-v3.0.13.tar.gz.sha256
+sha256  86b4881164a161b822a49df3501e83b254323206906134bdc34a6f3338f4d3f2  modsecurity-v3.0.13.tar.gz
 
 # Locally calculated
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/libmodsecurity/libmodsecurity.mk b/package/libmodsecurity/libmodsecurity.mk
index d8c10b98b2..f6a74e13d5 100644
--- a/package/libmodsecurity/libmodsecurity.mk
+++ b/package/libmodsecurity/libmodsecurity.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMODSECURITY_VERSION = 3.0.12
+LIBMODSECURITY_VERSION = 3.0.13
 LIBMODSECURITY_SOURCE = modsecurity-v$(LIBMODSECURITY_VERSION).tar.gz
 LIBMODSECURITY_SITE = https://github.com/owasp-modsecurity/ModSecurity/releases/download/v$(LIBMODSECURITY_VERSION)
 LIBMODSECURITY_INSTALL_STAGING = YES
@@ -12,8 +12,6 @@ LIBMODSECURITY_LICENSE = Apache-2.0
 LIBMODSECURITY_LICENSE_FILES = LICENSE
 LIBMODSECURITY_CPE_ID_VENDOR = trustwave
 LIBMODSECURITY_CPE_ID_PRODUCT = modsecurity
-# We're patching configure.ac
-LIBMODSECURITY_AUTORECONF = YES
 
 LIBMODSECURITY_DEPENDENCIES = pcre2
 LIBMODSECURITY_CONF_OPTS = \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
