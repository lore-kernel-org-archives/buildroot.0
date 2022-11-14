Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26D3AC4332F
	for <buildroot@archiver.kernel.org>; Mon, 14 Nov 2022 10:26:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BFAA860B2B;
	Mon, 14 Nov 2022 10:26:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BFAA860B2B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2m6Cb1PEahKc; Mon, 14 Nov 2022 10:26:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C63C360C33;
	Mon, 14 Nov 2022 10:26:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C63C360C33
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EDCB41BF8C7
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 10:26:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C1DDE814BA
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 10:26:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1DDE814BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4JCdXFd3JcxU for <buildroot@lists.busybox.net>;
 Mon, 14 Nov 2022 10:26:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 76BAB813BB
 for <buildroot@buildroot.org>; Mon, 14 Nov 2022 10:26:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 76BAB813BB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 65238838FF; Mon, 14 Nov 2022 10:26:12 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 14 Nov 2022 11:25:41 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: f6b4677c7bf47345b8a3406c8b673070e9fbe8f0
X-Git-Newrev: a56fed04a1416ef4f92c9c6d16da1c063ce32dfe
X-Patchwork-Hint: ignore
Message-Id: <20221114102612.65238838FF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/rsync: force
 HAVE_C99_VSNPRINTF to "yes"
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

commit: https://git.buildroot.net/buildroot/commit/?id=a56fed04a1416ef4f92c9c6d16da1c063ce32dfe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

We know the system will have a modern-enough C library that implements
the required snprintf() functionality. Since the configure stage can't
detect the system's capabilities (because it is cross-compiling), let's
hard-code the decision.

As a result, rsync won't be linking in its own copy of snprintf().

Signed-off-by: Markus Mayer <mmayer@broadcom.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 0b17cd017e8b946d718c81f0e38fd570e6a6bc0d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rsync/rsync.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/rsync/rsync.mk b/package/rsync/rsync.mk
index e288033b98..0d311aa167 100644
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
