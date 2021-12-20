Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70B62C433F5
	for <buildroot@archiver.kernel.org>; Mon, 20 Dec 2021 09:44:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0731D40573;
	Mon, 20 Dec 2021 09:44:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ph1zFfYIw4Gf; Mon, 20 Dec 2021 09:44:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1811440494;
	Mon, 20 Dec 2021 09:44:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B440F1BF3F6
 for <buildroot@lists.busybox.net>; Mon, 20 Dec 2021 09:44:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9537284BDC
 for <buildroot@lists.busybox.net>; Mon, 20 Dec 2021 09:44:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xBo76tfZApNa for <buildroot@lists.busybox.net>;
 Mon, 20 Dec 2021 09:44:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 94C5F84BD6
 for <buildroot@buildroot.org>; Mon, 20 Dec 2021 09:44:23 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id t18so18750616wrg.11
 for <buildroot@buildroot.org>; Mon, 20 Dec 2021 01:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tbpkfB4LuJtg91dUEtxqWgucWt3jl5swdYFjAcp+UJY=;
 b=cC+TGMhkdvG678DbTE+gpmNHxveDDWn64qDmpOqbi3mThQqxVl04CZGLwT+skU1YEh
 XOcrnHPyAyYaQdnjl4V2cxrpqUZBotv7x2OEqoonIAEjBmEXmZguJTcv/Bnp23CzZD3o
 deWCQdg/GG0aXqS1oL4eem6rkUrMOB5Rys1POm2F6vZ4Av06+MOvN+m8kONcYKvqV3o3
 /kLGIkfSSyVByl0ZDKQRrnAwyuI8njjadsyUOqfdhfmNRuBpX/w0ZtmojrpvqU8g8BBu
 MPJpsEx5DtM1IQDUkZsWTpg7gUvX0SAL42lV9GE2cEUJhj5zxx4qBm2MC6K87dh/rA9D
 RpNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tbpkfB4LuJtg91dUEtxqWgucWt3jl5swdYFjAcp+UJY=;
 b=FrvFtiNeqoEa7Y3O2trUrhvmr5gZqpLsWUK1HNiYBUB6mbkEeNzpkr+wCYyhLFAdCU
 YO/948FRG1iVCsVs2ifHWBy5g6ShRFUpi9l+D4nlH+t0FALK3j1EJKVCk/f0FtOZyak7
 Xv7L+5ibxS4l5VpEB7cWR1V0DM4zPjLRDoUiWYM/H16j4VArs3DBhAYQA8E58TIOyRq9
 5qV963cda3Q/qnUdzCBOE+L2zimla+X+qnyOZCIWEhNmZLgogQmLaa/NpS5WqftOtLQ+
 4jWAHLnhmL2dj/8OYamCFl95qX7Aozp52l6qKuBiVOP/7dGxrDJ9M3sBtStiu1MXnDCp
 vv5g==
X-Gm-Message-State: AOAM53243AqBCEK3IaUDnIYUZl+NoH9EtGX7rLLDJQY40EVyHE9c4GOH
 sZOPK76+6G8JbmSgcYsD2+FPGXwpU3sh6Q==
X-Google-Smtp-Source: ABdhPJwUANciNF8qpQ/wxL9GUD4gtpg4g7cOPP2uVLi1PdJGZHHX1YuH17fCSOfUQrCRHf9rCq8Knw==
X-Received: by 2002:a5d:59af:: with SMTP id p15mr3067100wrr.422.1639993461866; 
 Mon, 20 Dec 2021 01:44:21 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id j13sm691520wmq.11.2021.12.20.01.44.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Dec 2021 01:44:21 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 20 Dec 2021 10:43:53 +0100
Message-Id: <20211220094353.1932638-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libmpdclient: bump to version 2.20
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://raw.githubusercontent.com/MusicPlayerDaemon/libmpdclient/v2.20/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libmpdclient/libmpdclient.hash | 4 ++--
 package/libmpdclient/libmpdclient.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libmpdclient/libmpdclient.hash b/package/libmpdclient/libmpdclient.hash
index 882a588a88..8219183c87 100644
--- a/package/libmpdclient/libmpdclient.hash
+++ b/package/libmpdclient/libmpdclient.hash
@@ -1,3 +1,3 @@
-# Verified against http://www.musicpd.org/download/libmpdclient/2/libmpdclient-2.19.tar.xz.sig, sha256 locally computed
-sha256  158aad4c2278ab08e76a3f2b0166c99b39fae00ee17231bd225c5a36e977a189  libmpdclient-2.19.tar.xz
+# Verified against http://www.musicpd.org/download/libmpdclient/2/libmpdclient-2.20.tar.xz.sig, sha256 locally computed
+sha256  18793f68e939c3301e34d8fcadea1f7daa24143941263cecadb80126194e277d  libmpdclient-2.20.tar.xz
 sha256  9574c3b0a9c31723cc3d5f32af4655a015fff5ec6ec8115b7906cd7d9623cf32  COPYING
diff --git a/package/libmpdclient/libmpdclient.mk b/package/libmpdclient/libmpdclient.mk
index a880980a3c..2103ef163e 100644
--- a/package/libmpdclient/libmpdclient.mk
+++ b/package/libmpdclient/libmpdclient.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBMPDCLIENT_VERSION_MAJOR = 2
-LIBMPDCLIENT_VERSION = $(LIBMPDCLIENT_VERSION_MAJOR).19
+LIBMPDCLIENT_VERSION = $(LIBMPDCLIENT_VERSION_MAJOR).20
 LIBMPDCLIENT_SOURCE = libmpdclient-$(LIBMPDCLIENT_VERSION).tar.xz
 LIBMPDCLIENT_SITE = http://www.musicpd.org/download/libmpdclient/$(LIBMPDCLIENT_VERSION_MAJOR)
 LIBMPDCLIENT_INSTALL_STAGING = YES
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
