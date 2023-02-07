Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ED6EC64ED9
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 14:31:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ABCC681285;
	Tue,  7 Feb 2023 14:31:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ABCC681285
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lVGWgOZUsH30; Tue,  7 Feb 2023 14:31:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F29FA81290;
	Tue,  7 Feb 2023 14:31:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F29FA81290
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0B3911BF2CA
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 14:30:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E70F0409FA
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 14:30:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E70F0409FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SVMoX_F1MC_y for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 14:30:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 421FF409EE
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 421FF409EE
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 14:30:17 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 c4-20020a1c3504000000b003d9e2f72093so13326115wma.1
 for <buildroot@buildroot.org>; Tue, 07 Feb 2023 06:30:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FU4BM74o7UnSGo3Mb+P9XelXv8fh3DsFIyXtUscY6Zg=;
 b=5k7cbAUSbObIzQEdpaBBHm3e1ZPuOY24CrmWhInt+8WScUH91GHlXXaQtH/YtI46rq
 UGagmB7d8eLI+HgRhZnuC7DJABaEinaYBfEDKF+q4X/IBhK+4pzXyd48pbC0epCcUHh/
 N+n5vsVLmIwCRaGe53YOATykY0CF4lEhj+mn3n+YE+LBH3Nj4WaWAjmLoyRSTi3EMg8Q
 KRHqtVQ5g1iqU8Ea7cqqFyHfHFnpOlyRylVa12SyYXPwu4E7SnnWuSEYVO7SEwD9AZQP
 UYjfJ82uBIfDKKyPyxkj22uSMBsJQDaKQhdgpDj5K9IdJOEuU47oszbIjillZP1OnEOV
 /L3g==
X-Gm-Message-State: AO0yUKVE8g5nNqxEH63uXdjRLy6RaZ+DpKExihh7bX+B0xQDcsMlAP19
 MROitMZaGLrwfHC60SUEUljfunxQqDqePHJoIVobHQ==
X-Google-Smtp-Source: AK7set9gu6lfu1Zv+jmw6AzB5vhwfH1Mb743Qe1h5Vuvy6Y663Be9QGovLJDebKVi0v5yZmCQxI1Pg==
X-Received: by 2002:a05:600c:4b1b:b0:3df:fbc7:5b10 with SMTP id
 i27-20020a05600c4b1b00b003dffbc75b10mr3272695wmp.0.1675780215235; 
 Tue, 07 Feb 2023 06:30:15 -0800 (PST)
Received: from angeloc.wifiguest.local (cpe1150018.bra.be.verixi.net.
 [85.119.216.19]) by smtp.gmail.com with ESMTPSA id
 l16-20020a1c7910000000b003dc1d668866sm18537074wme.10.2023.02.07.06.30.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 06:30:14 -0800 (PST)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  7 Feb 2023 15:29:59 +0100
Message-Id: <20230207143006.2681335-6-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230207143006.2681335-1-angelo@amarulasolutions.com>
References: <20230207143006.2681335-1-angelo@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FU4BM74o7UnSGo3Mb+P9XelXv8fh3DsFIyXtUscY6Zg=;
 b=IWnRXEwd9Sir7Ff34STtgcUe7124CNFjHeLOMo3nhZrsWZIMaATlWP63Sh7MrmlpHA
 /7IWU0PfBgUX6sNDaHSkzVOGGgpvwikN9a8LoQF51lJQtuarOcc6DtvMRn0JHRdcSuZ6
 2u0gHWbk+bjASrMC3eAqr32XjxHMfQSPCN6Qs=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=IWnRXEwd
Subject: [Buildroot] [PATCH v5 05/12] package/qt6/qt6base: add support for
 widgets gtk backend
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
 package/qt6/qt6base/qt6base.mk | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 9a1c3b4b43..bc2202fb2d 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -219,6 +219,18 @@ else
 QT6BASE_CONF_OPTS += -DFEATURE_xcb=OFF
 endif
 
+# only enable gtk support if libgtk3 X11 backend is enabled
+ifeq ($(BR2_PACKAGE_LIBGTK3)$(BR2_PACKAGE_LIBGTK3_X11),yy)
+QT6BASE_CONF_OPTS += -DFEATURE_gtk3=ON
+QT6BASE_DEPENDENCIES += libgtk3
+else
+QT6BASE_CONF_OPTS += -DFEATURE_gtk3=OFF
+endif
+
+else
+QT6BASE_CONF_OPTS += -DFEATURE_widgets=OFF
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
