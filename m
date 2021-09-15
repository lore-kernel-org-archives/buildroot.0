Return-Path: <SRS0=vgbW=OF=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C00CEC433FE
	for <buildroot@archiver.kernel.org>; Wed, 15 Sep 2021 21:01:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6EBDD60F25
	for <buildroot@archiver.kernel.org>; Wed, 15 Sep 2021 21:01:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6EBDD60F25
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1CB8982A83;
	Wed, 15 Sep 2021 21:01:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h2s_pzzpvmfN; Wed, 15 Sep 2021 21:01:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7929282A56;
	Wed, 15 Sep 2021 21:01:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 03C101BF2AA
 for <buildroot@lists.busybox.net>; Wed, 15 Sep 2021 21:01:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0142882A56
 for <buildroot@lists.busybox.net>; Wed, 15 Sep 2021 21:01:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MHt4WDbkOGyM for <buildroot@lists.busybox.net>;
 Wed, 15 Sep 2021 21:01:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1231D82A29
 for <buildroot@buildroot.org>; Wed, 15 Sep 2021 21:01:34 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id d21so5906556wra.12
 for <buildroot@buildroot.org>; Wed, 15 Sep 2021 14:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gGwKilNXeLt80qzlNQoi35Dynpu1P8KeWevu5GHkn0E=;
 b=LWs0cSsfs3sAvsomPtZOU3WKQpv3GlYcyTmnj3qkhVhuKT64/DH/Gq2Ark/CWz6BqB
 /C0yZQOITLNlYiIbonQ6yoIU7B+HOb/9R5YVWCeGMWOLw/dW0/0H15hNlmzg62cy/ZYk
 F7cARqYEQjnS0+VPACmC+BqHxBWcGTfTz+34RT/7+AZmS0t3/lgZin95PZsbX+cPoy0w
 DTi3Teh3ChKpLkE9DfqVHclTczxkLhUs6OjekXsVgIRW0RjpdrbHmbxidWaEvZb44Yok
 hvS58zbIAwlyK/wYp/E+0ZPr/8EItGyC1azH1qyRWq4U0k3QB92v2T0BJ60nLzvUn9N+
 UD6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gGwKilNXeLt80qzlNQoi35Dynpu1P8KeWevu5GHkn0E=;
 b=I7ixl3IvlxYvrZrTeCMEb20KtM9n/1Z6TXxOV3Q8CY6+CSVK7btIQLNATOlAHcwiRw
 UyikecSnCCPbZZvx2959zy+j1E8azRzn0SU79K8b8yG4G6PtwzIiG7BJXWmCGiJJgbSx
 kNpkoHnG12PXEZ9BMxFHr6W4KPHC7heQWjo6LK45MdkmVnwgqYRKP2q+XDTBxPiqt5Uj
 Hr/fMelDC2s/buA7NYPo3HoAMHRS6ZuZRU+CurHeViQ5v0T9+u6gJIYigJdU2Jkpjdhh
 gWEM5qXa92RMFmM6iUigqnlgx2Q0+VG+q8ER+5U9Q24hHrQ73XvzqKeFXbYUWkpW3GP6
 z3eg==
X-Gm-Message-State: AOAM531ZlrKZ0ovLJ+ihlqQWcaNWpJHJ1wRHreEPulKOFX7ob+DvAa/Y
 RSw5UNu2BvXwlJgilSlsOqgAYfcHhKU=
X-Google-Smtp-Source: ABdhPJxnu814E42UayG2c/aF4SJhT+4Io0I85Tze3HrEESDdf8AXfkMt1QGxCEpydPBOGwHG+S0FpA==
X-Received: by 2002:a5d:4388:: with SMTP id i8mr2143498wrq.340.1631739692865; 
 Wed, 15 Sep 2021 14:01:32 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id n3sm1045655wmi.0.2021.09.15.14.01.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Sep 2021 14:01:32 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 15 Sep 2021 23:01:26 +0200
Message-Id: <20210915210126.1414751-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/containerd: security bump to
 version 1.4.9
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

- Fix CVE-2021-32760:
  https://github.com/containerd/containerd/security/advisories/GHSA-c72p-9xmj-rx3w
- Update indentation in hash file (two spaces)

https://github.com/containerd/containerd/releases/tag/v1.4.9
https://github.com/containerd/containerd/releases/tag/v1.4.8
https://github.com/containerd/containerd/releases/tag/v1.4.7
https://github.com/containerd/containerd/releases/tag/v1.4.6
https://github.com/containerd/containerd/releases/tag/v1.4.5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/containerd/containerd.hash | 4 ++--
 package/containerd/containerd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/containerd/containerd.hash b/package/containerd/containerd.hash
index b3cb3e47ad..eb0bafff1b 100644
--- a/package/containerd/containerd.hash
+++ b/package/containerd/containerd.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256  ac62c64664bf62fd44df0891c896eecdb6d93def3438271d7892dca75bc069d1  containerd-1.4.4.tar.gz
-sha256	4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4  LICENSE
+sha256  3bb9f54be022067847f5930d21ebbfe4e7a67f589d78930aa0ac713492c28bcc  containerd-1.4.9.tar.gz
+sha256  4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4  LICENSE
diff --git a/package/containerd/containerd.mk b/package/containerd/containerd.mk
index 761e08003c..eb5da65433 100644
--- a/package/containerd/containerd.mk
+++ b/package/containerd/containerd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CONTAINERD_VERSION = 1.4.4
+CONTAINERD_VERSION = 1.4.9
 CONTAINERD_SITE = $(call github,containerd,containerd,v$(CONTAINERD_VERSION))
 CONTAINERD_LICENSE = Apache-2.0
 CONTAINERD_LICENSE_FILES = LICENSE
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
