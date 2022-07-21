Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 073E3C433EF
	for <buildroot@archiver.kernel.org>; Thu, 21 Jul 2022 15:06:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 139E141B48;
	Thu, 21 Jul 2022 15:06:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 139E141B48
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LQwZXy5HYYWh; Thu, 21 Jul 2022 15:06:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2556419B6;
	Thu, 21 Jul 2022 15:06:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2556419B6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E557C1BF2B6
 for <buildroot@lists.busybox.net>; Thu, 21 Jul 2022 15:05:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BBC47400E2
 for <buildroot@lists.busybox.net>; Thu, 21 Jul 2022 15:05:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BBC47400E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rHgnO-RT13Gn for <buildroot@lists.busybox.net>;
 Thu, 21 Jul 2022 15:05:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F9354118D
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0F9354118D
 for <buildroot@buildroot.org>; Thu, 21 Jul 2022 15:05:53 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id n12so2680377wrc.8
 for <buildroot@buildroot.org>; Thu, 21 Jul 2022 08:05:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E5RczDw5WGuJodYLroekuAykAbWnCyXq2hK3V8m4WDc=;
 b=JZt6zj2Cy+0TIt8Fo3W3wE2RifGmHEgpyXYkioti4VtrXJeMSbGpciChWdifTV72ZX
 DzoliAJWAObZ2V1Tl3xUvZMUxTmOUtpcrgpFFsQMvHyTsUB6/oMd6wQmIlXMk1VDjdKz
 zGvkcej+oU8crzQvngzSGorXPBaHRuxLt4Sb2ZuWHezIOYNLFEMbw4lg20HtHlPknqua
 fkAkoZANdZCRK7IhsFAxN+C7owBGxagHAYfb3EtsLJX90VfhDlu7wulrY38WTIOYZG5R
 blURiWAo+hNwozPB4bu/mViCGBWMLbtDN3FI73mcGIr7iTgzGdMcW4/VEUPoh+MbpqJc
 GBZg==
X-Gm-Message-State: AJIora/VrglQsFYqu9nxN0zZkV3bZRI2RFOXYCw/C2fCc9KKEdcQNcub
 RzHEH27DOQcRG9bScbemKRX2SzyC9tE=
X-Google-Smtp-Source: AGRyM1uxwWwkrRJIbW3ZpbydBr9mqcd6/vjFi/nisWE/29tLRX8uNnFHus+dlJrveNQZsczNCgFnaw==
X-Received: by 2002:a5d:590e:0:b0:21e:57ff:d85b with SMTP id
 v14-20020a5d590e000000b0021e57ffd85bmr1899840wrd.149.1658415952204; 
 Thu, 21 Jul 2022 08:05:52 -0700 (PDT)
Received: from lano-work.. ([80.120.136.76]) by smtp.gmail.com with ESMTPSA id
 q13-20020adff78d000000b0021d69860b66sm2765423wrp.9.2022.07.21.08.05.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jul 2022 08:05:51 -0700 (PDT)
From: Norbert Lange <nolange79@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 21 Jul 2022 17:05:33 +0200
Message-Id: <20220721150534.68813-2-nolange79@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220721150534.68813-1-nolange79@gmail.com>
References: <20220721150534.68813-1-nolange79@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E5RczDw5WGuJodYLroekuAykAbWnCyXq2hK3V8m4WDc=;
 b=aftTOsG8Ur8xGk5xwczq+p9+kWNiC9ua8nsb0q6m3dUV/fmGxqf6iLE+ZfCe2TWXLy
 DRaSb9mkWoUuT7yHNTjRfvTofjrHGadv9gZ5OtkQgQAuPKPY1EhQjaVvczyNPCz+eybk
 GDkn4IAkY4Z3FBPEOIwZwXGRbVMvcnRVJWWb+lpfYX+Qz+wz66bGolRVhgcVvlroOOLI
 ZL8Cs1ia30im7TiB230Av1wH9HTC8tc0GFO2n6GEm3+Yhs/MpNCuySNqJ1GjWInT/3ja
 88vhDfSJXEWJ0dfUPY2E3racbq8H3e/EkVJQxzhOCN9OvwiMmmtj6GmqWImPYQkx/rhI
 oW8Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=aftTOsG8
Subject: [Buildroot] [PATCH v2 2/3] package/systemd: allow empty systemd
 default target
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
Cc: Norbert Lange <nolange79@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Currently, we forcefully require that a default target be specified.
However, systemd does install a default target, but it's not
possible to just use that target.

Allow the user to blank-out the config setting to not override
whatever systemd installed and keep that.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
v1->v2:

*   completely remove the hook if var is empty
*   adjusted commit message
---
 package/systemd/systemd.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index afee1cfc79..1afa287ea0 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -578,6 +578,7 @@ ifneq ($(SYSTEMD_FALLBACK_HOSTNAME),)
 SYSTEMD_CONF_OPTS += -Dfallback-hostname=$(SYSTEMD_FALLBACK_HOSTNAME)
 endif
 
+ifneq ($(call qstrip,$(BR2_PACKAGE_SYSTEMD_DEFAULT_TARGET)),)
 define SYSTEMD_INSTALL_INIT_HOOK
 	ln -fs "$(call qstrip,$(BR2_PACKAGE_SYSTEMD_DEFAULT_TARGET))" \
 		$(TARGET_DIR)/usr/lib/systemd/system/default.target
@@ -586,6 +587,7 @@ endef
 define SYSTEMD_INSTALL_MACHINEID_HOOK
 	touch $(TARGET_DIR)/etc/machine-id
 endef
+endif()
 
 SYSTEMD_POST_INSTALL_TARGET_HOOKS += \
 	SYSTEMD_INSTALL_INIT_HOOK \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
