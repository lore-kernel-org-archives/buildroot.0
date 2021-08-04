Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E0C7C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 10:30:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A15561002
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 10:30:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1A15561002
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4CC283B5D;
	Wed,  4 Aug 2021 10:30:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3YfO3IxSiP5U; Wed,  4 Aug 2021 10:30:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 392AC83ACC;
	Wed,  4 Aug 2021 10:30:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C5B801BF418
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 10:30:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B5EDB83ACC
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 10:30:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fYqgD9aREm_G for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 10:30:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 80DD4832D0
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 10:30:37 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 e25-20020a05600c4b99b0290253418ba0fbso1157490wmp.1
 for <buildroot@buildroot.org>; Wed, 04 Aug 2021 03:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FjNiuZ3NRHcUA7axu0+5OdHzuXc9KQoV0g9e4H9eX/Q=;
 b=cWVDlyGtAL+osCv5LPRQ7Q9ZLW+G4hVvZqDvvpnm+TWKNv+K142SD++/B9foj5G7R+
 OkGhZffk1ujK+Vm+V7kCYiRGZ6Ev0tVryyw9dpAjXdmtPjnKBbDULemzZCIw7R6JVFqg
 Ovm97U7N6RUxVgBJ53y4rT1G1NRCEqU/pfszifVPeI9VVqpD9/y/6heD4iLCD7Vf9kji
 xZs43Drq54rfNSJih0QA/ZNE205+xm1mucZj6D+BiCg9ur3Ngb0THUOSJNHxcnU/Wtnx
 HFyuzuQdarz7MMbOwj8KacDBEpK1TXowH3VPf5BQfnOmHNLyYPlY5VCbCcB+SmdKpkku
 fSIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FjNiuZ3NRHcUA7axu0+5OdHzuXc9KQoV0g9e4H9eX/Q=;
 b=k3W1HLbAf4D+mX06HTUsMmf9rqCApEEiL58nY3jI7e8cFV+HLL9snCsHvUlDT5teR9
 hDgBu+JHXyoyrs1KU3vwFqW9OhaYzNSiyLmBwAGRK8BrwJCgcHB3PoSaeW83jPTR41jn
 krCFT2eAKxs/oybM30ABKnwJnnf1ct1VlEY+PMeR/Ky/OjmbpgrxEQx+1lRynKrJZSih
 vdxHwt9pDtVdt29JcCW/bUxglfqu0Uw8GglT7FbcUKtXAHdVBoNdqFoWQJqh3hCyNMOq
 50+eq8UI6re/ie1k6MVqPyWWoOqj46ir38rfyKDePgolwqsz08JWbgOgFNAdsHbjuzWz
 VmMA==
X-Gm-Message-State: AOAM5315KBdRrGfjy/aPVT/NpJx/V9Q82SDBL8u5gfwp2WZX1nNd0v99
 fleRP1jLSeSwujVJNcEndWZi2dVw0JI9Xg==
X-Google-Smtp-Source: ABdhPJzfAteB3d/4ZYPSLAPUTk6btrBHJZCaWkPI/XR3qHr9cavo3eka7T8tcqA2txK19O2Ht+O2mg==
X-Received: by 2002:a05:600c:4f05:: with SMTP id
 l5mr9074194wmq.96.1628073035506; 
 Wed, 04 Aug 2021 03:30:35 -0700 (PDT)
Received: from kali.home (pop.92-184-97-247.mobile.abo.orange.fr.
 [92.184.97.247])
 by smtp.gmail.com with ESMTPSA id x15sm1987781wrs.57.2021.08.04.03.30.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 03:30:35 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  4 Aug 2021 12:30:24 +0200
Message-Id: <20210804103024.934798-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/xscreensaver: add SELinux module
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
Cc: Simon Dawson <spdawson@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Support for xscreensaver is added by the apps/xscreensaver module in the
SELinux refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/xscreensaver/xscreensaver.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/xscreensaver/xscreensaver.mk b/package/xscreensaver/xscreensaver.mk
index c3c9ec89c3..d2c34679cd 100644
--- a/package/xscreensaver/xscreensaver.mk
+++ b/package/xscreensaver/xscreensaver.mk
@@ -11,6 +11,7 @@ XSCREENSAVER_SITE = https://www.jwz.org/xscreensaver
 XSCREENSAVER_LICENSE = MIT-like, GPL-2.0+
 XSCREENSAVER_LICENSE_FILES = hacks/screenhack.h hacks/glx/chessmodels.h
 XSCREENSAVER_CPE_ID_VENDOR = xscreensaver_project
+XSCREENSAVER_SELINUX_MODULES = xscreensaver
 
 XSCREENSAVER_DEPENDENCIES = \
 	gdk-pixbuf \
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
