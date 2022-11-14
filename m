Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D31EC433FE
	for <buildroot@archiver.kernel.org>; Mon, 14 Nov 2022 10:27:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E976C40319;
	Mon, 14 Nov 2022 10:27:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E976C40319
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3lMaK2vk6m2J; Mon, 14 Nov 2022 10:27:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3518402C1;
	Mon, 14 Nov 2022 10:27:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3518402C1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 93E941BF8A8
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 10:27:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 703854049C
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 10:27:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 703854049C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bSmBAfrzj13C for <buildroot@lists.busybox.net>;
 Mon, 14 Nov 2022 10:27:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA5F440155
 for <buildroot@buildroot.org>; Mon, 14 Nov 2022 10:27:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA5F440155
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9A87F83915; Mon, 14 Nov 2022 10:27:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 14 Nov 2022 11:25:29 +0100
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 647e433e5ed06240cd13eb3b67dd1f4dd94121f5
X-Git-Newrev: 72c53e5fbd802c4999cd9d066902ba9c40af89ca
X-Patchwork-Hint: ignore
Message-Id: <20221114102721.9A87F83915@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/rsync: force
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

commit: https://git.buildroot.net/buildroot/commit/?id=72c53e5fbd802c4999cd9d066902ba9c40af89ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

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
