Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91AE0CA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:28:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6812B60ED2;
	Sat, 10 Oct 2026 09:28:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iAWe085SMGqK; Sat, 10 Oct 2026 09:28:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 33AED60ED1
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624503;
	b=dzLMTLjhUBwW4xHBNLq4Y5yDvEE8UTIrnkDCPr50Qn50JXLhsVwp9iYua5qmalNs+c8s
	 AB5Uw2wclvc4QEgGiWE3AL1RKHz8KiOZSHtzGDHVzU8aVAtj7P+VWV/BdUn9GuAkwv1ZM
	 HsKab4OP8nCom4SA4UhbwsmkP64a0H9qENK5mzbVJajkkwm4c4Lqg0VmRSpog5jYNXL42
	 qri4FRasDepf+nDbkr2RkvBm04kghiXPOCENJmrVSOj2m+X3XGUQ8kKdo1oI0KBDX75Kq
	 AHqcr+pnDz1JRZX3j9GyshUhYQP53YPhAOzR4hiJ+h5t2Nh/nLVZVE849ywHf3NH60w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624503;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=7nwu8mSYn6jELFKi4EkwfZvdXVvpuli7zapoGRmNHQ8=;
	b=pYBS6LKVCwx7i3pMpvZsLwLj5Z7gBFORx9Rw/Nu+LbVreIoBPd64iSTyBthwqoELUh56
	 iQzGvc0rnjptUYjKkpnh9sPs36+uy2ksIdo3lyafqj/uoHfweXhHqUAGbudrP/3yVXlVM
	 Wz1zCshzBXdwWw5L+I9I0kB9hsopQ9uhNtNB23d1yZYEK4RH6ph279avuLpi+q6KE6bG7
	 l6z1O47w7DxMV4NohRAqMBgOEWGia4uC6yLTJa/FC8dKHUzoYLoKBXy5JtqC9a8kMB8zD
	 m1EAn+iijqNznxyxBCy2XbcInxQ0HqMTyWQb7K4A2u2CEcZhHJovH1RDT5RqVIVKszA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624503;
	bh=7nwu8mSYn6jELFKi4EkwfZvdXVvpuli7zapoGRmNHQ8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dncSKXmMeCIEPhzZ2yhAl/eoeRwXcLxBKXUf244CTXpxU2LviOZ1Lu4DRnh49rSSx
	 xehoATxdXd1bBW38UlQPqn+0cew3Vqw1HYrgrqF2VrnyJWt4bUpKoaapQvdNy2juS6
	 49m/KScpiNfoRRcC4oe+O6x0YfWB/HtABa/QjQmhUpW6OA6G+eV2Xymf++Nw8p131O
	 I9IsdghcbZWIfkS/uOQeoh1lyKhSiR9z4jF5LxAO8x03N6Gu5qBe4WarPfm2L5ZU4r
	 c8/CSa8hU3GL4Vo64M0ma9j+sAyoVyMJiEtXyWIxzbLwQT56t/NaBfjWn7atJw6bVC
	 YdP52tkGKKNkg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33AED60ED1;
	Sat, 10 Oct 2026 09:28:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 50CBBA64
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3558980F85
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id if6IhScqrtMP for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:27:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 33000811EE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624442;
 b=EPj2emOrpXIOrcL6gJefdZC9tAI3AgV4HTeaWfRd3bEbyQuRxlvRdYDTZurIR3mHnpRa
 sDsT1ubkFUFQeYlz1h2w+fkowTDKBewBloAsWEmHfFFqhpcefxUiyopIbcg75fk2EcfFe
 x2mQlEYwl9DxmU2vFf9BeINhgOyc8U6zTrnW711QdVZj18DEJadC3SUZ2ZQ0Serdaz5sy
 9UM1qWh93Keo5Rzs+Ic2tXAq2sSXY44gSeOQAVbfxO19GzDpk9N86awxWqkWBmIo2XvTH
 bc96RBAyCbMKbaGMTpjnlfzSPsFitKz3ihLlS95Mz8OsiVr7TZA2dBJ8HuyP8rJLFrQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624442;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=nU5Kindn0FSDjmJQpK4NpAGGGLLDZko30uRp3LhSVxg=;
 b=G1iKxmNwY7SUp3AhcvEFIgtut1pAS9/zUd0Le/7tHhrVWF0zfP8BLwb9EzzKS2EU8hzs
 dK4CUG9Htnt5IabUvbLB3oD0KM73gpZ5hY2XwG/5SdMxSW640KgDzGK4Jg94zzMv3O+Zx
 tmtAPDGtZXPVTzMpcwOKqNSAEE35CeLjymmjyGFjeuJ8IP6OgMw8xiUE/EHxps+mdwdwd
 CJOpZG80GT5nc3e+maqBR8RGeCIItCfeKfZNn39+PRa1UvR0VBMXPgvDfrcAr7K4RsAKl
 G/H+Hw0a16minB5iCqQ46gCFIMwRY/f0XNkC1x7cZfEZVXZbDcemQKkMmtLuYFAw36Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 33000811EE
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1BF8C8F0B1; Sat, 10 Oct 2026 09:26:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 8 Oct 2026 12:08:26 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: c2d96727116dec1b776a6f7633548406a549642e
X-Git-Newrev: 92452d71685d2ee0dbb1d1b3842dc23c4ab78c60
X-Patchwork-Hint: ignore
Message-Id: <20261010092604.1BF8C8F0B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/tcpreplay:
 security bump to version 4.6.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1724166967577486716=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1724166967577486716==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/92452d71685d2ee0dbb1d1b3842dc23c4ab78c60
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Fixes the following security issues:

