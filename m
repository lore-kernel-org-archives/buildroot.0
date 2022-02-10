Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC267C433F5
	for <buildroot@archiver.kernel.org>; Thu, 10 Feb 2022 19:30:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96F71824EF;
	Thu, 10 Feb 2022 19:30:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id thW0hx1eunQV; Thu, 10 Feb 2022 19:30:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C8F2782591;
	Thu, 10 Feb 2022 19:30:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8740B1C113E
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 19:29:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7639C40873
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 19:29:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7uwXMXiC7QSo for <buildroot@lists.busybox.net>;
 Thu, 10 Feb 2022 19:29:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6E86640872
 for <buildroot@buildroot.org>; Thu, 10 Feb 2022 19:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1644521348;
 bh=DTbJDkEKLnUeGt/Rg+lkkAXtkUC5O9jSI060j+Uw2Hs=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=aS9aHIhk6INSSvUyqY1xDqMAmKoCf1mCMM3ZzneKl11N5ZuoqdwwyBYqprHgT9HV+
 VR9V/keP2TNiqWRERDfc+/YQSWzMKwy88nEBKW1oftpWUmHTLDDn67RBXbAIPRlijS
 8dzsjhUrNIJVTczeLr9Cj0CcKjKsRt16MjjOb+wA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.34]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N1fis-1oK58834Wm-011wmn; Thu, 10
 Feb 2022 20:29:08 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Thu, 10 Feb 2022 20:29:05 +0100
Message-Id: <20220210192905.4500-14-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220210192905.4500-1-ps.report@gmx.net>
References: <20220210192905.4500-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:Lb/lEczIhMPCYr2mCHdhEEMqfd2wAzYQzB7H7h/qYL87O4PeCtw
 Cssinri2XG/d75p3P+pzXfzyDMDWEcNuNdV0qM+7vR9QdBcE58/7wOL/74OezSq9b+dosqp
 9vnXDzqbeISsRInxlWSupukgw/6tYI2PXf2xDmWpa93OVzzGET6H6a8KCsALEuo7LfaQDHa
 /6lCkQVpET4CHxCE8enOQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:A2l6zAnR3N0=:XFFVq2TDAr6S1XX42vsWJO
 SM5ACyaYFs/zu2Cd9Uizh/rzDjq1YYMTS+uUONGAUnh7LOTA+aKX97cpsqbp1HJ1M5c6ebIQg
 pJoIF9XY5eawCD1dIVLoSVVf7egW4ZATuCiGQiwo0SWUMs9zRXHMNkG9TCLMKplu1+Ha29R6b
 B7VgXUdDo1Itv0rVaKlbhF+n+rKz/KjOHUBHV3w3LPpgxOCie+cwCy53jEJEp6IcX3BWXRKH4
 1IyB+C6saQZ4vlGb1F53357xGIErijJxOMfV9hf03YYuxOvZeG6Zwm6SZHeYNk4cJZjqHW4iS
 kxYi7X8HMAAR5hMn4yZ+OfPuBtBPX2o/tdxU5sGxs5gIrm5rDmkhWAbaVwlErP/LTj1oF1uJk
 DE00g4uc+imazI8RooMJFnO0P9Ec6NdqSf0nY+Fs/QaMBBOl8dmp7nZbCxQMH4lJeQPkbSRBp
 QV1nucJTuNXzpaavA78KaWTJPbjiWRQg5DA7ZPQiaNHOZT8h7TAvxxgPeNVu05jsYo41yU8UW
 URCo3lPJ3V/QN67ecjziJF67ZBoY9/JtYIISX7ZmOyTq24gxGqEAisKy9JjcdB+AKeMrWcySz
 6fOGrIaKHui/Uub7DBLkxnq3blto9yZAhPotCNvuBX28Jl6OmWtVrosm07hA0DxymZMJJ1MXd
 iAnQ2zqNF0u+ekkDbYuyOAM+kguWrwElX46mXVDLj6mR90XHjOKVgEJuj2NHxn2QP9LqJGUXm
 fR9KaKvhzOKsMwHkxW2ZQDwWtJ8rZiUFSdvHHgM7iJwRAWCNMQyjMB8rXWFiRls6lIfMzhHd9
 meMz9QyoYaQFeUct/g4LyL+1qiANJ5IZjxAVP9zDXyQe1tfF1lZCX+QFubC67MWizEm4ZADTw
 aSdpIVjWrtSyKUlERSYpWWJ4m0M7fljMFjxsMUvvOU8LMB2OW2FcYujVYhgmpNIPF+ffwMEDb
 vK/YTeCPamrHriVbci75rmFqZrOi6iPjZYsuhth2RPS70VERoNDYjw15/LVVfC6W02GMA1hEN
 tz7RETNcFZYXoAj1ZQqNrR88crOQaPQ+bzGh6QIk6ekldEoVVEn9joQTefqBVRgDjYduDPoM4
 jKJkviyLwn+SdM=
Subject: [Buildroot] [PATCH v2 13/13] package/gst1-plugins-bayer2rgb-neon:
 fix plugin install
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

- fix plugin install path, add '-with-plugindir=/usr/lib/gstreamer-1.0',
  otherwise the plugins are installed with duplicated build path
  (as detected by step_check_build_dir)

- remove GST1_PLUGINS_BAYER2RGB_NEON_INSTALL_STAGING (no need to install
  the plugin to staging)

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 .../gst1-plugins-bayer2rgb-neon.mk                            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bayer2rgb-neon/gst1-plugins-bayer2rgb-neon.mk b/package/gstreamer1/gst1-plugins-bayer2rgb-neon/gst1-plugins-bayer2rgb-neon.mk
index 815099e315..0d4aeac7f5 100644
--- a/package/gstreamer1/gst1-plugins-bayer2rgb-neon/gst1-plugins-bayer2rgb-neon.mk
+++ b/package/gstreamer1/gst1-plugins-bayer2rgb-neon/gst1-plugins-bayer2rgb-neon.mk
@@ -10,8 +10,6 @@ GST1_PLUGINS_BAYER2RGB_NEON_SITE_METHOD = git
 GST1_PLUGINS_BAYER2RGB_NEON_LICENSE = GPL-3.0
 GST1_PLUGINS_BAYER2RGB_NEON_LICENSE_FILES = COPYING
 
-GST1_PLUGINS_BAYER2RGB_NEON_INSTALL_STAGING = YES
-
 GST1_PLUGINS_BAYER2RGB_NEON_DEPENDENCIES = \
 	host-pkgconf \
 	gstreamer1 \
@@ -20,4 +18,6 @@ GST1_PLUGINS_BAYER2RGB_NEON_DEPENDENCIES = \
 
 GST1_PLUGINS_BAYER2RGB_NEON_AUTORECONF = YES
 
+GST1_PLUGINS_BAYER2RGB_NEON_CONF_OPTS = --with-plugindir=/usr/lib/gstreamer-1.0
+
 $(eval $(autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
