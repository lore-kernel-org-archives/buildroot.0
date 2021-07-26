Return-Path: <SRS0=wdlY=MS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43A63C4338F
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 08:10:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E90D160F51
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 08:10:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E90D160F51
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B8599402A3;
	Mon, 26 Jul 2021 08:10:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nOZr9I9mhCmt; Mon, 26 Jul 2021 08:10:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1452B402A1;
	Mon, 26 Jul 2021 08:10:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 50F701BF293
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 08:10:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4D4CA403CD
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 08:10:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xg-_aKzQPqna for <buildroot@lists.busybox.net>;
 Mon, 26 Jul 2021 08:10:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 283A8403CB
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 08:10:37 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id m19so890314wms.0
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 01:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a2Pi2IIm+0gS++iN+12pKdN1yN5yjw/6ibZASYQ054g=;
 b=kZWF0zeC1AUaF8HOfAeig81oJ8cSN04bwb1awBuNh6aRcnEI71TjQduJjKiQylXeVV
 kLjvh8uNtDx5+wTCGbrAvZGc0e1u7zPCUzJBYaqjNek6L1elIlCjh/d0tHaeQyWRPbU5
 xQrluaw1tyAsMvALQdiByYR6rLb/81tx3leMU2k89+gN2b3WXPi9Zk4kkQ2VT1oBzJd0
 jN1Uv+/MsVCUTS6go9OU3FEdmqSilTQRw3dRfVh+zBUhDUMdkTh+1+nckv1R5O6f6KYZ
 yptmDDREu5lEQO3BGYIvSZQsOJ03IIf64WB47BnuhAos3+VlBkdJ13j4Tx6MMmzCT24A
 5qWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a2Pi2IIm+0gS++iN+12pKdN1yN5yjw/6ibZASYQ054g=;
 b=a4mAPASisivb8CT+/o+nz0L0aD51Gyzv2FJIHt1KQi5DXwYelp37pGPgxjWqYBNiyN
 0Oc0rk31T7ngyontGHiop/bHW6aIEnBDuZYxZo9EdnzpLf9lpwaJS9jNxAZSY04ycenq
 SdmLLb2nCSyrt870KggA8CsYZradlzSGsL6DqTz7VBhu27mRvGiWCt7AIAwTfxDVNib9
 1F7ZsAVKCfHweC7/z+WQHdrFmm9mTUEfeWh3ItXrLSqQGmmhsKsSledfl3XmHK+5oVh5
 VNNl++R6Upb1t7r+ElkP34Q0zjDhOevekpXjjUF9wLvNPVvbE2Ag8Blwz0Ux7KTm8+6P
 4euA==
X-Gm-Message-State: AOAM531a6ICXfgk/9Tw9eHGRJNh/jGOwnFzyqAssFPvBITJzEsd6QszN
 kxyUaXtZfPgvZm8cxz/EpZg7tiRaENdpGQ==
X-Google-Smtp-Source: ABdhPJz7nfELSPxuhvi0MFtwLknPlkgII5eWeIqa2uv0/0rxQVm6/cOkKVs1/HtlRJwe/JH+c0gRHQ==
X-Received: by 2002:a05:600c:4e92:: with SMTP id
 f18mr25184213wmq.62.1627287035988; 
 Mon, 26 Jul 2021 01:10:35 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id r18sm41864603wrt.96.2021.07.26.01.10.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 01:10:35 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 26 Jul 2021 10:10:25 +0200
Message-Id: <20210726081025.1704726-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/cvs: add SELinux module
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Support for cvs is added by the services/cvs module in the SELinux
refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cvs/cvs.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/cvs/cvs.mk b/package/cvs/cvs.mk
index 3d01f335e2..8200997d3a 100644
--- a/package/cvs/cvs.mk
+++ b/package/cvs/cvs.mk
@@ -11,6 +11,7 @@ CVS_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/
 CVS_LICENSE = GPL-1.0+, LGPL-2.0+, LGPL-2.1+ (glob)
 CVS_LICENSE_FILES = COPYING COPYING.LIB lib/glob-libc.h
 CVS_CPE_ID_VENDOR = gnu
+CVS_SELINUX_MODULES = cvs
 CVS_DEPENDENCIES = ncurses
 
 CVS_CONF_ENV = \
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
