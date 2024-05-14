Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61060C04FFE
	for <buildroot@archiver.kernel.org>; Tue, 14 May 2024 08:21:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1DADB4086D;
	Tue, 14 May 2024 08:21:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vTs3ozD5EhXq; Tue, 14 May 2024 08:21:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1786407FA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1786407FA;
	Tue, 14 May 2024 08:21:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1786C1BF2FD
 for <buildroot@lists.busybox.net>; Tue, 14 May 2024 08:21:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ED630407B9
 for <buildroot@lists.busybox.net>; Tue, 14 May 2024 08:21:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dy5384PkLLC1 for <buildroot@lists.busybox.net>;
 Tue, 14 May 2024 08:21:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 57D95407FA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57D95407FA
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 57D95407FA
 for <buildroot@buildroot.org>; Tue, 14 May 2024 08:21:40 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 585C03521163; Tue, 14 May 2024 10:21:38 +0200 (CEST)
Date: Tue, 14 May 2024 10:21:38 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZkMfEjaEg7aqhZCH@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-27-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1715674898; bh=qqPg1edKxNMpvB88XzDxuvi+KlBBQhYHm/keQyIpl3I=;
 h=Date:From:To:Subject:From;
 b=hNfeNqnkD4DhKLppoYJ/D2oUU6cKiuejaqyi7hAgLwJZ6imjc+8IwlcZv9SP0Pg43
 EZmpXaVV995P0wiE4P6v4uu+FQuGrYCCI1FEuomK0yfcksMgpuGkDy5OgBX/Rr107R
 O8Ll6MsyuO/v/Csx51shxD9E7NxqX0gMO3hZ2ps1RkrQtFBQtoZ3Gjjh+uyeP37b3r
 KX96j4k2anfNepgC7t66w/qlqtBnOW9c4o5N3zIopfAD1mccgfMXFm+Cv32VRL4xgu
 OS8wvG++KI11LiZZ3jYjNBYbQdR6+8Mk2UJVF4h5KCmG8jrWL/zmkyz6oIkoDazf6t
 oqv0d3ScdS8xA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=hNfeNqnk
Subject: [Buildroot] [PATCH v2] support: update config.sub/config.guess
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This adds support for Loongarch64 support.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
v1->v2:
  add motivation requested by Thomas P.
---
 support/gnuconfig/README.buildroot |    2 +-
 support/gnuconfig/config.guess     | 1233 +++++++++++++++-------------
 support/gnuconfig/config.sub       |  302 +++++--
 3 files changed, 894 insertions(+), 643 deletions(-)

diff --git a/support/gnuconfig/README.buildroot b/support/gnuconfig/README.buildroot
index 952eea8b10..f34a6566bd 100644
--- a/support/gnuconfig/README.buildroot
+++ b/support/gnuconfig/README.buildroot
@@ -18,4 +18,4 @@ Run the script 'update' in this directory, and commit the result.
 The current Buildroot version is based on this commit of the config.git
 repository (leave alone on its own line, the script updates it):
 
-d7a4dee7cc25e332b990d0a6d9f0ddd42cb33cf5
+948ae97ca5703224bd3eada06b7a69f40dd15a02
diff --git a/support/gnuconfig/config.guess b/support/gnuconfig/config.guess
index 8d70ec2b26..f6d217a49f 100755
--- a/support/gnuconfig/config.guess
+++ b/support/gnuconfig/config.guess
@@ -1,12 +1,14 @@
 #! /bin/sh
 # Attempt to guess a canonical system name.
-#   Copyright 1992-2020 Free Software Foundation, Inc.
+#   Copyright 1992-2024 Free Software Foundation, Inc.
 
-timestamp='2020-09-19'
+# shellcheck disable=SC2006,SC2268 # see below for rationale
+
+timestamp='2024-01-01'
 
 # This file is free software; you can redistribute it and/or modify it
 # under the terms of the GNU General Public License as published by
-# the Free Software Foundation; either version 3 of the License, or
+# the Free Software Foundation, either version 3 of the License, or
 # (at your option) any later version.
 #
 # This program is distributed in the hope that it will be useful, but
@@ -27,17 +29,25 @@ timestamp='2020-09-19'
 # Originally written by Per Bothner; maintained since 2000 by Ben Elliston.
 #
 # You can get the latest version of this script from:
-# https://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.guess
+# https://git.savannah.gnu.org/cgit/config.git/plain/config.guess
 #
 # Please send patches to <config-patches@gnu.org>.
 
 
+# The "shellcheck disable" line above the timestamp inhibits complaints
+# about features and limitations of the classic Bourne shell that were
+# superseded or lifted in POSIX.  However, this script identifies a wide
+# variety of pre-POSIX systems that do not have POSIX shells at all, and
+# even some reasonably current systems (Solaris 10 as case-in-point) still
+# have a pre-POSIX /bin/sh.
+
+
 me=`echo "$0" | sed -e 's,.*/,,'`
 
 usage="\
 Usage: $0 [OPTION]
 
-Output the configuration name of the system \`$me' is run on.
+Output the configuration name of the system '$me' is run on.
 
 Options:
   -h, --help         print this help, then exit
@@ -50,13 +60,13 @@ version="\
 GNU config.guess ($timestamp)
 
 Originally written by Per Bothner.
-Copyright 1992-2020 Free Software Foundation, Inc.
+Copyright 1992-2024 Free Software Foundation, Inc.
 
 This is free software; see the source for copying conditions.  There is NO
 warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE."
 
 help="
-Try \`$me --help' for more information."
+Try '$me --help' for more information."
 
 # Parse command line
 while test $# -gt 0 ; do
@@ -84,13 +94,16 @@ if test $# != 0; then
   exit 1
 fi
 
+# Just in case it came from the environment.
+GUESS=
+
 # CC_FOR_BUILD -- compiler used by this script. Note that the use of a
 # compiler to aid in system detection is discouraged as it requires
 # temporary files to be created and, as you can see below, it is a
 # headache to deal with in a portable fashion.
 
-# Historically, `CC_FOR_BUILD' used to be named `HOST_CC'. We still
-# use `HOST_CC' if defined, but it is deprecated.
+# Historically, 'CC_FOR_BUILD' used to be named 'HOST_CC'. We still
+# use 'HOST_CC' if defined, but it is deprecated.
 
 # Portable tmp directory creation inspired by the Autoconf team.
 
@@ -102,7 +115,7 @@ set_cc_for_build() {
     # prevent multiple calls if $tmp is already set
     test "$tmp" && return 0
     : "${TMPDIR=/tmp}"
-    # shellcheck disable=SC2039
+    # shellcheck disable=SC2039,SC3028
     { tmp=`(umask 077 && mktemp -d "$TMPDIR/cgXXXXXX") 2>/dev/null` && test -n "$tmp" && test -d "$tmp" ; } ||
 	{ test -n "$RANDOM" && tmp=$TMPDIR/cg$$-$RANDOM && (umask 077 && mkdir "$tmp" 2>/dev/null) ; } ||
 	{ tmp=$TMPDIR/cg-$$ && (umask 077 && mkdir "$tmp" 2>/dev/null) && echo "Warning: creating insecure temp directory" >&2 ; } ||
@@ -112,7 +125,7 @@ set_cc_for_build() {
 	,,)    echo "int x;" > "$dummy.c"
 	       for driver in cc gcc c89 c99 ; do
 		   if ($driver -c -o "$dummy.o" "$dummy.c") >/dev/null 2>&1 ; then
-		       CC_FOR_BUILD="$driver"
+		       CC_FOR_BUILD=$driver
 		       break
 		   fi
 	       done
@@ -133,38 +146,57 @@ fi
 
 UNAME_MACHINE=`(uname -m) 2>/dev/null` || UNAME_MACHINE=unknown
 UNAME_RELEASE=`(uname -r) 2>/dev/null` || UNAME_RELEASE=unknown
-UNAME_SYSTEM=`(uname -s) 2>/dev/null`  || UNAME_SYSTEM=unknown
+UNAME_SYSTEM=`(uname -s) 2>/dev/null` || UNAME_SYSTEM=unknown
 UNAME_VERSION=`(uname -v) 2>/dev/null` || UNAME_VERSION=unknown
 
-case "$UNAME_SYSTEM" in
+case $UNAME_SYSTEM in
 Linux|GNU|GNU/*)
-	# If the system lacks a compiler, then just pick glibc.
-	# We could probably try harder.
-	LIBC=gnu
+	LIBC=unknown
 
 	set_cc_for_build
 	cat <<-EOF > "$dummy.c"
+	#if defined(__ANDROID__)
+	LIBC=android
+	#else
 	#include <features.h>
 	#if defined(__UCLIBC__)
 	LIBC=uclibc
 	#elif defined(__dietlibc__)
 	LIBC=dietlibc
+	#elif defined(__GLIBC__)
+	LIBC=gnu
+	#elif defined(__LLVM_LIBC__)
+	LIBC=llvm
 	#else
 	#include <stdarg.h>
+	/* First heuristic to detect musl libc.  */
 	#ifdef __DEFINED_va_list
 	LIBC=musl
-	#else
-	LIBC=gnu
+	#endif
 	#endif
 	#endif
 	EOF
-	eval "`$CC_FOR_BUILD -E "$dummy.c" 2>/dev/null | grep '^LIBC' | sed 's, ,,g'`"
+	cc_set_libc=`$CC_FOR_BUILD -E "$dummy.c" 2>/dev/null | grep '^LIBC' | sed 's, ,,g'`
+	eval "$cc_set_libc"
+
+	# Second heuristic to detect musl libc.
+	if [ "$LIBC" = unknown ] &&
+	   command -v ldd >/dev/null &&
+	   ldd --version 2>&1 | grep -q ^musl; then
+		LIBC=musl
+	fi
+
+	# If the system lacks a compiler, then just pick glibc.
+	# We could probably try harder.
+	if [ "$LIBC" = unknown ]; then
+		LIBC=gnu
+	fi
 	;;
 esac
 
 # Note: order is significant - the case branches are not exclusive.
 
-case "$UNAME_MACHINE:$UNAME_SYSTEM:$UNAME_RELEASE:$UNAME_VERSION" in
+case $UNAME_MACHINE:$UNAME_SYSTEM:$UNAME_RELEASE:$UNAME_VERSION in
     *:NetBSD:*:*)
 	# NetBSD (nbsd) targets should (where applicable) match one or
 	# more of the tuples: *-*-netbsdelf*, *-*-netbsdaout*,
@@ -176,12 +208,12 @@ case "$UNAME_MACHINE:$UNAME_SYSTEM:$UNAME_RELEASE:$UNAME_VERSION" in
 	#
 	# Note: NetBSD doesn't particularly care about the vendor
 	# portion of the name.  We always set it to "unknown".
-	sysctl="sysctl -n hw.machine_arch"
 	UNAME_MACHINE_ARCH=`(uname -p 2>/dev/null || \
-	    "/sbin/$sysctl" 2>/dev/null || \
-	    "/usr/sbin/$sysctl" 2>/dev/null || \
+	    /sbin/sysctl -n hw.machine_arch 2>/dev/null || \
+	    /usr/sbin/sysctl -n hw.machine_arch 2>/dev/null || \
 	    echo unknown)`
-	case "$UNAME_MACHINE_ARCH" in
+	case $UNAME_MACHINE_ARCH in
+	    aarch64eb) machine=aarch64_be-unknown ;;
 	    armeb) machine=armeb-unknown ;;
 	    arm*) machine=arm-unknown ;;
 	    sh3el) machine=shl-unknown ;;
@@ -190,13 +222,13 @@ case "$UNAME_MACHINE:$UNAME_SYSTEM:$UNAME_RELEASE:$UNAME_VERSION" in
 	    earmv*)
 		arch=`echo "$UNAME_MACHINE_ARCH" | sed -e 's,^e\(armv[0-9]\).*$,\1,'`
 		endian=`echo "$UNAME_MACHINE_ARCH" | sed -ne 's,^.*\(eb\)$,\1,p'`
-		machine="${arch}${endian}"-unknown
+		machine=${arch}${endian}-unknown
 		;;
-	    *) machine="$UNAME_MACHINE_ARCH"-unknown ;;
+	    *) machine=$UNAME_MACHINE_ARCH-unknown ;;
 	esac
 	# The Operating System including object format, if it has switched
 	# to ELF recently (or will in the future) and ABI.
-	case "$UNAME_MACHINE_ARCH" in
+	case $UNAME_MACHINE_ARCH in
 	    earm*)
 		os=netbsdelf
 		;;
@@ -217,7 +249,7 @@ case "$UNAME_MACHINE:$UNAME_SYSTEM:$UNAME_RELEASE:$UNAME_VERSION" in
 		;;
 	esac
 	# Determine ABI tags.
-	case "$UNAME_MACHINE_ARCH" in
+	case $UNAME_MACHINE_ARCH in
 	    earm*)
 		expr='s/^earmv[0-9]/-eabi/;s/eb$//'
 		abi=`echo "$UNAME_MACHINE_ARCH" | sed -e "$expr"`
@@ -228,7 +260,7 @@ case "$UNAME_MACHINE:$UNAME_SYSTEM:$UNAME_RELEASE:$UNAME_VERSION" in
 	# thus, need a distinct triplet. However, they do not need
 	# kernel version information, so it can be replaced with a
 	# suitable tag, in the style of linux-gnu.
-	case "$UNAME_VERSION" in
+	case $UNAME_VERSION in
 	    Debian*)
 		release='-gnu'
 		;;
@@ -239,51 +271,57 @@ case "$UNAME_MACHINE:$UNAME_SYSTEM:$UNAME_RELEASE:$UNAME_VERSION" in
 	# Since CPU_TYPE-MANUFACTURER-KERNEL-OPERATING_SYSTEM:
 	# contains redundant information, the shorter form:
 	# CPU_TYPE-MANUFACTURER-OPERATING_SYSTEM is used.
-	echo "$machine-${os}${release}${abi-}"
-	exit ;;
+	GUESS=$machine-${os}${release}${abi-}
+	;;
     *:Bitrig:*:*)
 	UNAME_MACHINE_ARCH=`arch | sed 's/Bitrig.//'`
-	echo "$UNAME_MACHINE_ARCH"-unknown-bitrig"$UNAME_RELEASE"
-	exit ;;
+	GUESS=$UNAME_MACHINE_ARCH-unknown-bitrig$UNAME_RELEASE
+	;;
     *:OpenBSD:*:*)
 	UNAME_MACHINE_ARCH=`arch | sed 's/OpenBSD.//'`
