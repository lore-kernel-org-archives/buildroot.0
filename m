Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BBADCE7A8A
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 21:50:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2EA7418FE;
	Sun, 24 Sep 2023 21:50:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2EA7418FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UViyyztYgNSS; Sun, 24 Sep 2023 21:50:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD949418BA;
	Sun, 24 Sep 2023 21:50:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD949418BA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 22D661BF2CC
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 21:47:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 664F5418B9
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 21:47:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 664F5418B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ktOHtLIXETND for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 21:47:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 72D43418BA
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 21:47:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72D43418BA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6408187691; Sun, 24 Sep 2023 21:47:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 24 Sep 2023 23:35:25 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 6621f371daeb507a3897b3b17c4662d91e0c2ac1
X-Git-Newrev: 5e17ca5cfdb70162ef96756e68e919717099a050
X-Patchwork-Hint: ignore
Message-Id: <20230924214720.6408187691@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/strongswan:
 security bump to version 5.9.11
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

commit: https://git.buildroot.net/buildroot/commit/?id=5e17ca5cfdb70162ef96756e68e919717099a050
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Fix CVE-2023-26463: strongSwan 5.9.8 and 5.9.9 potentially allows remote
code execution because it uses a variable named "public" for two
different purposes within the same function. There is initially
incorrect access control, later followed by an expired pointer
dereference. One attack vector is sending an untrusted client
certificate during EAP-TLS. A server is affected only if it loads
plugins that implement TLS-based EAP methods (EAP-TLS, EAP-TTLS,
EAP-PEAP, or EAP-TNC). This is fixed in 5.9.10.

https://github.com/strongswan/strongswan/blob/5.9.11/NEWS
https://www.strongswan.org/blog/2023/03/02/strongswan-vulnerability-(cve-2023-26463).html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 78959665b94b412d7a82ee43e3ede14278a5d924)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/strongswan/strongswan.hash | 6 +++---
 package/strongswan/strongswan.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/strongswan/strongswan.hash b/package/strongswan/strongswan.hash
index 4822f9152f..de8f18747a 100644
--- a/package/strongswan/strongswan.hash
+++ b/package/strongswan/strongswan.hash
@@ -1,7 +1,7 @@
-# From http://download.strongswan.org/strongswan-5.9.8.tar.bz2.md5
-md5  f46b0d3e7aed88824650d0721c887443  strongswan-5.9.8.tar.bz2
+# From http://download.strongswan.org/strongswan-5.9.11.tar.bz2.md5
+md5  673e194cd256af77b46928179f2c81ad  strongswan-5.9.11.tar.bz2
 # Calculated based on the hash above
-sha256  d3303a43c0bd7b75a12b64855e8edcb53696f06190364f26d1533bde1f2e453c  strongswan-5.9.8.tar.bz2
+sha256  ddf53f1f26ad26979d5f55e8da95bd389552f5de3682e35593f9a70b2584ed2d  strongswan-5.9.11.tar.bz2
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  2292e21797754548dccdef9eef6aee7584e552fbd890fa914e1de8d3577d23f0  LICENSE
diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
index cae1433e39..6058631696 100644
--- a/package/strongswan/strongswan.mk
+++ b/package/strongswan/strongswan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRONGSWAN_VERSION = 5.9.8
+STRONGSWAN_VERSION = 5.9.11
 STRONGSWAN_SOURCE = strongswan-$(STRONGSWAN_VERSION).tar.bz2
 STRONGSWAN_SITE = http://download.strongswan.org
 STRONGSWAN_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
