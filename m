Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D24DC433F5
	for <buildroot@archiver.kernel.org>; Wed, 16 Mar 2022 21:37:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E818741775;
	Wed, 16 Mar 2022 21:37:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c_DcPPuUTn-X; Wed, 16 Mar 2022 21:37:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 05B8A41753;
	Wed, 16 Mar 2022 21:36:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2135F1BF2C2
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 21:36:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 078FA40204
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 21:36:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iLyCRVDWzbWA for <buildroot@lists.busybox.net>;
 Wed, 16 Mar 2022 21:36:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B6E8D40018
 for <buildroot@buildroot.org>; Wed, 16 Mar 2022 21:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1647466576;
 bh=2JmS/OtOaaIQqgaHCO1WiJ/lWVXHNXp1rs7u/TF45Bs=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=ApgLkvaxbSs1I3ipFTd4A7td8edr2g8m4iCdKadb+lyAgmZIcatDaJ768Za1c02jw
 1kWD4VSjuMvZxp5eZaqqqEjKImmWifDFnWD8gLZhGn4LfijPpI1xb3/02Ytc5GWTfZ
 eSr49CnQU2RySmnLSn9VDFIVfzcO7tJFFF++vuSo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.226]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MO9zH-1nkBIE3LCr-00OapH for <buildroot@buildroot.org>; Wed, 16 Mar 2022
 22:36:15 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Wed, 16 Mar 2022 22:36:06 +0100
Message-Id: <20220316213614.16878-5-ps.report@gmx.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220316213614.16878-1-ps.report@gmx.net>
References: <20220316213614.16878-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:jv6J5uGPyrFPPCAf1/cbgbtoVaBCKcrtwRrva1C5L3KAqXEZAQ2
 IVer20WUeaLY0Rb6j4pFN73CtgdP3Jx6OMfdeHlUIMPSdEr5Ao8/GlOLFvbo4Bvlk1UPu21
 tDIfKwUX3oYNrFQDdIGUA1PMTHlifHqioydWW9FDswpZEdxf55+GclNtDjDxWGpSTkXB2xm
 sgSnIjcpyVyrSLGRG+nEg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:wD829f5iWC8=:iSlX9rijFnbRqa/DaJ/k1V
 RQ4FpPrhHUwXVcc7WASXhntpG9oAJLZ22pAgf1sZJo4BF+pCTogjkDwzpgnQEm1ql9u67bCaz
 /ETbW/tnvET7nxzNcQRV7g9GmcnartCHAp0LseX61qyrwb3ef8c/rZHho0oaygiFMWDVOlNK9
 ZcBF4kWFq+iHQ/sNUJtQvRTKYTt6/dY5j7C+5zlL44aD7uo4e8WtmRHMEmfEkT0nxF31NH3t5
 lfWBupL03ZTYCUwF9RjbttWmUtwVRAV1d7Drbbytbw1lpUvzny6s4L8NTAvWJGCC2D2kDXmdF
 UiTCwJD65XRUMdS8t3ajeLNhLQB7vv2Rpnf83D6J/icMB23MPj5vBvdmDNzTox/uyLYHb/Yi0
 0jMjHCZPlqhrECS1DRLh0hCPu5BsxJTSCxTZe3D0RLOj4wc40agn0R1pl25d9jphxVB6Dl/br
 Ri/khutquWxk/mE7LNYHw+1sQwbyOoT4CdUcLISV7lHonaekaiYLZpttN7NmR+hqmQrBEISAC
 qdfnG3OenQDWUxspd3XKN8orztugUL2kS3D1aOtukEEe6xiGi4uG3dHk/YmoBjfpPfDuNWrmQ
 BwZYP3SRBONh4xKB2V1pzoMZM+IN9gFihPEdWhAPGxy4dRbRR6JvkyAQNER3dSmcBHvsKcHLG
 b1LpRxEgsr8P3Vgb8c+aptsuqnydne/GeZQ9JpzChIcZjvlcUiX7qEUBd2LdkaV4TyVZlvfaV
 xnvszkCUNFi/Af3NxB+bniZhAr1khmRA1/tvIz8xmZ1YW9kmBVdkpF8XieURcpsJmzpKgLeC4
 nJT3gOTApoNlb0Q9CxnCTgrKYXNddpv556IJixUG/xYLmulG/SBVOo0MRCeSRvPLmTnfh47FU
 NyeUjZj0qqvFEuzJqfKDRSUuieafpZHcgwwcN7C49jn05YEBL8RnPOURTUhfKQIenfhHibw2m
 j5Ug2/AEkBjnG9VSozUgz3AAWGI5nvzsbRfcphm9v8asMxFeiMoBuZqsR0INp8njtAjY5jCdh
 EbJJt/7zMyX7B1WcV+uAR4LuYAfCgmALUGY2GsHGHiSpSSdM8WTyeSxC/UJBV56w+uSXFN2Uf
 RXo86Se4guV1EY=
Subject: [Buildroot] [PATCH v1 04/12] package/gst1-plugins-bad: bump version
 to 1.20.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash | 4 ++--
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
index 72c9624b94..2874d955f4 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.20.0.tar.xz.sha256sum
-sha256  015b8d4d9a395ebf444d40876867a2034dd3304b3ad48bc3a0dd0c1ee71dc11d  gst-plugins-bad-1.20.0.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.20.1.tar.xz.sha256sum
+sha256  09d3c2cf5911f0bc7da6bf557a55251779243d3de216b6a26cc90c445b423848  gst-plugins-bad-1.20.1.tar.xz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index 24fd9dd312..343a53a3c5 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_BAD_VERSION = 1.20.0
+GST1_PLUGINS_BAD_VERSION = 1.20.1
 GST1_PLUGINS_BAD_SOURCE = gst-plugins-bad-$(GST1_PLUGINS_BAD_VERSION).tar.xz
 GST1_PLUGINS_BAD_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-bad
 GST1_PLUGINS_BAD_INSTALL_STAGING = YES
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
