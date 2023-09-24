Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E417CE7A8A
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 19:05:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00D16410BA;
	Sun, 24 Sep 2023 19:05:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 00D16410BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gfFTDAMpfCfS; Sun, 24 Sep 2023 19:05:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD6DC41803;
	Sun, 24 Sep 2023 19:05:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD6DC41803
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 219FB1BF2A9
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 19:05:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EFE4F6058B
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 19:05:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EFE4F6058B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K57lyo4kRdJl for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 19:05:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1745F60585
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 19:05:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1745F60585
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 00956875A8; Sun, 24 Sep 2023 19:05:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 24 Sep 2023 20:01:13 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 059443bef5f5e3562fe4ab6d4a49df8df877afd8
X-Git-Newrev: 03a71a539626ec0bb6771cf0a6b0ec8f42343f7c
X-Patchwork-Hint: ignore
Message-Id: <20230924190551.00956875A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/lldpd: fix
 CVE-2023-41910
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=03a71a539626ec0bb6771cf0a6b0ec8f42343f7c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

An issue was discovered in lldpd before 1.0.17. By crafting a CDP PDU
packet with specific CDP_TLV_ADDRESSES TLVs, a malicious actor can
remotely force the lldpd daemon to perform an out-of-bounds read on heap
memory. This occurs in cdp_decode in daemon/protocols/cdp.c.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 3557a7b599b5b443730f8d0634a39c1694646ce3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
