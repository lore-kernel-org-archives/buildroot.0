Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00E81C61DA4
	for <buildroot@archiver.kernel.org>; Sun,  5 Mar 2023 17:44:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A31A441299;
	Sun,  5 Mar 2023 17:44:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A31A441299
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YcSTtOXwbFBt; Sun,  5 Mar 2023 17:44:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31B02414C0;
	Sun,  5 Mar 2023 17:44:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31B02414C0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7D5911BF488
 for <buildroot@lists.busybox.net>; Sun,  5 Mar 2023 17:41:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 38AA3401D8
 for <buildroot@lists.busybox.net>; Sun,  5 Mar 2023 17:41:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 38AA3401D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cVHfnMOMKPQQ for <buildroot@lists.busybox.net>;
 Sun,  5 Mar 2023 17:40:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 27AA340600
 for <buildroot@buildroot.org>; Sun,  5 Mar 2023 17:40:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 27AA340600
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 16BFE86562; Sun,  5 Mar 2023 17:40:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 5 Mar 2023 18:24:05 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 8c0a59f6fe8a7d39c7ea5c3a92d3acd65337e292
X-Git-Newrev: 9b1f9449484b3a452479f68c8bbb194d15526141
X-Patchwork-Hint: ignore
Message-Id: <20230305174058.16BFE86562@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/sudo: fix openssl
 static build
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

commit: https://git.buildroot.net/buildroot/commit/?id=9b1f9449484b3a452479f68c8bbb194d15526141
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fix the following build failure with sparc raised since bump to version
1.9.11p2 in commit 9b7f8da96be549a52630cd87b30851d600f163a4 and
https://github.com/sudo-project/sudo/commit/9fbbca7b7a4cc60a8aa27d73de54278004a704c0:

hecking for X509_STORE_CTX_get0_cert
configure:21215: /home/thomas/autobuild/instance-3/output-1/host/bin/sparc-buildroot-linux-uclibc-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0  -static -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -DZLIB_CONST  -static conftest.c   -L/home/thomas/autobuild/instance-3/output-1/host/bin/../sparc-buildroot-linux-uclibc/sysroot/usr/lib -lssl -lz -pthread -latomic -lcrypto >&5
/home/thomas/autobuild/instance-3/output-1/host/lib/gcc/sparc-buildroot-linux-uclibc/10.4.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: /home/thomas/autobuild/instance-3/output-1/host/bin/../sparc-buildroot-linux-uclibc/sysroot/usr/lib/libcrypto.a(x509cset.o): in function `X509_CRL_up_ref':
x509cset.c:(.text+0x108): undefined reference to `__atomic_fetch_add_4'

[...]

In file included from ./hostcheck.c:38:
../../include/sudo_compat.h:342:41: error: conflicting types for 'ASN1_STRING_data'
  342 | #  define ASN1_STRING_get0_data(x)      ASN1_STRING_data(x)
      |                                         ^~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/8be59dd94e4916f9457cb435104e36e62a28373b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 4655d84ff567e8ecc2665ac0760ef01023aae91d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...001-configure.ac-fix-openssl-static-build.patch | 49 ++++++++++++++++++++++
 package/sudo/sudo.mk                               |  2 +
 2 files changed, 51 insertions(+)

diff --git a/package/sudo/0001-configure.ac-fix-openssl-static-build.patch b/package/sudo/0001-configure.ac-fix-openssl-static-build.patch
new file mode 100644
index 0000000000..32edd148a0
--- /dev/null
+++ b/package/sudo/0001-configure.ac-fix-openssl-static-build.patch
@@ -0,0 +1,49 @@
+From 5cfc7e277d0b262a1d12e867c47a36301fb7edb7 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 22 Feb 2023 10:01:25 +0100
+Subject: [PATCH] configure.ac: fix openssl static build
+
+Do not use AX_APPEND_FLAG as it will break static builds by removing
+duplicates such as -lz or -latomic which are needed by -lssl and
+-lcrypto. This will fix the following build failure with sparc which
+needs -latomic:
+
+Checking for X509_STORE_CTX_get0_cert
+configure:21215: /home/thomas/autobuild/instance-3/output-1/host/bin/sparc-buildroot-linux-uclibc-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0  -static -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -DZLIB_CONST  -static conftest.c   -L/home/thomas/autobuild/instance-3/output-1/host/bin/../sparc-buildroot-linux-uclibc/sysroot/usr/lib -lssl -lz -pthread -latomic -lcrypto >&5
+/home/thomas/autobuild/instance-3/output-1/host/lib/gcc/sparc-buildroot-linux-uclibc/10.4.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: /home/thomas/autobuild/instance-3/output-1/host/bin/../sparc-buildroot-linux-uclibc/sysroot/usr/lib/libcrypto.a(x509cset.o): in function `X509_CRL_up_ref':
+x509cset.c:(.text+0x108): undefined reference to `__atomic_fetch_add_4'
+
+[...]
+
+In file included from ./hostcheck.c:38:
+../../include/sudo_compat.h:342:41: error: conflicting types for 'ASN1_STRING_data'
+  342 | #  define ASN1_STRING_get0_data(x)      ASN1_STRING_data(x)
+      |                                         ^~~~~~~~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/8be59dd94e4916f9457cb435104e36e62a28373b
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/sudo-project/sudo/pull/244]
+---
+ configure.ac | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 8eccad7e4..523d8e56b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -3082,7 +3082,9 @@ if test "${enable_openssl-no}" != no; then
+ 		    SUDO_APPEND_LIBPATH([LIBTLS], [$f])
+ 		    ;;
+ 		*)
+-		    AX_APPEND_FLAG([$f], [LIBTLS])
++		    # Do not use AX_APPEND_FLAG as it will break static builds by removing
++		    # duplicates such as -lz or -latomic which are needed by -lssl and -lcrypto
++		    LIBTLS="$LIBTLS $f"
+ 		    ;;
+ 	    esac
+ 	done
+-- 
+2.39.0
+
diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index c4eaafa6b1..3b5c898917 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -13,6 +13,8 @@ SUDO_LICENSE_FILES = LICENSE.md
 SUDO_CPE_ID_VERSION = $(SUDO_VERSION_MAJOR)
 SUDO_CPE_ID_UPDATE = $(SUDO_VERSION_MINOR)
 SUDO_SELINUX_MODULES = sudo
+# We're patching configure.ac
+SUDO_AUTORECONF = YES
 # This is to avoid sudo's make install from chown()ing files which fails
 SUDO_INSTALL_TARGET_OPTS = INSTALL_OWNER="" DESTDIR="$(TARGET_DIR)" install
 SUDO_CONF_OPTS = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
