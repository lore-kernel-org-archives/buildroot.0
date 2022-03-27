Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 761C5C433F5
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 16:10:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 31B48404D0;
	Sun, 27 Mar 2022 16:10:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RlE8UFNPb6mw; Sun, 27 Mar 2022 16:10:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 56CD340179;
	Sun, 27 Mar 2022 16:10:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1AFEA1BF303
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 16:09:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F0764021D
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 16:09:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iSX5lIF1SHh6 for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 16:09:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CC669402BB
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 16:09:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 714FA85DB6; Sun, 27 Mar 2022 16:00:39 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 27 Mar 2022 17:59:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b38d3d22718270610639c9078476ac31ceeaa34d
X-Git-Newrev: 930db465d9d9f2fd558e67bd808914309c2d4619
X-Patchwork-Hint: ignore
Message-Id: <20220327160039.714FA85DB6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/jack2: fix build with libexecinfo
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

commit: https://git.buildroot.net/buildroot/commit/?id=930db465d9d9f2fd558e67bd808914309c2d4619
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised on uclibc and musl since the
addition of libexecinfo package in commit
eea8ba446c10701a273432552108d80fb2224ef4:

/home/peko/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/10.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: dbus/sigsegv.c.17.o: in function `signal_segv':
sigsegv.c:(.text+0x98): undefined reference to `backtrace'

Fixes:
 - http://autobuild.buildroot.org/results/dca49cb9b3e66fac921601560e9358bcce9acffc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/jack2/jack2.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/jack2/jack2.mk b/package/jack2/jack2.mk
index 2e55169984..127c99eed1 100644
--- a/package/jack2/jack2.mk
+++ b/package/jack2/jack2.mk
@@ -14,6 +14,11 @@ JACK2_INSTALL_STAGING = YES
 
 JACK2_CONF_OPTS = --alsa
 
+ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
+JACK2_DEPENDENCIES += libexecinfo
+JACK2_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) -lexecinfo"
+endif
+
 ifeq ($(BR2_PACKAGE_OPUS),y)
 JACK2_DEPENDENCIES += opus
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
