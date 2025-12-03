Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D614D1BDE7
	for <buildroot@archiver.kernel.org>; Wed,  3 Dec 2025 22:05:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01A3040A70;
	Wed,  3 Dec 2025 22:05:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ew5ZH5QRiR-Q; Wed,  3 Dec 2025 22:04:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE71D407B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764799498;
	bh=ciBv4dnbrYoxcxGsXYnRE2L+timZNhR3dN6PbSNh5Ic=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=TqNwxS5Pi18vmPAx/FofjNp6XV2wku+6knvaHZ2pp1wbZV6lhJM0g7JvnMZ6S9hgO
	 CuGJdx8IxFETw/qGyAoG+ycIEWrgTPAG8vyRsE/wiJtVEB58CD+EhxsYKY7MC5r+Ix
	 7erPOj7D6/+7dxD8qUVVXGQ2riBvQ9DhJE+yi39QPs6K7kcyvVh7/HpNACPPQPdX2E
	 kyLU10fnnAXlbU9eoVrIKq21qamuOm7AyQCYG64xmnGsXY1pcJdR+uIrWVocpQc8su
	 rnGEdSncXO/3yzQOTRfH69ykHKLuMgC3tjupvLgJcJB/JNbWfOF8n+Qlr7SrjZW+Sp
	 1b2zFF56hJlmg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE71D407B2;
	Wed,  3 Dec 2025 22:04:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C7069E7
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 22:04:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ADA3D61B42
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 22:04:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rg90727kfpY7 for <buildroot@buildroot.org>;
 Wed,  3 Dec 2025 22:04:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9EF5F61772
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9EF5F61772
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9EF5F61772
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 22:04:56 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 49FACA4C79D5;
 Wed,  3 Dec 2025 22:59:07 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56204)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vQuqi-000000002OS-0RP6;
 Wed, 03 Dec 2025 21:57:24 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  3 Dec 2025 22:57:19 +0100
Message-ID: <20251203215723.2323032-12-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251203215723.2323032-1-bernd@kuhls.net>
References: <20251203215723.2323032-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1764799147;
 bh=KSjGMiOrynvV8HSDYMYO7G9d3wKkM0jnnlEhT9nnZdM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=FZGD89QUByST0egWRdX0xfImnW/APiWdxMPbMejKb4/WpJQhu7CxBVUThVb8/NA/A
 7fvH7vPnII6Ea9IBwH/sf6OvzHSAQ7HfxFGrffk2v/kx1Uy2dn2iQ9E/gjanVT6q4f
 ROkhoM00zRw0JMiDLqhkH5jH2iHDWDkM5kqFMYCXnQ1AS8zUv4hxS4cCANnabWJcYr
 g+6N2ms4n8+P4N0GYb7lRFJ+DAX8QX2lBuJl2BPjJ/PoVz/pxRg0ppQ5vLXBb8Jyru
 ocP2hDu6uMGCIZdkIztQOIUB0xL0C+ZtyqLlYcU2MmlCYIQ3uXyvsZDC/iceCAU7NT
 VheZKN2zqKpZA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=FZGD89QU
Subject: [Buildroot] [PATCH/next 12/16] package/libubox: bump version
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, RJ Ascani <rj.ascani@gmail.com>,
 Daniel Nicoletti <dantti12@gmail.com>,
 Sergio Prado <sergio.prado@e-labworks.com>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This bump includes patches which add cmake4 compatibility.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libubox/libubox.hash | 2 +-
 package/libubox/libubox.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libubox/libubox.hash b/package/libubox/libubox.hash
index eb37d33230..127abf432c 100644
--- a/package/libubox/libubox.hash
+++ b/package/libubox/libubox.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  df6e1350fd11016ef30242a279cec195d91e6748c11c40e0991593718c46fa52  libubox-3868f47c8f6c6570e62a3cdf8a7f26ffb1a67e6a-git4.tar.gz
+sha256  c4432d4f902bd0a2974d3fe76620bbb5e04b9d52e55701829aa12507651bc4d9  libubox-ecddb31dc34d89be5c9dc4595a4c58070eb090e4-git4.tar.gz
diff --git a/package/libubox/libubox.mk b/package/libubox/libubox.mk
index 00ae2b0595..486f2f5c0a 100644
--- a/package/libubox/libubox.mk
+++ b/package/libubox/libubox.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUBOX_VERSION = 3868f47c8f6c6570e62a3cdf8a7f26ffb1a67e6a
+LIBUBOX_VERSION = ecddb31dc34d89be5c9dc4595a4c58070eb090e4
 LIBUBOX_SITE = https://git.openwrt.org/project/libubox.git
 LIBUBOX_SITE_METHOD = git
 LIBUBOX_LICENSE = ISC, BSD-3-Clause
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
