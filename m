Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3C1CC433F5
	for <buildroot@archiver.kernel.org>; Mon,  3 Oct 2022 15:09:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76EE760C30;
	Mon,  3 Oct 2022 15:09:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76EE760C30
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gtGbhs8BmiyF; Mon,  3 Oct 2022 15:09:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9204D60C26;
	Mon,  3 Oct 2022 15:09:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9204D60C26
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D33EF1BF9AF
 for <buildroot@lists.busybox.net>; Mon,  3 Oct 2022 15:09:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AF89360AB2
 for <buildroot@lists.busybox.net>; Mon,  3 Oct 2022 15:09:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF89360AB2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vk3P04OWT4Kn for <buildroot@lists.busybox.net>;
 Mon,  3 Oct 2022 15:09:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EDF1760A69
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EDF1760A69
 for <buildroot@buildroot.org>; Mon,  3 Oct 2022 15:09:43 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id a13so15047098edj.0
 for <buildroot@buildroot.org>; Mon, 03 Oct 2022 08:09:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=n+lf8XWiyWxIdubPMkulSDJN7SSzbqaxRn/yIKZXiP8=;
 b=KL3uGuvESvEDTsJKNd6zBOCwiyoQl/mEMsuT+Gc7pVik9s8OThtVY0G35o4kP3Vh6t
 AIkjTfwcrjFgGbSc+nCCXALfNvXf0ggGANd/3j+30AVuH/vqzhY8PCKInKtT/B83C7l0
 aw8Be6H1+jMMccAEJjTH+ERGB29L5GgTPx/KXHg+NzGf+jcof058XhTNmv4BsIyE/qzO
 JLPLqJI0i3S3CpADxGrRd14Wmfq2zxZ9QwDBkp1zh3pZyF0L4YArDfdBT3GU+9nOmyA9
 5h52+O+EoTX+uzdTW5xh9IYp40au3kjsGbC4P7avrPo+R0168FlBzaFwyp4FiAgVxSGB
 OJwA==
X-Gm-Message-State: ACrzQf2yYiG5armJQbl1Hf9RxRSP4oFV5/qbQ4U4soIC6yVC02iAMfb6
 S3EF2WF4NaPJEvOvb6jTwWRxCEiCbYD97Q==
X-Google-Smtp-Source: AMsMyM4Z/l2nFyPGazST5JK6YV3suap157tVwkkZhtYvFig1VdYObvTihXSZLYRyvckBcTh4zO9Elw==
X-Received: by 2002:a05:6402:74a:b0:458:cfe2:f351 with SMTP id
 p10-20020a056402074a00b00458cfe2f351mr8010640edy.359.1664809782219; 
 Mon, 03 Oct 2022 08:09:42 -0700 (PDT)
Received: from angeloc.amarulasolutions.com
 (host085115199111.static.fidoka.tech. [85.115.199.111])
 by smtp.gmail.com with ESMTPSA id
 sh39-20020a1709076ea700b0073cd7cc2c81sm5606263ejc.181.2022.10.03.08.09.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Oct 2022 08:09:41 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon,  3 Oct 2022 17:09:39 +0200
Message-Id: <20221003150939.3243425-1-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=n+lf8XWiyWxIdubPMkulSDJN7SSzbqaxRn/yIKZXiP8=;
 b=e783oYTtHILfEthLQM/JZY60Dl/3l47kZkR4QJ1jM2sH1e5hWOfHrM84uaQq6aDyp4
 rtlGLjqxieJ0uMdaTHB1ShPgP7ae444yc4QNBS0OWBuYxkCOVE7WcUTmi4GUHxOqcA4V
 ZHPslgPQTqowIVGtlDxwwbGZZjF56BgavYkrY=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=e783oYTt
Subject: [Buildroot] [PATCH] package/htpdate: bump to version 1.3.6
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
Cc: Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/htpdate/htpdate.hash | 2 +-
 package/htpdate/htpdate.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/htpdate/htpdate.hash b/package/htpdate/htpdate.hash
index d5426c6d08..f572fb1e84 100644
--- a/package/htpdate/htpdate.hash
+++ b/package/htpdate/htpdate.hash
@@ -1,3 +1,3 @@
 # Locally calculated:
-sha256  a8734d4f1d84d0608d045508608f2d29d8b968da269f83120aaac67709b1bd03  htpdate-1.3.5.tar.gz
+sha256  3cdc558ec8e53ef374a42490b2f28c0b23981fa8754a6d7182044707828ad1e9  htpdate-1.3.6.tar.gz
 sha256  7989949df09a0489434723c571541604cd3f2e0418c6a6aa9179bfaf8ec807cc  LICENSE
diff --git a/package/htpdate/htpdate.mk b/package/htpdate/htpdate.mk
index cf47ee5451..2d4a11dd9d 100644
--- a/package/htpdate/htpdate.mk
+++ b/package/htpdate/htpdate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HTPDATE_VERSION = 1.3.5
+HTPDATE_VERSION = 1.3.6
 HTPDATE_SITE = $(call github,twekkel,htpdate,v$(HTPDATE_VERSION))
 HTPDATE_LICENSE = GPL-2.0+
 HTPDATE_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
