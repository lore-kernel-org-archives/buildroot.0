Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6754EC43334
	for <buildroot@archiver.kernel.org>; Wed, 22 Jun 2022 21:03:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E3E8960C1D;
	Wed, 22 Jun 2022 21:03:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E3E8960C1D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iqbdmGSVBc7A; Wed, 22 Jun 2022 21:03:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EAF7460B9B;
	Wed, 22 Jun 2022 21:03:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EAF7460B9B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7FF011BF3B9
 for <buildroot@lists.busybox.net>; Wed, 22 Jun 2022 21:03:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 67BA660B9B
 for <buildroot@lists.busybox.net>; Wed, 22 Jun 2022 21:03:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 67BA660B9B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v_dNnlUu1FEP for <buildroot@lists.busybox.net>;
 Wed, 22 Jun 2022 21:03:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F032606A9
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5F032606A9
 for <buildroot@buildroot.org>; Wed, 22 Jun 2022 21:03:27 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id g27so18465302wrb.10
 for <buildroot@buildroot.org>; Wed, 22 Jun 2022 14:03:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hvcl4InZvEu2l8+4Qb2/pJKpDUZGBqJmQFWQBxE7/wQ=;
 b=3Z0bid8CLw1LXvziBH5Lge+VAKfMs6stNlbR9dVQkG0t6H8YfDsA0jMiwwG1fm7+hB
 aPgOU+s/6y+1YK7ZXikNoPSIKr7twOaYkpNNOrZIyvpLz+EdUXzh3vpz1j/mAxbDg3GJ
 utFfxTr9PeyKWHrvHJmYPqBUJsaRFbzMYOichRRtGsBIoZAp3yqg1qEZRn3CV2dD89iY
 RKAfOHC2CMMWqg4l5WgKFTslmbVG8IX9IHv2qhDVbgNqZkvWwyBfe+PWBFcLx5me/iCH
 3gsEH3s3uk1L6hnKDh39Hzwc2MLdsn7g+ZZMozye6peW7/3qDlWt4VWvASReEBwJ6Nrv
 XthQ==
X-Gm-Message-State: AJIora/k1NMRWfjtumD3nSoFfSex3U5fs3MSihB8PzTSDsFXrFd4aNB1
 zRcEXS5+lzNtcrRb2yv+qQVCIG0KNl4=
X-Google-Smtp-Source: AGRyM1vQQtjK/2aCecRYOYxvIj7rfZDWqT+eYhzo7/eqTD79z1v+8G5g0xNYJXx64i+W8lE5aLltUw==
X-Received: by 2002:a05:6000:18e:b0:21b:89a8:fb49 with SMTP id
 p14-20020a056000018e00b0021b89a8fb49mr5091998wrx.680.1655931805460; 
 Wed, 22 Jun 2022 14:03:25 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 q21-20020a1cf315000000b00397623ff335sm648330wmq.10.2022.06.22.14.03.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jun 2022 14:03:25 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 22 Jun 2022 23:00:36 +0200
Message-Id: <20220622210036.280557-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hvcl4InZvEu2l8+4Qb2/pJKpDUZGBqJmQFWQBxE7/wQ=;
 b=ftZ4yleRuj2no1j59lR3bi23v5LBmbn2YdhNSzwVF0pORAe6Hs23OVZ6343kX7NqES
 L96Mj5RsosJfdl/IP6wxZWRZzWXw+E40DWOR6oJRlfayO4KPYIIGLfOQDIwRsq9Rf75J
 7g8dTVZlXpwZC8icSdUbGsxH3EuQKn7v4Aqsswhae1kAPZ9ybOuRwJWNkzZINHO0jiys
 GlTVaK7BmsHFHxA+96qNGPaUHSMnj+x5+fSL+BmykswXeXdQiXke039TnrkRmGZ5N4aS
 nVai9cGo+lc21sR4G+mo3tanNX0bPDGDTknCBu+cr9vu7YC7100qppz7ISMfCYjb3ybF
 XPkA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ftZ4yleR
Subject: [Buildroot] [PATCH 1/1] package/ncdu: bump to version 1.17
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
Cc: Bogdan Radulescu <bogdan@nimblex.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update hash of COPYING (update in year)

https://dev.yorhel.nl/ncdu/changes

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ncdu/ncdu.hash | 4 ++--
 package/ncdu/ncdu.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ncdu/ncdu.hash b/package/ncdu/ncdu.hash
index c2d367f15a..c47b4f9bac 100644
--- a/package/ncdu/ncdu.hash
+++ b/package/ncdu/ncdu.hash
@@ -1,5 +1,5 @@
 # From https://dev.yorhel.nl/ncdu
-sha256  2b915752a183fae014b5e5b1f0a135b4b408de7488c716e325217c2513980fd4  ncdu-1.16.tar.gz
+sha256  810745a8ed1ab3788c87d3aea4cc1a14edf6ee226f764bcc383e024ba56adbf1  ncdu-1.17.tar.gz
 
 # computed locally
-sha256  e9ed7095eee84ad6804450495738277b539da0c0b2006f50faf8e6e67a0a15aa  COPYING
+sha256  4590cb935ff8a50cee76ce12c2cb0411c0b06e84c267b478579785dcf328660d  COPYING
diff --git a/package/ncdu/ncdu.mk b/package/ncdu/ncdu.mk
index 59fa8deb25..acfd496ec8 100644
--- a/package/ncdu/ncdu.mk
+++ b/package/ncdu/ncdu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NCDU_VERSION = 1.16
+NCDU_VERSION = 1.17
 NCDU_SITE = http://dev.yorhel.nl/download
 
 NCDU_DEPENDENCIES = ncurses
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
