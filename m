Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4017CC433FE
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 07:20:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E72B860A46;
	Wed,  2 Nov 2022 07:20:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E72B860A46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1fH2kOYU_W_L; Wed,  2 Nov 2022 07:20:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBFD66072A;
	Wed,  2 Nov 2022 07:20:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CBFD66072A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 92EAD1BF373
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 07:20:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7AE8581C0A
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 07:20:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7AE8581C0A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yidepKB77Lv7 for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 07:20:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6929B80FB3
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6929B80FB3
 for <buildroot@busybox.net>; Wed,  2 Nov 2022 07:20:07 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 r186-20020a1c44c3000000b003cf4d389c41so678928wma.3
 for <buildroot@busybox.net>; Wed, 02 Nov 2022 00:20:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l3A5AMFyLZZeSjMVOwHDFbmO8HAjbMfmLXu+gv3gmRo=;
 b=McY+Ql2m3MHL+Q8z5s3x2Cq/lUCIgYtZ9ruemrLC+uwMaD3ODx7EPZCf4PuBi54Z0q
 DcSQJ2uUgw/bu6t+6o1XfvTT0iTtKB90OPC0XEEuyMkLFUPktYU4PXQs7m8n3YiW7i5Z
 H+CyxcEJ+A2ne5wsLqB+3WIr5SwAwmQBXSKgKhiId2x2gDYEMV/8sXSvinw9FvTSCqjn
 JSnjP5A7vEgoHwLCdzqksKuvrap7MXXa4QmPu78iqJ7sKQIkuL00qiPTm8tUoBW0/ZTD
 RWD9sFa6ueMnA1Vj1LNMBajshWBl/kAKP40S8042VawLHy0UbkrE3nnXvDFR4kXyLrs1
 3j2A==
X-Gm-Message-State: ACrzQf3xhKIZ1m5x+nObxtqK6kWTiWI0SXfy/MoKxcOV5cwea6o+8QU7
 zYr0kFRTOnMGMM8npKvTK8R0X9Rm7Ug=
X-Google-Smtp-Source: AMsMyM68hNYFmxELBI40HNHMCPiPXSa7eFdAemJt5G0MO3yTravo7d7SWQqx3I53CQlCYWMDz155jA==
X-Received: by 2002:a05:600c:54f0:b0:3cf:6b63:4612 with SMTP id
 jb16-20020a05600c54f000b003cf6b634612mr11545499wmb.113.1667373605492; 
 Wed, 02 Nov 2022 00:20:05 -0700 (PDT)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 n6-20020a05600c4f8600b003cf4d99fd2asm1125996wmq.6.2022.11.02.00.20.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 00:20:05 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed,  2 Nov 2022 08:19:57 +0100
Message-Id: <20221102071957.1493594-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=l3A5AMFyLZZeSjMVOwHDFbmO8HAjbMfmLXu+gv3gmRo=;
 b=CGIFzriwITWS4XzW2Z4DoqNSXm3q/4I57mi2Sgbr9mvyhQ9f3tmfOf9pMAJANF/XU3
 zhCZgCXwpeFF/+ZLRkM+P0DVXCTKCyUFEaiYWda+kkbbpYF3IRjExZPOCiTva7lhh/7/
 w4mB6SoTEcQDqYBL4ryg1n/32PuZC3r/hzOzAPAZx89jD7Xm5W0Y9abuo7OqlX1l0j6I
 9WoZLs7TO5dsc/L5nbZxj7tA7InlTXamKyVGB4HvowNy3A5+75cAs2n0bivUs76Z6I06
 epDo8mIyLPWt/eUk/eGzcwNwugKlyRtEbCFHeITUHYxl/5pLbeGY+iQMR1/s2VxHi7bt
 6fwg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=CGIFzriw
Subject: [Buildroot] [PATCH] package/moarvm: bump to version 2022.07
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
 package/moarvm/moarvm.hash | 2 +-
 package/moarvm/moarvm.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/moarvm/moarvm.hash b/package/moarvm/moarvm.hash
index a2a022393..45e8b56e9 100644
--- a/package/moarvm/moarvm.hash
+++ b/package/moarvm/moarvm.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  598ddf88c18f4d3825970cd391eebcaf66984d43ebf1ef43116356365b6bfe60  MoarVM-2022.06.tar.gz
+sha256  337ef04d16f826f99465c653b92006028fe220be68d3dcfd0729612f4f6b5b46  MoarVM-2022.07.tar.gz
 sha256  c53c6b96081b0a5b9b2fb4d0133d55c20e5e00e4c127ade62f03434ee7b3d2de  Artistic2.txt
diff --git a/package/moarvm/moarvm.mk b/package/moarvm/moarvm.mk
index 154a783f2..9820f318b 100644
--- a/package/moarvm/moarvm.mk
+++ b/package/moarvm/moarvm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOARVM_VERSION = 2022.06
+MOARVM_VERSION = 2022.07
 MOARVM_SITE = http://moarvm.com/releases
 MOARVM_SOURCE = MoarVM-$(MOARVM_VERSION).tar.gz
 MOARVM_LICENSE = Artistic-2.0
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
