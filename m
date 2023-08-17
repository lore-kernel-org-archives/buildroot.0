Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1678DC64EB4
	for <buildroot@archiver.kernel.org>; Thu, 17 Aug 2023 20:59:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A235683EB5;
	Thu, 17 Aug 2023 20:59:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A235683EB5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TU9aQvRZl0PD; Thu, 17 Aug 2023 20:59:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D526383EB9;
	Thu, 17 Aug 2023 20:59:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D526383EB9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8C4591BF215
 for <buildroot@lists.busybox.net>; Thu, 17 Aug 2023 20:59:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 652E241B91
 for <buildroot@lists.busybox.net>; Thu, 17 Aug 2023 20:59:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 652E241B91
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8z1KZ_urqaas for <buildroot@lists.busybox.net>;
 Thu, 17 Aug 2023 20:59:00 +0000 (UTC)
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 700CE40880
 for <buildroot@buildroot.org>; Thu, 17 Aug 2023 20:59:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 700CE40880
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-26d1a17ce06so164179a91.0
 for <buildroot@buildroot.org>; Thu, 17 Aug 2023 13:59:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692305939; x=1692910739;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R1ACUUlx+FKydQ71T9VEOtN15HgUPnb58+kVIWcwcc8=;
 b=O5h/RK7PZzjqeuN8ogiXsmzCqQYRWRqABE1C6OVgixBa7ohHAqS1JVTas8dITkZyhL
 iij80NqfVLykecY2Dc1PJw19Ip9F6ONSQzzATlgpGUygEXOgBIs7CSUsKrssAbLAwNJH
 qI3l1E2tRFUcqQtD+44CL21qmOxPISkGJD6TKgA4uVwbT4XaaEmz/J/MnpCXXcECx62U
 e92urbnbnyLDsQX1ZPA267x/N4BhUArpTLgQxi7wtvNzaB7fBuwrT9M52q92tMqN+RVX
 tMvHeOshfmYvh6rJuMlDHGqRAjFoO1d3dYbIybxhGe/JUa+9CjZa2D28B5h3mNBamvgk
 2G3A==
X-Gm-Message-State: AOJu0YxXWhLj9oD/3jJ1HHAVVz8z+5HiTtnT8ogAQ3/VH5NpraoOnVwH
 u1iWp0PaiiOOqpThDo5zzwa5d8AjEdXU+M298zU=
X-Google-Smtp-Source: AGHT+IFECo+ReBUhmXruGv7Z04fRsrgX6P6Jm8Z5KFhJdCGhqP4x+zsaGssn80cXhQbV7ZKzWiYKXg==
X-Received: by 2002:a17:90a:6806:b0:269:3498:3bad with SMTP id
 p6-20020a17090a680600b0026934983badmr603724pjj.14.1692305939425; 
 Thu, 17 Aug 2023 13:58:59 -0700 (PDT)
Received: from fedora.amarulasolutions.com ([75.174.130.12])
 by smtp.gmail.com with ESMTPSA id
 l22-20020a17090a3f1600b0026d034f6badsm243143pjc.38.2023.08.17.13.58.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Aug 2023 13:58:58 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 17 Aug 2023 14:58:49 -0600
Message-ID: <20230817205855.1556239-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230817205855.1556239-1-adam.duskett@amarulasolutions.com>
References: <20230817205855.1556239-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1692305939; x=1692910739;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R1ACUUlx+FKydQ71T9VEOtN15HgUPnb58+kVIWcwcc8=;
 b=UpcX7P+RNoy/gOES6iQKDiipidKKFhejP1ca5lkEppHhhrc8EGovCehAgdtsIZ7FNg
 KV1JLldJpAdu++jHfsW9rii8b+zypKmq7NuBytLdMqNUQ9B0e4NgB6kdh2sjdwxJzS4t
 VUIVLJodHNS23e4EuOLfXO7PXADNqD/j+p/HA=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=UpcX7P+R
Subject: [Buildroot] [PATCH v4] package/python-httplib2: add host variant
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
 Adam Duskett <adam.duskett@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is needed for the host-depot-tools package.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/python-httplib2/python-httplib2.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-httplib2/python-httplib2.mk b/package/python-httplib2/python-httplib2.mk
index 1093ecab39..2f4eb98356 100644
--- a/package/python-httplib2/python-httplib2.mk
+++ b/package/python-httplib2/python-httplib2.mk
@@ -14,3 +14,4 @@ PYTHON_HTTPLIB2_CPE_ID_VENDOR = httplib2_project
 PYTHON_HTTPLIB2_CPE_ID_PRODUCT = httplib2
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
