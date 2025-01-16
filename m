Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DC73C02180
	for <buildroot@archiver.kernel.org>; Thu, 16 Jan 2025 10:23:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B50A441964;
	Thu, 16 Jan 2025 10:23:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8zZWBnW1cKc6; Thu, 16 Jan 2025 10:23:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8AC241975
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8AC241975;
	Thu, 16 Jan 2025 10:23:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1205C94B
 for <buildroot@buildroot.org>; Thu, 16 Jan 2025 10:23:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E2590412F5
 for <buildroot@buildroot.org>; Thu, 16 Jan 2025 10:23:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eGZi2wbk_VGH for <buildroot@buildroot.org>;
 Thu, 16 Jan 2025 10:23:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b2d; helo=mail-yb1-xb2d.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B977A402CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B977A402CE
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B977A402CE
 for <buildroot@buildroot.org>; Thu, 16 Jan 2025 10:23:13 +0000 (UTC)
Received: by mail-yb1-xb2d.google.com with SMTP id
 3f1490d57ef6-e53ef7462b6so1221520276.3
 for <buildroot@buildroot.org>; Thu, 16 Jan 2025 02:23:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737022992; x=1737627792;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=k+OwjRaLYovp5vyWHsfkNM0B2etQU0Hj4y5R35KvQ5k=;
 b=RlBniMD0d21XiLJPKDIyCKijwUXAz/UXBi4zxDb1sKgvO1go//6gCKj8pUuuFF8tnp
 vrqmJZBuw6dpY1zwd8pfa/W2z9dqZ0BrmJuTldBNn1fs6wnEi7IbRcbeUFTOu/kXWFp5
 Enx+UoZ+HkyflmueU/sLw5iI/lc3AWneJoiTwdh5R6sSyMNCPNxpVmp5gqNJW6CN55w7
 Wk65uw9jOSD7veOeP7WXj+xVIYqER4ggJkWtDpIO1xz0tRJXm+D7kFZjDoD6KwzU7y1C
 qq3dvklB06NSqByXqgr58pyEb4YWevfZA0BM5NnLbQxc7+YIwg7V7Yzcdo9VL6REPvvG
 +s1w==
X-Gm-Message-State: AOJu0Yyuq4HmQ04gd93bL4TNhzFJ+luUzLHx5GbfIP38YqdDWiY9PDmy
 CsIcHZyccjxzL5y5gKv30+lvWgfdZw+n4WMTPHdrSS16FrnZ6RrPbPEQuglYy/9HKeMlTs9i0iH
 fQRIyUYw3ZvLvNyedjaEF6IX3DF0=
X-Gm-Gg: ASbGncvMbar6PLEO9Wqp3iLgQ3C1XYFnUrWcBVAAsDMXoFQAeO9B0aoECBF+vZ4tR4v
 vGCUdoBgQa7NFggcdiFXC1jtEVyMSyRjWRdgc5CE=
X-Google-Smtp-Source: AGHT+IEMxAIFIc4Tju7Mju/8sNlGALt4NiVW+k74tbuNJrWInDO3prQnTUhU+AUyruVomDWWxY0KxzhWF/FGJL9/yMg=
X-Received: by 2002:a05:6902:c0f:b0:e44:82ef:397d with SMTP id
 3f1490d57ef6-e54edf140e9mr25716476276.6.1737022992440; Thu, 16 Jan 2025
 02:23:12 -0800 (PST)
MIME-Version: 1.0
References: <CAJ6EmCe5duhjeanDC8NPgR6CWdaUstRc5TcxWnVSBEkF2_dK3Q@mail.gmail.com>
In-Reply-To: <CAJ6EmCe5duhjeanDC8NPgR6CWdaUstRc5TcxWnVSBEkF2_dK3Q@mail.gmail.com>
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Date: Thu, 16 Jan 2025 11:23:00 +0100
X-Gm-Features: AbW1kvZ0YCtdbTxm1NyT-dMoVZMWKmtWrm6Urw4Q26a_dMAMnBcUzfprNbx2l8Y
Message-ID: <CA+R_derbD_Ddd73fddoSaUri7Y+4_YWqZc-VyDjMF0dtd1_OBg@mail.gmail.com>
To: Patricia Holden <pholden@nklabs.com>
Cc: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737022992; x=1737627792; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=k+OwjRaLYovp5vyWHsfkNM0B2etQU0Hj4y5R35KvQ5k=;
 b=SI4h0DogbQXjTZh1MlM67ni89BZMSHwtkKmljWs42E1UczLqvcYIffydHHyUtncAnb
 I1WX8WwUVD+4aG8MaO/mXJZus6oXIIUSFZzZD8TD0ReDn49sgVqvnpllsEbRVCrngYLO
 d/3Fpc2Ge8Cbrvetfs379ZADJm3VQ7G58xOv19fnfsu1W+5pcCluTizG+eDxEa9Sb2Kr
 k/iRFFWvl+BXOIm+SQ9MOB2newobhaj3vuaWCBtWOrYnfjMXJDRJYE0OYZ/AcBpUN6JF
 a1WlMGSu5dU66paHd4iJjJAP6Efm9RYqHRgJh3IsOZVdRlOrrBMDcT3yUfLJIBJzWC2r
 BrUQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=SI4h0Dog
