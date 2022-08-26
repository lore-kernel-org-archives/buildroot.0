Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AF6AECAAA3
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 20:46:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86FC260888;
	Fri, 26 Aug 2022 20:46:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 86FC260888
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZR3BuO-wh69p; Fri, 26 Aug 2022 20:46:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C34726060A;
	Fri, 26 Aug 2022 20:46:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C34726060A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6836E1BF2A5
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 20:46:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 434EC4016B
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 20:46:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 434EC4016B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OwRYPdmjbi6I for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 20:46:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C0830400A6
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C0830400A6
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 20:46:10 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id m16so3081046wru.9
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 13:46:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=+dMSw+2JQFnql9Z63g3jK4wj8EaXYlAVrizGialJTw8=;
 b=UKE5ml+4pnFHIlQ622QBsZQje5nsfHMweRX5ZE9JnsuJG9m+aXnmnBeKMgc0yOQ6o0
 u1y5++b0HvDGh6fZYp3U70ZBX7FS6JWwkmjt4uCk+PT2o8nHFpastD9tP2WB13eYu3jg
 0YNRUdRLA27+idXr6A6FV8vbaktjw4jqxbuFI3iH4ehHzLV4qArTAmMKWz++KSo1Dgj3
 a6Psbgy2eaxibwrAtSAZhrtltuehLmLtge4yBhzaHkDAu8FCmow8ZlD2B1Sd979v3CIK
 LCuMk0EeQZGLBSj6vKAiIsDSdcWLo5Hu+rWWwWD6KZSNGQdyaLdaOG8XgSEhBQy9EMsj
 TlBA==
X-Gm-Message-State: ACgBeo3OXiPuokQjb5McCE84SZD4OVMQASEEPsqIZYP/zWp3sJsTbDgM
 2C/lgRkH5wqYIac97YXtTLUHpJaB9XM=
X-Google-Smtp-Source: AA6agR72aoOcajBSjvqjfw1HvG9iJbyMOSHGs59gBUH7K+MuCurmYBxFHYDiiWsgY+PVwbNACCk6Ow==
X-Received: by 2002:a5d:59af:0:b0:220:6daf:5f64 with SMTP id
 p15-20020a5d59af000000b002206daf5f64mr736122wrr.192.1661546768761; 
 Fri, 26 Aug 2022 13:46:08 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 ay15-20020a5d6f0f000000b002207a5d8db3sm647125wrb.73.2022.08.26.13.46.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 13:46:08 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 22:46:04 +0200
Message-Id: <20220826204604.15716-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=+dMSw+2JQFnql9Z63g3jK4wj8EaXYlAVrizGialJTw8=;
 b=Qif+JJUqAmX8ruaU1/+9uNjdR3h8RjmlQXzxgN+M/AugJTF3UZ1KMKBbxq0tx80laH
 QYmiLopO8umQ1pWG3gLVErw4tjRouoL22M4o8+pC+iFhnrg7m6pVfPWnlU7IhNhWG6Q+
 7jgnDneDJOt7V7cKHOBqj8D57qt/5ggLi3q4LCmKu48f/r8NXEli3sC0WnVY/yfBTYZF
 MKmk6fpmKqrlmWxS9swIVYR7iTOhrWpcMQd7DTHX3M3pBXeM9qm9cf+G9TqJqVv9BrK3
 09B7802AePLZ6JUR4BeO4t2xS/snhEW02TfM/3fvFxisVHhYMvUJjr+PNvBGKnKpy0jr
 mGHw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Qif+JJUq
Subject: [Buildroot] [PATCH 1/1] package/zerofree: fix legal-info
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix typo: ZEROFREE_LICENSE_FILE -> ZEROFREE_LICENSE_FILES
added by commit 98ecdd1d1125f2529a8d61c01a2bec6d8dbc48d1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/zerofree/zerofree.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/zerofree/zerofree.mk b/package/zerofree/zerofree.mk
index f26280cc2a..3a9c16ee78 100644
--- a/package/zerofree/zerofree.mk
+++ b/package/zerofree/zerofree.mk
@@ -8,7 +8,7 @@ ZEROFREE_VERSION = 1.1.1
 ZEROFREE_SOURCE = zerofree-$(ZEROFREE_VERSION).tgz
 ZEROFREE_SITE = https://frippery.org/uml
 ZEROFREE_LICENSE = GPL-2.0
-ZEROFREE_LICENSE_FILE = COPYING
+ZEROFREE_LICENSE_FILES = COPYING
 ZEROFREE_DEPENDENCIES = e2fsprogs
 
 # We use the same workaround as in https://bugs.gentoo.org/716136
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
