Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59C9FC54E58
	for <buildroot@archiver.kernel.org>; Wed, 13 Mar 2024 09:14:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 22E90414F7;
	Wed, 13 Mar 2024 09:14:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MwA7N9S9P7jN; Wed, 13 Mar 2024 09:14:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 11F894152A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 11F894152A;
	Wed, 13 Mar 2024 09:14:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3240E1BF3DF
 for <buildroot@lists.busybox.net>; Wed, 13 Mar 2024 09:14:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0FF928133B
 for <buildroot@lists.busybox.net>; Wed, 13 Mar 2024 09:14:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id boLRkU1Mf102 for <buildroot@lists.busybox.net>;
 Wed, 13 Mar 2024 09:14:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=fperrad@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 622CA81375
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 622CA81375
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 622CA81375
 for <buildroot@busybox.net>; Wed, 13 Mar 2024 09:14:26 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-41312232c7aso3910535e9.0
 for <buildroot@busybox.net>; Wed, 13 Mar 2024 02:14:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710321264; x=1710926064;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IVAnZ8AtjFd2afYVnZAmzUWFE9+gaXweRrxBFLVFGhU=;
 b=JisIqb/kTamP0Q6bwcO/20TSoWdhw9pCJYJHl9KC9fsHAqVju0VvkRaDPSmLACrW4E
 59nb38tzt3haeTwr1kzFXltFdjPfv9RSXfQG6CFLL1Sq5P4OC7MG+STIWhVCDkIYv017
 PSK08zRcqYMqPgvScLyGfdBp/pFFYa/Jv1o1rV7dTtwgdVsu2IV/HlgQdEa/vD1oYf/Z
 ZBdskcSo8mLo931M0rcybVlSsWTIWa1Kt3zBNrfEbQEOfQuBL5YoEN/QoCYWpxmXmoAs
 HCyrtRGHgEEEVYHBPyYbIfR1QWZuyaqMtug8bP1MpEYVCPNWz60wYZ47u2jgVwMtxJNv
 H+6w==
X-Gm-Message-State: AOJu0YwURBNWt8AbYAF+ZkRJpPxcJd+D9QS1U7Eby3kFzRWzqZcIzp6+
 P8J4T31k4+RVHo0s5mndxB8ReGN72so4b9mhQaH/nxSESzt+cLXXiBvVvY9LNgE=
X-Google-Smtp-Source: AGHT+IEc00IyGYAE2TwoSXNjjMyxacsS+uGs4E6+YBev6mfx0OxCqRAnTd9QyQzQU0qBHJw0r1ityg==
X-Received: by 2002:a05:600c:3146:b0:413:1ee4:692e with SMTP id
 h6-20020a05600c314600b004131ee4692emr1791281wmo.9.1710321264481; 
 Wed, 13 Mar 2024 02:14:24 -0700 (PDT)
Received: from xubuntu-23.. ([37.65.6.92]) by smtp.gmail.com with ESMTPSA id
 u1-20020a05600c138100b00412e5f32591sm1699799wmf.28.2024.03.13.02.14.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 02:14:24 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 13 Mar 2024 10:13:47 +0100
Message-Id: <20240313091412.20865-6-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240313091412.20865-1-francois.perrad@gadz.org>
References: <20240313091412.20865-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710321264; x=1710926064; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IVAnZ8AtjFd2afYVnZAmzUWFE9+gaXweRrxBFLVFGhU=;
 b=P2UD9jOx5d1Nkd5YUZFyL0G/pKmD7xEWtdKRzcAfLTZyJZXLDooIWPCL6w6aqNbrIo
 YbapXYqMmy9GBz78Zcqkm3HGkB8TmuCfSJFX5eLYRjbLXDiQCJcGKFswV8LgpI3oNlqm
 B2IGyDvW1o3zZnrLONajhFcYbs9XK4xVCP45KN3W2WPMs9t1/GRSAY8g9au4Rcn39K8S
 jwXR3bmuXJjTBFYWFe6R0s69KluR7ku/9Hkj4n+F/2qbVVozUCw0mLzPw496pMuA/By6
 iE6ydBrG6SGAL6Rc2ZRclXPgOYXioDpumgbcbPu5saFOkiV/7i5FnQ0ZnDpDm/rYdhhr
 6Zmg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=P2UD9jOx
Subject: [Buildroot] [PATCH 06/31] package/fbset: disable busybox fbset
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
 package/fbset/fbset.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/fbset/fbset.mk b/package/fbset/fbset.mk
index 8d2a477f8..5a5cf3a0e 100644
--- a/package/fbset/fbset.mk
+++ b/package/fbset/fbset.mk
@@ -18,4 +18,8 @@ define FBSET_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 755 $(@D)/fbset $(TARGET_DIR)/usr/sbin/fbset
 endef
 
+define FBSET_BUSYBOX_CONFIG_FIXUPS
+	$(call KCONFIG_DISABLE_OPT,CONFIG_FBSET)
+endef
+
 $(eval $(generic-package))
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
