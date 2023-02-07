Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37FE4C636D3
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 17:19:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D625240A80;
	Tue,  7 Feb 2023 17:19:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D625240A80
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rDte1_hORMvI; Tue,  7 Feb 2023 17:19:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 280B640A68;
	Tue,  7 Feb 2023 17:19:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 280B640A68
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C96AA1BF95C
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 17:17:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A35C18137A
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 17:17:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A35C18137A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LeaSkn_LQkc7 for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 17:17:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C812281371
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C812281371
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 17:17:39 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id i5so7102581wrc.0
 for <buildroot@buildroot.org>; Tue, 07 Feb 2023 09:17:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7HEE9riIaaabn81p9ufFHwyuoMoVg3jHiOnqk6fIhVc=;
 b=uc5y+kDT9psD8fHec2eUKYxGza3q/zynrZwaaYoZNDaSgfTfC2B1lJ/NpK01dDu7wH
 rWS9CWyVDsU9CrCChLvHGzs0+SmbBWsDiN/b9k6gIrOHfuYWtIW6AZFB98sgwumFBUov
 7V2L4ZpJ+fQRDHrZ3FxRZS1F6/qj/PSpvEGQ6vzh7LAdGOtUt7oN+51klGrk6dRN0vJs
 /IsMX+vrRoy8HRIkb8rZX4w/qwXGm1gjbXjdxlMwWdvAyZE4Cg4/QdzFT4uaAnshYWrx
 7SVkF76IiVd/36JOcW0J+oekFfr4Wdj2drlZrWyVnzkAnp3zZd4W4PSvNBOWdwQqQXIi
 2OWA==
X-Gm-Message-State: AO0yUKUYvlHbmTTNE4wMC47E8lNUfzivnkcTpdiuLs3fYrzwfl0aMAut
 XwFJd2vPY5CBD1nyzTK0seRRMA26V+Dmy7aNKhqftg==
X-Google-Smtp-Source: AK7set925NKjTEWuvGjOwJy72tO1mmft/wd4jclPFO7+9EvcDizCVGLvQs9HXLpss9W6/4Hd7LTjDw==
X-Received: by 2002:a05:6000:d1:b0:2bf:eb67:4774 with SMTP id
 q17-20020a05600000d100b002bfeb674774mr3653465wrx.11.1675790259105; 
 Tue, 07 Feb 2023 09:17:39 -0800 (PST)
Received: from angeloc.wifiguest.local (cpe1150018.bra.be.verixi.net.
 [85.119.216.19]) by smtp.gmail.com with ESMTPSA id
 q16-20020adff950000000b002bff574a250sm11708801wrr.2.2023.02.07.09.17.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 09:17:38 -0800 (PST)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  7 Feb 2023 18:17:17 +0100
Message-Id: <20230207171721.2973997-10-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230207171721.2973997-1-angelo@amarulasolutions.com>
References: <20230207171721.2973997-1-angelo@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7HEE9riIaaabn81p9ufFHwyuoMoVg3jHiOnqk6fIhVc=;
 b=IwUQJK/5iXRT6VAWRwVLCVxq+XA952VsB4hJMhpGhF06XCISwUMbbgAckqup58mEJs
 szqxSuDrqIEniEs5vCEUto/LsgR0cQ5hwKNkER8DdB9FWT363jJam3Kp8SwUPmMw+R7C
 iV6fNzjZ1XhSkLXwsCXexToFjs7Fqvkjno40s=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=IwUQJK/5
Subject: [Buildroot] [PATCH v6 09/13] package/qt6/qt6base: add support for
 libinput
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

From: Jesse Van Gavere <jesseevg@gmail.com>

Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/qt6/qt6base/qt6base.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 3942af6758..fb452b0b7d 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -228,6 +228,13 @@ else
 QT6BASE_CONF_OPTS += -DFEATURE_widgets=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_LIBINPUT),y)
+QT6BASE_CONF_OPTS += -DFEATURE_libinput=ON
+QT6BASE_DEPENDENCIES += libinput
+else
+QT6BASE_CONF_OPTS += -DFEATURE_libinput=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_QT6BASE_TSLIB),y)
 QT6BASE_CONF_OPTS += -DFEATURE_tslib=ON
 QT6BASE_DEPENDENCIES += tslib
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
