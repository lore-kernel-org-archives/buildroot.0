Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 213E0C433EF
	for <buildroot@archiver.kernel.org>; Mon, 28 Feb 2022 18:49:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C0C5260E56;
	Mon, 28 Feb 2022 18:49:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T_63qnVrtJSE; Mon, 28 Feb 2022 18:49:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03FEF60E3E;
	Mon, 28 Feb 2022 18:49:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 84ABF1BF2CE
 for <buildroot@lists.busybox.net>; Mon, 28 Feb 2022 18:48:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7F32780BD2
 for <buildroot@lists.busybox.net>; Mon, 28 Feb 2022 18:48:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a8NS7ruxVhIM for <buildroot@lists.busybox.net>;
 Mon, 28 Feb 2022 18:48:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5090C81344
 for <buildroot@buildroot.org>; Mon, 28 Feb 2022 18:48:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B1B5B836D7; Mon, 28 Feb 2022 18:40:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 28 Feb 2022 19:43:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 14e0c4de719a0d63192cc5de66a608f75297f37d
X-Git-Newrev: 96cb2d5c0c55b7f68810e1e1b5a3344521df4db7
X-Patchwork-Hint: ignore
Message-Id: <20220228184000.B1B5B836D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freerdp: fix build with libexecinfo
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

commit: https://git.buildroot.net/buildroot/commit/?id=96cb2d5c0c55b7f68810e1e1b5a3344521df4db7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised on uclibc and musl since the
addition of libexecinfo package in commit
eea8ba446c10701a273432552108d80fb2224ef4:

/home/buildroot/autobuild/instance-0/output-1/host/lib/gcc/riscv64-buildroot-linux-uclibc/10.3.0/../../../../riscv64-buildroot-linux-uclibc/bin/ld: ../../libwinpr/libwinpr2.so.2.5.0: undefined reference to `backtrace_symbols_fd'

Fixes:
 - http://autobuild.buildroot.org/results/095c33098a6e59ff664080e03baf1a3c92b4265f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freerdp/freerdp.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index c536f6cb1c..5f6ae56d1d 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -43,6 +43,11 @@ else
 FREERDP_CONF_OPTS += -DWITH_ALSA=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
+FREERDP_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-lexecinfo
+FREERDP_DEPENDENCIES += libexecinfo
+endif
+
 ifeq ($(BR2_PACKAGE_LIBUSB),y)
 FREERDP_CONF_OPTS += -DCHANNEL_URBDRC=ON
 FREERDP_DEPENDENCIES += libusb
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
