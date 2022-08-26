Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5DD6ECAAD4
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 12:53:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3F17240DC6;
	Fri, 26 Aug 2022 12:53:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F17240DC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WurtWcfeq0Jh; Fri, 26 Aug 2022 12:53:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 41F9E404BB;
	Fri, 26 Aug 2022 12:53:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 41F9E404BB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B241F1BF27E
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 12:53:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9A832610F7
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 12:53:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A832610F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WvDYGZFULhP7 for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 12:53:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7380960761
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7380960761
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 12:53:00 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id y3so3012322ejc.1
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 05:53:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=3HRsC6iwm/2ekUOA13PH1ijghkyYJ0DTR4aJCRS9w5Q=;
 b=68wHBRFyjkqvvbzhvCj27LEhbPRUwTPH3YrQVapPMOy1wBBObNuZ3u0NDjo1SN2oSn
 o47j2GzkF2XWsIQWizyFmal2vs51qtcnMOMGgDz5rHyk6IpqeYsHk1pM+T6iqtkqBywZ
 z0SzLS5iLEHA8JTmhfcQ4BQQbb+zhV+86y+4lGOmA4EjjBxzzjXhqLpR9YP8SM288R7A
 UDYIw16vEokbfWb29bdh9vvBzNztOMp58AClBp5UqIU0fllocpGZvD2dj53cRHhZjUBW
 SyfW/Yp9JLggu/SorklhmQT9b8R1Ekz7HWbozEt5XjDEIXzQdNjHUGymVsEc9xxNybu/
 i9vg==
X-Gm-Message-State: ACgBeo2EpanBUnvqyKuKliUlSusIG0dRYmqjdFMqfP4qfCjZH3CJ8sZU
 Q2QyYUcnKXHxKi90L2/yZzlzXwtcXi5Apaut
X-Google-Smtp-Source: AA6agR6bD8ATqPa3IX+uuYJyLSUmvt73nx08+FpTOTzEE7TXiWE9QhbC7wvu3hMBlN/yt1pMclxOCw==
X-Received: by 2002:a17:907:2da6:b0:73d:d587:6213 with SMTP id
 gt38-20020a1709072da600b0073dd5876213mr4580957ejc.5.1661518378305; 
 Fri, 26 Aug 2022 05:52:58 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 s2-20020a1709064d8200b0073923a68974sm829573eju.206.2022.08.26.05.52.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 05:52:57 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 14:52:25 +0200
Message-Id: <20220826125252.16782-3-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826125252.16782-1-jesseevg@gmail.com>
References: <20220826125252.16782-1-jesseevg@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=3HRsC6iwm/2ekUOA13PH1ijghkyYJ0DTR4aJCRS9w5Q=;
 b=SakLHoNk+vJEdAr+3LGvQRADfftLLv15L40EhVXXk4lFf/7ihGI3Xz/EtuY9QsADjF
 oLRP88nb8Pj2N2IX/LUJYddnTQGFo06H60OtZKFxS4BQZzqqXwmuktwCyJeQG5e2bqNH
 kQmXjDeTxP4Q4GGIkG5B2D3yjzqM8xTINAbvzrbK7BrpoRFfNTGWUbZgJjEuK4L7kz04
 MbJhLBrg0GfUSIvQmDZ7WKQrjgiRC+YZObJhr5uVDcAtgyeH5zS3HkOKyiB87OAjutDj
 apEkPQ1KPL4zEtilEQbOM8n/81rzJ7dnJCwq6Acg1rPzISmBXz6mEfwf+zGD0Qq+lkwP
 Pw3g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=SakLHoNk
Subject: [Buildroot] [PATCH v3 02/29] package/qt6/qt6base: Add license
 information
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
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add license hashes to the hash file and add the information into the makefile

Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
---
 package/qt6/qt6base/qt6base.hash | 6 ++++++
 package/qt6/qt6base/qt6base.mk   | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/package/qt6/qt6base/qt6base.hash b/package/qt6/qt6base/qt6base.hash
index 31ed2494af..5efc5c2815 100644
--- a/package/qt6/qt6base/qt6base.hash
+++ b/package/qt6/qt6base/qt6base.hash
@@ -1,2 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/6.3/6.3.1/submodules/qtbase-everywhere-src-6.3.1.tar.xz.sha256
 sha256  0a64421d9c2469c2c48490a032ab91d547017c9cc171f3f8070bc31888f24e03  qtbase-everywhere-src-6.3.1.tar.xz
+# Hashes for license files:
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
+sha256  0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652  LICENSE.GPL3-EXCEPT
+sha256  88ec689407cf2df9b2eb5c45952564d51ce73c129a3bdffb15c0d2d161ad7558  LICENSE.LGPLv3
+sha256  ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d  LICENSE.FDL
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index c67d94e193..7a0838b2bc 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -7,6 +7,8 @@
 QT6BASE_VERSION = $(QT6_VERSION)
 QT6BASE_SITE = $(QT6_SITE)
 QT6BASE_SOURCE = qtbase-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6BASE_VERSION).tar.xz
+QT6BASE_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs)
+QT6BASE_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
 QT6BASE_DEPENDENCIES = \
 	host-ninja \
 	host-qt6base \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
