Return-Path: <SRS0=Hlwc=NJ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	MIME_HTML_MOSTLY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,WEIRD_PORT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CD40C4338F
	for <buildroot@archiver.kernel.org>; Wed, 18 Aug 2021 01:32:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84B0661029
	for <buildroot@archiver.kernel.org>; Wed, 18 Aug 2021 01:32:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 84B0661029
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nklabs.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 38426400CC;
	Wed, 18 Aug 2021 01:32:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CKHSo3SpqEYg; Wed, 18 Aug 2021 01:32:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 69F2E40144;
	Wed, 18 Aug 2021 01:32:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8646C1BF352
 for <buildroot@lists.busybox.net>; Wed, 18 Aug 2021 01:32:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6FC7F80DFF
 for <buildroot@lists.busybox.net>; Wed, 18 Aug 2021 01:32:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=nklabs-com.20150623.gappssmtp.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BkAPTwszz9jg for <buildroot@lists.busybox.net>;
 Wed, 18 Aug 2021 01:32:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 587ED80DFE
 for <buildroot@busybox.net>; Wed, 18 Aug 2021 01:32:44 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id q16so695859ioj.0
 for <buildroot@busybox.net>; Tue, 17 Aug 2021 18:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nklabs-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=53eOD1uuc3ij0g1Rp1N1/ijSQXn0f1Cs8H+Hjj2ofmo=;
 b=Ro7pji2lD0fDJplHg4fXcbB6+l3IaF8f26LyWIu8+Xr8pB8rSSWxQTsfLdFTfuCpHu
 EoEmvH5888fIPUFqOmFl3T5eq2IZuRxzoiSgjN9TsxPo1l9R3gRUC+EriGJiY0zTrMPw
 +U8xrv9db1tB2nJO2UIo3wKWTOMYeTdDNDz0k82OmmJjdQ8yiHB7W0vcyKoK41vRM0BT
 P6A0yyEvXGuCiXJC0rGVFWb2WaMb938Mht1NFgbCw2Hsk3MJdvXS/dRHHcVs+RHliVW9
 8hCaqlfAwGbGPyMd4WWrRFSuCG922ipmbvYLV/fZGDwI+ZPRsPdLRjaIunQf7IO2edqT
 LZag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=53eOD1uuc3ij0g1Rp1N1/ijSQXn0f1Cs8H+Hjj2ofmo=;
 b=FlucD9Bcdhr/t6SwMrM2+sGlnIQFeNrkV1l7hAXSBk/VeB9ymOVHIm9OHTUrKtLNSE
 9lLu33kwv+ZMHaLS26S/u+zjZF5i1IhyhdKKBYIvd0A+ibVcSUVqQot8+RL6JRiV56+F
 RDWLmX3KQ3fXTJc4Qcf8Y1+gj5EzC+gd43LhbIurdBrjM2unXxU8QcBM9MDYYMRjyY7E
 KU4sdxgH7KgkweP7QgxGOiCo2yyUXZkv2Vl5ZBvcm8cAYueiFrnXQ1bIYGhz6Soz9YtV
 PPAaFVhkdDy2hjm4uBh92Rm4RyE4wW614dQboPXyTpD0Bfj/sNw0oaQxGF2rNXvaouTk
 zmVg==
X-Gm-Message-State: AOAM530vKeJnwNrbyf2IAWjZKL02xt72jKrLbGx5CrfGiIfeubffWT/l
 yQ09e1Dw4PBtxYjQPQ5l74veIu1xgEnHvoncUQ+h65fKnUeMvA==
X-Google-Smtp-Source: ABdhPJzqC8y6iysVcXotjknL3fGyeM8d2C5ExtxURhM+tIsLOF02lp0Dy9qm+vW3yWqZw6eAsqloYEFtmq5k//7/us0=
X-Received: by 2002:a02:a490:: with SMTP id d16mr5834399jam.42.1629250362793; 
 Tue, 17 Aug 2021 18:32:42 -0700 (PDT)
MIME-Version: 1.0
From: Patricia Holden <pholden@nklabs.com>
Date: Tue, 17 Aug 2021 21:32:32 -0400
Message-ID: <CAJ6EmCdUjQ1gurB9MmUWmw7+DMcARdFjGTO80D=+j2dY_CLh3Q@mail.gmail.com>
To: "buildroot@busybox.net" <buildroot@busybox.net>
Subject: [Buildroot] Problem with Buildroot Version 2020.02.12
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============8387444152880149707=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============8387444152880149707==
Content-Type: multipart/alternative; boundary="0000000000001ff4eb05c9cb6920"

--0000000000001ff4eb05c9cb6920
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I just started a clean build for client after pulling code from their
Github repository.  I am getting the following error with package
host-libglib2 2.62.4 and have no idea why.  Build has been working just
fine for a while.  Any suggestions?
Error log from build:

>>> host-libglib2 2.62.4 Downloading
--2021-08-17 21:09:09--
http://ftp.gnome.org/pub/gnome/sources/glib/2.62/glib-2.62.4.tar.xz
Resolving ftp.gnome.org (ftp.gnome.org)... 2620:52:3:1:5054:ff:fe0d:ee0f,
2620:52:3:1:5054:ff:fede:8714, 2620:52:3:1:5054:ff:fedd:5ad0, ...
Connecting to ftp.gnome.org
(ftp.gnome.org)|2620:52:3:1:5054:ff:fe0d:ee0f|:80...
connected.
HTTP request sent, awaiting response... 302 Found
Location:
https://ftp.gnome.org/pub/gnome/sources/glib/2.62/glib-2.62.4.tar.xz
[following]
--2021-08-17 21:09:09--
https://ftp.gnome.org/pub/gnome/sources/glib/2.62/glib-2.62.4.tar.xz
Connecting to ftp.gnome.org
(ftp.gnome.org)|2620:52:3:1:5054:ff:fe0d:ee0f|:443...
connected.
HTTP request sent, awaiting response... 301 Moved Permanently
Location: https://download.gnome.org/sources/glib/2.62/glib-2.62.4.tar.xz
[following]
--2021-08-17 21:09:09--
https://download.gnome.org/sources/glib/2.62/glib-2.62.4.tar.xz
Resolving download.gnome.org (download.gnome.org)...
2620:52:3:1:5054:ff:fede:8714, 2620:52:3:1:5054:ff:fedd:5ad0,
2620:52:3:1:5054:ff:fe0d:ee0f, ...
Connecting to download.gnome.org
(download.gnome.org)|2620:52:3:1:5054:ff:fede:8714|:443...
connected.
HTTP request sent, awaiting response... 302 Found
Location: https://mirror.umd.edu/gnome/sources/glib/2.62/glib-2.62.4.tar.xz
[following]
--2021-08-17 21:09:09--
https://mirror.umd.edu/gnome/sources/glib/2.62/glib-2.62.4.tar.xz
Resolving mirror.umd.edu (mirror.umd.edu)... 128.8.207.141
Connecting to mirror.umd.edu (mirror.umd.edu)|128.8.207.141|:443...
connected.
HTTP request sent, awaiting response... 200 OK
Length: 4684768 (4.5M) [application/octet-stream]
Saving to:
=E2=80=98/home/patricaholden/williamson/build08132021/Pro3-Linux/buildroot-=
2020.02/output/build/.glib-2.62.4.tar.xz.B5Pk6o/output=E2=80=99

/home/patricaholden 100%[=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D>]   4.47M  6.36MB/s    in 0.7s


2021-08-17 21:09:10 (6.36 MB/s) -
=E2=80=98/home/patricaholden/williamson/build08132021/Pro3-Linux/buildroot-=
2020.02/output/build/.glib-2.62.4.tar.xz.B5Pk6o/output=E2=80=99
saved [4684768/4684768]

glib-2.62.4.tar.xz: OK (sha256:
4c84030d77fa9712135dfa8036ad663925655ae95b1d19399b6200e869925bbc)
>>> host-libglib2 2.62.4 Extracting
xzcat
/home/patricaholden/williamson/build08132021/Pro3-Linux/buildroot-2020.02/d=
l/libglib2/glib-2.62.4.tar.xz
| tar --strip-components=3D1 -C
/home/patricaholden/williamson/build08132021/Pro3-Linux/buildroot-2020.02/o=
utput/build/host-libglib2-2.62.4
  -xf -
>>> host-libglib2 2.62.4 Patching

Applying 0001-fix-compile-time-atomic-detection.patch using patch:
patching file glib/gthread-posix.c

Applying 0002-allow-explicit-disabling-of-tests.patch using patch:
patching file meson.build

Applying 0003-remove-cpp-requirement.patch using patch:
patching file glib/glibconfig.h.in
patching file meson.build
patching file tests/meson.build