Subject: Re: [Buildroot] Host QT6 Tools Linguistics fails to build
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
Content-Type: multipart/mixed; boundary="===============0417516809025684943=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0417516809025684943==
Content-Type: multipart/alternative; boundary="0000000000006e6434062bd02e23"

--0000000000006e6434062bd02e23
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Patricia,

I'll take look at this as soon as I get a chance. Can you send me a minimal
config that recreate the problem?

Thanks in advance,

Roy

tir. 14. jan. 2025 kl. 20:16 skrev Patricia Holden <pholden@nklabs.com>:

> We are using Buildroot version "2024.11-rc1.  We just turned on "Host
> Utilities->host qt6 tools->host linguistic tools".  I run make, get the
> error and output below.  Is there a fix for this?  Am I missing a
> dependency I need to install on my host PC?
>
> Thanks!
> Pat
>
> make BR2_EXTERNAL=3D../edvo_br host-qt6tools
> >>> host-qt6tools 6.7.3 Configuring
> (mkdir -p
> /home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024=
.11-rc1/output/build/host-qt6tools-6.7.3//buildroot-build
> && cd
> /home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024=
.11-rc1/output/build/host-qt6tools-6.7.3//buildroot-build
> && rm -f CMakeCache.txt &&
> PATH=3D"/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildr=
oot-2024.11-rc1/output/host/bin:/home/pholden/Projects/Edvotek01072025/edvo=
tek-edvocycler3/buildroot-2024.11-rc1/output/host/sbin:/home/pholden/.pyenv=
/shims:/home/pholden/.pyenv/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/u=
sr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/snap/bin"
> PKG_CONFIG=3D"/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/=
buildroot-2024.11-rc1/output/host/bin/pkg-config"
> PKG_CONFIG_SYSROOT_DIR=3D"/"
> PKG_CONFIG_LIBDIR=3D"/home/pholden/Projects/Edvotek01072025/edvotek-edvoc=
ycler3/buildroot-2024.11-rc1/output/host/lib/pkgconfig:/home/pholden/Projec=
ts/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.11-rc1/output/host/sh=
are/pkgconfig"
> PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=3D1 PKG_CONFIG_ALLOW_SYSTEM_LIBS=3D1
>  /usr/bin/cmake
> /home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024=
.11-rc1/output/build/host-qt6tools-6.7.3/
> -G"Ninja"
> -DCMAKE_MAKE_PROGRAM=3D"/home/pholden/Projects/Edvotek01072025/edvotek-ed=
vocycler3/buildroot-2024.11-rc1/output/host/bin/ninja"
> -DCMAKE_INSTALL_SO_NO_EXE=3D0
> -DCMAKE_FIND_ROOT_PATH=3D"/home/pholden/Projects/Edvotek01072025/edvotek-=
edvocycler3/buildroot-2024.11-rc1/output/host"
> -DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM=3D"BOTH"
> -DCMAKE_FIND_ROOT_PATH_MODE_LIBRARY=3D"BOTH"
> -DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE=3D"BOTH"
> -DCMAKE_INSTALL_PREFIX=3D"/home/pholden/Projects/Edvotek01072025/edvotek-=
edvocycler3/buildroot-2024.11-rc1/output/host"
> -DCMAKE_C_FLAGS=3D"-O2
> -I/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-20=
24.11-rc1/output/host/include"
> -DCMAKE_CXX_FLAGS=3D"-O2
> -I/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-20=
24.11-rc1/output/host/include"
> -DCMAKE_EXE_LINKER_FLAGS=3D"-L/home/pholden/Projects/Edvotek01072025/edvo=
tek-edvocycler3/buildroot-2024.11-rc1/output/host/lib
> -Wl,-rpath,/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/bui=
ldroot-2024.11-rc1/output/host/lib"
> -DCMAKE_SHARED_LINKER_FLAGS=3D"-L/home/pholden/Projects/Edvotek01072025/e=
dvotek-edvocycler3/buildroot-2024.11-rc1/output/host/lib
> -Wl,-rpath,/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/bui=
ldroot-2024.11-rc1/output/host/lib"
> -DCMAKE_C_COMPILER=3D"/usr/bin/gcc" -DCMAKE_CXX_COMPILER=3D"/usr/bin/g++"
>  -DCMAKE_C_COMPILER_LAUNCHER=3D"" -DCMAKE_CXX_COMPILER_LAUNCHER=3D""
>  -DCMAKE_COLOR_MAKEFILE=3DOFF -DBUILD_DOC=3DOFF -DBUILD_DOCS=3DOFF
> -DBUILD_EXAMPLE=3DOFF -DBUILD_EXAMPLES=3DOFF -DBUILD_TEST=3DOFF -DBUILD_T=
ESTS=3DOFF
> -DBUILD_TESTING=3DOFF -DBUILD_SHARED_LIBS=3DON  -DQT_BUILD_EXAMPLES=3DOFF
> -DQT_BUILD_TESTS=3DOFF -DFEATURE_linguist=3DON )
> -- The CXX compiler identification is GNU 11.4.0
> -- The C compiler identification is GNU 11.4.0
> -- Detecting CXX compiler ABI info
> -- Detecting CXX compiler ABI info - done
> -- Check for working CXX compiler: /usr/bin/g++ - skipped
> -- Detecting CXX compile features
> -- Detecting CXX compile features - done
> -- Detecting C compiler ABI info
> -- Detecting C compiler ABI info - done
> -- Check for working C compiler: /usr/bin/gcc - skipped
> -- Detecting C compile features
> -- Detecting C compile features - done
> -- Looking for pthread.h
> -- Looking for pthread.h - found
> -- Performing Test CMAKE_HAVE_LIBC_PTHREAD
> -- Performing Test CMAKE_HAVE_LIBC_PTHREAD - Success
> -- Found Threads: TRUE
> -- Performing Test HAVE_STDATOMIC
> -- Performing Test HAVE_STDATOMIC - Success
> -- Found WrapAtomic: TRUE
> -- Force setting build type to 'Release'.
> CMake Error at /usr/lib/llvm-14/lib/cmake/clang/ClangTargets.cmake:750
> (message):
>   The imported target "clangBasic" references the file
>
>      "/usr/lib/llvm-14/lib/libclangBasic.a"
>
>   but this file does not exist.  Possible reasons include:
>
>   * The file was deleted, renamed, or moved to another location.
>
>   * An install or uninstall procedure did not complete successfully.
>
>   * The installation package was faulty and contained
>
>      "/usr/lib/llvm-14/lib/cmake/clang/ClangTargets.cmake"
>
>   but not all the files it references.
>
> Call Stack (most recent call first):
>   /usr/lib/cmake/clang-14/ClangConfig.cmake:19 (include)
>   cmake/FindWrapLibClang.cmake:17 (find_package)
>
> /home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024=
.11-rc1/output/build/host-qt6base-6.7.3/cmake/QtFindPackageHelpers.cmake:15=
6
> (find_package)
>   configure.cmake:20 (qt_find_package)
>
> /home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024=
.11-rc1/output/build/host-qt6base-6.7.3/cmake/QtFeature.cmake:678
> (include)
>   src/CMakeLists.txt:18 (qt_feature_evaluate_features)
>
>
> -- Configuring incomplete, errors occurred!
> See also
> "/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-202=
4.11-rc1/output/build/host-qt6tools-6.7.3/buildroot-build/CMakeFiles/CMakeO=
utput.log".
> make[1]: *** [package/pkg-generic.mk:279:
> /home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024=
.11-rc1/output/build/host-qt6tools-6.7.3/.stamp_configured]
> Error 1
> make: *** [Makefile:83: _all] Error 2
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>

