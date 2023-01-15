Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C79E6C3DA78
	for <buildroot@archiver.kernel.org>; Sun, 15 Jan 2023 17:32:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36C6581DEC;
	Sun, 15 Jan 2023 17:32:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 36C6581DEC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zdw38D9lGDjl; Sun, 15 Jan 2023 17:32:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5957581DE9;
	Sun, 15 Jan 2023 17:32:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5957581DE9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A698C1BF288
 for <buildroot@lists.busybox.net>; Sun, 15 Jan 2023 17:32:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7B67981DE9
 for <buildroot@lists.busybox.net>; Sun, 15 Jan 2023 17:32:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B67981DE9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WH4n5djPw7FY for <buildroot@lists.busybox.net>;
 Sun, 15 Jan 2023 17:32:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3EC8381DE7
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3EC8381DE7
 for <buildroot@buildroot.org>; Sun, 15 Jan 2023 17:32:45 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 fl11-20020a05600c0b8b00b003daf72fc844so1023676wmb.0
 for <buildroot@buildroot.org>; Sun, 15 Jan 2023 09:32:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2gjXoL4P6DHrdoL16NNCicQ6keEsnTCX++1Hg8acVZM=;
 b=wPE+P5kwm+kcHIK2C6yjioFIg2iZjE/mdnBvxOn4k6ozjncoCttmNNZfXkrSHvcKeW
 M9CosshYmfI4dX84vXBosne0fel9ogw0NdpK+EEa8PLRt+n036dEAWZOiZu8W2TsERp8
 n3CqujZ7N/74swIerAD/VqBfopx+vMJePAZUUuU1NjbUk0mjaXQHsBpZNziPVL9CB/9G
 sjZ1h5vmKWREKzhDi7d0s8NNcYXNRWN3Wmvv3VTT/TkkVWIYbVz64NNxCd9BHTIO4Gra
 Gp2n7xo2R6oJ/t+2DoPOxXoEAzRpEocSAcB6olLRCwJTJ5aftmHJkAsvXd2p/7JV1lzl
 EqwQ==
X-Gm-Message-State: AFqh2krYhTZLmCL4pK1Hy7bOOkf1j94itlD7pf8cWvxwMRPGtuv0k8q8
 PvlHrPJ4tR1d5gDVb9HEZtJ7NoT6Zy0=
X-Google-Smtp-Source: AMrXdXstElgCsBzsPqTZx5zolgd4+BeW0Q5zqF7j2lqHth0ZCdLu4E2vU3xS7huDxgGlEYfTyhQEWQ==
X-Received: by 2002:a05:600c:538e:b0:3da:11d7:dba3 with SMTP id
 hg14-20020a05600c538e00b003da11d7dba3mr11565851wmb.5.1673803962940; 
 Sun, 15 Jan 2023 09:32:42 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 m18-20020a05600c4f5200b003c6b70a4d69sm35416713wmq.42.2023.01.15.09.32.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Jan 2023 09:32:42 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Jan 2023 18:32:40 +0100
Message-Id: <20230115173240.81077-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2gjXoL4P6DHrdoL16NNCicQ6keEsnTCX++1Hg8acVZM=;
 b=Rh8XF1sD5GsbGztE74RhIijfBOPkTS+dJECl6EhkH5yfLHzxwiVdF/uTWxT2/JPMWR
 7NPZEneSZC/puMvpQ91qndQU6gIFtFBvleuywWClL4G15o/F/ySzJ6vKSqURgSP50qEx
 SMHWyqBRUOhulpPzlZqF2yqoYA0DLsFS3mhG89hjq5Bm0mr8QS+Naqn9+7bF4dlUXZCS
 KgSRVdYFjUu0otkQT0gPhBNrV4npk1IG5c4MmHa7VvWPCu7GVOMyDoGubfhmo4Ltzqod
 N1ja57WQ23jRs59TvETf+zriaB2orTh35R1OAO3Q6LBwvxoL6uH7VS0lb6k/hFlOXwgo
 iNCA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Rh8XF1sD
Subject: [Buildroot] [PATCH 1/1] package/libmodsecurity: bump to version
 3.0.8
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
Cc: Frank Vanbever <frank.vanbever@essensium.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/SpiderLabs/ModSecurity/releases/tag/v3.0.8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libmodsecurity/libmodsecurity.hash | 4 ++--
 package/libmodsecurity/libmodsecurity.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libmodsecurity/libmodsecurity.hash b/package/libmodsecurity/libmodsecurity.hash
index 087157d162..7ba0ef7f18 100644
--- a/package/libmodsecurity/libmodsecurity.hash
+++ b/package/libmodsecurity/libmodsecurity.hash
@@ -1,4 +1,4 @@
-# From https://github.com/SpiderLabs/ModSecurity/releases/download/v3.0.7/modsecurity-v3.0.7.tar.gz.sha256
-sha256  cfd8b7e7e6a0e9ca4e19b9adeb07594ba75eba16a66da5e9b0974c0117c21a34  modsecurity-v3.0.7.tar.gz
+# From https://github.com/SpiderLabs/ModSecurity/releases/download/v3.0.8/modsecurity-v3.0.8.tar.gz.sha256
+sha256  e241c89b3cd7e58a863d0d0d6b9b8ba4d33ffb0f51171044c258c62e3e7956c7  modsecurity-v3.0.8.tar.gz
 # Localy calculated
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/libmodsecurity/libmodsecurity.mk b/package/libmodsecurity/libmodsecurity.mk
index 916ba8fbcb..e83fda895f 100644
--- a/package/libmodsecurity/libmodsecurity.mk
+++ b/package/libmodsecurity/libmodsecurity.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMODSECURITY_VERSION = 3.0.7
+LIBMODSECURITY_VERSION = 3.0.8
 LIBMODSECURITY_SOURCE = modsecurity-v$(LIBMODSECURITY_VERSION).tar.gz
 LIBMODSECURITY_SITE = https://github.com/SpiderLabs/ModSecurity/releases/download/v$(LIBMODSECURITY_VERSION)
 LIBMODSECURITY_INSTALL_STAGING = YES
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