-	echo "$UNAME_MACHINE_ARCH"-unknown-openbsd"$UNAME_RELEASE"
-	exit ;;
+	GUESS=$UNAME_MACHINE_ARCH-unknown-openbsd$UNAME_RELEASE
+	;;
+    *:SecBSD:*:*)
+	UNAME_MACHINE_ARCH=`arch | sed 's/SecBSD.//'`
+	GUESS=$UNAME_MACHINE_ARCH-unknown-secbsd$UNAME_RELEASE
+	;;
     *:LibertyBSD:*:*)
 	UNAME_MACHINE_ARCH=`arch | sed 's/^.*BSD\.//'`
-	echo "$UNAME_MACHINE_ARCH"-unknown-libertybsd"$UNAME_RELEASE"
-	exit ;;
+	GUESS=$UNAME_MACHINE_ARCH-unknown-libertybsd$UNAME_RELEASE
+	;;
     *:MidnightBSD:*:*)
-	echo "$UNAME_MACHINE"-unknown-midnightbsd"$UNAME_RELEASE"
-	exit ;;
+	GUESS=$UNAME_MACHINE-unknown-midnightbsd$UNAME_RELEASE
+	;;
     *:ekkoBSD:*:*)
-	echo "$UNAME_MACHINE"-unknown-ekkobsd"$UNAME_RELEASE"
-	exit ;;
+	GUESS=$UNAME_MACHINE-unknown-ekkobsd$UNAME_RELEASE
+	;;
     *:SolidBSD:*:*)
-	echo "$UNAME_MACHINE"-unknown-solidbsd"$UNAME_RELEASE"
-	exit ;;
+	GUESS=$UNAME_MACHINE-unknown-solidbsd$UNAME_RELEASE
+	;;
     *:OS108:*:*)
-	echo "$UNAME_MACHINE"-unknown-os108_"$UNAME_RELEASE"
-	exit ;;
+	GUESS=$UNAME_MACHINE-unknown-os108_$UNAME_RELEASE
+	;;
     macppc:MirBSD:*:*)
-	echo powerpc-unknown-mirbsd"$UNAME_RELEASE"
-	exit ;;
+	GUESS=powerpc-unknown-mirbsd$UNAME_RELEASE
+	;;
     *:MirBSD:*:*)
-	echo "$UNAME_MACHINE"-unknown-mirbsd"$UNAME_RELEASE"
-	exit ;;
+	GUESS=$UNAME_MACHINE-unknown-mirbsd$UNAME_RELEASE
+	;;
     *:Sortix:*:*)
-	echo "$UNAME_MACHINE"-unknown-sortix
-	exit ;;
+	GUESS=$UNAME_MACHINE-unknown-sortix
+	;;
     *:Twizzler:*:*)
-	echo "$UNAME_MACHINE"-unknown-twizzler
-	exit ;;
+	GUESS=$UNAME_MACHINE-unknown-twizzler
+	;;
     *:Redox:*:*)
-	echo "$UNAME_MACHINE"-unknown-redox
-	exit ;;
+	GUESS=$UNAME_MACHINE-unknown-redox
+	;;
     mips:OSF1:*.*)
-	echo mips-dec-osf1
-	exit ;;
+	GUESS=mips-dec-osf1
+	;;
     alpha:OSF1:*:*)
+	# Reset EXIT trap before exiting to avoid spurious non-zero exit code.
+	trap '' 0
 	case $UNAME_RELEASE in
 	*4.0)
 		UNAME_RELEASE=`/usr/sbin/sizer -v | awk '{print $3}'`
@@ -297,7 +335,7 @@ case "$UNAME_MACHINE:$UNAME_SYSTEM:$UNAME_RELEASE:$UNAME_VERSION" in
 	# covers most systems running today.  This code pipes the CPU
 	# types through head -n 1, so we only detect the type of CPU 0.
 	ALPHA_CPU_TYPE=`/usr/sbin/psrinfo -v | sed -n -e 's/^  The alpha \(.*\) processor.*$/\1/p' | head -n 1`
-	case "$ALPHA_CPU_TYPE" in
+	case $ALPHA_CPU_TYPE in
 	    "EV4 (21064)")
 		UNAME_MACHINE=alpha ;;
 	    "EV4.5 (21064)")
@@ -334,68 +372,69 @@ case "$UNAME_MACHINE:$UNAME_SYSTEM:$UNAME_RELEASE:$UNAME_VERSION" in
 	# A Tn.n version is a released field test version.
 	# A Xn.n version is an unreleased experimental baselevel.
 	# 1.2 uses "1.2" for uname -r.
-	echo "$UNAME_MACHINE"-dec-osf"`echo "$UNAME_RELEASE" | sed -e 's/^[PVTX]//' | tr ABCDEFGHIJKLMNOPQRSTUVWXYZ abcdefghijklmnopqrstuvwxyz`"
-	# Reset EXIT trap before exiting to avoid spurious non-zero exit code.
-	exitcode=$?
-	trap '' 0
-	exit $exitcode ;;
+	OSF_REL=`echo "$UNAME_RELEASE" | sed -e 's/^[PVTX]//' | tr ABCDEFGHIJKLMNOPQRSTUVWXYZ abcdefghijklmnopqrstuvwxyz`
+	GUESS=$UNAME_MACHINE-dec-osf$OSF_REL
+	;;
     Amiga*:UNIX_System_V:4.0:*)
-	echo m68k-unknown-sysv4
-	exit ;;
+	GUESS=m68k-unknown-sysv4
+	;;
     *:[Aa]miga[Oo][Ss]:*:*)
-	echo "$UNAME_MACHINE"-unknown-amigaos
-	exit ;;
+	GUESS=$UNAME_MACHINE-unknown-amigaos
+	;;
     *:[Mm]orph[Oo][Ss]:*:*)
-	echo "$UNAME_MACHINE"-unknown-morphos
-	exit ;;
+	GUESS=$UNAME_MACHINE-unknown-morphos
+	;;
     *:OS/390:*:*)
-	echo i370-ibm-openedition
-	exit ;;
+	GUESS=i370-ibm-openedition
+	;;
     *:z/VM:*:*)
-	echo s390-ibm-zvmoe
-	exit ;;
+	GUESS=s390-ibm-zvmoe
+	;;
     *:OS400:*:*)
-	echo powerpc-ibm-os400
-	exit ;;
+	GUESS=powerpc-ibm-os400
+	;;
     arm:RISC*:1.[012]*:*|arm:riscix:1.[012]*:*)
-	echo arm-acorn-riscix"$UNAME_RELEASE"
-	exit ;;
+	GUESS=arm-acorn-riscix$UNAME_RELEASE
+	;;
     arm*:riscos:*:*|arm*:RISCOS:*:*)
-	echo arm-unknown-riscos
-	exit ;;
+	GUESS=arm-unknown-riscos
+	;;
     SR2?01:HI-UX/MPP:*:* | SR8000:HI-UX/MPP:*:*)
-	echo hppa1.1-hitachi-hiuxmpp
-	exit ;;
+	GUESS=hppa1.1-hitachi-hiuxmpp
+	;;
     Pyramid*:OSx*:*:* | MIS*:OSx*:*:* | MIS*:SMP_DC-OSx*:*:*)
 	# akee@wpdis03.wpafb.af.mil (Earle F. Ake) contributed MIS and NILE.
-	if test "`(/bin/universe) 2>/dev/null`" = att ; then
-		echo pyramid-pyramid-sysv3
-	else
-		echo pyramid-pyramid-bsd
-	fi
-	exit ;;
+	case `(/bin/universe) 2>/dev/null` in
+	    att) GUESS=pyramid-pyramid-sysv3 ;;
+	    *)   GUESS=pyramid-pyramid-bsd   ;;
+	esac
+	;;
     NILE*:*:*:dcosx)
-	echo pyramid-pyramid-svr4
-	exit ;;
+	GUESS=pyramid-pyramid-svr4
+	;;
     DRS?6000:unix:4.0:6*)
-	echo sparc-icl-nx6
-	exit ;;
+	GUESS=sparc-icl-nx6
+	;;
     DRS?6000:UNIX_SV:4.2*:7* | DRS?6000:isis:4.2*:7*)
 	case `/usr/bin/uname -p` in
-	    sparc) echo sparc-icl-nx7; exit ;;
-	esac ;;
+	    sparc) GUESS=sparc-icl-nx7 ;;
+	esac
+	;;
     s390x:SunOS:*:*)
-	echo "$UNAME_MACHINE"-ibm-solaris2"`echo "$UNAME_RELEASE" | sed -e 's/[^.]*//'`"
-	exit ;;
+	SUN_REL=`echo "$UNAME_RELEASE" | sed -e 's/[^.]*//'`
+	GUESS=$UNAME_MACHINE-ibm-solaris2$SUN_REL
+	;;
     sun4H:SunOS:5.*:*)
-	echo sparc-hal-solaris2"`echo "$UNAME_RELEASE"|sed -e 's/[^.]*//'`"
-	exit ;;
+	SUN_REL=`echo "$UNAME_RELEASE" | sed -e 's/[^.]*//'`
+	GUESS=sparc-hal-solaris2$SUN_REL
+	;;
     sun4*:SunOS:5.*:* | tadpole*:SunOS:5.*:*)
-	echo sparc-sun-solaris2"`echo "$UNAME_RELEASE" | sed -e 's/[^.]*//'`"
-	exit ;;
+	SUN_REL=`echo "$UNAME_RELEASE" | sed -e 's/[^.]*//'`
+	GUESS=sparc-sun-solaris2$SUN_REL
+	;;
     i86pc:AuroraUX:5.*:* | i86xen:AuroraUX:5.*:*)
-	echo i386-pc-auroraux"$UNAME_RELEASE"
-	exit ;;
+	GUESS=i386-pc-auroraux$UNAME_RELEASE
+	;;
     i86pc:SunOS:5.*:* | i86xen:SunOS:5.*:*)
 	set_cc_for_build
 	SUN_ARCH=i386
@@ -404,47 +443,50 @@ case "$UNAME_MACHINE:$UNAME_SYSTEM:$UNAME_RELEASE:$UNAME_VERSION" in
 	# This test works for both compilers.
 	if test "$CC_FOR_BUILD" != no_compiler_found; then
 	    if (echo '#ifdef __amd64'; echo IS_64BIT_ARCH; echo '#endif') | \
-		(CCOPTS="" $CC_FOR_BUILD -E - 2>/dev/null) | \
+		(CCOPTS="" $CC_FOR_BUILD -m64 -E - 2>/dev/null) | \
 		grep IS_64BIT_ARCH >/dev/null
 	    then
 		SUN_ARCH=x86_64
 	    fi
 	fi
-	echo "$SUN_ARCH"-pc-solaris2"`echo "$UNAME_RELEASE"|sed -e 's/[^.]*//'`"
-	exit ;;
+	SUN_REL=`echo "$UNAME_RELEASE" | sed -e 's/[^.]*//'`
+	GUESS=$SUN_ARCH-pc-solaris2$SUN_REL
+	;;
     sun4*:SunOS:6*:*)
 	# According to config.sub, this is the proper way to canonicalize
 	# SunOS6.  Hard to guess exactly what SunOS6 will be like, but
 	# it's likely to be more like Solaris than SunOS4.
-	echo sparc-sun-solaris3"`echo "$UNAME_RELEASE"|sed -e 's/[^.]*//'`"
-	exit ;;
+	SUN_REL=`echo "$UNAME_RELEASE" | sed -e 's/[^.]*//'`
+	GUESS=sparc-sun-solaris3$SUN_REL
+	;;
     sun4*:SunOS:*:*)
-	case "`/usr/bin/arch -k`" in
+	case `/usr/bin/arch -k` in
 	    Series*|S4*)
 		UNAME_RELEASE=`uname -v`
 		;;
 	esac
-	# Japanese Language versions have a version number like `4.1.3-JL'.
-	echo sparc-sun-sunos"`echo "$UNAME_RELEASE"|sed -e 's/-/_/'`"
-	exit ;;
+	# Japanese Language versions have a version number like '4.1.3-JL'.
+	SUN_REL=`echo "$UNAME_RELEASE" | sed -e 's/-/_/'`
+	GUESS=sparc-sun-sunos$SUN_REL
+	;;
     sun3*:SunOS:*:*)
-	echo m68k-sun-sunos"$UNAME_RELEASE"
-	exit ;;
+	GUESS=m68k-sun-sunos$UNAME_RELEASE
+	;;
     sun*:*:4.2BSD:*)
 	UNAME_RELEASE=`(sed 1q /etc/motd | awk '{print substr($5,1,3)}') 2>/dev/null`
 	test "x$UNAME_RELEASE" = x && UNAME_RELEASE=3
-	case "`/bin/arch`" in
+	case `/bin/arch` in
 	    sun3)
-		echo m68k-sun-sunos"$UNAME_RELEASE"
+		GUESS=m68k-sun-sunos$UNAME_RELEASE
 		;;
 	    sun4)
-		echo sparc-sun-sunos"$UNAME_RELEASE"
+		GUESS=sparc-sun-sunos$UNAME_RELEASE
 		;;
 	esac
-	exit ;;
+	;;
     aushp:SunOS:*:*)
-	echo sparc-auspex-sunos"$UNAME_RELEASE"
-	exit ;;
+	GUESS=sparc-auspex-sunos$UNAME_RELEASE
+	;;
     # The situation for MiNT is a little confusing.  The machine name
     # can be virtually everything (everything which is not
     # "atarist" or "atariste" at least should have a processor
@@ -454,41 +496,41 @@ case "$UNAME_MACHINE:$UNAME_SYSTEM:$UNAME_RELEASE:$UNAME_VERSION" in
     # MiNT.  But MiNT is downward compatible to TOS, so this should
     # be no problem.
     atarist[e]:*MiNT:*:* | atarist[e]:*mint:*:* | atarist[e]:*TOS:*:*)
-	echo m68k-atari-mint"$UNAME_RELEASE"
-	exit ;;
+	GUESS=m68k-atari-mint$UNAME_RELEASE
+	;;
     atari*:*MiNT:*:* | atari*:*mint:*:* | atarist[e]:*TOS:*:*)
-	echo m68k-atari-mint"$UNAME_RELEASE"
-	exit ;;
+	GUESS=m68k-atari-mint$UNAME_RELEASE
+	;;
     *falcon*:*MiNT:*:* | *falcon*:*mint:*:* | *falcon*:*TOS:*:*)
-	echo m68k-atari-mint"$UNAME_RELEASE"
-	exit ;;
+	GUESS=m68k-atari-mint$UNAME_RELEASE
+	;;
     milan*:*MiNT:*:* | milan*:*mint:*:* | *milan*:*TOS:*:*)
-	echo m68k-milan-mint"$UNAME_RELEASE"
-	exit ;;
+	GUESS=m68k-milan-mint$UNAME_RELEASE
+	;;
     hades*:*MiNT:*:* | hades*:*mint:*:* | *hades*:*TOS:*:*)
