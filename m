Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90C51C4345F
	for <buildroot@archiver.kernel.org>; Thu, 11 Apr 2024 17:43:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 56FFF605FC;
	Thu, 11 Apr 2024 17:43:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id URQjqYzijlHK; Thu, 11 Apr 2024 17:43:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6CE8260619
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6CE8260619;
	Thu, 11 Apr 2024 17:43:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0CA101BF3FC
 for <buildroot@lists.busybox.net>; Thu, 11 Apr 2024 17:43:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ED43F60619
 for <buildroot@lists.busybox.net>; Thu, 11 Apr 2024 17:43:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mGFEp4wrvlFr for <buildroot@lists.busybox.net>;
 Thu, 11 Apr 2024 17:43:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DF6C7605FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF6C7605FC
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DF6C7605FC
 for <buildroot@buildroot.org>; Thu, 11 Apr 2024 17:43:33 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-417f52738fdso103785e9.1
 for <buildroot@buildroot.org>; Thu, 11 Apr 2024 10:43:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712857411; x=1713462211;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FTUsou87mhWJgZwmLPG+OzmWU5okwYKLRGdjhn2V8l0=;
 b=IYGlR+QHfhzNa2PpzrGSIj1mjnEACZ0R60L+Wr6PHH/2kbih4nWeusWcy6jmim0SkY
 1BhYlT2xB+NCgOQ9552VmwHXmc1uR0jqdKTsb5cc+OgKqgP5Mu7prYkCsckTPCZ+nqri
 BhqH8iOgKfehx1Fb9SEXhNYoSnrvXzem60hTpaJsFH9tMuYVXOi2sikYHTQPInKVmflX
 S3pkvOjgzgBxsbCURJ++SZXFSZnnxRjF2rs5bD5JZAe6DNZ7Uzw+P1XyMYEGZXh5SKo1
 Hz9K0RkcpT0R7v0HfZhlG9uPX0CXtEPaPmWyFZTC7SP4OH0VhHh3sFlc6gnRS3LKvIN+
 Thqw==
X-Gm-Message-State: AOJu0YxtiowTW7E65O4BL8xXDWv8gGn+XJ9uvuQvWGCMhfSI799ybLtr
 Rux5kAohqY98W9JK+Z6G3sY0rgXVVLMtlzxJpJVmLK9VpttZeZ1tkUZLxtmr
X-Google-Smtp-Source: AGHT+IFkcO8uqjTtgpPI2kHiGBJgJA8GLNx/4qkUX2bcImRatNA/Lm3M0WB1eDKUEssqHtJg7jrmsw==
X-Received: by 2002:a05:600c:5114:b0:416:605b:584d with SMTP id
 o20-20020a05600c511400b00416605b584dmr374882wms.3.1712857410897; 
 Thu, 11 Apr 2024 10:43:30 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 gw7-20020a05600c850700b004146e58cc35sm6268686wmb.46.2024.04.11.10.43.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Apr 2024 10:43:30 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 11 Apr 2024 19:43:28 +0200
Message-ID: <20240411174328.586338-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712857411; x=1713462211; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FTUsou87mhWJgZwmLPG+OzmWU5okwYKLRGdjhn2V8l0=;
 b=h5KeAgrWHX3GfIsASOEUODnvM43S5It5uVkcTHhXkmZG0CrGPDEHvgRzxyZKNpvx/i
 xjYIBVYMEOKZ34AOmWCmtVLvzVB/QGoX+Zuk+d8oUOKJZXLreSJgVLa7T5uXPyzspzEl
 51SbFadbtXtx8p0xH90G/yQETo7cT9Cm68oT78MDwB+519DGRIyq8DQ0wtBygkAgcSR5
 ytqN3uAXJPhjKYnfEgtqXzuUo1802hN/WH0LsDFhV0I8hSJZhbE/tHA7y6HR1t4yi5h1
 GZt/RxPXUqMQCUL0fMJ/TMGkG8O37c9G74KyQJEVB4Ct7MYWN/jJ48Vxdfh6oUxeJ180
 imsQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=h5KeAgrW
Subject: [Buildroot] [PATCH 1/1] package/ti-sgx-km: needs BR2_ARM_EABIHF
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
 Lothar Felten <lothar.felten@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ti-sgx-km raises the following build failure without BR2_ARM_EABIHF:

eurasiacon/build/linux2/toplevel.mk:230: eurasiacon/build/linux2/moduledefs/target_armel.mk: No such file or directory

Fixes:
 - http://autobuild.buildroot.org/results/17e4da346d062570b9a84ab8eb1ce93c6d7384be
 - http://autobuild.buildroot.org/results/04fd659472f1928c2621354bb0ea3b60c5dfadec

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ti-sgx-km/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ti-sgx-km/Config.in b/package/ti-sgx-km/Config.in
index 964889ff40..3e8a41b755 100644
--- a/package/ti-sgx-km/Config.in
+++ b/package/ti-sgx-km/Config.in
@@ -1,10 +1,10 @@
 comment "ti-sgx-km needs a Linux kernel to be built"
-	depends on BR2_arm
+	depends on BR2_ARM_EABIHF
 	depends on !BR2_LINUX_KERNEL
 
 config BR2_PACKAGE_TI_SGX_KM
 	bool "ti-sgx-km"
-	depends on BR2_LINUX_KERNEL && BR2_arm
+	depends on BR2_LINUX_KERNEL && BR2_ARM_EABIHF
 	select BR2_LINUX_NEEDS_MODULES
 	help
 	  Kernel modules for TI CPUs with SGX GPU.
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
