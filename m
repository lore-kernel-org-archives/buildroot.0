Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB0ACC433F5
	for <buildroot@archiver.kernel.org>; Mon, 14 Feb 2022 11:52:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4F414405B6;
	Mon, 14 Feb 2022 11:52:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0os0Tfj1EG0f; Mon, 14 Feb 2022 11:52:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2EA644041C;
	Mon, 14 Feb 2022 11:52:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C1DB41BF3BC
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 11:52:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B060A813E1
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 11:52:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tlNTh_1n-fZF for <buildroot@lists.busybox.net>;
 Mon, 14 Feb 2022 11:52:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 11F68813B4
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 11:52:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id AB3728199C; Mon, 14 Feb 2022 11:45:00 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 14 Feb 2022 12:52:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 115ad9c54874dd14fd53ece9ae4ce6858ad743ad
X-Git-Newrev: 81cb8a853bd2e01dbcb67573fe591474b43040a1
X-Patchwork-Hint: ignore
Message-Id: <20220214114500.AB3728199C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bluez5_utils: set
 BLUEZ5_UTILS_AUTORECONF
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

commit: https://git.buildroot.net/buildroot/commit/?id=81cb8a853bd2e01dbcb67573fe591474b43040a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 572d08ee4a731b203b2d3aaf720a48f622609371 forgot to set
BLUEZ5_UTILS_AUTORECONF resulting in the following build failure:

/home/peko/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sh4-buildroot-linux-uclibc/10.3.0/../../../../sh4-buildroot-linux-uclibc/bin/ld: gobex/gobex-packet.o: in function `g_obex_packet_set_data':
gobex-packet.c:(.text+0x698): undefined reference to `util_memdup'

It should be noted that previous commit didn't fix any build failure
with libglib >= 2.69. It only fixes the following warning:

profiles/battery/battery.c: In function 'read_initial_battery_level_cb':
profiles/battery/battery.c:162:2: warning: 'g_memdup' is deprecated (declared at /home/buildroot/autobuild/instance-0/output-1/host/bin/../arm-buildroot-linux-gnueabi/sysroot/usr/include/glib-2.0/glib/gstrfuncs.h:257): Use 'g_memdup2' instead [-Wdeprecated-declarations]
  batt->initial_value = g_memdup(value, length);
  ^

So an other option would be to revert this commit.

The 'real' build error that previous commit tried to fix was raised
because rand was replaced by getrandom since
https://git.kernel.org/pub/scm/bluetooth/bluez.git/log/?qt=grep&q=getrandom
but getrandom is not available until glibc 2.25:

plugins/autopair.c:20:24: fatal error: sys/random.h: No such file or directory
 #include <sys/random.h>
                        ^

Fixes:
 - http://autobuild.buildroot.org/results/46f7dbfe1d80c7622d670ba1ac957e9e6077eb9f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/bluez5_utils/bluez5_utils.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index 49f6eaac13..7c2561b864 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -13,6 +13,8 @@ BLUEZ5_UTILS_LICENSE = GPL-2.0+, LGPL-2.1+
 BLUEZ5_UTILS_LICENSE_FILES = COPYING COPYING.LIB
 BLUEZ5_UTILS_CPE_ID_VENDOR = bluez
 BLUEZ5_UTILS_CPE_ID_PRODUCT = bluez
+# We're patching Makefile.am
+BLUEZ5_UTILS_AUTORECONF = YES
 
 BLUEZ5_UTILS_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_BLUEZ5_UTILS_HEADERS),bluez5_utils-headers) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
