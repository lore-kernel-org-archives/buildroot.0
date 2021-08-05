Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DDC0C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 20:26:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 399FE60231
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 20:26:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 399FE60231
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C0C74404FF;
	Thu,  5 Aug 2021 20:26:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AeSHQVqFLpcL; Thu,  5 Aug 2021 20:26:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CAD9840287;
	Thu,  5 Aug 2021 20:26:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BEC3A1BF3FD
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 20:26:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AD7FF400CD
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 20:26:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y4la-XYftRAt for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 20:26:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 743A040287
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 20:26:03 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id z4so8136367wrv.11
 for <buildroot@buildroot.org>; Thu, 05 Aug 2021 13:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kVhg0QTbVN+xkZ6JHEljUvVySictkvUCB/vz3j+ZKB8=;
 b=g5AiOR69Sa2M2h/QMAYiQxywmjyC4uoRdt8S4WO9wA/MSpdherKz3gnzX6Ms77AENX
 5ij4PdEvw98QEscTZMYznjafy9R/8jZ4c5MXWJY6u42VzzP2G8bfJaNKukE6b8aMmKF1
 R+hyh/cRN/tbxb3d5L+sJOFtPIeGAcCcytbPyQCASmKXFbiVdWMTS8SBSoNSTS5J7/Uw
 TBLyq5Ajoh2qvmXUBDWjKwTNWWwupLWl+AX72AQMgNtuhRfU4AE/GKdErLm3Ag9w+dGg
 5My1ZOp+VUM/pu2NpZIgXy2q7g0RV9qHwWSNXGmf3WlQ6faoHowcjz0wwXykryAmZHKE
 tn8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kVhg0QTbVN+xkZ6JHEljUvVySictkvUCB/vz3j+ZKB8=;
 b=DqXIwbe2lSqObE/JlI1O0oQ2RwVyFPLMeDGEtrDOwydO+JfyQ5xKaKMWmsxqujAlim
 F05kq0BlQH3U6v3mCy37DRp/vJpbE/UXN5X2l+pPU4gUgpQACzHyvvVFt+vXwl4zEwDF
 V4JInZKrlWkxkTqupdQsaUTSDC3i7MoEPpFccRZHyVdSLov+EWxi6JaDqGP1Zs8heZMN
 LZSmdb3ZcRTmavRjA8Qgr7zh0Ih6LfnyncE0CX/tzIDo8yZp+QZa0R/iMDIcsl+vpsYw
 D9V1uYV2+dTSc0xfhjLxd271k0r0/uKF3jIZLgQ/VWr5NTQt16X9pkD015Gv7PvnnqR2
 sVWQ==
X-Gm-Message-State: AOAM532HT/Lwr/dkAlr8BJQP9ywRdN6Nlb3CQSbbTHhh/hyrVlLERH3J
 51E0GtmvnwUwbSjLalJ2uAL9c46jJbDNoA==
X-Google-Smtp-Source: ABdhPJy856jB42vqMIS7mjAdF/q9AgwDBvjmfbhMgaUtac4/TSKZwCmzESX/1UHUqTuRYFE7SmwitQ==
X-Received: by 2002:a5d:4dc7:: with SMTP id f7mr7378474wru.118.1628195161412; 
 Thu, 05 Aug 2021 13:26:01 -0700 (PDT)
Received: from kali.home (pop.92-184-97-59.mobile.abo.orange.fr.
 [92.184.97.59])
 by smtp.gmail.com with ESMTPSA id q124sm2050930wma.42.2021.08.05.13.26.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 13:26:00 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  5 Aug 2021 22:25:17 +0200
Message-Id: <20210805202517.2665707-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libebml: fix patch
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

Fix patch added by commit 1116a3060955c36c43a8bea5f1f00ea4effb4e48

Fixes:
 - http://autobuild.buildroot.org/results/997d0d6204ad7a5456f25392257c8d876a1289ca

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...riate-header-files-for-std-numeric_limits.patch | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/package/libebml/0001-include-appropriate-header-files-for-std-numeric_limits.patch b/package/libebml/0001-include-appropriate-header-files-for-std-numeric_limits.patch
index 83d1b92051..c7e789c02e 100644
--- a/package/libebml/0001-include-appropriate-header-files-for-std-numeric_limits.patch
+++ b/package/libebml/0001-include-appropriate-header-files-for-std-numeric_limits.patch
@@ -5,7 +5,7 @@ Subject: [PATCH] include appropriate header files for std::numeric_limits
 
 Fixes #80.
 
-[Retrieved from:
+[Retrieved (and updated to remove ChangeLog update) from:
 https://github.com/Matroska-Org/libebml/commit/f0bfd53647961e799a43d918c46cf3b6bff89806]
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
@@ -14,18 +14,6 @@ Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
  src/EbmlUnicodeString.cpp | 1 +
  3 files changed, 6 insertions(+)
 
-diff --git a/ChangeLog b/ChangeLog
-index 034cf86..e4b13a9 100644
---- a/ChangeLog
-+++ b/ChangeLog
-@@ -1,3 +1,7 @@
-+2021-02-27  Moritz Bunkus  <mo@bunkus.online>
-+
-+        * Fix compilation with g++ 11. Fixes #80.
-+
- 2021-02-21 Steve Lhomme <slhomme@matroska.org>
- 
-         * Remove Coremake project files
 diff --git a/src/EbmlString.cpp b/src/EbmlString.cpp
 index 27e55fd..4c05fcf 100644
 --- a/src/EbmlString.cpp
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
