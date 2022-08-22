Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C0CAC28D13
	for <buildroot@archiver.kernel.org>; Mon, 22 Aug 2022 18:27:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A759641619;
	Mon, 22 Aug 2022 18:27:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A759641619
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hziWZzqBnijr; Mon, 22 Aug 2022 18:27:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FFA541690;
	Mon, 22 Aug 2022 18:27:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FFA541690
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 572C21BF3E8
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 18:27:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F7F8828AF
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 18:27:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F7F8828AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sQlyL0zn1aXT for <buildroot@lists.busybox.net>;
 Mon, 22 Aug 2022 18:27:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 36EBB8290B
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 36EBB8290B
 for <buildroot@busybox.net>; Mon, 22 Aug 2022 18:27:05 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id b5so9988393wrr.5
 for <buildroot@busybox.net>; Mon, 22 Aug 2022 11:27:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=waf2aa+LEhEVQByVw/LoEX+S5Ssorn9iDZC/ZuhIMQQ=;
 b=6IksfIDJDbSpdGc5wRfvzl9s0hutLjohiHCxWWSBbFrW9R3YeuGY40nurPforz0SpM
 UacxXvAYl4XpCN6i127oc0VCY69tmFvxoqpxroqQVcMxml/H62BWypa3ESVQWS4EqogH
 kMvqE4qAuBJQsXrvuDViwP6AESqznqLeEayXodhlOMp1nLnyNpGBXHegHbXtDIZ80kjU
 2+pl+JL+Lkdjk24YHS9Lhcld4d8t05HBPoynL6jjdlg2sj3gUAO2C2E6EhUkF/mt4Rjl
 WG/k0o7zyTY7YJ+HvUzG6rpeKg0MZhXURH0hPHVvtCqXp9AqHS6Ft9jWbjzgZb/3mrj8
 zxDw==
X-Gm-Message-State: ACgBeo0Fm7O/rwPqNGlLVe3JNd5qVz5S+u95qxZDlpIkn1xPPsk4vTbK
 1kv/WGAXrolJqvhaUY3PU+yCRQhutuw=
X-Google-Smtp-Source: AA6agR6SGFuabpcpXTtlzfXjUcVCaczzNK91hAulKxdhbiX6vDenkFRPTBGQhJMEni4g6TFccLzISw==
X-Received: by 2002:a05:6000:1c7:b0:225:4cc2:ec88 with SMTP id
 t7-20020a05600001c700b002254cc2ec88mr5731584wrx.298.1661192823293; 
 Mon, 22 Aug 2022 11:27:03 -0700 (PDT)
Received: from vm22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 d7-20020a05600c34c700b003a53731f273sm15828625wmq.31.2022.08.22.11.26.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 11:26:58 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 22 Aug 2022 20:26:53 +0200
Message-Id: <20220822182653.1691347-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=waf2aa+LEhEVQByVw/LoEX+S5Ssorn9iDZC/ZuhIMQQ=;
 b=WNsKxAyqItQrAecPhj6/IklijpanvGv31mIo9g8sMH1/lNk3dpY6DrxKlW83GiuoR5
 9J1wbprO7ymYhFZCu7rI70Fpde3RWD/6rGgn2khTj5bQ9u/M3uoObits2f4pbp0oAh6k
 ijRZIku+P7/uVqJkELFRHgkMGriBMm+Q53k5/B+Fgotk4IA/fGHn6BE96MG1+wa6f4W6
 ZPTaWLSWY9DJsaEZjct5qt4ouAvbuwBc552LXtXjG7uvUNuXySKFsnlLHlf+brXNTTwr
 TBXCBIZmlKR7boUtGyQt0Zxuy3j4eLkrMm+U4H2/5BxSUTu/I1PXEd/RrevZS8/ieH6z
 oONQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=WNsKxAyq
Subject: [Buildroot] [PATCH] package/open62541: bump to version 1.3.3
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
 package/open62541/open62541.hash | 2 +-
 package/open62541/open62541.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/open62541/open62541.hash b/package/open62541/open62541.hash
index f5402ffdb..22c13851b 100644
--- a/package/open62541/open62541.hash
+++ b/package/open62541/open62541.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  7e2a47ee6c6e5e7b9a9c803ff717670707d040710bb65d2615c0df33a614e629  open62541-v1.3.2-br1.tar.gz
+sha256  283545991c3eb36b18c75a64638c7c2ad8f193654c2403b76aee848abf454e14  open62541-v1.3.3-br1.tar.gz
 sha256  fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  LICENSE
diff --git a/package/open62541/open62541.mk b/package/open62541/open62541.mk
index 0551c3bca..edc95dcf1 100644
--- a/package/open62541/open62541.mk
+++ b/package/open62541/open62541.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPEN62541_VERSION = v1.3.2
+OPEN62541_VERSION = v1.3.3
 OPEN62541_SITE_METHOD = git
 OPEN62541_SITE = https://github.com/open62541/open62541.git
 OPEN62541_GIT_SUBMODULES = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
