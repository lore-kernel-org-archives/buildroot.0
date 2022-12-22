Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F0B2C4332F
	for <buildroot@archiver.kernel.org>; Thu, 22 Dec 2022 15:58:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9276860D50;
	Thu, 22 Dec 2022 15:58:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9276860D50
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZbV_X68XLSgJ; Thu, 22 Dec 2022 15:58:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E38D460D4C;
	Thu, 22 Dec 2022 15:58:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E38D460D4C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DE2671BF352
 for <buildroot@lists.busybox.net>; Thu, 22 Dec 2022 15:58:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B800F418CC
 for <buildroot@lists.busybox.net>; Thu, 22 Dec 2022 15:58:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B800F418CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fim17CKhSRKa for <buildroot@lists.busybox.net>;
 Thu, 22 Dec 2022 15:58:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 53F5D4171C
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 53F5D4171C
 for <buildroot@buildroot.org>; Thu, 22 Dec 2022 15:58:20 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 131-20020a1c0289000000b003d35acb0f9fso4214337wmc.2
 for <buildroot@buildroot.org>; Thu, 22 Dec 2022 07:58:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PUd3Q3YIP7lR7py3Qh7rimeYJ7xREGoaeUp2habNJzQ=;
 b=uee6lu9RVblAApu7E2l4Prx98TeQH2X5DrrPN8Zh89V8+vK8kIQnc7IYWG2xYOfmRo
 c7jbYAbSKBtVs5pEw38uou+xbALImt1TKKCLPBYZK1uV1QAJ21xkv/KqOPZg69LYIua2
 NXThGD2wmgnyAhlZ0so5Fk1NRmTsVme3z3JkBqVep3PxHXPLlGRwn/XZoHPaDBKZvdBv
 YrWekVnDFpTkzPPY4sGaUswKmXErMLSY0FCNGFGIDBplOfhCmgB6chgQtR1M2dH+YO/g
 GL6Cov2R5wY9gzNcREZTm4y9XvtymLDzKQBPqrIpN7GOgs1KLqWmLwrY6iwB6hteBHdE
 jMJQ==
X-Gm-Message-State: AFqh2ko2jc8LElLThRUMuk0GIKspeBcdR5sa1oFdNeOUiVFCo8Nt5NTU
 3/voFyvJWBlmZ0983lLNDP1v/Qc5N90=
X-Google-Smtp-Source: AMrXdXt9DuR8wCKWSw5c/PZ6l2Vb7i4LzK9pdPm79vM+PThO/hDPiIcp+opqfrnzCyVF3zh7IFiB/A==
X-Received: by 2002:a05:600c:b4d:b0:3d3:5d69:7aa5 with SMTP id
 k13-20020a05600c0b4d00b003d35d697aa5mr4610120wmr.25.1671724698273; 
 Thu, 22 Dec 2022 07:58:18 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 h10-20020a1c210a000000b003cf87623c16sm6445021wmh.4.2022.12.22.07.58.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Dec 2022 07:58:17 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 22 Dec 2022 16:57:43 +0100
Message-Id: <20221222155743.40378-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PUd3Q3YIP7lR7py3Qh7rimeYJ7xREGoaeUp2habNJzQ=;
 b=OyVR+yPaZqyL+WjJ3FjkyMXYSOI1l9U6OCQhfR+IOH7pucjvou249DnJkR7JOJMtsS
 no28wi95acDBPnk/Efi3DrJQYM8o9pTXiVne5b29GTPT1gY9si3T2xhZJVwdBC0QLplg
 J2wFhiqBTMAPMhANd/G2TtDcfsMwjx/5A5pg4oLH0Yfko1kXzp3bu/YBOpJ69aVr4avc
 x5ZStQmfqjE9RezTJPSdyY0Op2gVjEcf41/nk/XSu6DLITFADP5rZQ5NIeNyhBjGLN72
 +ml9gDNYUNvX5s2otyYDKES1Kop8BnZu86mgK8BMBcVCzD4vlJbbHuWojqzO7saYBarR
 neuA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=OyVR+yPa
Subject: [Buildroot] [PATCH 1/1] package/bird: bump to version 2.0.11
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
Cc: =?UTF-8?q?Adrien=20Gallou=C3=ABt?= <adrien@gallouet.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://bird.network.cz/pipermail/bird-users/2022-December/016431.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/bird/bird.hash | 2 +-
 package/bird/bird.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bird/bird.hash b/package/bird/bird.hash
index 6ccacd8d58..3e00a1993d 100644
--- a/package/bird/bird.hash
+++ b/package/bird/bird.hash
@@ -1,2 +1,2 @@
-sha256  7ed341ddd8dc87fa9736586b3515447a8436fec442d65f4022155ab9de1ffd5a  bird-2.0.10.tar.gz
+sha256  60a7b83b67b9d089d2a745a11fddd12461f631abc7b645b6c085adf90b3f55d6  bird-2.0.11.tar.gz
 sha256  94c53c84320078920ac1f0d49c81a4e9004512f534521a58bdf145acbcbc2cd2  README
diff --git a/package/bird/bird.mk b/package/bird/bird.mk
index e1e392168c..1295358fb9 100644
--- a/package/bird/bird.mk
+++ b/package/bird/bird.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIRD_VERSION = 2.0.10
+BIRD_VERSION = 2.0.11
 BIRD_SITE = https://bird.network.cz/download
 BIRD_LICENSE = GPL-2.0+
 BIRD_LICENSE_FILES = README
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
