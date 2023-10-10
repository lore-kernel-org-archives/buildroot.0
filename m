Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10600CD8CAC
	for <buildroot@archiver.kernel.org>; Tue, 10 Oct 2023 17:02:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB68861454;
	Tue, 10 Oct 2023 17:02:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB68861454
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MvKi2RmfeSF3; Tue, 10 Oct 2023 17:02:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE9D661450;
	Tue, 10 Oct 2023 17:02:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE9D661450
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0B7601BF97D
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 17:01:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D4C9D822C9
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 17:01:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4C9D822C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OYssFtJ020W2 for <buildroot@lists.busybox.net>;
 Tue, 10 Oct 2023 17:01:51 +0000 (UTC)
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 518A182283
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 17:01:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 518A182283
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-9ada2e6e75fso1074791166b.2
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 10:01:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696957309; x=1697562109;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=55mvecBQ+dVj8lOtctb8zPGOLS693ipodXuTO4/Og5M=;
 b=PnWlvEDnaxutCTj9iV2xnstMs8WAN0CUVycOAr4wsibiJnwLyyjsBl7FvOXdy9O4Ea
 ZilecfjklbldMRVaOQuCytMeJPCXxZ6xJtvaJpTkmKR0vPdE4a+TsO2G1ImZ9xOLCsKw
 aKcJg+Dj7u5BCetIsfktRaheysBoaiaHpRFJglbDFaRMA8tgyGbQq10DtU3NjF4QSM14
 SUoDZkMf7ckxRbI9XpYcMnBRL1fEw5xo9S/n83OjutQ43PxuU7+FvRiFgbK0RjfP3ufZ
 r+YUA8xCrt68kK0Xfh3j1wrBFICu89/kj9vFAw/S5IIzBY6sjRydH2KbFY90Emdtt7Ag
 QMdw==
X-Gm-Message-State: AOJu0YwKsyTRiOomZJs4NE7lbbDpuzQWxToIIuAzEKFX0S2SUKvjwmgp
 lczN1lBs/3D1qhJU0Xa8woLXXbVZs/8ylzbRQcw4zw==
X-Google-Smtp-Source: AGHT+IHYQdSoi50i9UiRUSShau8RO8FsS/yD5/QlczpqNz5rE/Cl2x2U2IEygO9bBnSC0Eee5YqYMg==
X-Received: by 2002:a17:906:2254:b0:9b9:4509:d575 with SMTP id
 20-20020a170906225400b009b94509d575mr17108586ejr.2.1696957308940; 
 Tue, 10 Oct 2023 10:01:48 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6467:4426:3fb7:fc38:9be:dc4c])
 by smtp.gmail.com with ESMTPSA id
 ca9-20020a170906a3c900b009ae587ce128sm8651107ejb.216.2023.10.10.10.01.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Oct 2023 10:01:48 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 10 Oct 2023 19:01:28 +0200
Message-ID: <20231010170133.2981698-4-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231010170133.2981698-1-adam.duskett@amarulasolutions.com>
References: <20231010170133.2981698-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1696957309; x=1697562109;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=55mvecBQ+dVj8lOtctb8zPGOLS693ipodXuTO4/Og5M=;
 b=f0W/CEEp5g3Isapt9Rr66fLjpZE6azY57zOdoc+pahYhMyeqJpRPuy9W58v/swic/1
 2OYdUxgyH/M9qjNh5UDL1CAyPB3D+/S/NYjHddOWFq4ro+KzwqqRBGI9WsyrkPHwma7U
 cU169xSMSCXjDgpill71f7FN7BwWfOkTvfSDI=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=f0W/CEEp
Subject: [Buildroot] [PATCH 4/9] package/qemu: enable selinux module
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/qemu/qemu.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 6aaed32336..208233cfd9 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -9,6 +9,7 @@
 QEMU_VERSION = 8.1.0
 QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.xz
 QEMU_SITE = https://download.qemu.org
+QEMU_SELINUX_MODULES = qemu
 QEMU_LICENSE = GPL-2.0, LGPL-2.1, MIT, BSD-3-Clause, BSD-2-Clause, Others/BSD-1c
 QEMU_LICENSE_FILES = COPYING COPYING.LIB
 # NOTE: there is no top-level license file for non-(L)GPL licenses;
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
