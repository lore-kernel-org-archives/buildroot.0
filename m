Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 795A4C433EF
	for <buildroot@archiver.kernel.org>; Sun, 30 Jan 2022 15:01:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 24560403F8;
	Sun, 30 Jan 2022 15:01:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 85OxN_oy-JJG; Sun, 30 Jan 2022 15:00:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 43BA640332;
	Sun, 30 Jan 2022 15:00:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A6F591BF425
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 15:00:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A207A40332
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 15:00:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RShCcsOPHEEM for <buildroot@lists.busybox.net>;
 Sun, 30 Jan 2022 15:00:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A26AC4017C
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 15:00:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id DEC2882AEC; Sun, 30 Jan 2022 14:53:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Jan 2022 16:00:27 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 61797c52f5deef2cb67e60cf075ca243078c8855
X-Git-Newrev: 1ad05acb1e8c83da6c31b88ea2d543f4fe210004
X-Patchwork-Hint: ignore
Message-Id: <20220130145353.DEC2882AEC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/htpdate: fix static openssl build
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

commit: https://git.buildroot.net/buildroot/commit/?id=1ad05acb1e8c83da6c31b88ea2d543f4fe210004
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following static build failure with openssl raised since bump to
version 1.3.3 in commit 163509a8e0d558e6339c5489f072dfe805e0cc34:

/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sh4-buildroot-linux-uclibc/10.3.0/../../../../sh4-buildroot-linux-uclibc/bin/ld: /home/buildroot/autobuild/instance-3/output-1/host/sh4-buildroot-linux-uclibc/sysroot/usr/lib/libssl.a(rec_layer_d1.o): in function `DTLS_RECORD_LAYER_new':
rec_layer_d1.c:(.text+0x124): undefined reference to `CRYPTO_malloc'

Fixes:
 - http://autobuild.buildroot.org/results/75ad8515916dfa056b17c97fdd95c7eb4d83a304

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...SL_LIBS-to-be-configured-from-environment.patch | 37 ++++++++++++++++++++++
 package/htpdate/htpdate.mk                         |  4 ++-
 2 files changed, 40 insertions(+), 1 deletion(-)

diff --git a/package/htpdate/0001-Allow-SSL_LIBS-to-be-configured-from-environment.patch b/package/htpdate/0001-Allow-SSL_LIBS-to-be-configured-from-environment.patch
new file mode 100644
index 0000000000..6dca2babab
--- /dev/null
+++ b/package/htpdate/0001-Allow-SSL_LIBS-to-be-configured-from-environment.patch
@@ -0,0 +1,37 @@
+From 4ba90fedd553c3b06c925fb6ff5245a5dcabace9 Mon Sep 17 00:00:00 2001
+From: Eddy Vervest <eddy@vervest.org>
+Date: Sat, 29 Jan 2022 10:58:13 +0100
+Subject: [PATCH] Allow SSL_LIBS to be configured from environment
+
+[Retrieved from:
+https://github.com/twekkel/htpdate/commit/4ba90fedd553c3b06c925fb6ff5245a5dcabace9]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ Makefile | 7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 4796efa..cf077e6 100644
+--- a/Makefile
++++ b/Makefile
+@@ -2,8 +2,9 @@ prefix = $(DESTDIR)/usr
+ bindir = ${prefix}/sbin
+ mandir = ${prefix}/share/man
+ 
+-CC     ?= gcc
+-CFLAGS += -Wall -std=c11 -pedantic -O2
++CC       ?= gcc
++CFLAGS   += -Wall -std=c11 -pedantic -O2
++SSL_LIBS ?= -lssl
+ 
+ INSTALL ?= install -c
+ STRIP   ?= strip -s
+@@ -14,7 +15,7 @@ htpdate: htpdate.c
+ 	$(CC) $(CFLAGS) -o htpdate htpdate.c
+ 
+ https: htpdate.c
+-	$(CC) $(CFLAGS) -DENABLE_HTTPS -o htpdate htpdate.c -lssl
++	$(CC) $(CFLAGS) -DENABLE_HTTPS -o htpdate htpdate.c $(SSL_LIBS)
+ 
+ install: all
+ 	$(STRIP) htpdate
diff --git a/package/htpdate/htpdate.mk b/package/htpdate/htpdate.mk
index 54b3ec2569..e32480fc85 100644
--- a/package/htpdate/htpdate.mk
+++ b/package/htpdate/htpdate.mk
@@ -10,7 +10,9 @@ HTPDATE_LICENSE = GPL-2.0+
 HTPDATE_LICENSE_FILES = LICENSE
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-HTPDATE_BUILD_OPTS = https
+HTPDATE_BUILD_OPTS = \
+	https \
+	SSL_LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs openssl`"
 HTPDATE_DEPENDENCIES += openssl host-pkgconf
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
