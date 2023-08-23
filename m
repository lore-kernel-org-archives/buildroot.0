Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27952EE49A0
	for <buildroot@archiver.kernel.org>; Wed, 23 Aug 2023 14:53:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7BA94820EE;
	Wed, 23 Aug 2023 14:53:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7BA94820EE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tlsjMervUQys; Wed, 23 Aug 2023 14:53:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C23280B25;
	Wed, 23 Aug 2023 14:53:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C23280B25
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ED9051BF593
 for <buildroot@lists.busybox.net>; Wed, 23 Aug 2023 14:53:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CD9974043A
 for <buildroot@lists.busybox.net>; Wed, 23 Aug 2023 14:53:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD9974043A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v7w8MdSsg6uZ for <buildroot@lists.busybox.net>;
 Wed, 23 Aug 2023 14:53:22 +0000 (UTC)
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6AF9E4033D
 for <buildroot@buildroot.org>; Wed, 23 Aug 2023 14:53:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6AF9E4033D
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5280ef23593so7026933a12.3
 for <buildroot@buildroot.org>; Wed, 23 Aug 2023 07:53:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692802399; x=1693407199;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pmniCe90sYT4+tTOfrVjJvncwI2USpLewjvDOrz9Vko=;
 b=NerjMDoEe99f9MCncgwmeCkcUkBl8AtCapoBtmK6E+g48MN94BObEcVGMQ4zt1T8N3
 L3dOXwSvbAGSYZnREEvE7CFoOwjEAomZRDFcms1+grS9W2jf0VtKyzQQ2l3bUMdapJE+
 owHM+UZtGeI628UJfJQ10AykTDjdE9Cbz1Rgrc2ioBy1BZjuLU/+CSTsS3PojY/CHXIa
 yLZpYg7uxYS/A+JrI0N1yRhEKA2drSvmljkag9SVjlwr0ugTXlCnLIQvdIH6VznM42ke
 ZfcntM/a6yvxiaPEa/qXAYmd5hweTfHDttP/k4vqfTfsS3HZFnkarxD9brUfBVdOUlqn
 K4ZA==
X-Gm-Message-State: AOJu0YzsAmFec62xH6OyB75DxO0goTnUmyKUooEN3peWvt4eTJmU8Zdr
 LLHu9KbGGGxK7yk2VZ99F17rDb6Aa8igBmENo1eOZA==
X-Google-Smtp-Source: AGHT+IEMmPArGVIsjdN+8FpPYIrmUB/mmur955/ukTHJntQMzm4tTQObb7xlPNUeJ718yB08JuHa8A==
X-Received: by 2002:a17:907:b16:b0:9a1:fc1e:19ac with SMTP id
 h22-20020a1709070b1600b009a1fc1e19acmr26043ejl.33.1692802399059; 
 Wed, 23 Aug 2023 07:53:19 -0700 (PDT)
Received: from wintermute.. (94.105.107.31.dyn.edpnet.net. [94.105.107.31])
 by smtp.gmail.com with ESMTPSA id
 p5-20020a17090635c500b00988be3c1d87sm9740040ejb.116.2023.08.23.07.53.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Aug 2023 07:53:18 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 23 Aug 2023 16:53:00 +0200
Message-Id: <20230823145300.1499071-1-frank.vanbever@mind.be>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1692802399; x=1693407199;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pmniCe90sYT4+tTOfrVjJvncwI2USpLewjvDOrz9Vko=;
 b=WBLufTwaB9Iaa8eP04u01tzpTafSpNjDAzPLgE9GJg2zdQ6mpfTuyJE/7k3PHiH1MC
 GKMLhfXhtB4woulPS1uVkYrn6iiWOt4cUJ/CyCSYCdJIy6wkKZm5z073UEAkggHBhILp
 RsBQXWkCnR3p/pmrwRiBvgL5RWrF1xblscE3Xb0tTbAxVEen8mASDASqCymATfgY8yCa
 3plPTLrt2uj7bOy2JQyWYrl2/TI/gEDWwe3BXMPy3/CVWxwDEgeUDLS+RzdwzVARNJw7
 YdaTEZtgPRup0SiAyEUNOEy0Jcj85IBvdbprngHtm+20MQdZYABU9ftlPXjkmcU/qYyl
 Y4ug==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=WBLufTwa
