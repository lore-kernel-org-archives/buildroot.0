Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCBE2D3B7D5
	for <buildroot@archiver.kernel.org>; Sat,  6 Dec 2025 21:38:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76BCB60782;
	Sat,  6 Dec 2025 21:38:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id noSKpgsqZkqV; Sat,  6 Dec 2025 21:38:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E2EC6078D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765057105;
	bh=RUuQ/wCxMrCVFerqjYNXiutsB41JMUVUwVKHxgzxt6w=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kEd+9ktDoVx42iVo0I6Kyxzhx3CjIkLTBBP9dOoOBkAs4T/PlkIVdD8bY8b5zD4nW
	 cVC8iWJxgyDd6fWGr1O7h3+iOOkrtfO8utk4OLbxxndEW8zs+peYPUrqvAKxI9+eH/
	 XQlOat/lgeY313/KEMpYAnLaUyONmv632mWBkUZrL6SWtLHD6Nl6uZrFG0H/k2/3yP
	 t/gmuf9l1i+fY38HT617MZkjDlAYgNW4FfbYI/6aYz4ozc+T+edg+jXsXytE0mqrO0
	 4hEo7Quf2+d8gfzHN2Q/ErrMVIlOp4vmU29uYbPxH3CGpQ/iKeoCAnJ1qk/MywdkNe
	 2JKM7uMQIHEbg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E2EC6078D;
	Sat,  6 Dec 2025 21:38:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C290E7
 for <buildroot@buildroot.org>; Sat,  6 Dec 2025 21:38:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3E7DF4025D
 for <buildroot@buildroot.org>; Sat,  6 Dec 2025 21:38:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WpMqtMbGK-eV for <buildroot@buildroot.org>;
 Sat,  6 Dec 2025 21:38:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DC62440107
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC62440107
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DC62440107
 for <buildroot@buildroot.org>; Sat,  6 Dec 2025 21:38:21 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7B588A4C02C4;
 Sat,  6 Dec 2025 22:38:18 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49910)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vRzyr-000000006E4-367S;
 Sat, 06 Dec 2025 21:38:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  6 Dec 2025 22:38:18 +0100
Message-ID: <20251206213818.2301716-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765057098;
 bh=08rSonr3Hooc8XdNuzcK6+cjFwd05WpbfreNbxgUbKU=;
 h=From:To:Cc:Subject:Date:From;
 b=WY+NOeTnpe7bxyO4acpUFfQQEIc8PdSRYH+eGDQQKo7w2LbnkKm5wACeNGpebATZr
 LFSCWKyNlo9MyQ7w81+VLaYDdrfPVWIgzgYC1s2DW8Xsboxt5cUoNxWgNSWVNWGDtm
 LuctecX34kkv2GO38pYOxzUWa6thcZfHS7dLI49Qpe+3OCnFjbeg/sQyNrtQB4K/w7
 JX3k0mUnF/YSLKAnKcPeNmOS/p1vbtf/wUCcXgkw4HhEXmfN6AYgiIWOtTB/1O5EKP
 BWkW81qnkhmmIm70pO9T7IpdI2MuRoT6sQRCvwel3dagF+oGPVFHQ7YbRJDnPjQAK2
 p0OyaQlV9XKNQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=WY+NOeTn
Subject: [Buildroot] [PATCH 1/1] package/ficl: update SITE
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

Upstream moved the tarball to another folder:
https://sourceforge.net/p/ficl/news/2025/07/ficl4-is-retiring/
and also retired the package.

This patch just fixes the download problem.
CC'ing Francois to ask whether the package should be removed until a new
version 3.x is released.

Fixes:
https://autobuild.buildroot.net/results/125/125fa1c0a3b37b4d09389a49640b90121838c665/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/ficl/ficl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ficl/ficl.mk b/package/ficl/ficl.mk
index af900fa2cf..c0698a3433 100644
--- a/package/ficl/ficl.mk
+++ b/package/ficl/ficl.mk
@@ -6,7 +6,7 @@
 
 FICL_VERSION_MAJOR = 4.1
 FICL_VERSION = $(FICL_VERSION_MAJOR).0
-FICL_SITE = http://downloads.sourceforge.net/project/ficl/ficl-all/ficl$(FICL_VERSION_MAJOR)
+FICL_SITE = https://sourceforge.net/projects/ficl/files/OldFiles/Ficl4%20%28retired%29
 FICL_LICENSE = BSD-2-Clause
 FICL_LICENSE_FILES = ReadMe.txt
 FICL_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
