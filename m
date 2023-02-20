Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A73CDC636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 20:38:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D27A81E33;
	Mon, 20 Feb 2023 20:38:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D27A81E33
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WQSxsXFZc4a0; Mon, 20 Feb 2023 20:38:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C2E981D34;
	Mon, 20 Feb 2023 20:38:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C2E981D34
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E952E1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:38:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C37AD40259
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:38:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C37AD40259
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WDrZQu19E55I for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:38:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D20D0401F2
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:38:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D20D0401F2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BD7D18642E; Mon, 20 Feb 2023 20:38:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 20 Feb 2023 21:36:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d77d1c98240bf9c7c9062a67d68b1e548af42e5d
X-Git-Newrev: e8e461bba5942b4711b94a57799600fb4eb226c1
X-Patchwork-Hint: ignore
Message-Id: <20230220203832.BD7D18642E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libarchive: fix host build
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

commit: https://git.buildroot.net/buildroot/commit/?id=e8e461bba5942b4711b94a57799600fb4eb226c1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following host build failure raised since commit
9525bc7e64e8f44c31ab9dfd3f516ecb35982429:

configure.ac:140: error: possibly undefined macro: AC_MSG_FAILURE
      If this token and others are legitimate, please use m4_pattern_allow.
      See the Autoconf documentation.
configure.ac:328: error: possibly undefined macro: AC_CHECK_LIB

Fixes:
 - http://autobuild.buildroot.org/results/11868e9bc4916843a7fc76f7b5e4c251f89e33dc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libarchive/libarchive.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index cd7c13fbed..2010b6529f 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -140,6 +140,8 @@ endif
 
 # The only user of host-libarchive needs zlib support
 HOST_LIBARCHIVE_DEPENDENCIES = host-zlib
+# needed for autoreconf
+HOST_LIBARCHIVE_DEPENDENCIES += host-pkgconf
 HOST_LIBARCHIVE_CONF_OPTS = \
 	--disable-bsdtar \
 	--disable-bsdcpio \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