Subject: [Buildroot] [PATCH 1/1] package/libmodsecurity: security bump to
 version 3.0.10
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: Frank Vanbever <frank.vanbever@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Fixes CVE-2023-38285 [1]
- Adapted 0001-configure.ac-drop-usage-of-git-at-configure-time.patch due to
  upstream moving to autoconf portable shell constructs.
- Added missing Upstream comments

Signed-off-by: Frank Vanbever <frank.vanbever@mind.be>

[1] https://www.trustwave.com/en-us/resources/blogs/spiderlabs-blog/modsecurity-v3-dos-vulnerability-in-four-transformations-cve-2023-38285/

Signed-off-by: Frank Vanbever <frank.vanbever@mind.be>
---
 .checkpackageignore                           |  2 --
 ...-drop-usage-of-git-at-configure-time.patch | 19 +++++++++++--------
 .../0002-modsecurity.pc.in-add-lstdc.patch    |  7 +++++--
 package/libmodsecurity/libmodsecurity.hash    |  4 ++--
 package/libmodsecurity/libmodsecurity.mk      |  2 +-
 5 files changed, 19 insertions(+), 15 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index e5c06b1e0a..4903088d46 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -729,8 +729,6 @@ package/libmad/0001-mips-h-constraint-removal.patch Sob Upstream
 package/libmad/0002-configure-ac-automake-foreign.patch Upstream
 package/libmanette/0001-Meson-Un-hardcode-building-a-shared-library.patch Upstream
 package/libmng/0001-jpeg-9a.patch Upstream
-package/libmodsecurity/0001-configure.ac-drop-usage-of-git-at-configure-time.patch Upstream
-package/libmodsecurity/0002-modsecurity.pc.in-add-lstdc.patch Upstream
 package/libmpd/0001-Fix-build-on-archlinux-missing-include.patch Upstream
 package/libmpeg2/0001-altivec.patch Upstream
 package/libmpeg2/0002-armv4l.patch Upstream
diff --git a/package/libmodsecurity/0001-configure.ac-drop-usage-of-git-at-configure-time.patch b/package/libmodsecurity/0001-configure.ac-drop-usage-of-git-at-configure-time.patch
index 14767fb28e..d3be6cb36e 100644
--- a/package/libmodsecurity/0001-configure.ac-drop-usage-of-git-at-configure-time.patch
+++ b/package/libmodsecurity/0001-configure.ac-drop-usage-of-git-at-configure-time.patch
@@ -1,4 +1,4 @@
-From a2116312068b6b2c5732dfebde19b751cc81d4f3 Mon Sep 17 00:00:00 2001
+From d242b011a8f0d84781bbf7667a44a12646903ca4 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 Date: Sun, 1 Aug 2021 23:21:35 +0200
 Subject: [PATCH] configure.ac: drop usage of git at configure time
@@ -7,13 +7,16 @@ The usage of git is only to print some messages at configure time,
 which is not very useful, and causes a significant number of warning
 when regenerating the configure script.
 
+Upstream: N/A
+
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Signed-off-by: Frank Vanbever <frank.vanbever@mind.be>
 ---
  configure.ac | 23 -----------------------
  1 file changed, 23 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 20163e1e..14e5892a 100644
+index 66d6f4f2..746b1fb4 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -3,7 +3,6 @@
@@ -46,7 +49,7 @@ index 20163e1e..14e5892a 100644
  
  
  # Check for yajl
-@@ -217,10 +208,6 @@ AC_SUBST([MSC_VERSION_WITH_PATCHLEVEL])
+@@ -224,10 +215,6 @@ AC_SUBST([MSC_VERSION_WITH_PATCHLEVEL])
  MSC_VERSION=msc_version
  AC_SUBST([MSC_VERSION])
  
