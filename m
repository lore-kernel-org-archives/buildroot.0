Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 999D4D1CDC6
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 14:48:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E40E812E6;
	Sun,  7 Dec 2025 14:48:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8UT8_Chs0xXB; Sun,  7 Dec 2025 14:48:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2454821FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765118881;
	bh=j2sX9Ec1Ohhm2RBH1EB0z+GnAqxil0NkzKfOb3AXajo=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=A/l+0giEZEtxdM3Aq8tTkfXlWjYVCmkZnw1Ftt7OdVeJsig894hQ5CSoy7Ymi+g+r
	 IzYvZPTrSOcIJdCJJlwkIJhg/BtUkV0j1yDlX3HQmHJ7IcTA7t2i76gGrrO1Ek9I5c
	 zwSKoHO5fHZU95ocqXBD4Akkrd7QWixqx5LherkVFyZvEnlcca3M1IcGq5FmuwBJIO
	 qtDOjkAhuijv0tebzhkIWwoMQxiUqFEGyhjnWcSkmYhu4WmnbN3xq0vJmp1SgbD6p8
	 aCj+pT5wNu+instUuzpMEF0S1PfTNhL7f4LUWCoVVWuVKWWB0qkLziM4DsiCwJcRFl
	 Dm7tfc3G01E5Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2454821FB;
	Sun,  7 Dec 2025 14:48:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D7AF3151
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:48:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BDA33605C3
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:48:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d_upLY6jQULD for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 14:47:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AC57C605B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC57C605B1
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AC57C605B1
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:47:59 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c020.dip0.t-ipconnect.de [79.214.192.32])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C7D5EA4C0F27;
 Sun,  7 Dec 2025 15:42:59 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56734)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vSFyI-00000000416-2Yoi;
 Sun, 07 Dec 2025 14:42:47 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  7 Dec 2025 15:42:36 +0100
Message-ID: <20251207144243.3696572-27-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251207144243.3696572-1-bernd@kuhls.net>
References: <20251207144243.3696572-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765118579;
 bh=5zk4iUD0AyxqrzEEjit1jZej05NIq/b6gjvGCZT9HRY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=V3HFsNN5kIikxQeO+ar8dVDOrDY3ZyqsrSw9QMg8eUZt2mVgV0TcRPt8uP6fAzGol
 uegabNyN7VvpdNeHd+XHI5yCRg7ThttbiTwTeFt6tcjkds7u+InHYdEwUdCVJdhgun
 OS3n1Gy9DPMohIcXP6peTtzzObDnWbJmFlltFFPu5x5jXA94jofwzhjaRwMBgJ0RdF
 8RcHaNv0X03rzIhe29Wi/Orsiabcr54N9xXQjlx8SrnW/isCAYn7RoGroGQDZ6UVRZ
 rQrmBQXZofpQOa2t6XyknWteARGLmbLHKzz4+GLNNshL6PLR9dEPQQ+YoeiNLAcqEu
 pj7sVEO+WIzmw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=V3HFsNN5
Subject: [Buildroot] [PATCH/next 27/33] package/x11r7/xapp_xlsfonts: bump
 version to 1.0.8
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

Release notes:
https://lists.x.org/archives/xorg-announce/2024-March/003461.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xapp_xlsfonts/xapp_xlsfonts.hash | 6 +++---
 package/x11r7/xapp_xlsfonts/xapp_xlsfonts.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xapp_xlsfonts/xapp_xlsfonts.hash b/package/x11r7/xapp_xlsfonts/xapp_xlsfonts.hash
index cd8ae4f368..786f5437ad 100644
--- a/package/x11r7/xapp_xlsfonts/xapp_xlsfonts.hash
+++ b/package/x11r7/xapp_xlsfonts/xapp_xlsfonts.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-April/003151.html
-sha256  7b726945a967b44c35cddee5edd74802907a239ce2e2e515730b8a32c8e50465  xlsfonts-1.0.7.tar.xz
-sha512  ec82be0a97500a9e64fb5a6adbbec470b249b1267c3081c2bd44cd3e7148107517d1234c1da2f81b0405230ab03ad2943ea53756c3380f4d561665b38d0cedc0  xlsfonts-1.0.7.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-March/003461.html
+sha256  807f909eace684b866fc63b3e962729c120822a6c96e051ff51cf350b3ffb6cd  xlsfonts-1.0.8.tar.xz
+sha512  401c86d902f173c440c08a22067a51e7238949c8d3c71eba7a8df11955edfec27525c8cbbcf2e96ed444fa20b15f98cf65a01343215d1ed9ba84fce849d02927  xlsfonts-1.0.8.tar.xz
 # Locally computed
 sha256  dcdf5fa36a652efbe61a21def1301739b0010334ae3f049f1cff433221a8c7a5  COPYING
diff --git a/package/x11r7/xapp_xlsfonts/xapp_xlsfonts.mk b/package/x11r7/xapp_xlsfonts/xapp_xlsfonts.mk
index f8a35e5638..0992f572e8 100644
--- a/package/x11r7/xapp_xlsfonts/xapp_xlsfonts.mk
+++ b/package/x11r7/xapp_xlsfonts/xapp_xlsfonts.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XLSFONTS_VERSION = 1.0.7
+XAPP_XLSFONTS_VERSION = 1.0.8
 XAPP_XLSFONTS_SOURCE = xlsfonts-$(XAPP_XLSFONTS_VERSION).tar.xz
 XAPP_XLSFONTS_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XLSFONTS_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
