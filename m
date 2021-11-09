Return-Path: <SRS0=D8Yb=P4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B261C433F5
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 16:54:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E653C61131
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 16:54:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E653C61131
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82D3840162;
	Tue,  9 Nov 2021 16:54:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YpznySFmQXkI; Tue,  9 Nov 2021 16:54:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E70474014E;
	Tue,  9 Nov 2021 16:54:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4AB451BF2C4
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 16:54:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 39C184014E
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 16:54:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mOOZLmd-Y4lG for <buildroot@lists.busybox.net>;
 Tue,  9 Nov 2021 16:54:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5985540142
 for <buildroot@buildroot.org>; Tue,  9 Nov 2021 16:54:42 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 az33-20020a05600c602100b00333472fef04so1694074wmb.5
 for <buildroot@buildroot.org>; Tue, 09 Nov 2021 08:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qnCs7VzV0q8J9vCKb3zowQv2fHlGixjNaOYCObrn8xs=;
 b=RLmE3IgyAmAWw6YKDBLJRVuV9SLn0JF3TV0FOWsbZMQu3RCjB2uNg6GSYJxKuERhsm
 JiWGQ4uwCvX/hMSUEb/kkapw6UwstOWLh7i+fbcAq77/r7FnM+I4ZM6cT+4ZKW8PciJ6
 2bI6c9GsF96KdXR4T4Pff6OxvroQ3g0Jc/8xo1cRUwmQ1Fb4eTTwzkmmAqyXyYBvANi6
 /iB1u2sjk2EGblZGvDRKLqFjDen7VvpSiHb9hicfJ13Moa47vZvohlVlYw9zm+deTbIo
 EeIJV5iwdspF4qwI7QLhzZg5niD+us5WRS6ay8xL+3rYS5I7mePGAJoMAAF2ePfAcqzH
 LRnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=qnCs7VzV0q8J9vCKb3zowQv2fHlGixjNaOYCObrn8xs=;
 b=itoM9w804oDbAulBhOtFszi8LcKwOU/DDHVHYEOw+f3LcNvCKKXYWpj1zdNWD5T5pV
 86QnIayY9EjMD0unRXQj4bcedjYvOe6RJpp0ktJrcxdIeYbYV9UI5QBx30ee11DfDm+Q
 UoXqyfKDqSYmPM1BiIOhFDxwme3HXT+fwGlgd9+1tgfLY73p3BpriBVqdOwKM2oByGtV
 YEMGbB1UgjXG5zU1hdpV1TAjF5HCTNiNGOM/Cz0pqEue8AblIhWPq1H4MC3iZk+9dHx6
 4QzQY1juX3bI8c+TuA0pInAZl5Nmk5TTAA1XutDimrhLZEp2z5BU2BTnkvtxaUdbpx1a
 Aftw==
X-Gm-Message-State: AOAM532lN4LgnNXqcxvSQZyRZDASOcGh/dJv0AeWXBiB/KpCTdqbVjIw
 M+wLaxh4O5w4GmTmHAkihaD0Und3QnxYVw==
X-Google-Smtp-Source: ABdhPJxFsluSjhqDZqfCZCu3VR2l4Fj0GEE7z0dB/dscwRJnzabxzI/0ViGYRox4EOpEAhi+6rdXsA==
X-Received: by 2002:a1c:7c14:: with SMTP id x20mr8599776wmc.75.1636476880571; 
 Tue, 09 Nov 2021 08:54:40 -0800 (PST)
Received: from scaer.home ([2a01:cb19:8b51:cb00:710f:610b:602a:e07])
 by smtp.gmail.com with ESMTPSA id f12sm2807618wmq.0.2021.11.09.08.54.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 08:54:39 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue,  9 Nov 2021 17:54:35 +0100
Message-Id: <20211109165435.1937116-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] core/show-info: report build_dir relative to
 CONFIG_DIR
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Currently, the build_dir field is reported relative to $(BASE_DIR), to
avoid leaking local paths.

However, BASE_DIR is not a directory that is very convenient: for
in-tree builds, it is $(CONFIG_DIR)/output/, while for out-of-tree
builds, it is $(CONFIG_DIR). This difference is purely an idiosyncracy
of how out-of-tree builds have been implemented in Buildroot, and is
not under the control of the user.

What the user is in control of, however, is where the .config file is
located. This, really, is the directory we should base relative paths
on.

Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pkg-utils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index ae3c7f9da9..b2f0b8cebf 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -113,7 +113,7 @@ define _json-info-pkg
 		"virtual": false$(comma)
 		$(call _json-info-pkg-details,$(1)) \
 	)
-	"build_dir": "$(patsubst $(BASE_DIR)/%,%,$($(1)_BUILDDIR))",
+	"build_dir": "$(patsubst $(CONFIG_DIR)/%,%,$($(1)_BUILDDIR))",
 	$(if $(filter target,$($(1)_TYPE)), \
 		"install_target": $(call yesno-to-bool,$($(1)_INSTALL_TARGET))$(comma) \
 		"install_staging": $(call yesno-to-bool,$($(1)_INSTALL_STAGING))$(comma) \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