--0000000000006e6434062bd02e23
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Patricia,</div><div><br></div><div>I&#39;ll take l=
ook at this as soon as I get a chance. Can you send me a minimal config tha=
t recreate the problem?</div><div><br></div><div>Thanks in advance,</div><d=
iv><br></div><div>Roy</div></div><br><div class=3D"gmail_quote gmail_quote_=
container"><div dir=3D"ltr" class=3D"gmail_attr">tir. 14. jan. 2025 kl. 20:=
16 skrev Patricia Holden &lt;<a href=3D"mailto:pholden@nklabs.com">pholden@=
nklabs.com</a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex"><div dir=3D"ltr">We are using Buildroot version &quot;2024.11-rc1.=C2=
=A0 We just turned on &quot;Host Utilities-&gt;host qt6 tools-&gt;host ling=
uistic tools&quot;.=C2=A0 I run make, get the error and output below.=C2=A0=
 Is there a fix for this?=C2=A0 Am I missing a dependency I need to install=
 on my host PC?<div><br></div><div>Thanks!</div><div>Pat<br><div><br></div>=
<div>make BR2_EXTERNAL=3D../edvo_br host-qt6tools<br>&gt;&gt;&gt; host-qt6t=
ools 6.7.3 Configuring<br>(mkdir -p /home/pholden/Projects/Edvotek01072025/=
edvotek-edvocycler3/buildroot-2024.11-rc1/output/build/host-qt6tools-6.7.3/=
/buildroot-build &amp;&amp; cd /home/pholden/Projects/Edvotek01072025/edvot=
ek-edvocycler3/buildroot-2024.11-rc1/output/build/host-qt6tools-6.7.3//buil=
droot-build &amp;&amp; rm -f CMakeCache.txt &amp;&amp; PATH=3D&quot;/home/p=
holden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.11-rc1/o=
utput/host/bin:/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/b=
uildroot-2024.11-rc1/output/host/sbin:/home/pholden/.pyenv/shims:/home/phol=
den/.pyenv/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin=
:/usr/games:/usr/local/games:/snap/bin:/snap/bin&quot; PKG_CONFIG=3D&quot;/=
home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.11=
-rc1/output/host/bin/pkg-config&quot; PKG_CONFIG_SYSROOT_DIR=3D&quot;/&quot=
; PKG_CONFIG_LIBDIR=3D&quot;/home/pholden/Projects/Edvotek01072025/edvotek-=
edvocycler3/buildroot-2024.11-rc1/output/host/lib/pkgconfig:/home/pholden/P=
rojects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.11-rc1/output/ho=
st/share/pkgconfig&quot; PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=3D1 PKG_CONFIG_ALLO=
W_SYSTEM_LIBS=3D1 =C2=A0/usr/bin/cmake /home/pholden/Projects/Edvotek010720=
25/edvotek-edvocycler3/buildroot-2024.11-rc1/output/build/host-qt6tools-6.7=
.3/ -G&quot;Ninja&quot; -DCMAKE_MAKE_PROGRAM=3D&quot;/home/pholden/Projects=
/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.11-rc1/output/host/bin/=
ninja&quot; -DCMAKE_INSTALL_SO_NO_EXE=3D0 -DCMAKE_FIND_ROOT_PATH=3D&quot;/h=
ome/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.11-=
rc1/output/host&quot; -DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM=3D&quot;BOTH&quot=
; -DCMAKE_FIND_ROOT_PATH_MODE_LIBRARY=3D&quot;BOTH&quot; -DCMAKE_FIND_ROOT_=
PATH_MODE_INCLUDE=3D&quot;BOTH&quot; -DCMAKE_INSTALL_PREFIX=3D&quot;/home/p=
holden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.11-rc1/o=
utput/host&quot; -DCMAKE_C_FLAGS=3D&quot;-O2 -I/home/pholden/Projects/Edvot=
ek01072025/edvotek-edvocycler3/buildroot-2024.11-rc1/output/host/include&qu=
ot; -DCMAKE_CXX_FLAGS=3D&quot;-O2 -I/home/pholden/Projects/Edvotek01072025/=
edvotek-edvocycler3/buildroot-2024.11-rc1/output/host/include&quot; -DCMAKE=
_EXE_LINKER_FLAGS=3D&quot;-L/home/pholden/Projects/Edvotek01072025/edvotek-=
edvocycler3/buildroot-2024.11-rc1/output/host/lib -Wl,-rpath,/home/pholden/=
Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.11-rc1/output/h=
ost/lib&quot; -DCMAKE_SHARED_LINKER_FLAGS=3D&quot;-L/home/pholden/Projects/=
Edvotek01072025/edvotek-edvocycler3/buildroot-2024.11-rc1/output/host/lib -=
Wl,-rpath,/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildr=
oot-2024.11-rc1/output/host/lib&quot; -DCMAKE_C_COMPILER=3D&quot;/usr/bin/g=
cc&quot; -DCMAKE_CXX_COMPILER=3D&quot;/usr/bin/g++&quot; =C2=A0-DCMAKE_C_CO=
MPILER_LAUNCHER=3D&quot;&quot; -DCMAKE_CXX_COMPILER_LAUNCHER=3D&quot;&quot;=
 =C2=A0-DCMAKE_COLOR_MAKEFILE=3DOFF -DBUILD_DOC=3DOFF -DBUILD_DOCS=3DOFF -D=
BUILD_EXAMPLE=3DOFF -DBUILD_EXAMPLES=3DOFF -DBUILD_TEST=3DOFF -DBUILD_TESTS=
=3DOFF -DBUILD_TESTING=3DOFF -DBUILD_SHARED_LIBS=3DON =C2=A0-DQT_BUILD_EXAM=
PLES=3DOFF -DQT_BUILD_TESTS=3DOFF -DFEATURE_linguist=3DON )<br>-- The CXX c=
ompiler identification is GNU 11.4.0<br>-- The C compiler identification is=
 GNU 11.4.0<br>-- Detecting CXX compiler ABI info<br>-- Detecting CXX compi=
