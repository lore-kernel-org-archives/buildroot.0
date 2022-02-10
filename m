Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C36AEC433EF
	for <buildroot@archiver.kernel.org>; Thu, 10 Feb 2022 19:31:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6F1B8408DC;
	Thu, 10 Feb 2022 19:31:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 42bG6RLt-n0g; Thu, 10 Feb 2022 19:31:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 428E240562;
	Thu, 10 Feb 2022 19:31:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 73EDB1BF3BB
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 19:29:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A4365817A5
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 19:29:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ORMga8p0iLPG for <buildroot@lists.busybox.net>;
 Thu, 10 Feb 2022 19:29:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 68CCA81775
 for <buildroot@buildroot.org>; Thu, 10 Feb 2022 19:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1644521348;
 bh=8IqmBG+vXyPPV3/D3GU/67y047LGNP+JNySunMiEhjU=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=CjxirRbY2vwrj2dqPC9i2YLUuVRY1a7YD1kg+R5GsV5X+OOmLwdJVShLS/cgAedLr
 8s/A1PKzsrtTN9DtWv5Jg++yPbpGJrxSSW4rew3qVgOuAasqEI5NC9NLt9x0X05xh6
 bNZIBZNYwShnsdhCiIP0zsICOroJJSw8gKJ0kkZA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.34]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MCKBc-1nRYX828fa-009QOR; Thu, 10
 Feb 2022 20:29:08 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Thu, 10 Feb 2022 20:29:04 +0100
Message-Id: <20220210192905.4500-13-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220210192905.4500-1-ps.report@gmx.net>
References: <20220210192905.4500-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:fHLks/UOPbpU8t+hKvMNP8rBmbiBuhDeBg2LmqumC0Q/BYUEATm
 WZxBSPstVetpKeAHGCe93dHfibtwMTCsVXqamOioVVJZb1yqsIEAnDUjZgzgCcdK+QSDbWl
 Vd76uNmb81Rzeb4QVwKQYNWWKD3jDKXhCCTlG/iJTddW4LCFBgJo5FGRRdX61SG8PWtRUtY
 uUjnkovQ8T3bl/WkTyvzQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:tAn3ZdirB+Y=:t0qX88YFY/0OhdIAas9/VX
 Z+PveFmazws7UzruqrqxARbc0JJsIwdyMk5l0FxWdIQHKt9zb0mX6UCuuR153U+D/+IwobgD8
 PPG3VcixmkMi4DzXcXkVkVzfHpHPnMQmRznIZi8T5+by9Sr3/s84EANrRWZyJjnbYT19lphNG
 gpeqPlhlvrIKiL/vEdvKT9MkoFv5nbJxVxxeHoERTjZf6lOrCYm5IUA3+Ml54hjGvRC70G2O5
 HioZ7M7BuA8ZRo/ZXPRscbUQVPHIAeGHyPf+HB2m52kUzH+CIhByhnJOgOhwVTrRb9IWXcCfW
 wrgd8izRWyq+b8Zb4SPrqdagK+uq9sLf8pN8aeoC8YLihc53IfBI56iupvtRI8xvxOpFGnFd+
 Zweia6+9by0wS4AuXTIBBnfoM19MjYxnFhyFVBRnCVRgWHlkAA9RgGysjRuX0/Tz3i27RcuEd
 wNZUS9G2DbH2oHtN1hvYmpbKpdV2zzxgk94jry+xv4M9e0vvZ4V/2LPBKkPTNq6Y9e8HPyL+l
 99i52D7oRNhyDxps88w3o8PmEcoTJtc6yiBA9j+kNr+X6MyuHRqPJdQpMpox0LWssaG1Ni150
 txYrgRcs0R07fls5UYXz0eHSWFiaj9ZJuZfHR325B4frQOS8pA0Y7gmvUIjiJRs4yvZjOrwAV
 UhFBk3rVnPAoNFfQk5JfTZ6M/XN8uWrcEX+n/MMjNt6MC0L3FkTdBHOsq51Ey4QppW3MVKftF
 KLN02LLqQ2R45BAHd5E9TUW71sdEwFTztDle0Qv2tZMxJBmoy3FC6l3fQok5Ead6JyFCym+7A
 WelW3hp6lPgIHp7oDdWnK7rJTPZ1aRsoC0j7rCWxrSLXSKJVOLhrMQ7TS30m75ZTu902BHyLB
 GvDHfK8i0nBP5IjZhGTpIev3AekNXWRVPg/WKZXBza40aHYs7tqAEbW8NHACba5dAlo+TNvUM
 XArYplcA4NHgrocZDq7L5WII+TgMdIYtPz7K2V0w6u8LSjz7ve5OpXHtVAikA8q8HKS1f2jsJ
 Gfrhlno7OvSTtg7ARXv521wm1bGR7JuUBj3Dj32sZ3qZDbXksfaAFfeWnCNNCPQb5V+8yWGgh
 +Tksyr4vWUOX4U=
Subject: [Buildroot] [PATCH v2 12/13] package/gst1-python: bump version to
 1.20.0
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
Cc: Eloi Bail <eloi.bail@savoirfairelinux.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/gstreamer1/gst1-python/gst1-python.hash | 4 ++--
 package/gstreamer1/gst1-python/gst1-python.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-python/gst1-python.hash b/package/gstreamer1/gst1-python/gst1-python.hash
index a760e53e7d..a2f17583fd 100644
--- a/package/gstreamer1/gst1-python/gst1-python.hash
+++ b/package/gstreamer1/gst1-python/gst1-python.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-python/gst-python-1.18.6.tar.xz.sha256sum
-sha256  bdc0ea22fbd7335ad9decc151561aacc53c51206a9735b81eac700ce5b0bbd4a  gst-python-1.18.6.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-python/gst-python-1.20.0.tar.xz.sha256sum
+sha256  8f67bdc5606ba33606c6bc896e89de7dcd8cf4fca459f71389b1b6fe075b5e54  gst-python-1.20.0.tar.xz
 sha256  ea3ad127610e5ded2210b3a86a46314f2b3b28e438eccffdae19a4d6fbcdb0c2  COPYING
diff --git a/package/gstreamer1/gst1-python/gst1-python.mk b/package/gstreamer1/gst1-python/gst1-python.mk
index 7faab752cd..a9cc32d1d7 100644
--- a/package/gstreamer1/gst1-python/gst1-python.mk
+++ b/package/gstreamer1/gst1-python/gst1-python.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PYTHON_VERSION = 1.18.6
+GST1_PYTHON_VERSION = 1.20.0
 GST1_PYTHON_SOURCE = gst-python-$(GST1_PYTHON_VERSION).tar.xz
 GST1_PYTHON_SITE = https://gstreamer.freedesktop.org/src/gst-python
 GST1_PYTHON_INSTALL_STAGING = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