-	echo m68k-hades-mint"$UNAME_RELEASE"
-	exit ;;
+	GUESS=m68k-hades-mint$UNAME_RELEASE
+	;;
     *:*MiNT:*:* | *:*mint:*:* | *:*TOS:*:*)
-	echo m68k-unknown-mint"$UNAME_RELEASE"
-	exit ;;
+	GUESS=m68k-unknown-mint$UNAME_RELEASE
+	;;
     m68k:machten:*:*)
-	echo m68k-apple-machten"$UNAME_RELEASE"
-	exit ;;
+	GUESS=m68k-apple-machten$UNAME_RELEASE
+	;;
     powerpc:machten:*:*)
-	echo powerpc-apple-machten"$UNAME_RELEASE"
-	exit ;;
+	GUESS=powerpc-apple-machten$UNAME_RELEASE
+	;;
     RISC*:Mach:*:*)
-	echo mips-dec-mach_bsd4.3
-	exit ;;
+	GUESS=mips-dec-mach_bsd4.3
+	;;
     RISC*:ULTRIX:*:*)
-	echo mips-dec-ultrix"$UNAME_RELEASE"
-	exit ;;
+	GUESS=mips-dec-ultrix$UNAME_RELEASE
+	;;
     VAX*:ULTRIX*:*:*)
-	echo vax-dec-ultrix"$UNAME_RELEASE"
-	exit ;;
+	GUESS=vax-dec-ultrix$UNAME_RELEASE
+	;;
     2020:CLIX:*:* | 2430:CLIX:*:*)
-	echo clipper-intergraph-clix"$UNAME_RELEASE"
-	exit ;;
+	GUESS=clipper-intergraph-clix$UNAME_RELEASE
+	;;
     mips:*:*:UMIPS | mips:*:*:RISCos)
 	set_cc_for_build
 	sed 's/^	//' << EOF > "$dummy.c"
@@ -516,29 +558,29 @@ EOF
 	  dummyarg=`echo "$UNAME_RELEASE" | sed -n 's/\([0-9]*\).*/\1/p'` &&
 	  SYSTEM_NAME=`"$dummy" "$dummyarg"` &&
 	    { echo "$SYSTEM_NAME"; exit; }
-	echo mips-mips-riscos"$UNAME_RELEASE"
-	exit ;;
+	GUESS=mips-mips-riscos$UNAME_RELEASE
+	;;
     Motorola:PowerMAX_OS:*:*)
-	echo powerpc-motorola-powermax
-	exit ;;
+	GUESS=powerpc-motorola-powermax
+	;;
     Motorola:*:4.3:PL8-*)
-	echo powerpc-harris-powermax
-	exit ;;
+	GUESS=powerpc-harris-powermax
+	;;
     Night_Hawk:*:*:PowerMAX_OS | Synergy:PowerMAX_OS:*:*)
-	echo powerpc-harris-powermax
-	exit ;;
+	GUESS=powerpc-harris-powermax
+	;;
     Night_Hawk:Power_UNIX:*:*)
-	echo powerpc-harris-powerunix
-	exit ;;
+	GUESS=powerpc-harris-powerunix
+	;;
     m88k:CX/UX:7*:*)
-	echo m88k-harris-cxux7
-	exit ;;
+	GUESS=m88k-harris-cxux7
+	;;
     m88k:*:4*:R4*)
-	echo m88k-motorola-sysv4
-	exit ;;
+	GUESS=m88k-motorola-sysv4
+	;;
     m88k:*:3*:R3*)
-	echo m88k-motorola-sysv3
-	exit ;;
+	GUESS=m88k-motorola-sysv3
+	;;
     AViiON:dgux:*:*)
 	# DG/UX returns AViiON for all architectures
 	UNAME_PROCESSOR=`/usr/bin/uname -p`
@@ -547,44 +589,45 @@ EOF
 	    if test "$TARGET_BINARY_INTERFACE"x = m88kdguxelfx || \
 	       test "$TARGET_BINARY_INTERFACE"x = x
 	    then
-		echo m88k-dg-dgux"$UNAME_RELEASE"
+		GUESS=m88k-dg-dgux$UNAME_RELEASE
 	    else
-		echo m88k-dg-dguxbcs"$UNAME_RELEASE"
+		GUESS=m88k-dg-dguxbcs$UNAME_RELEASE
 	    fi
 	else
-	    echo i586-dg-dgux"$UNAME_RELEASE"
+	    GUESS=i586-dg-dgux$UNAME_RELEASE
 	fi
-	exit ;;
+	;;
     M88*:DolphinOS:*:*)	# DolphinOS (SVR3)
-	echo m88k-dolphin-sysv3
-	exit ;;
+	GUESS=m88k-dolphin-sysv3
+	;;
     M88*:*:R3*:*)
 	# Delta 88k system running SVR3
-	echo m88k-motorola-sysv3
-	exit ;;
+	GUESS=m88k-motorola-sysv3
+	;;
     XD88*:*:*:*) # Tektronix XD88 system running UTekV (SVR3)
-	echo m88k-tektronix-sysv3
-	exit ;;
+	GUESS=m88k-tektronix-sysv3
+	;;
     Tek43[0-9][0-9]:UTek:*:*) # Tektronix 4300 system running UTek (BSD)
-	echo m68k-tektronix-bsd
-	exit ;;
+	GUESS=m68k-tektronix-bsd
+	;;
     *:IRIX*:*:*)
-	echo mips-sgi-irix"`echo "$UNAME_RELEASE"|sed -e 's/-/_/g'`"
-	exit ;;
+	IRIX_REL=`echo "$UNAME_RELEASE" | sed -e 's/-/_/g'`
+	GUESS=mips-sgi-irix$IRIX_REL
+	;;
     ????????:AIX?:[12].1:2)   # AIX 2.2.1 or AIX 2.1.1 is RT/PC AIX.
-	echo romp-ibm-aix     # uname -m gives an 8 hex-code CPU id
-	exit ;;               # Note that: echo "'`uname -s`'" gives 'AIX '
+	GUESS=romp-ibm-aix    # uname -m gives an 8 hex-code CPU id
+	;;                    # Note that: echo "'`uname -s`'" gives 'AIX '
     i*86:AIX:*:*)
-	echo i386-ibm-aix
-	exit ;;
+	GUESS=i386-ibm-aix
+	;;
     ia64:AIX:*:*)
 	if test -x /usr/bin/oslevel ; then
 		IBM_REV=`/usr/bin/oslevel`
 	else
-		IBM_REV="$UNAME_VERSION.$UNAME_RELEASE"
+		IBM_REV=$UNAME_VERSION.$UNAME_RELEASE
 	fi
-	echo "$UNAME_MACHINE"-ibm-aix"$IBM_REV"
-	exit ;;
+	GUESS=$UNAME_MACHINE-ibm-aix$IBM_REV
+	;;
     *:AIX:2:3)
 	if grep bos325 /usr/include/stdio.h >/dev/null 2>&1; then
 		set_cc_for_build
@@ -601,16 +644,16 @@ EOF
 EOF
 		if $CC_FOR_BUILD -o "$dummy" "$dummy.c" && SYSTEM_NAME=`"$dummy"`
 		then
-			echo "$SYSTEM_NAME"
+			GUESS=$SYSTEM_NAME
 		else
-			echo rs6000-ibm-aix3.2.5
+			GUESS=rs6000-ibm-aix3.2.5
 		fi
 	elif grep bos324 /usr/include/stdio.h >/dev/null 2>&1; then
-		echo rs6000-ibm-aix3.2.4
+		GUESS=rs6000-ibm-aix3.2.4
 	else
-		echo rs6000-ibm-aix3.2
+		GUESS=rs6000-ibm-aix3.2
 	fi
-	exit ;;
+	;;
     *:AIX:*:[4567])
 	IBM_CPU_ID=`/usr/sbin/lsdev -C -c processor -S available | sed 1q | awk '{ print $1 }'`
 	if /usr/sbin/lsattr -El "$IBM_CPU_ID" | grep ' POWER' >/dev/null 2>&1; then
@@ -619,48 +662,48 @@ EOF
 		IBM_ARCH=powerpc
 	fi
 	if test -x /usr/bin/lslpp ; then
