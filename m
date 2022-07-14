Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8A0FC43334
	for <buildroot@archiver.kernel.org>; Thu, 14 Jul 2022 21:37:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 15644404A5;
	Thu, 14 Jul 2022 21:37:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15644404A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QT0yOJK9KisO; Thu, 14 Jul 2022 21:37:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0B46426B9;
	Thu, 14 Jul 2022 21:37:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0B46426B9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8E8671BF36A
 for <buildroot@lists.busybox.net>; Thu, 14 Jul 2022 21:37:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6835260BD1
 for <buildroot@lists.busybox.net>; Thu, 14 Jul 2022 21:37:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6835260BD1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Pc5Z8ElZwbSh for <buildroot@lists.busybox.net>;
 Thu, 14 Jul 2022 21:37:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7561760BA4
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7561760BA4
 for <buildroot@buildroot.org>; Thu, 14 Jul 2022 21:37:35 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id p4so1814165wms.0
 for <buildroot@buildroot.org>; Thu, 14 Jul 2022 14:37:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=L+WnQluHRw6C7cKgbUpkOwXW5EnZEImQr8zIzzgcjmw=;
 b=NXzGzrr4As/vE2ytBB1pg/xgeZCFqDhoFZU4AsDbgLr2PAAOP5nsbMRtlDKC2gVDHp
 A4l0YeDeE20gdZxFyj/xAmXTr72iy8sLOY/XG28m6JuvQKFY0ZA7BPbYCC8FPztKeJSF
 fIK+kAeR9xdAAlEentqSkerxIYnKd7CY8xaonP/vat+zyM216gjGBLcg7RzymjMzt7ix
 C5PfNs5qsPkf0Qrtag5up/NuwKzuYB6lgb15bnP0U7z29ZTJC3DzMG9q27Zw8SijD7ag
 WtH338D+lHYxSba+UDMTEBeRkOVR2Zx2KwF27bqZgM5v5hEpBFzVde3Pooqk8VFnlKAM
 gIxg==
X-Gm-Message-State: AJIora+yqQtiQHwM1uONOFgUYzigYW0X2i+FcPCxIDGqGi1FVtcwiPKg
 EA32yqxjvWRvhCXoQ/VqjZLkaNs1Y7U=
X-Google-Smtp-Source: AGRyM1tBbFqpVikS6YyXyMi0BVyeWqmDrA1HrehodKS/EcUeD5mUNCf8bkgbxpGkQjwYfZweQVhgFA==
X-Received: by 2002:a05:600c:4f4e:b0:3a2:b504:2600 with SMTP id
 m14-20020a05600c4f4e00b003a2b5042600mr11310584wmq.116.1657834653386; 
 Thu, 14 Jul 2022 14:37:33 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 p26-20020a1c545a000000b0039c454067ddsm3459331wmi.15.2022.07.14.14.37.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jul 2022 14:37:32 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 14 Jul 2022 23:34:31 +0200
Message-Id: <20220714213431.58082-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=L+WnQluHRw6C7cKgbUpkOwXW5EnZEImQr8zIzzgcjmw=;
 b=k4r2If7sfAmnaD4ekYoylDX4UABO2lOsyFBmagFiw8KAujTcKWHmNSorhle8s6C/s7
 GX7f+Np/TvebE3U0/mmMKNepidlVAVtTerliojvMcT6QvsnDRJXCypcHR/yU8mSHMy7f
 2FXzETI6t6UZUEXKFz4AVKeXZGDpwOrf7g0fo0aAodwbJkjoKfi4rDOgsLh1NtoTLxHz
 Jnrv6FaT8AOYsvsJzNeEwcLqtbv52xnr6uAurGLNcDDzGaDhn1v20sGDbsGqhWkyOKV7
 hI8im5enW4W/WqpD469lddNNn71VWrGU97EOKVkemVg++Up99xuZytdiiZ9oV/+nFPnt
 04cQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=k4r2If7s
Subject: [Buildroot] [PATCH 1/1] package/libbytesize: bump to version 2.7
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

https://github.com/storaged-project/libbytesize/releases/tag/2.7
https://github.com/storaged-project/libbytesize/blob/2.7/NEWS.rst

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libbytesize/libbytesize.hash | 2 +-
 package/libbytesize/libbytesize.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libbytesize/libbytesize.hash b/package/libbytesize/libbytesize.hash
index 2dfa97dd6a..7dd572842d 100644
--- a/package/libbytesize/libbytesize.hash
+++ b/package/libbytesize/libbytesize.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  efaa2b35b2bb3b52bf7b4ff5d0ed2c5c61360a5196053808d615dd0aa2cf0741  libbytesize-2.6.tar.gz
+sha256  8bae8287af6ef5624c320f70defdcd84ddc0c2057d3b59a5871897f27697811e  libbytesize-2.7.tar.gz
 sha256  97bdc721d875501b6243a456333fdfdb1ab64d31c4da2554de845caf4674b946  LICENSE
diff --git a/package/libbytesize/libbytesize.mk b/package/libbytesize/libbytesize.mk
index 2ef08211c5..a95ee08357 100644
--- a/package/libbytesize/libbytesize.mk
+++ b/package/libbytesize/libbytesize.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBBYTESIZE_VERSION = 2.6
+LIBBYTESIZE_VERSION = 2.7
 LIBBYTESIZE_SITE = https://github.com/storaged-project/libbytesize/releases/download/$(LIBBYTESIZE_VERSION)
 LIBBYTESIZE_LICENSE = LGPL-2.1+
 LIBBYTESIZE_LICENSE_FILES = LICENSE
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
