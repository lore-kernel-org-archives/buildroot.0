Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B96EC636CC
	for <buildroot@archiver.kernel.org>; Mon, 13 Feb 2023 18:12:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0FF4B409EC;
	Mon, 13 Feb 2023 18:12:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0FF4B409EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AM7O3winNPQq; Mon, 13 Feb 2023 18:12:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5355D409E2;
	Mon, 13 Feb 2023 18:12:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5355D409E2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 99BF01BF289
 for <buildroot@lists.busybox.net>; Mon, 13 Feb 2023 18:12:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7392C6102A
 for <buildroot@lists.busybox.net>; Mon, 13 Feb 2023 18:12:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7392C6102A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EYSO2jxqyPmN for <buildroot@lists.busybox.net>;
 Mon, 13 Feb 2023 18:12:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39D8960FAA
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 39D8960FAA
 for <buildroot@buildroot.org>; Mon, 13 Feb 2023 18:12:23 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id a2so13178536wrd.6
 for <buildroot@buildroot.org>; Mon, 13 Feb 2023 10:12:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ww7iROaGBsqIfP1OUYFOTz4pQESRZs3+jA1MCfyPBJk=;
 b=hws8D/uckXYCu1G1cD+CJE/YsoTSSeRblz+w2wAdJ1yFZvQXZ9mCp89yo13lzpywtK
 XxtX6MpW3JinlMk/rPusQG0F9bTHTbt6pXbE0jWp6QNN26z4qS0H+Vb3erLI9Vb5jlOW
 UZrDN9KdROSWl2Mz+9odm3idJPO9oifhQzoRjrny7XyLCrPi1GClL8eJKscVoGE1EoSI
 /vsfuhtqNU7X7cmmeiaOiDR3jmeA9Wg1rWr2AM52rY34JzXBxnx472qJr8CSdc/0KRH2
 5x2z3Dzt5M4WFhAVj2aQmsgBJLikNGxmfTdxYPKogjKnvBz/oYVuuPJoFM/kAKeoPuM7
 IoMQ==
X-Gm-Message-State: AO0yUKVY6O3PuKTheRLn4M01RlnHXgluVdTy1wxp3a8lTcMEFdkLp4ft
 EG7GhnM0eAardhLei6LseukoLnDTY/4=
X-Google-Smtp-Source: AK7set/JD53knE2OtvjIsff10aKOfnP3iVsIbMJJhv1G6iEOQkpJpOF3/NusSl/kPJ2lvjHPH2L9WQ==
X-Received: by 2002:adf:f450:0:b0:2c5:5331:5516 with SMTP id
 f16-20020adff450000000b002c553315516mr5291454wrp.51.1676311941781; 
 Mon, 13 Feb 2023 10:12:21 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 g9-20020a5d5409000000b002c558228b6dsm3739445wrv.12.2023.02.13.10.12.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 10:12:21 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 13 Feb 2023 19:12:17 +0100
Message-Id: <20230213181217.908103-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ww7iROaGBsqIfP1OUYFOTz4pQESRZs3+jA1MCfyPBJk=;
 b=FDticLJVRXuKIYawW1+oNUSDRLfwiG8WOLdMOJNAzHCk5e4G2gWLRPehv6nH/mPY6E
 iG9SIE1Qv+y3uOiiWnhU4/KCJk3sm3PdlF0LOD5j2eKr1xMstASxAWzS4CdU3Fp2otYf
 KqiV8VnILu+CprSoGA+KJy+zrud6XAqeDpP/gEh9AUg6lyMsc+wJVe9gPX2dj+eJoJ76
 +5JUCK4RIHxuGj32MUbTpaGH7iqOjGwmsTK1S2lnErI07E4d0wVOahZIBpnN5sMFb2Jc
 CMf2R92RBTC8PTfDSz1HWO0tANiWyRsFIbJt6MTauSEb04lHS/r0JB6oodsg0P1u+9Ed
 4n1Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=FDticLJV
Subject: [Buildroot] [PATCH 1/1] package/postgresql: fix legal info
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 57e297a215193c92f6a178139db53616f2ee23b5 forgot to update hash of
COPYRIGHT file (year updated with
https://github.com/postgres/postgres/commit/1fbcb1360bc19b89369209203ea7cc19b8cde224)

Fixes:
 - http://autobuild.buildroot.org/results/93f40dc71619745ddc6741598c9a488c81ea440f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/postgresql/postgresql.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index e6a9bd6658..3e89d3ec35 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,4 +1,4 @@
 # From https://ftp.postgresql.org/pub/source/v15.2/postgresql-15.2.tar.bz2.sha256
 sha256  99a2171fc3d6b5b5f56b757a7a3cb85d509a38e4273805def23941ed2b8468c7  postgresql-15.2.tar.bz2
 # License file, Locally calculated
-sha256  f6d6616acdb598742e2a7c64fa0551c1c72c309d279fd2d90370e5fdd41c8945  COPYRIGHT
+sha256  1a7d13c3ab31961b91ba256f77d6e82e0b54bf992253060fe93bdb5466df416a  COPYRIGHT
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
