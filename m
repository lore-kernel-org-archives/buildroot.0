Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB374C9832A
	for <buildroot@archiver.kernel.org>; Sat, 17 Jan 2026 18:37:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A04BA61257;
	Sat, 17 Jan 2026 18:37:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AVS5EeHyuoYV; Sat, 17 Jan 2026 18:37:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5DF276124A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768675034;
	bh=QloVg+fcyV5tKkxIkyt37NEj+/m78ZWLwXLLxYvA2tk=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=kQ5OrvqQWAIhbZUgA7tSkhKNZzgOPLJ1VJmnpK6hp5O3v53SzT7f5r3qhSG+YyZKe
	 yGLkqQie/4AHnLttEHQ0gfW/aFxaj5775aNk8FWZepffBFckm32jNmfTO6RfhE3Nkm
	 gCjM/9vCp7obEFntuEJDhPfFFY7NP6OAcvVH62lhi4RhDh12VvnFagcX4y6wNSMrjO
	 GKCCSmWQAA1WgcNgAyQtJtkAm1R+0z+s5x2MKKHey5ZW0a+0oha4hPkCv/uUrdHTPV
	 vi+WLYLhMJiqa0rlqUhquXpv9BZutBK5yP1TyuHSrOHA/UtneQQ5aszz3Jkveqg9xd
	 QhXltgqlvz2Mg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5DF276124A;
	Sat, 17 Jan 2026 18:37:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DFA98347
 for <buildroot@buildroot.org>; Sat, 17 Jan 2026 18:37:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CBD8F842A1
 for <buildroot@buildroot.org>; Sat, 17 Jan 2026 18:37:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8tVO9NBJuixU for <buildroot@buildroot.org>;
 Sat, 17 Jan 2026 18:37:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 952138429C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 952138429C
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 952138429C
 for <buildroot@buildroot.org>; Sat, 17 Jan 2026 18:37:11 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 6063919F593;
 Sat, 17 Jan 2026 19:37:06 +0100 (CET)
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Julien Olivain <ju.o@free.fr>
Date: Sat, 17 Jan 2026 19:36:56 +0100
Message-ID: <20260117183656.3790665-1-ju.o@free.fr>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1768675028;
 bh=dA97QGiY6qmzHW3aHte7a+WpEDwsEn7q78hGGrfSmvA=;
 h=From:To:Cc:Subject:Date:From;
 b=jcsc8L1lHap8Wpm9T2ehDOvKu+KN3aHMLuPhv8N4yABhaXY7RPHCrUi3k5QdByn2K
 c9ayB7fZ5ta1IrxXrvQ5qByCsSfrfSj+DXC4+2yYN/po7myrJiZJs2uW3cAG+UYAG/
 KB4jSv0DXsXRiqK5bZKaf0WMfM9if/KsKLUG97rR8HbAC0zDAx1DQkod4GDcH5yGX6
 lzwpUSy5V+zqADYqU8v9gZnlMv2zFCFE/N4rdElVii9jEOgZbhYZjdk924JXuUJ07E
 vDYqaZigrxFlE2rQYwoUOnanQL50KHTIlnFEtmLQDSKevgdA7JBBEMn7nk5qSH5OwD
 lGKaxsk+2ttyQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=jcsc8L1l
Subject: [Buildroot] [PATCH 1/1] package/wine: bump to version 11.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For release notes, see:
https://gitlab.winehq.org/wine/wine/-/releases/wine-11.0

The --without-osmesa configure option was removed upstream, in
commit [1]. This commit removes the options from _CONF_OPTS.

Also, since upstream commit [2], the /usr/bin/wine program became
a "tool". It needs to be enabled when cross-compiling. As suggested
in [3], this commit adds --enable-tools in WINE_CONF_OPTS.

This commit also updates the LICENSE file hash, after year
update in [4].

[1] https://gitlab.winehq.org/wine/wine/-/commit/370e7d9a50593077e958f3efcc70254990bfe6f3
[2] https://gitlab.winehq.org/wine/wine/-/commit/6d28db86c9c2559e67a4820175416aff20f7abec
[3] https://bugs.winehq.org/show_bug.cgi?id=57847
[4] https://gitlab.winehq.org/wine/wine/-/commit/ab59cc16c56fa7400c2076990b53ea95f6889902

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/12754203663
---
 package/wine/wine.hash | 8 ++++----
 package/wine/wine.mk   | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/wine/wine.hash b/package/wine/wine.hash
index eb0d45ca0a..65cab0ed5f 100644
--- a/package/wine/wine.hash
+++ b/package/wine/wine.hash
@@ -1,8 +1,8 @@
 # From:
-# https://dl.winehq.org/wine/source/10.0/sha512sums.asc
-sha512  effb41c5641993e2e52eaa825cc19b7d9846e084992c5a5b066ead2339b24384d320898a9cee347a9a87106bcb3b0f54c8cd2c8d4de3a887a658052ddd5168d6  wine-10.0.tar.xz
+# https://dl.winehq.org/wine/source/11.0/sha512sums.asc
+sha512  a2c3db14f8cf0d19927466805c8f17c68ee7e93d1196d1162dd2279af497c21ec611a63f7a9de59953bbdfdb44c87d7bf55373c6533224a5d54e434c29428d1b  wine-11.0.tar.xz
 # Locally calculated after checking pgp signature
-sha256  c5e0b3f5f7efafb30e9cd4d9c624b85c583171d33549d933cd3402f341ac3601  wine-10.0.tar.xz
+sha256  c07a6857933c1fc60dff5448d79f39c92481c1e9db5aa628db9d0358446e0701  wine-11.0.tar.xz
 # Locally calculated
 sha256  e237fa56668030e928551ddd60f05df5fe957f75eab874bbd017e085ed722e7c  COPYING.LIB
-sha256  51433d87540ee2f30e3cff986e00e1477880002bf993106a13775ed60d4e0af4  LICENSE
+sha256  ae025f125a5d639f0f7abe5146efa1e3d7453cc10b744b2910806fa3f46626ef  LICENSE
diff --git a/package/wine/wine.mk b/package/wine/wine.mk
index 380f729585..4f0e229e9a 100644
--- a/package/wine/wine.mk
+++ b/package/wine/wine.mk
@@ -10,9 +10,9 @@
 # development version, unless it is absolutely needed (for example:
 # incompatibility with another library and no maintenance stable
 # version is available).
-WINE_VERSION = 10.0
+WINE_VERSION = 11.0
 WINE_SOURCE = wine-$(WINE_VERSION).tar.xz
-WINE_SITE = https://dl.winehq.org/wine/source/10.0
+WINE_SITE = https://dl.winehq.org/wine/source/11.0
 WINE_LICENSE = LGPL-2.1+
 WINE_LICENSE_FILES = COPYING.LIB LICENSE
 WINE_CPE_ID_VENDOR = winehq
@@ -25,6 +25,7 @@ WINE_CONF_OPTS = \
 	--with-wine-tools=../host-wine-$(WINE_VERSION) \
 	--disable-tests \
 	--disable-win64 \
+	--enable-tools \
 	--without-capi \
 	--without-coreaudio \
 	--without-gettext \
@@ -33,8 +34,7 @@ WINE_CONF_OPTS = \
 	--without-mingw \
 	--without-opencl \
 	--without-oss \
-	--without-vulkan \
-	--without-osmesa  # BR2_PACKAGE_MESA3D_OSMESA_GALLIUM removed in mesa 25.1
+	--without-vulkan
 
 # Wine uses a wrapper around gcc, and uses the value of --host to
 # construct the filename of the gcc to call.  But for external
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