@@ -55,9 +58,9 @@ index 20163e1e..14e5892a 100644
 -
 -
  AC_ARG_ENABLE(debug-logs,
-     [AC_HELP_STRING([--disable-debug-logs],[Turn off the SecDebugLog feature])],
+     [AS_HELP_STRING([--disable-debug-logs],[Turn off the SecDebugLog feature])],
  
-@@ -412,16 +399,6 @@ AC_OUTPUT
+@@ -419,16 +406,6 @@ AC_OUTPUT
  
  
  # Print a fancy summary
@@ -66,14 +69,14 @@ index 20163e1e..14e5892a 100644
 -echo "ModSecurity - ${MSC_GIT_VERSION} for $PLATFORM"
 -echo " "
 -echo " Mandatory dependencies"
--echo -n "   + libInjection                                  ...."
+-AS_ECHO_N("   + libInjection                                  ....")
 -echo LIBINJECTION_VERSION
--echo -n "   + SecLang tests                                 ...."
+-AS_ECHO_N("   + SecLang tests                                 ....")
 -echo SECLANG_TEST_VERSION
 -
  echo " "
  echo " Optional dependencies"
  
 -- 
-2.31.1
+2.39.2
 
diff --git a/package/libmodsecurity/0002-modsecurity.pc.in-add-lstdc.patch b/package/libmodsecurity/0002-modsecurity.pc.in-add-lstdc.patch
index 6511e6f1e0..723df338d6 100644
--- a/package/libmodsecurity/0002-modsecurity.pc.in-add-lstdc.patch
+++ b/package/libmodsecurity/0002-modsecurity.pc.in-add-lstdc.patch
@@ -1,4 +1,4 @@
-From 1a84881b280eb08852d5495c57e44351a40d3f91 Mon Sep 17 00:00:00 2001
+From 4129643d657b5d0cce83f9ec4ca27289fd69ec43 Mon Sep 17 00:00:00 2001
 From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Date: Mon, 26 Jul 2021 00:24:57 +0200
 Subject: [PATCH] modsecurity.pc.in: add -lstdc++
@@ -12,7 +12,10 @@ transaction.cc:(.text+0x40): undefined reference to `std::__cxx11::basic_string<
 Fixes:
  - http://autobuild.buildroot.org/results/e5a9eb8448980f1c5cafe97180b7d1f48ddf02ca
 
+Upstream: N/A
+
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Signed-off-by: Frank Vanbever <frank.vanbever@mind.be>
 ---
  modsecurity.pc.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
@@ -28,5 +31,5 @@ index 96cdf5ca..7c895ddc 100644
 -Libs.private: @CURL_LDADD@ @GEOIP_LDADD@ @MAXMIND_LDADD@ @GLOBAL_LDADD@ @LIBXML2_LDADD@ @LMDB_LDADD@ @LUA_LDADD@ @PCRE_LDADD@ @SSDEEP_LDADD@ @YAJL_LDADD@
 +Libs.private: @CURL_LDADD@ @GEOIP_LDADD@ @MAXMIND_LDADD@ @GLOBAL_LDADD@ @LIBXML2_LDADD@ @LMDB_LDADD@ @LUA_LDADD@ @PCRE_LDADD@ @SSDEEP_LDADD@ @YAJL_LDADD@ -lstdc++
 -- 
-2.30.2
+2.39.2
 
diff --git a/package/libmodsecurity/libmodsecurity.hash b/package/libmodsecurity/libmodsecurity.hash
index c79ae1cf45..7bcf99e167 100644
--- a/package/libmodsecurity/libmodsecurity.hash
+++ b/package/libmodsecurity/libmodsecurity.hash
@@ -1,4 +1,4 @@
-# From https://github.com/SpiderLabs/ModSecurity/releases/download/v3.0.9/modsecurity-v3.0.9.tar.gz.sha256
-sha256  a5111ecd23e332a1d7c9652dbdb18517a96b21573315cb887a8e86761b95d3d8  modsecurity-v3.0.9.tar.gz
+# From https://github.com/SpiderLabs/ModSecurity/releases/download/v3.0.10/modsecurity-v3.0.10.tar.gz.sha256
+sha256  d5d459f7c2e57a69a405f3222d8e285de419a594b0ea8829058709962227ead0  modsecurity-v3.0.10.tar.gz
 # Localy calculated
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/libmodsecurity/libmodsecurity.mk b/package/libmodsecurity/libmodsecurity.mk
index 335f3a41e5..257f0a56df 100644
--- a/package/libmodsecurity/libmodsecurity.mk
+++ b/package/libmodsecurity/libmodsecurity.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMODSECURITY_VERSION = 3.0.9
+LIBMODSECURITY_VERSION = 3.0.10
 LIBMODSECURITY_SOURCE = modsecurity-v$(LIBMODSECURITY_VERSION).tar.gz
 LIBMODSECURITY_SITE = https://github.com/SpiderLabs/ModSecurity/releases/download/v$(LIBMODSECURITY_VERSION)
 LIBMODSECURITY_INSTALL_STAGING = YES
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
