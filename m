Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7CECC4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 21:13:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4775860881;
	Sat,  4 Nov 2023 21:13:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4775860881
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z9npgTlGiJxR; Sat,  4 Nov 2023 21:13:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8AE4960774;
	Sat,  4 Nov 2023 21:13:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8AE4960774
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3ECE81BF2F9
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 21:13:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1656540273
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 21:13:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1656540273
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KFat88TS7EkW for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 21:13:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD9F040132
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 21:13:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD9F040132
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C783B85FDA; Sat,  4 Nov 2023 21:13:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 4 Nov 2023 22:12:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5a0f41e56dd48ddd605d92e0571f86d1f4b40149
X-Git-Newrev: e1dc10b7b8e163ccceca6d0faff27b33517476fd
X-Patchwork-Hint: ignore
Message-Id: <20231104211302.C783B85FDA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dhcp: fix cross build
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e1dc10b7b8e163ccceca6d0faff27b33517476fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes build error

Building dns library in /home/bernd/buildroot/br4/output/build/dhcp-4.4.3-
P1/bind/bind-9.11.36/lib/dns
./gen: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.38' not found
(required by ./gen)
make[4]: *** [Makefile:601: include/dns/enumtype.h] Error 1
make[3]: *** [Makefile:595: include] Error 2

with this defconfig

BR2_x86_64=y
BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
BR2_PACKAGE_DHCP=y

Please note that this build error only occurs when the target and the
host system have the same arch. For example this defconfig builds fine:

BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
BR2_PACKAGE_DHCP=y

on a Debian 12 x86_64 host using glibc-2.36:

$ /lib/ld-linux.so.2  --version
ld.so (Debian GLIBC 2.36-9+deb12u1) stable release version 2.36.

The error occurs since buildroot commit 34f8d874ee which bumped glibc
from 2.37 to 2.38.

This patch is inspired by the Yocto Project:
https://patchwork.yoctoproject.org/project/oe/patch/20230715212159.3265080-1-raj.khem@gmail.com/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dhcp/dhcp.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index 9d0bcf001f..b3b7fe3203 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -33,6 +33,9 @@ DHCP_CONF_ENV = \
 	CFLAGS='$(TARGET_CFLAGS) -DISC_CHECK_NONE=1'
 
 DHCP_BIND_EXTRA_CONFIG = \
+	--build=$(GNU_HOST_NAME) \
+	--host=$(GNU_TARGET_NAME) \
+	--target=$(GNU_TARGET_NAME) \
 	BUILD_CC='$(HOSTCC)' \
 	BUILD_CFLAGS='$(HOST_CFLAGS)' \
 	BUILD_CPPFLAGS='$(HOST_CPPFLAGS)' \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
