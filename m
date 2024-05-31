Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4B48C27C4F
	for <buildroot@archiver.kernel.org>; Thu, 13 Jun 2024 10:05:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8372D61036;
	Thu, 13 Jun 2024 10:05:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E3KFMV5VYr1u; Thu, 13 Jun 2024 10:05:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C0A666103C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C0A666103C;
	Thu, 13 Jun 2024 10:05:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 122611BF354
 for <buildroot@lists.busybox.net>; Thu, 13 Jun 2024 10:05:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4C7AC60ECF
 for <buildroot@lists.busybox.net>; Thu, 13 Jun 2024 10:05:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1PhCQ-9fN2yD for <buildroot@lists.busybox.net>;
 Thu, 13 Jun 2024 10:04:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5A5160EB9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D5A5160EB9
 for <buildroot@buildroot.org>; Thu, 13 Jun 2024 10:04:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D24F287F30; Thu, 13 Jun 2024 10:04:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 31 May 2024 19:34:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e7f25b2b40e2beeac2f7fbe70fbb91cc892ed1ae
X-Git-Newrev: 86b39fbe7ddfe716cfb67b624bf61e4e9ca1def1
X-Patchwork-Hint: ignore
Message-Id: <20240613100458.D24F287F30@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dhcpdump: bump to version 1.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=86b39fbe7ddfe716cfb67b624bf61e4e9ca1def1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Switch to an active fork (which is already used by Fedora 39)
- Drop patch (not needed since
  https://github.com/bbonev/dhcpdump/commit/be272278c3c3fd7fe0d30203d9047fff6b83fa44)
- HAVE_STRSEP has been dropped since
  https://github.com/bbonev/dhcpdump/commit/0f7c525da62e7ae928782b2beae9c5313fb972f8
- CFLAGS and LDFLAGS must be set since
  https://github.com/bbonev/dhcpdump/commit/6eac74e7efb88bcce9423b3a452dcaa1d48850f0
- This bump will fix the following build failure with gcc 14 thanks to
  https://github.com/bbonev/dhcpdump/commit/be272278c3c3fd7fe0d30203d9047fff6b83fa44:

dhcpdump.c: In function 'pcap_callback':
dhcpdump.c:153:17: error: implicit declaration of function 'strftime' [-Wimplicit-function-declaration]
  153 |                 strftime(timestamp, sizeof(timestamp), "%Y-%m-%d %H:%M:%S.",
      |                 ^~~~~~~~
dhcpdump.c:28:1: note: include '<time.h>' or provide a declaration of 'strftime'
   27 | #include "dhcp_options.h"
  +++ |+#include <time.h>
   28 |

https://github.com/bbonev/dhcpdump/releases/tag/v1.9

Fixes:
 - http://autobuild.buildroot.org/results/9e559d634ac4e06f74f7b9e0402e45209aef2952

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                                |  1 -
 package/dhcpdump/0001-use-non-bsd-structures.patch | 23 ----------------------
 package/dhcpdump/Config.in                         |  2 +-
 package/dhcpdump/dhcpdump.hash                     |  2 +-
 package/dhcpdump/dhcpdump.mk                       | 13 ++++++------
 5 files changed, 8 insertions(+), 33 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 8f5fc0a476..543b6f33cf 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -533,7 +533,6 @@ package/dhcp/S80dhcp-relay Shellcheck lib_sysv.Variables
 package/dhcp/S80dhcp-server Shellcheck lib_sysv.Variables
 package/dhcp/dhclient-script Shellcheck lib_shellscript.TrailingSpace
 package/dhcpcd/S41dhcpcd lib_sysv.Indent lib_sysv.Variables
-package/dhcpdump/0001-use-non-bsd-structures.patch lib_patch.Upstream
 package/dhrystone/0001-cmdline-nruns.patch lib_patch.Sob lib_patch.Upstream
 package/dhrystone/0002-HZ.patch lib_patch.Sob lib_patch.Upstream
 package/dhrystone/0003-exit.patch lib_patch.Sob lib_patch.Upstream
diff --git a/package/dhcpdump/0001-use-non-bsd-structures.patch b/package/dhcpdump/0001-use-non-bsd-structures.patch
deleted file mode 100644
index 40115fb640..0000000000
--- a/package/dhcpdump/0001-use-non-bsd-structures.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-The udphdr structure has uh_* fields when _FAVOR_BSD is
-defined. Otherwise, the fields are just named source, dest, len and
-check. See <netinet/udp.h>.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: dhcpdump-1.8/dhcpdump.c
-===================================================================
---- dhcpdump-1.8.orig/dhcpdump.c	2011-05-17 20:20:46.506980003 +0200
-+++ dhcpdump-1.8/dhcpdump.c	2011-05-17 20:20:59.338979999 +0200
-@@ -163,10 +163,10 @@
- 	strcpy(ip_origin, (u_char *)inet_ntoa(ip->ip_src));
- 	strcpy(ip_destination, (u_char *)inet_ntoa(ip->ip_dst));
- 
--	if (hmask && check_ch((u_char *)(sp + offset), ntohs(udp->uh_ulen)))
-+	if (hmask && check_ch((u_char *)(sp + offset), ntohs(udp->len)))
- 		return;
- 
--	printdata((u_char *)(sp + offset), ntohs(udp->uh_ulen));
-+	printdata((u_char *)(sp + offset), ntohs(udp->len));
- }
- 
- // check for matching CHADDR (Peter Apian-Bennewitz <apian@ise.fhg.de>)
diff --git a/package/dhcpdump/Config.in b/package/dhcpdump/Config.in
index e0abe040fc..30e42928e4 100644
--- a/package/dhcpdump/Config.in
+++ b/package/dhcpdump/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_DHCPDUMP
 	help
 	  A tool for monitoring dhcp requests using tcpdump.
 
-	  http://www.mavetju.org/unix/general.php
+	  https://github.com/bbonev/dhcpdump
diff --git a/package/dhcpdump/dhcpdump.hash b/package/dhcpdump/dhcpdump.hash
index a24db5b275..fdf3243ad1 100644
--- a/package/dhcpdump/dhcpdump.hash
+++ b/package/dhcpdump/dhcpdump.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6d5eb9418162fb738bc56e4c1682ce7f7392dd96e568cc996e44c28de7f77190  dhcpdump-1.8.tar.gz
+sha256  3658ac21cc33e79e72bed070454e49c543017991cb6c37f4253c85e9176869d1  dhcpdump-1.9.tar.xz
 sha256  bab6ca76b7e93885396513689b1248dfb0e8fd662695b8bd1b26784ef71a0192  LICENSE
diff --git a/package/dhcpdump/dhcpdump.mk b/package/dhcpdump/dhcpdump.mk
index ec9571c0af..21cbd56b9c 100644
--- a/package/dhcpdump/dhcpdump.mk
+++ b/package/dhcpdump/dhcpdump.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-DHCPDUMP_VERSION = 1.8
-DHCPDUMP_SITE = http://www.mavetju.org/download
+DHCPDUMP_VERSION = 1.9
+DHCPDUMP_SOURCE = dhcpdump-$(DHCPDUMP_VERSION).tar.xz
+DHCPDUMP_SITE = https://github.com/bbonev/dhcpdump/releases/download/v$(DHCPDUMP_VERSION)
 DHCPDUMP_DEPENDENCIES = libpcap
 DHCPDUMP_LICENSE = BSD-2-Clause
 DHCPDUMP_LICENSE_FILES = LICENSE
@@ -15,12 +16,10 @@ ifeq ($(BR2_STATIC_LIBS),y)
 DHCPDUMP_LIBS += `$(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs`
 endif
 
-# glibc, uclibc and musl have strsep()
-DHCPDUMP_CFLAGS = $(TARGET_CFLAGS) -DHAVE_STRSEP
-
 define DHCPDUMP_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) CC="$(TARGET_CC) $(DHCPDUMP_CFLAGS) \
-		-D_GNU_SOURCE" LIBS="$(DHCPDUMP_LIBS)" dhcpdump
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) CC="$(TARGET_CC)" \
+		CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE" \
+		LDFLAGS="$(TARGET_LDFLAGS)" LIBS="$(DHCPDUMP_LIBS)" dhcpdump
 endef
 
 define DHCPDUMP_INSTALL_TARGET_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
