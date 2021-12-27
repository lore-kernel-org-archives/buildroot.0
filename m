Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8CCDC433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 20:20:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5DDF04020B;
	Mon, 27 Dec 2021 20:20:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zibBQv8Rivyy; Mon, 27 Dec 2021 20:20:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 686CB403C8;
	Mon, 27 Dec 2021 20:20:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 674DA1BF3C6
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 20:20:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 754EE4018A
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 20:20:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 02j_hXLy-ZZh for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 20:20:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9FA9B40191
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 20:20:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id D403F82BA8; Mon, 27 Dec 2021 20:14:55 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 27 Dec 2021 21:20:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f647a71c4a7371d83b740f03e498ef31a28a1957
X-Git-Newrev: c09d759a6497f3c979d1dba3df531833e25e4c47
X-Patchwork-Hint: ignore
Message-Id: <20211227201455.D403F82BA8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/coreutils: enable selinux support
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

commit: https://git.buildroot.net/buildroot/commit/?id=c09d759a6497f3c979d1dba3df531833e25e4c47
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable SELinux support if libselinux is selected. This allows utilities such as
ls to read and display extended attributes with ls -lZ

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/coreutils/coreutils.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index a31354ac5a..438b7910eb 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -93,6 +93,13 @@ else
 COREUTILS_CONF_OPTS += --disable-libcap
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
+COREUTILS_DEPENDENCIES += libselinux
+COREUTILS_CONF_OPTS += --with-selinux
+else
+COREUTILS_CONF_OPTS += --without-selinux
+endif
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 COREUTILS_CONF_OPTS += --with-openssl=yes
 COREUTILS_DEPENDENCIES += openssl
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