-		IBM_REV=`/usr/bin/lslpp -Lqc bos.rte.libc |
+		IBM_REV=`/usr/bin/lslpp -Lqc bos.rte.libc | \
 			   awk -F: '{ print $3 }' | sed s/[0-9]*$/0/`
 	else
-		IBM_REV="$UNAME_VERSION.$UNAME_RELEASE"
+		IBM_REV=$UNAME_VERSION.$UNAME_RELEASE
 	fi
-	echo "$IBM_ARCH"-ibm-aix"$IBM_REV"
-	exit ;;
+	GUESS=$IBM_ARCH-ibm-aix$IBM_REV
+	;;
     *:AIX:*:*)
-	echo rs6000-ibm-aix
-	exit ;;
+	GUESS=rs6000-ibm-aix
+	;;
     ibmrt:4.4BSD:*|romp-ibm:4.4BSD:*)
-	echo romp-ibm-bsd4.4
-	exit ;;
+	GUESS=romp-ibm-bsd4.4
+	;;
     ibmrt:*BSD:*|romp-ibm:BSD:*)            # covers RT/PC BSD and
-	echo romp-ibm-bsd"$UNAME_RELEASE"   # 4.3 with uname added to
-	exit ;;                             # report: romp-ibm BSD 4.3
+	GUESS=romp-ibm-bsd$UNAME_RELEASE    # 4.3 with uname added to
+	;;                                  # report: romp-ibm BSD 4.3
     *:BOSX:*:*)
-	echo rs6000-bull-bosx
-	exit ;;
+	GUESS=rs6000-bull-bosx
+	;;
     DPX/2?00:B.O.S.:*:*)
-	echo m68k-bull-sysv3
-	exit ;;
+	GUESS=m68k-bull-sysv3
+	;;
     9000/[34]??:4.3bsd:1.*:*)
-	echo m68k-hp-bsd
-	exit ;;
+	GUESS=m68k-hp-bsd
+	;;
     hp300:4.4BSD:*:* | 9000/[34]??:4.3bsd:2.*:*)
-	echo m68k-hp-bsd4.4
-	exit ;;
+	GUESS=m68k-hp-bsd4.4
+	;;
     9000/[34678]??:HP-UX:*:*)
-	HPUX_REV=`echo "$UNAME_RELEASE"|sed -e 's/[^.]*.[0B]*//'`
-	case "$UNAME_MACHINE" in
+	HPUX_REV=`echo "$UNAME_RELEASE" | sed -e 's/[^.]*.[0B]*//'`
+	case $UNAME_MACHINE in
 	    9000/31?)            HP_ARCH=m68000 ;;
 	    9000/[34]??)         HP_ARCH=m68k ;;
 	    9000/[678][0-9][0-9])
 		if test -x /usr/bin/getconf; then
 		    sc_cpu_version=`/usr/bin/getconf SC_CPU_VERSION 2>/dev/null`
 		    sc_kernel_bits=`/usr/bin/getconf SC_KERNEL_BITS 2>/dev/null`
-		    case "$sc_cpu_version" in
+		    case $sc_cpu_version in
 		      523) HP_ARCH=hppa1.0 ;; # CPU_PA_RISC1_0
 		      528) HP_ARCH=hppa1.1 ;; # CPU_PA_RISC1_1
 		      532)                      # CPU_PA_RISC2_0
-			case "$sc_kernel_bits" in
+			case $sc_kernel_bits in
 			  32) HP_ARCH=hppa2.0n ;;
 			  64) HP_ARCH=hppa2.0w ;;
 			  '') HP_ARCH=hppa2.0 ;;   # HP-UX 10.20
@@ -727,12 +770,12 @@ EOF
 		HP_ARCH=hppa64
 	    fi
 	fi
-	echo "$HP_ARCH"-hp-hpux"$HPUX_REV"
-	exit ;;
+	GUESS=$HP_ARCH-hp-hpux$HPUX_REV
+	;;
     ia64:HP-UX:*:*)
-	HPUX_REV=`echo "$UNAME_RELEASE"|sed -e 's/[^.]*.[0B]*//'`
-	echo ia64-hp-hpux"$HPUX_REV"
-	exit ;;
+	HPUX_REV=`echo "$UNAME_RELEASE" | sed -e 's/[^.]*.[0B]*//'`
+	GUESS=ia64-hp-hpux$HPUX_REV
+	;;
     3050*:HI-UX:*:*)
 	set_cc_for_build
 	sed 's/^	//' << EOF > "$dummy.c"
@@ -762,36 +805,36 @@ EOF
 EOF
 	$CC_FOR_BUILD -o "$dummy" "$dummy.c" && SYSTEM_NAME=`"$dummy"` &&
 		{ echo "$SYSTEM_NAME"; exit; }
-	echo unknown-hitachi-hiuxwe2
-	exit ;;
+	GUESS=unknown-hitachi-hiuxwe2
+	;;
     9000/7??:4.3bsd:*:* | 9000/8?[79]:4.3bsd:*:*)
-	echo hppa1.1-hp-bsd
-	exit ;;
+	GUESS=hppa1.1-hp-bsd
+	;;
     9000/8??:4.3bsd:*:*)
-	echo hppa1.0-hp-bsd
-	exit ;;
+	GUESS=hppa1.0-hp-bsd
+	;;
     *9??*:MPE/iX:*:* | *3000*:MPE/iX:*:*)
-	echo hppa1.0-hp-mpeix
-	exit ;;
+	GUESS=hppa1.0-hp-mpeix
+	;;
     hp7??:OSF1:*:* | hp8?[79]:OSF1:*:*)
-	echo hppa1.1-hp-osf
-	exit ;;
+	GUESS=hppa1.1-hp-osf
+	;;
     hp8??:OSF1:*:*)
-	echo hppa1.0-hp-osf
-	exit ;;
+	GUESS=hppa1.0-hp-osf
+	;;
     i*86:OSF1:*:*)
 	if test -x /usr/sbin/sysversion ; then
-	    echo "$UNAME_MACHINE"-unknown-osf1mk
+	    GUESS=$UNAME_MACHINE-unknown-osf1mk
 	else
-	    echo "$UNAME_MACHINE"-unknown-osf1
+	    GUESS=$UNAME_MACHINE-unknown-osf1
 	fi
-	exit ;;
+	;;
     parisc*:Lites*:*:*)
-	echo hppa1.1-hp-lites
-	exit ;;
+	GUESS=hppa1.1-hp-lites
+	;;
     C1*:ConvexOS:*:* | convex:ConvexOS:C1*:*)
-	echo c1-convex-bsd
-	exit ;;
+	GUESS=c1-convex-bsd
+	;;
     C2*:ConvexOS:*:* | convex:ConvexOS:C2*:*)
 	if getsysinfo -f scalar_acc
 	then echo c32-convex-bsd
@@ -799,17 +842,18 @@ EOF
 	fi
 	exit ;;
     C34*:ConvexOS:*:* | convex:ConvexOS:C34*:*)
-	echo c34-convex-bsd
-	exit ;;
+	GUESS=c34-convex-bsd
+	;;
     C38*:ConvexOS:*:* | convex:ConvexOS:C38*:*)
-	echo c38-convex-bsd
-	exit ;;
+	GUESS=c38-convex-bsd
+	;;
     C4*:ConvexOS:*:* | convex:ConvexOS:C4*:*)
-	echo c4-convex-bsd
-	exit ;;
+	GUESS=c4-convex-bsd
+	;;
     CRAY*Y-MP:*:*:*)
-	echo ymp-cray-unicos"$UNAME_RELEASE" | sed -e 's/\.[^.]*$/.X/'
-	exit ;;
+	CRAY_REL=`echo "$UNAME_RELEASE" | sed -e 's/\.[^.]*$/.X/'`
+	GUESS=ymp-cray-unicos$CRAY_REL
+	;;
     CRAY*[A-Z]90:*:*:*)
 	echo "$UNAME_MACHINE"-cray-unicos"$UNAME_RELEASE" \
 	| sed -e 's/CRAY.*\([A-Z]90\)/\1/' \
@@ -817,112 +861,153 @@ EOF
 	      -e 's/\.[^.]*$/.X/'
 	exit ;;
     CRAY*TS:*:*:*)
-	echo t90-cray-unicos"$UNAME_RELEASE" | sed -e 's/\.[^.]*$/.X/'
-	exit ;;
+	CRAY_REL=`echo "$UNAME_RELEASE" | sed -e 's/\.[^.]*$/.X/'`
+	GUESS=t90-cray-unicos$CRAY_REL
+	;;
     CRAY*T3E:*:*:*)
-	echo alphaev5-cray-unicosmk"$UNAME_RELEASE" | sed -e 's/\.[^.]*$/.X/'
-	exit ;;
+	CRAY_REL=`echo "$UNAME_RELEASE" | sed -e 's/\.[^.]*$/.X/'`
+	GUESS=alphaev5-cray-unicosmk$CRAY_REL
+	;;
     CRAY*SV1:*:*:*)
-	echo sv1-cray-unicos"$UNAME_RELEASE" | sed -e 's/\.[^.]*$/.X/'
-	exit ;;
+	CRAY_REL=`echo "$UNAME_RELEASE" | sed -e 's/\.[^.]*$/.X/'`
+	GUESS=sv1-cray-unicos$CRAY_REL
+	;;
     *:UNICOS/mp:*:*)
-	echo craynv-cray-unicosmp"$UNAME_RELEASE" | sed -e 's/\.[^.]*$/.X/'
-	exit ;;
+	CRAY_REL=`echo "$UNAME_RELEASE" | sed -e 's/\.[^.]*$/.X/'`
+	GUESS=craynv-cray-unicosmp$CRAY_REL
+	;;
     F30[01]:UNIX_System_V:*:* | F700:UNIX_System_V:*:*)
 	FUJITSU_PROC=`uname -m | tr ABCDEFGHIJKLMNOPQRSTUVWXYZ abcdefghijklmnopqrstuvwxyz`
 	FUJITSU_SYS=`uname -p | tr ABCDEFGHIJKLMNOPQRSTUVWXYZ abcdefghijklmnopqrstuvwxyz | sed -e 's/\///'`
 	FUJITSU_REL=`echo "$UNAME_RELEASE" | sed -e 's/ /_/'`
-	echo "${FUJITSU_PROC}-fujitsu-${FUJITSU_SYS}${FUJITSU_REL}"
-	exit ;;
+	GUESS=${FUJITSU_PROC}-fujitsu-${FUJITSU_SYS}${FUJITSU_REL}
+	;;
     5000:UNIX_System_V:4.*:*)
 	FUJITSU_SYS=`uname -p | tr ABCDEFGHIJKLMNOPQRSTUVWXYZ abcdefghijklmnopqrstuvwxyz | sed -e 's/\///'`
 	FUJITSU_REL=`echo "$UNAME_RELEASE" | tr ABCDEFGHIJKLMNOPQRSTUVWXYZ abcdefghijklmnopqrstuvwxyz | sed -e 's/ /_/'`
-	echo "sparc-fujitsu-${FUJITSU_SYS}${FUJITSU_REL}"
-	exit ;;
+	GUESS=sparc-fujitsu-${FUJITSU_SYS}${FUJITSU_REL}
+	;;
     i*86:BSD/386:*:* | i*86:BSD/OS:*:* | *:Ascend\ Embedded/OS:*:*)
-	echo "$UNAME_MACHINE"-pc-bsdi"$UNAME_RELEASE"
-	exit ;;
+	GUESS=$UNAME_MACHINE-pc-bsdi$UNAME_RELEASE
+	;;
     sparc*:BSD/OS:*:*)
-	echo sparc-unknown-bsdi"$UNAME_RELEASE"
-	exit ;;
+	GUESS=sparc-unknown-bsdi$UNAME_RELEASE
+	;;
     *:BSD/OS:*:*)
-	echo "$UNAME_MACHINE"-unknown-bsdi"$UNAME_RELEASE"
-	exit ;;
+	GUESS=$UNAME_MACHINE-unknown-bsdi$UNAME_RELEASE
+	;;
     arm:FreeBSD:*:*)
 	UNAME_PROCESSOR=`uname -p`
 	set_cc_for_build
 	if echo __ARM_PCS_VFP | $CC_FOR_BUILD -E - 2>/dev/null \
 	    | grep -q __ARM_PCS_VFP
 	then
-	    echo "${UNAME_PROCESSOR}"-unknown-freebsd"`echo ${UNAME_RELEASE}|sed -e 's/[-(].*//'`"-gnueabi
+	    FREEBSD_REL=`echo "$UNAME_RELEASE" | sed -e 's/[-(].*//'`
+	    GUESS=$UNAME_PROCESSOR-unknown-freebsd$FREEBSD_REL-gnueabi
 	else
-	    echo "${UNAME_PROCESSOR}"-unknown-freebsd"`echo ${UNAME_RELEASE}|sed -e 's/[-(].*//'`"-gnueabihf
+	    FREEBSD_REL=`echo "$UNAME_RELEASE" | sed -e 's/[-(].*//'`
+	    GUESS=$UNAME_PROCESSOR-unknown-freebsd$FREEBSD_REL-gnueabihf
 	fi
-	exit ;;
+	;;
     *:FreeBSD:*:*)
-	UNAME_PROCESSOR=`/usr/bin/uname -p`
-	case "$UNAME_PROCESSOR" in
+	UNAME_PROCESSOR=`uname -p`
+	case $UNAME_PROCESSOR in
 	    amd64)
 		UNAME_PROCESSOR=x86_64 ;;
 	    i386)
 		UNAME_PROCESSOR=i586 ;;
 	esac
-	echo "$UNAME_PROCESSOR"-unknown-freebsd"`echo "$UNAME_RELEASE"|sed -e 's/[-(].*//'`"
-	exit ;;
+	FREEBSD_REL=`echo "$UNAME_RELEASE" | sed -e 's/[-(].*//'`
+	GUESS=$UNAME_PROCESSOR-unknown-freebsd$FREEBSD_REL
+	;;
     i*:CYGWIN*:*)
-	echo "$UNAME_MACHINE"-pc-cygwin
-	exit ;;
+	GUESS=$UNAME_MACHINE-pc-cygwin
+	;;
     *:MINGW64*:*)
-	echo "$UNAME_MACHINE"-pc-mingw64
-	exit ;;
+	GUESS=$UNAME_MACHINE-pc-mingw64
+	;;
     *:MINGW*:*)
-	echo "$UNAME_MACHINE"-pc-mingw32
-	exit ;;
+	GUESS=$UNAME_MACHINE-pc-mingw32
+	;;
     *:MSYS*:*)
-	echo "$UNAME_MACHINE"-pc-msys
-	exit ;;
+	GUESS=$UNAME_MACHINE-pc-msys
+	;;
     i*:PW*:*)
-	echo "$UNAME_MACHINE"-pc-pw32
-	exit ;;
+	GUESS=$UNAME_MACHINE-pc-pw32
+	;;
+    *:SerenityOS:*:*)
+        GUESS=$UNAME_MACHINE-pc-serenity
+        ;;
     *:Interix*:*)
-	case "$UNAME_MACHINE" in
+	case $UNAME_MACHINE in
 	    x86)
-		echo i586-pc-interix"$UNAME_RELEASE"
-		exit ;;
+		GUESS=i586-pc-interix$UNAME_RELEASE
+		;;
 	    authenticamd | genuineintel | EM64T)
-		echo x86_64-unknown-interix"$UNAME_RELEASE"
-		exit ;;
+		GUESS=x86_64-unknown-interix$UNAME_RELEASE
+		;;
 	    IA64)
-		echo ia64-unknown-interix"$UNAME_RELEASE"
-		exit ;;
+		GUESS=ia64-unknown-interix$UNAME_RELEASE
+		;;
 	esac ;;
     i*:UWIN*:*)
-	echo "$UNAME_MACHINE"-pc-uwin
-	exit ;;
+	GUESS=$UNAME_MACHINE-pc-uwin
+	;;
     amd64:CYGWIN*:*:* | x86_64:CYGWIN*:*:*)
-	echo x86_64-pc-cygwin
-	exit ;;
+	GUESS=x86_64-pc-cygwin
+	;;
     prep*:SunOS:5.*:*)
-	echo powerpcle-unknown-solaris2"`echo "$UNAME_RELEASE"|sed -e 's/[^.]*//'`"
-	exit ;;
+	SUN_REL=`echo "$UNAME_RELEASE" | sed -e 's/[^.]*//'`
+	GUESS=powerpcle-unknown-solaris2$SUN_REL
+	;;
     *:GNU:*:*)
 	# the GNU system
-	echo "`echo "$UNAME_MACHINE"|sed -e 's,[-/].*$,,'`-unknown-$LIBC`echo "$UNAME_RELEASE"|sed -e 's,/.*$,,'`"
-	exit ;;
+	GNU_ARCH=`echo "$UNAME_MACHINE" | sed -e 's,[-/].*$,,'`
+	GNU_REL=`echo "$UNAME_RELEASE" | sed -e 's,/.*$,,'`
+	GUESS=$GNU_ARCH-unknown-$LIBC$GNU_REL
+	;;
     *:GNU/*:*:*)
 	# other systems with GNU libc and userland
-	echo "$UNAME_MACHINE-unknown-`echo "$UNAME_SYSTEM" | sed 's,^[^/]*/,,' | tr "[:upper:]" "[:lower:]"``echo "$UNAME_RELEASE"|sed -e 's/[-(].*//'`-$LIBC"
-	exit ;;
+	GNU_SYS=`echo "$UNAME_SYSTEM" | sed 's,^[^/]*/,,' | tr "[:upper:]" "[:lower:]"`
+	GNU_REL=`echo "$UNAME_RELEASE" | sed -e 's/[-(].*//'`
+	GUESS=$UNAME_MACHINE-unknown-$GNU_SYS$GNU_REL-$LIBC
+	;;
+    x86_64:[Mm]anagarm:*:*|i?86:[Mm]anagarm:*:*)
+	GUESS="$UNAME_MACHINE-pc-managarm-mlibc"
+	;;
+    *:[Mm]anagarm:*:*)
+	GUESS="$UNAME_MACHINE-unknown-managarm-mlibc"
+	;;
     *:Minix:*:*)
-	echo "$UNAME_MACHINE"-unknown-minix
-	exit ;;
+	GUESS=$UNAME_MACHINE-unknown-minix
+	;;
     aarch64:Linux:*:*)
-	echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
-	exit ;;
+	set_cc_for_build
+	CPU=$UNAME_MACHINE
+	LIBCABI=$LIBC
+	if test "$CC_FOR_BUILD" != no_compiler_found; then
+	    ABI=64
+	    sed 's/^	    //' << EOF > "$dummy.c"
+	    #ifdef __ARM_EABI__
+	    #ifdef __ARM_PCS_VFP
+	    ABI=eabihf
+	    #else
+	    ABI=eabi
+	    #endif
+	    #endif
+EOF
+	    cc_set_abi=`$CC_FOR_BUILD -E "$dummy.c" 2>/dev/null | grep '^ABI' | sed 's, ,,g'`
+	    eval "$cc_set_abi"
+	    case $ABI in
+		eabi | eabihf) CPU=armv8l; LIBCABI=$LIBC$ABI ;;
+	    esac
+	fi
+	GUESS=$CPU-unknown-linux-$LIBCABI
+	;;
     aarch64_be:Linux:*:*)
 	UNAME_MACHINE=aarch64_be
-	echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
-	exit ;;
+	GUESS=$UNAME_MACHINE-unknown-linux-$LIBC
+	;;
     alpha:Linux:*:*)
 	case `sed -n '/^cpu model/s/^.*: \(.*\)/\1/p' /proc/cpuinfo 2>/dev/null` in
 	  EV5)   UNAME_MACHINE=alphaev5 ;;
@@ -935,60 +1020,72 @@ EOF
 	esac
 	objdump --private-headers /bin/sh | grep -q ld.so.1
 	if test "$?" = 0 ; then LIBC=gnulibc1 ; fi
-	echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
-	exit ;;
-    arc:Linux:*:* | arceb:Linux:*:*)
-	echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
-	exit ;;
+	GUESS=$UNAME_MACHINE-unknown-linux-$LIBC
+	;;
+    arc:Linux:*:* | arceb:Linux:*:* | arc32:Linux:*:* | arc64:Linux:*:*)
+	GUESS=$UNAME_MACHINE-unknown-linux-$LIBC
+	;;
     arm*:Linux:*:*)
 	set_cc_for_build
 	if echo __ARM_EABI__ | $CC_FOR_BUILD -E - 2>/dev/null \
 	    | grep -q __ARM_EABI__
 	then
-	    echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
+	    GUESS=$UNAME_MACHINE-unknown-linux-$LIBC
 	else
 	    if echo __ARM_PCS_VFP | $CC_FOR_BUILD -E - 2>/dev/null \
 		| grep -q __ARM_PCS_VFP
 	    then
-		echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"eabi
+		GUESS=$UNAME_MACHINE-unknown-linux-${LIBC}eabi
 	    else
-		echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"eabihf
+		GUESS=$UNAME_MACHINE-unknown-linux-${LIBC}eabihf
 	    fi
 	fi
-	exit ;;
+	;;
     avr32*:Linux:*:*)
-	echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
-	exit ;;
+	GUESS=$UNAME_MACHINE-unknown-linux-$LIBC
+	;;
     cris:Linux:*:*)
-	echo "$UNAME_MACHINE"-axis-linux-"$LIBC"
-	exit ;;
+	GUESS=$UNAME_MACHINE-axis-linux-$LIBC
+	;;
     crisv32:Linux:*:*)
-	echo "$UNAME_MACHINE"-axis-linux-"$LIBC"
-	exit ;;
+	GUESS=$UNAME_MACHINE-axis-linux-$LIBC
+	;;
     e2k:Linux:*:*)
-	echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
-	exit ;;
+	GUESS=$UNAME_MACHINE-unknown-linux-$LIBC
+	;;
     frv:Linux:*:*)
-	echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
-	exit ;;
+	GUESS=$UNAME_MACHINE-unknown-linux-$LIBC
+	;;
     hexagon:Linux:*:*)
-	echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
-	exit ;;
+	GUESS=$UNAME_MACHINE-unknown-linux-$LIBC
+	;;
     i*86:Linux:*:*)
-	echo "$UNAME_MACHINE"-pc-linux-"$LIBC"
-	exit ;;
+	GUESS=$UNAME_MACHINE-pc-linux-$LIBC
+	;;
     ia64:Linux:*:*)
-	echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
-	exit ;;
+	GUESS=$UNAME_MACHINE-unknown-linux-$LIBC
+	;;
     k1om:Linux:*:*)
-	echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
-	exit ;;
+	GUESS=$UNAME_MACHINE-unknown-linux-$LIBC
+	;;
+    kvx:Linux:*:*)
+	GUESS=$UNAME_MACHINE-unknown-linux-$LIBC
+	;;
+    kvx:cos:*:*)
+	GUESS=$UNAME_MACHINE-unknown-cos
+	;;
+    kvx:mbr:*:*)
+	GUESS=$UNAME_MACHINE-unknown-mbr
+	;;
+    loongarch32:Linux:*:* | loongarch64:Linux:*:*)
+	GUESS=$UNAME_MACHINE-unknown-linux-$LIBC
+	;;
     m32r*:Linux:*:*)
-	echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
-	exit ;;
+	GUESS=$UNAME_MACHINE-unknown-linux-$LIBC
+	;;
     m68*:Linux:*:*)
-	echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
-	exit ;;
+	GUESS=$UNAME_MACHINE-unknown-linux-$LIBC
+	;;
     mips:Linux:*:* | mips64:Linux:*:*)
 	set_cc_for_build
 	IS_GLIBC=0
@@ -1033,123 +1130,135 @@ EOF
 	#endif
 	#endif
 EOF
-	eval "`$CC_FOR_BUILD -E "$dummy.c" 2>/dev/null | grep '^CPU\|^MIPS_ENDIAN\|^LIBCABI'`"
+	cc_set_vars=`$CC_FOR_BUILD -E "$dummy.c" 2>/dev/null | grep '^CPU\|^MIPS_ENDIAN\|^LIBCABI'`
+	eval "$cc_set_vars"
 	test "x$CPU" != x && { echo "$CPU${MIPS_ENDIAN}-unknown-linux-$LIBCABI"; exit; }
 	;;
     mips64el:Linux:*:*)
-	echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
-	exit ;;
+	GUESS=$UNAME_MACHINE-unknown-linux-$LIBC
+	;;
     openrisc*:Linux:*:*)
-	echo or1k-unknown-linux-"$LIBC"
-	exit ;;
+	GUESS=or1k-unknown-linux-$LIBC
+	;;
     or32:Linux:*:* | or1k*:Linux:*:*)
-	echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
-	exit ;;
+	GUESS=$UNAME_MACHINE-unknown-linux-$LIBC
+	;;
     padre:Linux:*:*)
-	echo sparc-unknown-linux-"$LIBC"
-	exit ;;
+	GUESS=sparc-unknown-linux-$LIBC
+	;;
     parisc64:Linux:*:* | hppa64:Linux:*:*)
-	echo hppa64-unknown-linux-"$LIBC"
-	exit ;;
+	GUESS=hppa64-unknown-linux-$LIBC
+	;;
     parisc:Linux:*:* | hppa:Linux:*:*)
 	# Look for CPU level
 	case `grep '^cpu[^a-z]*:' /proc/cpuinfo 2>/dev/null | cut -d' ' -f2` in
-	  PA7*) echo hppa1.1-unknown-linux-"$LIBC" ;;
-	  PA8*) echo hppa2.0-unknown-linux-"$LIBC" ;;
-	  *)    echo hppa-unknown-linux-"$LIBC" ;;
+	  PA7*) GUESS=hppa1.1-unknown-linux-$LIBC ;;
+	  PA8*) GUESS=hppa2.0-unknown-linux-$LIBC ;;
+	  *)    GUESS=hppa-unknown-linux-$LIBC ;;
 	esac
-	exit ;;
+	;;
     ppc64:Linux:*:*)
-	echo powerpc64-unknown-linux-"$LIBC"
-	exit ;;
+	GUESS=powerpc64-unknown-linux-$LIBC
+	;;
     ppc:Linux:*:*)
-	echo powerpc-unknown-linux-"$LIBC"
-	exit ;;
+	GUESS=powerpc-unknown-linux-$LIBC
+	;;
     ppc64le:Linux:*:*)
-	echo powerpc64le-unknown-linux-"$LIBC"
-	exit ;;
+	GUESS=powerpc64le-unknown-linux-$LIBC
+	;;
     ppcle:Linux:*:*)
-	echo powerpcle-unknown-linux-"$LIBC"
-	exit ;;
-    riscv32:Linux:*:* | riscv64:Linux:*:*)
-	echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
-	exit ;;
+	GUESS=powerpcle-unknown-linux-$LIBC
+	;;
+    riscv32:Linux:*:* | riscv32be:Linux:*:* | riscv64:Linux:*:* | riscv64be:Linux:*:*)
+	GUESS=$UNAME_MACHINE-unknown-linux-$LIBC
+	;;
     s390:Linux:*:* | s390x:Linux:*:*)
-	echo "$UNAME_MACHINE"-ibm-linux-"$LIBC"
-	exit ;;
+	GUESS=$UNAME_MACHINE-ibm-linux-$LIBC
+	;;
     sh64*:Linux:*:*)
-	echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
-	exit ;;
+	GUESS=$UNAME_MACHINE-unknown-linux-$LIBC
+	;;
     sh*:Linux:*:*)
-	echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
-	exit ;;
+	GUESS=$UNAME_MACHINE-unknown-linux-$LIBC
+	;;
     sparc:Linux:*:* | sparc64:Linux:*:*)
-	echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
-	exit ;;
+	GUESS=$UNAME_MACHINE-unknown-linux-$LIBC
+	;;
     tile*:Linux:*:*)
-	echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
-	exit ;;
+	GUESS=$UNAME_MACHINE-unknown-linux-$LIBC
+	;;
     vax:Linux:*:*)
-	echo "$UNAME_MACHINE"-dec-linux-"$LIBC"
-	exit ;;
+	GUESS=$UNAME_MACHINE-dec-linux-$LIBC
+	;;
     x86_64:Linux:*:*)
 	set_cc_for_build
+	CPU=$UNAME_MACHINE
 	LIBCABI=$LIBC
 	if test "$CC_FOR_BUILD" != no_compiler_found; then
-	    if (echo '#ifdef __ILP32__'; echo IS_X32; echo '#endif') | \
-		(CCOPTS="" $CC_FOR_BUILD -E - 2>/dev/null) | \
-		grep IS_X32 >/dev/null
-	    then
-		LIBCABI="$LIBC"x32
-	    fi
+	    ABI=64
+	    sed 's/^	    //' << EOF > "$dummy.c"
+	    #ifdef __i386__
+	    ABI=x86
+	    #else
+	    #ifdef __ILP32__
+	    ABI=x32
+	    #endif
+	    #endif
+EOF
+	    cc_set_abi=`$CC_FOR_BUILD -E "$dummy.c" 2>/dev/null | grep '^ABI' | sed 's, ,,g'`
+	    eval "$cc_set_abi"
+	    case $ABI in
+		x86) CPU=i686 ;;
+		x32) LIBCABI=${LIBC}x32 ;;
+	    esac
 	fi
-	echo "$UNAME_MACHINE"-pc-linux-"$LIBCABI"
-	exit ;;
+	GUESS=$CPU-pc-linux-$LIBCABI
+	;;
     xtensa*:Linux:*:*)
-	echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
-	exit ;;
+	GUESS=$UNAME_MACHINE-unknown-linux-$LIBC
+	;;
     i*86:DYNIX/ptx:4*:*)
 	# ptx 4.0 does uname -s correctly, with DYNIX/ptx in there.
 	# earlier versions are messed up and put the nodename in both
 	# sysname and nodename.
-	echo i386-sequent-sysv4
-	exit ;;
+	GUESS=i386-sequent-sysv4
+	;;
     i*86:UNIX_SV:4.2MP:2.*)
 	# Unixware is an offshoot of SVR4, but it has its own version
 	# number series starting with 2...
 	# I am not positive that other SVR4 systems won't match this,
 	# I just have to hope.  -- rms.
 	# Use sysv4.2uw... so that sysv4* matches it.
-	echo "$UNAME_MACHINE"-pc-sysv4.2uw"$UNAME_VERSION"
-	exit ;;
+	GUESS=$UNAME_MACHINE-pc-sysv4.2uw$UNAME_VERSION
+	;;
     i*86:OS/2:*:*)
-	# If we were able to find `uname', then EMX Unix compatibility
+	# If we were able to find 'uname', then EMX Unix compatibility
 	# is probably installed.
