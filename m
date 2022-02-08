Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7224C433EF
	for <buildroot@archiver.kernel.org>; Tue,  8 Feb 2022 21:26:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A10660F48;
	Tue,  8 Feb 2022 21:26:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9U2SjwFcFYPb; Tue,  8 Feb 2022 21:26:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBD0360F44;
	Tue,  8 Feb 2022 21:26:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 109E41BF391
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 21:24:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1622360AB9
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 21:24:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CDhZkOZDEBHQ for <buildroot@lists.busybox.net>;
 Tue,  8 Feb 2022 21:24:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5847C60AEC
 for <buildroot@buildroot.org>; Tue,  8 Feb 2022 21:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1644355446;
 bh=1G1bJN0Pfksb6pPUoLngjwr+nbpqnpSmZy4eqoBQRLc=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=PPNL8Y24/gb7e6baBz8PZcDLdREEWiZ6U2vyorH074/OaSMMIjUbsA6pkFacteXH7
 VAg8+L+nNOxzvpJLQ/4vR6ynez0ujMsn43ZyY021y01N07S2nGGo85OSjddL7jK8MW
 Fii9bhf7h+umeHdlcnZCV9Wa62Uwb2d+DiYnp0V8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.59]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MLR1f-1nYnZN2Xml-00IV4Y; Tue, 08
 Feb 2022 22:24:06 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Tue,  8 Feb 2022 22:23:53 +0100
Message-Id: <20220208212405.19243-2-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220208212405.19243-1-ps.report@gmx.net>
References: <20220208212405.19243-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:uDl6K6/Sv0AOrzNgRTy0khO9okq0uuwjYKTQDOm+W9z1GH7QPfq
 UJkq4tkcTPQbbcrLQVSB2nIJX9ePUmfPfz/HPKmYOOVbAdaZm41xhueBsC3pIQjsBf8naJb
 diRyCUpkG2175lraox+ja5Et13sq+DAlphf/+XVAkDXaaM201j2KuX4Y4MSTq02/AYX0kFw
 lC+e6kwjY53exgaTS0uiA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:RDL9l7raiv0=:ejdXr374W/yaQi6SZ/lTVb
 ukgdbGVD6T9S97RRUmsIMljJX1MmhuxrV4JPy4jLdWNHSg7lOGbJ6KJ527eNCqmpmbhkpIXLc
 aBXlizcdZqNlxzBlbWS/y4AeAZmHKewLmoyIV8btjj5yhogUNp9kXuermtyrP5tBBZpLdR0gD
 qu3ryyYi9e9cbSDT1NZSwsza9WmmY0HfhGxtW35Fo1z3zTWSOdSZJrGRn2NAdmYNtdVNH+tUE
 OMt6jEE8TBud31ILC37VNosRzUtRcodQOKulYUcZWqR/gehDAfxG5t+mjnOyV0k3IIOMijlcv
 1egZ4VsVUmC3WnL1rJNDwl6HyhNmyMlJHhY4qquZL+pkw0ioBrxqspWvAnAp4zrbK8VQ6YSme
 KyXq4qZMxJBlQrciRQIF+fh6sbW2zhNZrWq9rviryY3ECOG+1gD0K7MZQqsSnlDWTOQvbkuV0
 NVSZWyC4mJTCtqm0ctemPex3WnMJX2yJ8jG8DEodEOlgCEqBKZ02wtf70174SLZNQvXDPGNpl
 AgxAAdgoLsF/o+aF8v+8DM3IwpSl3nj8E269nENWW2d2eD/ePswA+fLdSMwSU588Ddmrg4qJy
 YfVgZxS1ukt8bIzcSL+9MxK0llWngfy8JuHh+AaQ1feI3Y0JJK4kEqWD52zq2vmPRx3YrHd/u
 ra0RPDXosnujzIFv1le/ks19bO00RdKtni/j0rRXwNqr4dbzMmzdIa/RLlrfm6FLxkshWiK8g
 G+lDvInteRDOeQsKUcsW8gb1Ef0FwmldnDdQ42OBlo0W3LLMVVBcMwRwB2T31bOWealUF/VHm
 X1uZs3iWZMKFlHSi/V3BN7Mlgtx4kTLIN3pka3PYyhV21xNmUy4X4bSATlREupm9SzeGGlEJz
 ikALkfruBdU5y4215UKNoljU9rGtCt9L/+CpTYdF+eYaA5k5IomRLRlPF3kKFOt5+674hXBKQ
 glK758iNDpKGLWN+Bwi3f2BtT1xRMqElNg7arg6uTlk0nc87Fg+WsTTcZPBa3Dwdj68f+w9yw
 tq2wBMrOkJtnLgK1JXFChnc2mwz0weDHrQQjv2sWqLsHQIMuVlLE8Kb3m1m07SQbsKtUkCHwc
 i/Pj4ugj4SdAto=
