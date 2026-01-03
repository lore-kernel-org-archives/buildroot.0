Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC62EFC617E
	for <buildroot@archiver.kernel.org>; Sat,  3 Jan 2026 13:26:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AAC26820BE;
	Sat,  3 Jan 2026 13:26:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mRAjtow3fprj; Sat,  3 Jan 2026 13:26:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D201B8137A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767446807;
	bh=OPpWR2jc/ZFVCEc0OgaZYY3j2sAY8Vm10X6s5aGZXSI=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q22y1vcNlylD0MQ3WvXTuBIIyqemDINf6RXf+fVhzw27Kfm21zjBI82xLwxoTpbAa
	 7LRn45jNz/DYQPHMtwexs3GYTobJtTa6mW3XLm7AhHQW/xGvL0HDjdMBZlnynHfbuK
	 0MORJAZr5RLMhw+cP75zCMUVuTYmoQtYdSBU7pos3myCJn2ObVEDAx36Ft0dOpuTg/
	 gePVBEK/dTKESHnbvQQOa0iNzhF/SHmUkFHaGAg2mljXyJWSTh9bGyqTddIPgzr7O5
	 K6MKCXXEPKCfrSx1KNDa2Y9Cc24HR+RchP3121HKeBjGLcKiYzdMpMSoQB795MTdJs
	 njiv8R+qVA8qQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D201B8137A;
	Sat,  3 Jan 2026 13:26:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9FC31440
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 13:26:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 85C266059E
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 13:26:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z4It3r0-L0PM for <buildroot@buildroot.org>;
 Sat,  3 Jan 2026 13:26:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 76CE660AC8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76CE660AC8
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 76CE660AC8
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 13:26:45 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0cbc.dip0.t-ipconnect.de [91.58.12.188])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 28AC3A4C332B;
 Sat,  3 Jan 2026 14:25:59 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51748)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vc1dh-000000000rJ-45cm;
 Sat, 03 Jan 2026 13:25:54 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Jarkko Sakkinen <jarkko@kernel.org>, Petr Vorel <petr.vorel@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat,  3 Jan 2026 14:25:52 +0100
Message-ID: <20260103132552.3979708-6-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260103132552.3979708-1-bernd@kuhls.net>
References: <20260103132552.3979708-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767446759;
 bh=m4Z8l1CtUdNVsSpnsDyl+utkomJ9Akp22X2BQWov364=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=EnHFXfXzps6SZ6QDf/Jj9dNAftOWTBuRppvkgXWE/wO50yag1JKKTJrGj4xTQAvwC
 af9DIj2+J602J3y3o+VygKallqDsRV8MIguhlLTg+9CJMuaoOnIckXjWXssOWyJFO9
 OwWpewBfFlHGYiR6MEZyOhG+n8OLvL+DmvyCN2ka+tR6OnrTsSnnVn7xST7Nj5spw1
 Ba+B2UROEQA4Z1gr8Dxu0coFVMIRwETWKLrxJ2IncXfQ6NkJy+eq3GlVaXT6KF35EU
 +8b8rNPLComNaRiog2TcNRqD5vmESqRH7+7+e+gxYJtQhOvYd/r5K1S5JGhETTRlVR
 SLcLVudPpbkHQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=EnHFXfXz
Subject: [Buildroot] [PATCH v4 5/5] package/snort3: fix build failure due to
 missing BR2_PACKAGE_LIBTIRPC_RPCDB
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

Package snort3 requires libtirpc rpcdb option enabled with non-glibc
toolchains since the bump of libtirpc to version 1.3.7 with buildroot
commit 3f3d6e43de9b4aac7df8545fd811171256f878d3 which includes upstream
commit:
https://git.linux-nfs.org/?p=steved/libtirpc.git;a=commit;h=7cea8ad66aecc21e6caae330b5d31075af399193

These build errors, caused by the forementioned upstream commit, only
occur with non-glibc toolchains:
https://patchwork.yoctoproject.org/comment/30091/
"but I believe it breaks the build with musl".

The build error during configure stage:

-- Looking for getrpcent - not found
CMake Error at cmake/sanity_checks.cmake:51 (message):
  Couldn't find an RPC program number database implementation!
Call Stack (most recent call first):
  CMakeLists.txt:31 (include)

was not yet found by the autobuilders but can be reproduced by this
defconfig:

 BR2_x86_64=y
 BR2_x86_corei7=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_MUSL_BLEEDING_EDGE=y
 BR2_PER_PACKAGE_DIRECTORIES=y
 BR2_INIT_NONE=y
 # BR2_PACKAGE_BUSYBOX is not set
 BR2_PACKAGE_SNORT3=y
 # BR2_TARGET_ROOTFS_TAR is not set

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/snort3/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/snort3/Config.in b/package/snort3/Config.in
index 9b96e7cb58..7171603aa3 100644
--- a/package/snort3/Config.in
+++ b/package/snort3/Config.in
@@ -17,6 +17,7 @@ config BR2_PACKAGE_SNORT3
 	select BR2_PACKAGE_LUAJIT
 	select BR2_PACKAGE_PCRE
 	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	select BR2_PACKAGE_LIBTIRPC_RPCDB if BR2_PACKAGE_LIBTIRPC
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_ZLIB
 	help
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
