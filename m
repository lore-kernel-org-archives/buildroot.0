Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE685C04FFE
	for <buildroot@archiver.kernel.org>; Fri, 17 May 2024 21:33:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7529A407CB;
	Fri, 17 May 2024 21:33:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PiGvXblkQxyB; Fri, 17 May 2024 21:33:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04AC4407D2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04AC4407D2;
	Fri, 17 May 2024 21:33:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 103071BF336
 for <buildroot@lists.busybox.net>; Fri, 17 May 2024 21:33:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE089831EF
 for <buildroot@lists.busybox.net>; Fri, 17 May 2024 21:33:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m8Bgc8Q677jg for <buildroot@lists.busybox.net>;
 Fri, 17 May 2024 21:33:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8F875832E8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F875832E8
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8F875832E8
 for <buildroot@buildroot.org>; Fri, 17 May 2024 21:33:12 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-351dc6aa900so586474f8f.0
 for <buildroot@buildroot.org>; Fri, 17 May 2024 14:33:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715981590; x=1716586390;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xC/EsHAxUuqvO7slU0Ssx1usHHcx+0QeBNP5pY2Kcso=;
 b=iJHs8P4LgsH4l4BX5dBYk/+u/Kdxy4XNET5n0pt+4z0VMGVkjvy8mV2RI9WLoapGiD
 7039s60U1PCesBOsI/ns0O05DFSXvuLaJVmvJgAlR71+YWl7iA3wopMXv3HKZPSPZpai
 3LAkj4cNlFKR2GiuIXT0VNXQVeOWOQKHPTZi72IFiji99CBa6hL3hfIFCJCmrsdnLfMi
 Aprdp5mujiAHHWjShOS7+ySpe3W/wDGy341Lavn5iqaqHiDTLc5XfssdMSLS3vUM/S5S
 NYNjqCMBbxl47qG4tOg89G6poIfwIcRdqvqskmN75OodWs33vkKh95+3XJ03OeU2wz3R
 N24g==
X-Gm-Message-State: AOJu0YxroJflas69+/YpUR1gWkAxDUPDoWmKeweZmfOR06hHu4RlYuLL
 pcGTHjAEk1iLH+jjcXpbjJtckegg4ZjGJdJe2jvNQ4vJDVVdIQr4g6SkKg==
X-Google-Smtp-Source: AGHT+IHtW5vMXftGThTF2m2T22YYX1FqLbykhwGiqydUmg8QYUjU4s7ytD8Au4Aep0G9neYv3RTVLg==
X-Received: by 2002:adf:e101:0:b0:351:d386:7356 with SMTP id
 ffacd0b85a97d-351d38673b2mr4903448f8f.37.1715981589926; 
 Fri, 17 May 2024 14:33:09 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502bbbbedbsm22389619f8f.92.2024.05.17.14.33.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 May 2024 14:33:09 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 17 May 2024 23:33:07 +0200
Message-ID: <20240517213307.959706-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715981590; x=1716586390; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xC/EsHAxUuqvO7slU0Ssx1usHHcx+0QeBNP5pY2Kcso=;
 b=kQjLsNAD97oVVaRFGRTM75TKyUW3in/7UrMK7ymGnikYzx954CTx9mSdlEnTA4yB1u
 wx9bNmtNW/cnvb60+tQyDGSQsNe2kJyxsl17IFjk+BvBuhpH6pbFZeolU1mI2I8vy1Ls
 d8OP2hfqdVanXomZAKZQZjddsDmiv1XsXCKCK8ZfhNz7rhInlWJTvZgzf1yMxcBbxLXt
 YmnE3AsMHbQ2DNC4wBpYbPD7uSk/EeOAB36ZUJkGOCnft3wKfa3hWk/GMf5UGjQ+WAjZ
 efWv3xdlOLydh6HaU/+1wEN49DRQpyuM75lPvaekSp2AZTAWCx4zV3zMQXd8SmIyYA3T
 l5EA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=kQjLsNAD
Subject: [Buildroot] [PATCH 1/1] package/mutt: bump to version 2.2.13
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

Mutt 2.2.13 was released on March 9, 2024. This is a bug-fix release,
fixing a possible dangling pointer reference in the SMTP client.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mutt/mutt.hash | 2 +-
 package/mutt/mutt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mutt/mutt.hash b/package/mutt/mutt.hash
index 8c4aae3c1c..72c7924e9b 100644
--- a/package/mutt/mutt.hash
+++ b/package/mutt/mutt.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  043af312f64b8e56f7fd0bf77f84a205d4c498030bd9586457665c47bb18ce38  mutt-2.2.12.tar.gz
+sha256  eb23faddc1cc97d867693f3a4a9f30949ad93765ad5b6fdae2797a4001c58efb  mutt-2.2.13.tar.gz
 sha256  732f24b69a6c71cd8e01e4672bb8e12cc1cbb88a50a4665e6ca4fd95000a57ee  GPL
diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
index 2fe7b92b38..9a6be6d4a0 100644
--- a/package/mutt/mutt.mk
+++ b/package/mutt/mutt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MUTT_VERSION = 2.2.12
+MUTT_VERSION = 2.2.13
 MUTT_SITE = https://bitbucket.org/mutt/mutt/downloads
 MUTT_LICENSE = GPL-2.0+
 MUTT_LICENSE_FILES = GPL
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
