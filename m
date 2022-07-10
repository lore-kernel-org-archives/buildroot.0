Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2DAAC433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Jul 2022 21:26:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C9F560E5A;
	Sun, 10 Jul 2022 21:26:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C9F560E5A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I54GIQVDJ47H; Sun, 10 Jul 2022 21:25:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7DA3160E92;
	Sun, 10 Jul 2022 21:25:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7DA3160E92
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A335B1BF3F6
 for <buildroot@lists.busybox.net>; Sun, 10 Jul 2022 21:25:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8AC5960AB7
 for <buildroot@lists.busybox.net>; Sun, 10 Jul 2022 21:25:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8AC5960AB7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0VXboROULL9Y for <buildroot@lists.busybox.net>;
 Sun, 10 Jul 2022 21:25:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 960076080B
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 960076080B
 for <buildroot@buildroot.org>; Sun, 10 Jul 2022 21:25:55 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id bk26so4742144wrb.11
 for <buildroot@buildroot.org>; Sun, 10 Jul 2022 14:25:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8tcNlfxBM/ektL7s+Xhf1BxC+0JDCiiJEleFIlH3QSE=;
 b=mRgXxhPaMj1rCV5uyvj/MGzYTV3vQbPxZg4hmX/IcyuMkqIUHNAmd8Z6eHxSrm3zwl
 yONyXXCU+zdKSh9GWHD9xXbCJcyuQ9WGQW5u8Hcfr0LpQmjD2jq78jox64wY/IeiLWQz
 diHq/gF5E+M/tLGIJHNcLQ1uiYZm+3L0qy6trii2mdcL9XSjigBqsfQmDZRnSKQP2IRH
 0euCSm8n34O6MjMrH3PYFvyzvx3cBAcbfu5/WUTXgt/J6u3c2NAmJY8EsIC+HiSmX9CT
 khemwhAiXPuBVsIMMIwwKAwM48se5B81iDV/+pTLUFucBr9ZJBvn/KB9SOIgd6NlK+Zw
 fMrA==
X-Gm-Message-State: AJIora/puzYt9+YLTVdlNhyCbwac9HfqzKLe5ALTMLROr7pNj0txmTPK
 JfbI6SWPeXrmGoAKhE56o6f8WJ2dkkc=
X-Google-Smtp-Source: AGRyM1u3lgzore0Nl2cFxz3excoZ4uaw4j1JQaSill6+4c4lGk980dNMSPj/ei4nn9BKalq8skoSLA==
X-Received: by 2002:adf:ed44:0:b0:21d:81a3:d78 with SMTP id
 u4-20020adfed44000000b0021d81a30d78mr13710820wro.677.1657488353582; 
 Sun, 10 Jul 2022 14:25:53 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 b3-20020a5d4b83000000b0021d6dad334bsm4361006wrt.4.2022.07.10.14.25.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jul 2022 14:25:53 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 10 Jul 2022 23:22:56 +0200
Message-Id: <20220710212256.863568-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8tcNlfxBM/ektL7s+Xhf1BxC+0JDCiiJEleFIlH3QSE=;
 b=cZDB70JeEfbNwnN01PvIZWOKX1FV+jSc3KkIwl/sGl89jBBeOiWGEcVqRnWyxWkvqH
 eitkRWxh2EusfIsUgXkB41owN29NHPrzssVtMfePLKWHkQI4CsRd7FWd+/YVKwn/JJxj
 hnXzat77u/FH11cU7SVRtrhrsj0Yw45jNw4uWiagwfR3uVi6+uqNUXYrq9dI+I83JNp2
 LQIMEJmi7+YBxlxLOGI6xlJScMxvLsAO3WZwaojCJ4ZGOL2p/1nYFnlQdoiKLOy0n2Qo
 cJAAqi51zvlLe2T8pLfwWZ61Uru/21iy2xmsAKI6mD8PLsvnlrtLdSC4tF65Ljbh1CBH
 Wr/A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=cZDB70Je
Subject: [Buildroot] [PATCH 1/1] package/liburing: bump to version 2.2
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Update hash of LICENSE (lines wrapped by
  https://github.com/axboe/liburing/commit/56066e7a41fdc6a0d0c537c94b2e746554449943)
- Update hash of README (changes not related to license)

https://github.com/axboe/liburing/blob/liburing-2.2/CHANGELOG

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/liburing/liburing.hash | 6 +++---
 package/liburing/liburing.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/liburing/liburing.hash b/package/liburing/liburing.hash
index 56e90d71cc..7d3306850f 100644
--- a/package/liburing/liburing.hash
+++ b/package/liburing/liburing.hash
@@ -1,8 +1,8 @@
 # Locally calculated
-sha256  df7c8fd05fd39da622b2814e06f815f11f1beb429487a4330eed64bb7f353dbf  liburing-2.1.tar.bz2
+sha256  0fcd25dc1eb32cbeb534219f8e7fcfeadbd8dc2304aa447148e5ca8408076f22  liburing-2.2.tar.bz2
 
 # Hash for license files
 sha256  592987e8510228d546540b84a22444bde98e48d03078d3b2eefcd889bec5ce8c  COPYING
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPL
-sha256  d0b225f17ef2d05d5cda6b25b2dc334ef6f5f12537c20edf6e391852a095ec19  LICENSE
-sha256  97d62ff5d7cf0b1cef34c33a89877352911278ca4ac1c6c4f24a835baa5ea10b  README
+sha256  2ec12f7934cdfce25ff72b0557738989d79fc7a496d1cf9b2d3f9464fd61edbe  LICENSE
+sha256  1c3351726408c22787dafbb5cc4bfeaa38ca8e92eabf59a36a046a5a2e66108f  README
diff --git a/package/liburing/liburing.mk b/package/liburing/liburing.mk
index 874e268d43..e98c710997 100644
--- a/package/liburing/liburing.mk
+++ b/package/liburing/liburing.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBURING_VERSION = 2.1
+LIBURING_VERSION = 2.2
 LIBURING_SOURCE = liburing-$(LIBURING_VERSION).tar.bz2
 LIBURING_SITE = https://git.kernel.dk/cgit/liburing/snapshot
 LIBURING_LICENSE = (GPL-2.0 with exceptions and LGPL-2.1+) or MIT
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
