Return-Path: <SRS0=qoEm=OJ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E87C4C433F5
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 11:45:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABC9E61205
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 11:45:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ABC9E61205
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 64E214023D;
	Sun, 19 Sep 2021 11:45:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vqXQYUemNao2; Sun, 19 Sep 2021 11:45:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3DE6F402AA;
	Sun, 19 Sep 2021 11:45:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 289581BF2BF
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 11:45:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1658C402AA
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 11:45:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NDSVdo4RIcYO for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 11:45:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 23B554023D
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 11:45:53 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id t8so16459818wri.1
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 04:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Mog5HPmKs7iRR7jiO7MryQQ3aLsBrsLPdv7M0O/PVeo=;
 b=qwyhoAe5++AundRS84o/88n0y5Xt4JsW3r2WXWdX5aD4ARvcAXUdnqXAIPymiids2+
 +l5zmffjEhsHvdQ/obPkItZ1aIEMscuIxtWYhKVeCnQVlevu1PQebO7oGrAUOYGn2D24
 XFzeWqhjcZN4b9ZLXJ+GJeJjcO8iDKaRChPlW2UASVrwT5aV8UU3lMilRAkbdQotUFxj
 2tA2ymVefJs4OveXI8lPfnvpF5VJTmQ2k1xfgzwKA7NYWNlkc1T3NUArc3qpfBAHIfLv
 Fk0CqdEnYnViZt4+bZulesKV15rzHfU66Jamg+Vq3+nr8V6ZlaAOtdvTiUNn+hjwjdhK
 lBAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Mog5HPmKs7iRR7jiO7MryQQ3aLsBrsLPdv7M0O/PVeo=;
 b=sHl02+71M+Weve1yMm6ifNmFMcpDfnHKtOsaYptgi8tJ5tGblDvW/Yohs3bftrA5VG
 Im2CUNem3KkCVP+tuzYGfnd2F26cGdWqVwNiP9McaKdmWh0mcjnWgCbRikD6Ao9vN9LQ
 4Om1vkGVVEzc+4+LJGthz7aHDIm5FgfpvoIelmwztZgzeWaYdkfuoPvrLP1Ht67r5V6a
 +W9BIckRGCG35jj0PiHgg0Mz9aGifnlmbvEpwGRUvKzmCGg2HAiWEugqP8JuzfsGjHWV
 LpdjMlS5Fg4L/31esIGInHKSnSQax8gOfWoLVNdSPn2jOzvRnV9UUtY/9nqoEOj4RawQ
 NclQ==
X-Gm-Message-State: AOAM531Q8v9AsS9ymD9qk93v3cbqpQ9ZN/6BC2i4eJicT4mRYA0uQSum
 8yNc/frs7+8UscV9PMOHU/ZZU0ed1CA=
X-Google-Smtp-Source: ABdhPJwTU07/YKYIMrgoFQLVoGnrMlbQhPq7dzXngBDIXNisQXpAjFeWyLbI0x+lYr/epRpB4uht+g==
X-Received: by 2002:adf:9ccc:: with SMTP id h12mr21845615wre.385.1632051951197; 
 Sun, 19 Sep 2021 04:45:51 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8b51:cb00:35ad:6fdd:a5c5:c816])
 by smtp.gmail.com with ESMTPSA id r27sm12607844wrr.70.2021.09.19.04.45.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Sep 2021 04:45:50 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 19 Sep 2021 13:45:47 +0200
Message-Id: <20210919114547.103955-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] toolchain/custom: hide away incompatible gcc
 versions
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Some CPUs have a requirement on a minimal gcc version. Until now, ot was
possible to use a custom external toolchain that has a gcc older than
the requirement, which would lead to build failures (early!) during the
build.

Propagate the gcc version requirement down to the external toolchain gcc
version choice. By limiting the selection to acceptable gcc versions, we
inform the user that its toolchain is too old, and if they decide to lie
and select one of available version, we still check that when we extract
and install their toolchain.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Romain Naour <romain.naour@gmail.com>
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 .../Config.in.options                          | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index ae78c0ef9e..99d5b7df42 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -31,60 +31,78 @@ choice
 	  Set to the gcc version that is used by your external
 	  toolchain.
 
+	  If the gcc version in your toolchain is not available below,
+	  then your toolchain is too old to be used in the current
+	  configuration (e.g. your CPU requires a more recent gcc
+	  version).
+
 config BR2_TOOLCHAIN_EXTERNAL_GCC_11
 	bool "11.x"
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 
 config BR2_TOOLCHAIN_EXTERNAL_GCC_10
 	bool "10.x"
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 
 config BR2_TOOLCHAIN_EXTERNAL_GCC_9
 	bool "9.x"
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
 
 config BR2_TOOLCHAIN_EXTERNAL_GCC_8
 	bool "8.x"
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_9
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_8
 
 config BR2_TOOLCHAIN_EXTERNAL_GCC_7
 	bool "7.x"
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_8
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_7
 
 config BR2_TOOLCHAIN_EXTERNAL_GCC_6
 	bool "6.x"
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_7
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_6
 
 config BR2_TOOLCHAIN_EXTERNAL_GCC_5
 	bool "5.x"
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_6
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_5
 
 config BR2_TOOLCHAIN_EXTERNAL_GCC_4_9
 	bool "4.9.x"
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_5
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
 config BR2_TOOLCHAIN_EXTERNAL_GCC_4_8
 	bool "4.8.x"
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_4_9
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 
 config BR2_TOOLCHAIN_EXTERNAL_GCC_4_7
 	bool "4.7.x"
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_4_8
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
 
 config BR2_TOOLCHAIN_EXTERNAL_GCC_4_6
 	bool "4.6.x"
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_4_8
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_6
 
 config BR2_TOOLCHAIN_EXTERNAL_GCC_4_5
 	bool "4.5.x"
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_4_8
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
 
 config BR2_TOOLCHAIN_EXTERNAL_GCC_4_4
 	bool "4.4.x"
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_4_8
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_4
 
 config BR2_TOOLCHAIN_EXTERNAL_GCC_4_3
 	bool "4.3.x"
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_4_8
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_3
 
 config BR2_TOOLCHAIN_EXTERNAL_GCC_OLD
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
