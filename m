Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60433C433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 20:19:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 228CC60F55
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 20:19:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 228CC60F55
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB5AF425CE;
	Sat,  4 Sep 2021 20:19:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l-8NGUSccXfi; Sat,  4 Sep 2021 20:19:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 014F2425A8;
	Sat,  4 Sep 2021 20:19:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 22B6C1BF962
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 20:17:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1F44060658
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 20:17:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T8m3COMmYUfw for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 20:17:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 37D0F606C7
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 20:17:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C84CA8842F; Sat,  4 Sep 2021 20:16:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 4 Sep 2021 22:08:52 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 527018a3f10e7364ac1b66b87caa24b263931d8f
X-Git-Newrev: 58c73ff9e2aac31cddb2558339af046bfbed6bf2
X-Patchwork-Hint: ignore
Message-Id: <20210904201606.C84CA8842F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/xenomai: fix
 build on arc and riscv32
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5742872554721409636=="
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

--===============5742872554721409636==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=58c73ff9e2aac31cddb2558339af046bfbed6bf2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Fix the following build failures on arc and riscv32:

latency.c: In function 'display':
latency.c:326:21: error: format '%ld' expects argument of type 'long int', but argument 2 has type 'time_t' {aka 'long long int'} [-Werror=format=]
  326 |         ("RTT|  %.2ld:%.2ld:%.2ld  (%s, %Ld us period, "
      |                 ~~~~^
      |                     |
      |                     long int
      |                 %.2lld
  327 |          "priority %d)\n", dt / 3600,
      |                            ~~~~~~~~~
      |                               |
      |                               time_t {aka long long int}

altency.c: In function ‘display’:
altency.c:262:21: error: format ‘%ld’ expects argument of type ‘long int’, but argument 2 has type ‘time_t’ {aka ‘long long int’} [-Werror=format=]
  262 |         ("RTT|  %.2ld:%.2ld:%.2ld  (%s, %Ld us period, "
      |                 ~~~~^
      |                     |
      |                     long int
      |                 %.2lld
  263 |          "priority %d)\n", dt / 3600,
      |                            ~~~~~~~~~
      |                               |
      |                               time_t {aka long long int}

Fixes:
 - http://autobuild.buildroot.org/results/448efe22e8fe058a1b354a3c124874e30b9ce138

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 74196b7d059684e555a87e5409c21c56c727066b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0002-Add-disable-demo-testsuite-options.patch  | 94 ++++++++++++++++++++++
 package/xenomai/xenomai.mk                         |  7 +-
 2 files changed, 100 insertions(+), 1 deletion(-)

diff --git a/package/xenomai/3.0.10/0002-Add-disable-demo-testsuite-options.patch b/package/xenomai/3.0.10/0002-Add-disable-demo-testsuite-options.patch
new file mode 100644
index 0000000000..0a817503b6
--- /dev/null
+++ b/package/xenomai/3.0.10/0002-Add-disable-demo-testsuite-options.patch
@@ -0,0 +1,94 @@
+From 702697cafcec735e55f075594a2990204c8ea17d Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 10 Aug 2021 18:01:48 +0200
+Subject: [PATCH] Add --disable-{demo,testsuite} options
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Allow the user to disable demo and testsuite to avoid the following
+build failures on arc and riscv32:
+
+latency.c: In function 'display':
+latency.c:326:21: error: format '%ld' expects argument of type 'long int', but argument 2 has type 'time_t' {aka 'long long int'} [-Werror=format=]
+  326 |         ("RTT|  %.2ld:%.2ld:%.2ld  (%s, %Ld us period, "
+      |                 ~~~~^
+      |                     |
+      |                     long int
+      |                 %.2lld
+  327 |          "priority %d)\n", dt / 3600,
+      |                            ~~~~~~~~~
+      |                               |
+      |                               time_t {aka long long int}
+
+altency.c: In function ‘display’:
+altency.c:262:21: error: format ‘%ld’ expects argument of type ‘long int’, but argument 2 has type ‘time_t’ {aka ‘long long int’} [-Werror=format=]
+  262 |         ("RTT|  %.2ld:%.2ld:%.2ld  (%s, %Ld us period, "
+      |                 ~~~~^
+      |                     |
+      |                     long int
+      |                 %.2lld
+  263 |          "priority %d)\n", dt / 3600,
+      |                            ~~~~~~~~~
+      |                               |
+      |                               time_t {aka long long int}
+
+Fixes:
+ - http://autobuild.buildroot.org/results/448efe22e8fe058a1b354a3c124874e30b9ce138
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ Makefile.am  | 12 ++++++++++--
+ configure.ac | 12 ++++++++++++
+ 2 files changed, 22 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 891e53f66..604644277 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -6,9 +6,17 @@ SUBDIRS = 		\
+ 	config		\
+ 	include		\
+ 	scripts		\
+-	testsuite	\
+-	utils		\
++	utils
++
++if XENO_ENABLE_DEMO
++SUBDIRS += 		\
+ 	demo
++endif
++
++if XENO_ENABLE_TESTSUITE
++SUBDIRS += 		\
++	testsuite
++endif
+ 
+ EXTRA_DIST = kernel debian
+ 
+diff --git a/configure.ac b/configure.ac
+index bd5fd5ba9..29dfd16e5 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -200,6 +200,18 @@ test \! x$debug_mode = x && AC_DEFINE(CONFIG_XENO_DEBUG,1,[config])
+ AM_CONDITIONAL(XENO_DEBUG_FULL,[test x$debug_mode = xfull])
+ test x$debug_mode = xfull && AC_DEFINE(CONFIG_XENO_DEBUG_FULL,1,[config])
+ 
++dnl Demo (default: on)
++
++AC_ARG_ENABLE(demo,
++	AS_HELP_STRING([--disable-demo], [Disable demo]))
++AM_CONDITIONAL(XENO_ENABLE_DEMO,[test x$enable_demo != xno])
++
++dnl Testsuite (default: on)
++
++AC_ARG_ENABLE(testsuite,
++	AS_HELP_STRING([--disable-testsuite], [Disable testsuite]))
++AM_CONDITIONAL(XENO_ENABLE_TESTSUITE,[test x$enable_testsuite != xno])
++
+ dnl Low resolution clock (default: off)
+ 
+ unset lores_clock
+-- 
+2.30.2
+
diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
index 7e3b130085..c1ad0c5df6 100644
--- a/package/xenomai/xenomai.mk
+++ b/package/xenomai/xenomai.mk
@@ -16,6 +16,8 @@ else
 XENOMAI_SOURCE = xenomai-$(XENOMAI_VERSION).tar.bz2
 XENOMAI_SITE = http://xenomai.org/downloads/xenomai/stable
 endif
+# We're patching configure.ac
+XENOMAI_AUTORECONF = YES
 
 # Exclude all from the hash check, but the latest version.
 ifeq ($(BR2_PACKAGE_XENOMAI)$(BR2_PACKAGE_XENOMAI_LATEST_VERSION),y)
@@ -37,7 +39,10 @@ XENOMAI_INSTALL_STAGING = YES
 XENOMAI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) install-user
 XENOMAI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) install-user
 
-XENOMAI_CONF_OPTS += --includedir=/usr/include/xenomai/
+XENOMAI_CONF_OPTS += \
+	--disable-demo \
+	--disable-testsuite \
+	--includedir=/usr/include/xenomai/
 
 ifeq ($(BR2_PACKAGE_XENOMAI_MERCURY),y)
 XENOMAI_CONF_OPTS += --with-core=mercury

--===============5742872554721409636==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5742872554721409636==--