Subject: [Buildroot] [PATCH v1 01/13] package/gstreamer1: bump version to
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

- meson option gtk_doc removed ([1])

- update COPYING hash (license text update from LGPL-2.0+ to LGPL-2.1+,
  see [2]) and adjust GSTREAMER1_LICENSE accordingly

[1] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/f5ee12395832d4305bb8dbdf4751552d03430d6d.patch

[2] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/d157b23fb0ce175b167611a4cb019599d9017042.patch

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/gstreamer1/gstreamer1/gstreamer1.hash | 6 +++---
 package/gstreamer1/gstreamer1/gstreamer1.mk   | 5 ++---
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/gstreamer1/gstreamer1/gstreamer1.hash b/package/gstreamer1/gstreamer1/gstreamer1.hash
index 1202bf2c50..f4a74a6125 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.hash
+++ b/package/gstreamer1/gstreamer1/gstreamer1.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.18.6.tar.xz.sha256sum
-sha256  4ec816010dd4d3a93cf470ad0a6f25315f52b204eb1d71dfa70ab8a1c3bd06e6  gstreamer-1.18.6.tar.xz
-sha256  f445dc78b88496f7e20c7a2a461b95baba5865c8919b8289ac24ac0a80c6ce7a  COPYING
+# From https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.20.0.tar.xz.sha256sum
+sha256  edf4bffff85591d4fff7b21bb9ed7f0feabc123ac4a4eff29e73cbce454f9db7  gstreamer-1.20.0.tar.xz
+sha256  ad2eec519ebd4b5df86ea84dff24ae3bfa2edea846a703b58902dd221ae375db  COPYING
diff --git a/package/gstreamer1/gstreamer1/gstreamer1.mk b/package/gstreamer1/gstreamer1/gstreamer1.mk
index 27745f3bf9..86df5d6cf6 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.mk
+++ b/package/gstreamer1/gstreamer1/gstreamer1.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-GSTREAMER1_VERSION = 1.18.6
+GSTREAMER1_VERSION = 1.20.0
 GSTREAMER1_SOURCE = gstreamer-$(GSTREAMER1_VERSION).tar.xz
 GSTREAMER1_SITE = https://gstreamer.freedesktop.org/src/gstreamer
 GSTREAMER1_INSTALL_STAGING = YES
 GSTREAMER1_LICENSE_FILES = COPYING
-GSTREAMER1_LICENSE = LGPL-2.0+, LGPL-2.1+
+GSTREAMER1_LICENSE = LGPL-2.1+
 GSTREAMER1_CPE_ID_VENDOR = gstreamer_project
 GSTREAMER1_CPE_ID_PRODUCT = gstreamer
 
@@ -18,7 +18,6 @@ GSTREAMER1_CONF_OPTS = \
 	-Dtests=disabled \
 	-Dbenchmarks=disabled \
 	-Dtools=$(if $(BR2_PACKAGE_GSTREAMER1_INSTALL_TOOLS),enabled,disabled) \
-	-Dgtk_doc=disabled \
 	-Dgobject-cast-checks=disabled \
 	-Dglib-asserts=disabled \
 	-Dglib-checks=disabled \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
