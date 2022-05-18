Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DCB2C433EF
	for <buildroot@archiver.kernel.org>; Wed, 18 May 2022 05:02:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 047FE60C00;
	Wed, 18 May 2022 05:02:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eazRyI9dHBJV; Wed, 18 May 2022 05:02:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B8BC607F7;
	Wed, 18 May 2022 05:02:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 720BB1BF414
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 05:01:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6120F812E9
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 05:01:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=tkos.co.il
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wB2A36c5a7rw for <buildroot@lists.busybox.net>;
 Wed, 18 May 2022 05:01:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.tkos.co.il (mail.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0B242812D1
 for <buildroot@busybox.net>; Wed, 18 May 2022 05:01:57 +0000 (UTC)
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id A61894401D4;
 Wed, 18 May 2022 08:00:47 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
 s=default; t=1652850047;
 bh=Jl/FSuV8LAlJtaNN7kBQQ6OxKXFoQw1r65Y07J++eU8=;
 h=From:To:Cc:Subject:Date:From;
 b=MZTcjASI5c1qlumQHwlBCaEZisGxadkdw2Ac7z8W1bfqGn2hjbZeZCBHmfrOc6V8v
 KHQRy8PyHfi3cPbVcI7PF/oOxrTX5lmaFkWOn+3BhzJXq8WQOJ6hUAO+CPaCl3m/b6
 PZwCwUC17WwWudfUdISDWrFT0Br04Dz/MDIwypj8qGF36G1Vcy6BdIaiScXXjS9Zu9
 lNSshJ3DSI9kbbGSixIQ2QjHBZDOcD3SAFhiFImyhImPi/9GfM2JUuqhbGC+PAP8vJ
 BmOK7/XxW0IVlClYAGsml0JuF8+hhyTJERFWryVzNnDvEXrlIhObQ/Su+Ki/7ATsir
 K1ovWOh7TOBMg==
To: buildroot@busybox.net
Date: Wed, 18 May 2022 08:01:39 +0300
Message-Id: <bec277739a5ac72c0dc81e9b0566a0c77c90823d.1652850100.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] toolchain-external: codescape-mti-mips:
 needs shared library support
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a glibc toolchain that does not support static linking.

Fixes:
http://autobuild.buildroot.net/results/8501bbeb1912e3923cba46b576b49f755c7c0072/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 .../toolchain-external-codescape-mti-mips/Config.in              | 1 +
 1 file changed, 1 insertion(+)

diff --git a/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in b/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in
index c58c55119a7b..116d4a834d70 100644
--- a/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in
@@ -5,6 +5,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on BR2_MIPS_CPU_MIPS32R2 || (BR2_MIPS_CPU_MIPS64R2 && !BR2_MIPS_SOFT_FLOAT) || \
 		BR2_MIPS_CPU_MIPS32R5 || (BR2_MIPS_CPU_MIPS64R5 && !BR2_MIPS_SOFT_FLOAT)
+	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_7
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
