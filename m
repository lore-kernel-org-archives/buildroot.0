Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF7D0C678D5
	for <buildroot@archiver.kernel.org>; Wed,  8 Mar 2023 13:16:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 27CD440BFE;
	Wed,  8 Mar 2023 13:16:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 27CD440BFE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q4mQzZHCQyZ3; Wed,  8 Mar 2023 13:16:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4494B40292;
	Wed,  8 Mar 2023 13:16:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4494B40292
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E9A151BF3EA
 for <buildroot@lists.busybox.net>; Wed,  8 Mar 2023 13:16:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D155F40292
 for <buildroot@lists.busybox.net>; Wed,  8 Mar 2023 13:16:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D155F40292
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dRoxMLXox41D for <buildroot@lists.busybox.net>;
 Wed,  8 Mar 2023 13:16:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D550B404F7
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D550B404F7
 for <buildroot@buildroot.org>; Wed,  8 Mar 2023 13:16:05 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id v16so15388955wrn.0
 for <buildroot@buildroot.org>; Wed, 08 Mar 2023 05:16:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678281364;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RrNzdSKpyClGd83dC9XpRGeGCVHw0agBqoP+fdLp/PQ=;
 b=G9gbkwg2KUP41QyyXsosX0kRT4FFbmhg/CdlMyyK4yJhfCWKaxU/CeLDAwYwaOQU1Z
 dfC6xLdF/7zt2MQBXCqf+UZlBOAygbpr8gixqqSrkGDqvrbYoVOVxnrNiW/s2f3IIQOE
 4sr0/ABJt81h/csMjYd8Jl0RHrYWauiW+wnzDPNJ6DWFsRZZOgexzLJ9RWt5cFGxeXqm
 MMahVGMaWt+cDTddU/bwLK4/apgpDxN2TFPVPjvOOV+qlOSHVGfUU9x6qqXLHPW3CcAf
 EeFQp34K8dyXGGQJyrwfhuL0yc/TSe+vA8MMMll+N7o26rRMnqRoWDeezT0tjFS4GVoN
 S8WQ==
X-Gm-Message-State: AO0yUKXEjorznqlVIHHZyPeAoMiHsELCuHDJ7zRH2R6ZCT1Dbbu+Y5Vq
 dTwa+NvEHYelt4r2PxdZdjBjRDWyWKAK3Axod5Q=
X-Google-Smtp-Source: AK7set+Wmfi1WoyTWpf7M25rlMVp6sdwMJ3zoJMnwFVglFvMAHRTH99FEXX1qAM6qwlDPCNhPpykBw==
X-Received: by 2002:a5d:4001:0:b0:2cc:be:be0 with SMTP id
 n1-20020a5d4001000000b002cc00be0be0mr10444402wrp.41.1678281363734; 
 Wed, 08 Mar 2023 05:16:03 -0800 (PST)
Received: from P-NAN-LIMA.lan ([2001:861:5384:6b50:3078:ab00:ee8d:4e07])
 by smtp.gmail.com with ESMTPSA id
 bi25-20020a05600c3d9900b003e89e3284fasm19677624wmb.36.2023.03.08.05.16.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 05:16:03 -0800 (PST)
From: Sebastian Weyer <sebastian.weyer@smile.fr>
To: buildroot@buildroot.org
Date: Wed,  8 Mar 2023 14:15:52 +0100
Message-Id: <20230308131554.642965-2-sebastian.weyer@smile.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230308131554.642965-1-sebastian.weyer@smile.fr>
References: <20230308131554.642965-1-sebastian.weyer@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112; t=1678281364;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RrNzdSKpyClGd83dC9XpRGeGCVHw0agBqoP+fdLp/PQ=;
 b=AccpbdcyIj83zh3XEPsr/qEnVUjX9F9cQm3u0MmZ0ogS8SObGFatmpm8TdCrw9g0LB
 VH3ru4GeukOJt7y8nlKVdmo+b1ZjWrtApf1Z6H48OHLslAddE7Bsn4Y3jzB0Q1HpD9NC
 oRAmiygVHh2QMJ42wUHZit1XntRerTYYWv4X5/+6W9hvQhLW6pFfiEYAn09LthPBhiQ0
 em9qG4VizkeSWPCBOXespFWcZtbVNYTlrDz0p14rZcNwsMrBTk+V4EkvvcJhXcgPK3/a
 H9NTNmfJ72bsir/dHuWmM0fZV81KZl+MmAoK9km1G3RCwNAayT1rTFGgekdhe8/HCCb1
 5voA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=Accpbdcy
Subject: [Buildroot] [PATCH v6 2/3] package/nushell: Add default configs
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
Cc: Sebastian Weyer <sebastian.weyer@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Automatically place default files for the nushell environment and
config in the appropriate folder to avoid the prompt at startup, asking
if you want to create them.

Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
---
These default configs are optional and might not even be necessary, they
only prevent the prompt at the first startup of the shell
---
 package/nushell/nushell.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/nushell/nushell.mk b/package/nushell/nushell.mk
index b9c1ee6434..8ac3045c9f 100644
--- a/package/nushell/nushell.mk
+++ b/package/nushell/nushell.mk
@@ -10,6 +10,14 @@ NUSHELL_LICENSE = MIT
 NUSHELL_LICENSE_FILES = LICENSE
 NUSHELL_DEPENDENCIES = host-pkgconf openssl ncurses
 
+define NUSHELL_INSTALL_DEFAULT_CONFIG
+	$(INSTALL) -m 0644 -D $(@D)/crates/nu-utils/src/sample_config/default_config.nu \
+		$(TARGET_DIR)/root/.config/nushell/config.nu
+	$(INSTALL) -m 0644 -D $(@D)/crates/nu-utils/src/sample_config/default_env.nu \
+		$(TARGET_DIR)/root/.config/nushell/env.nu
+endef
+NUSHELL_POST_INSTALL_TARGET_HOOKS += NUSHELL_INSTALL_DEFAULT_CONFIG
+
 # Add /usr/bin/nu to /etc/shells as in package/bash/bash.mk
 define NUSHELL_ADD_NU_TO_SHELLS
 	grep -qsE '^/usr/bin/nu$$' $(TARGET_DIR)/etc/shells \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