ler ABI info - done<br>-- Check for working CXX compiler: /usr/bin/g++ - sk=
ipped<br>-- Detecting CXX compile features<br>-- Detecting CXX compile feat=
ures - done<br>-- Detecting C compiler ABI info<br>-- Detecting C compiler =
ABI info - done<br>-- Check for working C compiler: /usr/bin/gcc - skipped<=
br>-- Detecting C compile features<br>-- Detecting C compile features - don=
e<br>-- Looking for pthread.h<br>-- Looking for pthread.h - found<br>-- Per=
forming Test CMAKE_HAVE_LIBC_PTHREAD<br>-- Performing Test CMAKE_HAVE_LIBC_=
PTHREAD - Success<br>-- Found Threads: TRUE =C2=A0<br>-- Performing Test HA=
VE_STDATOMIC<br>-- Performing Test HAVE_STDATOMIC - Success<br>-- Found Wra=
pAtomic: TRUE =C2=A0<br>-- Force setting build type to &#39;Release&#39;.<b=
r>CMake Error at /usr/lib/llvm-14/lib/cmake/clang/ClangTargets.cmake:750 (m=
essage):<br>=C2=A0 The imported target &quot;clangBasic&quot; references th=
e file<br><br>=C2=A0 =C2=A0 =C2=A0&quot;/usr/lib/llvm-14/lib/libclangBasic.=
a&quot;<br><br>=C2=A0 but this file does not exist.=C2=A0 Possible reasons =
include:<br><br>=C2=A0 * The file was deleted, renamed, or moved to another=
 location.<br><br>=C2=A0 * An install or uninstall procedure did not comple=
