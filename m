Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADCE4C5320E
	for <buildroot@archiver.kernel.org>; Sun, 18 Aug 2024 09:04:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 673D980F48;
	Sun, 18 Aug 2024 09:04:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KjWCYJaTqBVN; Sun, 18 Aug 2024 09:04:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E69EF80F7E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E69EF80F7E;
	Sun, 18 Aug 2024 09:04:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1C0C91BF8C7
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 09:03:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7EB3B60658
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 09:03:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6eLuT3fTMG5G for <buildroot@lists.busybox.net>;
 Sun, 18 Aug 2024 09:03:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DA38E6065C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA38E6065C
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DA38E6065C
 for <buildroot@buildroot.org>; Sun, 18 Aug 2024 09:03:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 6D10BFF802;
 Sun, 18 Aug 2024 09:03:48 +0000 (UTC)
To: Buildroot List <buildroot@buildroot.org>
Date: Sun, 18 Aug 2024 11:03:39 +0200
Message-ID: <20240818090346.947914-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240818090346.947914-1-thomas.petazzoni@bootlin.com>
References: <20240818090346.947914-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723971828;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qFlWOzMjWvvaHLKhahuPutkYD8ZbZa3wH2pZSPzzPRA=;
 b=JbF6bJpebvpq/+SxLO4jWo/VsWzhRUXn67hW3wPy7J7FB1Pt14KBpwUiK3I88df7375Pgq
 99HKppbiYI5dbTPpcNfziOkngKThjOAxZZ6LAY+5xeaWURLejsqvAXsTw/R9N7bJM10wE7
 Sl1O0QjTPbIflGOdTS5vWX8/pt0qV4Toctlnbh+iKBmujGFixXja02bjoBJg+ji7AYf6AM
 j/AjHcQzKdt64OfRCaxA/cMZa44JUxJl+t84OKOFpoXqbYvNuU20BRY7bZyo90HqZ/dnIY
 yJzsJuiaXx/TJiNCXavd9zp/lbapWXXNKlkChiSChioeIqkEsp4+f7aygas6SA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JbF6bJpe
Subject: [Buildroot] [PATCH v2 1/5] utils/genrandconfig: remove fixups
 related to untested CT-NG toolchains
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

