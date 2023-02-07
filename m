Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1D35C636CC
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 17:18:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C0DD418C0;
	Tue,  7 Feb 2023 17:18:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C0DD418C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TH-1N0VlRFdB; Tue,  7 Feb 2023 17:18:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4250B418A3;
	Tue,  7 Feb 2023 17:18:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4250B418A3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 073C81BF95C
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 17:17:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E36E440A68
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 17:17:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E36E440A68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QB5ZIhb-UwIA for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 17:17:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2DA6940120
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2DA6940120
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 17:17:35 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id g6so6290806wrv.1
 for <buildroot@buildroot.org>; Tue, 07 Feb 2023 09:17:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tQ3ImKQlQXlQVIhQWhVMa2glT2ove3VTuyu/BvzPfs4=;
 b=21YPYPtdZM0FY81Xp/vnzzl2gFOByd3B8zD4OFE7RhtkA7gLJXPO27rNnIIRD72viH
 +KsqortL3OhGzmKViwP3VzwvSkr43r7MiWf9qvSQFYoOYLjIpmnWZqwMf9j1/08Wb8qw
 J/ShbODVj75xHS1n9wvxXfFbxBQapEh82d4WePgFiokVBrZQ/8+xxH9Q0JExT3hhAXUO
 vjTpev/jN1KVRl26ko8qO8WczUUJpKtY427F67slrEY4F5jxR5ZuXTpSH+Mctnxxwj0m
 I2Ar+JxSdQDpearwhAGon8bXsmqZUUbLg2A/w+DPCN9QkLhQSyTK5ZHVoC/Oeq3DdjaD
 xF7A==
X-Gm-Message-State: AO0yUKUDcK2SAIPqHwrBYSIC2E4uLuid/a4dC7DQz0lEVpo1daj5aQ+a
 OTAuN2jngytMVHjOAvTz0uat53k6A/0+iOMDHTmx+w==
X-Google-Smtp-Source: AK7set8vg9s947llooDL8aVIxV8CndN5dASArX66EZQRr8xx4VgtJiAk+j0qPP4tDvVsyM91eZg0jQ==
X-Received: by 2002:a05:6000:118c:b0:2bf:bd43:aacc with SMTP id
 g12-20020a056000118c00b002bfbd43aaccmr2893458wrx.55.1675790253101; 
 Tue, 07 Feb 2023 09:17:33 -0800 (PST)
Received: from angeloc.wifiguest.local (cpe1150018.bra.be.verixi.net.
 [85.119.216.19]) by smtp.gmail.com with ESMTPSA id
 q16-20020adff950000000b002bff574a250sm11708801wrr.2.2023.02.07.09.17.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 09:17:32 -0800 (PST)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  7 Feb 2023 18:17:12 +0100
Message-Id: <20230207171721.2973997-5-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230207171721.2973997-1-angelo@amarulasolutions.com>
References: <20230207171721.2973997-1-angelo@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tQ3ImKQlQXlQVIhQWhVMa2glT2ove3VTuyu/BvzPfs4=;
 b=B6hslwrr4r+ad1lWDsQgiLWTzzFNYg684dRYrGEdJ+58xwDtLo3aP7BJLmeniWfa5f
 lcJ4DeEZKGyBThclQ6g4vvYhqxa7gibVn4QRwStcGbms/Y60nPtU6NubAMXrvwNF78SJ
 JrScrGEgvAEg+shVzqg1+p1ACQeg6jpXkETf4=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=B6hslwrr
Subject: [Buildroot] [PATCH v6 04/13] package/qt6/qt6base: add support for
 widgets
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
Cc: jesseevg@gmail.com, Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
v6:
* Removed backend configuration options (Thomas P.)

 package/qt6/qt6base/Config.in  | 6 ++++++
 package/qt6/qt6base/qt6base.mk | 4 ++++
 2 files changed, 10 insertions(+)

diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
index 6c5c60fa30..0f7e936162 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -95,6 +95,12 @@ config BR2_PACKAGE_QT6BASE_PNG
 	  This option enables PNG support using the system libpng
 	  library.
 
+config BR2_PACKAGE_QT6BASE_WIDGETS
+	bool "widgets module"
+	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_QT6BASE_XCB
+	help
+	  This option enables the Qt6Widgets library.
+
 endif
 
 config BR2_PACKAGE_QT6BASE_NETWORK
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 06ebbab8e7..cf3c7b1ad1 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -213,6 +213,10 @@ else
 QT6BASE_CONF_OPTS += -DFEATURE_fontconfig=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_QT6BASE_WIDGETS),y)
+QT6BASE_CONF_OPTS += -DFEATURE_widgets=ON
+endif
+
 else
 QT6BASE_CONF_OPTS += -DFEATURE_gui=OFF
 endif
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
