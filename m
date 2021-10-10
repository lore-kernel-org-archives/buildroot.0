Return-Path: <SRS0=K+5a=O6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9A48C433F5
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 10:05:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E55660F92
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 10:05:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8E55660F92
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B6D9829B6;
	Sun, 10 Oct 2021 10:05:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HhreCtZoTH-4; Sun, 10 Oct 2021 10:05:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD3A18299D;
	Sun, 10 Oct 2021 10:05:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1860D1BF28A
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 10:05:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 07D91827FB
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 10:05:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hTU18rojTqPD for <buildroot@lists.busybox.net>;
 Sun, 10 Oct 2021 10:04:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 55E4B827D9
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 10:04:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 7370094EC9; Sun, 10 Oct 2021 10:02:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 10 Oct 2021 12:04:44 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: bc67998293958b11b19b89dfd1e978d3176dc420
X-Git-Newrev: 65391de0e87643ec65e6551be3890970d4cb7614
X-Patchwork-Hint: ignore
Message-Id: <20211010100214.7370094EC9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/gdb: append to
 dependencies in conditional
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

commit: https://git.buildroot.net/buildroot/commit/?id=65391de0e87643ec65e6551be3890970d4cb7614
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

Repeat after me: "Forcing the value of <pkg>_DEPENDENCIES inside a
conditional is the root of all evil."

Repeat after me: "Forcing the value of <pkg>_DEPENDENCIES inside a
conditional is the root of all evil."

Repeat after me: "Forcing the value of <pkg>_DEPENDENCIES inside a
conditional is the root of all evil."

Repeat after me: "Forcing the value of <pkg>_DEPENDENCIES inside a
conditional is the root of all evil."

Enough? :-)

Due to this mistake, any other GDB_DEPENDENCIES defined before this
assignment were lost. For example, the host-flex host-bison added
inside the GDB_FROM_GIT==y condition were ignored if
BR2_PACKAGE_GDB_DEBUGGER.

Fixes the build of all ARC configurations that have
BR2_PACKAGE_GDB_DEBUGGER enabled.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 97f3ad7af3dd54a15a10aa35786e7fa08cf5e7b1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gdb/gdb.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 17e10e8b16..e69dabd757 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -156,7 +156,7 @@ ifeq ($(BR2_PACKAGE_GDB_DEBUGGER),y)
 GDB_CONF_OPTS += \
 	--enable-gdb \
 	--with-curses
-GDB_DEPENDENCIES = ncurses \
+GDB_DEPENDENCIES += ncurses \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
 else
 GDB_CONF_OPTS += \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
