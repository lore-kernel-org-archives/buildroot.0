Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6E2BC5AD5A
	for <buildroot@archiver.kernel.org>; Sat, 15 Aug 2026 15:33:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56DAD80F0F;
	Sat, 15 Aug 2026 15:33:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fc30Gsgghoam; Sat, 15 Aug 2026 15:33:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6BA8C80F18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786808011;
	bh=NMFirQXrXIhkOgbxyk0dq8xNXHV8M2LXP71njbvliqo=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RFFuyb3wX5x5094Hl9nzPKQiKiuCUZbCRYdfTf/JyFRkyok9iGRZpDazngvJ1QN/O
	 Ol22K8zAh0SV/QYJLR3avoztt2pNcblAk31kBzHGYxhOfzyB66yyKrUFuQBZXP/6/v
	 NKwaPvuFFd57q5Q1z3QBjS5wtKDvjPfF1TC9abG/4vAbXvXsJoLEowjZgrtpaBZjSW
	 Cc4MVTOJCIMAYVRzWwIjDdHA4GZvd8YK3AegMCt2fgWiiQL2PakLeLiINfSZDMcFQY
	 ku46hAEQSDTt2XChE1dVof/Qy6LsQ+lBYPOxfJrGmZJiPxc8yjkoLj5j8U/M5sOuUj
	 ieLzUVg4Lahjg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BA8C80F18;
	Sat, 15 Aug 2026 15:33:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 26CEA392
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 15:33:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 189A5405B3
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 15:33:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O79RUzm8R2Sg for <buildroot@buildroot.org>;
 Sat, 15 Aug 2026 15:33:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 147AD405B1
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 147AD405B1
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Ja16jdMi
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 147AD405B1
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 15:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1786808005;
 bh=mWmVvTmUEbiQcUluy3e04r26BNfpWOiLRB8u6aJibNM=;
 h=From:To:Cc:Subject:Date:From;
 b=Ja16jdMi2u5Tqiey/wxHTuzuEvaJLFrBLDRdH/jTjjW2Hf/kvEYu5znYE8zhHcxXd
 izpGV6zSmuDmhD8mW0D1Kupg3d3WbpaLpO964eNsY/AIZpZlm1qCp447DYBg3qi42f
 S2GBj5yWFuPXTXsLGvTfIemDqLext+LFhcm1zVtQCiaHz6VysUD0hlc0eS06vRYYgi
 +Ed1oBlrXhpEuUqv3nSHXCTsqpLiqi0tdBggAzrU80hGRMfHLZYumLpFdG82YLc6A2
 bke8NiB7cyNLUGdwTVGuTfiueLEZBhhm2XZh1IssSLOg/MnpENA/muD3GDEC0YYbAH
 NnB6N9vlyJAAA==
Received: from fli4l.lan.fli4l (p54a1bf47.dip0.t-ipconnect.de [84.161.191.71])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D488EA4C4D2A;
 Sat, 15 Aug 2026 17:33:25 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44006)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.5)
 (envelope-from <bernd@kuhls.net>) id 1wvGNx-000000001Wb-0wnG;
 Sat, 15 Aug 2026 15:33:25 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
Date: Sat, 15 Aug 2026 17:33:25 +0200
Message-ID: <20260815153325.349674-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 26.1.7
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

https://lists.freedesktop.org/archives/mesa-announce/2026-August/000864.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/ae0ae767c1695daa739521f2f5da83d692404764

but needs
https://patchwork.ozlabs.org/project/buildroot/patch/20260813213348.3653337-1-bernd@kuhls.net/
to fix a build error unrelated to this bump.

 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index d887d45325..0ce4b15dfc 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 26.1.6
+MESA3D_HEADERS_VERSION = 26.1.7
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 42c9e0a59e..34ffd95e8f 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2026-July/000862.html
-sha256  5296b88a0f1e012e2cb9ada150a2bbadf728ca81e5a4fb2ab43c83a4d2158606  mesa-26.1.6.tar.xz
-sha512  6746b73f5b87e8ff3723eee586b4b5f033dbe6d13cd0309d743b7fa484c350268859ec8ff21aadcbca7a04070cdaa7828146dd28dde4b1935bb879891d687f0b  mesa-26.1.6.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2026-August/000864.html
+sha256  25e0a669e6638c3563e7be32a0a09f1888317e6eed0d047dc41d49dc8de26c7d  mesa-26.1.7.tar.xz
+sha512  9acc75c3d6386f90cf761dfa42e72b1c36d399a6905127d18aa3eb84d665502da7c3cebead82fdbca91ad510673ba7e296b5e148602d6db7e79172d6155f3ec5  mesa-26.1.7.tar.xz
 # License
 sha256  0d1a0472ecc81830e75c20d59b0ea02841e3db21255e0ebad97ab682c54d6615  docs/license.rst
 sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  licenses/MIT
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 8e6f0bc125..99ef0f5edb 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 26.1.6
+MESA3D_VERSION = 26.1.7
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
