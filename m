Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 534ADC25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 21:41:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B77D40977;
	Sun, 14 Aug 2022 21:41:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B77D40977
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MNGumnMe7xIj; Sun, 14 Aug 2022 21:41:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52FD640933;
	Sun, 14 Aug 2022 21:41:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 52FD640933
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A55221BF282
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 21:41:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7FE3E605A4
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 21:41:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7FE3E605A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KXQFTFFBai4Y for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 21:41:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BFF1A6059B
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 21:41:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BFF1A6059B
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id DD690875A8; Sun, 14 Aug 2022 21:27:03 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 14 Aug 2022 23:33:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ac98e808e4485cc93b5456f57d12cc247926c701
X-Git-Newrev: 01325361970e39f40b68dd1a2a3ecd988be044ae
X-Patchwork-Hint: ignore
Message-Id: <20220814212703.DD690875A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ocrad: fix static build
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

commit: https://git.buildroot.net/buildroot/commit/?id=01325361970e39f40b68dd1a2a3ecd988be044ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following static build failure raised since bump to version 0.28
in commit 1b677db703dc0b976a707942bbc94ecd3f7b4b4b:

/home/buildroot/autobuild/run/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /home/buildroot/autobuild/run/instance-2/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libpng.a(png.o): in function `png_reset_crc':
png.c:(.text+0x738): undefined reference to `crc32'

Note that the custom, hand-rolled configure script inserts the LIBS we
pass on the command line, in front of the hard-coded LIBS, which
currently is just LIBS=-lpng, so we end up with a final LIBS set to:
    LIBS=-L.../sysroot/usr/lib -lpng16 -lz -lpng

... the latter -lpng being redundant and unnecessary, but innocuous.

Fixes:
 - http://autobuild.buildroot.org/results/97543d8df5c40818e05622490e4aad60b48934a6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998@free.fr: split multi-line one item per line]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/ocrad/ocrad.mk | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/package/ocrad/ocrad.mk b/package/ocrad/ocrad.mk
index 78638b770a..d62b7af351 100644
--- a/package/ocrad/ocrad.mk
+++ b/package/ocrad/ocrad.mk
@@ -10,12 +10,19 @@ OCRAD_SITE = $(BR2_GNU_MIRROR)/ocrad
 OCRAD_LICENSE = GPL-2.0+
 OCRAD_LICENSE_FILES = COPYING
 OCRAD_INSTALL_STAGING = YES
-OCRAD_DEPENDENCIES = libpng
+OCRAD_DEPENDENCIES = host-pkgconf libpng
+
+OCRAD_LIBS = `$(PKG_CONFIG_HOST_BINARY) --libs libpng`
 
 # This is not a true autotools package.
 define OCRAD_CONFIGURE_CMDS
 	cd $(@D) && \
-	$(TARGET_MAKE_ENV) ./configure --prefix=/usr --sysconfdir=/etc $(TARGET_CONFIGURE_OPTS)
+	$(TARGET_MAKE_ENV) \
+	./configure \
+		--prefix=/usr \
+		--sysconfdir=/etc \
+		$(TARGET_CONFIGURE_OPTS) \
+		LIBS="$(OCRAD_LIBS)"
 endef
 
 define OCRAD_BUILD_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
