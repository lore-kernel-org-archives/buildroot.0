Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DB75CD8CA9
	for <buildroot@archiver.kernel.org>; Tue, 10 Oct 2023 17:03:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 045FC60B73;
	Tue, 10 Oct 2023 17:03:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 045FC60B73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hbbnpwlI4GV5; Tue, 10 Oct 2023 17:03:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F268D61442;
	Tue, 10 Oct 2023 17:03:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F268D61442
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B4B9B1BF94D
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 17:01:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9A8D140900
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 17:01:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A8D140900
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1dxbfr5uyKlX for <buildroot@lists.busybox.net>;
 Tue, 10 Oct 2023 17:01:55 +0000 (UTC)
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 84AED408BF
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 17:01:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84AED408BF
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5334f9a56f6so10194361a12.3
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 10:01:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696957313; x=1697562113;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+TMLL+DpkEwGj6NS5KFzLoLN1HZfV6fSg2TSK72tiCc=;
 b=Y4Rz9iYxDkhmCruLAg+2qsYREjJUo44feuESONwmE/Pgy6+e1vghxj5twepQuqJs1q
 OlAyWMjVf+6Q92EmxcKMJbmEq/9noMSdglM+k9fh3hAZ4oVH14ct23bFsizlefVJAWEE
 ReGg7YDjd4IwPVqt9EJGJrY8IFdS43ivzazb9Tqt5YH14ekxoGocYQsVTMKPnEvfTEmd
 W4KQCm8enGzr6Mw98AThJk+NPrZp9De1a5WlcFXk0plMNYEEokL2ff8Wwn4w0X8ffxUP
 zswlx35S+pqWrsBRii5Uc+l0XKxmf7og8/nZ/TsE0J7UeVC2vSGbR3ncW2aXvQAO7wC9
 /Ldg==
X-Gm-Message-State: AOJu0YxEfxF10TNOv2ol2wmdbnCmASCxjtrKK/CFFGxPgMh76F2K8cXc
 JDp+5FE8n6qBu094RsdyDn3yrdNlmLY13ysx0nFrbA==
X-Google-Smtp-Source: AGHT+IF+Je0kTmvWS1dHCAMAkr5+AD1n2g9oUaXtbNQenfqb2a6LzVmRM2FMWH1xmI9dcTICzno1lQ==
X-Received: by 2002:a17:906:cc2:b0:9ae:5db5:149 with SMTP id
 l2-20020a1709060cc200b009ae5db50149mr16430354ejh.35.1696957313355; 
 Tue, 10 Oct 2023 10:01:53 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6467:4426:3fb7:fc38:9be:dc4c])
 by smtp.gmail.com with ESMTPSA id
 ca9-20020a170906a3c900b009ae587ce128sm8651107ejb.216.2023.10.10.10.01.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Oct 2023 10:01:53 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 10 Oct 2023 19:01:33 +0200
Message-ID: <20231010170133.2981698-9-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231010170133.2981698-1-adam.duskett@amarulasolutions.com>
References: <20231010170133.2981698-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1696957313; x=1697562113;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+TMLL+DpkEwGj6NS5KFzLoLN1HZfV6fSg2TSK72tiCc=;
 b=W/SathpeUvpY5aN+a11JgCsmnIpWG8rFCo8DZAgxHRr0VenclZ6IDoPHyDz9Kn3ktx
 J6IC4LVxJDPizDF3ftuRrAxfIA/W7EFSJOgY7tIiIyrV1B4Uicg6m0Anojdk1UTKowAq
 TFarqilSoOCfiTRScDCVvonr/sl/m9zd2TTbI=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=W/Sathpe
Subject: [Buildroot] [PATCH 9/9] package/zfs: enable selinux module
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
 package/zfs/zfs.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/zfs/zfs.mk b/package/zfs/zfs.mk
index b852d8d4e2..f0461ea9ec 100644
--- a/package/zfs/zfs.mk
+++ b/package/zfs/zfs.mk
@@ -7,6 +7,7 @@
 ZFS_VERSION = 2.1.12
 ZFS_SITE = https://github.com/openzfs/zfs/releases/download/zfs-$(ZFS_VERSION)
 ZFS_PATCH = https://github.com/openzfs/zfs/commit/bc3f12bfac152a0c28951cec92340ba14f9ccee9.patch
+ZFS_SELINUX_MODULES = zfs
 ZFS_LICENSE = CDDL
 ZFS_LICENSE_FILES = LICENSE COPYRIGHT
 ZFS_CPE_ID_VENDOR = openzfs
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
