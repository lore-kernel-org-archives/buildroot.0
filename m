Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44400C433F5
	for <buildroot@archiver.kernel.org>; Mon, 20 Dec 2021 22:43:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EBBDD40129;
	Mon, 20 Dec 2021 22:43:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XtB7p_g7p14S; Mon, 20 Dec 2021 22:43:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B528F4019D;
	Mon, 20 Dec 2021 22:43:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8F4201BF5A6
 for <buildroot@lists.busybox.net>; Mon, 20 Dec 2021 22:42:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F71D40281
 for <buildroot@lists.busybox.net>; Mon, 20 Dec 2021 22:42:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I8W-npAKbVHf for <buildroot@lists.busybox.net>;
 Mon, 20 Dec 2021 22:42:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 294B840221
 for <buildroot@buildroot.org>; Mon, 20 Dec 2021 22:42:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 21097828BA; Mon, 20 Dec 2021 22:36:41 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 20 Dec 2021 23:06:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a3c2fe8ef19edc4266a179d53d452fd6accb3456
X-Git-Newrev: f93ea03d0fc940c2f92d8e282e1069a1c54aea50
X-Patchwork-Hint: ignore
Message-Id: <20211220223641.21097828BA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/jitterentropy-library: fix build
 without stack-protector
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

commit: https://git.buildroot.net/buildroot/commit/?id=f93ea03d0fc940c2f92d8e282e1069a1c54aea50
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure without stack-protector raised since
bump to version 3.3.1 in commit 3965f09cb427af411055a783cd14b501b2b28285
and
https://github.com/smuellerDD/jitterentropy-library/commit/5b3cb7f35e41ba2f34a75d004cf095c965a1a0c4:

/home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i686-buildroot-linux-uclibc/9.3.0/../../../../i686-buildroot-linux-uclibc/bin/ld: src/jitterentropy-base.o: in function `jent_fips_enabled':
jitterentropy-base.c:(.text+0x131): undefined reference to `__stack_chk_fail_local'

If stack-protector is enabled in the Buildroot config, the toolchain
wrapper will make sure it is used, so there's no need for the
jitterentropy-library Makefile to handle it.

Fixes:
 - http://autobuild.buildroot.org/results/8de/8dee462d16d934dd173d58f17933c6911e4336bf/build-end.log

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../0001-Makefile-add-ENABLE_STACK_PROTECTOR.patch | 52 ++++++++++++++++++++++
 .../jitterentropy-library/jitterentropy-library.mk |  2 +-
 2 files changed, 53 insertions(+), 1 deletion(-)

diff --git a/package/jitterentropy-library/0001-Makefile-add-ENABLE_STACK_PROTECTOR.patch b/package/jitterentropy-library/0001-Makefile-add-ENABLE_STACK_PROTECTOR.patch
new file mode 100644
index 0000000000..c4388663b0
--- /dev/null
+++ b/package/jitterentropy-library/0001-Makefile-add-ENABLE_STACK_PROTECTOR.patch
@@ -0,0 +1,52 @@
+From 272ee47892563e849f6b1bf59b0173f8aa33b631 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 19 Dec 2021 11:36:13 +0100
+Subject: [PATCH] Makefile: add ENABLE_STACK_PROTECTOR
+
+Add ENABLE_STACK_PROTECTOR as build on embedded toolchains without
+stack-protector is again broken since
+https://github.com/smuellerDD/jitterentropy-library/commit/5b3cb7f35e41ba2f34a75d004cf095c965a1a0c4:
+
+/home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i686-buildroot-linux-uclibc/9.3.0/../../../../i686-buildroot-linux-uclibc/bin/ld: src/jitterentropy-base.o: in function `jent_fips_enabled':
+jitterentropy-base.c:(.text+0x131): undefined reference to `__stack_chk_fail_local'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/8dee462d16d934dd173d58f17933c6911e4336bf
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Signed-off-by: Stephan Mueller <smueller@chronox.de>
+[Retrieved from:
+https://github.com/smuellerDD/jitterentropy-library/commit/272ee47892563e849f6b1bf59b0173f8aa33b631]
+---
+ Makefile | 11 +++++++----
+ 1 file changed, 7 insertions(+), 4 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index dfb96a8..c999ef5 100644
+--- a/Makefile
++++ b/Makefile
+@@ -2,6 +2,7 @@
+ 
+ CC ?= gcc
+ #Hardening
++ENABLE_STACK_PROTECTOR ?= 1
+ CFLAGS ?= -fwrapv --param ssp-buffer-size=4 -fvisibility=hidden -fPIE -Wcast-align -Wmissing-field-initializers -Wshadow -Wswitch-enum
+ CFLAGS +=-Wextra -Wall -pedantic -fPIC -O0 -fwrapv -Wconversion
+ LDFLAGS +=-Wl,-z,relro,-z,now -lpthread
+@@ -13,10 +14,12 @@ else
+   GCC_GTEQ_490 := $(shell expr `$(CC) -dumpfullversion | sed -e 's/\.\([0-9][0-9]\)/\1/g' -e 's/\.\([0-9]\)/0\1/g' -e 's/^[0-9]\{3,4\}$$/&00/'` \>= 40900)
+ endif
+ 
+-ifeq "$(GCC_GTEQ_490)" "1"
+-  CFLAGS += -fstack-protector-strong
+-else
+-  CFLAGS += -fstack-protector-all
++ifeq "$(ENABLE_STACK_PROTECTOR)" "1"
++  ifeq "$(GCC_GTEQ_490)" "1"
++    CFLAGS += -fstack-protector-strong
++  else
++    CFLAGS += -fstack-protector-all
++  endif
+ endif
+ 
+ # Change as necessary
diff --git a/package/jitterentropy-library/jitterentropy-library.mk b/package/jitterentropy-library/jitterentropy-library.mk
index 830da0e065..4cdebf46a3 100644
--- a/package/jitterentropy-library/jitterentropy-library.mk
+++ b/package/jitterentropy-library/jitterentropy-library.mk
@@ -26,7 +26,7 @@ endif
 
 define JITTERENTROPY_LIBRARY_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
-		$(JITTERENTROPY_LIBRARY_BUILD_TARGETS)
+		ENABLE_STACK_PROTECTOR=0 $(JITTERENTROPY_LIBRARY_BUILD_TARGETS)
 endef
 
 define JITTERENTROPY_LIBRARY_INSTALL_STAGING_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
