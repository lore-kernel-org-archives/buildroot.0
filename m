Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BC7CFA373D
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 11:13:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF1F260A72;
	Sun, 30 Oct 2022 11:13:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF1F260A72
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yH47NPEmHbRA; Sun, 30 Oct 2022 11:13:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E3BAD60A82;
	Sun, 30 Oct 2022 11:13:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E3BAD60A82
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1673C1BF2EB
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 11:09:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0779E80BB4
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 11:09:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0779E80BB4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TGsyFrMFgIC7 for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 11:09:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 275A980C53
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 11:09:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 275A980C53
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 151C487473; Sun, 30 Oct 2022 11:09:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 12:09:25 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 94c6ba6c7085cece40619a2cab2d93dc54b2a412
X-Git-Newrev: 85c20ffa95a145e418e82f7a7106a857b5230a1e
X-Patchwork-Hint: ignore
Message-Id: <20221030110934.151C487473@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lz4: fix static build
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

commit: https://git.buildroot.net/buildroot/commit/?id=85c20ffa95a145e418e82f7a7106a857b5230a1e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following static build failure raised since bump to version
1.9.4 in commit 1f54af8c4f814bfc0993756b82575ad581ce5318:

compiling dynamic library 1.9.4
/home/giuliobenetti/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/m68k-buildroot-uclinux-uclibc/bin/ld.real: /home/giuliobenetti/autobuild/run/instance-0/output-1/host/m68k-buildroot-uclinux-uclibc/sysroot/usr/lib/crt1.o: in function `_start':
(.text+0x1c): undefined reference to `main'

Fixes:
 - http://autobuild.buildroot.org/results/9187852fb7a869bf5595275d47929632659a4407

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../lz4/0001-build-Support-BUILD_SHARED-no.patch   | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/package/lz4/0001-build-Support-BUILD_SHARED-no.patch b/package/lz4/0001-build-Support-BUILD_SHARED-no.patch
new file mode 100644
index 0000000000..d2d8639a3b
--- /dev/null
+++ b/package/lz4/0001-build-Support-BUILD_SHARED-no.patch
@@ -0,0 +1,42 @@
+From 5ccbd38277989ae6a728171d59ae03bad6f2f4d5 Mon Sep 17 00:00:00 2001
+From: Fotis Xenakis <foxen@windowslive.com>
+Date: Tue, 13 Sep 2022 20:09:36 +0300
+Subject: [PATCH] build: Support BUILD_SHARED=no
+
+Since e585a438c714652e866a59371b287f52aa4d2dc3, the BUILD_SHARED
+Makefile variable only takes effect for the install target (i.e. the
+shared libraries always built). This restores the original behaviour.
+
+[Retrieved from:
+https://github.com/lz4/lz4/commit/5ccbd38277989ae6a728171d59ae03bad6f2f4d5]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ lib/Makefile | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/lib/Makefile b/lib/Makefile
+index 06503cb2a..ee262c0df 100644
+--- a/lib/Makefile
++++ b/lib/Makefile
+@@ -112,17 +112,21 @@ liblz4-dll.o: liblz4-dll.rc
+ 	$(WINDRES) -i liblz4-dll.rc -o liblz4-dll.o
+ 
+ $(LIBLZ4): $(SRCFILES) liblz4-dll.o
++ifeq ($(BUILD_SHARED),yes)
+ 	@echo compiling dynamic library $(LIBVER)
+ 	$(CC) $(FLAGS) -DLZ4_DLL_EXPORT=1 -shared $^ -o dll/$@.dll -Wl,--out-implib,dll/$(LIBLZ4_EXP)
++endif
+ 
+ else   # not windows
+ 
+ $(LIBLZ4): $(SRCFILES)
++ifeq ($(BUILD_SHARED),yes)
+ 	@echo compiling dynamic library $(LIBVER)
+ 	$(CC) $(FLAGS) -shared $^ -fPIC -fvisibility=hidden $(SONAME_FLAGS) -o $@
+ 	@echo creating versioned links
+ 	$(LN_SF) $@ liblz4.$(SHARED_EXT_MAJOR)
+ 	$(LN_SF) $@ liblz4.$(SHARED_EXT)
++endif
+ 
+ endif
+ 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
