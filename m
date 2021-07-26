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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11D52C4338F
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 09:17:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9E1960F02
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 09:17:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C9E1960F02
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B13560845;
	Mon, 26 Jul 2021 09:17:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LxxuyYMvUjLl; Mon, 26 Jul 2021 09:17:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 001FE6062E;
	Mon, 26 Jul 2021 09:17:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0D7121BF23F
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 09:16:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F136F82965
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 09:16:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4HSGZXll_XWH for <buildroot@lists.busybox.net>;
 Mon, 26 Jul 2021 09:16:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0FC71828AF
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 09:16:42 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id e2so10192242wrq.6
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 02:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PJZE/vEhBvWuiVnDf+5FV0gkE0X6IlqJobap6UkJb68=;
 b=ZjWnls/VNoFIWKnWBdxSTe7Jn7uvVCmfsliVXNTAsmzO0B2B+DiJVK54Kz8lCzl3ns
 Ql5NOASA+u0UowH5L8SLoe/AJdUMdHxPrPP+NQ9XESdOdOR05oudnT3zdCcYR/fW/V7A
 91a5UmEK+nkiiSaoUPdY3XRf8169KcolWuTtFzmzhDQsnLiR02f+yZ8Efd4uIw+d0Xr5
 23oWAs38GeM2Zpu9X3N08ZSfb+qVZMXmrMpzWGakw7hpjItv24Q74cg2p2E82OYPUQdB
 tmisvnZLerkzs4fPaW5nKm+6lJcdPv+pt2mhmMvNm0AtIQStMlN7FcKJWtZBImvsxQ18
 v4Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PJZE/vEhBvWuiVnDf+5FV0gkE0X6IlqJobap6UkJb68=;
 b=q1cAjRGAX1agAC92En33m9RFZWb3tKAa6WABhA6wH6t85sfHFXgSf+d+b12vLZsA0A
 9MMZEewJe54krcTZLkECq7O4Hhhq9NpJo0zQ9G5D5xuIZBV1nxXjKt9H6FLkY2CwsGQ+
 hDPFzg/zIvCyBm6ow0SpmDHk36iWdyFomZqtax/vw4tU0IJAfvnYByG3kZQOQ4zbAj3j
 Oxr/6cEXnDFJW5h/D9x1YGV9B2xig4t7LLJ+TlWfu2/5UpvADTCz2yIBAKSRJBnHTPJn
 F3aEvXqHMB08SPqkVXOPOAM18iIQqoKFMpJ3CkS1EglkIn7oMrAL9pYPIGzumkcpAQbU
 W7PA==
X-Gm-Message-State: AOAM530miE3pYxtuCMA+kUOvsFfFwLtv8tfj8vh32iGrv7Lu/fkF4jK6
 ldoIeHg8inxtZfaTrqVQJcGvb+8n27HfXw==
X-Google-Smtp-Source: ABdhPJwQzfycQZcrWHw9380MG5Zo6hJcfbAw2ORZyLMWyhDrnOyNTG+ofCrgfuQcnAueqwUlcfVVkQ==
X-Received: by 2002:a5d:65cb:: with SMTP id e11mr18787068wrw.105.1627291001103; 
 Mon, 26 Jul 2021 02:16:41 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id b15sm49070233wrr.27.2021.07.26.02.16.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 02:16:40 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 26 Jul 2021 11:16:26 +0200
Message-Id: <20210726091626.1712807-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/mpd: add SELinux module
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

Support for mpd is added by the services/mpd module in the SELinux
refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mpd/mpd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 3855125fd8..11f0928378 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -11,6 +11,7 @@ MPD_SITE = http://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 MPD_DEPENDENCIES = host-pkgconf boost
 MPD_LICENSE = GPL-2.0+
 MPD_LICENSE_FILES = COPYING
+MPD_SELINUX_MODULES = mpd
 MPD_CONF_OPTS = \
 	-Daudiofile=disabled \
 	-Ddocumentation=disabled
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
