Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A225AC10F1B
	for <buildroot@archiver.kernel.org>; Wed, 21 Dec 2022 10:46:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3DC2781F64;
	Wed, 21 Dec 2022 10:46:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3DC2781F64
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s_INWjg0QdD2; Wed, 21 Dec 2022 10:46:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A514981F4B;
	Wed, 21 Dec 2022 10:46:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A514981F4B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2E9EC1BF5E0
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 10:46:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 16F4F81F4B
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 10:46:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16F4F81F4B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YFTqSM2fAlWd for <buildroot@lists.busybox.net>;
 Wed, 21 Dec 2022 10:46:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1FEA881F3E
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1FEA881F3E
 for <buildroot@busybox.net>; Wed, 21 Dec 2022 10:46:16 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id ja17so10841818wmb.3
 for <buildroot@busybox.net>; Wed, 21 Dec 2022 02:46:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PrbyhBrUduGkTsX6XRQ+yQEBfI5ubp6OspQLf0lZVlo=;
 b=H1foraAxMbKH4VRmNYzzHzvsCrS+0uDczaBQniSbVkKWMQP8bFEtBMVbo2MDcggHNj
 gPyigZ20i6OvZiaZGK5oglLRckRCjL1v9Scw9t/XYES18KypA3BsjvTY20Fj9n3Fg1Ko
 0qlZSEbnUv7Oc2IbUoTdTQbdfKuFXrRrh5KxKQLv258J7hBwypAsJ7UnZr1dgNgQnIPP
 8mVs6YlTXK/QxLyCjnzhgyt6Lmysn6PSsBhHA0Gg8zCA/xHUwoANcNxoFRCg7hB2NUbV
 YUUN1exQqxDC7WxOCbI1tJLbbcsJfo26K7u3BB3ArfkYX0bXArrGN1khRZp5cOpbhRbJ
 7guA==
X-Gm-Message-State: AFqh2kpcnJXB4/zMUIBwf1G75Br7B3DO2mLdeakAJ+A7Xz3A3lFDE/+y
 ijOTw8QGucU/V1qq6FKBmw2ivdUp1x0=
X-Google-Smtp-Source: AMrXdXt3Lbm/whTRfXOGozq/abldRdQc0E55ZrNRbJyHLg2V7ysvJL9wTQ2tAkvi4I0uvHqPH1JUVA==
X-Received: by 2002:a05:600c:1d1d:b0:3cf:81af:8b73 with SMTP id
 l29-20020a05600c1d1d00b003cf81af8b73mr1328970wms.23.1671619574039; 
 Wed, 21 Dec 2022 02:46:14 -0800 (PST)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 iv7-20020a05600c548700b003d35c09d4b9sm2109154wmb.40.2022.12.21.02.46.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 02:46:13 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 21 Dec 2022 11:46:07 +0100
Message-Id: <20221221104607.3430116-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PrbyhBrUduGkTsX6XRQ+yQEBfI5ubp6OspQLf0lZVlo=;
 b=Hkwjtzs5nDu7we+6RhosX4f9kZJUxi1LJTBZ0cTyLzDkjXgKTKH04uPE0v4SJp3VR9
 1kg0TGXHKMzgp4DGut8/G+21lkmRbW0crWak9qvROfASvJ+HAoV8QDwFhlLLOhQjZi/x
 kGhxCmx+iAGRe/a6qlu6PiaZQWJiOmZ2VjOlqacLbDK9FVUL+8WggFS9fW0MsoeDT9Wq
 h7T0McPnjeekxt0UC3putHJQ0yEBstqTVdOISO2TDzAZRzP1HhOLEGABPJrBcAdZcsmb
 G+odrjIOeKFeyDYTnoZJAKL0wr7g+EPohAt6DIp4y1ynBIzy1yafBuCuktIH6RmSFR8p
 ZxlA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Hkwjtzs5
Subject: [Buildroot] [PATCH] package/lua-cqueues: disable with libressl
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Building with libressl fails,
see http://autobuild.buildroot.net/results/032/032d6c9bf84b0d4e50d3c27f37b71c0564c52312/

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua-cqueues/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/lua-cqueues/Config.in b/package/lua-cqueues/Config.in
index 60f022848..a8c38950c 100644
--- a/package/lua-cqueues/Config.in
+++ b/package/lua-cqueues/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_LUA_CQUEUES
 	bool "lua-cqueues"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
 	help
 	  Continuation Queues: Embeddable asynchronous networking,
 	  threading, and notification framework for Lua on Unix.
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