4.5.4: GHSA-2wmf-4p77-784q, GHSA-5cjx-62pj-pmgq, GHSA-pfqg-243f-8q25,
       GHSA-pjh6-6hrw-vcwr, GHSA-ww62-mxv7-pg55
4.5.5: GHSA-27v4-xhfx-g2rx, GHSA-777w-9599-w8g4, GHSA-jj65-mrgg-f5fx,
       GHSA-m655-53p4-6qm8, GHSA-p7xp-4gj2-x56c, GHSA-v8c4-9w98-9v6v
4.6.0: GHSA-5q26-7fxx-v8fh, GHSA-fwcr-mqg6-hqmx, GHSA-m6w7-8497-g9c9
4.6.1: GHSA-4hqm-8v2c-9pwj, GHSA-p3f2-88rg-9mch, GHSA-pmmx-m8p5-969j

Release notes:
https://github.com/appneta/tcpreplay/releases/tag/v4.5.3
https://github.com/appneta/tcpreplay/releases/tag/v4.5.4
https://github.com/appneta/tcpreplay/releases/tag/v4.5.5
https://github.com/appneta/tcpreplay/releases/tag/v4.6.0
https://github.com/appneta/tcpreplay/releases/tag/v4.6.1

Since 4.6.0, CMake is upstream's recommended build system, so convert
the package to it. The option parsers, tcpedit_stub.h and man pages
are pre-generated in the release tarball, so disable autogen, python3
and asciidoctor to not depend on what's installed on the host.

Add patches to:
- make WITH_TCPDUMP work when cross compiling
- find fts_read() in musl-fts' libfts (replaces passing -lfts)
- fix a struct ethhdr redefinition in txring.h with musl

TX_RING support, which is always detected on Linux, unconditionally
uses pthreads, so add a dependency on BR2_TOOLCHAIN_HAS_THREADS.

Fixes:
https://autobuild.buildroot.org/results/1db3e924c659c8edff026568ffbfc576d5222db9

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 6ffe6f923cb9ae634934a8ecad329b60f0f7d35d)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 ...ix-tcpdump-detection-when-cross-compiling.patch | 43 ++++++++++++
 .../0002-build-look-for-fts_read-in-libfts.patch   | 77 ++++++++++++++++++++++
 .../0003-txring.h-fix-build-with-musl.patch        | 41 ++++++++++++
 package/tcpreplay/Config.in                        |  5 ++
 package/tcpreplay/tcpreplay.hash                   |  4 +-
 package/tcpreplay/tcpreplay.mk                     | 33 ++++++----
 6 files changed, 187 insertions(+), 16 deletions(-)

