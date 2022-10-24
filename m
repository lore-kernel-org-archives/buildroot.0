Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2333C67871
	for <buildroot@archiver.kernel.org>; Mon, 24 Oct 2022 21:11:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51ACA60BE4;
	Mon, 24 Oct 2022 21:11:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51ACA60BE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qrwhv65HjeO4; Mon, 24 Oct 2022 21:11:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81DA060B10;
	Mon, 24 Oct 2022 21:11:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 81DA060B10
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 238B71BF30C
 for <buildroot@lists.busybox.net>; Mon, 24 Oct 2022 21:11:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F1E7D40345
 for <buildroot@lists.busybox.net>; Mon, 24 Oct 2022 21:11:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F1E7D40345
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6T0LAg6pFBHs for <buildroot@lists.busybox.net>;
 Mon, 24 Oct 2022 21:11:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C6B1F40343
 for <buildroot@buildroot.org>; Mon, 24 Oct 2022 21:11:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6B1F40343
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AF28886FEB; Mon, 24 Oct 2022 21:11:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 24 Oct 2022 23:11:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fe56cf24b649b5e87d7a9e5a1c3c23d7740fa3f6
X-Git-Newrev: 9833f110bb7e2b85a362f8c49246ea7349a36bcb
X-Patchwork-Hint: ignore
Message-Id: <20221024211145.AF28886FEB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl8723bu: fix build failure on
 PowerPC
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9833f110bb7e2b85a362f8c49246ea7349a36bcb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add local patch(pending upstream[0]) to fix build failure with PowerPC due
to a package re-defition of get_ra() that is only defined in Linux PowerPC
implementation.

[0]: https://github.com/lwfinger/rtl8723bu/pull/192

Fixes:
http://autobuild.buildroot.net/results/99571b055e6185d57f89b90821b76099ebc766ed/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...Fix-build-failure-on-PowerPc-architecture.patch | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/package/rtl8723bu/0001-Fix-build-failure-on-PowerPc-architecture.patch b/package/rtl8723bu/0001-Fix-build-failure-on-PowerPc-architecture.patch
new file mode 100644
index 0000000000..06cf2d64c1
--- /dev/null
+++ b/package/rtl8723bu/0001-Fix-build-failure-on-PowerPc-architecture.patch
@@ -0,0 +1,47 @@
+From dde7bddfddddb7212f2d9671391e2096d770c449 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Sun, 23 Oct 2022 22:57:41 +0200
+Subject: [PATCH] Fix build failure on PowerPc architecture
+
+In PowerPc Linux only get_ra() exists[0] and conflicts with local get_ra()
+that has a completely different purpose. So let's rename local get_ra()
+to wifi_get_ra() to make it different from Linux's get_ra().
+
+[0]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/powerpc/include/asm/disassemble.h#n49
+
+Upstream: https://github.com/lwfinger/rtl8723bu/pull/192
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ hal/rtl8723bu_recv.c | 2 +-
+ include/wifi.h       | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/hal/rtl8723bu_recv.c b/hal/rtl8723bu_recv.c
+index a2fc82b..39e5044 100644
+--- a/hal/rtl8723bu_recv.c
++++ b/hal/rtl8723bu_recv.c
+@@ -288,7 +288,7 @@ void update_recvframe_phyinfo(
+ 		!pattrib->icv_err && !pattrib->crc_err &&
+ 		_rtw_memcmp(get_hdr_bssid(wlanhdr), get_bssid(&padapter->mlmepriv), ETH_ALEN));
+ 
+-	pkt_info.bPacketToSelf = pkt_info.bPacketMatchBSSID && (_rtw_memcmp(get_ra(wlanhdr), myid(&padapter->eeprompriv), ETH_ALEN));
++	pkt_info.bPacketToSelf = pkt_info.bPacketMatchBSSID && (_rtw_memcmp(wifi_get_ra(wlanhdr), myid(&padapter->eeprompriv), ETH_ALEN));
+ 
+ 	pkt_info.bPacketBeacon = pkt_info.bPacketMatchBSSID && (GetFrameSubType(wlanhdr) == WIFI_BEACON);
+ 	sa = get_ta(wlanhdr);
+diff --git a/include/wifi.h b/include/wifi.h
+index 5dc32eb..23578cc 100644
+--- a/include/wifi.h
++++ b/include/wifi.h
+@@ -373,7 +373,7 @@ __inline static int IS_MCAST(unsigned char *da)
+ 		return _FALSE;
+ }
+ 
+-__inline static unsigned char * get_ra(unsigned char *pframe)
++__inline static unsigned char * wifi_get_ra(unsigned char *pframe)
+ {
+ 	unsigned char	*ra;
+ 	ra = GetAddr1Ptr(pframe);
+-- 
+2.34.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