Applying 0004-Add-Wno-format-nonliteral-to-compiler-arguments.patch using
patch:
patching file meson.build
>>> host-libglib2 2.62.4 Configuring
rm -rf
/home/patricaholden/williamson/build08132021/Pro3-Linux/buildroot-2020.02/o=
utput/build/host-libglib2-2.62.4//build
mkdir -p
/home/patricaholden/williamson/build08132021/Pro3-Linux/buildroot-2020.02/o=
utput/build/host-libglib2-2.62.4//build
PATH=3D"/home/patricaholden/williamson/build08132021/Pro3-Linux/buildroot-2=
020.02/output/host/bin:/home/patricaholden/williamson/build08132021/Pro3-Li=
nux/buildroot-2020.02/output/host/sbin:/usr/local/sbin:/usr/local/bin:/usr/=
sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"
PKG_CONFIG=3D"/home/patricaholden/williamson/build08132021/Pro3-Linux/build=
root-2020.02/output/host/bin/pkg-config"
PKG_CONFIG_SYSROOT_DIR=3D"/" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=3D1
PKG_CONFIG_ALLOW_SYSTEM_LIBS=3D1
PKG_CONFIG_LIBDIR=3D"/home/patricaholden/williamson/build08132021/Pro3-Linu=
x/buildroot-2020.02/output/host/lib/pkgconfig:/home/patricaholden/williamso=
n/build08132021/Pro3-Linux/buildroot-2020.02/output/host/share/pkgconfig"
AR=3D"/usr/bin/ar" AS=3D"/usr/bin/as" LD=3D"/usr/bin/ld" NM=3D"/usr/bin/nm"
CC=3D"/usr/bin/gcc" GCC=3D"/usr/bin/gcc" CXX=3D"/usr/bin/g++" CPP=3D"/usr/b=
in/cpp"
OBJCOPY=3D"/usr/bin/objcopy" RANLIB=3D"/usr/bin/ranlib"
CPPFLAGS=3D"-I/home/patricaholden/williamson/build08132021/Pro3-Linux/build=
root-2020.02/output/host/include"
CFLAGS=3D"-O2
-I/home/patricaholden/williamson/build08132021/Pro3-Linux/buildroot-2020.02=
/output/host/include"
CXXFLAGS=3D"-O2
-I/home/patricaholden/williamson/build08132021/Pro3-Linux/buildroot-2020.02=
/output/host/include"
LDFLAGS=3D"-L/home/patricaholden/williamson/build08132021/Pro3-Linux/buildr=
oot-2020.02/output/host/lib
-Wl,-rpath,/home/patricaholden/williamson/build08132021/Pro3-Linux/buildroo=
t-2020.02/output/host/lib"
INTLTOOL_PERL=3D/usr/bin/perl  PYTHONNOUSERSITE=3Dy
/home/patricaholden/williamson/build08132021/Pro3-Linux/buildroot-2020.02/o=
utput/host/bin/meson
--prefix=3D/home/patricaholden/williamson/build08132021/Pro3-Linux/buildroo=
t-2020.02/output/host
--libdir=3Dlib
--sysconfdir=3D/home/patricaholden/williamson/build08132021/Pro3-Linux/buil=
droot-2020.02/output/host/etc
--localstatedir=3D/home/patricaholden/williamson/build08132021/Pro3-Linux/b=
uildroot-2020.02/output/host/var
--default-library=3Dshared --buildtype=3Drelease -Ddtrace=3Dfalse -Dfam=3Df=
alse
-Dselinux=3Ddisabled -Dsystemtap=3Dfalse -Dxattr=3Dfalse -Dinternal_pcre=3D=
false
-Dinstalled_tests=3Dfalse -Doss_fuzz=3Ddisabled
/home/patricaholden/williamson/build08132021/Pro3-Linux/buildroot-2020.02/o=
utput/build/host-libglib2-2.62.4/
/home/patricaholden/williamson/build08132021/Pro3-Linux/buildroot-2020.02/o=
utput/build/host-libglib2-2.62.4//build
The Meson build system
Version: 0.53.1
Source dir:
/home/patricaholden/williamson/build08132021/Pro3-Linux/buildroot-2020.02/o=
utput/build/host-libglib2-2.62.4
Build dir:
/home/patricaholden/williamson/build08132021/Pro3-Linux/buildroot-2020.02/o=
utput/build/host-libglib2-2.62.4/build
Build type: native build
Project name: glib
Project version: 2.62.4
Appending CFLAGS from environment: '-O2
-I/home/patricaholden/williamson/build08132021/Pro3-Linux/buildroot-2020.02=
/output/host/include'
Appending LDFLAGS from environment:
['-L/home/patricaholden/williamson/build08132021/Pro3-Linux/buildroot-2020.=
02/output/host/lib',
'-Wl,-rpath,/home/patricaholden/williamson/build08132021/Pro3-Linux/buildro=
ot-2020.02/output/host/lib']
Appending CPPFLAGS from environment:
'-I/home/patricaholden/williamson/build08132021/Pro3-Linux/buildroot-2020.0=
2/output/host/include'
Appending CFLAGS from environment: '-O2
-I/home/patricaholden/williamson/build08132021/Pro3-Linux/buildroot-2020.02=
/output/host/include'
Appending LDFLAGS from environment:
['-L/home/patricaholden/williamson/build08132021/Pro3-Linux/buildroot-2020.=
02/output/host/lib',
'-Wl,-rpath,/home/patricaholden/williamson/build08132021/Pro3-Linux/buildro=
ot-2020.02/output/host/lib']
Appending CPPFLAGS from environment:
'-I/home/patricaholden/williamson/build08132021/Pro3-Linux/buildroot-2020.0=
2/output/host/include'
C compiler for the host machine: /usr/bin/gcc (gcc 7.5.0 "gcc (Ubuntu
7.5.0-3ubuntu1~18.04) 7.5.0")
C linker for the host machine: /usr/bin/gcc GNU ld.bfd 2.30
Host machine cpu family: x86_64
Host machine cpu: x86_64
Compiler for C supports arguments -fno-strict-aliasing: YES
Checking if "GNU C visibility attributes test" compiles: YES
Compiler for C supports arguments -fvisibility=3Dhidden: YES
Has header "alloca.h" : YES
Has header "crt_externs.h" : NO
Has header "dirent.h" : YES
Has header "float.h" : YES
Has header "fstab.h" : YES
Has header "grp.h" : YES
Has header "inttypes.h" : YES
Has header "limits.h" : YES
Has header "linux/magic.h" : YES
Has header "locale.h" : YES
Has header "mach/mach_time.h" : NO
Has header "memory.h" : YES
Has header "mntent.h" : YES
Has header "poll.h" : YES
Has header "pwd.h" : YES
Has header "sched.h" : YES
Has header "spawn.h" : YES
Has header "stdint.h" : YES
Has header "stdlib.h" : YES
Has header "string.h" : YES
Has header "strings.h" : YES
Has header "sys/auxv.h" : YES
Has header "sys/event.h" : NO
Has header "sys/filio.h" : NO
Has header "sys/inotify.h" : YES
Has header "sys/mkdev.h" : NO
Has header "sys/mntctl.h" : NO
Has header "sys/mnttab.h" : NO
Has header "sys/mount.h" : YES
Has header "sys/param.h" : YES
Has header "sys/resource.h" : YES
Has header "sys/select.h" : YES
Has header "sys/statfs.h" : YES
Has header "sys/stat.h" : YES
Has header "sys/statvfs.h" : YES
Has header "sys/sysctl.h" : YES
Has header "sys/time.h" : YES
Has header "sys/times.h" : YES
Has header "sys/types.h" : YES
Has header "sys/uio.h" : YES
Has header "sys/vfs.h" : YES
Has header "sys/vfstab.h" : NO
Has header "sys/vmount.h" : NO
Has header "sys/wait.h" : YES
Has header "termios.h" : YES
Has header "unistd.h" : YES
Has header "values.h" : YES
Has header "wchar.h" : YES
Has header "xlocale.h" : NO
Checking if "malloc.h" compiles: YES
Has header "linux/netlink.h" : YES
Header <locale.h> has symbol "LC_MESSAGES" : YES
Checking whether type "struct stat" has member "st_mtimensec" : NO
Checking whether type "struct stat" has member "st_mtim.tv_nsec" : YES
Checking whether type "struct stat" has member "st_atimensec" : NO
Checking whether type "struct stat" has member "st_atim.tv_nsec" : YES
Checking whether type "struct stat" has member "st_ctimensec" : NO
Checking whether type "struct stat" has member "st_ctim.tv_nsec" : YES
Checking whether type "struct stat" has member "st_birthtime" : NO
Checking whether type "struct stat" has member "st_birthtimensec" : NO
Checking whether type "struct stat" has member "st_birthtim" : NO
Checking whether type "struct stat" has member "st_birthtim.tv_nsec" : NO
Checking whether type "struct stat" has member "st_blksize" : YES
Checking whether type "struct stat" has member "st_blocks" : YES
Checking whether type "struct statfs" has member "f_fstypename" : NO
Checking whether type "struct statfs" has member "f_bavail" : YES
Checking whether type "struct dirent" has member "d_type" : YES
Checking whether type "struct statvfs" has member "f_basetype" : NO
Checking whether type "struct statvfs" has member "f_fstypename" : NO
Checking whether type "struct tm" has member "tm_gmtoff" : YES
Checking whether type "struct tm" has member "__tm_gmtoff" : NO
Compiler for C supports arguments -Wall: YES
Compiler for C supports arguments -Wduplicated-branches: YES
Compiler for C supports arguments -Wimplicit-fallthrough: YES
Compiler for C supports arguments -Wmisleading-indentation: YES
Compiler for C supports arguments -Wstrict-prototypes: YES
Compiler for C supports arguments -Wunused: YES
Compiler for C supports arguments -Wno-unused-parameter -Wunused-parameter:
YES
Compiler for C supports arguments -Wno-bad-function-cast
-Wbad-function-cast: YES
Compiler for C supports arguments -Wno-cast-function-type
-Wcast-function-type: NO
Compiler for C supports arguments -Wno-format-nonliteral
-Wformat-nonliteral: YES
Compiler for C supports arguments -Wno-pedantic -Wpedantic: YES
Compiler for C supports arguments -Werror=3Ddeclaration-after-statement: YE=
S
Compiler for C supports arguments -Werror=3Dformat=3D2: YES
Compiler for C supports arguments -Werror=3Dimplicit-function-declaration:
YES
Compiler for C supports arguments -Werror=3Dinit-self: YES
Compiler for C supports arguments -Werror=3Dmissing-include-dirs: YES
Compiler for C supports arguments -Werror=3Dmissing-prototypes: YES
Compiler for C supports arguments -Werror=3Dpointer-arith: YES
meson.build:390: WARNING: Consider using the built-in warning_level option
instead of using "-Wall".
Compiler for C supports link arguments -Wl,-z,nodelete: YES
Compiler for C supports link arguments -Wl,-Bsymbolic-functions: YES
Checking for function "endmntent" : YES
Checking for function "endservent" : YES
Checking for function "fallocate" : YES
Checking for function "fchmod" : YES
Checking for function "fchown" : YES
Checking for function "fdwalk" : NO
Checking for function "fsync" : YES
Checking for function "getauxval" : YES
Checking for function "getc_unlocked" : YES
Checking for function "getfsstat" : NO
Checking for function "getgrgid_r" : YES
Checking for function "getmntent_r" : YES
Checking for function "getpwuid_r" : YES
Checking for function "getresuid" : YES
Checking for function "getvfsstat" : NO
Checking for function "gmtime_r" : YES
Checking for function "hasmntopt" : YES
Checking for function "inotify_init1" : YES
Checking for function "issetugid" : NO
Checking for function "kevent" : NO
Checking for function "kqueue" : NO
Checking for function "lchmod" : NO
Checking for function "lchown" : YES
Checking for function "link" : YES
Checking for function "localtime_r" : YES
Checking for function "lstat" : YES
Checking for function "mbrtowc" : YES
Checking for function "memalign" : YES
Checking for function "mmap" : YES
Checking for function "newlocale" : YES
Checking for function "pipe2" : YES
Checking for function "poll" : YES
Checking for function "prlimit" : YES
Checking for function "readlink" : YES
Checking for function "recvmmsg" : YES
Checking for function "sendmmsg" : YES
Checking for function "setenv" : YES
Checking for function "setmntent" : YES
Checking for function "strerror_r" : YES
Checking for function "strnlen" : YES
Checking for function "strsignal" : YES
Checking for function "strtod_l" : YES
Checking for function "strtoll_l" : YES
Checking for function "strtoull_l" : YES
Checking for function "symlink" : YES
Checking for function "timegm" : YES
Checking for function "unsetenv" : YES
Checking for function "uselocale" : YES
Checking for function "utimes" : YES
Checking for function "valloc" : YES
Checking for function "vasprintf" : YES
Checking for function "vsnprintf" : YES
Checking for function "wcrtomb" : YES
Checking for function "wcslen" : YES
Checking for function "wcsnlen" : YES
Checking for function "sysctlbyname" : NO
Checking for function "_NSGetEnviron" : NO
Checking for function "statvfs" : YES
Checking for function "statfs" : YES
Checking for function "if_indextoname" : YES
Checking for function "if_nametoindex" : YES
Checking for function "splice" : YES
Checking for function "stpcpy" : YES
Checking for function "posix_memalign" : YES
Checking for function "posix_spawn" : YES
Checking if "strerror_r() returns char *" compiles: YES
Checking for function "snprintf" : YES
Checking for function "strcasecmp" : YES
Checking for function "strncasecmp" : YES
Header <sys/sysmacros.h> has symbol "major" : YES
Header <dlfcn.h> has symbol "RTLD_LAZY" : YES
Header <dlfcn.h> has symbol "RTLD_NOW" : YES
Header <dlfcn.h> has symbol "RTLD_GLOBAL" : YES
Header <dlfcn.h> has symbol "RTLD_NEXT" : YES
Message: Checking whether to use statfs or statvfs .. statfs
Checking for function "mkostemp" : YES
Checking if "futex(2) system call" links: YES
Checking if "eventfd(2) system call" links: YES
Checking if "clock_gettime" links: YES
Checking if "dlopen() and dlsym() in system libraries" links: NO
Checking if "dlopen() and dlsym() in libdl" links: YES
Library dl found: YES
Checking if "number of arguments to statfs() (n=3D2)" compiles: YES
Checking if "open() option O_DIRECTORY" compiles: YES
Checking if "C99 vsnprintf" runs: YES
Checking if "C99 snprintf" runs: YES
Checking if "Unix98 printf positional parameters" runs: YES
Checking if "nl_langinfo and CODESET" links: YES
Checking if "nl_langinfo (PM_STR)" links: YES
Checking if "nl_langinfo (_NL_CTYPE_OUTDIGITn_MB)" links: YES
Checking if "nl_langinfo (ALTMON_n)" links: YES
Checking if "nl_langinfo (_NL_ABALTMON_n)" links: YES
Checking if "signed" compiles: YES
Header <stddef.h> has symbol "ptrdiff_t" : YES
Checking if "sig_atomic_t" links: YES
Checking if "long long" compiles: YES
Checking if "long double" compiles: YES
Header <stddef.h> has symbol "wchar_t" : YES
Header <wchar.h> has symbol "wint_t" : YES
Checking if "uintmax_t in inttypes.h" compiles: YES
Checking if "uintmax_t in stdint.h" compiles: YES
Checking for size of "char" : 1
Checking for size of "short" : 2
Checking for size of "int" : 4
Checking for size of "void*" : 8
Checking for size of "long" : 8
Checking for size of "long long" : 8
Checking for size of "size_t" : 8
Checking for size of "ssize_t" : 8
Checking if "int64_t is long" compiles: YES
Checking for alignment of "char" : 1
Checking for alignment of "short" : 2
Checking for alignment of "int" : 4
Checking for alignment of "void*" : 8
Checking for alignment of "long" : 8
Checking for alignment of "long long" : 8
Checking for alignment of "size_t" : 8
Checking for size of "wchar_t" : 4
Checking if "__va_copy check" compiles: YES
Checking if "va_copy check" compiles: YES
Checking if "va_lists can be copied as values" runs: DID NOT COMPILE
Checking if "ISO C99 varargs macros in C" compiles: YES
Checking if "GNUC varargs macros" compiles: YES
Has header "alloca.h" : YES (cached)
Has header "sys/poll.h" : YES
Has header "sys/types.h" : YES (cached)
Has header "winsock2.h" : NO
Computing int of "POLLIN" : 1
Computing int of "POLLOUT" : 4
Computing int of "POLLPRI" : 2
Computing int of "POLLERR" : 8
Computing int of "POLLHUP" : 16
Computing int of "POLLNVAL" : 32
Computing int of "AF_UNIX" : 1
Computing int of "AF_INET" : 2
Computing int of "AF_INET6" : 10
Computing int of "MSG_OOB" : 1
Computing int of "MSG_PEEK" : 2
Computing int of "MSG_DONTROUTE" : 4
Checking if "atomic ops" links: YES
Checking if "atomic ops define" compiles: YES
Run-time dependency threads found: YES
Header <pthread.h> has symbol "pthread_attr_setstacksize" : YES
Header <pthread.h> has symbol "pthread_condattr_setclock" : YES
Header <pthread.h> has symbol "pthread_cond_timedwait_relative_np" : NO
Header <pthread.h> has symbol "pthread_getname_np" : YES
Checking if "pthread_setname_np(const char*)" with dependency threads
links: NO
Checking if "pthread_setname_np(pthread_t, const char*)" with dependency
threads links: YES
Checking if "stack grows check" runs: NO (1)
Checking for function "iconv_open" : YES
Found pkg-config:
/home/patricaholden/williamson/build08132021/Pro3-Linux/buildroot-2020.02/o=
utput/host/bin/pkg-config
(1.6.1)
Run-time dependency libpcre found: YES 8.43
Library m found: YES
Run-time dependency libffi found: YES 3.3
Run-time dependency zlib found: YES 1.2.11
Checking for function "ngettext" : YES
Checking for function "bind_textdomain_codeset" : YES
Run-time dependency mount found: YES 2.35.1
Dependency libselinux skipped: feature selinux disabled
Checking for function "strlcpy" : NO
Checking if "/proc/self/cmdline" runs: YES
Program python3 found: YES
(/home/patricaholden/williamson/build08132021/Pro3-Linux/buildroot-2020.02/=
output/host/bin/python3)
Program bash found: YES (/bin/bash)
Program sh found: YES (/bin/sh)
Program env found: YES (/usr/bin/env)
Configuring glibconfig.h using configuration
Configuring gtester-report using configuration
Configuring libglib-2.0.so.0.6200.4-gdb.py using configuration
Configuring glib-genmarshal using configuration
Program
/home/patricaholden/williamson/build08132021/Pro3-Linux/buildroot-2020.02/o=
utput/build/host-libglib2-2.62.4/build/gobject/glib-genmarshal
found: YES
(/home/patricaholden/williamson/build08132021/Pro3-Linux/buildroot-2020.02/=
output/build/host-libglib2-2.62.4/build/gobject/glib-genmarshal)
Configuring glib-mkenums using configuration
Program
/home/patricaholden/williamson/build08132021/Pro3-Linux/buildroot-2020.02/o=
utput/build/host-libglib2-2.62.4/build/gobject/glib-mkenums
found: YES
(/home/patricaholden/williamson/build08132021/Pro3-Linux/buildroot-2020.02/=
output/build/host-libglib2-2.62.4/build/gobject/glib-mkenums)
Configuring libgobject-2.0.so.0.6200.4-gdb.py using configuration
Checking if "dlsym() preceding underscores" with dependency -ldl runs: NO
(1)
Checking for function "dlerror" with dependency -ldl: YES
Configuring gmoduleconf.h using configuration
Checking if "C_IN in public headers (no arpa/nameser_compat.h needed)"
compiles: YES
Checking if "res_query()" links: NO
Checking if "res_query() in -lresolv" links: YES
Library resolv found: YES
Checking if "socket()" links: YES
Checking if "res_init()" links: YES
Checking if "res_nclose()" links: YES
Checking if "res_ndestroy()" links: NO
Checking if "res_ninit()" links: YES
Checking if "res_nquery()" links: YES
Checking for type "struct ip_mreqn" : YES
Checking if "ioctl with request SIOCGIFADDR" compiles: YES
Configuring gnetworking.h using configuration
Configuring gdbus-codegen using configuration
Program
/home/patricaholden/williamson/build08132021/Pro3-Linux/buildroot-2020.02/o=
utput/build/host-libglib2-2.62.4/build/gio/gdbus-2.0/codegen/gdbus-codegen
found: YES
(/home/patricaholden/williamson/build08132021/Pro3-Linux/buildroot-2020.02/=
output/build/host-libglib2-2.62.4/build/gio/gdbus-2.0/codegen/gdbus-codegen=
)
Configuring config.py using configuration
Found CMake: /snap/bin/cmake (3.21.1)
Appending CXXFLAGS from environment: '-O2
-I/home/patricaholden/williamson/build08132021/Pro3-Linux/buildroot-2020.02=
/output/host/include'
Appending LDFLAGS from environment:
['-L/home/patricaholden/williamson/build08132021/Pro3-Linux/buildroot-2020.=
02/output/host/lib',
'-Wl,-rpath,/home/patricaholden/williamson/build08132021/Pro3-Linux/buildro=
ot-2020.02/output/host/lib']
Appending CPPFLAGS from environment:
'-I/home/patricaholden/williamson/build08132021/Pro3-Linux/buildroot-2020.0=
2/output/host/include'
Traceback (most recent call last):
  File
"/home/patricaholden/williamson/build08132021/Pro3-Linux/buildroot-2020.02/=
output/host/lib/python3.8/site-packages/mesonbuild/mesonmain.py",
line 129, in run
    return options.run_func(options)
  File
"/home/patricaholden/williamson/build08132021/Pro3-Linux/buildroot-2020.02/=
output/host/lib/python3.8/site-packages/mesonbuild/msetup.py",
line 245, in run
    app.generate()
  File
"/home/patricaholden/williamson/build08132021/Pro3-Linux/buildroot-2020.02/=
output/host/lib/python3.8/site-packages/mesonbuild/msetup.py",
line 159, in generate
    self._generate(env)
  File
"/home/patricaholden/williamson/build08132021/Pro3-Linux/buildroot-2020.02/=
output/host/lib/python3.8/site-packages/mesonbuild/msetup.py",
line 192, in _generate
    intr.run()
  File
"/home/patricaholden/williamson/build08132021/Pro3-Linux/buildroot-2020.02/=
output/host/lib/python3.8/site-packages/mesonbuild/interpreter.py",
line 4165, in run
    super().run()
  File
"/home/patricaholden/williamson/build08132021/Pro3-Linux/buildroot-2020.02/=
output/host/lib/python3.8/site-packages/mesonbuild/interpreterbase.py",
line 412, in run
    self.evaluate_codeblock(self.ast, start=3D1)
  File
"/home/patricaholden/williamson/build08132021/Pro3-Linux/buildroot-2020.02/=
output/host/lib/python3.8/site-packages/mesonbuild/interpreterbase.py",
line 436, in evaluate_codeblock
    raise e
  File
"/home/patricaholden/williamson/build08132021/Pro3-Linux/buildroot-2020.02/=
output/host/lib/python3.8/site-packages/mesonbuild/interpreterbase.py",
line 430, in evaluate_codeblock
    self.evaluate_statement(cur)
  File
"/home/patricaholden/williamson/build08132021/Pro3-Linux/buildroot-2020.02/=
output/host/lib/python3.8/site-packages/mesonbuild/interpreterbase.py",
line 441, in evaluate_statement
    return self.function_call(cur)
  File
"/home/patricaholden/williamson/build08132021/Pro3-Linux/buildroot-2020.02/=
output/host/lib/python3.8/site-packages/mesonbuild/interpreterbase.py",
line 788, in function_call
    return func(node, posargs, kwargs)
  File
"/home/patricaholden/williamson/build08132021/Pro3-Linux/buildroot-2020.02/=
output/host/lib/python3.8/site-packages/mesonbuild/interpreterbase.py",
line 285, in wrapped
    return f(*wrapped_args, **wrapped_kwargs)
  File
"/home/patricaholden/williamson/build08132021/Pro3-Linux/buildroot-2020.02/=
output/host/lib/python3.8/site-packages/mesonbuild/interpreterbase.py",
line 174, in wrapped
    return f(*wrapped_args, **wrapped_kwargs)
  File
"/home/patricaholden/williamson/build08132021/Pro3-Linux/buildroot-2020.02/=
output/host/lib/python3.8/site-packages/mesonbuild/interpreter.py",
line 3687, in func_subdir
    self.evaluate_codeblock(codeblock)
  File
"/home/patricaholden/williamson/build08132021/Pro3-Linux/buildroot-2020.02/=
output/host/lib/python3.8/site-packages/mesonbuild/interpreterbase.py",
line 436, in evaluate_codeblock
    raise e
  File
"/home/patricaholden/williamson/build08132021/Pro3-Linux/buildroot-2020.02/=
output/host/lib/python3.8/site-packages/mesonbuild/interpreterbase.py",
line 430, in evaluate_codeblock
    self.evaluate_statement(cur)
  File
"/home/patricaholden/williamson/build08132021/Pro3-Linux/buildroot-2020.02/=
output/host/lib/python3.8/site-packages/mesonbuild/interpreterbase.py",
line 443, in evaluate_statement
    return self.assignment(cur)
  File
"/home/patricaholden/williamson/build08132021/Pro3-Linux/buildroot-2020.02/=
output/host/lib/python3.8/site-packages/mesonbuild/interpreterbase.py",
line 1064, in assignment
    value =3D self.evaluate_statement(node.value)
  File
"/home/patricaholden/williamson/build08132021/Pro3-Linux/buildroot-2020.02/=
output/host/lib/python3.8/site-packages/mesonbuild/interpreterbase.py",
line 441, in evaluate_statement
    return self.function_call(cur)
  File
"/home/patricaholden/williamson/build08132021/Pro3-Linux/buildroot-2020.02/=
output/host/lib/python3.8/site-packages/mesonbuild/interpreterbase.py",
line 788, in function_call
    return func(node, posargs, kwargs)
  File
"/home/patricaholden/williamson/build08132021/Pro3-Linux/buildroot-2020.02/=
output/host/lib/python3.8/site-packages/mesonbuild/interpreterbase.py",
line 285, in wrapped
    return f(*wrapped_args, **wrapped_kwargs)
  File
"/home/patricaholden/williamson/build08132021/Pro3-Linux/buildroot-2020.02/=
output/host/lib/python3.8/site-packages/mesonbuild/interpreterbase.py",
line 285, in wrapped
    return f(*wrapped_args, **wrapped_kwargs)
  File
"/home/patricaholden/williamson/build08132021/Pro3-Linux/buildroot-2020.02/=
output/host/lib/python3.8/site-packages/mesonbuild/interpreterbase.py",
line 285, in wrapped
    return f(*wrapped_args, **wrapped_kwargs)
  [Previous line repeated 2 more times]
  File
"/home/patricaholden/williamson/build08132021/Pro3-Linux/buildroot-2020.02/=
output/host/lib/python3.8/site-packages/mesonbuild/interpreterbase.py",
line 155, in wrapped
    ret =3D f(*wrapped_args, **wrapped_kwargs)
  File
"/home/patricaholden/williamson/build08132021/Pro3-Linux/buildroot-2020.02/=
output/host/lib/python3.8/site-packages/mesonbuild/interpreterbase.py",
line 174, in wrapped
    return f(*wrapped_args, **wrapped_kwargs)
  File
"/home/patricaholden/williamson/build08132021/Pro3-Linux/buildroot-2020.02/=
output/host/lib/python3.8/site-packages/mesonbuild/interpreter.py",
line 3234, in func_dependency
    d =3D self.dependency_impl(name, display_name, kwargs)
  File
"/home/patricaholden/williamson/build08132021/Pro3-Linux/buildroot-2020.02/=
output/host/lib/python3.8/site-packages/mesonbuild/interpreter.py",
line 3281, in dependency_impl
    dep =3D dependencies.find_external_dependency(name, self.environment,
kwargs)
  File
"/home/patricaholden/williamson/build08132021/Pro3-Linux/buildroot-2020.02/=
output/host/lib/python3.8/site-packages/mesonbuild/dependencies/base.py",
line 2236, in find_external_dependency
    d =3D c()
  File
"/home/patricaholden/williamson/build08132021/Pro3-Linux/buildroot-2020.02/=
output/host/lib/python3.8/site-packages/mesonbuild/dependencies/base.py",
line 1110, in __init__
    CMakeDependency.class_cmakeinfo[self.for_machine] =3D
self._get_cmake_info()
  File
"/home/patricaholden/williamson/build08132021/Pro3-Linux/buildroot-2020.02/=
output/host/lib/python3.8/site-packages/mesonbuild/dependencies/base.py",
line 1203, in _get_cmake_info
    'cmake_root': temp_parser.get_cmake_var('MESON_CMAKE_ROOT')[0],
IndexError: list index out of range
package/pkg-generic.mk:254: recipe for target
'/home/patricaholden/williamson/build08132021/Pro3-Linux/buildroot-2020.02/=
output/build/host-libglib2-2.62.4/.stamp_configured'
failed
make[1]: ***
[/home/patricaholden/williamson/build08132021/Pro3-Linux/buildroot-2020.02/=
output/build/host-libglib2-2.62.4/.stamp_configured]
Error 2
Makefile:84: recipe for target '_all' failed
make: *** [_all] Error 2
patricaholden@pholden-laptop:~/williamson/build08132021/Pro3-Linux/buildroo=
t-2020.02$


--=20
Patricia A. Holden

--0000000000001ff4eb05c9cb6920
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I just started a clean build for client after pulling code=
 from their Github repository.=C2=A0 I am getting the following error with =
package host-libglib2 2.62.4 and have no idea why.=C2=A0 Build has been wor=
king just fine for a while.=C2=A0 Any suggestions?<div>Error log from build=
:<div><br></div><div>&gt;&gt;&gt; host-libglib2 2.62.4 Downloading<br>--202=
1-08-17 21:09:09-- =C2=A0<a href=3D"http://ftp.gnome.org/pub/gnome/sources/=
glib/2.62/glib-2.62.4.tar.xz">http://ftp.gnome.org/pub/gnome/sources/glib/2=
.62/glib-2.62.4.tar.xz</a><br>Resolving <a href=3D"http://ftp.gnome.org">ft=
p.gnome.org</a> (<a href=3D"http://ftp.gnome.org">ftp.gnome.org</a>)... 262=
0:52:3:1:5054:ff:fe0d:ee0f, 2620:52:3:1:5054:ff:fede:8714, 2620:52:3:1:5054=
:ff:fedd:5ad0, ...<br>Connecting to <a href=3D"http://ftp.gnome.org">ftp.gn=
ome.org</a> (<a href=3D"http://ftp.gnome.org">ftp.gnome.org</a>)|2620:52:3:=
1:5054:ff:fe0d:ee0f|:80... connected.<br>HTTP request sent, awaiting respon=
se... 302 Found<br>Location: <a href=3D"https://ftp.gnome.org/pub/gnome/sou=
rces/glib/2.62/glib-2.62.4.tar.xz">https://ftp.gnome.org/pub/gnome/sources/=
glib/2.62/glib-2.62.4.tar.xz</a> [following]<br>--2021-08-17 21:09:09-- =C2=
=A0<a href=3D"https://ftp.gnome.org/pub/gnome/sources/glib/2.62/glib-2.62.4=
.tar.xz">https://ftp.gnome.org/pub/gnome/sources/glib/2.62/glib-2.62.4.tar.=
xz</a><br>Connecting to <a href=3D"http://ftp.gnome.org">ftp.gnome.org</a> =
(<a href=3D"http://ftp.gnome.org">ftp.gnome.org</a>)|2620:52:3:1:5054:ff:fe=
0d:ee0f|:443... connected.<br>HTTP request sent, awaiting response... 301 M=
oved Permanently<br>Location: <a href=3D"https://download.gnome.org/sources=
/glib/2.62/glib-2.62.4.tar.xz">https://download.gnome.org/sources/glib/2.62=
/glib-2.62.4.tar.xz</a> [following]<br>--2021-08-17 21:09:09-- =C2=A0<a hre=
f=3D"https://download.gnome.org/sources/glib/2.62/glib-2.62.4.tar.xz">https=
://download.gnome.org/sources/glib/2.62/glib-2.62.4.tar.xz</a><br>Resolving=
 <a href=3D"http://download.gnome.org">download.gnome.org</a> (<a href=3D"h=
ttp://download.gnome.org">download.gnome.org</a>)... 2620:52:3:1:5054:ff:fe=
de:8714, 2620:52:3:1:5054:ff:fedd:5ad0, 2620:52:3:1:5054:ff:fe0d:ee0f, ...<=
br>Connecting to <a href=3D"http://download.gnome.org">download.gnome.org</=
a> (<a href=3D"http://download.gnome.org">download.gnome.org</a>)|2620:52:3=
:1:5054:ff:fede:8714|:443... connected.<br>HTTP request sent, awaiting resp=
onse... 302 Found<br>Location: <a href=3D"https://mirror.umd.edu/gnome/sour=
ces/glib/2.62/glib-2.62.4.tar.xz">https://mirror.umd.edu/gnome/sources/glib=
/2.62/glib-2.62.4.tar.xz</a> [following]<br>--2021-08-17 21:09:09-- =C2=A0<=
a href=3D"https://mirror.umd.edu/gnome/sources/glib/2.62/glib-2.62.4.tar.xz=
">https://mirror.umd.edu/gnome/sources/glib/2.62/glib-2.62.4.tar.xz</a><br>=
Resolving <a href=3D"http://mirror.umd.edu">mirror.umd.edu</a> (<a href=3D"=
http://mirror.umd.edu">mirror.umd.edu</a>)... 128.8.207.141<br>Connecting t=
o <a href=3D"http://mirror.umd.edu">mirror.umd.edu</a> (<a href=3D"http://m=
irror.umd.edu">mirror.umd.edu</a>)|128.8.207.141|:443... connected.<br>HTTP=
 request sent, awaiting response... 200 OK<br>Length: 4684768 (4.5M) [appli=
cation/octet-stream]<br>Saving to: =E2=80=98/home/patricaholden/williamson/=
build08132021/Pro3-Linux/buildroot-2020.02/output/build/.glib-2.62.4.tar.xz=
.B5Pk6o/output=E2=80=99<br><br>/home/patricaholden 100%[=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D&gt;] =C2=A0 4.47M =C2=A06.36MB/s =
=C2=A0 =C2=A0in 0.7s =C2=A0 =C2=A0<br><br>2021-08-17 21:09:10 (6.36 MB/s) -=
 =E2=80=98/home/patricaholden/williamson/build08132021/Pro3-Linux/buildroot=
-2020.02/output/build/.glib-2.62.4.tar.xz.B5Pk6o/output=E2=80=99 saved [468=
4768/4684768]<br><br>glib-2.62.4.tar.xz: OK (sha256: 4c84030d77fa9712135dfa=
8036ad663925655ae95b1d19399b6200e869925bbc)<br>&gt;&gt;&gt; host-libglib2 2=
.62.4 Extracting<br>xzcat /home/patricaholden/williamson/build08132021/Pro3=
-Linux/buildroot-2020.02/dl/libglib2/glib-2.62.4.tar.xz | tar --strip-compo=
nents=3D1 -C /home/patricaholden/williamson/build08132021/Pro3-Linux/buildr=
oot-2020.02/output/build/host-libglib2-2.62.4 =C2=A0 -xf -<br>&gt;&gt;&gt; =
host-libglib2 2.62.4 Patching<br><br>Applying 0001-fix-compile-time-atomic-=
detection.patch using patch: <br>patching file glib/gthread-posix.c<br><br>=
Applying 0002-allow-explicit-disabling-of-tests.patch using patch: <br>patc=
hing file meson.build<br><br>Applying 0003-remove-cpp-requirement.patch usi=
ng patch: <br>patching file glib/<a href=3D"http://glibconfig.h.in">glibcon=
fig.h.in</a><br>patching file meson.build<br>patching file tests/meson.buil=
d<br><br>Applying 0004-Add-Wno-format-nonliteral-to-compiler-arguments.patc=
h using patch: <br>patching file meson.build<br>&gt;&gt;&gt; host-libglib2 =
2.62.4 Configuring<br>rm -rf /home/patricaholden/williamson/build08132021/P=
ro3-Linux/buildroot-2020.02/output/build/host-libglib2-2.62.4//build<br>mkd=
ir -p /home/patricaholden/williamson/build08132021/Pro3-Linux/buildroot-202=
0.02/output/build/host-libglib2-2.62.4//build<br>PATH=3D&quot;/home/patrica=
holden/williamson/build08132021/Pro3-Linux/buildroot-2020.02/output/host/bi=
n:/home/patricaholden/williamson/build08132021/Pro3-Linux/buildroot-2020.02=
/output/host/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/=
bin:/usr/games:/usr/local/games:/snap/bin&quot; PKG_CONFIG=3D&quot;/home/pa=
tricaholden/williamson/build08132021/Pro3-Linux/buildroot-2020.02/output/ho=
st/bin/pkg-config&quot; PKG_CONFIG_SYSROOT_DIR=3D&quot;/&quot; PKG_CONFIG_A=
LLOW_SYSTEM_CFLAGS=3D1 PKG_CONFIG_ALLOW_SYSTEM_LIBS=3D1 PKG_CONFIG_LIBDIR=
=3D&quot;/home/patricaholden/williamson/build08132021/Pro3-Linux/buildroot-=
2020.02/output/host/lib/pkgconfig:/home/patricaholden/williamson/build08132=
021/Pro3-Linux/buildroot-2020.02/output/host/share/pkgconfig&quot; AR=3D&qu=
ot;/usr/bin/ar&quot; AS=3D&quot;/usr/bin/as&quot; LD=3D&quot;/usr/bin/ld&qu=
ot; NM=3D&quot;/usr/bin/nm&quot; CC=3D&quot;/usr/bin/gcc&quot; GCC=3D&quot;=
/usr/bin/gcc&quot; CXX=3D&quot;/usr/bin/g++&quot; CPP=3D&quot;/usr/bin/cpp&=
quot; OBJCOPY=3D&quot;/usr/bin/objcopy&quot; RANLIB=3D&quot;/usr/bin/ranlib=
&quot; CPPFLAGS=3D&quot;-I/home/patricaholden/williamson/build08132021/Pro3=
-Linux/buildroot-2020.02/output/host/include&quot; CFLAGS=3D&quot;-O2 -I/ho=
me/patricaholden/williamson/build08132021/Pro3-Linux/buildroot-2020.02/outp=
ut/host/include&quot; CXXFLAGS=3D&quot;-O2 -I/home/patricaholden/williamson=
/build08132021/Pro3-Linux/buildroot-2020.02/output/host/include&quot; LDFLA=
GS=3D&quot;-L/home/patricaholden/williamson/build08132021/Pro3-Linux/buildr=
oot-2020.02/output/host/lib -Wl,-rpath,/home/patricaholden/williamson/build=
08132021/Pro3-Linux/buildroot-2020.02/output/host/lib&quot; INTLTOOL_PERL=
=3D/usr/bin/perl =C2=A0PYTHONNOUSERSITE=3Dy /home/patricaholden/williamson/=
build08132021/Pro3-Linux/buildroot-2020.02/output/host/bin/meson --prefix=
=3D/home/patricaholden/williamson/build08132021/Pro3-Linux/buildroot-2020.0=
2/output/host --libdir=3Dlib --sysconfdir=3D/home/patricaholden/williamson/=
build08132021/Pro3-Linux/buildroot-2020.02/output/host/etc --localstatedir=
=3D/home/patricaholden/williamson/build08132021/Pro3-Linux/buildroot-2020.0=
2/output/host/var --default-library=3Dshared --buildtype=3Drelease -Ddtrace=
=3Dfalse -Dfam=3Dfalse -Dselinux=3Ddisabled -Dsystemtap=3Dfalse -Dxattr=3Df=
alse -Dinternal_pcre=3Dfalse -Dinstalled_tests=3Dfalse -Doss_fuzz=3Ddisable=
d /home/patricaholden/williamson/build08132021/Pro3-Linux/buildroot-2020.02=
/output/build/host-libglib2-2.62.4/ /home/patricaholden/williamson/build081=
32021/Pro3-Linux/buildroot-2020.02/output/build/host-libglib2-2.62.4//build=
<br>The Meson build system<br>Version: 0.53.1<br>Source dir: /home/patricah=
olden/williamson/build08132021/Pro3-Linux/buildroot-2020.02/output/build/ho=
st-libglib2-2.62.4<br>Build dir: /home/patricaholden/williamson/build081320=
21/Pro3-Linux/buildroot-2020.02/output/build/host-libglib2-2.62.4/build<br>=
Build type: native build<br>Project name: glib<br>Project version: 2.62.4<b=
r>Appending CFLAGS from environment: &#39;-O2 -I/home/patricaholden/william=
son/build08132021/Pro3-Linux/buildroot-2020.02/output/host/include&#39;<br>=
Appending LDFLAGS from environment: [&#39;-L/home/patricaholden/williamson/=
build08132021/Pro3-Linux/buildroot-2020.02/output/host/lib&#39;, &#39;-Wl,-=
rpath,/home/patricaholden/williamson/build08132021/Pro3-Linux/buildroot-202=
0.02/output/host/lib&#39;]<br>Appending CPPFLAGS from environment: &#39;-I/=
home/patricaholden/williamson/build08132021/Pro3-Linux/buildroot-2020.02/ou=
tput/host/include&#39;<br>Appending CFLAGS from environment: &#39;-O2 -I/ho=
me/patricaholden/williamson/build08132021/Pro3-Linux/buildroot-2020.02/outp=
ut/host/include&#39;<br>Appending LDFLAGS from environment: [&#39;-L/home/p=
atricaholden/williamson/build08132021/Pro3-Linux/buildroot-2020.02/output/h=
ost/lib&#39;, &#39;-Wl,-rpath,/home/patricaholden/williamson/build08132021/=
Pro3-Linux/buildroot-2020.02/output/host/lib&#39;]<br>Appending CPPFLAGS fr=
om environment: &#39;-I/home/patricaholden/williamson/build08132021/Pro3-Li=
nux/buildroot-2020.02/output/host/include&#39;<br>C compiler for the host m=
achine: /usr/bin/gcc (gcc 7.5.0 &quot;gcc (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5=
.0&quot;)<br>C linker for the host machine: /usr/bin/gcc GNU ld.bfd 2.30<br=
>Host machine cpu family: x86_64<br>Host machine cpu: x86_64<br>Compiler fo=
r C supports arguments -fno-strict-aliasing: YES <br>Checking if &quot;GNU =
C visibility attributes test&quot; compiles: YES <br>Compiler for C support=
s arguments -fvisibility=3Dhidden: YES <br>Has header &quot;alloca.h&quot; =
: YES <br>Has header &quot;crt_externs.h&quot; : NO <br>Has header &quot;di=
rent.h&quot; : YES <br>Has header &quot;float.h&quot; : YES <br>Has header =
&quot;fstab.h&quot; : YES <br>Has header &quot;grp.h&quot; : YES <br>Has he=
ader &quot;inttypes.h&quot; : YES <br>Has header &quot;limits.h&quot; : YES=
 <br>Has header &quot;linux/magic.h&quot; : YES <br>Has header &quot;locale=
.h&quot; : YES <br>Has header &quot;mach/mach_time.h&quot; : NO <br>Has hea=
der &quot;memory.h&quot; : YES <br>Has header &quot;mntent.h&quot; : YES <b=
r>Has header &quot;poll.h&quot; : YES <br>Has header &quot;pwd.h&quot; : YE=
S <br>Has header &quot;sched.h&quot; : YES <br>Has header &quot;spawn.h&quo=
t; : YES <br>Has header &quot;stdint.h&quot; : YES <br>Has header &quot;std=
lib.h&quot; : YES <br>Has header &quot;string.h&quot; : YES <br>Has header =
&quot;strings.h&quot; : YES <br>Has header &quot;sys/auxv.h&quot; : YES <br=
>Has header &quot;sys/event.h&quot; : NO <br>Has header &quot;sys/filio.h&q=
uot; : NO <br>Has header &quot;sys/inotify.h&quot; : YES <br>Has header &qu=
ot;sys/mkdev.h&quot; : NO <br>Has header &quot;sys/mntctl.h&quot; : NO <br>=
Has header &quot;sys/mnttab.h&quot; : NO <br>Has header &quot;sys/mount.h&q=
uot; : YES <br>Has header &quot;sys/param.h&quot; : YES <br>Has header &quo=
t;sys/resource.h&quot; : YES <br>Has header &quot;sys/select.h&quot; : YES =
<br>Has header &quot;sys/statfs.h&quot; : YES <br>Has header &quot;sys/stat=
.h&quot; : YES <br>Has header &quot;sys/statvfs.h&quot; : YES <br>Has heade=
r &quot;sys/sysctl.h&quot; : YES <br>Has header &quot;sys/time.h&quot; : YE=
S <br>Has header &quot;sys/times.h&quot; : YES <br>Has header &quot;sys/typ=
es.h&quot; : YES <br>Has header &quot;sys/uio.h&quot; : YES <br>Has header =
&quot;sys/vfs.h&quot; : YES <br>Has header &quot;sys/vfstab.h&quot; : NO <b=
r>Has header &quot;sys/vmount.h&quot; : NO <br>Has header &quot;sys/wait.h&=
quot; : YES <br>Has header &quot;termios.h&quot; : YES <br>Has header &quot=
;unistd.h&quot; : YES <br>Has header &quot;values.h&quot; : YES <br>Has hea=
der &quot;wchar.h&quot; : YES <br>Has header &quot;xlocale.h&quot; : NO <br=
>Checking if &quot;malloc.h&quot; compiles: YES <br>Has header &quot;linux/=
netlink.h&quot; : YES <br>Header &lt;locale.h&gt; has symbol &quot;LC_MESSA=
GES&quot; : YES <br>Checking whether type &quot;struct stat&quot; has membe=
r &quot;st_mtimensec&quot; : NO <br>Checking whether type &quot;struct stat=
&quot; has member &quot;st_mtim.tv_nsec&quot; : YES <br>Checking whether ty=
pe &quot;struct stat&quot; has member &quot;st_atimensec&quot; : NO <br>Che=
cking whether type &quot;struct stat&quot; has member &quot;st_atim.tv_nsec=
&quot; : YES <br>Checking whether type &quot;struct stat&quot; has member &=
quot;st_ctimensec&quot; : NO <br>Checking whether type &quot;struct stat&qu=
ot; has member &quot;st_ctim.tv_nsec&quot; : YES <br>Checking whether type =
&quot;struct stat&quot; has member &quot;st_birthtime&quot; : NO <br>Checki=
ng whether type &quot;struct stat&quot; has member &quot;st_birthtimensec&q=
uot; : NO <br>Checking whether type &quot;struct stat&quot; has member &quo=
t;st_birthtim&quot; : NO <br>Checking whether type &quot;struct stat&quot; =
has member &quot;st_birthtim.tv_nsec&quot; : NO <br>Checking whether type &=
quot;struct stat&quot; has member &quot;st_blksize&quot; : YES <br>Checking=
 whether type &quot;struct stat&quot; has member &quot;st_blocks&quot; : YE=
S <br>Checking whether type &quot;struct statfs&quot; has member &quot;f_fs=
typename&quot; : NO <br>Checking whether type &quot;struct statfs&quot; has=
 member &quot;f_bavail&quot; : YES <br>Checking whether type &quot;struct d=
irent&quot; has member &quot;d_type&quot; : YES <br>Checking whether type &=
quot;struct statvfs&quot; has member &quot;f_basetype&quot; : NO <br>Checki=
ng whether type &quot;struct statvfs&quot; has member &quot;f_fstypename&qu=
ot; : NO <br>Checking whether type &quot;struct tm&quot; has member &quot;t=
m_gmtoff&quot; : YES <br>Checking whether type &quot;struct tm&quot; has me=
mber &quot;__tm_gmtoff&quot; : NO <br>Compiler for C supports arguments -Wa=
ll: YES <br>Compiler for C supports arguments -Wduplicated-branches: YES <b=
r>Compiler for C supports arguments -Wimplicit-fallthrough: YES <br>Compile=
r for C supports arguments -Wmisleading-indentation: YES <br>Compiler for C=
 supports arguments -Wstrict-prototypes: YES <br>Compiler for C supports ar=
guments -Wunused: YES <br>Compiler for C supports arguments -Wno-unused-par=
ameter -Wunused-parameter: YES <br>Compiler for C supports arguments -Wno-b=
ad-function-cast -Wbad-function-cast: YES <br>Compiler for C supports argum=
ents -Wno-cast-function-type -Wcast-function-type: NO <br>Compiler for C su=
pports arguments -Wno-format-nonliteral -Wformat-nonliteral: YES <br>Compil=
er for C supports arguments -Wno-pedantic -Wpedantic: YES <br>Compiler for =
C supports arguments -Werror=3Ddeclaration-after-statement: YES <br>Compile=
r for C supports arguments -Werror=3Dformat=3D2: YES <br>Compiler for C sup=
ports arguments -Werror=3Dimplicit-function-declaration: YES <br>Compiler f=
or C supports arguments -Werror=3Dinit-self: YES <br>Compiler for C support=
s arguments -Werror=3Dmissing-include-dirs: YES <br>Compiler for C supports=
 arguments -Werror=3Dmissing-prototypes: YES <br>Compiler for C supports ar=
guments -Werror=3Dpointer-arith: YES <br>meson.build:390: WARNING: Consider=
 using the built-in warning_level option instead of using &quot;-Wall&quot;=
.<br>Compiler for C supports link arguments -Wl,-z,nodelete: YES <br>Compil=
er for C supports link arguments -Wl,-Bsymbolic-functions: YES <br>Checking=
 for function &quot;endmntent&quot; : YES <br>Checking for function &quot;e=
ndservent&quot; : YES <br>Checking for function &quot;fallocate&quot; : YES=
 <br>Checking for function &quot;fchmod&quot; : YES <br>Checking for functi=
on &quot;fchown&quot; : YES <br>Checking for function &quot;fdwalk&quot; : =
NO <br>Checking for function &quot;fsync&quot; : YES <br>Checking for funct=
ion &quot;getauxval&quot; : YES <br>Checking for function &quot;getc_unlock=
ed&quot; : YES <br>Checking for function &quot;getfsstat&quot; : NO <br>Che=
cking for function &quot;getgrgid_r&quot; : YES <br>Checking for function &=
quot;getmntent_r&quot; : YES <br>Checking for function &quot;getpwuid_r&quo=
t; : YES <br>Checking for function &quot;getresuid&quot; : YES <br>Checking=
 for function &quot;getvfsstat&quot; : NO <br>Checking for function &quot;g=
mtime_r&quot; : YES <br>Checking for function &quot;hasmntopt&quot; : YES <=
br>Checking for function &quot;inotify_init1&quot; : YES <br>Checking for f=
unction &quot;issetugid&quot; : NO <br>Checking for function &quot;kevent&q=
uot; : NO <br>Checking for function &quot;kqueue&quot; : NO <br>Checking fo=
r function &quot;lchmod&quot; : NO <br>Checking for function &quot;lchown&q=
uot; : YES <br>Checking for function &quot;link&quot; : YES <br>Checking fo=
r function &quot;localtime_r&quot; : YES <br>Checking for function &quot;ls=
tat&quot; : YES <br>Checking for function &quot;mbrtowc&quot; : YES <br>Che=
cking for function &quot;memalign&quot; : YES <br>Checking for function &qu=
ot;mmap&quot; : YES <br>Checking for function &quot;newlocale&quot; : YES <=
br>Checking for function &quot;pipe2&quot; : YES <br>Checking for function =
&quot;poll&quot; : YES <br>Checking for function &quot;prlimit&quot; : YES =
<br>Checking for function &quot;readlink&quot; : YES <br>Checking for funct=
ion &quot;recvmmsg&quot; : YES <br>Checking for function &quot;sendmmsg&quo=
t; : YES <br>Checking for function &quot;setenv&quot; : YES <br>Checking fo=
r function &quot;setmntent&quot; : YES <br>Checking for function &quot;stre=
rror_r&quot; : YES <br>Checking for function &quot;strnlen&quot; : YES <br>=
Checking for function &quot;strsignal&quot; : YES <br>Checking for function=
 &quot;strtod_l&quot; : YES <br>Checking for function &quot;strtoll_l&quot;=
 : YES <br>Checking for function &quot;strtoull_l&quot; : YES <br>Checking =
for function &quot;symlink&quot; : YES <br>Checking for function &quot;time=
gm&quot; : YES <br>Checking for function &quot;unsetenv&quot; : YES <br>Che=
cking for function &quot;uselocale&quot; : YES <br>Checking for function &q=
uot;utimes&quot; : YES <br>Checking for function &quot;valloc&quot; : YES <=
br>Checking for function &quot;vasprintf&quot; : YES <br>Checking for funct=
ion &quot;vsnprintf&quot; : YES <br>Checking for function &quot;wcrtomb&quo=
t; : YES <br>Checking for function &quot;wcslen&quot; : YES <br>Checking fo=
r function &quot;wcsnlen&quot; : YES <br>Checking for function &quot;sysctl=
byname&quot; : NO <br>Checking for function &quot;_NSGetEnviron&quot; : NO =
<br>Checking for function &quot;statvfs&quot; : YES <br>Checking for functi=
on &quot;statfs&quot; : YES <br>Checking for function &quot;if_indextoname&=
quot; : YES <br>Checking for function &quot;if_nametoindex&quot; : YES <br>=
Checking for function &quot;splice&quot; : YES <br>Checking for function &q=
uot;stpcpy&quot; : YES <br>Checking for function &quot;posix_memalign&quot;=
 : YES <br>Checking for function &quot;posix_spawn&quot; : YES <br>Checking=
 if &quot;strerror_r() returns char *&quot; compiles: YES <br>Checking for =
function &quot;snprintf&quot; : YES <br>Checking for function &quot;strcase=
cmp&quot; : YES <br>Checking for function &quot;strncasecmp&quot; : YES <br=
>Header &lt;sys/sysmacros.h&gt; has symbol &quot;major&quot; : YES <br>Head=
er &lt;dlfcn.h&gt; has symbol &quot;RTLD_LAZY&quot; : YES <br>Header &lt;dl=
fcn.h&gt; has symbol &quot;RTLD_NOW&quot; : YES <br>Header &lt;dlfcn.h&gt; =
has symbol &quot;RTLD_GLOBAL&quot; : YES <br>Header &lt;dlfcn.h&gt; has sym=
bol &quot;RTLD_NEXT&quot; : YES <br>Message: Checking whether to use statfs=
 or statvfs .. statfs<br>Checking for function &quot;mkostemp&quot; : YES <=
br>Checking if &quot;futex(2) system call&quot; links: YES <br>Checking if =
&quot;eventfd(2) system call&quot; links: YES <br>Checking if &quot;clock_g=
ettime&quot; links: YES <br>Checking if &quot;dlopen() and dlsym() in syste=
m libraries&quot; links: NO <br>Checking if &quot;dlopen() and dlsym() in l=
ibdl&quot; links: YES <br>Library dl found: YES<br>Checking if &quot;number=
 of arguments to statfs() (n=3D2)&quot; compiles: YES <br>Checking if &quot=
;open() option O_DIRECTORY&quot; compiles: YES <br>Checking if &quot;C99 vs=
nprintf&quot; runs: YES<br>Checking if &quot;C99 snprintf&quot; runs: YES<b=
r>Checking if &quot;Unix98 printf positional parameters&quot; runs: YES<br>=
Checking if &quot;nl_langinfo and CODESET&quot; links: YES <br>Checking if =
&quot;nl_langinfo (PM_STR)&quot; links: YES <br>Checking if &quot;nl_langin=
fo (_NL_CTYPE_OUTDIGITn_MB)&quot; links: YES <br>Checking if &quot;nl_langi=
nfo (ALTMON_n)&quot; links: YES <br>Checking if &quot;nl_langinfo (_NL_ABAL=
TMON_n)&quot; links: YES <br>Checking if &quot;signed&quot; compiles: YES <=
br>Header &lt;stddef.h&gt; has symbol &quot;ptrdiff_t&quot; : YES <br>Check=
ing if &quot;sig_atomic_t&quot; links: YES <br>Checking if &quot;long long&=
quot; compiles: YES <br>Checking if &quot;long double&quot; compiles: YES <=
br>Header &lt;stddef.h&gt; has symbol &quot;wchar_t&quot; : YES <br>Header =
&lt;wchar.h&gt; has symbol &quot;wint_t&quot; : YES <br>Checking if &quot;u=
intmax_t in inttypes.h&quot; compiles: YES <br>Checking if &quot;uintmax_t =
in stdint.h&quot; compiles: YES <br>Checking for size of &quot;char&quot; :=
 1<br>Checking for size of &quot;short&quot; : 2<br>Checking for size of &q=
uot;int&quot; : 4<br>Checking for size of &quot;void*&quot; : 8<br>Checking=
 for size of &quot;long&quot; : 8<br>Checking for size of &quot;long long&q=
uot; : 8<br>Checking for size of &quot;size_t&quot; : 8<br>Checking for siz=
e of &quot;ssize_t&quot; : 8<br>Checking if &quot;int64_t is long&quot; com=
piles: YES <br>Checking for alignment of &quot;char&quot; : 1<br>Checking f=
or alignment of &quot;short&quot; : 2<br>Checking for alignment of &quot;in=
t&quot; : 4<br>Checking for alignment of &quot;void*&quot; : 8<br>Checking =
for alignment of &quot;long&quot; : 8<br>Checking for alignment of &quot;lo=
ng long&quot; : 8<br>Checking for alignment of &quot;size_t&quot; : 8<br>Ch=
ecking for size of &quot;wchar_t&quot; : 4<br>Checking if &quot;__va_copy c=
heck&quot; compiles: YES <br>Checking if &quot;va_copy check&quot; compiles=
: YES <br>Checking if &quot;va_lists can be copied as values&quot; runs: DI=
D NOT COMPILE<br>Checking if &quot;ISO C99 varargs macros in C&quot; compil=
es: YES <br>Checking if &quot;GNUC varargs macros&quot; compiles: YES <br>H=
as header &quot;alloca.h&quot; : YES (cached)<br>Has header &quot;sys/poll.=
h&quot; : YES <br>Has header &quot;sys/types.h&quot; : YES (cached)<br>Has =
header &quot;winsock2.h&quot; : NO <br>Computing int of &quot;POLLIN&quot; =
: 1<br>Computing int of &quot;POLLOUT&quot; : 4<br>Computing int of &quot;P=
OLLPRI&quot; : 2<br>Computing int of &quot;POLLERR&quot; : 8<br>Computing i=
nt of &quot;POLLHUP&quot; : 16<br>Computing int of &quot;POLLNVAL&quot; : 3=
2<br>Computing int of &quot;AF_UNIX&quot; : 1<br>Computing int of &quot;AF_=
INET&quot; : 2<br>Computing int of &quot;AF_INET6&quot; : 10<br>Computing i=
nt of &quot;MSG_OOB&quot; : 1<br>Computing int of &quot;MSG_PEEK&quot; : 2<=
br>Computing int of &quot;MSG_DONTROUTE&quot; : 4<br>Checking if &quot;atom=
ic ops&quot; links: YES <br>Checking if &quot;atomic ops define&quot; compi=
les: YES <br>Run-time dependency threads found: YES<br>Header &lt;pthread.h=
&gt; has symbol &quot;pthread_attr_setstacksize&quot; : YES <br>Header &lt;=
pthread.h&gt; has symbol &quot;pthread_condattr_setclock&quot; : YES <br>He=
ader &lt;pthread.h&gt; has symbol &quot;pthread_cond_timedwait_relative_np&=
quot; : NO <br>Header &lt;pthread.h&gt; has symbol &quot;pthread_getname_np=
&quot; : YES <br>Checking if &quot;pthread_setname_np(const char*)&quot; wi=
th dependency threads links: NO <br>Checking if &quot;pthread_setname_np(pt=
hread_t, const char*)&quot; with dependency threads links: YES <br>Checking=
 if &quot;stack grows check&quot; runs: NO (1)<br>Checking for function &qu=
ot;iconv_open&quot; : YES <br>Found pkg-config: /home/patricaholden/william=
son/build08132021/Pro3-Linux/buildroot-2020.02/output/host/bin/pkg-config (=
1.6.1)<br>Run-time dependency libpcre found: YES 8.43<br>Library m found: Y=
ES<br>Run-time dependency libffi found: YES 3.3<br>Run-time dependency zlib=
 found: YES 1.2.11<br>Checking for function &quot;ngettext&quot; : YES <br>=
Checking for function &quot;bind_textdomain_codeset&quot; : YES <br>Run-tim=
e dependency mount found: YES 2.35.1<br>Dependency libselinux skipped: feat=
ure selinux disabled<br>Checking for function &quot;strlcpy&quot; : NO <br>=
Checking if &quot;/proc/self/cmdline&quot; runs: YES<br>Program python3 fou=
nd: YES (/home/patricaholden/williamson/build08132021/Pro3-Linux/buildroot-=
2020.02/output/host/bin/python3)<br>Program bash found: YES (/bin/bash)<br>=
Program sh found: YES (/bin/sh)<br>Program env found: YES (/usr/bin/env)<br=
>Configuring glibconfig.h using configuration<br>Configuring gtester-report=
 using configuration<br>Configuring <a href=3D"http://libglib-2.0.so.0.6200=
.4-gdb.py">libglib-2.0.so.0.6200.4-gdb.py</a> using configuration<br>Config=
uring glib-genmarshal using configuration<br>Program /home/patricaholden/wi=
lliamson/build08132021/Pro3-Linux/buildroot-2020.02/output/build/host-libgl=
ib2-2.62.4/build/gobject/glib-genmarshal found: YES (/home/patricaholden/wi=
lliamson/build08132021/Pro3-Linux/buildroot-2020.02/output/build/host-libgl=
ib2-2.62.4/build/gobject/glib-genmarshal)<br>Configuring glib-mkenums using=
 configuration<br>Program /home/patricaholden/williamson/build08132021/Pro3=
-Linux/buildroot-2020.02/output/build/host-libglib2-2.62.4/build/gobject/gl=
ib-mkenums found: YES (/home/patricaholden/williamson/build08132021/Pro3-Li=
nux/buildroot-2020.02/output/build/host-libglib2-2.62.4/build/gobject/glib-=
mkenums)<br>Configuring <a href=3D"http://libgobject-2.0.so.0.6200.4-gdb.py=
">libgobject-2.0.so.0.6200.4-gdb.py</a> using configuration<br>Checking if =
&quot;dlsym() preceding underscores&quot; with dependency -ldl runs: NO (1)=
<br>Checking for function &quot;dlerror&quot; with dependency -ldl: YES <br=
>Configuring gmoduleconf.h using configuration<br>Checking if &quot;C_IN in=
 public headers (no arpa/nameser_compat.h needed)&quot; compiles: YES <br>C=
hecking if &quot;res_query()&quot; links: NO <br>Checking if &quot;res_quer=
y() in -lresolv&quot; links: YES <br>Library resolv found: YES<br>Checking =
if &quot;socket()&quot; links: YES <br>Checking if &quot;res_init()&quot; l=
inks: YES <br>Checking if &quot;res_nclose()&quot; links: YES <br>Checking =
if &quot;res_ndestroy()&quot; links: NO <br>Checking if &quot;res_ninit()&q=
uot; links: YES <br>Checking if &quot;res_nquery()&quot; links: YES <br>Che=
cking for type &quot;struct ip_mreqn&quot; : YES <br>Checking if &quot;ioct=
l with request SIOCGIFADDR&quot; compiles: YES <br>Configuring gnetworking.=
h using configuration<br>Configuring gdbus-codegen using configuration<br>P=
rogram /home/patricaholden/williamson/build08132021/Pro3-Linux/buildroot-20=
20.02/output/build/host-libglib2-2.62.4/build/gio/gdbus-2.0/codegen/gdbus-c=
odegen found: YES (/home/patricaholden/williamson/build08132021/Pro3-Linux/=
buildroot-2020.02/output/build/host-libglib2-2.62.4/build/gio/gdbus-2.0/cod=
egen/gdbus-codegen)<br>Configuring config.py using configuration<br>Found C=
Make: /snap/bin/cmake (3.21.1)<br>Appending CXXFLAGS from environment: &#39=
;-O2 -I/home/patricaholden/williamson/build08132021/Pro3-Linux/buildroot-20=
20.02/output/host/include&#39;<br>Appending LDFLAGS from environment: [&#39=
;-L/home/patricaholden/williamson/build08132021/Pro3-Linux/buildroot-2020.0=
2/output/host/lib&#39;, &#39;-Wl,-rpath,/home/patricaholden/williamson/buil=
d08132021/Pro3-Linux/buildroot-2020.02/output/host/lib&#39;]<br>Appending C=
PPFLAGS from environment: &#39;-I/home/patricaholden/williamson/build081320=
21/Pro3-Linux/buildroot-2020.02/output/host/include&#39;<br>Traceback (most=
 recent call last):<br>=C2=A0 File &quot;/home/patricaholden/williamson/bui=
ld08132021/Pro3-Linux/buildroot-2020.02/output/host/lib/python3.8/site-pack=
ages/mesonbuild/mesonmain.py&quot;, line 129, in run<br>=C2=A0 =C2=A0 retur=
n options.run_func(options)<br>=C2=A0 File &quot;/home/patricaholden/willia=
mson/build08132021/Pro3-Linux/buildroot-2020.02/output/host/lib/python3.8/s=
ite-packages/mesonbuild/msetup.py&quot;, line 245, in run<br>=C2=A0 =C2=A0 =
app.generate()<br>=C2=A0 File &quot;/home/patricaholden/williamson/build081=
32021/Pro3-Linux/buildroot-2020.02/output/host/lib/python3.8/site-packages/=
mesonbuild/msetup.py&quot;, line 159, in generate<br>=C2=A0 =C2=A0 self._ge=
nerate(env)<br>=C2=A0 File &quot;/home/patricaholden/williamson/build081320=
21/Pro3-Linux/buildroot-2020.02/output/host/lib/python3.8/site-packages/mes=
onbuild/msetup.py&quot;, line 192, in _generate<br>=C2=A0 =C2=A0 intr.run()=
<br>=C2=A0 File &quot;/home/patricaholden/williamson/build08132021/Pro3-Lin=
ux/buildroot-2020.02/output/host/lib/python3.8/site-packages/mesonbuild/int=
erpreter.py&quot;, line 4165, in run<br>=C2=A0 =C2=A0 super().run()<br>=C2=
=A0 File &quot;/home/patricaholden/williamson/build08132021/Pro3-Linux/buil=
droot-2020.02/output/host/lib/python3.8/site-packages/mesonbuild/interprete=
rbase.py&quot;, line 412, in run<br>=C2=A0 =C2=A0 self.evaluate_codeblock(s=
elf.ast, start=3D1)<br>=C2=A0 File &quot;/home/patricaholden/williamson/bui=
ld08132021/Pro3-Linux/buildroot-2020.02/output/host/lib/python3.8/site-pack=
ages/mesonbuild/interpreterbase.py&quot;, line 436, in evaluate_codeblock<b=
r>=C2=A0 =C2=A0 raise e<br>=C2=A0 File &quot;/home/patricaholden/williamson=
/build08132021/Pro3-Linux/buildroot-2020.02/output/host/lib/python3.8/site-=
packages/mesonbuild/interpreterbase.py&quot;, line 430, in evaluate_codeblo=
ck<br>=C2=A0 =C2=A0 self.evaluate_statement(cur)<br>=C2=A0 File &quot;/home=
/patricaholden/williamson/build08132021/Pro3-Linux/buildroot-2020.02/output=
/host/lib/python3.8/site-packages/mesonbuild/interpreterbase.py&quot;, line=
 441, in evaluate_statement<br>=C2=A0 =C2=A0 return self.function_call(cur)=
<br>=C2=A0 File &quot;/home/patricaholden/williamson/build08132021/Pro3-Lin=
ux/buildroot-2020.02/output/host/lib/python3.8/site-packages/mesonbuild/int=
erpreterbase.py&quot;, line 788, in function_call<br>=C2=A0 =C2=A0 return f=
unc(node, posargs, kwargs)<br>=C2=A0 File &quot;/home/patricaholden/william=
son/build08132021/Pro3-Linux/buildroot-2020.02/output/host/lib/python3.8/si=
te-packages/mesonbuild/interpreterbase.py&quot;, line 285, in wrapped<br>=
=C2=A0 =C2=A0 return f(*wrapped_args, **wrapped_kwargs)<br>=C2=A0 File &quo=
t;/home/patricaholden/williamson/build08132021/Pro3-Linux/buildroot-2020.02=
/output/host/lib/python3.8/site-packages/mesonbuild/interpreterbase.py&quot=
;, line 174, in wrapped<br>=C2=A0 =C2=A0 return f(*wrapped_args, **wrapped_=
kwargs)<br>=C2=A0 File &quot;/home/patricaholden/williamson/build08132021/P=
ro3-Linux/buildroot-2020.02/output/host/lib/python3.8/site-packages/mesonbu=
ild/interpreter.py&quot;, line 3687, in func_subdir<br>=C2=A0 =C2=A0 self.e=
valuate_codeblock(codeblock)<br>=C2=A0 File &quot;/home/patricaholden/willi=
amson/build08132021/Pro3-Linux/buildroot-2020.02/output/host/lib/python3.8/=
site-packages/mesonbuild/interpreterbase.py&quot;, line 436, in evaluate_co=
deblock<br>=C2=A0 =C2=A0 raise e<br>=C2=A0 File &quot;/home/patricaholden/w=
illiamson/build08132021/Pro3-Linux/buildroot-2020.02/output/host/lib/python=
3.8/site-packages/mesonbuild/interpreterbase.py&quot;, line 430, in evaluat=
e_codeblock<br>=C2=A0 =C2=A0 self.evaluate_statement(cur)<br>=C2=A0 File &q=
uot;/home/patricaholden/williamson/build08132021/Pro3-Linux/buildroot-2020.=
02/output/host/lib/python3.8/site-packages/mesonbuild/interpreterbase.py&qu=
ot;, line 443, in evaluate_statement<br>=C2=A0 =C2=A0 return self.assignmen=
t(cur)<br>=C2=A0 File &quot;/home/patricaholden/williamson/build08132021/Pr=
o3-Linux/buildroot-2020.02/output/host/lib/python3.8/site-packages/mesonbui=
ld/interpreterbase.py&quot;, line 1064, in assignment<br>=C2=A0 =C2=A0 valu=
e =3D self.evaluate_statement(node.value)<br>=C2=A0 File &quot;/home/patric=
aholden/williamson/build08132021/Pro3-Linux/buildroot-2020.02/output/host/l=
ib/python3.8/site-packages/mesonbuild/interpreterbase.py&quot;, line 441, i=
n evaluate_statement<br>=C2=A0 =C2=A0 return self.function_call(cur)<br>=C2=
=A0 File &quot;/home/patricaholden/williamson/build08132021/Pro3-Linux/buil=
droot-2020.02/output/host/lib/python3.8/site-packages/mesonbuild/interprete=
rbase.py&quot;, line 788, in function_call<br>=C2=A0 =C2=A0 return func(nod=
e, posargs, kwargs)<br>=C2=A0 File &quot;/home/patricaholden/williamson/bui=
ld08132021/Pro3-Linux/buildroot-2020.02/output/host/lib/python3.8/site-pack=
ages/mesonbuild/interpreterbase.py&quot;, line 285, in wrapped<br>=C2=A0 =
=C2=A0 return f(*wrapped_args, **wrapped_kwargs)<br>=C2=A0 File &quot;/home=
/patricaholden/williamson/build08132021/Pro3-Linux/buildroot-2020.02/output=
/host/lib/python3.8/site-packages/mesonbuild/interpreterbase.py&quot;, line=
 285, in wrapped<br>=C2=A0 =C2=A0 return f(*wrapped_args, **wrapped_kwargs)=
<br>=C2=A0 File &quot;/home/patricaholden/williamson/build08132021/Pro3-Lin=
ux/buildroot-2020.02/output/host/lib/python3.8/site-packages/mesonbuild/int=
erpreterbase.py&quot;, line 285, in wrapped<br>=C2=A0 =C2=A0 return f(*wrap=
ped_args, **wrapped_kwargs)<br>=C2=A0 [Previous line repeated 2 more times]=
<br>=C2=A0 File &quot;/home/patricaholden/williamson/build08132021/Pro3-Lin=
ux/buildroot-2020.02/output/host/lib/python3.8/site-packages/mesonbuild/int=
erpreterbase.py&quot;, line 155, in wrapped<br>=C2=A0 =C2=A0 ret =3D f(*wra=
pped_args, **wrapped_kwargs)<br>=C2=A0 File &quot;/home/patricaholden/willi=
amson/build08132021/Pro3-Linux/buildroot-2020.02/output/host/lib/python3.8/=
site-packages/mesonbuild/interpreterbase.py&quot;, line 174, in wrapped<br>=
=C2=A0 =C2=A0 return f(*wrapped_args, **wrapped_kwargs)<br>=C2=A0 File &quo=
t;/home/patricaholden/williamson/build08132021/Pro3-Linux/buildroot-2020.02=
/output/host/lib/python3.8/site-packages/mesonbuild/interpreter.py&quot;, l=
ine 3234, in func_dependency<br>=C2=A0 =C2=A0 d =3D self.dependency_impl(na=
me, display_name, kwargs)<br>=C2=A0 File &quot;/home/patricaholden/williams=
on/build08132021/Pro3-Linux/buildroot-2020.02/output/host/lib/python3.8/sit=
e-packages/mesonbuild/interpreter.py&quot;, line 3281, in dependency_impl<b=
r>=C2=A0 =C2=A0 dep =3D dependencies.find_external_dependency(name, self.en=
vironment, kwargs)<br>=C2=A0 File &quot;/home/patricaholden/williamson/buil=
d08132021/Pro3-Linux/buildroot-2020.02/output/host/lib/python3.8/site-packa=
ges/mesonbuild/dependencies/base.py&quot;, line 2236, in find_external_depe=
ndency<br>=C2=A0 =C2=A0 d =3D c()<br>=C2=A0 File &quot;/home/patricaholden/=
williamson/build08132021/Pro3-Linux/buildroot-2020.02/output/host/lib/pytho=
n3.8/site-packages/mesonbuild/dependencies/base.py&quot;, line 1110, in __i=
nit__<br>=C2=A0 =C2=A0 CMakeDependency.class_cmakeinfo[self.for_machine] =
=3D self._get_cmake_info()<br>=C2=A0 File &quot;/home/patricaholden/william=
son/build08132021/Pro3-Linux/buildroot-2020.02/output/host/lib/python3.8/si=
te-packages/mesonbuild/dependencies/base.py&quot;, line 1203, in _get_cmake=
_info<br>=C2=A0 =C2=A0 &#39;cmake_root&#39;: temp_parser.get_cmake_var(&#39=
;MESON_CMAKE_ROOT&#39;)[0],<br>IndexError: list index out of range<br>packa=
ge/<a href=3D"http://pkg-generic.mk:254">pkg-generic.mk:254</a>: recipe for=
 target &#39;/home/patricaholden/williamson/build08132021/Pro3-Linux/buildr=
oot-2020.02/output/build/host-libglib2-2.62.4/.stamp_configured&#39; failed=
<br>make[1]: *** [/home/patricaholden/williamson/build08132021/Pro3-Linux/b=
uildroot-2020.02/output/build/host-libglib2-2.62.4/.stamp_configured] Error=
 2<br>Makefile:84: recipe for target &#39;_all&#39; failed<br>make: *** [_a=
ll] Error 2<br>patricaholden@pholden-laptop:~/williamson/build08132021/Pro3=
-Linux/buildroot-2020.02$ <br><div><br></div>-- <br><div dir=3D"ltr" class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr">Pa=
tricia A. Holden</div></div></div></div></div>

--0000000000001ff4eb05c9cb6920--

--===============8387444152880149707==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============8387444152880149707==--
