Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C04A4C433FE
	for <buildroot@archiver.kernel.org>; Mon, 20 Dec 2021 12:59:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5441083E7F;
	Mon, 20 Dec 2021 12:59:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8m_2OV2DxoKk; Mon, 20 Dec 2021 12:59:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2D8F83DF7;
	Mon, 20 Dec 2021 12:59:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EBF1B1BF20D
 for <buildroot@lists.busybox.net>; Mon, 20 Dec 2021 12:59:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E78AE405BD
 for <buildroot@lists.busybox.net>; Mon, 20 Dec 2021 12:59:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mLmgT2ArsJER for <buildroot@lists.busybox.net>;
 Mon, 20 Dec 2021 12:59:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D2644405A4
 for <buildroot@buildroot.org>; Mon, 20 Dec 2021 12:59:23 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 j140-20020a1c2392000000b003399ae48f58so9505085wmj.5
 for <buildroot@buildroot.org>; Mon, 20 Dec 2021 04:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qyo6oW/zJsJtheF8FL2iqBCSyrpjWmdNPYfjliOvYis=;
 b=UTeTc3tRxv7xRJxGhbgPa9p0YMrcn/Dw4Z0yJSr4S3Ocs2T+p06C6pWe3zkFWMpzMQ
 5whAtYgd+2+Qt4pk7d6KCj2AtPLtOlDmwf34DytHQLqWfUP9/G6YsjmeIR2ihz08dZys
 GojCukUOzFwzo/oBnjdjBNTAV9AVBRAH1+oXZHRzXx6G5pOryCMtYI30WXAuGXmTTddf
 BDoPAlvLRXKQbkXIbfC7gw6A1Ybti34RyPDtZIu8ZbbLGMye8Yt/TyT32y7GXqJrZ+WH
 TxKhvOUol4AagFHO4Qk6pdF2sRfCq+EWlMSHj45GaUadLZpSov5EtMXM6k569fO/N4CL
 zc9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qyo6oW/zJsJtheF8FL2iqBCSyrpjWmdNPYfjliOvYis=;
 b=W2bbLfqBlmrUyE8HY09750IhJjr/Ty+Uy/xIdzMVwET/pttkMlfZHugCQxETdp05NO
 FW2ChtvgVif7u+4V1IPYPJ2fcB7ozl9rfNvJb1Oyp7KUf6mUi1hVN1ezskGVTVX/0sOO
 6pWFmW8AbrmNWN30CtL+YM0QmD3MQN1g5y8gg2amTMkFOeNHbBNzhm69V5zI5y7bd2GV
 W7HKbcoFoyQpJgwLf1KH0BZFY+p2/S+EHprXpPp6HnLkuyy0fTEpAJRauD1dRxoxOlUQ
 nvl0uG5PgL52PASY/1FeB4D9wEhlVboD3ZTYFe02g64eVNFpQPnjhvWiAdBhGylHX49O
 SVKQ==
X-Gm-Message-State: AOAM531P7MCBLuEL8afg3JtdPAnzZqmWxvffdgQZuBYAoaqFwRUOxPIW
 DiafHB4+M53fuYKsmKAtrTiU5pXLSSLK4w==
X-Google-Smtp-Source: ABdhPJzutpdsekVK+wRMb8Ps4Orze/saz+7U7XYGe7gRGpDhRXlLz8q9mTQGXYQHL52jgzX+3xuOmw==
X-Received: by 2002:a05:600c:3ac3:: with SMTP id
 d3mr20580592wms.174.1640005161819; 
 Mon, 20 Dec 2021 04:59:21 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id bg34sm19909499wmb.47.2021.12.20.04.59.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Dec 2021 04:59:21 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 20 Dec 2021 13:58:44 +0100
Message-Id: <20211220125844.2187408-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211220125844.2187408-1-fontaine.fabrice@gmail.com>
References: <20211220125844.2187408-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/mpd-mpc: bump to version 0.34
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
Cc: Thierry Bultel <tbultel@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://raw.githubusercontent.com/MusicPlayerDaemon/mpc/v0.34/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mpd-mpc/mpd-mpc.hash | 2 +-
 package/mpd-mpc/mpd-mpc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mpd-mpc/mpd-mpc.hash b/package/mpd-mpc/mpd-mpc.hash
index 9c55bcf03d..4f4af9a91d 100644
--- a/package/mpd-mpc/mpd-mpc.hash
+++ b/package/mpd-mpc/mpd-mpc.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  4f40ccbe18f5095437283cfc525a97815e983cbfd3a29e48ff610fa4f1bf1296  mpc-0.33.tar.xz
+sha256  691e3f3654bc10d022bb0310234d0bc2d8c075a698f09924d9ebed8f506fda20  mpc-0.34.tar.xz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/mpd-mpc/mpd-mpc.mk b/package/mpd-mpc/mpd-mpc.mk
index d5a981d70e..00d1964fe6 100644
--- a/package/mpd-mpc/mpd-mpc.mk
+++ b/package/mpd-mpc/mpd-mpc.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MPD_MPC_VERSION_MAJOR = 0
-MPD_MPC_VERSION = $(MPD_MPC_VERSION_MAJOR).33
+MPD_MPC_VERSION = $(MPD_MPC_VERSION_MAJOR).34
 MPD_MPC_SITE = http://www.musicpd.org/download/mpc/$(MPD_MPC_VERSION_MAJOR)
 MPD_MPC_SOURCE = mpc-$(MPD_MPC_VERSION).tar.xz
 MPD_MPC_LICENSE = GPL-2.0+
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
