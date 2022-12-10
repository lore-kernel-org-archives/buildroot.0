Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1834C4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 21:41:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C9E281296;
	Sat, 10 Dec 2022 21:41:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C9E281296
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HXJSmdKG0iTp; Sat, 10 Dec 2022 21:41:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B36F6813D1;
	Sat, 10 Dec 2022 21:41:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B36F6813D1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 367011BF3DF
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 21:41:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 115AF607CA
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 21:41:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 115AF607CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6yETh1WvBUIw for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 21:41:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 01730605A3
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 01730605A3
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 21:41:00 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id d1so8438373wrs.12
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 13:41:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jiRVINog7K9okgYJ5XiBz8NvUwbrsqv0C5ruxfzs3K0=;
 b=sWaMH5NmYOzPgqBzA7j5s2DqFXP0q55SPbw0vqBi1SKE533m/FZt3+8KlWP+RoSqGX
 gtbzinSJMASv1Dd2eeK5JYZhFWYMNm52qYa71u+cXWSuw+ulOzC3w7k6ieFPaWvCJOeV
 j8TRS0R/qjVWAmLFM+XE3FuvXpwMnabFULr8MzAvsA0nr6p9KaCXWxP9kdy6jN0sSniw
 F/xNjvD3IP1IMUC9gDRq/VJoiepduovkVIAfoLL6Zw8h2rOhaez+4iNlKf/nqNiTdNc9
 Y3+NRFJxpVe++tkrnUKrfXeOhujiucgFYYMFzGuxjcjjDQVjReK3GPgB72nGm2myHbgb
 tNFw==
X-Gm-Message-State: ANoB5pkKpUfiAdjXovQ6pDzY/u0VZnwv5VU7KF/2AxNvLkq3jRWOuPQh
 JmdmibyRarHSMBX3wpcrGuVRDI2oseg=
X-Google-Smtp-Source: AA0mqf4XGqw0uA1CBj/hdvr/vvo1Ovf90o2T4H4szBB3lMtO+zaq5Kapj28HPoJVaEXruNfHrvM4OQ==
X-Received: by 2002:a5d:5243:0:b0:242:1424:6564 with SMTP id
 k3-20020a5d5243000000b0024214246564mr6963445wrc.39.1670708458648; 
 Sat, 10 Dec 2022 13:40:58 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 n3-20020a056000170300b002368f6b56desm5736906wrc.18.2022.12.10.13.40.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Dec 2022 13:40:58 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 22:40:54 +0100
Message-Id: <20221210214054.34790-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jiRVINog7K9okgYJ5XiBz8NvUwbrsqv0C5ruxfzs3K0=;
 b=Bk8hHBoYxZ9gbdQYgeWAo83mlRomiR7pyAQQPW2fzXyEcM71g8na+M5hNi0/InfEus
 JEAZh3iTiShlq2kPjV3pJLhNldc7r9J0XFo1E5PNtEp740oHDQyOFUDXU1Q+vCznxydL
 OyIV4FEhVUSpYV19DKl4XO+U5TvJVyd4uiWPb0W1S6xQ4VR9KktJhMt8oVvT6W7wgVio
 02ZRmI2jmdyjeoE0vcyUnse+C0IYQPSz8gmwyrA2vEe9LUFa1uUPE3sBoP3D4SxAaKx2
 EviMLcNIrs0jQcSFYU+vypASMQxUSlUstP8NjG396lxty4aKlqvEeSfxeS1A5385ctmE
 dFCQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Bk8hHBoY
Subject: [Buildroot] [PATCH 1/1] package/sed: bump to version 4.9
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

Update hash of COPYING (URL updated:
https://git.savannah.gnu.org/cgit/sed.git/commit/?id=5adab913a82ef1b7f844339ab209531ccf198990)

https://git.savannah.gnu.org/cgit/sed.git/tree/NEWS?h=v4.9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sed/sed.hash | 6 +++---
 package/sed/sed.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/sed/sed.hash b/package/sed/sed.hash
index bb48128526..10e2c36d8f 100644
--- a/package/sed/sed.hash
+++ b/package/sed/sed.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/gnu/sed/sed-4.8.tar.xz.sig
+# https://ftp.gnu.org/gnu/sed/sed-4.9.tar.xz.sig
 # with the key 155D3FC500C834486D1EEA677FD9FCCB000BEEEE
-sha256  f79b0cfea71b37a8eeec8490db6c5f7ae7719c35587f21edb0617f370eeff633  sed-4.8.tar.xz
+sha256  6e226b732e1cd739464ad6862bd1a1aba42d7982922da7a53519631d24975181  sed-4.9.tar.xz
 # Locally calculated
-sha256  e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b  COPYING
+sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/sed/sed.mk b/package/sed/sed.mk
index 64fb2035b0..8165083658 100644
--- a/package/sed/sed.mk
+++ b/package/sed/sed.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SED_VERSION = 4.8
+SED_VERSION = 4.9
 SED_SOURCE = sed-$(SED_VERSION).tar.xz
 SED_SITE = $(BR2_GNU_MIRROR)/sed
 SED_LICENSE = GPL-3.0
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
