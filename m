Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C4B6C433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 19:34:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21212817A5;
	Mon,  4 Apr 2022 19:34:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h3LnTZzzGYX2; Mon,  4 Apr 2022 19:34:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 187B881498;
	Mon,  4 Apr 2022 19:34:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 04D4E1BF27E
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 19:32:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 956DA60BF6
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 19:32:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EFJAh0GUmiZf for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 19:32:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BD3A160FDE
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 19:32:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 1EE0D8259A; Mon,  4 Apr 2022 19:22:58 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 4 Apr 2022 21:20:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fef53b2e53c0e1ee958702f7a7f2cb097d54e74f
X-Git-Newrev: 0c8dd6ebd656e06cf99a63eb93343715f4853503
X-Patchwork-Hint: ignore
Message-Id: <20220404192258.1EE0D8259A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dhcp: use internal bind
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

commit: https://git.buildroot.net/buildroot/commit/?id=0c8dd6ebd656e06cf99a63eb93343715f4853503
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use internal bind as dhcp doesn't build since bump of bind to version
9.16.26 in commit 8adeaec8afacbc680edebae91524f6144926ac92 and upstream
doesn't plan to fix it any time soon:
https://gitlab.isc.org/isc-projects/dhcp/-/issues/233#note_276883

In file included from ../includes/dhcpd.h:91,
                 from ctrace.c:29:
../includes/omapip/isclib.h:51:10: fatal error: isc/boolean.h: No such file or directory
   51 | #include <isc/boolean.h>
      |          ^~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/d18b006dce7b46631ce8f4c72fb97eb861993939

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/dhcp/Config.in |  1 -
 package/dhcp/dhcp.mk   | 19 ++++++++++++++++---
 2 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/package/dhcp/Config.in b/package/dhcp/Config.in
index 515040c612..e0706efafb 100644
--- a/package/dhcp/Config.in
+++ b/package/dhcp/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_DHCP
 	# fork()
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
-	select BR2_PACKAGE_BIND
 	help
 	  DHCP relay agent from the ISC DHCP distribution.
 
diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index 18765a3639..f1e3c22f1c 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -9,8 +9,10 @@ DHCP_SITE = https://ftp.isc.org/isc/dhcp/$(DHCP_VERSION)
 DHCP_INSTALL_STAGING = YES
 DHCP_LICENSE = MPL-2.0
 DHCP_LICENSE_FILES = LICENSE
-DHCP_DEPENDENCIES = bind host-gawk
+DHCP_DEPENDENCIES = host-gawk
 DHCP_CPE_ID_VENDOR = isc
+# internal bind does not support parallel builds.
+DHCP_MAKE = $(MAKE1)
 
 # use libtool-enabled configure.ac
 define DHCP_LIBTOOL_AUTORECONF
@@ -21,11 +23,12 @@ DHCP_CONF_ENV = \
 	CPPFLAGS='-D_PATH_DHCPD_CONF=\"/etc/dhcp/dhcpd.conf\" \
 		-D_PATH_DHCLIENT_CONF=\"/etc/dhcp/dhclient.conf\"' \
 	CFLAGS='$(TARGET_CFLAGS) -DISC_CHECK_NONE=1'
+DHCP_BIND_EXTRA_CONFIG = BUILD_CC='$(TARGET_CC)'
 
 DHCP_CONF_ENV += ac_cv_prog_AWK=$(HOST_DIR)/bin/gawk
 
 DHCP_CONF_OPTS = \
-	--with-libbind=$(STAGING_DIR)/usr \
+	--with-bind-extra-config="$(DHCP_BIND_EXTRA_CONFIG)" \
 	--with-randomdev=/dev/random \
 	--with-srv-lease-file=/var/lib/dhcp/dhcpd.leases \
 	--with-srv6-lease-file=/var/lib/dhcp/dhcpd6.leases \
@@ -38,8 +41,18 @@ DHCP_CONF_OPTS = \
 	--with-relay-pid-file=/var/run/dhcrelay.pid \
 	--with-relay6-pid-file=/var/run/dhcrelay6.pid
 
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+DHCP_BIND_EXTRA_CONFIG += --with-zlib
+DHCP_DEPENDENCIES += zlib
+else
+DHCP_BIND_EXTRA_CONFIG += --without-zlib
+endif
+
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+DHCP_CONF_ENV += LIBS=-latomic
+endif
+
 ifeq ($(BR2_STATIC_LIBS),y)
-DHCP_CONF_ENV += LIBS="`$(STAGING_DIR)/usr/bin/bind9-config --libs bind9`"
 DHCP_CONF_OPTS += --disable-libtool
 else
 DHCP_POST_EXTRACT_HOOKS += DHCP_LIBTOOL_AUTORECONF
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