We have accumulated a whole bunch of very old fixups to avoid issues
with super old CT-NG toolchains, which we are not testing anymore, so
remove those fixups.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/genrandconfig | 69 ---------------------------------------------
 1 file changed, 69 deletions(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 216e733799..cefc3dca12 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -181,43 +181,8 @@ async def fixup_config(sysinfo, configfile):
 
     ROOTFS_SIZE = '5G'
 
-    BR2_TOOLCHAIN_EXTERNAL_URL = 'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/'
-
     if "BR2_NEEDS_HOST_JAVA=y\n" in configlines and not await sysinfo.has("java"):
         return False
-    # The ctng toolchain is affected by PR58854
-    if 'BR2_PACKAGE_LTTNG_TOOLS=y\n' in configlines and \
-       BR2_TOOLCHAIN_EXTERNAL_URL + 'armv5-ctng-linux-gnueabi.tar.xz"\n' in configlines:
-        return False
-    # The ctng toolchain tigger an assembler error with guile package when compiled with -Os (same issue as for CS ARM 2014.05-29)
-    if 'BR2_PACKAGE_GUILE=y\n' in configlines and \
-       'BR2_OPTIMIZE_S=y\n' in configlines and \
-       BR2_TOOLCHAIN_EXTERNAL_URL + 'armv5-ctng-linux-gnueabi.tar.xz"\n' in configlines:
-        return False
-    # The ctng toolchain is affected by PR58854
-    if 'BR2_PACKAGE_LTTNG_TOOLS=y\n' in configlines and \
-       BR2_TOOLCHAIN_EXTERNAL_URL + 'armv6-ctng-linux-uclibcgnueabi.tar.xz"\n' in configlines:
-        return False
-    # The ctng toolchain is affected by PR58854
-    if 'BR2_PACKAGE_LTTNG_TOOLS=y\n' in configlines and \
-       BR2_TOOLCHAIN_EXTERNAL_URL + 'armv7-ctng-linux-gnueabihf.tar.xz"\n' in configlines:
-        return False
-    # The ctng toolchain is affected by PR60155
-    if 'BR2_PACKAGE_SDL=y\n' in configlines and \
-       BR2_TOOLCHAIN_EXTERNAL_URL + 'powerpc-ctng-linux-uclibc.tar.xz"\n' in configlines:
-        return False
-    # The ctng toolchain is affected by PR60155
-    if 'BR2_PACKAGE_LIBMPEG2=y\n' in configlines and \
-       BR2_TOOLCHAIN_EXTERNAL_URL + 'powerpc-ctng-linux-uclibc.tar.xz"\n' in configlines:
-        return False
-    # This MIPS toolchain uses eglibc-2.18 which lacks SYS_getdents64
-    if 'BR2_PACKAGE_STRONGSWAN=y\n' in configlines and \
-       BR2_TOOLCHAIN_EXTERNAL_URL + 'mips64el-ctng_n64-linux-gnu.tar.xz"\n' in configlines:
-        return False
-    # This MIPS toolchain uses eglibc-2.18 which lacks SYS_getdents64
-    if 'BR2_PACKAGE_PYTHON3=y\n' in configlines and \
-       BR2_TOOLCHAIN_EXTERNAL_URL + 'mips64el-ctng_n64-linux-gnu.tar.xz"\n' in configlines:
-        return False
     # libffi not available on ARMv7-M, but propagating libffi arch
     # dependencies in Buildroot is really too much work, so we handle
     # this here.
@@ -232,40 +197,6 @@ async def fixup_config(sysinfo, configfile):
     if 'BR2_PACKAGE_SUNXI_BOARDS=y\n' in configlines:
         configlines.remove('BR2_PACKAGE_SUNXI_BOARDS_FEX_FILE=""\n')
         configlines.append('BR2_PACKAGE_SUNXI_BOARDS_FEX_FILE="a10/hackberry.fex"\n')
-    # This MIPS uClibc toolchain fails to build the gdb package
-    if 'BR2_PACKAGE_GDB=y\n' in configlines and \
-       BR2_TOOLCHAIN_EXTERNAL_URL + 'mipsel-ctng-linux-uclibc.tar.xz"\n' in configlines:
-        return False
-    # This MIPS uClibc toolchain fails to build the rt-tests package
-    if 'BR2_PACKAGE_RT_TESTS=y\n' in configlines and \
-       BR2_TOOLCHAIN_EXTERNAL_URL + 'mipsel-ctng-linux-uclibc.tar.xz"\n' in configlines:
-        return False
-    # This MIPS uClibc toolchain fails to build the civetweb package
-    if 'BR2_PACKAGE_CIVETWEB=y\n' in configlines and \
-       BR2_TOOLCHAIN_EXTERNAL_URL + 'mipsel-ctng-linux-uclibc.tar.xz"\n' in configlines:
-        return False
-    # This MIPS ctng toolchain fails to build the python3 package
-    if 'BR2_PACKAGE_PYTHON3=y\n' in configlines and \
-       BR2_TOOLCHAIN_EXTERNAL_URL + 'mips64el-ctng_n64-linux-gnu.tar.xz"\n' in configlines:
-        return False
-    # This MIPS uClibc toolchain fails to build the strace package
-    if 'BR2_PACKAGE_STRACE=y\n' in configlines and \
-       BR2_TOOLCHAIN_EXTERNAL_URL + 'mipsel-ctng-linux-uclibc.tar.xz"\n' in configlines:
-        return False
-    # This MIPS uClibc toolchain fails to build the cdrkit package
-    if 'BR2_PACKAGE_CDRKIT=y\n' in configlines and \
-       'BR2_STATIC_LIBS=y\n' in configlines and \
-       BR2_TOOLCHAIN_EXTERNAL_URL + 'mipsel-ctng-linux-uclibc.tar.xz"\n' in configlines:
-        return False
-    # uClibc vfork static linking issue
-    if 'BR2_PACKAGE_ALSA_LIB=y\n' in configlines and \
-       'BR2_STATIC_LIBS=y\n' in configlines and \
-       BR2_TOOLCHAIN_EXTERNAL_URL + 'i486-ctng-linux-uclibc.tar.xz"\n' in configlines:
-        return False
-    # This MIPS uClibc toolchain fails to build the weston package
-    if 'BR2_PACKAGE_WESTON=y\n' in configlines and \
-       BR2_TOOLCHAIN_EXTERNAL_URL + 'mipsel-ctng-linux-uclibc.tar.xz"\n' in configlines:
-        return False
     # No C library for internal toolchain
     if 'BR2_TOOLCHAIN_BUILDROOT_NONE=y\n' in configlines:
         return False
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
