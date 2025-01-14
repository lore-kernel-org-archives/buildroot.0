Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E997C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:58:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B984D84F8A;
	Fri, 28 Feb 2025 16:58:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nGYXx7odOw5M; Fri, 28 Feb 2025 16:58:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B163C84807
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B163C84807;
	Fri, 28 Feb 2025 16:58:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D03568
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:38:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 68A1A491FC
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pmP2QVnztqSm for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8326142DF3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8326142DF3
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7528B7FCEA; Fri, 28 Feb 2025 16:30:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 14 Jan 2025 23:31:10 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 012f03bd271db27d9478dc0c3f161d3e80e0ef0b
X-Git-Newrev: 2528672d3978c00559bf9c2b6ab64c5e53d78359
X-Patchwork-Hint: ignore
Message-Id: <20250228163010.7528B7FCEA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/cross-ldd: new package
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2528672d3978c00559bf9c2b6ab64c5e53d78359
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This commit introduces a new cross-ldd package which installs the
cross ldd implementation that comes from Crosstool-NG, and which can
be used like ldd, but when cross-compiling. We intend to use it as a
replacement of host-prelink-cross for our dracut package.

The cross-ldd from Crosstool-NG is in fact even recommended by the
Dracut documentation, in its docs/README.cross document:

   To support cross-compiled binaries, a different ldd variant is needed that
   works on those binaries. One such ldd script is found at
   https://gist.github.com/jerome-pouiller/c403786c1394f53f44a3b61214489e6f

This Github Gist in fact contains the xldd.in code from Crosstool-NG.

Our package downloads the full tarball of Crosstool-NG. We tried to
download only the script and the license file, but we couldn't figure
out a way of downloading them *and* have the version in the filename
to make sure that when doing an upgrade to a newer version, we
wouldn't have a clash between old/new files having the same name (and
causing conflicts with the hash verification). So in the end, we opted
for download the whole tarball.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 DEVELOPERS                       |  1 +
 package/cross-ldd/cross-ldd.hash |  4 ++++
 package/cross-ldd/cross-ldd.mk   | 37 +++++++++++++++++++++++++++++++++++++
 3 files changed, 42 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 47644c8d5c..9cc27025f8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3145,6 +3145,7 @@ F:	package/cifs-utils/
 F:	package/cloop/
 F:	package/cmake/
 F:	package/cramfs/
+F:	package/cross-ldd/
 F:	package/dmidecode/
 F:	package/double-conversion/
 F:	package/flashrom/
diff --git a/package/cross-ldd/cross-ldd.hash b/package/cross-ldd/cross-ldd.hash
new file mode 100644
index 0000000000..b179aec5e0
--- /dev/null
+++ b/package/cross-ldd/cross-ldd.hash
@@ -0,0 +1,4 @@
+# From http://crosstool-ng.org/download/crosstool-ng/crosstool-ng-1.26.0.tar.xz.sha512
+sha512  7834184ae5792fd347455f9f48fee826248dcb82d271954ed4304b1a18f63995ff8a2c3b817564dcf147ac7e16e02d779195b26d97eb57db27f1118a1837002a  crosstool-ng-1.26.0.tar.xz
+# Locally calculated
+sha256  07bc0ccd386469c748c4cf6c8faca5667fbf8c4400386714287fa233acfd68ba  COPYING
diff --git a/package/cross-ldd/cross-ldd.mk b/package/cross-ldd/cross-ldd.mk
new file mode 100644
index 0000000000..357133cdd2
--- /dev/null
+++ b/package/cross-ldd/cross-ldd.mk
@@ -0,0 +1,37 @@
+################################################################################
+#
+# cross-ldd
+#
+################################################################################
+
+CROSS_LDD_VERSION = 1.26.0
+CROSS_LDD_SITE = http://crosstool-ng.org/download/crosstool-ng
+CROSS_LDD_SOURCE = crosstool-ng-$(CROSS_LDD_VERSION).tar.xz
+CROSS_LDD_LICENSE = GPL-2.0
+CROSS_LDD_LICENSE_FILES = COPYING
+
+ifeq ($(BR2_ARCH_IS_64),y)
+CROSS_LDD_BITNESS = 64
+else
+CROSS_LDD_BITNESS = 32
+endif
+
+CROSS_LDD_TOOLS_PREFIX = $(patsubst %-,%,$(TARGET_CROSS))
+
+define HOST_CROSS_LDD_CONFIGURE_CMDS
+	sed \
+		-e "s%@@CT_bash@@%/usr/bin/env bash%" \
+		-e "s%@@CT_VERSION@@%$(CROSS_LDD_VERSION)%" \
+		-e "s%@@CT_BITS@@%$(CROSS_LDD_BITNESS)%" \
+		-e "s%@@CT_sed@@%sed%" \
+		-e "s%@@CT_grep@@%grep%" \
+		-e "s%^prefix=.*%prefix=$(CROSS_LDD_TOOLS_PREFIX)%" \
+		$(@D)/scripts/xldd.in > \
+		$(@D)/scripts/xldd
+endef
+
+define HOST_CROSS_LDD_INSTALL_CMDS
+	$(INSTALL) -m 0755 -D $(@D)/scripts/xldd $(TARGET_CROSS)xldd
+endef
+
+$(eval $(host-generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
