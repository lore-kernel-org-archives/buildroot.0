Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3E74E77188
	for <buildroot@archiver.kernel.org>; Tue, 14 Jan 2025 19:16:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 245E4413B1;
	Tue, 14 Jan 2025 19:16:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iLdDMsnxJrUA; Tue, 14 Jan 2025 19:16:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F039413B5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F039413B5;
	Tue, 14 Jan 2025 19:16:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id AEEF6B8B
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 19:16:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8F98140E84
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 19:16:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Joo62FIaO6qH for <buildroot@buildroot.org>;
 Tue, 14 Jan 2025 19:16:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::a2c; helo=mail-vk1-xa2c.google.com;
 envelope-from=pholden@nklabs.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1C6D940E26
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C6D940E26
Received: from mail-vk1-xa2c.google.com (mail-vk1-xa2c.google.com
 [IPv6:2607:f8b0:4864:20::a2c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1C6D940E26
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 19:16:19 +0000 (UTC)
Received: by mail-vk1-xa2c.google.com with SMTP id
 71dfb90a1353d-51873bc7377so1708902e0c.1
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 11:16:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736882178; x=1737486978;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XlKtGsyERgqLzEfKz1jVHtmnMtKkSN4VPrnR4MB3Wmk=;
 b=QuaXFkEk96JPQ85NQQzmDh6hu3ZwpyTj6ITLFuwfFinvYA5X5nx8Fll4KS4UFSjubI
 yQRlbYz0T8GM/Sjs6E27f11AoRnlM830bIkp6Yh0496JM/WXymjnB/8siCciM1uXhNe4
 WdmNQFvJVw6qyygNNdeKgzTB+ZH3NS0Ye5jWU77dALPCY1QiJuJa1ntQjKygZjRezOhx
 ITlK9kQY61r8I51gaIob4EnRXU42A0OYBoOxgNz+z/CjU/U6cYQQrjWc1ghMmPMstgSc
 XamzBC/ueJQ2iU959MePQUIVBQfkgenNt4P9JJijxJGiXZ+kUzG3Hl7enIxdMlot67P8
 a30w==
X-Gm-Message-State: AOJu0YzEBVcfbsBPlFj6nrracCNJG2D3RmfoUUtdLzFbLVmYqQwF3gRR
 aJZWa5sDUN+zU1tgXgeFfnfMcIUV8qNfXxwHxTnnwpZxziwFUe9r0NqX5sCE9J5/y7IbYkNWLeE
 UmSXAJOxQOlieM82mAGM7b9ZUI/CRgffoACSq5apzPYkw2Ef51uo=
X-Gm-Gg: ASbGncuqw6rJ3ZysciJa+jayFZszYuHAiZmJHR3hvbw4q6k1aGY9QNQkyzGre98r/AT
 Y9D0HEd/xg86eruQUMGcxNlvTXuhA9TdTva+nB99R++QpkjJB+Ss/UYVKCnbtirlwMzPF
X-Google-Smtp-Source: AGHT+IFhDFZxW8jQ/4U7q/Wcb53fCCqxyUn1ZEfxtLsQvqHqKcusvyqBhqIBjRRcIyzNCI9sMfcaXFPhi4nmA6n+9/w=
X-Received: by 2002:a05:6122:3c43:b0:516:157c:a72e with SMTP id
 71dfb90a1353d-51c6c4303camr21749347e0c.3.1736882178478; Tue, 14 Jan 2025
 11:16:18 -0800 (PST)
MIME-Version: 1.0
From: Patricia Holden <pholden@nklabs.com>
Date: Tue, 14 Jan 2025 14:16:08 -0500
X-Gm-Features: AbW1kvari_FRpZR1EFGZNro16CV_xOADKVh62Kyzp8LDMnw9VIYVCZ242W7ttPs
Message-ID: <CAJ6EmCe5duhjeanDC8NPgR6CWdaUstRc5TcxWnVSBEkF2_dK3Q@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nklabs.com; s=google; t=1736882178; x=1737486978; darn=buildroot.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=XlKtGsyERgqLzEfKz1jVHtmnMtKkSN4VPrnR4MB3Wmk=;
 b=S5u97SbnqSM92x8YJ6CnR5ZmjAvZOYZWq4iONr+feWT8jMdC3DTtjHpNHh2XyBt9U3
 zELlQh0qZ4uBoifX+5pnu38VPfgtnPvUIToXjJxlFzhS2aKdztqta++fe4BgMWELws3u
 QVanHMMC94tfZuNC74ukaulHXvyo8V+UQ2YNdATadwZ4Z5LE3EeinA9VclrLI1Loe/90
 XKZUSNzgMEHJYZYLuMZ6QmnX+xmE2RWHsCYBOOZsLZKTn/sds1yY6wOC1m129tlayk1Y
 kGvKokv+v7AZijekZKKpTLmmz4EcbAryy9f+dEKYWDyL2EdWawIFGwB70Np13mK0a9sN
 9nyw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=nklabs.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=nklabs.com header.i=@nklabs.com header.a=rsa-sha256
 header.s=google header.b=S5u97Sbn
Subject: [Buildroot] Host QT6 Tools Linguistics fails to build
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
Content-Type: multipart/mixed; boundary="===============8344395488175498229=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8344395488175498229==
Content-Type: multipart/alternative; boundary="00000000000043eb00062baf6576"

--00000000000043eb00062baf6576
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

We are using Buildroot version "2024.11-rc1.  We just turned on "Host
Utilities->host qt6 tools->host linguistic tools".  I run make, get the
error and output below.  Is there a fix for this?  Am I missing a
dependency I need to install on my host PC?

Thanks!
Pat

make BR2_EXTERNAL=3D../edvo_br host-qt6tools
>>> host-qt6tools 6.7.3 Configuring
(mkdir -p
/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.1=
1-rc1/output/build/host-qt6tools-6.7.3//buildroot-build
&& cd
/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.1=
1-rc1/output/build/host-qt6tools-6.7.3//buildroot-build
&& rm -f CMakeCache.txt &&
PATH=3D"/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroo=
t-2024.11-rc1/output/host/bin:/home/pholden/Projects/Edvotek01072025/edvote=
k-edvocycler3/buildroot-2024.11-rc1/output/host/sbin:/home/pholden/.pyenv/s=
hims:/home/pholden/.pyenv/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr=
/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/snap/bin"
PKG_CONFIG=3D"/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/bu=
ildroot-2024.11-rc1/output/host/bin/pkg-config"
PKG_CONFIG_SYSROOT_DIR=3D"/"
PKG_CONFIG_LIBDIR=3D"/home/pholden/Projects/Edvotek01072025/edvotek-edvocyc=
ler3/buildroot-2024.11-rc1/output/host/lib/pkgconfig:/home/pholden/Projects=
/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.11-rc1/output/host/shar=
e/pkgconfig"
PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=3D1 PKG_CONFIG_ALLOW_SYSTEM_LIBS=3D1
 /usr/bin/cmake
/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.1=
1-rc1/output/build/host-qt6tools-6.7.3/
-G"Ninja"
-DCMAKE_MAKE_PROGRAM=3D"/home/pholden/Projects/Edvotek01072025/edvotek-edvo=
cycler3/buildroot-2024.11-rc1/output/host/bin/ninja"
-DCMAKE_INSTALL_SO_NO_EXE=3D0
-DCMAKE_FIND_ROOT_PATH=3D"/home/pholden/Projects/Edvotek01072025/edvotek-ed=
vocycler3/buildroot-2024.11-rc1/output/host"
-DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM=3D"BOTH"
-DCMAKE_FIND_ROOT_PATH_MODE_LIBRARY=3D"BOTH"
-DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE=3D"BOTH"
-DCMAKE_INSTALL_PREFIX=3D"/home/pholden/Projects/Edvotek01072025/edvotek-ed=
vocycler3/buildroot-2024.11-rc1/output/host"
-DCMAKE_C_FLAGS=3D"-O2
-I/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024=
.11-rc1/output/host/include"
-DCMAKE_CXX_FLAGS=3D"-O2
-I/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024=
.11-rc1/output/host/include"
-DCMAKE_EXE_LINKER_FLAGS=3D"-L/home/pholden/Projects/Edvotek01072025/edvote=
k-edvocycler3/buildroot-2024.11-rc1/output/host/lib
-Wl,-rpath,/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/build=
root-2024.11-rc1/output/host/lib"
-DCMAKE_SHARED_LINKER_FLAGS=3D"-L/home/pholden/Projects/Edvotek01072025/edv=
otek-edvocycler3/buildroot-2024.11-rc1/output/host/lib
-Wl,-rpath,/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/build=
root-2024.11-rc1/output/host/lib"
-DCMAKE_C_COMPILER=3D"/usr/bin/gcc" -DCMAKE_CXX_COMPILER=3D"/usr/bin/g++"
 -DCMAKE_C_COMPILER_LAUNCHER=3D"" -DCMAKE_CXX_COMPILER_LAUNCHER=3D""
 -DCMAKE_COLOR_MAKEFILE=3DOFF -DBUILD_DOC=3DOFF -DBUILD_DOCS=3DOFF
-DBUILD_EXAMPLE=3DOFF -DBUILD_EXAMPLES=3DOFF -DBUILD_TEST=3DOFF -DBUILD_TES=
TS=3DOFF
-DBUILD_TESTING=3DOFF -DBUILD_SHARED_LIBS=3DON  -DQT_BUILD_EXAMPLES=3DOFF
-DQT_BUILD_TESTS=3DOFF -DFEATURE_linguist=3DON )
-- The CXX compiler identification is GNU 11.4.0
-- The C compiler identification is GNU 11.4.0
-- Detecting CXX compiler ABI info
-- Detecting CXX compiler ABI info - done
-- Check for working CXX compiler: /usr/bin/g++ - skipped
-- Detecting CXX compile features
-- Detecting CXX compile features - done
-- Detecting C compiler ABI info
-- Detecting C compiler ABI info - done
-- Check for working C compiler: /usr/bin/gcc - skipped
-- Detecting C compile features
-- Detecting C compile features - done
-- Looking for pthread.h
-- Looking for pthread.h - found
-- Performing Test CMAKE_HAVE_LIBC_PTHREAD
-- Performing Test CMAKE_HAVE_LIBC_PTHREAD - Success
-- Found Threads: TRUE
-- Performing Test HAVE_STDATOMIC
-- Performing Test HAVE_STDATOMIC - Success
-- Found WrapAtomic: TRUE
-- Force setting build type to 'Release'.
CMake Error at /usr/lib/llvm-14/lib/cmake/clang/ClangTargets.cmake:750
(message):
  The imported target "clangBasic" references the file

     "/usr/lib/llvm-14/lib/libclangBasic.a"

  but this file does not exist.  Possible reasons include:

  * The file was deleted, renamed, or moved to another location.

  * An install or uninstall procedure did not complete successfully.

  * The installation package was faulty and contained

     "/usr/lib/llvm-14/lib/cmake/clang/ClangTargets.cmake"

  but not all the files it references.

Call Stack (most recent call first):
  /usr/lib/cmake/clang-14/ClangConfig.cmake:19 (include)
  cmake/FindWrapLibClang.cmake:17 (find_package)

/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.1=
1-rc1/output/build/host-qt6base-6.7.3/cmake/QtFindPackageHelpers.cmake:156
(find_package)
  configure.cmake:20 (qt_find_package)

/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.1=
1-rc1/output/build/host-qt6base-6.7.3/cmake/QtFeature.cmake:678
(include)
  src/CMakeLists.txt:18 (qt_feature_evaluate_features)


-- Configuring incomplete, errors occurred!
See also
"/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.=
11-rc1/output/build/host-qt6tools-6.7.3/buildroot-build/CMakeFiles/CMakeOut=
put.log".
make[1]: *** [package/pkg-generic.mk:279:
/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.1=
1-rc1/output/build/host-qt6tools-6.7.3/.stamp_configured]
Error 1
make: *** [Makefile:83: _all] Error 2

--00000000000043eb00062baf6576
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">We are using Buildroot version &quot;2024.11-rc1.=C2=A0 We=
 just turned on &quot;Host Utilities-&gt;host qt6 tools-&gt;host linguistic=
 tools&quot;.=C2=A0 I run make, get the error and output below.=C2=A0 Is th=
ere a fix for this?=C2=A0 Am I missing a dependency I need to install on my=
 host PC?<div><br></div><div>Thanks!</div><div>Pat<br><div><br></div><div>m=
ake BR2_EXTERNAL=3D../edvo_br host-qt6tools<br>&gt;&gt;&gt; host-qt6tools 6=
.7.3 Configuring<br>(mkdir -p /home/pholden/Projects/Edvotek01072025/edvote=
k-edvocycler3/buildroot-2024.11-rc1/output/build/host-qt6tools-6.7.3//build=
root-build &amp;&amp; cd /home/pholden/Projects/Edvotek01072025/edvotek-edv=
ocycler3/buildroot-2024.11-rc1/output/build/host-qt6tools-6.7.3//buildroot-=
build &amp;&amp; rm -f CMakeCache.txt &amp;&amp; PATH=3D&quot;/home/pholden=
/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.11-rc1/output/=
host/bin:/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildro=
ot-2024.11-rc1/output/host/sbin:/home/pholden/.pyenv/shims:/home/pholden/.p=
yenv/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/=
games:/usr/local/games:/snap/bin:/snap/bin&quot; PKG_CONFIG=3D&quot;/home/p=
holden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.11-rc1/o=
utput/host/bin/pkg-config&quot; PKG_CONFIG_SYSROOT_DIR=3D&quot;/&quot; PKG_=
CONFIG_LIBDIR=3D&quot;/home/pholden/Projects/Edvotek01072025/edvotek-edvocy=
cler3/buildroot-2024.11-rc1/output/host/lib/pkgconfig:/home/pholden/Project=
s/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.11-rc1/output/host/sha=
re/pkgconfig&quot; PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=3D1 PKG_CONFIG_ALLOW_SYST=
EM_LIBS=3D1 =C2=A0/usr/bin/cmake /home/pholden/Projects/Edvotek01072025/edv=
otek-edvocycler3/buildroot-2024.11-rc1/output/build/host-qt6tools-6.7.3/ -G=
&quot;Ninja&quot; -DCMAKE_MAKE_PROGRAM=3D&quot;/home/pholden/Projects/Edvot=
ek01072025/edvotek-edvocycler3/buildroot-2024.11-rc1/output/host/bin/ninja&=
quot; -DCMAKE_INSTALL_SO_NO_EXE=3D0 -DCMAKE_FIND_ROOT_PATH=3D&quot;/home/ph=
olden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.11-rc1/ou=
tput/host&quot; -DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM=3D&quot;BOTH&quot; -DCM=
AKE_FIND_ROOT_PATH_MODE_LIBRARY=3D&quot;BOTH&quot; -DCMAKE_FIND_ROOT_PATH_M=
ODE_INCLUDE=3D&quot;BOTH&quot; -DCMAKE_INSTALL_PREFIX=3D&quot;/home/pholden=
/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.11-rc1/output/=
host&quot; -DCMAKE_C_FLAGS=3D&quot;-O2 -I/home/pholden/Projects/Edvotek0107=
2025/edvotek-edvocycler3/buildroot-2024.11-rc1/output/host/include&quot; -D=
CMAKE_CXX_FLAGS=3D&quot;-O2 -I/home/pholden/Projects/Edvotek01072025/edvote=
k-edvocycler3/buildroot-2024.11-rc1/output/host/include&quot; -DCMAKE_EXE_L=
INKER_FLAGS=3D&quot;-L/home/pholden/Projects/Edvotek01072025/edvotek-edvocy=
cler3/buildroot-2024.11-rc1/output/host/lib -Wl,-rpath,/home/pholden/Projec=
ts/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.11-rc1/output/host/li=
b&quot; -DCMAKE_SHARED_LINKER_FLAGS=3D&quot;-L/home/pholden/Projects/Edvote=
k01072025/edvotek-edvocycler3/buildroot-2024.11-rc1/output/host/lib -Wl,-rp=
ath,/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-20=
24.11-rc1/output/host/lib&quot; -DCMAKE_C_COMPILER=3D&quot;/usr/bin/gcc&quo=
t; -DCMAKE_CXX_COMPILER=3D&quot;/usr/bin/g++&quot; =C2=A0-DCMAKE_C_COMPILER=
_LAUNCHER=3D&quot;&quot; -DCMAKE_CXX_COMPILER_LAUNCHER=3D&quot;&quot; =C2=
=A0-DCMAKE_COLOR_MAKEFILE=3DOFF -DBUILD_DOC=3DOFF -DBUILD_DOCS=3DOFF -DBUIL=
D_EXAMPLE=3DOFF -DBUILD_EXAMPLES=3DOFF -DBUILD_TEST=3DOFF -DBUILD_TESTS=3DO=
FF -DBUILD_TESTING=3DOFF -DBUILD_SHARED_LIBS=3DON =C2=A0-DQT_BUILD_EXAMPLES=
=3DOFF -DQT_BUILD_TESTS=3DOFF -DFEATURE_linguist=3DON )<br>-- The CXX compi=
ler identification is GNU 11.4.0<br>-- The C compiler identification is GNU=
 11.4.0<br>-- Detecting CXX compiler ABI info<br>-- Detecting CXX compiler =
ABI info - done<br>-- Check for working CXX compiler: /usr/bin/g++ - skippe=
d<br>-- Detecting CXX compile features<br>-- Detecting CXX compile features=
 - done<br>-- Detecting C compiler ABI info<br>-- Detecting C compiler ABI =
info - done<br>-- Check for working C compiler: /usr/bin/gcc - skipped<br>-=
- Detecting C compile features<br>-- Detecting C compile features - done<br=
>-- Looking for pthread.h<br>-- Looking for pthread.h - found<br>-- Perform=
ing Test CMAKE_HAVE_LIBC_PTHREAD<br>-- Performing Test CMAKE_HAVE_LIBC_PTHR=
EAD - Success<br>-- Found Threads: TRUE =C2=A0<br>-- Performing Test HAVE_S=
TDATOMIC<br>-- Performing Test HAVE_STDATOMIC - Success<br>-- Found WrapAto=
mic: TRUE =C2=A0<br>-- Force setting build type to &#39;Release&#39;.<br>CM=
ake Error at /usr/lib/llvm-14/lib/cmake/clang/ClangTargets.cmake:750 (messa=
ge):<br>=C2=A0 The imported target &quot;clangBasic&quot; references the fi=
le<br><br>=C2=A0 =C2=A0 =C2=A0&quot;/usr/lib/llvm-14/lib/libclangBasic.a&qu=
ot;<br><br>=C2=A0 but this file does not exist.=C2=A0 Possible reasons incl=
ude:<br><br>=C2=A0 * The file was deleted, renamed, or moved to another loc=
ation.<br><br>=C2=A0 * An install or uninstall procedure did not complete s=
uccessfully.<br><br>=C2=A0 * The installation package was faulty and contai=
ned<br><br>=C2=A0 =C2=A0 =C2=A0&quot;/usr/lib/llvm-14/lib/cmake/clang/Clang=
Targets.cmake&quot;<br><br>=C2=A0 but not all the files it references.<br><=
br>Call Stack (most recent call first):<br>=C2=A0 /usr/lib/cmake/clang-14/C=
langConfig.cmake:19 (include)<br>=C2=A0 cmake/FindWrapLibClang.cmake:17 (fi=
nd_package)<br>=C2=A0 /home/pholden/Projects/Edvotek01072025/edvotek-edvocy=
cler3/buildroot-2024.11-rc1/output/build/host-qt6base-6.7.3/cmake/QtFindPac=
kageHelpers.cmake:156 (find_package)<br>=C2=A0 configure.cmake:20 (qt_find_=
package)<br>=C2=A0 /home/pholden/Projects/Edvotek01072025/edvotek-edvocycle=
r3/buildroot-2024.11-rc1/output/build/host-qt6base-6.7.3/cmake/QtFeature.cm=
ake:678 (include)<br>=C2=A0 src/CMakeLists.txt:18 (qt_feature_evaluate_feat=
ures)<br><br><br>-- Configuring incomplete, errors occurred!<br>See also &q=
uot;/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-20=
24.11-rc1/output/build/host-qt6tools-6.7.3/buildroot-build/CMakeFiles/CMake=
Output.log&quot;.<br>make[1]: *** [package/<a href=3D"http://pkg-generic.mk=
:279">pkg-generic.mk:279</a>: /home/pholden/Projects/Edvotek01072025/edvote=
k-edvocycler3/buildroot-2024.11-rc1/output/build/host-qt6tools-6.7.3/.stamp=
_configured] Error 1<br>make: *** [Makefile:83: _all] Error 2<br></div></di=
v></div>

--00000000000043eb00062baf6576--

--===============8344395488175498229==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8344395488175498229==--
