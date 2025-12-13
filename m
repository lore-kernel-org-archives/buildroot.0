Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01730D5AE45
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 11:58:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3CDA40C9E;
	Sat, 13 Dec 2025 11:58:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KV1w9aowM3Yu; Sat, 13 Dec 2025 11:58:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2600940A8D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765627095;
	bh=2T4lcsSsKgIhSNkXQYG5w774aUPwv63mTJXoPErNBWs=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=GolVvLCntplKiFEs2I7Ceuiw7SLfnXcL+kcPVGUYHAaVuoDR1zXmmVUyN44+9JaAW
	 4Kzd2VDOYLt9lCXUKc6R6T3I+sGt+PsSPaHV/tMecwSJsvjltcvPPHR9nBhnsMmK5R
	 thgqPA3EtjNFuK1b/yH3vDS6lye+MTu8LdmBbQsmXPZXiVX1bQu8VQ6dlmvrJqJ9AB
	 VNN3p0mbTQf2qEzVBvVFWDfwYQ9bj7fsgNQ0OD49nh1+3D46HFySom2ZBoycF2qdNf
	 zGRNAB0O/ZMk5xGcxY+xKzBhtia89GxCc9JNaoDP6YUuTfceXTAy/0qra2c27n0fTg
	 1Jwd8wvCL8HuA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2600940A8D;
	Sat, 13 Dec 2025 11:58:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 790AA13D
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 11:58:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5F99860685
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 11:58:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4Z694VPIeOY6 for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 11:58:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 47922605FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 47922605FC
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 47922605FC
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 11:58:12 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cc21.dip0.t-ipconnect.de [79.214.204.33])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 505E7A4C341C;
 Sat, 13 Dec 2025 12:58:10 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55170)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vUOGH-0000000078u-3zbS;
 Sat, 13 Dec 2025 11:58:10 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 13 Dec 2025 12:58:07 +0100
Message-ID: <20251213115809.1277255-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765627090;
 bh=AmtUAbvF7Gd2nq7JdHtiGHdj6ujuPiC28BM9ajqQPj4=;
 h=From:To:Cc:Subject:Date:From;
 b=Od8J1w5zhH/RXrdnadeUrPuM/Quyh0Safll5v5rzji136wbTLKmU1Njf0BToZ/5W2
 ylJF6QwoNO2jtjGkWJ1+il3PQdCyI7JV2W2n827/TGTSxaiWbctJvAcYJDgzHcpBGa
 79UByywRMzTWb6JMR1LLavAgDb1NkrFTzbuQp3RGqcN4Sg4gQoI/0Zfu2lvmUyXou0
 HoQEzkrtAjP6lBiD+lUX1ArbYBWjK+051xYiS7vAW8TOgdXf4Jx8hGHPM0IVbR08IJ
 GCGqStnILa3VQ9sPTVM8q6Wf7dAtI8azCf+aiook342FU5YlgsOXlnP5+Jd+rMPoA8
 Ktwktx+GXsLww==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=Od8J1w5z
Subject: [Buildroot] [PATCH 1/3] package/spirv-llvm-translator: bump version
 to 21.1.3
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/KhronosGroup/SPIRV-LLVM-Translator/releases/tag/v21.1.3

Switched version number format according to 'git describe'result:

$ git describe --tags --match 'v21*' --abbrev=40 llvm_release_210
v21.1.3

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/spirv-llvm-translator/spirv-llvm-translator.hash | 2 +-
 package/spirv-llvm-translator/spirv-llvm-translator.mk   | 6 ++----
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/spirv-llvm-translator/spirv-llvm-translator.hash b/package/spirv-llvm-translator/spirv-llvm-translator.hash
index 0263689519..85ae98337c 100644
--- a/package/spirv-llvm-translator/spirv-llvm-translator.hash
+++ b/package/spirv-llvm-translator/spirv-llvm-translator.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  8db031b9e23c1dd47154751cf74f8a3c5d5e8d92896789c6a7eb956946287677  spirv-llvm-translator-v21.1.2-5-g3c0231e56b7a9ecc4875e8696ea53d54d6776f85.tar.gz
+sha256  43080fd5122c71cd93a3d174d59b9fc95ff8aeb1847d50f394088112f6b2a217  spirv-llvm-translator-21.1.3.tar.gz
 sha256  e3bc36440fc927c62d5cc24efeefe225a14d4e34ffeb0c92e430625cce9ee444  LICENSE.TXT
diff --git a/package/spirv-llvm-translator/spirv-llvm-translator.mk b/package/spirv-llvm-translator/spirv-llvm-translator.mk
index 28bdb4d26f..0fb79e04d4 100644
--- a/package/spirv-llvm-translator/spirv-llvm-translator.mk
+++ b/package/spirv-llvm-translator/spirv-llvm-translator.mk
@@ -4,10 +4,8 @@
 #
 ################################################################################
 
-# Generate version string using:
-#   git describe --tags --match 'v21*' --abbrev=40 origin/llvm_release_210
-SPIRV_LLVM_TRANSLATOR_VERSION = v21.1.2-5-g3c0231e56b7a9ecc4875e8696ea53d54d6776f85
-SPIRV_LLVM_TRANSLATOR_SITE = $(call github,KhronosGroup,SPIRV-LLVM-Translator,$(SPIRV_LLVM_TRANSLATOR_VERSION))
+SPIRV_LLVM_TRANSLATOR_VERSION = 21.1.3
+SPIRV_LLVM_TRANSLATOR_SITE = $(call github,KhronosGroup,SPIRV-LLVM-Translator,v$(SPIRV_LLVM_TRANSLATOR_VERSION))
 SPIRV_LLVM_TRANSLATOR_LICENSE = NCSA
 SPIRV_LLVM_TRANSLATOR_LICENSE_FILES = LICENSE.TXT
 HOST_SPIRV_LLVM_TRANSLATOR_DEPENDENCIES = host-clang host-llvm host-spirv-headers
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
