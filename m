Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B516ED1BDDB
	for <buildroot@archiver.kernel.org>; Mon,  4 Nov 2024 18:30:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50964606E7;
	Mon,  4 Nov 2024 18:30:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jJ6SzX80oFMX; Mon,  4 Nov 2024 18:30:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3682E60704
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3682E60704;
	Mon,  4 Nov 2024 18:30:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B6FD53B
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 18:30:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 97C34403DA
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 18:30:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CaSsdkH43gqA for <buildroot@buildroot.org>;
 Mon,  4 Nov 2024 18:30:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 59D10403DB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 59D10403DB
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 18:30:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4C3E983CE5; Mon,  4 Nov 2024 18:30:35 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 4 Nov 2024 19:25:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d74a5a218fabee928abb347086648ad142f7d5a5
X-Git-Newrev: efe93b34ec678c0d35b2ec062128fccf55912b8e
X-Patchwork-Hint: ignore
Message-Id: <20241104183035.4C3E983CE5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/opkg: bump to version 0.7.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=efe93b34ec678c0d35b2ec062128fccf55912b8e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For the change log since 0.6.2, see:
https://git.yoctoproject.org/opkg/tree/CHANGELOG.md?h=v0.7.0#n8

Since the toolchain-external-bootlin version bump to 2024.05-1 the
TestOpkg fail due to a "spurious error check" fixed in opkg 0.7.0 [1].

With toolchain-external-bootlin 2024.02-1 (gcc-12) and opkg 0.6.2:

  opkg install example-snmpd-package_1.0_arm.ipk
  Installing example-snmpd-package (1.0) on root.
  Configuring example-snmpd-package.
  Starting SNMP daemon: OK
  echo $?
  0

With toolchain-external-bootlin 2024.05-1 (gcc-13) and opkg 0.6.2:

  opkg install example-snmpd-package_1.0_arm.ipk
  echo $?
  255

The new gcc-13 seems to be confused while compiling opkg 0.6.2
without the "spurious error check" fix [1]

With toolchain-external-bootlin 2024.05-1 (gcc-13) and opkg 0.7.0:

  opkg install example-snmpd-package_1.0_arm.ipk
  Installing example-snmpd-package (1.0) on root.
  Configuring example-snmpd-package.
  Starting SNMP daemon: OK
  echo $?
  0

Keep new ACL and XATTRS support introduced in opkg 0.6.3 disabled.

Update opkg to the new upstream url [2].

[1] https://git.yoctoproject.org/opkg/commit?id=b5cc53d56e381803d3f55019254ab7d608160ae1
[2] https://github.com/openembedded/openembedded-core/commit/6ff8b43e08840582ee8d88261cbaffd33c2304f9

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992571

Signed-off-by: Romain Naour <romain.naour@smile.fr>
[Julien: add link to change log, reindent OPKG_CONF_OPTS]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/opkg/Config.in | 2 +-
 package/opkg/opkg.hash | 2 +-
 package/opkg/opkg.mk   | 7 +++++--
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/opkg/Config.in b/package/opkg/Config.in
index 1f6a39343f..ccea63cf7f 100644
--- a/package/opkg/Config.in
+++ b/package/opkg/Config.in
@@ -17,7 +17,7 @@ config BR2_PACKAGE_OPKG
 	  conforms to a subset of debian's policy manual regarding
 	  control files.
 
-	  https://code.google.com/archive/p/opkg/
+	  https://git.yoctoproject.org/opkg/
 
 if BR2_PACKAGE_OPKG
 
diff --git a/package/opkg/opkg.hash b/package/opkg/opkg.hash
index c6ecefba21..3928a2ce01 100644
--- a/package/opkg/opkg.hash
+++ b/package/opkg/opkg.hash
@@ -1,4 +1,4 @@
 # From http://downloads.yoctoproject.org/releases/opkg/SHA256SUMS
-sha256  ac73a90a2549cd04948e563d915912c78e1b8ba0f43af75c5a53fcca474adbd5  opkg-0.6.2.tar.gz
+sha256  d973fd0f1568f58f87d6aecd9aa95e3e1f60214a45cee26704bf8fe757c54567  opkg-0.7.0.tar.gz
 # Locally calculated
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/opkg/opkg.mk b/package/opkg/opkg.mk
index a550543f3e..0323a49f0b 100644
--- a/package/opkg/opkg.mk
+++ b/package/opkg/opkg.mk
@@ -4,13 +4,16 @@
 #
 ################################################################################
 
-OPKG_VERSION = 0.6.2
+OPKG_VERSION = 0.7.0
 OPKG_SITE = https://downloads.yoctoproject.org/releases/opkg
 OPKG_DEPENDENCIES = host-pkgconf libarchive
 OPKG_LICENSE = GPL-2.0+
 OPKG_LICENSE_FILES = COPYING
 OPKG_INSTALL_STAGING = YES
-OPKG_CONF_OPTS = --enable-sha256
+OPKG_CONF_OPTS = \
+	--enable-sha256 \
+	--without-acl \
+	--without-xattrs
 
 ifeq ($(BR2_PACKAGE_OPKG_GPG_SIGN),y)
 OPKG_CONF_OPTS += --enable-gpg
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
