Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BA3FC46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 13:47:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D8640404B5;
	Tue,  2 Jan 2024 13:47:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D8640404B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7cYn8Sun2nnb; Tue,  2 Jan 2024 13:47:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 453CC404DA;
	Tue,  2 Jan 2024 13:47:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 453CC404DA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B56631BF314
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 13:46:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 86B0681098
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 13:46:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86B0681098
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ltaxGQLxUViJ for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 13:46:58 +0000 (UTC)
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DDB6780F89
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 13:46:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DDB6780F89
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-33723ad790cso3013626f8f.1
 for <buildroot@buildroot.org>; Tue, 02 Jan 2024 05:46:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704203215; x=1704808015;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UGpZpiygalqyUSNwIZHUKiSDZWSywWoblAOo/1/eP6k=;
 b=lmd9mv0WMMwsceEtB686guwuc1kiAaQ0R3KNhuwGkjfCRgQNfhKSmT5/D9e6XDwCjT
 HGg9k768eStrDj1+Jwq4f4+iIs9SOJJzNuU7iUTRT4j1Dg8aoumWF4D8c9NpaZSlXv6z
 d6cXZCqvjzaeYTlrE3DvG38qJPRenuaWgGzRORnvj3erQNwJ5J6xI2qNM39jbYsZuZe6
 QtR0Ts1fdzmNIAwcfaSDHDU/Bemzd/gBcoOfFlnIem80LpDZR9yM34WHxHKPr/LgRUqk
 C6GXcDdZbvD+gwpMDsbem1EXGgLXYlOZNFl+pa+BRLF9UcDh3h+4IGgJkl4jBvb+AJ1u
 sPEQ==
X-Gm-Message-State: AOJu0Yx58XngeF72VzBs85L2lCDmYSy1QnAeDZA6l+QgtMCjyriEuKd1
 dSJFN1VhkMnGu24741jEh+wev5WqVaY=
X-Google-Smtp-Source: AGHT+IE1fOWGAC6kNJJHKuHfedC3iyOz23Rr4qEEJUKHtuvbqeDVNsnqOz2MWSbgL0FD4hSHLFTlmQ==
X-Received: by 2002:adf:e8ca:0:b0:337:32ef:1780 with SMTP id
 k10-20020adfe8ca000000b0033732ef1780mr1578957wrn.186.1704203215174; 
 Tue, 02 Jan 2024 05:46:55 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 df2-20020a5d5b82000000b00336be33649csm21183611wrb.9.2024.01.02.05.46.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jan 2024 05:46:54 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  2 Jan 2024 14:46:52 +0100
Message-ID: <20240102134652.1287110-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704203215; x=1704808015; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UGpZpiygalqyUSNwIZHUKiSDZWSywWoblAOo/1/eP6k=;
 b=V0SSCkvpFT45xj+h1XhfIkB2l/d70SqEK8jIiE7yM+EHQ3t2r1J89AAdgNqxCJOq0l
 Yx+HWzmRo3OSvXbR/LTA/Tk+R7HqUQ3slAPWeZjroxgDdCSgSAGPlywAhe0nQuVny7L9
 VZtqpXiffPnbYYaHTumVgWG111TAfOg/nVmSIW6bVson+ZA+hA4I+d0YSrDVvt0nE3Xi
 km9e5RFv7yWyOUN6CuXmJ3b2qmJMfCuWQWXyxqazgPwaOZ9ht7uXdoD8wCK/WU8sJ9yR
 NuLk5NVQ9mzMKPtYXuRoSoKcKei9GPqvEtNyd8ZdUFIyH4Bwdx7eEPR2GuEpcf4GjxOy
 yn+w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=V0SSCkvp
Subject: [Buildroot] [PATCH 1/1] package/hawktracer: bump to version 0.11.0
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
Cc: Gilles Talis <gilles.talis@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/amzn/hawktracer/releases/tag/v0.11.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/hawktracer/hawktracer.hash | 2 +-
 package/hawktracer/hawktracer.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/hawktracer/hawktracer.hash b/package/hawktracer/hawktracer.hash
index 29d00e29ec..585b612c49 100644
--- a/package/hawktracer/hawktracer.hash
+++ b/package/hawktracer/hawktracer.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256  099f76d5be18ad5d714fded0c6f889f588986cdde2b31f2c0058413698a5f35c  hawktracer-3c22b3908912e2ec727fd2ddc5dbfe7464e6b4a5.tar.gz
+sha256  12a689a1cfb2ae25ad777b1b2275dbba5cd64905627b0a20d17d6e26de003cef  hawktracer-0.11.0.tar.gz
 sha256  2f377333e64ad08ad3afec8ed6c2c96ced2a6d7d67443eb2784a931bb7b3fd59  LICENSE
diff --git a/package/hawktracer/hawktracer.mk b/package/hawktracer/hawktracer.mk
index 462d073755..8e722080f5 100644
--- a/package/hawktracer/hawktracer.mk
+++ b/package/hawktracer/hawktracer.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-HAWKTRACER_VERSION = 3c22b3908912e2ec727fd2ddc5dbfe7464e6b4a5
-HAWKTRACER_SITE = $(call github,amzn,hawktracer,$(HAWKTRACER_VERSION))
+HAWKTRACER_VERSION = 0.11.0
+HAWKTRACER_SITE = $(call github,amzn,hawktracer,v$(HAWKTRACER_VERSION))
 HAWKTRACER_LICENSE = MIT
 HAWKTRACER_LICENSE_FILES = LICENSE
 HAWKTRACER_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
