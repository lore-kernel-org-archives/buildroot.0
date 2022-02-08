Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B47AAC433F5
	for <buildroot@archiver.kernel.org>; Tue,  8 Feb 2022 21:24:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46E3460AEC;
	Tue,  8 Feb 2022 21:24:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ltg-EOVfoEeM; Tue,  8 Feb 2022 21:24:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81E5F60E27;
	Tue,  8 Feb 2022 21:24:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D2F791BF391
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 21:24:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C1EE960E27
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 21:24:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u2p3utHfG3hI for <buildroot@lists.busybox.net>;
 Tue,  8 Feb 2022 21:24:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 549A860AB9
 for <buildroot@buildroot.org>; Tue,  8 Feb 2022 21:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1644355447;
 bh=3uB2T78QfaPfFe//JaRu/FREy5CUjG8HrkDjh4d0mKQ=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=eX+CxZhWtm3kMKZUS5FksTDArAjQW2CxD0Hu/k6rsHjNju/OjIzeq+p2ueIRA1f6G
 v5WoR+0mk012PQgFN+yIXEoa3gQDZ5SRYl/rTNKB3kHq7ziMDzJWnUWBFDVfUQ3qEX
 k/JlGa49HvenVcI/UdR90g+Pk8evv0h1kBxEXhew=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.59]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MdNY8-1nqbjj0GTw-00ZLZF; Tue, 08
 Feb 2022 22:24:07 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Tue,  8 Feb 2022 22:23:55 +0100
Message-Id: <20220208212405.19243-4-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220208212405.19243-1-ps.report@gmx.net>
References: <20220208212405.19243-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:CfR7Ix23nbfjA6t3bS924hIU2RokTvSCHHQLRREFJbbpxgSdV/3
 1FkWWWpE1s2HegbrnOdKSswV7zc8pnrJigzX1rgJY5mNIV5xWr55IJLyV1o5I+VzYVD9YbD
 Udn/RCBc4TKHp7/Ga9Q8c3SfKdM6W+XzPfHUpSNkmPnSY6BHA9heYgBZrHZkVXH4J8txGqB
 dDTKqAEakTKCLTz/LUjiA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:wsuK/bScXzg=:rxU04LF+7oT0WIPCsaUvUf
 3/XMED55Q64HB7K1L+YBeKr95quiDdeDEtuRoEd+rL6Da6fwtUxH7jiDq3mXjJTOUDwgf+vCB
 m17NIib0qkFEx+cM5OZS+VeCLwJADr7dCFR7Zzu02PkmTkgE6TW6kbkcnR0rXlgeUxJaP4mmW
 AE/+zKcL1cahgrhGxGX0NzbFustwTgvfqRQHFMB2jJOLWim1H7tdM93hvmuLRK166/jnx59Bv
 q7SjnaGv5EVLT42Uxq9skUlKlI0tSCuJfX4AMqwrnhKMHfm2JO5u++umFAnlMtVfMR5ss89gr
 ngzvVxpx65U4TPvNPZSpuL5ELOYFI/kthmZRBShtkAMTOkvwZSpipulAeVtfCaJKD3uxm4wwD
 Pn5JolyhjMR5CO8xQjwXW8zeEtZOq/ezYTqIPS/pjwo3zcNh9CJsB8n8D3emNj0TUkx6lTDEh
 36WuJiIJLJmnnxSu+5DSNaGHyFrgPeV2lR7JWmoDAhjr2a6HfC+dtNLfDw0JqEjCMsvxrz6Uj
 mEET2sc5ewf7zHkYJtkpbYrU1hqiLWWIdKLF8+lUXgIDnVZZQaZZR9ZLxVN/Psss1FOlqxc1B
 rR2TLzl6PVn6bjg2D0EpC9iLBHAc5x/v4aeXeUaY+uDXjZmCD/YzLL35oHOUUUwv0VeXfN6YR
 ey88qA26RwXyN8abjM9ULT3C2Oh66bYTc6a38rRPEPi7fud56O4E/ZibrQJ90lwf3fsfcOVdT
 3arttXOxp8Lz/yyq2jFSviT6/MVzvIAjg3HDYVD2DYk8u40z2dVoIIjPPpnViGTZVtRIEq5sJ
 8Q2ogODfRjUyC6iwuoOpMvwAriA+xD6XVe//2VVjMtPbJusI4IqwFcWgYto86nJoyn+9KLue3
 tRREXPT4HSOu0cTPUEtKFGOIPtGPFVhHIAPeu/0oGvsMC694TVdqn4X2CeK0zmRGpPkyF2UmM
 B7dd+1RBxxq++v0L00gLdnkPiBimiysyCPPALj4we4wlX3QSbSN8fkvMqA4gk1URpxVEJEw0v
 dZwp2Rnq0apbl0/DItS7/YGWtbRd90Pbiz/PgMcRG0Kg98g2cCEWiBB2N2NRfzevN9fmdlI9H
 5n8V5D+8m3iC+Q=
Subject: [Buildroot] [PATCH v1 03/13] package/gst1-plugins-good: bump
 version to 1.20.0
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
 package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash | 4 ++--
 package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
index e342bd133e..9ad1d7bf46 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.18.6.tar.xz.sha256sum
-sha256  26723ac01fcb360ade1f41d168c7c322d8af4ceb7e55c8c12ed2690d06a76eed  gst-plugins-good-1.18.6.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.20.0.tar.xz.sha256sum
+sha256  2d119c15ab8c9e79f8cd3c6bf582ff7a050b28ccae52ab4865e1a1464991659c  gst-plugins-good-1.20.0.tar.xz
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING
diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
index e0ca29c5fd..6298d578ed 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_GOOD_VERSION = 1.18.6
+GST1_PLUGINS_GOOD_VERSION = 1.20.0
 GST1_PLUGINS_GOOD_SOURCE = gst-plugins-good-$(GST1_PLUGINS_GOOD_VERSION).tar.xz
 GST1_PLUGINS_GOOD_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-good
 GST1_PLUGINS_GOOD_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
