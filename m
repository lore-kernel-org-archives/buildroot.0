Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95EF6CA0ED1
	for <buildroot@archiver.kernel.org>; Wed, 13 Sep 2023 04:43:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12DDB41951;
	Wed, 13 Sep 2023 04:43:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 12DDB41951
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XDnUH5WpNa5N; Wed, 13 Sep 2023 04:43:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F9DF41955;
	Wed, 13 Sep 2023 04:43:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F9DF41955
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 05AB81BF5A3
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 04:43:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CBF9460B2F
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 04:43:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CBF9460B2F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7yzRyMqYMBhy for <buildroot@lists.busybox.net>;
 Wed, 13 Sep 2023 04:43:34 +0000 (UTC)
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com
 [IPv6:2607:f8b0:4864:20::e2e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ED2A660A62
 for <buildroot@buildroot.org>; Wed, 13 Sep 2023 04:43:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED2A660A62
Received: by mail-vs1-xe2e.google.com with SMTP id
 ada2fe7eead31-44d60bb6aa5so2673858137.2
 for <buildroot@buildroot.org>; Tue, 12 Sep 2023 21:43:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694580212; x=1695185012;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zoAcVg5qzajuWF0by+BboZNusmwJgI/nwZNn0q7OeuM=;
 b=ANeYqdaqMiPZljh5n7xxf8LSqIcrPK+FDXR5XS/6edjI/5nDV5KCwtKCybr4uBpFhq
 JaIJeB5eE1CpBTSeitEg+JTBK5urb3MMQgbF1HHStPuU+FnCann1Bd88CqkxfdprzlRe
 g9o56GCaUNpCG4MDC7j3F3rSjXu/9/9ncDv2GyARDNdKXP90bArk1cLFS7WqeiNtRc1n
 KJBYT6kgQ8OupBUnjB5auXT7b0ROyvElOkfLHNP5r7IIIITu17Yf6/pSdCY2M8oexpVO
 4AN5yJ/RjiO5H4W6LHB4i8Q7fo4Wh7KjJ55x3Qch/9i9eZcSsi6uBDI94t/GHjVsx2zi
 JtXA==
X-Gm-Message-State: AOJu0YxDkjcGS1iWySV3EPEPzl+74ohrWrKCcJDK/cut7Q1N4+rLVwxa
 ow/WsNlRmW7yVupQvvKnoJM0Wd31z2xfMhytf2WcHMKZt/57vg==
X-Google-Smtp-Source: AGHT+IFmYEa9DDrPOf4KSVk87fIFXYbxkbWM89EuIeV466Sb0cjhQrD/hYR0zTiQKVYC7Oe3bEInR7InXAssudp2NIk=
X-Received: by 2002:a67:f503:0:b0:44e:82c3:5b88 with SMTP id
 u3-20020a67f503000000b0044e82c35b88mr1133606vsn.22.1694580212317; Tue, 12 Sep
 2023 21:43:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAEVrM6T=5vb98vVUr4AxNWf7xV6VSLyuNME1HpxW=KVJR1vvQw@mail.gmail.com>
In-Reply-To: <CAEVrM6T=5vb98vVUr4AxNWf7xV6VSLyuNME1HpxW=KVJR1vvQw@mail.gmail.com>
From: Wit <linuxcdeveloper@gmail.com>
Date: Wed, 13 Sep 2023 06:41:48 +0200
Message-ID: <CAEVrM6QhnK8kbQDtjzx8_rNLTq4s96EK=vUQz-vf1QVZUpt64g@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694580212; x=1695185012; darn=buildroot.org;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zoAcVg5qzajuWF0by+BboZNusmwJgI/nwZNn0q7OeuM=;
 b=cql4Uui1Y1pXZaxojXue3qZD9jkwcwR9Ibm+T8A8Gc9PgtmaDQPtEUcxI7AjwnnUEP
 /fK7r8lrfg8HzseM0npVN6DIww2DLdfyUjpFaLhIpkhp5VbL9LraiRzfQLP7vx0YfIeo
 OzSz91h6KEPcOkBIiqgm+WNGS/Q1BxfBj79soDhXe0Q+pFAYkEswjKRWIFei/ZxqlvW/
 Frgw6viS2KuPXOU/eQVcfmMRj5rVrPy7BstycCTiJtn3dfcoEYUMtWRWbYy+BeiQpgQy
 8roCsoY5D9Ld0G19P7w87ab5Nr2jwmdzG0k8w+P3Sd1zaXtmdzn39f1uEFottdeLDVh8
 LGnA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=cql4Uui1
Subject: [Buildroot] Fwd: [PATCH] fs/user-initrd: add new method for
 building customizable INITRD
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

Hello All!

As for now user has not much influence on creation of contents of an
INITRD image I've made some proof of concept of some wider idea of
creating customizable INITRD image.
This patch adds possibility of creating customizable INITRD image by
selecting some of packages to install. At the moment it supports only
glibc builds but I planned to add support for musl and uClibc as well.
I've got also some other plans regarding this patch.
This patch adds new submenu in "Filesystem images" main menu.

I'm sending this patch for evaluation. If the idea of this patch is ok
for you I could take care of developing it.

Signed-off-by: Witold Kowolik <linuxcdeveloper@gmail.com>
---
 fs/Config.in                                |   1 +
 fs/user-initrd/Config.in                    |  82 +++++++++
 fs/user-initrd/deps.pl                      | 193 ++++++++++++++++++++
 fs/user-initrd/skel/bin/.placeholder        |   0
 fs/user-initrd/skel/dev/mapper/.placeholder |   0
 fs/user-initrd/skel/etc/init.d/rcS          |   8 +
 fs/user-initrd/skel/etc/ld.so.conf          |   1 +
 fs/user-initrd/skel/init                    |   1 +
 fs/user-initrd/skel/lib/.placeholder        |   0
 fs/user-initrd/skel/lib64                   |   1 +
 fs/user-initrd/skel/mnt/.placeholder        |   0
 fs/user-initrd/skel/proc/.placeholder       |   0
 fs/user-initrd/skel/run/.placeholder        |   0
 fs/user-initrd/skel/sbin                    |   1 +
 fs/user-initrd/skel/sys/.placeholder        |   0
 fs/user-initrd/skel/tmp/.placeholder        |   0
 fs/user-initrd/skel/usr/bin                 |   1 +
 fs/user-initrd/skel/usr/lib                 |   1 +
 fs/user-initrd/skel/usr/sbin                |   1 +
 fs/user-initrd/user-initrd-libc.mk          |  12 ++
 fs/user-initrd/user-initrd-packages.mk      |  40 ++++
 fs/user-initrd/user-initrd.mk               |  41 +++++
 22 files changed, 384 insertions(+)
 create mode 100644 fs/user-initrd/Config.in
 create mode 100755 fs/user-initrd/deps.pl
 create mode 100644 fs/user-initrd/skel/bin/.placeholder
 create mode 100644 fs/user-initrd/skel/dev/mapper/.placeholder
 create mode 100755 fs/user-initrd/skel/etc/init.d/rcS
 create mode 100644 fs/user-initrd/skel/etc/ld.so.conf
 create mode 120000 fs/user-initrd/skel/init
 create mode 100644 fs/user-initrd/skel/lib/.placeholder
 create mode 120000 fs/user-initrd/skel/lib64
 create mode 100644 fs/user-initrd/skel/mnt/.placeholder
 create mode 100644 fs/user-initrd/skel/proc/.placeholder
 create mode 100644 fs/user-initrd/skel/run/.placeholder
 create mode 120000 fs/user-initrd/skel/sbin
 create mode 100644 fs/user-initrd/skel/sys/.placeholder
 create mode 100644 fs/user-initrd/skel/tmp/.placeholder
 create mode 120000 fs/user-initrd/skel/usr/bin
 create mode 120000 fs/user-initrd/skel/usr/lib
 create mode 120000 fs/user-initrd/skel/usr/sbin
 create mode 100644 fs/user-initrd/user-initrd-libc.mk
 create mode 100644 fs/user-initrd/user-initrd-packages.mk
 create mode 100644 fs/user-initrd/user-initrd.mk

diff --git a/fs/Config.in b/fs/Config.in
index eee5e26bb2..f115a8cfac 100644
--- a/fs/Config.in
+++ b/fs/Config.in
@@ -17,6 +17,7 @@ source "fs/squashfs/Config.in"
 source "fs/tar/Config.in"
 source "fs/ubi/Config.in"
 source "fs/ubifs/Config.in"
+source "fs/user-initrd/Config.in"
 source "fs/yaffs2/Config.in"

 endmenu
diff --git a/fs/user-initrd/Config.in b/fs/user-initrd/Config.in
new file mode 100644
index 0000000000..668522fa3f
--- /dev/null
+++ b/fs/user-initrd/Config.in
@@ -0,0 +1,82 @@
+menuconfig BR2_PACKAGE_USER_INITRD
+ bool "customizable user INITRD"
+ default n
+ help
+  This option allows to create customizable user INITRD.
+  As a C library currently only glibc can be used.
+
+  Resulting initrd.gz file will be located in "output/images"
+  directory.
+
+if BR2_PACKAGE_USER_INITRD
+
+if BR2_TOOLCHAIN_BUILDROOT_UCLIBC
+comment "Currently only glibc can be used as a C library for INITRD."
+comment "But currently uClibc C library is selected in toolchain options."
+comment "Enable glibc to see options below."
+endif
+
+if BR2_TOOLCHAIN_BUILDROOT_GLIBC
+comment "glibc will be used as a C library"
+endif
+
+if BR2_TOOLCHAIN_BUILDROOT_MUSL
+comment "Currently only glibc can be used as a C library for INITRD."
+comment "But currently musl C library is selected in toolchain options."
+comment "Enable glibc to see options below."
+endif
+
+config BR2_PACKAGE_USER_INITRD_BASH
+ bool "bash"
+ default n
+ depends on BR2_PACKAGE_BASH
+ depends on BR2_TOOLCHAIN_BUILDROOT_GLIBC
+
+config BR2_PACKAGE_USER_INITRD_CRYPTSETUP
+ bool "cryptsetup"
+ default n
+ depends on BR2_PACKAGE_CRYPTSETUP
+ depends on BR2_TOOLCHAIN_BUILDROOT_GLIBC
+
+config BR2_PACKAGE_USER_INITRD_BUSYBOX
+ bool "busybox"
+ default n
+ depends on BR2_PACKAGE_BUSYBOX
+ depends on BR2_TOOLCHAIN_BUILDROOT_GLIBC
+
+config BR2_PACKAGE_USER_INITRD_COREUTILS
+ bool "coreutils"
+ default n
+ depends on BR2_PACKAGE_COREUTILS
+ depends on BR2_TOOLCHAIN_BUILDROOT_GLIBC
+
+config BR2_PACKAGE_USER_INITRD_PROCPS_NG
+ bool "procps-ng"
+ default n
+ depends on BR2_PACKAGE_PROCPS_NG
+ depends on BR2_TOOLCHAIN_BUILDROOT_GLIBC
+
+if BR2_TOOLCHAIN_BUILDROOT_GLIBC
+
+if !BR2_PACKAGE_BASH
+comment "bash must be enabled to be able to select it to INITRD"
+endif
+
+if !BR2_PACKAGE_CRYPTSETUP
+comment "cryptsetup must be enabled to be able to select it to INITRD"
+endif
+
+if !BR2_PACKAGE_BUSYBOX
+comment "busybox must be enabled to be able to select it to INITRD"
+endif
+
+if !BR2_PACKAGE_COREUTILS
+comment "coreutils must be enabled to be able to select it to INITRD"
+endif
+
+if !BR2_PACKAGE_PROCPS_NG
+comment "procps-ng must be enabled to be able to select it to INITRD"
+endif
+
+endif
+endif
diff --git a/fs/user-initrd/deps.pl b/fs/user-initrd/deps.pl
new file mode 100755
index 0000000000..a8591cafea
--- /dev/null
+++ b/fs/user-initrd/deps.pl
@@ -0,0 +1,193 @@
+#!/usr/bin/perl -w
+
+use Getopt::Long;
+use strict;
+
+my @deps;
+my $logh;
+my $argc = $#ARGV + 1;
+
+if ($argc < 7) {
+ printf("Dependency finder for initrd.");
+ printf("Error: not enough parameters. All the parameters below are
obligatory.\n");
+ printf("Usage:\n");
+ printf("\nInput parameters:\n");
+ printf("--ld-linux: Full path to host ld-linux.so dynamic linker\n");
+ printf(" example:
--ld-linux=/devel/buildroot/output/host/ld-linux-x86-64.so.2\n");
+ printf("--lib-dir: Full path to \"lib\" source directory with the
target libraries for resolving libraries dependencies\n");
+ printf(" example: --lib-dir=/devel/buildroot/output/target/lib\n");
+ printf("--bin-dir: Full path to \"bin\" source directory with binary
ELF executables that will be placed in initrd\n");
+ printf(" example: --bin-dir=/devel/buildroot/output/target/bin\n");
+ printf("--src-rootfs: Full path to rootfs source directory\n");
+ printf(" example: --src-rootfs=/devel/buildroot/output/target\n");
+ printf("--host-dir: Full path to \"host\" directory \n");
+ printf(" example: --host-dir=/devel/output/host\n");
+ printf("\nOutput parameters:\n");
+ printf("--output-dir: Full path to output directory with target
rootfs filesystem where \"lib\" directory will be filled with
libraries\n");
+ printf(" example:
--output-dir=/devel/buildroot/output/build/user-initrd/skel\n");
+ printf("--deps-file: Full path to file where information about all
the found dependencies will be stored\n");
+ printf(" example:
--deps-file=/devel/buildroot/output/build/user-initrd/deps.txt\n");
+ exit;
+}
+
+GetOptions(
+ 'ld-linux=s' => \my $ld_linux,
+ 'lib-dir=s' => \my $lib_dir,
+ 'bin-dir=s' => \my $bin_dir,
+ 'output-dir=s' => \my $output_dir,
+ 'deps-file=s' => \my $deps_file,
+ 'src-rootfs=s' => \my $src_rootfs,
+ 'host-dir=s' => \my $host_dir,
+);
+
+if (defined $deps_file) {
+ open($logh, ">", $deps_file);
+ syswrite($logh, "List of dependencies of binaries and libraries:\n\n");
+}
+
+# Check for duplicates and conditionally insert new dependency
(library) to @deps array.
+sub insert_dependency
+{
+ my $lib = shift;
+ my $i = 0;
+ my $end = $#deps + 1;
+ my $found = 0;
+
+ while ($i < $end) {
+ if ($deps[$i] eq $lib) {
+ $found = 1;
+ last;
+ }
+ $i++;
+ }
+
+ if (!$found) {
+ push(@deps, $lib);
+ }
+}
+
+# Check dependencies using ld-linux dynamic linker/loader, ldd and objdump.
+sub ld_linux
+{
+ my $n = shift;
+ my $objdump = "$host_dir/bin/objdump";
+ my $ldd = "$host_dir/sysroot/bin/ldd";
+
+ # Redirect stderrr to /dev/null
+ open STDERR, '>/dev/null';
+
+ my $ldlin_out = `$ld_linux --inhibit-cache --library-path $lib_dir --list $n`;
+
+ # Chop ending eol if exists.
+ if ($n =~ '[^\\n]+\\n') {
+ chop($n);
+ }
+
+ # Maintain the libexec corner case.
+ if ($ldlin_out eq '') {
+ # Run "objdump -p <lib>" and look for RUNPATH.
+ my $obj = `$objdump -p $n`;
+ (my $runpath) = ($obj =~ '.*RUNPATH\s+([^\\n]+)\n.*');
+
+ # Copy files from libexec directory.
+ if (defined $runpath && $runpath ne '') {
+ my $s = `ls -la $src_rootfs/$runpath`;
+ `mkdir -p $output_dir/$runpath`;
+ `cp -ar $src_rootfs/$runpath/* $output_dir/$runpath`;
+ }
+
+ # Run "ldd" on library and fetch rest of library's dependencies.
+ $ldd = `$ldd $n`;
+
+ # Paths from ldd have no target architecture prefix so add it here:
+ my $line = sprintf("\n%s:\n", $n);
+ syswrite($logh, $line);
+ my @list = split('\n', $ldd);
+
+ foreach my $i (@list) {
+ (my $lib, my $path) = ($i =~ "([^ ]+) +=> +([^ ]+).*");
+ if (defined $lib && defined $path && $path ne "not") {
+ insert_dependency("$src_rootfs/$path");
+ syswrite($logh, " $src_rootfs/$path\n");
+ }
+ }
+ } else {
+ # Standard way: use ld-linux.
+ # Print header line with the name of the ELF binary or library.
+ my $line = sprintf("\n%s:\n", $n);
+ syswrite($logh, $line);
+
+ my @list = split('\n', $ldlin_out);
+ foreach my $i (@list) {
+ (my $lib, my $path) = ($i =~ "([^ ]+) +=> +([^ ]+).*");
+ if (defined $lib && defined $path && $path ne "not") {
+ insert_dependency($path);
+ syswrite($logh, " $path\n");
+ }
+ }
+ }
+}
+
+
+# Main procedure.
+
+my @elfs = `find $bin_dir/ -type f`;
+foreach my $elf (@elfs) {
+ my $f = `file -bi $elf`;
+
+ # Only two executable type of files are taken into account:
+ # 1. application/x-executable; charset=binary
+ # 2. application/x-pie-executable; charset=binary
+ my $x_exe = "application/x-executable; charset=binary";
+ my $x_piexe = "application/x-pie-executable; charset=binary";
+ if ($f =~ /$x_exe/ || $f =~ /$x_piexe/) {
+ ld_linux($elf);
+ }
+}
+
+# Check libraries dependencies.
+my $start = 0;
+my $end = $#deps + 1;
+while (1) {
+ while ($start < $end) {
+ ld_linux($deps[$start]);
+ $start++;
+ }
+
+ # Check if after ld_linux() number of elements in @deps array increased.
+ # If yes then check dependencies of newly found libraries.
+ if ($end != $#deps + 1) {
+ $end = $#deps + 1;
+ }
+
+ # Exit main loop if all the dependencies already checked.
+ if ($start >= $end) {
+ last;
+ }
+}
+close($logh);
+
+# Remove ld-linux from @deps because it comes from host tools
+# and it is not needed in "lib" directory.
+for (my $i = 0; $i < $#deps + 1; $i++) {
+ if ($deps[$i] =~ '.*/ld-linux.*') {
+ splice(@deps, $i, 1);
+ }
+}
+
+# Copy libraries to initrd target "lib" directory.
+for (my $i = 0; $i < $#deps + 1; $i++) {
+ (my $dir, my $libname) = ($deps[$i] =~ '(.*\/)([^\.]+)\..*');
+ `cp -a $dir/$libname.*so* $output_dir/lib`;
+ `cp -a $dir/$libname-*so* $output_dir/lib >& /dev/null`;
+}
+
+# Copy ld-linux from target dir.
+`cp -a $lib_dir/ld-linux-* $output_dir/lib/`;
+`cp -a $lib_dir/ld-linux.* $output_dir/lib/ >& /dev/null`;
+`ln -sf ld-linux-x86-64.so.2 $output_dir/lib/ld-linux.so.2`;
+`ln -sf ../lib/ld-linux-x86-64.so.2 $output_dir/bin/ld.so`;
+
+
+# Make "/etc/ld.so.cache".
+`ldconfig $output_dir/lib -r $output_dir`;
diff --git a/fs/user-initrd/skel/bin/.placeholder
b/fs/user-initrd/skel/bin/.placeholder
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/fs/user-initrd/skel/dev/mapper/.placeholder
b/fs/user-initrd/skel/dev/mapper/.placeholder
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/fs/user-initrd/skel/etc/init.d/rcS
b/fs/user-initrd/skel/etc/init.d/rcS
new file mode 100755
index 0000000000..d369b84215
--- /dev/null
+++ b/fs/user-initrd/skel/etc/init.d/rcS
@@ -0,0 +1,8 @@
+#!/bin/sh
+
+mount -t devtmpfs none /dev
+mount /dev/sda1 /mnt
+
+# Here is the place for some other actions.
+
+exec switch_root /mnt /usr/lib/systemd/systemd --system
diff --git a/fs/user-initrd/skel/etc/ld.so.conf
b/fs/user-initrd/skel/etc/ld.so.conf
new file mode 100644
index 0000000000..502167fa0b
--- /dev/null
+++ b/fs/user-initrd/skel/etc/ld.so.conf
@@ -0,0 +1 @@
+/lib
diff --git a/fs/user-initrd/skel/init b/fs/user-initrd/skel/init
new file mode 120000
index 0000000000..50d438c463
--- /dev/null
+++ b/fs/user-initrd/skel/init
@@ -0,0 +1 @@
+/etc/init.d/rcS
\ No newline at end of file
diff --git a/fs/user-initrd/skel/lib/.placeholder
b/fs/user-initrd/skel/lib/.placeholder
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/fs/user-initrd/skel/lib64 b/fs/user-initrd/skel/lib64
new file mode 120000
index 0000000000..7951405f85
--- /dev/null
+++ b/fs/user-initrd/skel/lib64
@@ -0,0 +1 @@
+lib
\ No newline at end of file
diff --git a/fs/user-initrd/skel/mnt/.placeholder
b/fs/user-initrd/skel/mnt/.placeholder
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/fs/user-initrd/skel/proc/.placeholder
b/fs/user-initrd/skel/proc/.placeholder
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/fs/user-initrd/skel/run/.placeholder
b/fs/user-initrd/skel/run/.placeholder
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/fs/user-initrd/skel/sbin b/fs/user-initrd/skel/sbin
new file mode 120000
index 0000000000..c5e82d7458
--- /dev/null
+++ b/fs/user-initrd/skel/sbin
@@ -0,0 +1 @@
+bin
\ No newline at end of file
diff --git a/fs/user-initrd/skel/sys/.placeholder
b/fs/user-initrd/skel/sys/.placeholder
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/fs/user-initrd/skel/tmp/.placeholder
b/fs/user-initrd/skel/tmp/.placeholder
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/fs/user-initrd/skel/usr/bin b/fs/user-initrd/skel/usr/bin
new file mode 120000
index 0000000000..19f285ac7c
--- /dev/null
+++ b/fs/user-initrd/skel/usr/bin
@@ -0,0 +1 @@
+../bin
\ No newline at end of file
diff --git a/fs/user-initrd/skel/usr/lib b/fs/user-initrd/skel/usr/lib
new file mode 120000
index 0000000000..dc598c56dc
--- /dev/null
+++ b/fs/user-initrd/skel/usr/lib
@@ -0,0 +1 @@
+../lib
\ No newline at end of file
diff --git a/fs/user-initrd/skel/usr/sbin b/fs/user-initrd/skel/usr/sbin
new file mode 120000
index 0000000000..19f285ac7c
--- /dev/null
+++ b/fs/user-initrd/skel/usr/sbin
@@ -0,0 +1 @@
+../bin
\ No newline at end of file
diff --git a/fs/user-initrd/user-initrd-libc.mk
b/fs/user-initrd/user-initrd-libc.mk
new file mode 100644
index 0000000000..19c888aa80
--- /dev/null
+++ b/fs/user-initrd/user-initrd-libc.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# Select one of the allowed C library builds. Temporarily only glibc available.
+#
+################################################################################
+
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT_GLIBC),y)
+define USER_INITRD_LIBC_GLIBC_INSTALL
+ make glibc-reinstall TARGET_DIR=$(USER_INITRD_OUTPUT_DIR)
+endef
+USER_INITRD_BUILD_HOOKS += $(USER_INITRD_LIBC_GLIBC_INSTALL)
+endif
diff --git a/fs/user-initrd/user-initrd-packages.mk
b/fs/user-initrd/user-initrd-packages.mk
new file mode 100644
index 0000000000..c0e10beefa
--- /dev/null
+++ b/fs/user-initrd/user-initrd-packages.mk
@@ -0,0 +1,40 @@
+################################################################################
+#
+# Select packages to be included in INITRD
+#
+################################################################################
+
+ifeq ($(BR2_PACKAGE_USER_INITRD_BASH),y)
+define USER_INITRD_PACKAGES_BASH_INSTALL
+ make bash-reinstall TARGET_DIR=$(USER_INITRD_OUTPUT_DIR)
+endef
+USER_INITRD_BUILD_HOOKS += $(USER_INITRD_PACKAGES_BASH_INSTALL)
+endif
+
+ifeq ($(BR2_PACKAGE_USER_INITRD_CRYPTSETUP),y)
+define USER_INITRD_PACKAGES_CRYPTSETUP_INSTALL
+ make cryptsetup-reinstall TARGET_DIR=$(USER_INITRD_OUTPUT_DIR)
+endef
+USER_INITRD_BUILD_HOOKS += $(USER_INITRD_PACKAGES_CRYPTSETUP_INSTALL)
+endif
+
+ifeq ($(BR2_PACKAGE_USER_INITRD_BUSYBOX),y)
+define USER_INITRD_PACKAGES_BUSYBOX_INSTALL
+ make busybox-reinstall TARGET_DIR=$(USER_INITRD_OUTPUT_DIR)
+endef
+USER_INITRD_BUILD_HOOKS += $(USER_INITRD_PACKAGES_BUSYBOX_INSTALL)
+endif
+
+ifeq ($(BR2_PACKAGE_USER_INITRD_COREUTILS),y)
+define USER_INITRD_PACKAGES_COREUTILS_INSTALL
+ make coreutils-reinstall TARGET_DIR=$(USER_INITRD_OUTPUT_DIR)
+endef
+USER_INITRD_BUILD_HOOKS += $(USER_INITRD_PACKAGES_COREUTILS_INSTALL)
+endif
+
+ifeq ($(BR2_PACKAGE_USER_INITRD_PROCPS_NG),y)
+define USER_INITRD_PACKAGES_PROCPS_NG_INSTALL
+ make procps-ng-reinstall TARGET_DIR=$(USER_INITRD_OUTPUT_DIR)
+endef
+USER_INITRD_BUILD_HOOKS += $(USER_INITRD_PACKAGES_PROCPS_NG_INSTALL)
+endif
diff --git a/fs/user-initrd/user-initrd.mk b/fs/user-initrd/user-initrd.mk
new file mode 100644
index 0000000000..344792e1b1
--- /dev/null
+++ b/fs/user-initrd/user-initrd.mk
@@ -0,0 +1,41 @@
+################################################################################
+#
+# Build customizable user initrd
+#
+################################################################################
+
+USER_INITRD_LD_LINUX = $(STAGING_DIR)/usr/lib/ld-linux-x86-64.so.2
+USER_INITRD_TARGET_LIB_DIR = $(TARGET_DIR)/lib
+USER_INITRD_TARGET_BIN_DIR = $(TARGET_DIR)/bin
+USER_INITRD_OUTPUT_DIR = $(@D)/skel
+USER_INITRD_DEPS_FILE = $(@D)/deps.txt
+
+include fs/user-initrd/user-initrd-packages.mk
+include fs/user-initrd/user-initrd-libc.mk
+
+define USER_INITRD_EXTRACT_CMDS
+ cp -r $(USER_INITRD_PKGDIR)/skel $(@D)
+ find $(@D)/skel -type f -name .placeholder -exec rm {} \;
+endef
+
+define USER_INITRD_BUILD_CMDS
+ $(USER_INITRD_BUILD_HOOKS)
+ $(USER_INITRD_PKGDIR)/deps.pl \
+ --ld-linux=$(USER_INITRD_LD_LINUX) \
+ --lib-dir=$(USER_INITRD_TARGET_LIB_DIR) \
+ --bin-dir=$(USER_INITRD_OUTPUT_DIR)/bin \
+ --output-dir=$(USER_INITRD_OUTPUT_DIR) \
+ --deps-file=$(USER_INITRD_DEPS_FILE) \
+ --src-rootfs=$(USER_INITRD_TARGET_DIR) \
+ --host-dir=$(HOST_DIR)/$(GNU_TARGET_NAME)
+ rm -rf $(USER_INITRD_OUTPUT_DIR)/usr/share/{doc,info,man}
+ rm -rf $(USER_INITRD_OUTPUT_DIR)/usr/include
+ find $(USER_INITRD_OUTPUT_DIR)/bin/ $(USER_INITRD_OUTPUT_DIR)/lib/
-type f -exec strip -d {} \;
+ cd $(USER_INITRD_OUTPUT_DIR) && find ./ -mindepth 1 | cpio -o  -H
newc | gzip -9 -c > ../initrd.gz
+endef
+
+define USER_INITRD_INSTALL_TARGET_CMDS
+ $(INSTALL) -D -m 0444 $(@D)/initrd.gz $(BINARIES_DIR)/initrd.gz
+endef
+
+$(eval $(generic-package))
-- 
2.42.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
