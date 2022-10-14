Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F09AC433FE
	for <buildroot@archiver.kernel.org>; Fri, 14 Oct 2022 22:08:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9C0560BE7;
	Fri, 14 Oct 2022 22:07:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9C0560BE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5CyPthHzOkAL; Fri, 14 Oct 2022 22:07:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BECE860BBC;
	Fri, 14 Oct 2022 22:07:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BECE860BBC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DF6CB1BF844
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 22:07:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C88AB40390
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 22:07:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C88AB40390
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wpfW1suqljHA for <buildroot@lists.busybox.net>;
 Fri, 14 Oct 2022 22:07:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B3BF14036F
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B3BF14036F
 for <buildroot@buildroot.org>; Fri, 14 Oct 2022 22:07:54 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 fn7-20020a05600c688700b003b4fb113b86so4681036wmb.0
 for <buildroot@buildroot.org>; Fri, 14 Oct 2022 15:07:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=S9hvSi/jUrUcVNl2xnFl+pI8Uc2M30UHU8beM+dcTSc=;
 b=JBTg9HltCm9n4RIFG+2N1xyCEHit0HUvlZGgScCAQJcehFgTmMfC5u/vCUdMtQ8vsS
 DSTbt+6H1Fq8umHdm8/5HWGGoVzC589E7dEvvlkHT83oXKtGbadMEkzpDxVbVKE170sZ
 bNeOBdT8zdlzp8Qru4lGMYT3JnhifxyZU0l9ArZ93gRTHFnHboC1HiXlpHGUcwdpx4FT
 cQ4VyidMzqi02U50n/NDt19UBlv7dHlBHUrPwALQPyitXCdz4eMJsTriwqRyutWVSe9I
 qkf4PZDe3oy+t1IpuMW0MIL3/BvkN+NUi7Yl9V2B67Mj0lwAWaf3bUI/CnGhFAA7XQ61
 8IoA==
X-Gm-Message-State: ACrzQf3K+TZXy108CfYIcY/C3XITMSMTYOxHJunuibaDbmcafeO6KU2f
 I/IyjsgCUzRIwQzp7R7guclVof39Wq4=
X-Google-Smtp-Source: AMsMyM5qak9c5U5t7baYOiSPuUbgVWhmsTXmDrsqiM7GHJk4ndOGwUVcdyG1ZlViVYC/yWj+9dAzAA==
X-Received: by 2002:a05:600c:2f08:b0:3c6:befc:9778 with SMTP id
 r8-20020a05600c2f0800b003c6befc9778mr4958490wmn.101.1665785272313; 
 Fri, 14 Oct 2022 15:07:52 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 q65-20020a1c4344000000b003a8434530bbsm8143221wma.13.2022.10.14.15.07.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Oct 2022 15:07:51 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 15 Oct 2022 00:07:48 +0200
Message-Id: <20221014220748.14254-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=S9hvSi/jUrUcVNl2xnFl+pI8Uc2M30UHU8beM+dcTSc=;
 b=T0focwz8kPhQwJrPYkc562uWiUS8grqlVy6dNakodmu148qYA1KAFbf+AdWx5c5m2u
 Y6GiNq822v758vdkqeqgMG0/hCf9r81gXfObpPHTEBjoc/NnwdF+NpWE1odOL+bYH8eo
 eDaVEY2u7WA5c0GN3hfUWffcJqhsDjKcqgS8GDbiTAmNuQ17U+FaZld9lsLuuUW0t6va
 m4RgY4p2vGV0nrdPTSGcMIZwqYYZnYrqfBXmfvjT3y1jsmbHb6aifYbB0dvR2+OOck3a
 TQKAgKutBLKZ7+h4YC1HLUigZELnGCdf8POf//1V9D2hhnqdI21h+0YbJZCFRDLbnlha
 vlvg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=T0focwz8
Subject: [Buildroot] [PATCH 1/1] package/freerdp: security bump to version
 2.8.1
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix CVE-2022-39282 and CVE-2022-39283

https://github.com/FreeRDP/FreeRDP/releases/tag/2.8.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/freerdp/freerdp.hash | 4 ++--
 package/freerdp/freerdp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/freerdp/freerdp.hash b/package/freerdp/freerdp.hash
index a600a96172..94d0746d40 100644
--- a/package/freerdp/freerdp.hash
+++ b/package/freerdp/freerdp.hash
@@ -1,5 +1,5 @@
-# From https://pub.freerdp.com/releases/freerdp-2.8.0.tar.gz.sha256
-sha256  fd26a41c367ea1f23a06716725d19efa41fd572c4536348d39b3465b116b3703  freerdp-2.8.0.tar.gz
+# From https://pub.freerdp.com/releases/freerdp-2.8.1.tar.gz.sha256
+sha256  ea8903b29914134202a972c06052432678c89cb5eebcc8f5a41553030c97376b  freerdp-2.8.1.tar.gz
 
 # Locally calculated
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index c7e01fa541..ae844c589e 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREERDP_VERSION = 2.8.0
+FREERDP_VERSION = 2.8.1
 FREERDP_SITE = https://pub.freerdp.com/releases
 FREERDP_DEPENDENCIES = libglib2 openssl zlib
 FREERDP_LICENSE = Apache-2.0
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
