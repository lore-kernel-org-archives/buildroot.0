Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A78FBC433F5
	for <buildroot@archiver.kernel.org>; Sun, 22 May 2022 10:22:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69C3160FA5;
	Sun, 22 May 2022 10:22:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QWMJ5SwZ-Oy6; Sun, 22 May 2022 10:22:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D993360D61;
	Sun, 22 May 2022 10:22:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 17FCD1BF47E
 for <buildroot@lists.busybox.net>; Sun, 22 May 2022 10:22:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 14BAA60C20
 for <buildroot@lists.busybox.net>; Sun, 22 May 2022 10:22:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xA7J55nQDgOo for <buildroot@lists.busybox.net>;
 Sun, 22 May 2022 10:22:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0765760BAA
 for <buildroot@buildroot.org>; Sun, 22 May 2022 10:22:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 653B485FD4; Sun, 22 May 2022 10:10:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 22 May 2022 12:02:07 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 4dfd34f9f6ef5708685849493d33d31c81f8806d
X-Git-Newrev: 1f502dd60118bbc2b32dd2da30d004d21390bd15
X-Patchwork-Hint: ignore
Message-Id: <20220522101055.653B485FD4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/dhcp: fix install
 of internal bind libraries
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

commit: https://git.buildroot.net/buildroot/commit/?id=1f502dd60118bbc2b32dd2da30d004d21390bd15
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Internal bind libraries are not installed to target since commit
0c8dd6ebd656e06cf99a63eb93343715f4853503 resulting in the following
runtime failure:

Starting DHCP server: /usr/sbin/dhcpd: error while loading shared libraries: libirs.so.161: cannot open shared object file: No such file or directory

RANLIB must also be set to avoid the following build failure at install
step:

libtool: install: arceb-buildroot-linux-uclibc-ranlib /home/fabrice/buildroot/output/per-package/dhcp/target/usr/lib/libisccfg.a
/home/fabrice/buildroot/output/build/dhcp-4.4.3/bind/bind-9.11.36/libtool: line 1719: arceb-buildroot-linux-uclibc-ranlib: command not found

Fixes:
 - No autobuilder failures (reported by Eugen.Hristev@microchip.com)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 2087051d3724c66064c1df8d379727b0b4d30a92)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dhcp/dhcp.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index c58592cc45..6ac9ed0147 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -28,7 +28,8 @@ DHCP_BIND_EXTRA_CONFIG = \
 	BUILD_CC='$(HOSTCC)' \
 	BUILD_CFLAGS='$(HOST_CFLAGS)' \
 	BUILD_CPPFLAGS='$(HOST_CPPFLAGS)' \
-	BUILD_LDFLAGS='$(HOST_LDFLAGS)'
+	BUILD_LDFLAGS='$(HOST_LDFLAGS)' \
+	RANLIB='$(TARGET_RANLIB)'
 
 DHCP_CONF_ENV += ac_cv_prog_AWK=$(HOST_DIR)/bin/gawk
 
@@ -70,6 +71,7 @@ DHCP_CONF_OPTS += --enable-delayed-ack
 endif
 
 define DHCP_INSTALL_LIBS
+	$(MAKE) -C $(@D)/bind install-bind DESTDIR=$(TARGET_DIR)
 	$(MAKE) -C $(@D)/common install-exec DESTDIR=$(TARGET_DIR)
 	$(MAKE) -C $(@D)/omapip install-exec DESTDIR=$(TARGET_DIR)
 endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
