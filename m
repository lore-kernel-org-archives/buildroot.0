Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD49E95A8F
	for <buildroot@archiver.kernel.org>; Tue, 10 Oct 2023 10:15:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 55EC840B59;
	Tue, 10 Oct 2023 10:15:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 55EC840B59
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CWmemw9dOxXP; Tue, 10 Oct 2023 10:15:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 119234154F;
	Tue, 10 Oct 2023 10:15:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 119234154F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0911D1BF2C0
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 10:14:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D6C3660F8C
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 10:14:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D6C3660F8C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kbtkfh8kITiH for <buildroot@lists.busybox.net>;
 Tue, 10 Oct 2023 10:14:55 +0000 (UTC)
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7E81460BDB
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 10:14:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E81460BDB
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-53da72739c3so249604a12.3
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 03:14:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696932893; x=1697537693;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mFPrkHvkU6NHEGDruRNzoBNTJPA2RCBFaT2DUvT9FxE=;
 b=YLhX1swEQhRoWXpc0IDy+YA473miDC4D60zqE1tf/PbFW1987jeeeTCEEDLts2LVfn
 NZlD/HYctod37Eeer86BcBTq/ceBMWDLHRjeVqj4oFke/Ek0nAZVuHatPs1Or6IkLXbE
 7mvAyMtwaL6vRr6goWal713BKVKLvurtOQfV8WTvPMAulqNME4m5N7cXs4vBRqopiaPz
 gGtrEgF+4J2VEoTmcNzxYBEGKDjKVW+tJR2NvEQktFn30uEu/50b+flfDAATv+kX4mIo
 yph1YFDX4z4UOj1/4Q097D0TdjtuMG+TU3S0qBzrBunXBuXabw5pZKVRh1i2KqOoMc+N
 asjA==
X-Gm-Message-State: AOJu0YwI2NEakhBTor1wugdYjNGpxnOChqW6U58RcQWEzK+stxWy28nP
 CGLs+6m/jKYvw2D0ThaQGXuy0KJjnoVVQaKV+MI2/g==
X-Google-Smtp-Source: AGHT+IGqQRH9WkBSBFh9LW1JQEPoe1ilpQr5ubjr6APxaJwec4b14qrbqbwuxhl4MX0fNusaZ/kbgQ==
X-Received: by 2002:aa7:d683:0:b0:527:251e:1be8 with SMTP id
 d3-20020aa7d683000000b00527251e1be8mr15950836edr.13.1696932893405; 
 Tue, 10 Oct 2023 03:14:53 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6467:4426:3fb7:fc38:9be:dc4c])
 by smtp.gmail.com with ESMTPSA id
 er24-20020a056402449800b0052febc781bfsm268857edb.36.2023.10.10.03.14.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Oct 2023 03:14:53 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 10 Oct 2023 12:14:42 +0200
Message-ID: <20231010101443.719280-3-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231010101443.719280-1-adam.duskett@amarulasolutions.com>
References: <20231010101443.719280-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1696932893; x=1697537693;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mFPrkHvkU6NHEGDruRNzoBNTJPA2RCBFaT2DUvT9FxE=;
 b=mFWCYqn2tmNn+E6doaLR5rE8hv37F1fest21snSO/dkPd/AsJxT5J3AKrzimvReTRD
 4pnJf9rh/cn6R7G9yyr3HiUdIjgX00OG+ZR5dDJmdHiBq8uSke2/r3K3Huvidvwe05jH
 fWB4aak986jadrTFPpCGo83iMDbQPu7SP3OY0=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=mFWCYqn2
Subject: [Buildroot] [PATCH v2 3/4] package/openrc: add bash-completion
 support
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Adam Duskett <adam.duskett@amarulasolutions.com>,
 =?UTF-8?q?Micha=C5=82=20=C5=81yszczek?= <michal.lyszczek@bofc.pl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/openrc/openrc.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/openrc/openrc.mk b/package/openrc/openrc.mk
index e55057249d..9682296807 100644
--- a/package/openrc/openrc.mk
+++ b/package/openrc/openrc.mk
@@ -20,6 +20,12 @@ OPENRC_CONF_OPTS = \
 	-Drootprefix=/ \
 	-Dbranding="\"Buildroot $(BR2_VERSION_FULL)\""
 
+ifeq ($(BR2_PACKAGE_BASH_COMPLETION),y)
+OPENRC_CONF_OPTS += -Dbash-completions=true
+else
+OPENRC_CONF_OPTS += -Dbash-completions=false
+endif
+
 ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
 OPENRC_CONF_OPTS += -Dselinux=enabled
 OPENRC_DEPENDENCIES += libselinux
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
