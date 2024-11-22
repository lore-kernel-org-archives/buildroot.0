Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22353E6ADC3
	for <buildroot@archiver.kernel.org>; Fri, 22 Nov 2024 21:38:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 965FD42BB5;
	Fri, 22 Nov 2024 21:38:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p-em4YuyRUhD; Fri, 22 Nov 2024 21:38:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A24642B55
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A24642B55;
	Fri, 22 Nov 2024 21:38:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C0147E11
 for <buildroot@buildroot.org>; Fri, 22 Nov 2024 21:38:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD9E142B5D
 for <buildroot@buildroot.org>; Fri, 22 Nov 2024 21:38:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a7NypgENd5BW for <buildroot@buildroot.org>;
 Fri, 22 Nov 2024 21:38:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3862542AFD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3862542AFD
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3862542AFD
 for <buildroot@buildroot.org>; Fri, 22 Nov 2024 21:38:22 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 4E768B0051E;
 Fri, 22 Nov 2024 22:38:17 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, Julien Olivain <ju.o@free.fr>
Date: Fri, 22 Nov 2024 22:38:09 +0100
Message-ID: <20241122213809.176709-1-ju.o@free.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1732311499;
 bh=Q7e9DMgaEKMvehvHvwxGP/BafQnproiG14YSx00dVoI=;
 h=From:To:Cc:Subject:Date:From;
 b=luDIZs9cYtkuw8379Zh4sAKjc/IffAOP5tuuEnCRZ26oj8tXYPrsOjgY+78gxCMAv
 izoo9Zl94h0BG7q2h+Oq6kOqIIo2COXVmx3x/FBfRn+DNOnwIWt2K4wB+8HND/3DLu
 M+IjDbz4MDY8aAc2IF9sSImw7IzvU0tl8w4naC8R1zja9suwNous54+nZ3WEMz1znO
 mezcm+YImS+JgYbh0UMmsH9U8INYpLxJbWBI/NXpWdElTZjAahKO8NgdwS6/kpSxCG
 6UIbdRw2c6HhI1ix/UyS8HYTyY0m9tYaOmm14Rsr6qcAe/zfhmXQ2CsO1CulSyvNMX
 TKD+NzBB2NT3A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=luDIZs9c
Subject: [Buildroot] [PATCH next 1/1] package/spice: re-enable on all cpu
 architectures
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Buildroot commit [1] restricted spice compilation to x86 only.
As the log of this commit mention, this was because at that time,
spice 0.12.0 was generating an error on untested cpu architectures.
See [2] (we can also see that armv6+ platforms was apparently
supported).

Spice commit [3] (first included in spice v0.12.6) relaxed this error
to a warning. The reason was that big endian support was improved,
and also there was an intent to make testing easier.

This commit removes this i386/x86_64 cpu architecture restriction.
It reverts the commit [1] and also adds the dependency on
BR2_USE_MMU, as it is needed by libglib2. This dependency was
missing, but was implied by the cpu restriction (as all i386/x86_64
cpus has a MMU). Spice also needs a gcc version with C++11 support,
including with std::list allocator which correspond to gcc >= 6.
See gcc commit [4].

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/4f452a86b8523d90ffa7a94cb1d540e574ceb165
[2] https://gitlab.freedesktop.org/spice/spice/-/blob/v0.12.0/configure.ac#L60
[3] https://gitlab.freedesktop.org/spice/spice/-/commit/f80eef8f9ca04f923752efbda043ab856801be8a
[4] https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=cc7f3d0eeef05fb8fc11384a9a29afae10a54cc7

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/pipelines/1556927270
---
 package/spice/Config.in | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/spice/Config.in b/package/spice/Config.in
index ca5c562ca1..4ef4376a5a 100644
--- a/package/spice/Config.in
+++ b/package/spice/Config.in
@@ -1,14 +1,16 @@
-comment "spice server needs a toolchain w/ wchar, threads, C++"
-	depends on BR2_i386 || BR2_x86_64
+comment "spice server needs a toolchain w/ wchar, threads, C++, gcc >= 6"
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_INSTALL_LIBSTDCPP
+		!BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_6
 
 config BR2_PACKAGE_SPICE
 	bool "spice server"
-	depends on BR2_i386 || BR2_x86_64
+	depends on BR2_USE_MMU # libglib2
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_INSTALL_LIBSTDCPP
+	# Needs gcc >= 6 with c++11 std::list allocator
+	# https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=cc7f3d0eeef05fb8fc11384a9a29afae10a54cc7
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_6
 	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_OPENSSL
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