diff --git a/package/tcpreplay/0001-cmake-fix-tcpdump-detection-when-cross-compiling.patch b/package/tcpreplay/0001-cmake-fix-tcpdump-detection-when-cross-compiling.patch
new file mode 100644
index 0000000000..efcc291636
--- /dev/null
+++ b/package/tcpreplay/0001-cmake-fix-tcpdump-detection-when-cross-compiling.patch
@@ -0,0 +1,43 @@
+From d7e8593b515e53f6f6b7e2df496955568146ecdd Mon Sep 17 00:00:00 2001
+From: Yegor Yefremov <yegorslists@googlemail.com>
+Date: Tue, 29 Sep 2026 11:21:30 +0200
+Subject: [PATCH] cmake: fix tcpdump detection when cross compiling
+
+WITH_TCPDUMP names the tcpdump binary on the machine tcpreplay will run
+on. When cross compiling, that path doesn't exist on the build machine,
+so the EXISTS check always fails and --verbose gets disabled.
+
+Trust WITH_TCPDUMP when cross compiling, and accept WITH_TCPDUMP=no
+(like WITH_LIBDNET=no) to skip the host find_program() lookup, which
+would otherwise pick up the build machine's tcpdump.
+
+Upstream: https://github.com/appneta/tcpreplay/pull/1152
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+Assisted-by: Claude:claude-opus-5-5
+---
+ cmake/OptionalDeps.cmake | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/cmake/OptionalDeps.cmake b/cmake/OptionalDeps.cmake
+index 6c73a20e..5239630a 100644
+--- a/cmake/OptionalDeps.cmake
++++ b/cmake/OptionalDeps.cmake
+@@ -177,12 +177,16 @@ endif()
+ # tcpdump binary (--with-tcpdump → WITH_TCPDUMP)
+ # ---------------------------------------------------------------------------
+ set(HAVE_TCPDUMP "")
+-if(WITH_TCPDUMP)
++if(WITH_TCPDUMP STREQUAL "no")
++    set(TCPDUMP_PATH "")
++elseif(WITH_TCPDUMP)
+     set(TCPDUMP_PATH ${WITH_TCPDUMP})
+ else()
+     find_program(TCPDUMP_PATH tcpdump PATHS /usr/sbin /sbin /usr/local/sbin)
+ endif()
+-if(TCPDUMP_PATH AND EXISTS ${TCPDUMP_PATH})
++# When cross compiling, WITH_TCPDUMP is a path on the target, which can't
++# be checked for existence on the build machine.
++if(TCPDUMP_PATH AND (EXISTS "${TCPDUMP_PATH}" OR (CMAKE_CROSSCOMPILING AND WITH_TCPDUMP)))
+     set(HAVE_TCPDUMP 1)
+     message(STATUS "Using tcpdump in ${TCPDUMP_PATH}")
+ else()
diff --git a/package/tcpreplay/0002-build-look-for-fts_read-in-libfts.patch b/package/tcpreplay/0002-build-look-for-fts_read-in-libfts.patch
new file mode 100644
index 0000000000..ce5344316e
--- /dev/null
+++ b/package/tcpreplay/0002-build-look-for-fts_read-in-libfts.patch
@@ -0,0 +1,77 @@
+From a829c8a247cfb688f6c2103d750f72a1f0fc348a Mon Sep 17 00:00:00 2001
+From: Yegor Yefremov <yegorslists@googlemail.com>
+Date: Tue, 29 Sep 2026 11:33:40 +0200
+Subject: [PATCH] build: look for fts_read() in libfts
+
+On musl and uClibc, fts_*() is not part of the C library but provided
+by the standalone musl-fts library (libfts). Look for it there when
+it's neither in libc nor in libbsd, in both configure.ac and CMake.
+
+Without this, cross builds against these C libraries have to pass
+-lfts by hand, and with CMake that doesn't work for static builds, as
+CMAKE_EXE_LINKER_FLAGS ends up before the objects on the link line:
+
+  tcpreplay.c:(.text.startup+0x1e8): undefined reference to `fts_open'
+
+Upstream: https://github.com/appneta/tcpreplay/pull/1153
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+Assisted-by: Claude:claude-opus-5-5
+---
+ cmake/ConfigureChecks.cmake | 7 ++++++-
+ cmake/config.h.cmake        | 3 +++
+ configure.ac                | 5 +++--
+ 3 files changed, 12 insertions(+), 3 deletions(-)
+
+diff --git a/cmake/ConfigureChecks.cmake b/cmake/ConfigureChecks.cmake
+index 5b829a5d..b8c81aeb 100644
+--- a/cmake/ConfigureChecks.cmake
++++ b/cmake/ConfigureChecks.cmake
+@@ -365,12 +365,17 @@ if(NOT HAVE_INET_ADDR)
+     message(FATAL_ERROR "We need inet_addr.  See bug 26")
+ endif()
+ 
+-# Haiku: fts_*() lives in libbsd
++# Haiku: fts_*() lives in libbsd; musl and uClibc: in the standalone libfts
+ check_function_exists(fts_read HAVE_FTS_READ)
+ if(NOT HAVE_FTS_READ)
+     check_library_exists(bsd fts_read "" HAVE_LIBBSD)
+     if(HAVE_LIBBSD)
+         list(APPEND TCPR_SYSTEM_LIBS bsd)
++    else()
++        check_library_exists(fts fts_read "" HAVE_LIBFTS)
++        if(HAVE_LIBFTS)
++            list(APPEND TCPR_SYSTEM_LIBS fts)
++        endif()
+     endif()
+ endif()
+ 
+diff --git a/cmake/config.h.cmake b/cmake/config.h.cmake
+index 15531ca3..12084d28 100644
+--- a/cmake/config.h.cmake
++++ b/cmake/config.h.cmake
+@@ -232,6 +232,9 @@
+ /* Do we have libdnet? */
+ #cmakedefine HAVE_LIBDNET @HAVE_LIBDNET@
+ 
++/* Define to 1 if you have the 'fts' library (-lfts). */
++#cmakedefine HAVE_LIBFTS @HAVE_LIBFTS@
++
+ /* Define to 1 if you have the 'gen' library (-lgen). */
+ #cmakedefine HAVE_LIBGEN @HAVE_LIBGEN@
+ 
+diff --git a/configure.ac b/configure.ac
+index 20e4f465..00fd13bd 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -718,8 +718,9 @@ if test x$inet_addr = xno ; then
+     AC_MSG_ERROR([We need inet_addr.  See bug 26])
+ fi
+ 
+-dnl On Haiku fts_*() functions are in libbsd.
+-AC_CHECK_FUNC(fts_read,,[AC_CHECK_LIB(bsd, fts_read)])
++dnl On Haiku fts_*() functions are in libbsd, on musl and uClibc in the
++dnl standalone libfts (musl-fts).
++AC_CHECK_FUNC(fts_read,,[AC_CHECK_LIB(bsd, fts_read,,[AC_CHECK_LIB(fts, fts_read)])])
+ 
+ dnl #####################################################
+ dnl Checks for tuntap device support
diff --git a/package/tcpreplay/0003-txring.h-fix-build-with-musl.patch b/package/tcpreplay/0003-txring.h-fix-build-with-musl.patch
new file mode 100644
index 0000000000..6bbe2314e2
--- /dev/null
+++ b/package/tcpreplay/0003-txring.h-fix-build-with-musl.patch
@@ -0,0 +1,41 @@
+From da763d37b2b275ef977e5a9bf4424bbe1fb2b22d Mon Sep 17 00:00:00 2001
+From: Yegor Yefremov <yegorslists@googlemail.com>
+Date: Tue, 29 Sep 2026 11:33:40 +0200
+Subject: [PATCH] txring.h: fix build with musl
+
+Commit 78076385 ("txring: fix __GLIBC_MINOR typo and include the header
+that defines the TX_RING API (#1043)") made the libc check work, so
+non-glibc C libraries now include <linux/if_ether.h>. On musl, that
+clashes with <netinet/if_ether.h>, included later via sendpacket.h:
+
+  netinet/if_ether.h:122:1: error: redefinition of struct or union 'struct ethhdr'
+
+<net/ethernet.h> is available on all Linux C libraries, so use it
+unconditionally.
+
+Upstream: https://github.com/appneta/tcpreplay/pull/1154
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+Assisted-by: Claude:claude-opus-5-5
+---
+ src/common/txring.h | 6 ------
+ 1 file changed, 6 deletions(-)
+
+diff --git a/src/common/txring.h b/src/common/txring.h
+index 59dabd1a..0c1e4bfd 100644
+--- a/src/common/txring.h
++++ b/src/common/txring.h
+@@ -38,14 +38,8 @@
+ 
+ #ifdef HAVE_TX_RING
+ 
+-#if __GLIBC__ >= 2 && __GLIBC_MINOR__ >= 1
+ #include <net/ethernet.h> /* the L2 protocols */
+ #include <linux/if_packet.h>
+-#else
+-#include <asm/types.h>
+-#include <linux/if_ether.h> /* The L2 protocols */
+-#include <linux/if_packet.h>
+-#endif
+ #include <pthread.h>
+ 
+ struct txring_s {
diff --git a/package/tcpreplay/Config.in b/package/tcpreplay/Config.in
index 9e5509114e..dc3645dce6 100644
--- a/package/tcpreplay/Config.in
+++ b/package/tcpreplay/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_TCPREPLAY
 	bool "tcpreplay"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_LIBPCAP
 	select BR2_PACKAGE_MUSL_FTS if !BR2_TOOLCHAIN_USES_GLIBC
 	help
@@ -8,3 +9,7 @@ config BR2_PACKAGE_TCPREPLAY
 	  saved with tcpdump or other tools which write pcap(3) files.
 
 	  http://tcpreplay.appneta.com/
+
+comment "tcpreplay needs a toolchain w/ threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/tcpreplay/tcpreplay.hash b/package/tcpreplay/tcpreplay.hash
index 4307fa60fc..023830f9a5 100644
--- a/package/tcpreplay/tcpreplay.hash
+++ b/package/tcpreplay/tcpreplay.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://github.com/appneta/tcpreplay/releases/download/v4.5.2/tcpreplay-4.5.2.tar.xz.asc
+# https://github.com/appneta/tcpreplay/releases/download/v4.6.1/tcpreplay-4.6.1.tar.xz.asc
 # using key 84E4FA215C934A7D97DC76D5E9E2149793BDE17E
-sha256  2df15bc6d49f96a77617d137049f998193bbae95c1a31b04ca02856a24cbf384  tcpreplay-4.5.2.tar.xz
+sha256  14b96e3565d6e66e813000d0d510afeaecb871f2b533182c391c6ccf948c3e21  tcpreplay-4.6.1.tar.xz
 sha256  07cf5e92d475287a7d1663b33097f40cae5adf03ed8920fcd4374e3dfb48c8ad  docs/LICENSE
diff --git a/package/tcpreplay/tcpreplay.mk b/package/tcpreplay/tcpreplay.mk
index 32bcf8d278..4a50e88aaf 100644
--- a/package/tcpreplay/tcpreplay.mk
+++ b/package/tcpreplay/tcpreplay.mk
@@ -4,40 +4,45 @@
 #
 ################################################################################
 
-TCPREPLAY_VERSION = 4.5.2
+TCPREPLAY_VERSION = 4.6.1
 TCPREPLAY_SITE = https://github.com/appneta/tcpreplay/releases/download/v$(TCPREPLAY_VERSION)
 TCPREPLAY_SOURCE = tcpreplay-$(TCPREPLAY_VERSION).tar.xz
 TCPREPLAY_LICENSE = GPL-3.0
 TCPREPLAY_LICENSE_FILES = docs/LICENSE
 TCPREPLAY_CPE_ID_VENDOR = broadcom
-TCPREPLAY_CONF_ENV = \
-	ac_cv_path_ac_pt_PCAP_CONFIG="$(STAGING_DIR)/usr/bin/pcap-config" \
-	LIBS="$(TCPREPLAY_LIBS)"
-TCPREPLAY_CONF_OPTS = --with-libpcap=$(STAGING_DIR)/usr \
-	--enable-pcapconfig
 TCPREPLAY_DEPENDENCIES = libpcap
+# The option parsers, tcpedit_stub.h and man pages are pre-generated in
+# the release tarball, so don't use autogen, python3 or asciidoctor from
+# the host.
+TCPREPLAY_CONF_OPTS = \
+	-DENABLE_PCAPCONFIG=ON \
+	-DPCAP_CONFIG_EXECUTABLE=$(STAGING_DIR)/usr/bin/pcap-config \
+	-DAUTOGEN_EXECUTABLE=OFF \
+	-DPYTHON3_EXECUTABLE=OFF \
+	-DASCIIDOCTOR_EXECUTABLE=OFF \
+	-DPCAPNAV_CONFIG_EXECUTABLE=OFF
 
 ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),)
 TCPREPLAY_DEPENDENCIES += musl-fts
-TCPREPLAY_LIBS += -lfts
 endif
 
 ifeq ($(BR2_STATIC_LIBS),y)
-TCPREPLAY_CONF_OPTS += --enable-dynamic-link=no
-TCPREPLAY_LIBS += `$(STAGING_DIR)/usr/bin/pcap-config --static --libs`
+TCPREPLAY_CONF_OPTS += -DENABLE_STATIC_LINK=ON
+else
+TCPREPLAY_CONF_OPTS += -DENABLE_STATIC_LINK=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_LIBDNET),y)
 TCPREPLAY_DEPENDENCIES += libdnet
-TCPREPLAY_CONF_OPTS += --with-libdnet=$(STAGING_DIR)/usr
+TCPREPLAY_CONF_OPTS += -DWITH_LIBDNET=$(STAGING_DIR)/usr
 else
-TCPREPLAY_CONF_OPTS += --without-libdnet
+TCPREPLAY_CONF_OPTS += -DWITH_LIBDNET=no
 endif
 
 ifeq ($(BR2_PACKAGE_TCPDUMP),y)
-TCPREPLAY_CONF_ENV += ac_cv_path_tcpdump_path=/usr/sbin/tcpdump
+TCPREPLAY_CONF_OPTS += -DWITH_TCPDUMP=/usr/sbin/tcpdump
 else
-TCPREPLAY_CONF_ENV += ac_cv_path_tcpdump_path=no
+TCPREPLAY_CONF_OPTS += -DWITH_TCPDUMP=no
 endif
 
-$(eval $(autotools-package))
+$(eval $(cmake-package))

--===============1724166967577486716==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1724166967577486716==--
