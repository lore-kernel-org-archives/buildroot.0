Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F504C678D5
	for <buildroot@archiver.kernel.org>; Wed,  8 Mar 2023 08:27:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DAD3E400CC;
	Wed,  8 Mar 2023 08:27:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DAD3E400CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V4RATIzwpz3i; Wed,  8 Mar 2023 08:27:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F129040BD3;
	Wed,  8 Mar 2023 08:27:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F129040BD3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 145E41BF844
 for <buildroot@lists.busybox.net>; Wed,  8 Mar 2023 08:27:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EFE3B80F58
 for <buildroot@lists.busybox.net>; Wed,  8 Mar 2023 08:27:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFE3B80F58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sS2YT8FeTVr2 for <buildroot@lists.busybox.net>;
 Wed,  8 Mar 2023 08:27:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2C4580EB6
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E2C4580EB6
 for <buildroot@buildroot.org>; Wed,  8 Mar 2023 08:27:46 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id g3so14520384wri.6
 for <buildroot@buildroot.org>; Wed, 08 Mar 2023 00:27:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678264064;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Pfz+GgS/S2WiB6SohC0dvX98eYcutkFOAscJxzQdxD8=;
 b=R+bbZvp0Ohe6wjnhctWZ2QbwPeImy3MKW1p0gYqxzxDM41/C6CFjtQYkehPKWMrC7t
 2xCPNr8gBFwBPTgQSfvidm9sw72CVh46kScQnd3HmjJTEwVeNrOBxDjxbhJ1MDW7j5uF
 UM8sW4Iej9POMagaYf8RO8TuXl/J9b2jFHskfQQkDndMxJbI21kXIuM2kMopTvYEFrnB
 b1GJi+o/esnEbIZc3hsAbtrxC5qXQFrhLWMKxayjs3YhV/zdANJqvhYNsPHIhNu1xyGn
 Q8wVCFoJNpDwjcDNwcVoNCljAXtpsiPdyN6Y0FF5sA1lVxYJ4HGWTsp8rcHi7XBHkzZ/
 k6FA==
X-Gm-Message-State: AO0yUKXnoFfv1yFlXSD+7VUouH8n+quw30nbfNUKXGB1T7h5rQ7DU5jO
 VXEFxCd2y8MdG++zLJT25SXkAiDAussIFTxlphI=
X-Google-Smtp-Source: AK7set+8waMpz/9Xl4UzjqDUgsYeugCLWPfPzvlhtz7gHLU3gmSK0M1bx8bUV9QAjqgjPTHcQLStbg==
X-Received: by 2002:a5d:4001:0:b0:2cc:be:be0 with SMTP id
 n1-20020a5d4001000000b002cc00be0be0mr9849388wrp.41.1678264064713; 
 Wed, 08 Mar 2023 00:27:44 -0800 (PST)
Received: from P-NAN-LIMA.lan ([2001:861:5384:6b50:3078:ab00:ee8d:4e07])
 by smtp.gmail.com with ESMTPSA id
 w9-20020a05600018c900b002c5a1bd5280sm14531683wrq.95.2023.03.08.00.27.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 00:27:44 -0800 (PST)
From: Sebastian Weyer <sebastian.weyer@smile.fr>
To: buildroot@buildroot.org
Date: Wed,  8 Mar 2023 09:27:14 +0100
Message-Id: <20230308082716.54730-2-sebastian.weyer@smile.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230308082716.54730-1-sebastian.weyer@smile.fr>
References: <20230308082716.54730-1-sebastian.weyer@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112; t=1678264064;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Pfz+GgS/S2WiB6SohC0dvX98eYcutkFOAscJxzQdxD8=;
 b=aPwDKXjKXL5iukBhbC1tHNYZ0bP4yi5pvMuduCg2bqTw5gWJwRrimekqikrxg1BCI3
 U5DlQOZfTeDhDPKlM4v5jEKhnLDQw9aj1/7WjdLDIA4n5EvP4aWhBrwulY4x7DZ41lwN
 lz1N13V/hIoWdUgwB3oc6bUYylmRl2NclKHEvGceF2EvodoYerjeCQoEMUrfkBwnwBVh
 xLMeV2b49HW31b0v35MJNS7Vx55YI4HaTFa9LUCsfOgRzfmnU5s4vk2D+e6R4TGkJo6N
 fPbganyRai9+D160toe/9DDupCl4V34Zp8hXlXYSNuChjEXBitK07qCMRtbP1rrhRRy2
 wfqA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=aPwDKXjK
Subject: [Buildroot] [PATCH v4 2/3] package/nushell: Add default configs
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
 package/nushell/nushell.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/nushell/nushell.mk b/package/nushell/nushell.mk
index 836f414d0a..0a596c39fa 100644
--- a/package/nushell/nushell.mk
+++ b/package/nushell/nushell.mk
@@ -10,6 +10,15 @@ NUSHELL_LICENSE = MIT
 NUSHELL_LICENSE_FILES = LICENSE
 NUSHELL_DEPENDENCIES = openssl host-pkgconf ncurses
 
+define NUSHELL_CREATE_DEFCONFIG
+	$(INSTALL) -m 0644 -D $(@D)/crates/nu-utils/src/sample_config/default_config.nu \
+		$(TARGET_DIR)/root/.config/nushell/config.nu
+	$(INSTALL) -m 0644 -D $(@D)/crates/nu-utils/src/sample_config/default_env.nu \
+		$(TARGET_DIR)/root/.config/nushell/env.nu
+endef
+
+NUSHELL_POST_INSTALL_TARGET_HOOKS += NUSHELL_CREATE_DEFCONFIG
+
 # Add /bin/nu to /etc/shells as in package/bash/bash.mk
 define NUSHELL_ADD_NU_TO_SHELLS
 	grep -qsE '^/bin/nu$$' $(TARGET_DIR)/etc/shells \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