-	echo "$UNAME_MACHINE"-pc-os2-emx
-	exit ;;
+	GUESS=$UNAME_MACHINE-pc-os2-emx
+	;;
     i*86:XTS-300:*:STOP)
-	echo "$UNAME_MACHINE"-unknown-stop
-	exit ;;
+	GUESS=$UNAME_MACHINE-unknown-stop
+	;;
     i*86:atheos:*:*)
-	echo "$UNAME_MACHINE"-unknown-atheos
-	exit ;;
+	GUESS=$UNAME_MACHINE-unknown-atheos
+	;;
     i*86:syllable:*:*)
-	echo "$UNAME_MACHINE"-pc-syllable
-	exit ;;
+	GUESS=$UNAME_MACHINE-pc-syllable
+	;;
     i*86:LynxOS:2.*:* | i*86:LynxOS:3.[01]*:* | i*86:LynxOS:4.[02]*:*)
-	echo i386-unknown-lynxos"$UNAME_RELEASE"
-	exit ;;
+	GUESS=i386-unknown-lynxos$UNAME_RELEASE
+	;;
     i*86:*DOS:*:*)
-	echo "$UNAME_MACHINE"-pc-msdosdjgpp
-	exit ;;
+	GUESS=$UNAME_MACHINE-pc-msdosdjgpp
+	;;
     i*86:*:4.*:*)
 	UNAME_REL=`echo "$UNAME_RELEASE" | sed 's/\/MP$//'`
 	if grep Novell /usr/include/link.h >/dev/null 2>/dev/null; then
-		echo "$UNAME_MACHINE"-univel-sysv"$UNAME_REL"
+		GUESS=$UNAME_MACHINE-univel-sysv$UNAME_REL
 	else
-		echo "$UNAME_MACHINE"-pc-sysv"$UNAME_REL"
+		GUESS=$UNAME_MACHINE-pc-sysv$UNAME_REL
 	fi
-	exit ;;
+	;;
     i*86:*:5:[678]*)
 	# UnixWare 7.x, OpenUNIX and OpenServer 6.
 	case `/bin/uname -X | grep "^Machine"` in
@@ -1157,12 +1266,12 @@ EOF
 	    *Pentium)	     UNAME_MACHINE=i586 ;;
 	    *Pent*|*Celeron) UNAME_MACHINE=i686 ;;
 	esac
-	echo "$UNAME_MACHINE-unknown-sysv${UNAME_RELEASE}${UNAME_SYSTEM}${UNAME_VERSION}"
-	exit ;;
+	GUESS=$UNAME_MACHINE-unknown-sysv${UNAME_RELEASE}${UNAME_SYSTEM}${UNAME_VERSION}
+	;;
     i*86:*:3.2:*)
 	if test -f /usr/options/cb.name; then
 		UNAME_REL=`sed -n 's/.*Version //p' </usr/options/cb.name`
-		echo "$UNAME_MACHINE"-pc-isc"$UNAME_REL"
+		GUESS=$UNAME_MACHINE-pc-isc$UNAME_REL
 	elif /bin/uname -X 2>/dev/null >/dev/null ; then
 		UNAME_REL=`(/bin/uname -X|grep Release|sed -e 's/.*= //')`
 		(/bin/uname -X|grep i80486 >/dev/null) && UNAME_MACHINE=i486
@@ -1172,11 +1281,11 @@ EOF
 			&& UNAME_MACHINE=i686
 		(/bin/uname -X|grep '^Machine.*Pentium Pro' >/dev/null) \
 			&& UNAME_MACHINE=i686
-		echo "$UNAME_MACHINE"-pc-sco"$UNAME_REL"
+		GUESS=$UNAME_MACHINE-pc-sco$UNAME_REL
 	else
-		echo "$UNAME_MACHINE"-pc-sysv32
+		GUESS=$UNAME_MACHINE-pc-sysv32
 	fi
-	exit ;;
+	;;
     pc:*:*:*)
 	# Left here for compatibility:
 	# uname -m prints for DJGPP always 'pc', but it prints nothing about
@@ -1184,31 +1293,31 @@ EOF
 	# Note: whatever this is, it MUST be the same as what config.sub
 	# prints for the "djgpp" host, or else GDB configure will decide that
 	# this is a cross-build.
-	echo i586-pc-msdosdjgpp
-	exit ;;
+	GUESS=i586-pc-msdosdjgpp
+	;;
     Intel:Mach:3*:*)
-	echo i386-pc-mach3
-	exit ;;
+	GUESS=i386-pc-mach3
+	;;
     paragon:*:*:*)
-	echo i860-intel-osf1
-	exit ;;
+	GUESS=i860-intel-osf1
+	;;
     i860:*:4.*:*) # i860-SVR4
 	if grep Stardent /usr/include/sys/uadmin.h >/dev/null 2>&1 ; then
