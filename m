Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C5A9EEAA77
	for <buildroot@archiver.kernel.org>; Thu, 14 Sep 2023 21:33:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E5D3541915;
	Thu, 14 Sep 2023 21:33:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E5D3541915
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QYNDJ4lCIeME; Thu, 14 Sep 2023 21:33:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3082440A97;
	Thu, 14 Sep 2023 21:33:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3082440A97
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AD3E31BF855
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 21:33:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 92B764086D
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 21:33:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92B764086D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jIq4E1KOagej for <buildroot@lists.busybox.net>;
 Thu, 14 Sep 2023 21:33:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 760B54086A
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 21:33:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 760B54086A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6334987025; Thu, 14 Sep 2023 21:33:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 14 Sep 2023 23:30:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 23e774d2de35c42ee13f618dd2a895f9a97a4d1c
X-Git-Newrev: 3557a7b599b5b443730f8d0634a39c1694646ce3
X-Patchwork-Hint: ignore
Message-Id: <20230914213332.6334987025@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lldpd: fix CVE-2023-41910
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

commit: https://git.buildroot.net/buildroot/commit/?id=3557a7b599b5b443730f8d0634a39c1694646ce3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

An issue was discovered in lldpd before 1.0.17. By crafting a CDP PDU
packet with specific CDP_TLV_ADDRESSES TLVs, a malicious actor can
remotely force the lldpd daemon to perform an out-of-bounds read on heap
memory. This occurs in cdp_decode in daemon/protocols/cdp.c.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-read-overflow-when-parsing-CDP-addresses.patch | 24 ++++++++++++++++++++++
 package/lldpd/lldpd.mk                             |  3 +++
 2 files changed, 27 insertions(+)

diff --git a/package/lldpd/0001-daemon-fix-read-overflow-when-parsing-CDP-addresses.patch b/package/lldpd/0001-daemon-fix-read-overflow-when-parsing-CDP-addresses.patch
new file mode 100644
index 0000000000..05d882a07a
--- /dev/null
+++ b/package/lldpd/0001-daemon-fix-read-overflow-when-parsing-CDP-addresses.patch
@@ -0,0 +1,24 @@
+From a9aeabdf879c25c584852a0bb5523837632f099b Mon Sep 17 00:00:00 2001
+From: Vincent Bernat <vincent@bernat.ch>
+Date: Wed, 12 Apr 2023 07:38:31 +0200
+Subject: [PATCH] daemon: fix read overflow when parsing CDP addresses
+
+Upstream: https://github.com/lldpd/lldpd/commit/a9aeabdf879c25c584852a0bb5523837632f099b
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ NEWS                       | 4 ++++
+ src/daemon/protocols/cdp.c | 1 +
+ 2 files changed, 5 insertions(+)
+
+diff --git a/src/daemon/protocols/cdp.c b/src/daemon/protocols/cdp.c
+index 8a1be863..42861c0e 100644
+--- a/src/daemon/protocols/cdp.c
++++ b/src/daemon/protocols/cdp.c
+@@ -466,6 +466,7 @@ cdp_decode(struct lldpd *cfg, char *frame, int s, struct lldpd_hardware *hardwar
+ 					goto malformed;
+ 				}
+ 				PEEK_DISCARD(address_len);
++				addresses_len -= address_len;
+ 				(void)PEEK_SAVE(pos_next_address);
+ 				/* Next, we go back and try to extract
+ 				   IPv4 address */
diff --git a/package/lldpd/lldpd.mk b/package/lldpd/lldpd.mk
index dd6f8dcf5d..d4abfade81 100644
--- a/package/lldpd/lldpd.mk
+++ b/package/lldpd/lldpd.mk
@@ -16,6 +16,9 @@ LLDPD_LICENSE = ISC
 LLDPD_LICENSE_FILES = LICENSE
 LLDPD_CPE_ID_VENDOR = lldpd_project
 
+# 0001-daemon-fix-read-overflow-when-parsing-CDP-addresses.patch
+LLDPD_IGNORE_CVES += CVE-2023-41910
+
 # Detection of c99 support in configure fails without WCHAR. To enable
 # automatic detection of c99 support by configure, we need to enable
 # WCHAR in toolchain. But actually we do not need WCHAR at lldpd
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
