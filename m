Return-Path: <SRS0=A6xV=PJ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59216C433EF
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 20:59:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6EB3610D0
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 20:59:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D6EB3610D0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9FEE760685;
	Thu, 21 Oct 2021 20:59:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5TxkqrEFn9z6; Thu, 21 Oct 2021 20:59:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0956560669;
	Thu, 21 Oct 2021 20:59:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1807B1BF9C8
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 20:59:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1587260638
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 20:59:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LWE9jbzXGZyS for <buildroot@lists.busybox.net>;
 Thu, 21 Oct 2021 20:58:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4E81A60620
 for <buildroot@buildroot.org>; Thu, 21 Oct 2021 20:58:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id E9966883C1; Thu, 21 Oct 2021 20:55:47 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 21 Oct 2021 22:47:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1665e0a79b617b4e6315ac5989e9ffa66eb0310f
X-Git-Newrev: 41f982f7438728aabb32224fbbc58b54cf0f8abf
X-Patchwork-Hint: ignore
Message-Id: <20211021205547.E9966883C1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nmap: remove ndiff option
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=41f982f7438728aabb32224fbbc58b54cf0f8abf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The ndiff package provided by Nmap relies on python2; moreover, there
have been pending pull requests to move ndiff to python3 for over two
years with very little engagement by the maintainers
(https://github.com/nmap/nmap/pull/1807).

Remove the option to select ndiff altogether, it is replaced by
python-pyndiff, which provides the same functionality (and more) as the
ndiff provided by nmap, and is compatible with python3.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Config.in.legacy       |  9 +++++++++
 package/nmap/Config.in | 12 +-----------
 package/nmap/nmap.mk   |  9 ---------
 3 files changed, 10 insertions(+), 20 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index e443b7685e..23c3ee29ee 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -165,6 +165,15 @@ config BR2_PACKAGE_CANFESTIVAL
 	  This package has been removed as it is unmaintained since
 	  November 2017.
 
+config BR2_PACKAGE_NMAP_NDIFF
+	bool "The ndiff utility has been removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_PYTHON_PYNDIFF
+	help
+	  The ndiff utility provided by nmap requires python2 which is
+	  deprecated. The same functionality is provided by the python
+	  package pyndiff.
+
 config BR2_GDB_VERSION_8_3
 	bool "gdb version 8.3.x removed"
 	select BR2_LEGACY
diff --git a/package/nmap/Config.in b/package/nmap/Config.in
index 51dd3423ea..fc6312d0fc 100644
--- a/package/nmap/Config.in
+++ b/package/nmap/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_NMAP
 	select BR2_PACKAGE_LIBLINEAR
 	select BR2_PACKAGE_LIBPCAP
 	select BR2_PACKAGE_NMAP_NMAP \
-	       if !BR2_PACKAGE_NMAP_NCAT && !BR2_PACKAGE_NMAP_NPING && !BR2_PACKAGE_NMAP_NDIFF
+	       if !BR2_PACKAGE_NMAP_NCAT && !BR2_PACKAGE_NMAP_NPING
 	help
 	  Nmap ("Network Mapper") is a free and open source (license)
 	  utility for network discovery and security auditing.
@@ -32,16 +32,6 @@ comment "a symlink from ncat to 'nc' will be installed"
 	depends on !BR2_PACKAGE_NETCAT
 	depends on !BR2_PACKAGE_NETCAT_OPENBSD
 
-config BR2_PACKAGE_NMAP_NDIFF
-	bool "install ndiff"
-	# ndiff only works with python2.x
-	depends on BR2_PACKAGE_PYTHON
-	help
-	  This option installs the 'ndiff' tool.
-
-comment "ndiff needs Python 2.x"
-	depends on !BR2_PACKAGE_PYTHON
-
 config BR2_PACKAGE_NMAP_NMAP
 	bool "install nmap"
 	select BR2_PACKAGE_PCRE
diff --git a/package/nmap/nmap.mk b/package/nmap/nmap.mk
index f3994e9b38..f22a2295b1 100644
--- a/package/nmap/nmap.mk
+++ b/package/nmap/nmap.mk
@@ -61,15 +61,6 @@ else
 NMAP_CONF_OPTS += --without-ncat
 endif
 
-ifeq ($(BR2_PACKAGE_NMAP_NDIFF),y)
-NMAP_DEPENDENCIES += python
-NMAP_CONF_OPTS += --with-ndiff
-NMAP_MAKE_OPTS += build-ndiff
-NMAP_INSTALL_TARGET_OPTS += install-ndiff
-else
-NMAP_CONF_OPTS += --without-ndiff
-endif
-
 ifeq ($(BR2_PACKAGE_NMAP_NMAP),y)
 NMAP_DEPENDENCIES += pcre
 NMAP_CONF_OPTS += --with-libpcre="$(STAGING_DIR)/usr"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
