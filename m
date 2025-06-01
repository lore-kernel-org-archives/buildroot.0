Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEFB6C54FB3
	for <buildroot@archiver.kernel.org>; Sun,  1 Jun 2025 20:45:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7523D40DAF;
	Sun,  1 Jun 2025 20:45:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qzFhBAumsLTl; Sun,  1 Jun 2025 20:45:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7C2740E01
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7C2740E01;
	Sun,  1 Jun 2025 20:45:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7088E127
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 20:45:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 61EBF60B66
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 20:45:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O6HPQqAzHT1Y for <buildroot@buildroot.org>;
 Sun,  1 Jun 2025 20:45:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5251960AF3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5251960AF3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5251960AF3
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 20:45:38 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a08d8.dip0.t-ipconnect.de [91.58.8.216])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 54E38A4C30B5;
 Sun,  1 Jun 2025 22:45:35 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42090)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uLpYf-000000007IZ-2d8c;
 Sun, 01 Jun 2025 20:45:29 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>
Date: Sun,  1 Jun 2025 22:45:28 +0200
Message-Id: <20250601204529.787544-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1748810735;
 bh=GlSZt1wzdvOjKH6ngpMp6NkYduo146Id+nGTwk9LlHg=;
 h=From:To:Cc:Subject:Date:From;
 b=XhznqYFIdzKKVEPcbjJAzT2/EMzx+zuUrBEDl8CQ5IihJ2t27HScg+KQ9PcvLq+o5
 5hIgozICChpHYrn9EM4Fx70fTl8qrhaHMT04JNBT7uD7/EKkWiDIsuTYyhz1YZmtOd
 W8j1GTh+puwRSsBKCnCDU1dIxc2HmPSo885Ugy4uBwW86U3rvVjGmv7nTcNptcerdj
 T3a8Vg6QKDsO96gqsFCCiP74DasOzfxoCi2Pzm9OxTcSCN621ntlGoKPNdXDlJIiUl
 pN2Jew3TOhwG2BRf9Wbk3yYeUgOv1eaN+oW1v3i/opQW/zY+xkF4eBbBoCTW8dilAJ
 TZK/MeW3a1HOA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=XhznqYFI
Subject: [Buildroot] [PATCH 1/2] package/mesa3d: fix comment for iris
 gallium driver
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

Buildroot commit 600e75b606 "remove depends on architecture for Iris/
Vulkan" forgot to remove the dependency for the comment of the iris
driver.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/mesa3d/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 99cb0b955c..9454beedf4 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -138,7 +138,6 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS
 	  Mesa driver for iris-based Intel GPUs.
 
 comment "iris driver needs llvm"
-	depends on BR2_i386 || BR2_x86_64
 	depends on !BR2_PACKAGE_MESA3D_LLVM
 
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_LIMA
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
