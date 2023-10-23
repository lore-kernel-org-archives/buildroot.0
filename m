Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9D2AC004C0
	for <buildroot@archiver.kernel.org>; Mon, 23 Oct 2023 16:26:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7F9CA4053F;
	Mon, 23 Oct 2023 16:26:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F9CA4053F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1zTY17Uqlg20; Mon, 23 Oct 2023 16:26:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 65A40417B6;
	Mon, 23 Oct 2023 16:26:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 65A40417B6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D96AE1BF36C
 for <buildroot@lists.busybox.net>; Mon, 23 Oct 2023 16:26:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BEAE882351
 for <buildroot@lists.busybox.net>; Mon, 23 Oct 2023 16:26:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BEAE882351
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ouZgZEIdic5R for <buildroot@lists.busybox.net>;
 Mon, 23 Oct 2023 16:26:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id F173182350
 for <buildroot@buildroot.org>; Mon, 23 Oct 2023 16:26:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F173182350
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C7EFF85E21; Mon, 23 Oct 2023 16:26:41 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 23 Oct 2023 18:21:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bc8d214e988b95b125ad2b9409286cbf820370b0
X-Git-Newrev: 7f1088f9cae9f191740423a0084bb31f94af2e75
X-Patchwork-Hint: ignore
Message-Id: <20231023162641.C7EFF85E21@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tar: allowing building even on
 non-Y2038 compliant systems
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

commit: https://git.buildroot.net/buildroot/commit/?id=7f1088f9cae9f191740423a0084bb31f94af2e75
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the bump of tar to version 1.35 in Buildroot commit
d4d483451f0a305781b94b96c15a6cf4b489cd84 ("package/tar: security bump
to version 1.35"), the build will fail on systems that are not Y2038,
such as uClibc configurations.

In order to preserve the previous behavior, pass --disable-year2038.
See the gnulib documentation for details [0]. Contrary to what the
option name might suggest, it doesn't really disable Y2038 support,
but only the check that the system is Y2038 compliant. So even with
--disable-year2038, if the system is Y2038 compliant (uses a 64-bit
arch, uses the musl C library, or uses the glibc C library with
BR2_TIME_BITS_64=y), tar will be Y2038 compliant.

[0] https://www.gnu.org/software/gnulib/manual/html_node/Avoiding-the-year-2038-problem.html

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/tar/tar.mk | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/package/tar/tar.mk b/package/tar/tar.mk
index eea112ebc7..8a612b6f45 100644
--- a/package/tar/tar.mk
+++ b/package/tar/tar.mk
@@ -7,9 +7,15 @@
 TAR_VERSION = 1.35
 TAR_SOURCE = tar-$(TAR_VERSION).tar.xz
 TAR_SITE = $(BR2_GNU_MIRROR)/tar
-# busybox installs in /bin, so we need tar to install as well in /bin
-# so that we don't end up with two different tar
-TAR_CONF_OPTS = --exec-prefix=/
+# --exec-prefix=/: busybox installs in /bin, so we need tar to install
+# as well in /bin so that we don't end up with two different tar
+#
+# --disable-year2038: tells the configure script to not abort if the
+# system is not Y2038 compliant. tar will support year2038 if the
+# system is compliant even with this option passed
+TAR_CONF_OPTS = \
+	--exec-prefix=/ \
+	--disable-year2038
 TAR_LICENSE = GPL-3.0+
 TAR_LICENSE_FILES = COPYING
 TAR_CPE_ID_VENDOR = gnu
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
