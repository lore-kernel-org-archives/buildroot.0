Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DD26C433EF
	for <buildroot@archiver.kernel.org>; Mon, 13 Jun 2022 20:24:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 263DE81768;
	Mon, 13 Jun 2022 20:24:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2cS-DbP7p67r; Mon, 13 Jun 2022 20:24:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4DF928149C;
	Mon, 13 Jun 2022 20:24:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 377231BF37C
 for <buildroot@lists.busybox.net>; Mon, 13 Jun 2022 20:24:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 346F060DB2
 for <buildroot@lists.busybox.net>; Mon, 13 Jun 2022 20:24:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZuXX7SUpksH2 for <buildroot@lists.busybox.net>;
 Mon, 13 Jun 2022 20:24:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 723EF60ECB
 for <buildroot@buildroot.org>; Mon, 13 Jun 2022 20:24:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 7DCC886F7A; Mon, 13 Jun 2022 20:12:02 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 13 Jun 2022 21:58:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 80fc07c67a813f9b4844d4afbc562bc759b9174c
X-Git-Newrev: c5ffe830f3bb8cadea7491b94f140ba6bd3d0486
X-Patchwork-Hint: ignore
Message-Id: <20220613201202.7DCC886F7A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/noip: fix static build
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

commit: https://git.buildroot.net/buildroot/commit/?id=c5ffe830f3bb8cadea7491b94f140ba6bd3d0486
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Pass TARGET_LDFLAGS (which will contain -static) through LIBS (as
LDFLAGS is not supported) to fix the following static build failure
(e.g. with musl):

/home/autobuild/autobuild/instance-15/output-1/host/lib/gcc/microblazeel-buildroot-linux-musl/10.3.0/../../../../microblazeel-buildroot-linux-musl/bin/ld: /home/autobuild/autobuild/instance-15/output-1/host/lib/gcc/microblazeel-buildroot-linux-musl/10.3.0/libgcc.a(unwind-dw2.o): in function `__gthread_once':
/home/autobuild/autobuild/instance-15/output-1/build/host-gcc-final-10.3.0/build/microblazeel-buildroot-linux-musl/libgcc/gthr-default.h:700: undefined reference to `pthread_once'

While at it, also pass TARGET_CFLAGS through LIBS as suggested by Thomas
Petazzoni

Fixes:
 - http://autobuild.buildroot.org/results/5ea9b1b976aecc401e0aff21eef3e31c8ed17181

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[Arnout: remove CPPFLAGS, already in CFLAGS]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/noip/noip.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/noip/noip.mk b/package/noip/noip.mk
index b7fcc84e2f..8b57d82469 100644
--- a/package/noip/noip.mk
+++ b/package/noip/noip.mk
@@ -10,10 +10,13 @@ NOIP_SOURCE = noip-duc-linux.tar.gz
 NOIP_LICENSE = GPL-2.0+
 NOIP_LICENSE_FILES = COPYING
 
+# Pass TARGET_{C,LD}FLAGS through LIBS as noip doesn't rely on implicit
+# make rules
 define NOIP_BUILD_CMDS
 	$(SED) "/^#define CONFIG_FILENAME/ s/PREFIX//" $(@D)/noip2.c
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) CC="$(TARGET_CC)" \
-		CFLAGS="$(TARGET_CFLAGS)" PREFIX=/usr CONFDIR=/etc
+		LIBS="$(TARGET_CFLAGS) $(TARGET_LDFLAGS)" \
+		PREFIX=/usr CONFDIR=/etc
 endef
 
 define NOIP_INSTALL_TARGET_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
