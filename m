Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C277C001DF
	for <buildroot@archiver.kernel.org>; Fri, 28 Jul 2023 19:25:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 44D378412C;
	Fri, 28 Jul 2023 19:25:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44D378412C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yZzu34iJiED9; Fri, 28 Jul 2023 19:25:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E26B84550;
	Fri, 28 Jul 2023 19:25:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E26B84550
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D6E561BF995
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 19:25:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BA95C614CB
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 19:25:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA95C614CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5BB4boZGl1lH for <buildroot@lists.busybox.net>;
 Fri, 28 Jul 2023 19:25:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EF93460AB2
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 19:25:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF93460AB2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DE44783862; Fri, 28 Jul 2023 19:25:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Jul 2023 21:25:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 73ddf7bf509813a1a9008fa61c8706e200340fe9
X-Git-Newrev: 6e53b6659b794e130e1198c1d366192671bf50ec
X-Patchwork-Hint: ignore
Message-Id: <20230728192540.DE44783862@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mpg123: force arm mode instead of
 Thumb mode
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

commit: https://git.buildroot.net/buildroot/commit/?id=6e53b6659b794e130e1198c1d366192671bf50ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure:
Error: selected processor does not support `smull r3,ip,r2,r10' in Thumb mode

Fixes:
http://autobuild.buildroot.net/results/848/8484fc6be618f3edbf39a13928ab9a4b7b442235/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mpg123/mpg123.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/mpg123/mpg123.mk b/package/mpg123/mpg123.mk
index 64c8e0d8e5..5ec5590267 100644
--- a/package/mpg123/mpg123.mk
+++ b/package/mpg123/mpg123.mk
@@ -13,6 +13,13 @@ MPG123_LICENSE_FILES = COPYING
 MPG123_CPE_ID_VENDOR = mpg123
 MPG123_DEPENDENCIES = host-pkgconf
 
+# mpg123 has some assembly function that is not present in Thumb mode:
+# Error: selected processor does not support `smull r3,ip,r2,r10' in Thumb mode
+# so, we desactivate Thumb mode
+ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
+MPG123_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -marm"
+endif
+
 MPG123_CPU = $(if $(BR2_SOFT_FLOAT),generic_nofpu,generic_fpu)
 
 ifeq ($(BR2_aarch64),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
