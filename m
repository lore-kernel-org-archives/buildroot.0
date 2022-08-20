Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7141BECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 09:05:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20D966107E;
	Sun, 11 Sep 2022 09:05:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 20D966107E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CGuaP-SPIOhS; Sun, 11 Sep 2022 09:05:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37C8761037;
	Sun, 11 Sep 2022 09:05:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37C8761037
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 253261BF368
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:48:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 93FEE6FB09
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:48:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93FEE6FB09
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u2oqQLWCgEwt for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 08:48:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1C1D26106F
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 08:48:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C1D26106F
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 13B2083620; Sun, 11 Sep 2022 08:48:25 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 20 Aug 2022 22:52:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: db1550518062b93ced504ab0d8d43347a0b1adeb
X-Git-Newrev: 13faa449e16d955182d5bac132142b7ba07c65e3
X-Patchwork-Hint: ignore
Message-Id: <20220911084825.13B2083620@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-meson.mk: handle possibly non
 existing compilers
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

commit: https://git.buildroot.net/buildroot/commit/?id=13faa449e16d955182d5bac132142b7ba07c65e3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

To avoid populating the cross-file with non existing compilers,
we tie them to /bin/false.

As explained by @eliebrokeit on the meson IRC channel:

    If you don't have one [a compiler] defined, cross builds won't try
    to autodetect one, IIRC...
    ... however setting it to /bin/false will result in it detecting
    that that doesn't work
    I guess the safest bet is to deliberately poison it with /bin/false

So there we go.

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
[yann.morin.1998@free.fr: expand with IRC snippet]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pkg-meson.mk | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
index 0632ab21cf..d675f7f733 100644
--- a/package/pkg-meson.mk
+++ b/package/pkg-meson.mk
@@ -68,15 +68,29 @@ else
 PKG_MESON_TARGET_CPU_FAMILY = $(ARCH)
 endif
 
+# To avoid populating the cross-file with non existing compilers,
+# we tie them to /bin/false
+ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
+PKG_MESON_TARGET_CXX = $(TARGET_CXX)
+else
+PKG_MESON_TARGET_CXX = /bin/false
+endif
+
+ifeq ($(BR2_TOOLCHAIN_HAS_FORTRAN),y)
+PKG_MESON_TARGET_FC = $(TARGET_FC)
+else
+PKG_MESON_TARGET_FC = /bin/false
+endif
+
 # Generates sed patterns for patching the cross-compilation.conf template,
 # since Flags might contain commas the arguments are passed indirectly by
 # variable name (stripped to deal with whitespaces).
 # Arguments are variable containing cflags, cxxflags, ldflags, fcflags
 define PKG_MESON_CROSSCONFIG_SED
         -e "s%@TARGET_CC@%$(TARGET_CC)%g" \
-        -e "s%@TARGET_CXX@%$(TARGET_CXX)%g" \
+        -e "s%@TARGET_CXX@%$(PKG_MESON_TARGET_CXX)%g" \
         -e "s%@TARGET_AR@%$(TARGET_AR)%g" \
-        -e "s%@TARGET_FC@%$(TARGET_FC)%g" \
+        -e "s%@TARGET_FC@%$(PKG_MESON_TARGET_FC)%g" \
         -e "s%@TARGET_STRIP@%$(TARGET_STRIP)%g" \
         -e "s%@TARGET_ARCH@%$(PKG_MESON_TARGET_CPU_FAMILY)%g" \
         -e "s%@TARGET_CPU@%$(GCC_TARGET_CPU)%g" \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
