Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22978C54798
	for <buildroot@archiver.kernel.org>; Sat,  2 Mar 2024 15:21:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F4B4605A9;
	Sat,  2 Mar 2024 15:21:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xfygTzhgLk8w; Sat,  2 Mar 2024 15:21:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 89A83605E5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 89A83605E5;
	Sat,  2 Mar 2024 15:21:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BA4BB1BF360
 for <buildroot@lists.busybox.net>; Sat,  2 Mar 2024 15:21:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A8646605E5
 for <buildroot@lists.busybox.net>; Sat,  2 Mar 2024 15:21:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QyfkCGdHy1TY for <buildroot@lists.busybox.net>;
 Sat,  2 Mar 2024 15:21:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4FEB605A9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D4FEB605A9
 for <buildroot@buildroot.org>; Sat,  2 Mar 2024 15:21:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C8ACD87BA6; Sat,  2 Mar 2024 15:21:46 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 2 Mar 2024 16:20:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 86e244b1a5695a570d00755beeaae068dcb30c2d
X-Git-Newrev: a8b33cb87b6de28e33ac46a20526ebe77c7591f1
X-Patchwork-Hint: ignore
Message-Id: <20240302152146.C8ACD87BA6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openvmtools: needs dynamic library
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

commit: https://git.buildroot.net/buildroot/commit/?id=a8b33cb87b6de28e33ac46a20526ebe77c7591f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

openvmtools can't be built statically since at least bump to version
10.3.5 in commit 5f0f0f7e4f3362a3695d5876d0f41125a2544285:

libtool: link: /home/autobuild/autobuild/instance-9/output-1/per-package/openvmtools/host/bin/i586-buildroot-linux-musl-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Ofast -g0 -static -Wall -Wno-pointer-sign -Wno-unused-value -fno-strict-aliasing -Wno-unknown-pragmas -Wno-uninitialized -Wno-deprecated-declarations -Wno-unused-const-variable -Wno-unused-but-set-variable -static -o vmtoolsd vmtoolsd-cmdLine.o vmtoolsd-mainLoop.o vmtoolsd-mainPosix.o vmtoolsd-pluginMgr.o vmtoolsd-serviceObj.o vmtoolsd-threadPool.o vmtoolsd-toolsRpc.o vmtoolsd-svcSignals.o vmtoolsd-toolsHangDetector.o -pthread -Wl,--export-dynamic -pthread -pthread -pthread  /home/autobuild/autobuild/instance-9/output-1/build/openvmtools-11.3.5-18557794/libvmtools/.libs/libvmtools.a -L/home/autobuild/autobuild/instance-9/output-1/per-package/openvmtools/host/bin/../i586-buildroot-linux-musl/sysroot/usr/lib /home/autobuild/autobuild/instance-9/output-1/per-package/openvmtools/host/i586-buildroot-li
 nux-musl/sysroot/usr/lib/libdnet.a /home/autobuild/autobuild/instance-9/output-1/per-package/openvmtools/host/i586-buildroot-linux-musl/sysroot/usr/lib/libtirpc.a -lrt -lcrypt -lpthread -lgmodule-2.0 -lgobject-2.0 /home/autobuild/autobuild/instance-9/output-1/per-package/openvmtools/host/i586-buildroot-linux-musl/sysroot/usr/lib/libffi.a -lgthread-2.0 -lglib-2.0 -lm /home/autobuild/autobuild/instance-9/output-1/per-package/openvmtools/host/i586-buildroot-linux-musl/sysroot/usr/lib/libpcre.a ../../lib/globalConfig/.libs/libGlobalConfig.a -pthread
/home/autobuild/autobuild/instance-9/output-1/per-package/openvmtools/host/bin/../lib/gcc/i586-buildroot-linux-musl/10.4.0/../../../../i586-buildroot-linux-musl/bin/ld: /home/autobuild/autobuild/instance-9/output-1/build/openvmtools-11.3.5-18557794/libvmtools/.libs/libvmtools.a(libvmtools_la-vmtools.o):(.modinfo+0x0): multiple definition of `vm_version'; vmtoolsd-mainPosix.o:(.modinfo+0x0): first defined here

Fixes:
 - http://autobuild.buildroot.org/results/61b03301bc36247c75e797fb294ec7f96bce6e22
 - http://autobuild.buildroot.org/results/eea487eb0de911f4e4bce7a557d4c93d732181cf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/openvmtools/Config.in | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/openvmtools/Config.in b/package/openvmtools/Config.in
index 066a7a4736..b62e5d0361 100644
--- a/package/openvmtools/Config.in
+++ b/package/openvmtools/Config.in
@@ -11,6 +11,7 @@ config BR2_PACKAGE_OPENVMTOOLS
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_ENABLE_LOCALE
+	depends on !BR2_STATIC_LIBS
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBDNET
@@ -30,16 +31,15 @@ if BR2_PACKAGE_OPENVMTOOLS
 
 config BR2_PACKAGE_OPENVMTOOLS_PAM
 	bool "PAM support"
-	# linux-pam needs locale and wchar, but we already have this
-	# dependency on the main symbol, above.
+	# linux-pam needs locale, dynamic library and wchar, but we
+	# already have these dependencies on the main symbol, above.
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # linux-pam
-	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_LINUX_PAM
 	help
 	  Support for PAM in openvmtools
 
-comment "PAM support needs a toolchain w/ dynamic library, gcc >= 4.9"
-	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+comment "PAM support needs a toolchain w/ gcc >= 4.9"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
 config BR2_PACKAGE_OPENVMTOOLS_RESOLUTIONKMS
 	bool "resolutionkms support"
@@ -57,9 +57,9 @@ comment "resolutionkms needs udev, a toolchain w/ threads"
 
 endif
 
-comment "openvmtools needs a glibc or musl toolchain w/ wchar, threads, locale"
+comment "openvmtools needs a glibc or musl toolchain w/ wchar, threads, locale, dynamic library"
 	depends on BR2_PACKAGE_OPENVMTOOLS_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_ENABLE_LOCALE || \
+		!BR2_ENABLE_LOCALE || BR2_STATIC_LIBS || \
 		BR2_TOOLCHAIN_USES_UCLIBC
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
