Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 742B7C636D7
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 19:29:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 058FB41866;
	Tue, 21 Feb 2023 19:29:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 058FB41866
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kuj7yREMIRHq; Tue, 21 Feb 2023 19:29:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCB5A41856;
	Tue, 21 Feb 2023 19:29:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCB5A41856
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 330E51BF362
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 19:28:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0D9E240377
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 19:28:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D9E240377
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T-DhzDwo7pLD for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 19:28:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1AF07400B8
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1AF07400B8
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 19:28:25 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id c12so5616402wrw.1
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 11:28:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Z8M4qGxtTBohoxrr7Iv+qBF0yN2/qJYxlgd5fRnDZl0=;
 b=HMS8BJ2s7d0U0TQrbTySwSiSO6cYInKKNyTawMl1yIJAYpBSkQQGp4wYkaG736oB65
 42QJs76DxlvDN4NO3aj5varFw532yYXUsCcLaXW19QOvM1w25t/NhZmxsYFPFt9LHGZu
 XvIj2tot0lW8L14LlYYUvNwfEs6aBbS4BFOKZTTG+mK6CJ5gPDqNgE8ZoW6nGPZK2EKe
 ivOncIVgUqk4dczNzDabu95tt5SvMWafXe8cXYfqCYndq4Y4vvEM6ovGqNQAnqgUGJuG
 0fbglqfON3kyFzTxML3rQW0Q0gM9cPnGcfAyV3YAPHnp5bV2izIkZXv49g6GsrqoO3m6
 6XyQ==
X-Gm-Message-State: AO0yUKWn9vJ+5t2DalczRDgSM/BWPwPEsm8piHEsWBtHFe5OaSpGK5vX
 BEwVt67KAOfwJBKKtSd/p4jz88ZtXf9L5ydA
X-Google-Smtp-Source: AK7set+VD092qgAg+9BD3qFsf+rVd+umpCA/JspjnmLfqqBoqiKw7+KcmDSmsHxKxKP5yV6bZazMPQ==
X-Received: by 2002:a05:6000:2a9:b0:2c3:f0a6:43ee with SMTP id
 l9-20020a05600002a900b002c3f0a643eemr6121496wry.20.1677007703051; 
 Tue, 21 Feb 2023 11:28:23 -0800 (PST)
Received: from thomas-OptiPlex-7090.nmg.localnet (d528f5fc4.static.telenet.be.
 [82.143.95.196]) by smtp.gmail.com with ESMTPSA id
 g16-20020a5d4890000000b002c56a991971sm8748163wrq.76.2023.02.21.11.28.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 11:28:22 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
X-Google-Original-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
To: buildroot@buildroot.org
Date: Tue, 21 Feb 2023 20:28:02 +0100
Message-Id: <20230221192802.4117856-4-thomas.devoogdt@barco.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230221192802.4117856-1-thomas.devoogdt@barco.com>
References: <CACXRmJj0nSjChCdU8+fDQsiqVw5gUn-91wqLXhYpcc4GfA-Cug@mail.gmail.com>
 <20230221192802.4117856-1-thomas.devoogdt@barco.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z8M4qGxtTBohoxrr7Iv+qBF0yN2/qJYxlgd5fRnDZl0=;
 b=mdYWdvqFoEaci+A3FkX274w/f/RU13biiOdVlF5sA4KBnchwh8g2a+tXHjrYyuV8yh
 XsbLQEd9BXuMttCAw2A62ATGs2UGAS6EldR848jj0lOlVs4FXGOyhKb0CYLBET6kNIit
 /K8GNfdf+bm6HHUeywW4AmVNRMHSKRRtm9+JuP43iU9M2GwcodkIuFOC+xCE57uPdSqx
 QxQN///tUsjYAzD64qm9hMpDazu2Z9O/YdJHV0GwXvhx0/Wu0oPlj8jIGsXnnhtFc3E1
 YQ1jsf5L/KxgCsyLmERSSe317Q/l6PYFH0suW32sSGPi5NMzt/vemRpikg2fNHPHXfbt
 Bq/Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=mdYWdvqF
Subject: [Buildroot] [PATCH v3 4/4] package/libgtk3: only update-icon-cache
 when the demos are built
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, Daniel Lang <d.lang@abatec.at>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Adrian Perez de Castro <aperez@igalia.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Similar to:
https://gitlab.gnome.org/GNOME/gtk/-/merge_requests/4358/diffs

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
v3:
 - rebased on https://patchwork.ozlabs.org/project/buildroot/list/?series=336254
 - needed to fix the webkitgtk 2.38.5 compilation
   (https://patchwork.ozlabs.org/project/buildroot/patch/20230220090923.2155635-2-thomas.devoogdt@barco.com/)
---
 package/libgtk3/libgtk3.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
index 2821c7eb52..b78578d568 100644
--- a/package/libgtk3/libgtk3.mk
+++ b/package/libgtk3/libgtk3.mk
@@ -145,11 +145,13 @@ endef
 
 # Create icon-theme.cache for each of the icon directories/themes
 # It's not strictly necessary but speeds up lookups
+ifeq ($(BR2_PACKAGE_LIBGTK3_DEMO),y)
 define LIBGTK3_UPDATE_ICON_CACHE
 	find $(TARGET_DIR)/usr/share/icons -maxdepth 1 -mindepth 1 -type d \
 		-exec $(HOST_DIR)/bin/gtk-update-icon-cache {} \;
 endef
 LIBGTK3_TARGET_FINALIZE_HOOKS += LIBGTK3_UPDATE_ICON_CACHE
+endif
 
 $(eval $(meson-package))
 $(eval $(host-generic-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