-	  echo i860-stardent-sysv"$UNAME_RELEASE" # Stardent Vistra i860-SVR4
+	  GUESS=i860-stardent-sysv$UNAME_RELEASE    # Stardent Vistra i860-SVR4
 	else # Add other i860-SVR4 vendors below as they are discovered.
-	  echo i860-unknown-sysv"$UNAME_RELEASE"  # Unknown i860-SVR4
+	  GUESS=i860-unknown-sysv$UNAME_RELEASE     # Unknown i860-SVR4
 	fi
-	exit ;;
+	;;
     mini*:CTIX:SYS*5:*)
 	# "miniframe"
-	echo m68010-convergent-sysv
-	exit ;;
+	GUESS=m68010-convergent-sysv
+	;;
     mc68k:UNIX:SYSTEM5:3.51m)
-	echo m68k-convergent-sysv
-	exit ;;
+	GUESS=m68k-convergent-sysv
+	;;
     M680?0:D-NIX:5.3:*)
-	echo m68k-diab-dnix
-	exit ;;
+	GUESS=m68k-diab-dnix
+	;;
     M68*:*:R3V[5678]*:*)
 	test -r /sysV68 && { echo 'm68k-motorola-sysv'; exit; } ;;
     3[345]??:*:4.0:3.0 | 3[34]??A:*:4.0:3.0 | 3[34]??,*:*:4.0:3.0 | 3[34]??/*:*:4.0:3.0 | 4400:*:4.0:3.0 | 4850:*:4.0:3.0 | SKA40:*:4.0:3.0 | SDS2:*:4.0:3.0 | SHG2:*:4.0:3.0 | S7501*:*:4.0:3.0)
@@ -1233,116 +1342,119 @@ EOF
 	/bin/uname -p 2>/dev/null | /bin/grep pteron >/dev/null \
 	    && { echo i586-ncr-sysv4.3"$OS_REL"; exit; } ;;
     m68*:LynxOS:2.*:* | m68*:LynxOS:3.0*:*)
-	echo m68k-unknown-lynxos"$UNAME_RELEASE"
-	exit ;;
+	GUESS=m68k-unknown-lynxos$UNAME_RELEASE
+	;;
     mc68030:UNIX_System_V:4.*:*)
-	echo m68k-atari-sysv4
-	exit ;;
+	GUESS=m68k-atari-sysv4
+	;;
     TSUNAMI:LynxOS:2.*:*)
-	echo sparc-unknown-lynxos"$UNAME_RELEASE"
-	exit ;;
+	GUESS=sparc-unknown-lynxos$UNAME_RELEASE
+	;;
     rs6000:LynxOS:2.*:*)
-	echo rs6000-unknown-lynxos"$UNAME_RELEASE"
-	exit ;;
+	GUESS=rs6000-unknown-lynxos$UNAME_RELEASE
+	;;
     PowerPC:LynxOS:2.*:* | PowerPC:LynxOS:3.[01]*:* | PowerPC:LynxOS:4.[02]*:*)
-	echo powerpc-unknown-lynxos"$UNAME_RELEASE"
-	exit ;;
+	GUESS=powerpc-unknown-lynxos$UNAME_RELEASE
+	;;
     SM[BE]S:UNIX_SV:*:*)
-	echo mips-dde-sysv"$UNAME_RELEASE"
-	exit ;;
+	GUESS=mips-dde-sysv$UNAME_RELEASE
+	;;
     RM*:ReliantUNIX-*:*:*)
-	echo mips-sni-sysv4
-	exit ;;
+	GUESS=mips-sni-sysv4
+	;;
     RM*:SINIX-*:*:*)
-	echo mips-sni-sysv4
-	exit ;;
+	GUESS=mips-sni-sysv4
+	;;
     *:SINIX-*:*:*)
 	if uname -p 2>/dev/null >/dev/null ; then
 		UNAME_MACHINE=`(uname -p) 2>/dev/null`
-		echo "$UNAME_MACHINE"-sni-sysv4
+		GUESS=$UNAME_MACHINE-sni-sysv4
 	else
-		echo ns32k-sni-sysv
+		GUESS=ns32k-sni-sysv
 	fi
-	exit ;;
-    PENTIUM:*:4.0*:*)	# Unisys `ClearPath HMP IX 4000' SVR4/MP effort
+	;;
+    PENTIUM:*:4.0*:*)	# Unisys 'ClearPath HMP IX 4000' SVR4/MP effort
 			# says <Richard.M.Bartel@ccMail.Census.GOV>
-	echo i586-unisys-sysv4
-	exit ;;
+	GUESS=i586-unisys-sysv4
+	;;
     *:UNIX_System_V:4*:FTX*)
 	# From Gerald Hewes <hewes@openmarket.com>.
 	# How about differentiating between stratus architectures? -djm
-	echo hppa1.1-stratus-sysv4
-	exit ;;
+	GUESS=hppa1.1-stratus-sysv4
+	;;
     *:*:*:FTX*)
 	# From seanf@swdc.stratus.com.
-	echo i860-stratus-sysv4
-	exit ;;
+	GUESS=i860-stratus-sysv4
+	;;
     i*86:VOS:*:*)
 	# From Paul.Green@stratus.com.
-	echo "$UNAME_MACHINE"-stratus-vos
-	exit ;;
+	GUESS=$UNAME_MACHINE-stratus-vos
+	;;
     *:VOS:*:*)
 	# From Paul.Green@stratus.com.
-	echo hppa1.1-stratus-vos
-	exit ;;
+	GUESS=hppa1.1-stratus-vos
+	;;
     mc68*:A/UX:*:*)
-	echo m68k-apple-aux"$UNAME_RELEASE"
-	exit ;;
+	GUESS=m68k-apple-aux$UNAME_RELEASE
+	;;
     news*:NEWS-OS:6*:*)
-	echo mips-sony-newsos6
-	exit ;;
+	GUESS=mips-sony-newsos6
+	;;
     R[34]000:*System_V*:*:* | R4000:UNIX_SYSV:*:* | R*000:UNIX_SV:*:*)
 	if test -d /usr/nec; then
-		echo mips-nec-sysv"$UNAME_RELEASE"
+		GUESS=mips-nec-sysv$UNAME_RELEASE
 	else
-		echo mips-unknown-sysv"$UNAME_RELEASE"
+		GUESS=mips-unknown-sysv$UNAME_RELEASE
 	fi
-	exit ;;
+	;;
     BeBox:BeOS:*:*)	# BeOS running on hardware made by Be, PPC only.
-	echo powerpc-be-beos
-	exit ;;
+	GUESS=powerpc-be-beos
+	;;
     BeMac:BeOS:*:*)	# BeOS running on Mac or Mac clone, PPC only.
-	echo powerpc-apple-beos
-	exit ;;
+	GUESS=powerpc-apple-beos
+	;;
     BePC:BeOS:*:*)	# BeOS running on Intel PC compatible.
-	echo i586-pc-beos
-	exit ;;
+	GUESS=i586-pc-beos
+	;;
     BePC:Haiku:*:*)	# Haiku running on Intel PC compatible.
-	echo i586-pc-haiku
-	exit ;;
-    x86_64:Haiku:*:*)
-	echo x86_64-unknown-haiku
-	exit ;;
+	GUESS=i586-pc-haiku
+	;;
+    ppc:Haiku:*:*)	# Haiku running on Apple PowerPC
+	GUESS=powerpc-apple-haiku
+	;;
+    *:Haiku:*:*)	# Haiku modern gcc (not bound by BeOS compat)
+	GUESS=$UNAME_MACHINE-unknown-haiku
+	;;
     SX-4:SUPER-UX:*:*)
-	echo sx4-nec-superux"$UNAME_RELEASE"
-	exit ;;
+	GUESS=sx4-nec-superux$UNAME_RELEASE
+	;;
     SX-5:SUPER-UX:*:*)
-	echo sx5-nec-superux"$UNAME_RELEASE"
-	exit ;;
+	GUESS=sx5-nec-superux$UNAME_RELEASE
+	;;
     SX-6:SUPER-UX:*:*)
-	echo sx6-nec-superux"$UNAME_RELEASE"
-	exit ;;
+	GUESS=sx6-nec-superux$UNAME_RELEASE
+	;;
     SX-7:SUPER-UX:*:*)
-	echo sx7-nec-superux"$UNAME_RELEASE"
-	exit ;;
+	GUESS=sx7-nec-superux$UNAME_RELEASE
+	;;
     SX-8:SUPER-UX:*:*)
-	echo sx8-nec-superux"$UNAME_RELEASE"
-	exit ;;
+	GUESS=sx8-nec-superux$UNAME_RELEASE
+	;;
     SX-8R:SUPER-UX:*:*)
-	echo sx8r-nec-superux"$UNAME_RELEASE"
-	exit ;;
+	GUESS=sx8r-nec-superux$UNAME_RELEASE
+	;;
     SX-ACE:SUPER-UX:*:*)
-	echo sxace-nec-superux"$UNAME_RELEASE"
-	exit ;;
+	GUESS=sxace-nec-superux$UNAME_RELEASE
+	;;
     Power*:Rhapsody:*:*)
-	echo powerpc-apple-rhapsody"$UNAME_RELEASE"
-	exit ;;
+	GUESS=powerpc-apple-rhapsody$UNAME_RELEASE
+	;;
     *:Rhapsody:*:*)
-	echo "$UNAME_MACHINE"-apple-rhapsody"$UNAME_RELEASE"
-	exit ;;
+	GUESS=$UNAME_MACHINE-apple-rhapsody$UNAME_RELEASE
+	;;
     arm64:Darwin:*:*)
-	echo aarch64-apple-darwin"$UNAME_RELEASE"
-	exit ;;
+	GUESS=aarch64-apple-darwin$UNAME_RELEASE
+	;;
     *:Darwin:*:*)
 	UNAME_PROCESSOR=`uname -p`
 	case $UNAME_PROCESSOR in
@@ -1378,109 +1490,122 @@ EOF
 	    # uname -m returns i386 or x86_64
 	    UNAME_PROCESSOR=$UNAME_MACHINE
 	fi
-	echo "$UNAME_PROCESSOR"-apple-darwin"$UNAME_RELEASE"
-	exit ;;
+	GUESS=$UNAME_PROCESSOR-apple-darwin$UNAME_RELEASE
+	;;
     *:procnto*:*:* | *:QNX:[0123456789]*:*)
 	UNAME_PROCESSOR=`uname -p`
 	if test "$UNAME_PROCESSOR" = x86; then
 		UNAME_PROCESSOR=i386
 		UNAME_MACHINE=pc
 	fi
-	echo "$UNAME_PROCESSOR"-"$UNAME_MACHINE"-nto-qnx"$UNAME_RELEASE"
-	exit ;;
+	GUESS=$UNAME_PROCESSOR-$UNAME_MACHINE-nto-qnx$UNAME_RELEASE
+	;;
     *:QNX:*:4*)
-	echo i386-pc-qnx
-	exit ;;
+	GUESS=i386-pc-qnx
+	;;
     NEO-*:NONSTOP_KERNEL:*:*)
-	echo neo-tandem-nsk"$UNAME_RELEASE"
-	exit ;;
+	GUESS=neo-tandem-nsk$UNAME_RELEASE
+	;;
     NSE-*:NONSTOP_KERNEL:*:*)
-	echo nse-tandem-nsk"$UNAME_RELEASE"
-	exit ;;
+	GUESS=nse-tandem-nsk$UNAME_RELEASE
+	;;
     NSR-*:NONSTOP_KERNEL:*:*)
-	echo nsr-tandem-nsk"$UNAME_RELEASE"
-	exit ;;
+	GUESS=nsr-tandem-nsk$UNAME_RELEASE
+	;;
     NSV-*:NONSTOP_KERNEL:*:*)
-	echo nsv-tandem-nsk"$UNAME_RELEASE"
-	exit ;;
+	GUESS=nsv-tandem-nsk$UNAME_RELEASE
+	;;
     NSX-*:NONSTOP_KERNEL:*:*)
-	echo nsx-tandem-nsk"$UNAME_RELEASE"
-	exit ;;
+	GUESS=nsx-tandem-nsk$UNAME_RELEASE
+	;;
     *:NonStop-UX:*:*)
-	echo mips-compaq-nonstopux
-	exit ;;
+	GUESS=mips-compaq-nonstopux
+	;;
     BS2000:POSIX*:*:*)
-	echo bs2000-siemens-sysv
-	exit ;;
+	GUESS=bs2000-siemens-sysv
+	;;
     DS/*:UNIX_System_V:*:*)
-	echo "$UNAME_MACHINE"-"$UNAME_SYSTEM"-"$UNAME_RELEASE"
-	exit ;;
+	GUESS=$UNAME_MACHINE-$UNAME_SYSTEM-$UNAME_RELEASE
+	;;
     *:Plan9:*:*)
 	# "uname -m" is not consistent, so use $cputype instead. 386
 	# is converted to i386 for consistency with other x86
 	# operating systems.
-	# shellcheck disable=SC2154
-	if test "$cputype" = 386; then
+	if test "${cputype-}" = 386; then
 	    UNAME_MACHINE=i386
-	else
-	    UNAME_MACHINE="$cputype"
+	elif test "x${cputype-}" != x; then
+	    UNAME_MACHINE=$cputype
 	fi
-	echo "$UNAME_MACHINE"-unknown-plan9
-	exit ;;
+	GUESS=$UNAME_MACHINE-unknown-plan9
+	;;
     *:TOPS-10:*:*)
-	echo pdp10-unknown-tops10
-	exit ;;
+	GUESS=pdp10-unknown-tops10
+	;;
     *:TENEX:*:*)
-	echo pdp10-unknown-tenex
-	exit ;;
+	GUESS=pdp10-unknown-tenex
+	;;
     KS10:TOPS-20:*:* | KL10:TOPS-20:*:* | TYPE4:TOPS-20:*:*)
-	echo pdp10-dec-tops20
-	exit ;;
+	GUESS=pdp10-dec-tops20
+	;;
     XKL-1:TOPS-20:*:* | TYPE5:TOPS-20:*:*)
-	echo pdp10-xkl-tops20
-	exit ;;
+	GUESS=pdp10-xkl-tops20
+	;;
     *:TOPS-20:*:*)
-	echo pdp10-unknown-tops20
-	exit ;;
+	GUESS=pdp10-unknown-tops20
+	;;
     *:ITS:*:*)
-	echo pdp10-unknown-its
-	exit ;;
+	GUESS=pdp10-unknown-its
+	;;
     SEI:*:*:SEIUX)
-	echo mips-sei-seiux"$UNAME_RELEASE"
-	exit ;;
+	GUESS=mips-sei-seiux$UNAME_RELEASE
+	;;
     *:DragonFly:*:*)
-	echo "$UNAME_MACHINE"-unknown-dragonfly"`echo "$UNAME_RELEASE"|sed -e 's/[-(].*//'`"
-	exit ;;
+	DRAGONFLY_REL=`echo "$UNAME_RELEASE" | sed -e 's/[-(].*//'`
+	GUESS=$UNAME_MACHINE-unknown-dragonfly$DRAGONFLY_REL
+	;;
     *:*VMS:*:*)
 	UNAME_MACHINE=`(uname -p) 2>/dev/null`
