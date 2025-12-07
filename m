Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3868CD2CE17
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 14:49:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F63960D5E;
	Sun,  7 Dec 2025 14:49:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HHy4hJhW8p25; Sun,  7 Dec 2025 14:49:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B441605EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765118943;
	bh=uzoHvk+dV2fMIttS0s6vaAwLulS8b1ctlDkHRgcHpJU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=NJ9OrXtxbIneiDn0nPOJ3hjLepxoY4d79ZVeUdFx39qFTjj+8WYfeOA8Zqx13OoXp
	 7eI2oOwSgh1kmn6PgIEtVZahehno6dnXWtiKkXYsNeOCTvp4q2C6Fd6vXiT6SgI8N6
	 v67UD+VpI1wgqO6ECCV2sbX7He+YBUqpjPfA8ddPye9IgjhXa2baxE+TfdZ5ey+LYO
	 e/JKWODOwRFJgsx9jAvKtjmAwY//ILZovJX3TyTKLiKsR1UNpYfsRKEWXDf75T77hm
	 MDP1CxwAmtXd8jo7ZkJYNeh9SXO22Al/jv5s1P9s5fc3QEvjI8KtkFXenCg9/yM/7y
	 lNkeu8w2TbJiA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B441605EB;
	Sun,  7 Dec 2025 14:49:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A5C4A151
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:49:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 986D84070B
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:49:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PqLZ_kqu6qXe for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 14:49:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7EDBF40708
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7EDBF40708
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7EDBF40708
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:49:00 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c020.dip0.t-ipconnect.de [79.214.192.32])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 249F1A4C1072;
 Sun,  7 Dec 2025 15:43:02 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56734)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vSFyJ-00000000416-0PBl;
 Sun, 07 Dec 2025 14:42:47 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  7 Dec 2025 15:42:41 +0100
Message-ID: <20251207144243.3696572-32-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251207144243.3696572-1-bernd@kuhls.net>
References: <20251207144243.3696572-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765118582;
 bh=ApI3wT5yyCdRKrS7j6+zwsbkaT+AfrzY5E4Lrf03FM4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=NPHY96t2YlCyHvg+UdLPqYGuA+/wD0sTkg+Xm7Fh6CRcFnH+hZbTK/YcXeaSuaWpZ
 6fOd5vzxXsC5oBZxUCPskF3auypHC7OmBkY6wM4n29mQtZcJ6li9e+Pg8fImu+hSCE
 vWoek+33KpIhR9TbmxThtWTibpAbAIxgaVrVLF1QJx3cFkVJtVgyTYw2lz37yjaiun
 AHmWst0OwMEiILWtViJqUzWwa0On5gcV6/AXx6cyTsN3S3gGD60YRwr5M61V/m7HEp
 qKuEcbmueZKhLXLd/W3FENACDGkVdalsoxz3JjmZJ7+ZEGReF+Rux/bNrkFVcgJEtv
 KXZjaSkb4yhRw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=NPHY96t2
Subject: [Buildroot] [PATCH/next 32/33] package/xl2tp: bump version to 1.3.19
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
Cc: Alexander Clouter <alex+buildroot@digriz.org.uk>,
 Jean Burgat <jeanburgat33@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 Alessandro Partesotti <a.partesotti@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Prabhu Sannachi <prabhu.sannachi@collins.com>,
 Denis Bodor <lefinnois@lefinnois.net>,
 James Hilliard <james.hilliard1@gmail.com>, Jianhui Zhao <zhaojh329@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 James Knight <james.knight@collins.com>, Simon Dawson <spdawson@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Michael Vetter <jubalh@iodoru.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes: https://github.com/xelerance/xl2tpd/releases/tag/v1.3.19

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/xl2tp/xl2tp.hash | 2 +-
 package/xl2tp/xl2tp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xl2tp/xl2tp.hash b/package/xl2tp/xl2tp.hash
index 64db273a71..d12a66da5d 100644
--- a/package/xl2tp/xl2tp.hash
+++ b/package/xl2tp/xl2tp.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  47f52b9c56cabe77766533bca3736a8198581ff38443eb4b4c8971c885ac9329  xl2tp-1.3.18.tar.gz
+sha256  a4270e00c65f8ef356cab350a0375fbd26a63870eedf0a7d07b2ff1f71b18995  xl2tp-1.3.19.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/xl2tp/xl2tp.mk b/package/xl2tp/xl2tp.mk
index e0205d4ecc..55047e6557 100644
--- a/package/xl2tp/xl2tp.mk
+++ b/package/xl2tp/xl2tp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XL2TP_VERSION = 1.3.18
+XL2TP_VERSION = 1.3.19
 XL2TP_SITE = $(call github,xelerance,xl2tpd,v$(XL2TP_VERSION))
 XL2TP_DEPENDENCIES = libpcap
 XL2TP_LICENSE = GPL-2.0
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
