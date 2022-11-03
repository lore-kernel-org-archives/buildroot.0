Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F078BC4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 22:12:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A55BE40BE9;
	Thu,  3 Nov 2022 22:12:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A55BE40BE9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EZQhD_SsWAr6; Thu,  3 Nov 2022 22:12:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C844440BEC;
	Thu,  3 Nov 2022 22:12:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C844440BEC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BB6601BF331
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 22:12:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 96F4B81F78
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 22:12:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96F4B81F78
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C8nBCp7MuHql for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 22:12:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CB06181F72
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 22:12:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB06181F72
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BB13987D2A; Thu,  3 Nov 2022 22:12:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 23:12:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: aaba432e2cae6ccff2bc6fa30c3ec0cc3c0f3c71
X-Git-Newrev: 0b17cd017e8b946d718c81f0e38fd570e6a6bc0d
X-Patchwork-Hint: ignore
Message-Id: <20221103221246.BB13987D2A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rsync: force HAVE_C99_VSNPRINTF to
 "yes"
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

commit: https://git.buildroot.net/buildroot/commit/?id=0b17cd017e8b946d718c81f0e38fd570e6a6bc0d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We know the system will have a modern-enough C library that implements
the required snprintf() functionality. Since the configure stage can't
detect the system's capabilities (because it is cross-compiling), let's
hard-code the decision.

As a result, rsync won't be linking in its own copy of snprintf().

Signed-off-by: Markus Mayer <mmayer@broadcom.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rsync/rsync.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/rsync/rsync.mk b/package/rsync/rsync.mk
index 81ad4b9291..7ff7ca6eef 100644
--- a/package/rsync/rsync.mk
+++ b/package/rsync/rsync.mk
@@ -11,6 +11,9 @@ RSYNC_LICENSE_FILES = COPYING
 RSYNC_CPE_ID_VENDOR = samba
 RSYNC_SELINUX_MODULES = rsync
 RSYNC_DEPENDENCIES = zlib popt
+# We know that our C library is modern enough for C99 vsnprintf(). Since
+# configure can't detect this, we tell configure that vsnprintf() is safe.
+RSYNC_CONF_ENV = rsync_cv_HAVE_C99_VSNPRINTF=yes
 RSYNC_CONF_OPTS = \
 	--with-included-zlib=no \
 	--with-included-popt=no \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
