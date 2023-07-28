Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0B11C001DE
	for <buildroot@archiver.kernel.org>; Fri, 28 Jul 2023 19:33:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6538241521;
	Fri, 28 Jul 2023 19:33:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6538241521
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QIo3oKXBST5u; Fri, 28 Jul 2023 19:33:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 394B8415D0;
	Fri, 28 Jul 2023 19:33:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 394B8415D0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A71871BF312
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 19:33:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8075F844C0
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 19:33:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8075F844C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aWnzze0bjNkO for <buildroot@lists.busybox.net>;
 Fri, 28 Jul 2023 19:33:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7645384184
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 19:33:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7645384184
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 64F4F838B0; Fri, 28 Jul 2023 19:33:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Jul 2023 21:33:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a70e226ac1cbfcab3efb16a44d8e5c7bd6a520f1
X-Git-Newrev: 4ce0dacb60b7fdccf3daabe58e09358da3f09fa2
X-Patchwork-Hint: ignore
Message-Id: <20230728193322.64F4F838B0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gcc: or1k: Only define
 TARGET_HAVE_TLS when HAVE_AS_TLS
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

commit: https://git.buildroot.net/buildroot/commit/?id=4ce0dacb60b7fdccf3daabe58e09358da3f09fa2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Backport upstream patch to fix build error seens with alsa-lib:
error.c:(.text+0x12c): undefined reference to `__tls_get_addr'

Fixes:
http://autobuild.buildroot.net/results/525ca7fe78015168c186ffda5fa52c0edb2071c9/

The fix is included in gcc 13.x.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...y-define-TARGET_HAVE_TLS-when-HAVE_AS_TLS.patch | 49 ++++++++++++++++++++++
 ...y-define-TARGET_HAVE_TLS-when-HAVE_AS_TLS.patch | 49 ++++++++++++++++++++++
 ...y-define-TARGET_HAVE_TLS-when-HAVE_AS_TLS.patch | 48 +++++++++++++++++++++
 3 files changed, 146 insertions(+)

diff --git a/package/gcc/10.4.0/0007-or1k-Only-define-TARGET_HAVE_TLS-when-HAVE_AS_TLS.patch b/package/gcc/10.4.0/0007-or1k-Only-define-TARGET_HAVE_TLS-when-HAVE_AS_TLS.patch
new file mode 100644
index 0000000000..7e9714e9cb
--- /dev/null
+++ b/package/gcc/10.4.0/0007-or1k-Only-define-TARGET_HAVE_TLS-when-HAVE_AS_TLS.patch
@@ -0,0 +1,49 @@
+From ca01d2526917ec6e54b30472d3aedfd46d4ca585 Mon Sep 17 00:00:00 2001
+From: Stafford Horne <shorne@gmail.com>
+Date: Thu, 29 Sep 2022 15:32:39 +0100
+Subject: [PATCH] or1k: Only define TARGET_HAVE_TLS when HAVE_AS_TLS
+
+This was found when testing buildroot with linuxthreads enabled.  In
+this case, the build passes --disable-tls to the toolchain during
+configuration.  After building the OpenRISC toolchain it was still
+generating TLS code sequences and causing linker failures such as:
+
+ ..../or1k-buildroot-linux-uclibc-gcc -o gpsd-3.24/gpsctl .... -lusb-1.0 -lm -lrt -lnsl
+ ..../ld: ..../sysroot/usr/lib/libusb-1.0.so: undefined reference to `__tls_get_addr'
+
+This patch fixes this by disabling tls for the OpenRISC target when requested
+via --disable-tls.
+
+gcc/ChangeLog:
+
+	* config/or1k/or1k.c (TARGET_HAVE_TLS): Only define if
+	HAVE_AS_TLS is defined.
+
+Tested-by: Yann E. MORIN <yann.morin@orange.com>
+
+Upstream: https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=ca01d2526917ec6e54b30472d3aedfd46d4ca585
+
+[Bernd: backported to 10.4.0]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ gcc/config/or1k/or1k.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/gcc/config/or1k/or1k.c b/gcc/config/or1k/or1k.c
+index da2f59062ba..0ce7b234417 100644
+--- a/gcc/config/or1k/or1k.c
++++ b/gcc/config/or1k/or1k.c
+@@ -2175,8 +2175,10 @@ or1k_output_mi_thunk (FILE *file, tree thunk_fndecl,
+ #undef  TARGET_LEGITIMATE_ADDRESS_P
+ #define TARGET_LEGITIMATE_ADDRESS_P or1k_legitimate_address_p
+ 
++#ifdef HAVE_AS_TLS
+ #undef  TARGET_HAVE_TLS
+ #define TARGET_HAVE_TLS true
++#endif
+ 
+ #undef  TARGET_HAVE_SPECULATION_SAFE_VALUE
+ #define TARGET_HAVE_SPECULATION_SAFE_VALUE speculation_safe_value_not_needed
+-- 
+2.39.3
+
diff --git a/package/gcc/11.4.0/0006-or1k-Only-define-TARGET_HAVE_TLS-when-HAVE_AS_TLS.patch b/package/gcc/11.4.0/0006-or1k-Only-define-TARGET_HAVE_TLS-when-HAVE_AS_TLS.patch
new file mode 100644
index 0000000000..025e6cfe32
--- /dev/null
+++ b/package/gcc/11.4.0/0006-or1k-Only-define-TARGET_HAVE_TLS-when-HAVE_AS_TLS.patch
@@ -0,0 +1,49 @@
+From ca01d2526917ec6e54b30472d3aedfd46d4ca585 Mon Sep 17 00:00:00 2001
+From: Stafford Horne <shorne@gmail.com>
+Date: Thu, 29 Sep 2022 15:32:39 +0100
+Subject: [PATCH] or1k: Only define TARGET_HAVE_TLS when HAVE_AS_TLS
+
+This was found when testing buildroot with linuxthreads enabled.  In
+this case, the build passes --disable-tls to the toolchain during
+configuration.  After building the OpenRISC toolchain it was still
+generating TLS code sequences and causing linker failures such as:
+
+ ..../or1k-buildroot-linux-uclibc-gcc -o gpsd-3.24/gpsctl .... -lusb-1.0 -lm -lrt -lnsl
+ ..../ld: ..../sysroot/usr/lib/libusb-1.0.so: undefined reference to `__tls_get_addr'
+
+This patch fixes this by disabling tls for the OpenRISC target when requested
+via --disable-tls.
+
+gcc/ChangeLog:
+
+	* config/or1k/or1k.c (TARGET_HAVE_TLS): Only define if
+	HAVE_AS_TLS is defined.
+
+Tested-by: Yann E. MORIN <yann.morin@orange.com>
+
+Upstream: https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=ca01d2526917ec6e54b30472d3aedfd46d4ca585
+
+[Bernd: backported to 11.4.0]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ gcc/config/or1k/or1k.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/gcc/config/or1k/or1k.c b/gcc/config/or1k/or1k.c
+index da2f59062ba..0ce7b234417 100644
+--- a/gcc/config/or1k/or1k.c
++++ b/gcc/config/or1k/or1k.c
+@@ -2175,8 +2175,10 @@ or1k_output_mi_thunk (FILE *file, tree thunk_fndecl,
+ #undef  TARGET_LEGITIMATE_ADDRESS_P
+ #define TARGET_LEGITIMATE_ADDRESS_P or1k_legitimate_address_p
+ 
++#ifdef HAVE_AS_TLS
+ #undef  TARGET_HAVE_TLS
+ #define TARGET_HAVE_TLS true
++#endif
+ 
+ #undef  TARGET_HAVE_SPECULATION_SAFE_VALUE
+ #define TARGET_HAVE_SPECULATION_SAFE_VALUE speculation_safe_value_not_needed
+-- 
+2.39.3
+
diff --git a/package/gcc/12.3.0/0002-or1k-Only-define-TARGET_HAVE_TLS-when-HAVE_AS_TLS.patch b/package/gcc/12.3.0/0002-or1k-Only-define-TARGET_HAVE_TLS-when-HAVE_AS_TLS.patch
new file mode 100644
index 0000000000..4bac597233
--- /dev/null
+++ b/package/gcc/12.3.0/0002-or1k-Only-define-TARGET_HAVE_TLS-when-HAVE_AS_TLS.patch
@@ -0,0 +1,48 @@
+From ca01d2526917ec6e54b30472d3aedfd46d4ca585 Mon Sep 17 00:00:00 2001
+From: Stafford Horne <shorne@gmail.com>
+Date: Thu, 29 Sep 2022 15:32:39 +0100
+Subject: [PATCH] or1k: Only define TARGET_HAVE_TLS when HAVE_AS_TLS
+
+This was found when testing buildroot with linuxthreads enabled.  In
+this case, the build passes --disable-tls to the toolchain during
+configuration.  After building the OpenRISC toolchain it was still
+generating TLS code sequences and causing linker failures such as:
+
+ ..../or1k-buildroot-linux-uclibc-gcc -o gpsd-3.24/gpsctl .... -lusb-1.0 -lm -lrt -lnsl
+ ..../ld: ..../sysroot/usr/lib/libusb-1.0.so: undefined reference to `__tls_get_addr'
+
+This patch fixes this by disabling tls for the OpenRISC target when requested
+via --disable-tls.
+
+gcc/ChangeLog:
+
+	* config/or1k/or1k.cc (TARGET_HAVE_TLS): Only define if
+	HAVE_AS_TLS is defined.
+
+Tested-by: Yann E. MORIN <yann.morin@orange.com>
+
+Upstream: https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=ca01d2526917ec6e54b30472d3aedfd46d4ca585
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ gcc/config/or1k/or1k.cc | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/gcc/config/or1k/or1k.cc b/gcc/config/or1k/or1k.cc
+index da2f59062ba..0ce7b234417 100644
+--- a/gcc/config/or1k/or1k.cc
++++ b/gcc/config/or1k/or1k.cc
+@@ -2206,8 +2206,10 @@ or1k_output_mi_thunk (FILE *file, tree thunk_fndecl,
+ #undef  TARGET_LEGITIMATE_ADDRESS_P
+ #define TARGET_LEGITIMATE_ADDRESS_P or1k_legitimate_address_p
+ 
++#ifdef HAVE_AS_TLS
+ #undef  TARGET_HAVE_TLS
+ #define TARGET_HAVE_TLS true
++#endif
+ 
+ #undef  TARGET_HAVE_SPECULATION_SAFE_VALUE
+ #define TARGET_HAVE_SPECULATION_SAFE_VALUE speculation_safe_value_not_needed
+-- 
+2.39.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
