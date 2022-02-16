Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFAC9C433F5
	for <buildroot@archiver.kernel.org>; Wed, 16 Feb 2022 21:12:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A44B81CDB;
	Wed, 16 Feb 2022 21:12:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gNzlf_QKIobv; Wed, 16 Feb 2022 21:12:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A89F6812A5;
	Wed, 16 Feb 2022 21:12:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2C2A31BF5A9
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 21:12:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 15BF5403C4
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 21:12:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yklmeIF2ALjn for <buildroot@lists.busybox.net>;
 Wed, 16 Feb 2022 21:12:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 33A2740157
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 21:12:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 6CE8C836ED; Wed, 16 Feb 2022 21:04:42 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 16 Feb 2022 22:11:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c7d3f5cd9f39caead1ae4aedda42a48343571b57
X-Git-Newrev: 6f0e2e567f7245705445a922b1529ea4f7b6b4a5
X-Patchwork-Hint: ignore
Message-Id: <20220216210442.6CE8C836ED@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dnsmasq: fix build with ubus and
 without dnssec
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

commit: https://git.buildroot.net/buildroot/commit/?id=6f0e2e567f7245705445a922b1529ea4f7b6b4a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since bump to version 2.86 in
commit 5b29096f8fcb0acd8890073a56ba9d620b1f911c:

rfc1035.c: In function 'report_addresses':
rfc1035.c:978:49: error: 'struct dnsmasq_daemon' has no member named 'workspacename'
  978 |        if (!extract_name(header, len, &p, daemon->workspacename, 1, 0))
      |                                                 ^~

Fixes:
 - http://autobuild.buildroot.org/results/51242d4f532373544e3c7ea45036b8d41390b29b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...S-but-not-DNSSEC-compile-options-selected.patch | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/package/dnsmasq/0003-Fix-FTBFS-when-CONNTRACK-and-UBUS-but-not-DNSSEC-compile-options-selected.patch b/package/dnsmasq/0003-Fix-FTBFS-when-CONNTRACK-and-UBUS-but-not-DNSSEC-compile-options-selected.patch
new file mode 100644
index 0000000000..9c98af2be5
--- /dev/null
+++ b/package/dnsmasq/0003-Fix-FTBFS-when-CONNTRACK-and-UBUS-but-not-DNSSEC-compile-options-selected.patch
@@ -0,0 +1,34 @@
+From 2c60441239e1c10c4987cb586653b1ea08f703c0 Mon Sep 17 00:00:00 2001
+From: Simon Kelley <simon@thekelleys.org.uk>
+Date: Tue, 28 Sep 2021 23:42:15 +0100
+Subject: [PATCH] Fix FTBFS when CONNTRACK and UBUS but not DNSSEC compile
+ options selected.
+
+[Retrieved from:
+https://thekelleys.org.uk/gitweb/?p=dnsmasq.git;a=commit;h=2c60441239e1c10c4987cb586653b1ea08f703c0]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/dnsmasq.h | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/src/dnsmasq.h b/src/dnsmasq.h
+index c8a918a..3fdc1b0 100644
+--- a/src/dnsmasq.h
++++ b/src/dnsmasq.h
+@@ -1173,9 +1173,12 @@ extern struct daemon {
+   char *packet; /* packet buffer */
+   int packet_buff_sz; /* size of above */
+   char *namebuff; /* MAXDNAME size buffer */
++#if (defined(HAVE_CONNTRACK) && defined(HAVE_UBUS)) || defined(HAVE_DNSSEC)
++  /* CONNTRACK UBUS code uses this buffer, as well as DNSSEC code. */
++  char *workspacename;
++#endif
+ #ifdef HAVE_DNSSEC
+   char *keyname; /* MAXDNAME size buffer */
+-  char *workspacename; /* ditto */
+   unsigned long *rr_status; /* ceiling in TTL from DNSSEC or zero for insecure */
+   int rr_status_sz;
+   int dnssec_no_time_check;
+-- 
+2.20.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
