Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2EACC54EBD
	for <buildroot@archiver.kernel.org>; Mon,  9 Jan 2023 04:46:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 509AD60AFB;
	Mon,  9 Jan 2023 04:46:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 509AD60AFB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pxxtGXTaJbjL; Mon,  9 Jan 2023 04:46:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93E7160A9D;
	Mon,  9 Jan 2023 04:46:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93E7160A9D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1A9B71BF357
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 04:46:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0398940142
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 04:46:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0398940142
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y3ckJp2_n2LP for <buildroot@lists.busybox.net>;
 Mon,  9 Jan 2023 04:46:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 01050400DD
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 01050400DD
 for <buildroot@buildroot.org>; Mon,  9 Jan 2023 04:46:16 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id y2so4394921ily.5
 for <buildroot@buildroot.org>; Sun, 08 Jan 2023 20:46:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ER+7C5qjMmLPdkYnv1plxZy8RdDQzc3Djmadq+4qL10=;
 b=DcyokV4lsUmiXfRo9W6xEyxcqGCMlwXNYFPIvVdP/u4hCpHdfttGU0NP1FpvmRsda6
 0GD236GtfD1tfnPTlbVYNBrTXGbI3BJP4sgUq176RkQKbnNkKKIIILaymOjOlEXB/oHp
 rm3Ccb2OKEMTntnaNMi/OSiCSAvMmlP7Man+e3xBfsBeiuSrPJoeM+ui6ntrvTp/TXdu
 xqDsgzpp5Y/O+oBYmCsIpzSOMP9NG1LasKvStD3Ghci75Xtsq6h0J3tWOOzDrzHuBqch
 Qd4ZODh7g6w0GTOcT40ND5urlHRNR6h2W0C1ovtctYnP7zF5T04zzMtK7W/j+p/OBmEe
 iX4A==
X-Gm-Message-State: AFqh2kp0wKuFcvzwRbVowJS9JCEtEU2h3qQz7itpZOWGuBEQpYWtcT4U
 J19pVbzMtMRw5pYc2toPS9qekmCBSgMgV34g
X-Google-Smtp-Source: AMrXdXsCGx8rfBMER8Ma6scn1jYwgZfz9R8dTDLygN8qi32G7drx1wGwtRmNeTGMprZSghb7gfDf6g==
X-Received: by 2002:a92:dd83:0:b0:300:a953:a263 with SMTP id
 g3-20020a92dd83000000b00300a953a263mr50643745iln.21.1673239575869; 
 Sun, 08 Jan 2023 20:46:15 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 c2-20020a023f42000000b0039decb5b452sm2459619jaf.65.2023.01.08.20.46.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 20:46:15 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  8 Jan 2023 21:46:13 -0700
Message-Id: <20230109044613.2432359-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ER+7C5qjMmLPdkYnv1plxZy8RdDQzc3Djmadq+4qL10=;
 b=CqdRFcoTteyhXrgh9mW1IcwPOacdYuyJeCjFlMmqkysVTbmH2Fsi5/XA0l7K3brNgV
 RvDPY2t1yOoz0qQUP4ZqUBEHvvFhqBUmnv0PTT1cXy7E6cR49TS3VApHXznh0EaNOmgy
 DZBBOnhuZ8Ixn4l1caliyoS7hZ7G5A9cG7Xu+ooiamiXxJBlY5PhGtvma+jFmGT+ea1g
 BCqY4vU2J2SFZ8lWfwXhvAP/klkeJJxBkbnSPZJah0Cyhoub3xY2NwRwh8eUPaoU4Edy
 B/FpOLJNRH0D/ywiLRRqumsXdVWKOrh1+XmUAddoYvb3wWX57bYY8WGNzQvf9vN7vCbO
 fchA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=CqdRFcoT
Subject: [Buildroot] [PATCH 1/1] package/python-orjson: bump to version 3.8.4
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Graeme Smecher <gsmecher@threespeedlogic.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-orjson/python-orjson.hash | 2 +-
 package/python-orjson/python-orjson.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-orjson/python-orjson.hash b/package/python-orjson/python-orjson.hash
index 515590795b..b612cace0f 100644
--- a/package/python-orjson/python-orjson.hash
+++ b/package/python-orjson/python-orjson.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  0c8d161dfd8b9e4133beabd81e3e1473c246efe55abec571845f72a2ba7b74e4  orjson-3.8.3.tar.gz
+sha256  c54cf8773cb13126138a62aab676eaba48d3124d731a4bb3c3afce07b71b028e  orjson-3.8.4.tar.gz
 # Locally computed sha256 checksums
 sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  LICENSE-APACHE
 sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/python-orjson/python-orjson.mk b/package/python-orjson/python-orjson.mk
index bda0a8ab48..8eeadecb3d 100644
--- a/package/python-orjson/python-orjson.mk
+++ b/package/python-orjson/python-orjson.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ORJSON_VERSION = 3.8.3
+PYTHON_ORJSON_VERSION = 3.8.4
 PYTHON_ORJSON_SOURCE = orjson-$(PYTHON_ORJSON_VERSION).tar.gz
-PYTHON_ORJSON_SITE = https://files.pythonhosted.org/packages/1c/b9/a0b4fb195ded02820e0a933ffe28b782b7e5ef7a4f8c1e1c742d619548e4
+PYTHON_ORJSON_SITE = https://files.pythonhosted.org/packages/8f/2d/ae31eddf7e097eec5e25c7da954ef6e944f4dbf79153676f94cea3dc5116
 PYTHON_ORJSON_SETUP_TYPE = pep517
 PYTHON_ORJSON_LICENSE = Apache-2.0 or MIT
 PYTHON_ORJSON_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
