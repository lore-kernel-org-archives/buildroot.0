Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DEC7C63797
	for <buildroot@archiver.kernel.org>; Tue, 17 Jan 2023 07:47:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5C8D60AC4;
	Tue, 17 Jan 2023 07:47:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5C8D60AC4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7YIIhR7v09pM; Tue, 17 Jan 2023 07:47:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C06F60AC0;
	Tue, 17 Jan 2023 07:47:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C06F60AC0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 163391BF321
 for <buildroot@lists.busybox.net>; Tue, 17 Jan 2023 07:47:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E42A2417AB
 for <buildroot@lists.busybox.net>; Tue, 17 Jan 2023 07:47:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E42A2417AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q6AM4NKAdgNj for <buildroot@lists.busybox.net>;
 Tue, 17 Jan 2023 07:47:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64ABF417A5
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 64ABF417A5
 for <buildroot@buildroot.org>; Tue, 17 Jan 2023 07:47:51 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id b4so24325547edf.0
 for <buildroot@buildroot.org>; Mon, 16 Jan 2023 23:47:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iDtBXNZK2PNVsRwewsKmXgIjuj8BTwMhcCyPTlNH4Zo=;
 b=4j+94XbMZTT63wJZG2eeq5kmqNPQw9mbmKtXbLEJ5sCEkeMfl4d/n3P5pvaRfBvHVh
 D+ZOR05pvz2ktXJZgmg++Gn+JRJOnCG+Y+Goqtwq6XiZuCu3tnre3QUIQAsCW+IbqYdh
 FtA7Zx5oAlmB0S3GFvIBNNgPnEqR7HuESkoV1YdGoXZ35NXEjPLk/KO8y2Taoo0cFT1r
 v6aGKhSj2twDdsYKybOTqMxTGHPknGe5ihvmollW1DclfVR4jcoJaUxlUu70ej9zVRVR
 ZpJ4bEzVMkTFBxFIXbzZsBdQd/xMr+a1AStqJPsiUMQsawEDGJrXHJoTq29K1BS+Xv/Y
 YJXg==
X-Gm-Message-State: AFqh2krJAWf8cWUyE2PWnfqdxw9PggYxWlGXaHdHvopzlx7ORyZPbRzu
 PQ+M83Y3xBrCppI+sIH60y12cONKLkk=
X-Google-Smtp-Source: AMrXdXuTIMw3EBQny/j9SyVb7k80J9WAR7YBHTsIk20sn3lByT4beArIKZ7157oqq8EBprm32Lx/OA==
X-Received: by 2002:aa7:c30b:0:b0:47c:4479:d60d with SMTP id
 l11-20020aa7c30b000000b0047c4479d60dmr2034864edq.20.1673941668997; 
 Mon, 16 Jan 2023 23:47:48 -0800 (PST)
Received: from development1.visionsystems.de (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 e1-20020aa7d7c1000000b0049e388684a9sm216255eds.52.2023.01.16.23.47.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 16 Jan 2023 23:47:48 -0800 (PST)
To: buildroot@buildroot.org
Date: Tue, 17 Jan 2023 08:47:42 +0100
Message-Id: <20230117074742.5295-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.17.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iDtBXNZK2PNVsRwewsKmXgIjuj8BTwMhcCyPTlNH4Zo=;
 b=IlqOFSE9WBKGhfJXBSNWiJtRYwefMFVx5Jkf7sws/e4uSR2bR8lBPMYDbqEScrPdC8
 dBAmJT1SgyDOdPXj8fgB2AlFt/T4OXH32JMQDTYMo4jw32veYOxDpv2VOAUcwrxzpkTY
 15njliAY06YiP+aPhU2fuZs83B8V7tKMB6XX5jy9ZsUSZUrqNBSGn9P8iBzFIxRQTzb3
 djs2fg7bt6a4882OrU7/ymFWn8vTkd5k4NXhNKCatKr9JsH/96oTN0eqKBTHFQQDKc+8
 fRK95YvD89umgHiJJGwVl7Z04UQnOYwTFQpzllHcz9bymV4lVCRHUt6vbm3bKOXPe1mS
 urSQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20210112 header.b=IlqOFSE9
Subject: [Buildroot] [PATCH v2] package/util-linux: add an option to enable
 irqtop
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
From: yegorslists--- via buildroot <buildroot@buildroot.org>
Reply-To: yegorslists@googlemail.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

irqtop is an IRQ monitoring tool.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
Changes v1 -> v2:
	- add the missing NCURSES dependency

 package/util-linux/Config.in     | 8 ++++++++
 package/util-linux/util-linux.mk | 1 +
 2 files changed, 9 insertions(+)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index 917f1bc2b4..b5d8cad15b 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -161,6 +161,14 @@ config BR2_PACKAGE_UTIL_LINUX_IPCS
 	help
 	  Show information on IPC facilities
 
+config BR2_PACKAGE_UTIL_LINUX_IRQTOP
+	bool "irqtop"
+	depends on BR2_USE_MMU # libsmartcols
+	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS
+	help
+	  Show information on IRQs
+
 config BR2_PACKAGE_UTIL_LINUX_KILL
 	bool "kill"
 	help
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index b53b94ec31..87ec3c19d7 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -136,6 +136,7 @@ UTIL_LINUX_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_IPCMK),--enable-ipcmk,--disable-ipcmk) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_IPCRM),--enable-ipcrm,--disable-ipcrm) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_IPCS),--enable-ipcs,--disable-ipcs) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_IRQTOP),--enable-irqtop,--disable-irqtop) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_KILL),--enable-kill,--disable-kill) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LAST),--enable-last,--disable-last) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBBLKID),--enable-libblkid,--disable-libblkid) \
-- 
2.17.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
