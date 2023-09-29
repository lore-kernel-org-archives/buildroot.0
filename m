Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96F80E728CC
	for <buildroot@archiver.kernel.org>; Fri, 29 Sep 2023 17:28:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33E0283CC9;
	Fri, 29 Sep 2023 17:28:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33E0283CC9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EXirIswGpRjK; Fri, 29 Sep 2023 17:28:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 244FC83D14;
	Fri, 29 Sep 2023 17:28:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 244FC83D14
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6A9A41BF83B
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 17:27:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4281583CE2
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 17:27:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4281583CE2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ozibq4dTcDWj for <buildroot@lists.busybox.net>;
 Fri, 29 Sep 2023 17:27:54 +0000 (UTC)
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1F97E83CD3
 for <buildroot@busybox.net>; Fri, 29 Sep 2023 17:27:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F97E83CD3
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-533d9925094so14868483a12.2
 for <buildroot@busybox.net>; Fri, 29 Sep 2023 10:27:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696008472; x=1696613272;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oQ7gsE5J4DTZbwg2BQmCxTn403C1ER0XD16evZXXJ8Y=;
 b=Dug49wdzAeYwD9HyiHM3pHH4mv4h87pPf84X0GsADV2QTgDb6O+rawYzc8NYXZsTdH
 gKAA0sNqSgS4Hr9OdBGi9thd80wFH2qn5rC5ruRwB3tr+9doDvfACozWk0NEf3l52mIS
 zzl4EXW4Y+f55W2EGEqtmFmlkKUV3ZivMYLXIyGH3KmOGLf1A2yell2HRrQ/jEhZcGRy
 EEvMuzaKyPMlV71tRtYgIZrKqe1KwNe9TzO6YxSzLlSx196SEVD8iGYPQSPgRP26M5xW
 wpFEH7xncooeCF1Sn/J70jRVv99vD5AqJNqWrzuzNYMq6eS8ePdoduIAn/L2IhXdqpzx
 MsYw==
X-Gm-Message-State: AOJu0Yzny2RP73J8F3I0WFbMCle/+vRTTjTl2IS0EZpiJXPqz1Ht4PGO
 uf5sbzLXbwZ//Y/Jgwer0G6QNsmIec0=
X-Google-Smtp-Source: AGHT+IFSpt98kY/lBuC5iN7QJDzEyxTAwa5iig9CDwABN9rVJr9rFM1tROwJlQOYSBGu77DPtWHPSA==
X-Received: by 2002:a17:906:309b:b0:9ae:6c76:fc5e with SMTP id
 27-20020a170906309b00b009ae6c76fc5emr4761552ejv.69.1696008471922; 
 Fri, 29 Sep 2023 10:27:51 -0700 (PDT)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 cy23-20020a0564021c9700b005362c9905b2sm2509307edb.35.2023.09.29.10.27.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Sep 2023 10:27:51 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Fri, 29 Sep 2023 19:27:49 +0200
Message-Id: <20230929172749.3214653-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696008472; x=1696613272; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oQ7gsE5J4DTZbwg2BQmCxTn403C1ER0XD16evZXXJ8Y=;
 b=TMjDnIefAHKMLUzNu9KvqtDCtO/E9kGVEV3IRYZQCysc3n9Xia5ZkKibFXhUbszbJN
 KgaQbiX19gx6gQ0oXF2HL4ROdiJz/JEJ7FyypB1YNBr03yxPDP9VvoTzFwNJougfMnLT
 LBlFQh8iqNXu2OqKqGt2jus4gy416Xcr/QKrONcd8BDrrABBLjChBLY82mb0EzaHihhY
 YjZp1UmxfS71MYmGTzKHeCtLgi2agZf3asgDFhKyzg4Z2yjm1QZgpXmmXWfWxeFe1tnD
 vmAh0uc1GZ8pnLGrV3YuJeUJMhCok6q1jv5YFdLxi5kmCFK1GqdclK17MtkC7X8QpfEa
 gEsg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=TMjDnIef
Subject: [Buildroot] [PATCH] package/mosquitto: bump to version 2.0.18
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
 package/mosquitto/mosquitto.hash | 4 ++--
 package/mosquitto/mosquitto.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mosquitto/mosquitto.hash b/package/mosquitto/mosquitto.hash
index df0a51df3..453c1934d 100644
--- a/package/mosquitto/mosquitto.hash
+++ b/package/mosquitto/mosquitto.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking gpg signature
-# from https://mosquitto.org/files/source/mosquitto-2.0.17.tar.gz.asc
-sha256  3be7a911236567c1a9fbe25baf3e3167004ba4a0c151a448ef1f7fc077dba52f  mosquitto-2.0.17.tar.gz
+# from https://mosquitto.org/files/source/mosquitto-2.0.18.tar.gz.asc
+sha256  d665fe7d0032881b1371a47f34169ee4edab67903b2cd2b4c083822823f4448a  mosquitto-2.0.18.tar.gz
 
 # License files
 sha256  d3c4ccace4e5d3cc89d34cf2a0bc85b8596bfc0a32b815d0d77f9b7c41b5350c  LICENSE.txt
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index 0b85246f3..b847e56fe 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOSQUITTO_VERSION = 2.0.17
+MOSQUITTO_VERSION = 2.0.18
 MOSQUITTO_SITE = https://mosquitto.org/files/source
 MOSQUITTO_LICENSE = EPL-2.0 or EDLv1.0
 MOSQUITTO_LICENSE_FILES = LICENSE.txt epl-v20 edl-v10
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