-	case "$UNAME_MACHINE" in
-	    A*) echo alpha-dec-vms ; exit ;;
-	    I*) echo ia64-dec-vms ; exit ;;
-	    V*) echo vax-dec-vms ; exit ;;
+	case $UNAME_MACHINE in
+	    A*) GUESS=alpha-dec-vms ;;
+	    I*) GUESS=ia64-dec-vms ;;
+	    V*) GUESS=vax-dec-vms ;;
 	esac ;;
     *:XENIX:*:SysV)
-	echo i386-pc-xenix
-	exit ;;
+	GUESS=i386-pc-xenix
+	;;
     i*86:skyos:*:*)
-	echo "$UNAME_MACHINE"-pc-skyos"`echo "$UNAME_RELEASE" | sed -e 's/ .*$//'`"
-	exit ;;
+	SKYOS_REL=`echo "$UNAME_RELEASE" | sed -e 's/ .*$//'`
+	GUESS=$UNAME_MACHINE-pc-skyos$SKYOS_REL
+	;;
     i*86:rdos:*:*)
-	echo "$UNAME_MACHINE"-pc-rdos
-	exit ;;
-    i*86:AROS:*:*)
-	echo "$UNAME_MACHINE"-pc-aros
-	exit ;;
+	GUESS=$UNAME_MACHINE-pc-rdos
+	;;
+    i*86:Fiwix:*:*)
+	GUESS=$UNAME_MACHINE-pc-fiwix
+	;;
+    *:AROS:*:*)
+	GUESS=$UNAME_MACHINE-unknown-aros
+	;;
     x86_64:VMkernel:*:*)
-	echo "$UNAME_MACHINE"-unknown-esx
-	exit ;;
+	GUESS=$UNAME_MACHINE-unknown-esx
+	;;
     amd64:Isilon\ OneFS:*:*)
-	echo x86_64-unknown-onefs
-	exit ;;
+	GUESS=x86_64-unknown-onefs
+	;;
     *:Unleashed:*:*)
-	echo "$UNAME_MACHINE"-unknown-unleashed"$UNAME_RELEASE"
-	exit ;;
+	GUESS=$UNAME_MACHINE-unknown-unleashed$UNAME_RELEASE
+	;;
+    *:Ironclad:*:*)
+	GUESS=$UNAME_MACHINE-unknown-ironclad
+	;;
 esac
 
+# Do we have a guess based on uname results?
+if test "x$GUESS" != x; then
+    echo "$GUESS"
+    exit
+fi
+
 # No uname command or uname output not recognized.
 set_cc_for_build
 cat > "$dummy.c" <<EOF
@@ -1612,7 +1737,7 @@ main ()
 }
 EOF
 
-$CC_FOR_BUILD -o "$dummy" "$dummy.c" 2>/dev/null && SYSTEM_NAME=`$dummy` &&
+$CC_FOR_BUILD -o "$dummy" "$dummy.c" 2>/dev/null && SYSTEM_NAME=`"$dummy"` &&
 	{ echo "$SYSTEM_NAME"; exit; }
 
 # Apollos put the system type in the environment.
@@ -1620,7 +1745,7 @@ test -d /usr/apollo && { echo "$ISP-apollo-$SYSTYPE"; exit; }
 
 echo "$0: unable to guess system type" >&2
 
-case "$UNAME_MACHINE:$UNAME_SYSTEM" in
+case $UNAME_MACHINE:$UNAME_SYSTEM in
     mips:Linux | mips64:Linux)
 	# If we got here on MIPS GNU/Linux, output extra information.
 	cat >&2 <<EOF
@@ -1637,14 +1762,16 @@ This script (version $timestamp), has failed to recognize the
 operating system you are using. If your script is old, overwrite *all*
 copies of config.guess and config.sub with the latest versions from:
 
-  https://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.guess
+  https://git.savannah.gnu.org/cgit/config.git/plain/config.guess
 and
-  https://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.sub
+  https://git.savannah.gnu.org/cgit/config.git/plain/config.sub
 EOF
 
-year=`echo $timestamp | sed 's,-.*,,'`
+our_year=`echo $timestamp | sed 's,-.*,,'`
+thisyear=`date +%Y`
 # shellcheck disable=SC2003
-if test "`expr "\`date +%Y\`" - "$year"`" -lt 3 ; then
+script_age=`expr "$thisyear" - "$our_year"`
+if test "$script_age" -lt 3 ; then
    cat >&2 <<EOF
 
 If $0 has already been updated, send the following data and any
diff --git a/support/gnuconfig/config.sub b/support/gnuconfig/config.sub
index 9bc49a7e92..2c6a07ab3c 100755
--- a/support/gnuconfig/config.sub
+++ b/support/gnuconfig/config.sub
@@ -1,12 +1,14 @@
 #! /bin/sh
 # Configuration validation subroutine script.
-#   Copyright 1992-2020 Free Software Foundation, Inc.
+#   Copyright 1992-2024 Free Software Foundation, Inc.
 
-timestamp='2020-09-08'
+# shellcheck disable=SC2006,SC2268 # see below for rationale
+
+timestamp='2024-01-01'
 
 # This file is free software; you can redistribute it and/or modify it
 # under the terms of the GNU General Public License as published by
-# the Free Software Foundation; either version 3 of the License, or
+# the Free Software Foundation, either version 3 of the License, or
 # (at your option) any later version.
 #
 # This program is distributed in the hope that it will be useful, but
@@ -33,7 +35,7 @@ timestamp='2020-09-08'
 # Otherwise, we print the canonical config type on stdout and succeed.
 
 # You can get the latest version of this script from:
-# https://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.sub
+# https://git.savannah.gnu.org/cgit/config.git/plain/config.sub
 
 # This file is supposed to be the same for all GNU packages
 # and recognize all the CPU types, system types and aliases
@@ -50,6 +52,13 @@ timestamp='2020-09-08'
 #	CPU_TYPE-MANUFACTURER-KERNEL-OPERATING_SYSTEM
 # It is wrong to echo any other type of specification.
 
+# The "shellcheck disable" line above the timestamp inhibits complaints
+# about features and limitations of the classic Bourne shell that were
+# superseded or lifted in POSIX.  However, this script identifies a wide
+# variety of pre-POSIX systems that do not have POSIX shells at all, and
+# even some reasonably current systems (Solaris 10 as case-in-point) still
+# have a pre-POSIX /bin/sh.
+
 me=`echo "$0" | sed -e 's,.*/,,'`
 
 usage="\
@@ -67,13 +76,13 @@ Report bugs and patches to <config-patches@gnu.org>."
 version="\
 GNU config.sub ($timestamp)
 
-Copyright 1992-2020 Free Software Foundation, Inc.
+Copyright 1992-2024 Free Software Foundation, Inc.
 
 This is free software; see the source for copying conditions.  There is NO
 warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE."
 
 help="
-Try \`$me --help' for more information."
+Try '$me --help' for more information."
 
 # Parse command line
 while test $# -gt 0 ; do
@@ -112,14 +121,16 @@ esac
 
 # Split fields of configuration type
 # shellcheck disable=SC2162
+saved_IFS=$IFS
 IFS="-" read field1 field2 field3 field4 <<EOF
 $1
 EOF
+IFS=$saved_IFS
 
 # Separate into logical components for further validation
 case $1 in
 	*-*-*-*-*)
-		echo Invalid configuration \`"$1"\': more than four components >&2
+		echo "Invalid configuration '$1': more than four components" >&2
 		exit 1
 		;;
 	*-*-*-*)
@@ -134,7 +145,8 @@ case $1 in
 			nto-qnx* | linux-* | uclinux-uclibc* \
 			| uclinux-gnu* | kfreebsd*-gnu* | knetbsd*-gnu* | netbsd*-gnu* \
 			| netbsd*-eabi* | kopensolaris*-gnu* | cloudabi*-eabi* \
-			| storm-chaos* | os2-emx* | rtmk-nova*)
+			| storm-chaos* | os2-emx* | rtmk-nova* | managarm-* \
+			| windows-* )
 				basic_machine=$field1
 				basic_os=$maybe_os
 				;;
@@ -163,6 +175,10 @@ case $1 in
 						basic_machine=$field1
 						basic_os=$field2
 						;;
+					zephyr*)
+						basic_machine=$field1-unknown
+						basic_os=$field2
+						;;
 					# Manufacturers
 					dec* | mips* | sequent* | encore* | pc533* | sgi* | sony* \
 					| att* | 7300* | 3300* | delta* | motorola* | sun[234]* \
@@ -922,11 +938,13 @@ case $basic_machine in
 
 	*-*)
 		# shellcheck disable=SC2162
+		saved_IFS=$IFS
 		IFS="-" read cpu vendor <<EOF
 $basic_machine
 EOF
+		IFS=$saved_IFS
 		;;
-	# We use `pc' rather than `unknown'
+	# We use 'pc' rather than 'unknown'
 	# because (1) that's what they normally are, and
 	# (2) the word "unknown" tends to confuse beginning users.
 	i*86 | x86_64)
@@ -1003,6 +1021,11 @@ case $cpu-$vendor in
 		;;
 
 	# Here we normalize CPU types with a missing or matching vendor
+	armh-unknown | armh-alt)
+		cpu=armv7l
+		vendor=alt
+		basic_os=${basic_os:-linux-gnueabihf}
+		;;
 	dpx20-unknown | dpx20-bull)
 		cpu=rs6000
 		vendor=bull
@@ -1053,7 +1076,7 @@ case $cpu-$vendor in
 	pentium-* | p5-* | k5-* | k6-* | nexgen-* | viac3-*)
 		cpu=i586
 		;;
-	pentiumpro-* | p6-* | 6x86-* | athlon-* | athalon_*-*)
+	pentiumpro-* | p6-* | 6x86-* | athlon-* | athlon_*-*)
 		cpu=i686
 		;;
 	pentiumii-* | pentium2-* | pentiumiii-* | pentium3-*)
@@ -1104,7 +1127,7 @@ case $cpu-$vendor in
 	xscale-* | xscalee[bl]-*)
 		cpu=`echo "$cpu" | sed 's/^xscale/arm/'`
 		;;
-	arm64-*)
+	arm64-* | aarch64le-*)
 		cpu=aarch64
 		;;
 
@@ -1158,14 +1181,14 @@ case $cpu-$vendor in
 		case $cpu in
 			1750a | 580 \
 			| a29k \
-			| aarch64 | aarch64_be \
+			| aarch64 | aarch64_be | aarch64c | arm64ec \
 			| abacus \
 			| alpha | alphaev[4-8] | alphaev56 | alphaev6[78] \
 			| alpha64 | alpha64ev[4-8] | alpha64ev56 | alpha64ev6[78] \
 			| alphapca5[67] | alpha64pca5[67] \
 			| am33_2.0 \
 			| amdgcn \
-			| arc | arceb \
+			| arc | arceb | arc32 | arc64 \
 			| arm | arm[lb]e | arme[lb] | armv* \
 			| avr | avr32 \
 			| asmjs \
@@ -1177,45 +1200,29 @@ case $cpu-$vendor in
 			| d10v | d30v | dlx | dsp16xx \
 			| e2k | elxsi | epiphany \
 			| f30[01] | f700 | fido | fr30 | frv | ft32 | fx80 \
+			| javascript \
 			| h8300 | h8500 \
 			| hppa | hppa1.[01] | hppa2.0 | hppa2.0[nw] | hppa64 \
 			| hexagon \
 			| i370 | i*86 | i860 | i960 | ia16 | ia64 \
 			| ip2k | iq2000 \
 			| k1om \
+			| kvx \
 			| le32 | le64 \
 			| lm32 \
+			| loongarch32 | loongarch64 \
 			| m32c | m32r | m32rle \
 			| m5200 | m68000 | m680[012346]0 | m68360 | m683?2 | m68k \
 			| m6811 | m68hc11 | m6812 | m68hc12 | m68hcs12x \
 			| m88110 | m88k | maxq | mb | mcore | mep | metag \
 			| microblaze | microblazeel \
-			| mips | mipsbe | mipseb | mipsel | mipsle \
-			| mips16 \
-			| mips64 | mips64eb | mips64el \
-			| mips64octeon | mips64octeonel \
-			| mips64orion | mips64orionel \
-			| mips64r5900 | mips64r5900el \
-			| mips64vr | mips64vrel \
-			| mips64vr4100 | mips64vr4100el \
-			| mips64vr4300 | mips64vr4300el \
-			| mips64vr5000 | mips64vr5000el \
-			| mips64vr5900 | mips64vr5900el \
-			| mipsisa32 | mipsisa32el \
-			| mipsisa32r2 | mipsisa32r2el \
-			| mipsisa32r6 | mipsisa32r6el \
-			| mipsisa64 | mipsisa64el \
-			| mipsisa64r2 | mipsisa64r2el \
-			| mipsisa64r6 | mipsisa64r6el \
-			| mipsisa64sb1 | mipsisa64sb1el \
-			| mipsisa64sr71k | mipsisa64sr71kel \
-			| mipsr5900 | mipsr5900el \
-			| mipstx39 | mipstx39el \
+			| mips* \
 			| mmix \
 			| mn10200 | mn10300 \
 			| moxie \
 			| mt \
 			| msp430 \
+			| nanomips* \
 			| nds32 | nds32le | nds32be \
 			| nfp \
 			| nios | nios2 | nios2eb | nios2el \
@@ -1229,7 +1236,7 @@ case $cpu-$vendor in
 			| powerpc | powerpc64 | powerpc64le | powerpcle | powerpcspe \
 			| pru \
 			| pyramid \
-			| riscv | riscv32 | riscv64 \
+			| riscv | riscv32 | riscv32be | riscv64 | riscv64be \
 			| rl78 | romp | rs6000 | rx \
 			| s390 | s390x \
 			| score \
@@ -1241,11 +1248,13 @@ case $cpu-$vendor in
 			| sparcv8 | sparcv9 | sparcv9b | sparcv9v | sv1 | sx* \
 			| spu \
 			| tahoe \
+			| thumbv7* \
 			| tic30 | tic4x | tic54x | tic55x | tic6x | tic80 \
 			| tron \
 			| ubicom32 \
 			| v70 | v850 | v850e | v850e1 | v850es | v850e2 | v850e2v3 \
 			| vax \