te successfully.<br><br>=C2=A0 * The installation package was faulty and co=
ntained<br><br>=C2=A0 =C2=A0 =C2=A0&quot;/usr/lib/llvm-14/lib/cmake/clang/C=
langTargets.cmake&quot;<br><br>=C2=A0 but not all the files it references.<=
br><br>Call Stack (most recent call first):<br>=C2=A0 /usr/lib/cmake/clang-=
14/ClangConfig.cmake:19 (include)<br>=C2=A0 cmake/FindWrapLibClang.cmake:17=
 (find_package)<br>=C2=A0 /home/pholden/Projects/Edvotek01072025/edvotek-ed=
vocycler3/buildroot-2024.11-rc1/output/build/host-qt6base-6.7.3/cmake/QtFin=
dPackageHelpers.cmake:156 (find_package)<br>=C2=A0 configure.cmake:20 (qt_f=
ind_package)<br>=C2=A0 /home/pholden/Projects/Edvotek01072025/edvotek-edvoc=
ycler3/buildroot-2024.11-rc1/output/build/host-qt6base-6.7.3/cmake/QtFeatur=
e.cmake:678 (include)<br>=C2=A0 src/CMakeLists.txt:18 (qt_feature_evaluate_=
features)<br><br><br>-- Configuring incomplete, errors occurred!<br>See als=
o &quot;/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroo=
t-2024.11-rc1/output/build/host-qt6tools-6.7.3/buildroot-build/CMakeFiles/C=
MakeOutput.log&quot;.<br>make[1]: *** [package/<a href=3D"http://pkg-generi=
c.mk:279" target=3D"_blank">pkg-generic.mk:279</a>: /home/pholden/Projects/=
Edvotek01072025/edvotek-edvocycler3/buildroot-2024.11-rc1/output/build/host=
-qt6tools-6.7.3/.stamp_configured] Error 1<br>make: *** [Makefile:83: _all]=
 Error 2<br></div></div></div>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@buil=
droot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listinfo/b=
uildroot</a><br>
</blockquote></div>

--0000000000006e6434062bd02e23--

--===============0417516809025684943==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0417516809025684943==--
