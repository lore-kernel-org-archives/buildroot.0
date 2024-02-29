Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98A77C54798
	for <buildroot@archiver.kernel.org>; Thu, 29 Feb 2024 22:02:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6AF6882253;
	Thu, 29 Feb 2024 22:02:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N9A5nA9771TP; Thu, 29 Feb 2024 22:02:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 735448225B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 735448225B;
	Thu, 29 Feb 2024 22:02:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 900FA1BF25B
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 22:02:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7A2EF8231B
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 22:02:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xgq2g67mdn-3 for <buildroot@lists.busybox.net>;
 Thu, 29 Feb 2024 22:02:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A53F682253
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A53F682253
 for <buildroot@buildroot.org>; Thu, 29 Feb 2024 22:02:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9DC7987E23; Thu, 29 Feb 2024 22:02:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 29 Feb 2024 22:59:32 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 771af4d22973e4dc6d33c6ee75718ab10e94f0d5
X-Git-Newrev: 631ed7b7be884e218bc175e00bf096e4fb411c4d
X-Patchwork-Hint: ignore
Message-Id: <20240229220220.9DC7987E23@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/expat: security
 bump to version 2.6.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=631ed7b7be884e218bc175e00bf096e4fb411c4d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Security fixes:
 - CVE-2023-52425: Fix quadratic runtime issues with big tokens that can
   cause denial of service, in partial where dealing with compressed XML
   input. Applications that parsed a document in one go -- a single call
   to functions XML_Parse or XML_ParseBuffer -- were not affected. The
   smaller the chunks/buffers you use for parsing previously, the bigger
   the problem prior to the fix.
 - CVE-2023-52426: Fix billion laughs attacks for users compiling
   *without* XML_DTD defined (which is not common). Users with XML_DTD
   defined have been protected since Expat >=2.4.0 (and that was
   CVE-2013-0340 back then).

https://blog.hartwork.org/posts/expat-2-6-0-released/

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 9dad5e7d7f7bc03e648621b9be6974e7ae39a467)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/expat/expat.hash | 8 ++++----
 package/expat/expat.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/expat/expat.hash b/package/expat/expat.hash
index c6c25aa3e0..043501378b 100644
--- a/package/expat/expat.hash
+++ b/package/expat/expat.hash
@@ -1,7 +1,7 @@
-# From https://sourceforge.net/projects/expat/files/expat/2.5.0/
-md5  ac6677b6d1b95d209ab697ce8b688704  expat-2.5.0.tar.xz
-sha1  5178e13c1e34f4643d5118d5758babfe0e836fe2  expat-2.5.0.tar.xz
+# From https://sourceforge.net/projects/expat/files/expat/2.6.0/
+md5  bd169cb11f4b9bdfddadf9e88a5c4d4b  expat-2.6.0.tar.xz
+sha1  d87e8ab2a3c1deb858c6b22e5ade9d5673086004  expat-2.6.0.tar.xz
 
 # Locally calculated
-sha256  ef2420f0232c087801abf705e89ae65f6257df6b7931d37846a193ef2e8cdcbe  expat-2.5.0.tar.xz
+sha256  cb5f5a8ea211e1cabd59be0a933a52e3c02cc326e86a4d387d8d218e7ee47a3e  expat-2.6.0.tar.xz
 sha256  122f2c27000472a201d337b9b31f7eb2b52d091b02857061a8880371612d9534  COPYING
diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index 6f22024cc0..5f4016e0d1 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXPAT_VERSION = 2.5.0
+EXPAT_VERSION = 2.6.0
 EXPAT_SITE = http://downloads.sourceforge.net/project/expat/expat/$(EXPAT_VERSION)
 EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.xz
 EXPAT_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
