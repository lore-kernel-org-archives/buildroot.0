Return-Path: <SRS0=n+Pr=OD=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85362C433F5
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 21:06:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F35B610FB
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 21:06:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4F35B610FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 23A8480EB2;
	Mon, 13 Sep 2021 21:06:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dWglTebwshKD; Mon, 13 Sep 2021 21:06:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E79280EBD;
	Mon, 13 Sep 2021 21:06:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8B1CE1BF318
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 21:04:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3D202402EB
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 21:04:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PDG6ssG1HKUl for <buildroot@lists.busybox.net>;
 Mon, 13 Sep 2021 21:04:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 01481402B4
 for <buildroot@buildroot.org>; Mon, 13 Sep 2021 21:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1631567053;
 bh=toMB9UD1p8AESWPLWsA6zej2BMaT+KOT3y7X+bKc3DY=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=b/S2Er+hPIWE5OCGHxdYRF2+fVZ2nR04nJRaGTuLPbJa6RhNV2C/QrIGgvwKA2AmV
 iXTRGYfdYu5G3gabo4Pyekl0FINGUB70wlT+WbuKKK/RRVet7v9YisQ/Q13+s9wJbh
 eFj6FXYXR4uHWyg8eFl3jKWa+ujoy9WS+474Vszg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.240]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MgvvT-1mqwbp45i1-00hJdE for <buildroot@buildroot.org>; Mon, 13 Sep 2021
 23:04:13 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Mon, 13 Sep 2021 23:04:02 +0200
Message-Id: <20210913210412.24042-4-ps.report@gmx.net>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210913210412.24042-1-ps.report@gmx.net>
References: <20210913210412.24042-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:uF5190x8RwDy65imcM8flgS7lZlioDSJfUnGzOKTdc4eJqUnm7J
 oMEtgJ4lH8EhNmUYzrv++SA6vpPv6hhVhkw7ToLrZqVWGFUNV6pZ11+c4xiDzcsb6tST2DJ
 7OExu0Xm25Cj8EwqVBD1tSnNBx7WwQweoKDGlNzXqCI2ADvTtEjCTkbMq2RIg0g/05rksn/
 b1EBxtsgSgKXBSOSuDeUQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:YrFx1YE2P+c=:hq6IolqxxCEZ3CnFhFI+6K
 cVxpeEPykWOVnLn1jqYiRvKlfVF5QuFXMuX94jYIhdRKxdyiR9ANvJuEnwbF6S52YZEQ6o1f3
 9ab2E4QnxJHWOt4bRJDOHoDd+SdCr2chiIOYTdEI9rhodr2qlH98OZypD9QRHmSCaQiy50gPx
 CmepmFfP1wYlN6HKaVRMzfZ9s8JcSjjEn9l1nHi04v22OY+FLzCpHQ58H7KogyrXqEP6CDybI
 B/fspwoEhEe3EkUZNBrUCTVrx9iu2WMWYvBVAJ9dvC/8OlppgQ6i1Zw52evqkzjnSU5IA90pu
 IdX1e3o31gAG37Dtd9JN8J7aCb7jV8/RLGA6ee8T5cg1hzfcO+539QVfmj9Hv5ehsw8PRpY5C
 EMvGsUyYJN0Lb81gDi1g7EovfXGMbwNWYvprE6XIdZR+/KUsjY5XJBVf5D91CU4iUPK2bBbWZ
 d96WWQC7oqYR4r9GRWVGK3/p6XnCwZNaRKLIT6ZxiH5J4W7sTiWy6owav1Ew22Otg1rN2VCxF
 Bp6H4lIkZs42cpAVqK9UDQZ4mrOGXdwAkpk3sqZjGRYcakfyqp/gOmO3GgbW4/I1hxhSvD2Dz
 55WEmK2Bca6pj1+kcxqW5xQZoilI7JV9/QVZTjKTSjZCQ/OLK7Hb0tjtbRoLmf08Hyr+OTGbb
 Gn9En+9fPWCA64W4O9fDuH5I+6BFc/f4zDuAWq7W3JuXVRoBwBLfraUuiHVWY4yBkpxNCL2aP
 +Srquqb8kJJEcXuqkwSRsPQ8FpWct7BaMQhSzGcRHS0zQzhrYm/i9xdJUFwujRMNH1+viCER9
 aSjlj0yc951oLXypfSVZ1TMlAWLuGauHTOcXfYDCZAE9JwrarjTY8B4A6jgqBsE/u/Zhmb7Dr
 U8b6AK7HvIEc3POWYHgzUJBNNAcPqKAv85Bkr7KWaSU3Pp8EmCIl2/CMe8D97eBUsm9dFH6oc
 6OquJPou4F6wWiEyb+rq6nAFmisrVKGWCD3jHS6iGmUpaz0n2PByuvIuiuv+G9HqOpukf+442
 b8Ip/iWja7G+h6p3VA/mif495yMvixEheY0hZ+lxxSPi0FJgZaOt72Lay5KuWrgsej9k78Wx5
 oZ5Jc0LAKmvWEw=
Subject: [Buildroot] [PATCH v1 03/13] package/gst1-plugins-good: bump
 version to 1.18.5
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash | 4 ++--
 package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
index 546fed98f7..ea9f43bfd2 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.18.4.tar.xz.sha256sum
-sha256  b6e50e3a9bbcd56ee6ec71c33aa8332cc9c926b0c1fae995aac8b3040ebe39b0  gst-plugins-good-1.18.4.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.18.5.tar.xz.sha256sum
+sha256  3aaeeea7765fbf8801acce4a503a9b05f73f04e8a35352e9d00232cfd555796b  gst-plugins-good-1.18.5.tar.xz
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING
diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
index bace77802e..44da3c3c30 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_GOOD_VERSION = 1.18.4
+GST1_PLUGINS_GOOD_VERSION = 1.18.5
 GST1_PLUGINS_GOOD_SOURCE = gst-plugins-good-$(GST1_PLUGINS_GOOD_VERSION).tar.xz
 GST1_PLUGINS_GOOD_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-good
 GST1_PLUGINS_GOOD_LICENSE_FILES = COPYING
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