+			| vc4 \
 			| visium \
 			| w65 \
 			| wasm32 | wasm64 \
@@ -1257,7 +1266,7 @@ case $cpu-$vendor in
 				;;
 
 			*)
-				echo Invalid configuration \`"$1"\': machine \`"$cpu-$vendor"\' not recognized 1>&2
+				echo "Invalid configuration '$1': machine '$cpu-$vendor' not recognized" 1>&2
 				exit 1
 				;;
 		esac
@@ -1278,34 +1287,45 @@ esac
 
 # Decode manufacturer-specific aliases for certain operating systems.
 
-if test x$basic_os != x
+if test x"$basic_os" != x
 then
 
-# First recognize some ad-hoc caes, or perhaps split kernel-os, or else just
+# First recognize some ad-hoc cases, or perhaps split kernel-os, or else just
 # set os.
+obj=
 case $basic_os in
 	gnu/linux*)
 		kernel=linux
-		os=`echo $basic_os | sed -e 's|gnu/linux|gnu|'`
+		os=`echo "$basic_os" | sed -e 's|gnu/linux|gnu|'`
+		;;
+	os2-emx)
+		kernel=os2
+		os=`echo "$basic_os" | sed -e 's|os2-emx|emx|'`
 		;;
 	nto-qnx*)
 		kernel=nto
-		os=`echo $basic_os | sed -e 's|nto-qnx|qnx|'`
+		os=`echo "$basic_os" | sed -e 's|nto-qnx|qnx|'`
 		;;
 	*-*)
 		# shellcheck disable=SC2162
+		saved_IFS=$IFS
 		IFS="-" read kernel os <<EOF
 $basic_os
 EOF
+		IFS=$saved_IFS
 		;;
 	# Default OS when just kernel was specified
 	nto*)
 		kernel=nto
-		os=`echo $basic_os | sed -e 's|nto|qnx|'`
+		os=`echo "$basic_os" | sed -e 's|nto|qnx|'`
 		;;
 	linux*)
 		kernel=linux
-		os=`echo $basic_os | sed -e 's|linux|gnu|'`
+		os=`echo "$basic_os" | sed -e 's|linux|gnu|'`
+		;;
+	managarm*)
+		kernel=managarm
+		os=`echo "$basic_os" | sed -e 's|managarm|mlibc|'`
 		;;
 	*)
 		kernel=
@@ -1326,7 +1346,7 @@ case $os in
 		os=cnk
 		;;
 	solaris1 | solaris1.*)
-		os=`echo $os | sed -e 's|solaris1|sunos4|'`
+		os=`echo "$os" | sed -e 's|solaris1|sunos4|'`
 		;;
 	solaris)
 		os=solaris2
@@ -1355,7 +1375,7 @@ case $os in
 		os=sco3.2v4
 		;;
 	sco3.2.[4-9]*)
-		os=`echo $os | sed -e 's/sco3.2./sco3.2v/'`
+		os=`echo "$os" | sed -e 's/sco3.2./sco3.2v/'`
 		;;
 	sco*v* | scout)
 		# Don't match below
@@ -1431,7 +1451,7 @@ case $os in
 		;;
 	# Preserve the version number of sinix5.
 	sinix5.*)
-		os=`echo $os | sed -e 's|sinix|sysv|'`
+		os=`echo "$os" | sed -e 's|sinix|sysv|'`
 		;;
 	sinix*)
 		os=sysv4
@@ -1472,10 +1492,16 @@ case $os in
 			os=eabi
 			;;
 		    *)
-			os=elf
+			os=
+			obj=elf
 			;;
 		esac
 		;;
+	aout* | coff* | elf* | pe*)
+		# These are machine code file formats, not OSes
+		obj=$os
+		os=
+		;;
 	*)
 		# No normalization, but not necessarily accepted, that comes below.
 		;;
@@ -1494,12 +1520,15 @@ else
 # system, and we'll never get to this point.
 
 kernel=
+obj=
 case $cpu-$vendor in
 	score-*)
-		os=elf
+		os=
+		obj=elf
 		;;
 	spu-*)
-		os=elf
+		os=
+		obj=elf
 		;;
 	*-acorn)
 		os=riscix1.2
@@ -1509,28 +1538,35 @@ case $cpu-$vendor in
 		os=gnu
 		;;
 	arm*-semi)
-		os=aout
+		os=
+		obj=aout
 		;;
 	c4x-* | tic4x-*)
-		os=coff
+		os=
+		obj=coff
 		;;
 	c8051-*)
-		os=elf
+		os=
+		obj=elf
 		;;
 	clipper-intergraph)
 		os=clix
 		;;
 	hexagon-*)
-		os=elf
+		os=
+		obj=elf
 		;;
 	tic54x-*)
-		os=coff
+		os=
+		obj=coff
 		;;
 	tic55x-*)
-		os=coff
+		os=
+		obj=coff
 		;;
 	tic6x-*)
-		os=coff
+		os=
+		obj=coff
 		;;
 	# This must come before the *-dec entry.
 	pdp10-*)
@@ -1552,19 +1588,24 @@ case $cpu-$vendor in
 		os=sunos3
 		;;
 	m68*-cisco)
-		os=aout
+		os=
+		obj=aout
 		;;
 	mep-*)
-		os=elf
+		os=
+		obj=elf
 		;;
 	mips*-cisco)
-		os=elf
+		os=
+		obj=elf
 		;;
-	mips*-*)
-		os=elf
+	mips*-*|nanomips*-*)
+		os=
+		obj=elf
 		;;
 	or32-*)
-		os=coff
+		os=
+		obj=coff
 		;;
 	*-tti)	# must be before sparc entry or we get the wrong os.
 		os=sysv3
@@ -1573,7 +1614,8 @@ case $cpu-$vendor in
 		os=sunos4.1.1
 		;;
 	pru-*)
-		os=elf
+		os=
+		obj=elf
 		;;
 	*-be)
 		os=beos
@@ -1654,10 +1696,12 @@ case $cpu-$vendor in
 		os=uxpv
 		;;
 	*-rom68k)
-		os=coff
+		os=
+		obj=coff
 		;;
 	*-*bug)
-		os=coff
+		os=
+		obj=coff
 		;;
 	*-apple)
 		os=macos
@@ -1675,13 +1719,20 @@ esac
 
 fi
 
-# Now, validate our (potentially fixed-up) OS.
+# Now, validate our (potentially fixed-up) individual pieces (OS, OBJ).
+
 case $os in
-	# Sometimes we do "kernel-abi", so those need to count as OSes.
-	musl* | newlib* | uclibc*)
+	# Sometimes we do "kernel-libc", so those need to count as OSes.
+	llvm* | musl* | newlib* | relibc* | uclibc*)
+		;;
+	# Likewise for "kernel-abi"
+	eabi* | gnueabi*)
 		;;
-	# Likewise for "kernel-libc"
-	eabi | eabihf | gnueabi | gnueabihf)
+	# VxWorks passes extra cpu info in the 4th filed.
+	simlinux | simwindows | spe)
+		;;
+	# See `case $cpu-$os` validation below
+	ghcjs)
 		;;
 	# Now accept the basic system types.
 	# The portable systems comes first.
@@ -1691,20 +1742,20 @@ case $os in
 	     | hpux* | unos* | osf* | luna* | dgux* | auroraux* | solaris* \
 	     | sym* |  plan9* | psp* | sim* | xray* | os68k* | v88r* \
 	     | hiux* | abug | nacl* | netware* | windows* \
-	     | os9* | macos* | osx* | ios* \
+	     | os9* | macos* | osx* | ios* | tvos* | watchos* \
 	     | mpw* | magic* | mmixware* | mon960* | lnews* \
 	     | amigaos* | amigados* | msdos* | newsos* | unicos* | aof* \
 	     | aos* | aros* | cloudabi* | sortix* | twizzler* \
 	     | nindy* | vxsim* | vxworks* | ebmon* | hms* | mvs* \
 	     | clix* | riscos* | uniplus* | iris* | isc* | rtu* | xenix* \
 	     | mirbsd* | netbsd* | dicos* | openedition* | ose* \
-	     | bitrig* | openbsd* | solidbsd* | libertybsd* | os108* \
+	     | bitrig* | openbsd* | secbsd* | solidbsd* | libertybsd* | os108* \
 	     | ekkobsd* | freebsd* | riscix* | lynxos* | os400* \
-	     | bosx* | nextstep* | cxux* | aout* | elf* | oabi* \
-	     | ptx* | coff* | ecoff* | winnt* | domain* | vsta* \
+	     | bosx* | nextstep* | cxux* | oabi* \
+	     | ptx* | ecoff* | winnt* | domain* | vsta* \
 	     | udi* | lites* | ieee* | go32* | aux* | hcos* \
-	     | chorusrdb* | cegcc* | glidix* \
-	     | cygwin* | msys* | pe* | moss* | proelf* | rtems* \
+	     | chorusrdb* | cegcc* | glidix* | serenity* \
+	     | cygwin* | msys* | moss* | proelf* | rtems* \
 	     | midipix* | mingw32* | mingw64* | mint* \
 	     | uxpv* | beos* | mpeix* | udk* | moxiebox* \
 	     | interix* | uwin* | mks* | rhapsody* | darwin* \
@@ -1716,44 +1767,117 @@ case $os in
 	     | skyos* | haiku* | rdos* | toppers* | drops* | es* \
 	     | onefs* | tirtos* | phoenix* | fuchsia* | redox* | bme* \
 	     | midnightbsd* | amdhsa* | unleashed* | emscripten* | wasi* \
-	     | nsk* | powerunix* | genode* | zvmoe* | qnx* )
+	     | nsk* | powerunix* | genode* | zvmoe* | qnx* | emx* | zephyr* \
+	     | fiwix* | mlibc* | cos* | mbr* | ironclad* )
 		;;
 	# This one is extra strict with allowed versions
 	sco3.2v2 | sco3.2v[4-9]* | sco5v6*)
 		# Don't forget version if it is 3.2v4 or newer.
 		;;
+	# This refers to builds using the UEFI calling convention
+	# (which depends on the architecture) and PE file format.
+	# Note that this is both a different calling convention and
+	# different file format than that of GNU-EFI
+	# (x86_64-w64-mingw32).
+	uefi)
+		;;
 	none)
 		;;
+	kernel* | msvc* )
+		# Restricted further below
+		;;
+	'')
+		if test x"$obj" = x
+		then
+			echo "Invalid configuration '$1': Blank OS only allowed with explicit machine code file format" 1>&2
+		fi
+		;;
+	*)
+		echo "Invalid configuration '$1': OS '$os' not recognized" 1>&2
+		exit 1
+		;;
+esac
+
+case $obj in
+	aout* | coff* | elf* | pe*)
+		;;
+	'')
+		# empty is fine
+		;;
 	*)
-		echo Invalid configuration \`"$1"\': OS \`"$os"\' not recognized 1>&2
+		echo "Invalid configuration '$1': Machine code format '$obj' not recognized" 1>&2
+		exit 1
+		;;
+esac
+
+# Here we handle the constraint that a (synthetic) cpu and os are
+# valid only in combination with each other and nowhere else.
+case $cpu-$os in
+	# The "javascript-unknown-ghcjs" triple is used by GHC; we
+	# accept it here in order to tolerate that, but reject any
+	# variations.
+	javascript-ghcjs)
+		;;
+	javascript-* | *-ghcjs)
+		echo "Invalid configuration '$1': cpu '$cpu' is not valid with os '$os$obj'" 1>&2
 		exit 1
 		;;
 esac
 
 # As a final step for OS-related things, validate the OS-kernel combination
 # (given a valid OS), if there is a kernel.
-case $kernel-$os in
-	linux-gnu* | linux-dietlibc* | linux-android* | linux-newlib* | linux-musl* | linux-uclibc* )
+case $kernel-$os-$obj in
+	linux-gnu*- | linux-android*- | linux-dietlibc*- | linux-llvm*- \
+		    | linux-mlibc*- | linux-musl*- | linux-newlib*- \
+		    | linux-relibc*- | linux-uclibc*- )
 		;;
-	uclinux-uclibc* )
+	uclinux-uclibc*- )
 		;;
-	-dietlibc* | -newlib* | -musl* | -uclibc* )
+	managarm-mlibc*- | managarm-kernel*- )
+		;;
+	windows*-msvc*-)
+		;;
+	-dietlibc*- | -llvm*- | -mlibc*- | -musl*- | -newlib*- | -relibc*- \
+		    | -uclibc*- )
 		# These are just libc implementations, not actual OSes, and thus
 		# require a kernel.
-		echo "Invalid configuration \`$1': libc \`$os' needs explicit kernel." 1>&2
+		echo "Invalid configuration '$1': libc '$os' needs explicit kernel." 1>&2
 		exit 1
 		;;
-	kfreebsd*-gnu* | kopensolaris*-gnu*)
+	-kernel*- )
+		echo "Invalid configuration '$1': '$os' needs explicit kernel." 1>&2
+		exit 1
 		;;
-	nto-qnx*)
+	*-kernel*- )
+		echo "Invalid configuration '$1': '$kernel' does not support '$os'." 1>&2
+		exit 1
 		;;
-	*-eabi* | *-gnueabi*)
+	*-msvc*- )
+		echo "Invalid configuration '$1': '$os' needs 'windows'." 1>&2
+		exit 1
+		;;
+	kfreebsd*-gnu*- | kopensolaris*-gnu*-)
+		;;
+	vxworks-simlinux- | vxworks-simwindows- | vxworks-spe-)
+		;;
+	nto-qnx*-)
+		;;
+	os2-emx-)
 		;;
-	-*)
+	*-eabi*- | *-gnueabi*-)
+		;;
+	none--*)
+		# None (no kernel, i.e. freestanding / bare metal),
+		# can be paired with an machine code file format
+		;;
+	-*-)
 		# Blank kernel with real OS is always fine.
 		;;
-	*-*)
-		echo "Invalid configuration \`$1': Kernel \`$kernel' not known to work with OS \`$os'." 1>&2
+	--*)
+		# Blank kernel and OS with real machine code file format is always fine.
+		;;
+	*-*-*)
+		echo "Invalid configuration '$1': Kernel '$kernel' not known to work with OS '$os'." 1>&2
 		exit 1
 		;;
 esac
@@ -1836,7 +1960,7 @@ case $vendor in
 		;;
 esac
 
-echo "$cpu-$vendor-${kernel:+$kernel-}$os"
+echo "$cpu-$vendor${kernel:+-$kernel}${os:+-$os}${obj:+-$obj}"
 exit
 
 # Local variables:
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
