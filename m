Return-Path: <SRS0=EGOI=OZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D81C8C433EF
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 19:37:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E51761269
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 19:37:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9E51761269
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7835583BEF;
	Tue,  5 Oct 2021 19:37:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TUYy2WQf_vPR; Tue,  5 Oct 2021 19:37:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C027D83E1E;
	Tue,  5 Oct 2021 19:37:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9CFB01BF983
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 19:37:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 993CB83E03
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 19:37:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CllmTnzVTNO1 for <buildroot@lists.busybox.net>;
 Tue,  5 Oct 2021 19:37:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E097683D39
 for <buildroot@buildroot.org>; Tue,  5 Oct 2021 19:37:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id A0E7E91223; Tue,  5 Oct 2021 19:34:50 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 5 Oct 2021 21:31:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f39ae602acb834fffe6cd1d7062f898e55056fb0
X-Git-Newrev: 6e9c10daa147196ea946c73c0beddfd681706cbb
X-Patchwork-Hint: ignore
Message-Id: <20211005193450.A0E7E91223@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/iwd: fix musl build
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

commit: https://git.buildroot.net/buildroot/commit/?id=6e9c10daa147196ea946c73c0beddfd681706cbb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with musl raised since bump to version
1.18 in commit 1a7be12e1e10cc09e3a28a8d04a352bbbb63ba3a:

src/netconfig.c: In function 'netconfig_ipv6_to_string':
src/netconfig.c:188:18: error: 'struct in6_addr' has no member named '__in6_u'; did you mean '__in6_union'?
  188 |  memcpy(in6_addr.__in6_u.__u6_addr8, addr, 16);
      |                  ^~~~~~~
      |                  __in6_union

Fixes:
 - http://autobuild.buildroot.org/results/2c4e6cf22e6fb5582470930241904878070f1144

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...netconfig-Remove-usage-of-in6_addr__in6_u.patch | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/package/iwd/0002-netconfig-Remove-usage-of-in6_addr__in6_u.patch b/package/iwd/0002-netconfig-Remove-usage-of-in6_addr__in6_u.patch
new file mode 100644
index 0000000000..f6b3d24516
--- /dev/null
+++ b/package/iwd/0002-netconfig-Remove-usage-of-in6_addr__in6_u.patch
@@ -0,0 +1,32 @@
+From 42bd5ba7c2665c5bf95ba102a8115c4cf01d31d7 Mon Sep 17 00:00:00 2001
+From: Andrew Zaborowski <andrew.zaborowski@intel.com>
+Date: Thu, 16 Sep 2021 01:58:29 +0200
+Subject: netconfig: Remove usage of in6_addr.__in6_u
+
+in6_addr.__in6_u.__u6_addr8 is glibc-specific and named differently in
+the headers shipped with musl libc for example.  The POSIX compliant and
+universal way of accessing it is in6_addr.s6_addr.
+
+[Retrieved from:
+https://git.kernel.org/pub/scm/network/wireless/iwd.git/commit/?id=42bd5ba7c2665c5bf95ba102a8115c4cf01d31d7]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/netconfig.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/netconfig.c b/src/netconfig.c
+index ce95db0b..421270c9 100644
+--- a/src/netconfig.c
++++ b/src/netconfig.c
+@@ -171,7 +171,7 @@ static inline char *netconfig_ipv6_to_string(const uint8_t *addr)
+ 	struct in6_addr in6_addr;
+ 	char *addr_str = l_malloc(INET6_ADDRSTRLEN);
+ 
+-	memcpy(in6_addr.__in6_u.__u6_addr8, addr, 16);
++	memcpy(in6_addr.s6_addr, addr, 16);
+ 
+ 	if (L_WARN_ON(unlikely(!inet_ntop(AF_INET6, &in6_addr, addr_str,
+ 						INET6_ADDRSTRLEN)))) {
+-- 
+cgit 1.2.3-1.el7
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
