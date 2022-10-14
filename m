Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC12DC433FE
	for <buildroot@archiver.kernel.org>; Fri, 14 Oct 2022 06:59:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4FC7540FF1;
	Fri, 14 Oct 2022 06:59:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4FC7540FF1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jOI7M3UkXUxJ; Fri, 14 Oct 2022 06:59:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7A74A40C57;
	Fri, 14 Oct 2022 06:59:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A74A40C57
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1BD831BF20D
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 06:59:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EC42361223
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 06:59:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC42361223
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BIKcQjWiumHO for <buildroot@lists.busybox.net>;
 Fri, 14 Oct 2022 06:59:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40DB161222
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 40DB161222
 for <buildroot@buildroot.org>; Fri, 14 Oct 2022 06:59:08 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id q9so8627572ejd.0
 for <buildroot@buildroot.org>; Thu, 13 Oct 2022 23:59:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jRwQDkna2hl3ENRxo8uy6umjsiFdw8mAULDp39hxPHo=;
 b=ovlROBkrPzxsyzme4iw5WL4gRhM0+qKJA5mC3njW3ukQCBsepjcLVRr1RF+83hZMuL
 h7TmS42o0hrlbtOsVEE0ke/Gqti551Lwbt7G7rELrlo2374PRTM2uzOJeN/FCr+xdWxr
 iBgXRiWEPxro2D/2Kn4ePubutrGH7iivAQGYkFNBaxi+lPRrB10N+bzIGuUaYdzcrE39
 lH3C9+Qo8HKyeCyPY9xLC7+WInduyX6rZavh0n3G+1mQ0XHTJchG0woZMJlrly74BUyo
 25G6wGN6bD6NYvLzN4Gu/ekUKfTWRyYR8+iugoDHqcgEsV8yE8Dk5gmiV+dPBr+38GB0
 rjDQ==
X-Gm-Message-State: ACrzQf0ZkyjzYWAjTpFTdcyRTRFtoQ9Wc9UH5/PyA6HwY4nQwDaki7Ff
 qdvlePaBdSwMN6Ok/7nzsfyaOZXVHvgGGg==
X-Google-Smtp-Source: AMsMyM6E4tqf4V5nOm1yOtZDlNq4a02MBkW41vlg7mqRH/oPHavJlt0ns7fNkYNAXqW6iugu0hxYsg==
X-Received: by 2002:a17:907:7611:b0:78d:9d69:adf9 with SMTP id
 jx17-20020a170907761100b0078d9d69adf9mr2532232ejc.283.1665730746147; 
 Thu, 13 Oct 2022 23:59:06 -0700 (PDT)
Received: from localhost.localdomain (host085115199111.static.fidoka.tech.
 [85.115.199.111]) by smtp.gmail.com with ESMTPSA id
 u13-20020aa7d54d000000b00458478a4295sm1285550edr.9.2022.10.13.23.59.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 23:59:05 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri, 14 Oct 2022 08:58:57 +0200
Message-Id: <20221014065900.3311604-3-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221014065900.3311604-1-angelo@amarulasolutions.com>
References: <20221014065900.3311604-1-angelo@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jRwQDkna2hl3ENRxo8uy6umjsiFdw8mAULDp39hxPHo=;
 b=C13zukw6oSuxL/pNXzmFf3VQH/wtCzDPGrjGZyfKgEdlcqGpCyLdxeZ8UVH2c8mM89
 nfuqf9FkwB8A9IY2xVsndpPjZ9TpGOYhJbG3evXL+KOUNuVsHwXHs4f+JZWVm57nQ1VD
 4BSdfkimKdh4NB+nqOODBN320z0SE2+hotLyg=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=C13zukw6
Subject: [Buildroot] [PATCH v2 2/5] package/pkg-utils: add KCONFIG_APPEND_OPT
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
Cc: Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This macro can be used to append a value to a previously configured
option where the intent is to join the old value with the new one.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/pkg-utils.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 0945e6ed31..d812946934 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -33,6 +33,16 @@ define KCONFIG_ENABLE_OPT
 		$(call KCONFIG_MUNGE_DOT_CONFIG, $(1), $(1)=y, $(2)); \
 	fi
 endef
+# KCONFIG_APPEND_OPT (option, value, [, file])
+# If the option is already set append, else add new.
+define KCONFIG_APPEND_OPT
+	$(Q)if ! grep -q '^$(strip $(1))' $(call KCONFIG_DOT_CONFIG,$(3)); then \
+		$(call KCONFIG_MUNGE_DOT_CONFIG, $(1), $(1)=$(2), $(3)); \
+	else \
+		grep -E '$(strip $(1)).*$(strip $(2))' $(call KCONFIG_DOT_CONFIG,$(3)) || \
+		$(SED) 's|$(1)="\(.*\)"|$(1)="\1 $(2)"|g' $(call KCONFIG_DOT_CONFIG,$(3)); \
+	fi
+endef
 # KCONFIG_SET_OPT (option, value [, file])
 KCONFIG_SET_OPT     = $(call KCONFIG_MUNGE_DOT_CONFIG, $(1), $(1)=$(2), $(3))
 # KCONFIG_DISABLE_OPT  (option [, file])
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
