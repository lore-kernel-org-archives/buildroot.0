Return-Path: <SRS0=yDzA=MT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B575FC4338F
	for <buildroot@archiver.kernel.org>; Tue, 27 Jul 2021 10:13:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5EC2761527
	for <buildroot@archiver.kernel.org>; Tue, 27 Jul 2021 10:13:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5EC2761527
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1FCFE4033D;
	Tue, 27 Jul 2021 10:13:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 49PVV1iLsk5o; Tue, 27 Jul 2021 10:13:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 452D940324;
	Tue, 27 Jul 2021 10:13:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 85CF41BF279
 for <buildroot@lists.busybox.net>; Tue, 27 Jul 2021 10:13:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6FA814010D
 for <buildroot@lists.busybox.net>; Tue, 27 Jul 2021 10:13:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V6k3abuBgh27 for <buildroot@lists.busybox.net>;
 Tue, 27 Jul 2021 10:13:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 362AA400DB
 for <buildroot@buildroot.org>; Tue, 27 Jul 2021 10:13:00 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id k4so7192534wms.3
 for <buildroot@buildroot.org>; Tue, 27 Jul 2021 03:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=i8/2G/dxpgYym8NqaVGQHEIrpUgH+QgCAWY0Qb+MlBM=;
 b=J/k0lV7XF7/Kok3X9yIT8f8rbzOraiBFTGkC6SYVK5ae9qE32If0aASwpiplpIRI6A
 sPhzMZUIaqsOJpRnSwXZJdMASPi7rgK9rG9ipjXJhjpgYeIogkhK3MFJ9GShBBgRXixK
 8jBxetTVfVhvxBOMLfP/33FR4hNXcznlTCV52+DxzUlnqfa0PKDuZ+qCaZMV5134B4GZ
 otkT2A5uj23JBdbwjIGc6LSCs4B5VR91PNIvJyOOSob5uMu6Cg7i+xchcrgdTSHYOPW7
 Q0mOXT572iomel48HmXrdIqlH78rqHzGzvzGw79rIPbTjlDb0DpGpmWJjzbHyUGQmK8N
 4Eyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=i8/2G/dxpgYym8NqaVGQHEIrpUgH+QgCAWY0Qb+MlBM=;
 b=jGlNjOyig/klcY4fICD0VEt0vjVwelQ7qPT0AduQK/Mjiqp/qbIWgzOQHhSVOe+8rX
 S66t+q1ndUBqsrmPSStDTBacADzJYliGmZJPwQajT2gvyIQOIEabaiDyifQ0ur7goZtH
 fO832SEaswv9gUQsKzOmKOmq/TUYGiqJ/9hspHUjRj1VfqtVcI83Avbs8CZgsWvv9xIM
 5KAn7ycQ7H/N+TLilEqTzQqq16xpfK3BOryBcxzMpLXFrIPF9egyTTAaofkAVMBH0EAc
 zijgmAYzOdUmorb6UzOm3isLM375W8f7PJepb9Gzvy3Ni9sz6NLsGeOxMj+gmhSh7gOE
 /vIg==
X-Gm-Message-State: AOAM532B1qojYIey/LdXohEFwOGJctx63cMOzZKS5xCaxoFjzPxBK9pI
 KaoJYWfGFvGEnsk76nvKDOFqlCsJwbaCqw==
X-Google-Smtp-Source: ABdhPJwph09PvhA4oBH8Y6LCBEVxwxRyyGAXr3a77ztqknf6PxYDda2i40UiWI28jdhWVOKQZnL0QA==
X-Received: by 2002:a05:600c:2194:: with SMTP id
 e20mr6919187wme.77.1627380778034; 
 Tue, 27 Jul 2021 03:12:58 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id n17sm2544636wmo.18.2021.07.27.03.12.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 03:12:57 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 27 Jul 2021 12:12:24 +0200
Message-Id: <20210727101224.2318898-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libupnp: bump to version 1.14.7
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

https://github.com/pupnp/pupnp/releases/tag/release-1.14.7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libupnp/libupnp.hash | 2 +-
 package/libupnp/libupnp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libupnp/libupnp.hash b/package/libupnp/libupnp.hash
index e4858fdc8a..f7fdb6d521 100644
--- a/package/libupnp/libupnp.hash
+++ b/package/libupnp/libupnp.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  3168f676352e2a6e45afd6ea063721ed674c99f555394903fbd23f7f54f0a503  libupnp-1.14.6.tar.bz2
+sha256  7b66ac4a86bc0e218e2771ac274b2945bc4154bf9054e57b14afb67c26ac7c24  libupnp-1.14.7.tar.bz2
 sha256  c8b99423cad48bb44e2cf52a496361404290865eac259a82da6d1e4331ececb3  COPYING
diff --git a/package/libupnp/libupnp.mk b/package/libupnp/libupnp.mk
index e8ece46542..7457d2644a 100644
--- a/package/libupnp/libupnp.mk
+++ b/package/libupnp/libupnp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUPNP_VERSION = 1.14.6
+LIBUPNP_VERSION = 1.14.7
 LIBUPNP_SOURCE = libupnp-$(LIBUPNP_VERSION).tar.bz2
 LIBUPNP_SITE = \
 	http://downloads.sourceforge.net/project/pupnp/release-$(LIBUPNP_VERSION)
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
