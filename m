Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5188CC001DE
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 10:32:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0901F60F30;
	Tue, 25 Jul 2023 10:32:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0901F60F30
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M3jqrGbiIry9; Tue, 25 Jul 2023 10:32:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 490FC60F64;
	Tue, 25 Jul 2023 10:32:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 490FC60F64
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C91CE1BF59A
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 10:32:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A2C6A81CBA
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 10:32:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2C6A81CBA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ii49vl6b_rw3 for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 10:32:23 +0000 (UTC)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 924AF81CAF
 for <buildroot@busybox.net>; Tue, 25 Jul 2023 10:32:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 924AF81CAF
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3fbc6ab5ff5so44798745e9.1
 for <buildroot@busybox.net>; Tue, 25 Jul 2023 03:32:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690281142; x=1690885942;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mI3gHx5fgdU9UfanzXrIZAaMYvZ7NxeP432K00Zc9o0=;
 b=WcnSE7WPHZOYuKWXdhUd9LfOIVPgk9s/8l4Iq8GC3bnwyFH7ty9Qf43ed3akd/xECa
 E0PmqMXWQla4Cttf8AT3pw8JBpgcZzqzs9xMPBnAyPmVVHaRERhG4X+7SU92svQVPeAd
 aGbSSsJlwIjKFrrXEtxs9mNh+NHQPgMtJIPSjk2dmphcN4OV19ggZjax/zNBTc+xOZS1
 hd1W+KoqQeQMEGmjRrxkxNi4XeLt8NJ+Re9wpraZJMQ454gOYc1eCnWBZRdnfFWHXlCq
 jPPBT6BImjtiNSxWEw62nDa7CDcUnoyYI3CIQpMaAqgz0nYmmoPkR9W2pKOZBbdTVTPc
 rSZg==
X-Gm-Message-State: ABy/qLb640K801LJ3oHqtIB9Nz2Ub4E4Kwz8DvZARTzpbojbI3ps2BPE
 VvPNkD84qd8uAmNV0w5ku/X2M0W3T8Q=
X-Google-Smtp-Source: APBJJlEqIOGXc9ReWqDhUoaghxWeIyfnOcT6JgfWZScIQSlyzIjBmbP8J8hTm+D8YhBRaG4eTX8DsQ==
X-Received: by 2002:a05:600c:22c3:b0:3f9:b430:199b with SMTP id
 3-20020a05600c22c300b003f9b430199bmr10019258wmg.15.1690281141647; 
 Tue, 25 Jul 2023 03:32:21 -0700 (PDT)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 c22-20020a05600c0ad600b003fa98908014sm15382130wmr.8.2023.07.25.03.32.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jul 2023 03:32:21 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Tue, 25 Jul 2023 12:32:16 +0200
Message-Id: <20230725103216.941579-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690281142; x=1690885942;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mI3gHx5fgdU9UfanzXrIZAaMYvZ7NxeP432K00Zc9o0=;
 b=N+QqHjRNT2Xn5G96wXNZBkm9BXn/uK2tHmSME5/LeuBEiXCh8vDh2ch39ODnTxtNz1
 AutrsCQj+NUe5uH8khWwwa1E1JvcNX6XtbHVf08ICyUZcMQf5kr2iwYTN57PyF/lLkiR
 QEguVxb5tU/ipMEKJMTvgss1ODsAzJVjK/rHBooOE1Xiv67GT3Ev5Z5CDGYErRpFBZqi
 cgFl8ftdHkoHahcAs7paYoemY1gGoc/9r902aRiAOhhRM8auhRtE+qoBrN3R+/SjDwi7
 kaMkmvak5OZjc98by9y4zSUSTAimNOP8D613HocVTO2wJvb5g0UFQ9cq7H1UJY2gDaQK
 9Icg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=N+QqHjRN
Subject: [Buildroot] [PATCH] package/tree: bump to version 2.1.1
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

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/tree/tree.hash | 2 +-
 package/tree/tree.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tree/tree.hash b/package/tree/tree.hash
index 298153c89..9ef48b1e7 100644
--- a/package/tree/tree.hash
+++ b/package/tree/tree.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  7d693a1d88d3c4e70a73e03b8dbbdc12c2945d482647494f2f5bd83a479eeeaf  tree-2.0.2.tgz
+sha256  d3c3d55f403af7c76556546325aa1eca90b918cbaaf6d3ab60a49d8367ab90d5  tree-2.1.1.tgz
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  LICENSE
diff --git a/package/tree/tree.mk b/package/tree/tree.mk
index da0acbae4..83a427b74 100644
--- a/package/tree/tree.mk
+++ b/package/tree/tree.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TREE_VERSION = 2.0.2
+TREE_VERSION = 2.1.1
 TREE_SOURCE = tree-$(TREE_VERSION).tgz
 TREE_SITE = http://mama.indstate.edu/users/ice/tree/src
 TREE_LICENSE = GPL-2.0+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
