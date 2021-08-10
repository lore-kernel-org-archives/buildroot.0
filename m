Return-Path: <SRS0=7M6N=NB=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1A8BC4320E
	for <buildroot@archiver.kernel.org>; Tue, 10 Aug 2021 08:28:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7597360FD8
	for <buildroot@archiver.kernel.org>; Tue, 10 Aug 2021 08:28:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7597360FD8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B54A40525;
	Tue, 10 Aug 2021 08:28:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 96XGu4oOmKUM; Tue, 10 Aug 2021 08:28:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AEF0E40527;
	Tue, 10 Aug 2021 08:28:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 220281BF2F4
 for <buildroot@lists.busybox.net>; Tue, 10 Aug 2021 08:28:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1152D40529
 for <buildroot@lists.busybox.net>; Tue, 10 Aug 2021 08:28:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 12TkDhUM-ZOM for <buildroot@lists.busybox.net>;
 Tue, 10 Aug 2021 08:28:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 89AA64051E
 for <buildroot@buildroot.org>; Tue, 10 Aug 2021 08:28:03 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 k38-20020a05600c1ca6b029025af5e0f38bso1320548wms.5
 for <buildroot@buildroot.org>; Tue, 10 Aug 2021 01:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cUDCpSSAjV7wl9PlcRcgctrBSMrVJ7Xg0jMdckfaSJ0=;
 b=pH/wt0ZFYPYXL5sqqAzfBySGO4mgoEFaqO83+cTlPnNp+1cV8L4XT0xDwAG9hVGFnp
 HMzPDGd/MlF3gGev2OveZ9oCpmNih7GA/UkAB0BFHdye87EbyzIipOZvCgoYI6raMxNr
 xXiCKwmngSYpEASwK+HI3gPOrGcniJKyhP9nrVi2BmdjTUiybqhhpvAm6fc+Y9RbmCJm
 sbxSYt8TJKcTGkp61VA/dCQoPNWkkkKTIjHYSVwn5YOWVsO2ZaknClcktEqpE59Zpts7
 JdCTLg5xMzv+EoIXRn1y1UmuYdJlODkPtJ8A5VQjxjH999wS3T2jCZ0CC1aN+w83sZYX
 uWog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cUDCpSSAjV7wl9PlcRcgctrBSMrVJ7Xg0jMdckfaSJ0=;
 b=Io3ymyXxqLf4U+AxGGyG3zX4+QaGOXpFrblpYMlL04heSxePVmFBt4dg4ZRHTnkez8
 aXdJBCRqRRLpmeLxfkjjIZnUVHwhvSmxHWRjUi0lZuZJOVDz/ksbt4x51b1hjkjGyCtz
 PGh8HBDBEC2ofu5VbxpCJUERYTs210nRLPVDnUclq1SDsSKQprQOfFCS4gwHfyOYZbV+
 LmNEJOiVM0dJ3QchPrfdg02aqMfzSr+TPdZCwJ651bNIlKJ+99M/+zo3Yu+MBpUMbTau
 eBRtrDfDMNMIbvyJnYirvlOuMWuht0IC1LjnzLEthyjIoeq98fcIsosoPOFpYgeh9EGQ
 YF2Q==
X-Gm-Message-State: AOAM530aiYi+2dC+eQDUaF0Q6dr48fBaoj6Bf6jGMyH3Ia9omd+qj5CT
 P8BO7ZlVlyZQt53E/eCx45PTu+ZPKKlkOA==
X-Google-Smtp-Source: ABdhPJzCTBsUhCPbHmuPv8G0uYX231leZoRcE6f1X8QHAAnu7ML94l2bdpMy8W7pB0IeDy34PHsx+A==
X-Received: by 2002:a05:600c:4fd3:: with SMTP id
 o19mr21336173wmq.34.1628584081413; 
 Tue, 10 Aug 2021 01:28:01 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id m14sm22328721wrs.56.2021.08.10.01.28.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Aug 2021 01:28:00 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 10 Aug 2021 10:27:44 +0200
Message-Id: <20210810082744.2967433-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/usbguard: needs std::future
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Kamel Bouhara <kamel.bouhara@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

usbguard needs std::future to avoid the following build failure raised
since the addition of the package in commit
fbff7d7289cc95db991184f890f4ca1fcf8a101e:

In file included from src/Library/IPCClientPrivate.hpp:37:0,
                 from src/Library/IPCClientPrivate.cpp:24:
/home/buildroot/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/arm-none-linux-gnueabi/include/c++/4.8.3/future:122:11: error: declaration of 'class std::promise<std::unique_ptr<google::protobuf::Message> >'
     class promise;
           ^
src/Library/IPCClientPrivate.cpp: In member function 'usbguard::IPC::MessagePointer usbguard::IPCClientPrivate::qbIPCSendRecvMessage(usbguard::IPC::MessageType&)':
src/Library/IPCClientPrivate.cpp:244:26: error: invalid use of incomplete type 'class std::promise<std::unique_ptr<google::protobuf::Message> >'
     auto future = promise.get_future();
                          ^
Fixes:
 - http://autobuild.buildroot.org/results/1c4e0dab5917e5559a97f7cf7a99e30a2b561fc9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/usbguard/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/usbguard/Config.in b/package/usbguard/Config.in
index 41f19dc1a0..ca6d52034b 100644
--- a/package/usbguard/Config.in
+++ b/package/usbguard/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_USBGUARD
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # protobuf
 	depends on !BR2_STATIC_LIBS # libqb, protobuf
 	depends on !BR2_TOOLCHAIN_USES_MUSL
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::future
 	select BR2_PACKAGE_PROTOBUF
 	select BR2_PACKAGE_LIBQB
 	select BR2_PACKAGE_LIBSODIUM if !BR2_PACKAGE_LIBGCRYPT && !BR2_PACKAGE_LIBOPENSSL
@@ -23,3 +24,7 @@ comment "usbguard needs a glibc or uClibc toolchain w/ C++, threads, dynamic lib
 		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 \
 		|| BR2_TOOLCHAIN_USES_MUSL
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
+
+comment "usbguard needs a toolchain not affected by GCC bug 64735"
+	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
