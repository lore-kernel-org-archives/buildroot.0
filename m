Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8302C02180
	for <buildroot@archiver.kernel.org>; Thu, 16 Jan 2025 12:17:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 659F060870;
	Thu, 16 Jan 2025 12:17:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AMN4Y84dzQHK; Thu, 16 Jan 2025 12:17:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 223CE60B5A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 223CE60B5A;
	Thu, 16 Jan 2025 12:17:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C0F7394B
 for <buildroot@buildroot.org>; Thu, 16 Jan 2025 12:17:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AF17F410DF
 for <buildroot@buildroot.org>; Thu, 16 Jan 2025 12:17:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LxpcW3lVVVEO for <buildroot@buildroot.org>;
 Thu, 16 Jan 2025 12:17:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b33; helo=mail-yb1-xb33.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B40EE40219
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B40EE40219
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B40EE40219
 for <buildroot@buildroot.org>; Thu, 16 Jan 2025 12:17:46 +0000 (UTC)
Received: by mail-yb1-xb33.google.com with SMTP id
 3f1490d57ef6-e39779a268bso1462833276.1
 for <buildroot@buildroot.org>; Thu, 16 Jan 2025 04:17:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737029865; x=1737634665;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PeP6zNi5jiNDO+O1qLFL4PuAAuGnxNcAaAYmhLGuWIE=;
 b=A6l/8APSonhdySzyo4Tj6MTl6qSNZ1VxUmU0XdQB+t2FLLQZF96cjD1wnUVOHL9bEF
 xxAbCB76qp+OwLgMxAuVVDdQnqQEqw5wL9sSuk/Q+h90JtWD3B8LylOd9kOHjQ0qd14H
 a/M881Pd/ZeWvc94RVvQdTCzv2ezSY/mF+ZQgz0U2u5oTnBbcnfUdfbtc7ljzgw8/lWK
 z7w4gW+lKAey17NkGadLKtarM1phr2JqbZcWsut6uL0zwZK/punQ3rDCt2Zmd18/4ruu
 MC1MmtNQ/SBV4OzL4p2lt5D775GX1uApk+6pzPXiyhD2cyFVWrPIsp1bb/nyqUp+p7P1
 32wQ==
X-Gm-Message-State: AOJu0Ywmmy4ZQqvjPY6jCrnMCvktdM1eWPzrDTYatzjAKuLBWi5PMkop
 Y5leQ/Bwa21COHGaUHdPte/EvCpj4sF6U5CaQNncQxFGuyMomSQANiI7W2/L4WY1Pn2/SnGb7Su
 1bMqlt6x/z6ZkGBcK/6F8biWpJPDWGin/
X-Gm-Gg: ASbGncsMZWShGKYmTvpRPXmmHA66FwPb4AM62FMhe5cqdpv2VQ+Ypw011txcD0KeQTR
 gY1DgBWxklqzfMRpaefh9Essf7/Ksb4qYMWPbuRM=
X-Google-Smtp-Source: AGHT+IGq/zUIYfqcgvzHiWQLG3Zc0XXhwvJgKtIA57SYkHgNL7+kZVJVjKMeiMZkSYEIP5xG6gyjWOvuRmkgTFo+Atk=
X-Received: by 2002:a25:a187:0:b0:e57:167f:65ee with SMTP id
 3f1490d57ef6-e57a3c20f59mr788084276.17.1737029865384; Thu, 16 Jan 2025
 04:17:45 -0800 (PST)
MIME-Version: 1.0
References: <CAJ6EmCe5duhjeanDC8NPgR6CWdaUstRc5TcxWnVSBEkF2_dK3Q@mail.gmail.com>
 <CA+R_derbD_Ddd73fddoSaUri7Y+4_YWqZc-VyDjMF0dtd1_OBg@mail.gmail.com>
In-Reply-To: <CA+R_derbD_Ddd73fddoSaUri7Y+4_YWqZc-VyDjMF0dtd1_OBg@mail.gmail.com>
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Date: Thu, 16 Jan 2025 13:17:33 +0100
X-Gm-Features: AbW1kvbVIug-B5KbVej2hNQXTwwu0U5tiE0QAKEwwffo7YyCiPC5MnjTwfyZuiI
Message-ID: <CA+R_deo_Cp-BtFUr2f7Wt0HCpzg8nNqnOzQspgRTZXgc3bCq_Q@mail.gmail.com>
To: Patricia Holden <pholden@nklabs.com>
Cc: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737029865; x=1737634665; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PeP6zNi5jiNDO+O1qLFL4PuAAuGnxNcAaAYmhLGuWIE=;
 b=LtH6jg+MFX2wnmwm2TYOSBOBpbvFGPerQtm7tuOVMLadnwSk9cEdIcMp6rzgCG+9m0
 4QWOKb7DKOoA/D/Tc5IHc4qVPXZhXF5s0yca6IcfgPDFVYSxND74zbRMDk7pWL2zkRSQ
 PiGgkYn36Ubud/FPfZZuWrf9OjspPa0DP4mJ4p7WXYkKonednX4eseg+RVY/z0jTmR17
 6U8mG5zYG76iFGR0wbRvbLMWVdL0bcB5/zzZqzKCUMvL6/I1pMtXnuBPTsTugXqTPBWK
 F2R8yoHOnpf43qbxdOtNZhupbsDfsTY/wYm0lVnLqpJvn2zQklnCSJnqkGXtxqpA2zrr
 Pn0w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=LtH6jg+M
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
Content-Type: multipart/mixed; boundary="===============0739517732904047471=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0739517732904047471==
Content-Type: multipart/alternative; boundary="000000000000173645062bd1c838"

--000000000000173645062bd1c838
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

qttools require at least clang 17. So we should not try to enable support
unless suitable version is available.

So we should set -DFEATURE_clang=3DOFF

-Roy


tor. 16. jan. 2025 kl. 11:23 skrev Roy Kollen Svendsen <
roykollensvendsen@gmail.com>:

> Hi Patricia,
>
> I'll take look at this as soon as I get a chance. Can you send me a
> minimal config that recreate the problem?
>
> Thanks in advance,
>
> Roy
>
> tir. 14. jan. 2025 kl. 20:16 skrev Patricia Holden <pholden@nklabs.com>:
>
>> We are using Buildroot version "2024.11-rc1.  We just turned on "Host
>> Utilities->host qt6 tools->host linguistic tools".  I run make, get the
>> error and output below.  Is there a fix for this?  Am I missing a
>> dependency I need to install on my host PC?
>>
>> Thanks!
>> Pat
>>
>> make BR2_EXTERNAL=3D../edvo_br host-qt6tools
>> >>> host-qt6tools 6.7.3 Configuring
>> (mkdir -p
>> /home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-202=
4.11-rc1/output/build/host-qt6tools-6.7.3//buildroot-build
>> && cd
>> /home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-202=
4.11-rc1/output/build/host-qt6tools-6.7.3//buildroot-build
>> && rm -f CMakeCache.txt &&
>> PATH=3D"/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/build=
root-2024.11-rc1/output/host/bin:/home/pholden/Projects/Edvotek01072025/edv=
otek-edvocycler3/buildroot-2024.11-rc1/output/host/sbin:/home/pholden/.pyen=
v/shims:/home/pholden/.pyenv/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/=
usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/snap/bin"
>> PKG_CONFIG=3D"/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3=
/buildroot-2024.11-rc1/output/host/bin/pkg-config"
>> PKG_CONFIG_SYSROOT_DIR=3D"/"
>> PKG_CONFIG_LIBDIR=3D"/home/pholden/Projects/Edvotek01072025/edvotek-edvo=
cycler3/buildroot-2024.11-rc1/output/host/lib/pkgconfig:/home/pholden/Proje=
cts/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.11-rc1/output/host/s=
hare/pkgconfig"
>> PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=3D1 PKG_CONFIG_ALLOW_SYSTEM_LIBS=3D1
>>  /usr/bin/cmake
>> /home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-202=
4.11-rc1/output/build/host-qt6tools-6.7.3/
>> -G"Ninja"
>> -DCMAKE_MAKE_PROGRAM=3D"/home/pholden/Projects/Edvotek01072025/edvotek-e=
dvocycler3/buildroot-2024.11-rc1/output/host/bin/ninja"
>> -DCMAKE_INSTALL_SO_NO_EXE=3D0
>> -DCMAKE_FIND_ROOT_PATH=3D"/home/pholden/Projects/Edvotek01072025/edvotek=
-edvocycler3/buildroot-2024.11-rc1/output/host"
>> -DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM=3D"BOTH"
>> -DCMAKE_FIND_ROOT_PATH_MODE_LIBRARY=3D"BOTH"
>> -DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE=3D"BOTH"
>> -DCMAKE_INSTALL_PREFIX=3D"/home/pholden/Projects/Edvotek01072025/edvotek=
-edvocycler3/buildroot-2024.11-rc1/output/host"
>> -DCMAKE_C_FLAGS=3D"-O2
>> -I/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2=
024.11-rc1/output/host/include"
>> -DCMAKE_CXX_FLAGS=3D"-O2
>> -I/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2=
024.11-rc1/output/host/include"
>> -DCMAKE_EXE_LINKER_FLAGS=3D"-L/home/pholden/Projects/Edvotek01072025/edv=
otek-edvocycler3/buildroot-2024.11-rc1/output/host/lib
>> -Wl,-rpath,/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/bu=
ildroot-2024.11-rc1/output/host/lib"
>> -DCMAKE_SHARED_LINKER_FLAGS=3D"-L/home/pholden/Projects/Edvotek01072025/=
edvotek-edvocycler3/buildroot-2024.11-rc1/output/host/lib
>> -Wl,-rpath,/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/bu=
ildroot-2024.11-rc1/output/host/lib"
>> -DCMAKE_C_COMPILER=3D"/usr/bin/gcc" -DCMAKE_CXX_COMPILER=3D"/usr/bin/g++=
"
>>  -DCMAKE_C_COMPILER_LAUNCHER=3D"" -DCMAKE_CXX_COMPILER_LAUNCHER=3D""
>>  -DCMAKE_COLOR_MAKEFILE=3DOFF -DBUILD_DOC=3DOFF -DBUILD_DOCS=3DOFF
>> -DBUILD_EXAMPLE=3DOFF -DBUILD_EXAMPLES=3DOFF -DBUILD_TEST=3DOFF -DBUILD_=
TESTS=3DOFF
>> -DBUILD_TESTING=3DOFF -DBUILD_SHARED_LIBS=3DON  -DQT_BUILD_EXAMPLES=3DOF=
F
>> -DQT_BUILD_TESTS=3DOFF -DFEATURE_linguist=3DON )
>> -- The CXX compiler identification is GNU 11.4.0
>> -- The C compiler identification is GNU 11.4.0
>> -- Detecting CXX compiler ABI info
>> -- Detecting CXX compiler ABI info - done
>> -- Check for working CXX compiler: /usr/bin/g++ - skipped
>> -- Detecting CXX compile features
>> -- Detecting CXX compile features - done
>> -- Detecting C compiler ABI info
>> -- Detecting C compiler ABI info - done
>> -- Check for working C compiler: /usr/bin/gcc - skipped
>> -- Detecting C compile features
>> -- Detecting C compile features - done
>> -- Looking for pthread.h
>> -- Looking for pthread.h - found
>> -- Performing Test CMAKE_HAVE_LIBC_PTHREAD
>> -- Performing Test CMAKE_HAVE_LIBC_PTHREAD - Success
>> -- Found Threads: TRUE
>> -- Performing Test HAVE_STDATOMIC
>> -- Performing Test HAVE_STDATOMIC - Success
>> -- Found WrapAtomic: TRUE
>> -- Force setting build type to 'Release'.
>> CMake Error at /usr/lib/llvm-14/lib/cmake/clang/ClangTargets.cmake:750
>> (message):
>>   The imported target "clangBasic" references the file
>>
>>      "/usr/lib/llvm-14/lib/libclangBasic.a"
>>
>>   but this file does not exist.  Possible reasons include:
>>
>>   * The file was deleted, renamed, or moved to another location.
>>
>>   * An install or uninstall procedure did not complete successfully.
>>
>>   * The installation package was faulty and contained
>>
>>      "/usr/lib/llvm-14/lib/cmake/clang/ClangTargets.cmake"
>>
>>   but not all the files it references.
>>
>> Call Stack (most recent call first):
>>   /usr/lib/cmake/clang-14/ClangConfig.cmake:19 (include)
>>   cmake/FindWrapLibClang.cmake:17 (find_package)
>>
>> /home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-202=
4.11-rc1/output/build/host-qt6base-6.7.3/cmake/QtFindPackageHelpers.cmake:1=
56
>> (find_package)
>>   configure.cmake:20 (qt_find_package)
>>
>> /home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-202=
4.11-rc1/output/build/host-qt6base-6.7.3/cmake/QtFeature.cmake:678
>> (include)
>>   src/CMakeLists.txt:18 (qt_feature_evaluate_features)
>>
>>
>> -- Configuring incomplete, errors occurred!
>> See also
>> "/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-20=
24.11-rc1/output/build/host-qt6tools-6.7.3/buildroot-build/CMakeFiles/CMake=
Output.log".
>> make[1]: *** [package/pkg-generic.mk:279:
>> /home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-202=
4.11-rc1/output/build/host-qt6tools-6.7.3/.stamp_configured]
>> Error 1
>> make: *** [Makefile:83: _all] Error 2
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
>>
>

--000000000000173645062bd1c838
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br></div><div>qttools require at least clang 17. So =
we should not try to enable support unless suitable version is available.</=
div><div><br></div><div>So we should set -DFEATURE_clang=3DOFF</div><div><b=
r></div><div>-Roy<br></div><br></div><br><div class=3D"gmail_quote gmail_qu=
ote_container"><div dir=3D"ltr" class=3D"gmail_attr">tor. 16. jan. 2025 kl.=
 11:23 skrev Roy Kollen Svendsen &lt;<a href=3D"mailto:roykollensvendsen@gm=
ail.com">roykollensvendsen@gmail.com</a>&gt;:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex"><div dir=3D"ltr"><div>Hi Patricia,</div><div>=
<br></div><div>I&#39;ll take look at this as soon as I get a chance. Can yo=
u send me a minimal config that recreate the problem?</div><div><br></div><=
div>Thanks in advance,</div><div><br></div><div>Roy</div></div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">tir. 14. jan. 2025=
 kl. 20:16 skrev Patricia Holden &lt;<a href=3D"mailto:pholden@nklabs.com" =
target=3D"_blank">pholden@nklabs.com</a>&gt;:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex"><div dir=3D"ltr">We are using Buildroot versi=
on &quot;2024.11-rc1.=C2=A0 We just turned on &quot;Host Utilities-&gt;host=
 qt6 tools-&gt;host linguistic tools&quot;.=C2=A0 I run make, get the error=
 and output below.=C2=A0 Is there a fix for this?=C2=A0 Am I missing a depe=
ndency I need to install on my host PC?<div><br></div><div>Thanks!</div><di=
v>Pat<br><div><br></div><div>make BR2_EXTERNAL=3D../edvo_br host-qt6tools<b=
r>&gt;&gt;&gt; host-qt6tools 6.7.3 Configuring<br>(mkdir -p /home/pholden/P=
rojects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.11-rc1/output/bu=
ild/host-qt6tools-6.7.3//buildroot-build &amp;&amp; cd /home/pholden/Projec=
ts/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.11-rc1/output/build/h=
ost-qt6tools-6.7.3//buildroot-build &amp;&amp; rm -f CMakeCache.txt &amp;&a=
mp; PATH=3D&quot;/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3=
/buildroot-2024.11-rc1/output/host/bin:/home/pholden/Projects/Edvotek010720=
25/edvotek-edvocycler3/buildroot-2024.11-rc1/output/host/sbin:/home/pholden=
/.pyenv/shims:/home/pholden/.pyenv/bin:/usr/local/sbin:/usr/local/bin:/usr/=
sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/snap/bin&qu=
ot; PKG_CONFIG=3D&quot;/home/pholden/Projects/Edvotek01072025/edvotek-edvoc=
ycler3/buildroot-2024.11-rc1/output/host/bin/pkg-config&quot; PKG_CONFIG_SY=
SROOT_DIR=3D&quot;/&quot; PKG_CONFIG_LIBDIR=3D&quot;/home/pholden/Projects/=
Edvotek01072025/edvotek-edvocycler3/buildroot-2024.11-rc1/output/host/lib/p=
kgconfig:/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildro=
ot-2024.11-rc1/output/host/share/pkgconfig&quot; PKG_CONFIG_ALLOW_SYSTEM_CF=
LAGS=3D1 PKG_CONFIG_ALLOW_SYSTEM_LIBS=3D1 =C2=A0/usr/bin/cmake /home/pholde=
n/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.11-rc1/output=
/build/host-qt6tools-6.7.3/ -G&quot;Ninja&quot; -DCMAKE_MAKE_PROGRAM=3D&quo=
t;/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024=
.11-rc1/output/host/bin/ninja&quot; -DCMAKE_INSTALL_SO_NO_EXE=3D0 -DCMAKE_F=
IND_ROOT_PATH=3D&quot;/home/pholden/Projects/Edvotek01072025/edvotek-edvocy=
cler3/buildroot-2024.11-rc1/output/host&quot; -DCMAKE_FIND_ROOT_PATH_MODE_P=
ROGRAM=3D&quot;BOTH&quot; -DCMAKE_FIND_ROOT_PATH_MODE_LIBRARY=3D&quot;BOTH&=
quot; -DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE=3D&quot;BOTH&quot; -DCMAKE_INSTAL=
L_PREFIX=3D&quot;/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3=
/buildroot-2024.11-rc1/output/host&quot; -DCMAKE_C_FLAGS=3D&quot;-O2 -I/hom=
e/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.11-rc=
1/output/host/include&quot; -DCMAKE_CXX_FLAGS=3D&quot;-O2 -I/home/pholden/P=
rojects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.11-rc1/output/ho=
st/include&quot; -DCMAKE_EXE_LINKER_FLAGS=3D&quot;-L/home/pholden/Projects/=
Edvotek01072025/edvotek-edvocycler3/buildroot-2024.11-rc1/output/host/lib -=
Wl,-rpath,/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildr=
oot-2024.11-rc1/output/host/lib&quot; -DCMAKE_SHARED_LINKER_FLAGS=3D&quot;-=
L/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.=
11-rc1/output/host/lib -Wl,-rpath,/home/pholden/Projects/Edvotek01072025/ed=
votek-edvocycler3/buildroot-2024.11-rc1/output/host/lib&quot; -DCMAKE_C_COM=
PILER=3D&quot;/usr/bin/gcc&quot; -DCMAKE_CXX_COMPILER=3D&quot;/usr/bin/g++&=
quot; =C2=A0-DCMAKE_C_COMPILER_LAUNCHER=3D&quot;&quot; -DCMAKE_CXX_COMPILER=
_LAUNCHER=3D&quot;&quot; =C2=A0-DCMAKE_COLOR_MAKEFILE=3DOFF -DBUILD_DOC=3DO=
FF -DBUILD_DOCS=3DOFF -DBUILD_EXAMPLE=3DOFF -DBUILD_EXAMPLES=3DOFF -DBUILD_=
TEST=3DOFF -DBUILD_TESTS=3DOFF -DBUILD_TESTING=3DOFF -DBUILD_SHARED_LIBS=3D=
ON =C2=A0-DQT_BUILD_EXAMPLES=3DOFF -DQT_BUILD_TESTS=3DOFF -DFEATURE_linguis=
t=3DON )<br>-- The CXX compiler identification is GNU 11.4.0<br>-- The C co=
mpiler identification is GNU 11.4.0<br>-- Detecting CXX compiler ABI info<b=
r>-- Detecting CXX compiler ABI info - done<br>-- Check for working CXX com=
piler: /usr/bin/g++ - skipped<br>-- Detecting CXX compile features<br>-- De=
tecting CXX compile features - done<br>-- Detecting C compiler ABI info<br>=
-- Detecting C compiler ABI info - done<br>-- Check for working C compiler:=
 /usr/bin/gcc - skipped<br>-- Detecting C compile features<br>-- Detecting =
C compile features - done<br>-- Looking for pthread.h<br>-- Looking for pth=
read.h - found<br>-- Performing Test CMAKE_HAVE_LIBC_PTHREAD<br>-- Performi=
ng Test CMAKE_HAVE_LIBC_PTHREAD - Success<br>-- Found Threads: TRUE =C2=A0<=
br>-- Performing Test HAVE_STDATOMIC<br>-- Performing Test HAVE_STDATOMIC -=
 Success<br>-- Found WrapAtomic: TRUE =C2=A0<br>-- Force setting build type=
 to &#39;Release&#39;.<br>CMake Error at /usr/lib/llvm-14/lib/cmake/clang/C=
langTargets.cmake:750 (message):<br>=C2=A0 The imported target &quot;clangB=
asic&quot; references the file<br><br>=C2=A0 =C2=A0 =C2=A0&quot;/usr/lib/ll=
vm-14/lib/libclangBasic.a&quot;<br><br>=C2=A0 but this file does not exist.=
=C2=A0 Possible reasons include:<br><br>=C2=A0 * The file was deleted, rena=
med, or moved to another location.<br><br>=C2=A0 * An install or uninstall =
procedure did not complete successfully.<br><br>=C2=A0 * The installation p=
ackage was faulty and contained<br><br>=C2=A0 =C2=A0 =C2=A0&quot;/usr/lib/l=
lvm-14/lib/cmake/clang/ClangTargets.cmake&quot;<br><br>=C2=A0 but not all t=
he files it references.<br><br>Call Stack (most recent call first):<br>=C2=
=A0 /usr/lib/cmake/clang-14/ClangConfig.cmake:19 (include)<br>=C2=A0 cmake/=
FindWrapLibClang.cmake:17 (find_package)<br>=C2=A0 /home/pholden/Projects/E=
dvotek01072025/edvotek-edvocycler3/buildroot-2024.11-rc1/output/build/host-=
qt6base-6.7.3/cmake/QtFindPackageHelpers.cmake:156 (find_package)<br>=C2=A0=
 configure.cmake:20 (qt_find_package)<br>=C2=A0 /home/pholden/Projects/Edvo=
tek01072025/edvotek-edvocycler3/buildroot-2024.11-rc1/output/build/host-qt6=
base-6.7.3/cmake/QtFeature.cmake:678 (include)<br>=C2=A0 src/CMakeLists.txt=
:18 (qt_feature_evaluate_features)<br><br><br>-- Configuring incomplete, er=
rors occurred!<br>See also &quot;/home/pholden/Projects/Edvotek01072025/edv=
otek-edvocycler3/buildroot-2024.11-rc1/output/build/host-qt6tools-6.7.3/bui=
ldroot-build/CMakeFiles/CMakeOutput.log&quot;.<br>make[1]: *** [package/<a =
href=3D"http://pkg-generic.mk:279" target=3D"_blank">pkg-generic.mk:279</a>=
: /home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024=
.11-rc1/output/build/host-qt6tools-6.7.3/.stamp_configured] Error 1<br>make=
: *** [Makefile:83: _all] Error 2<br></div></div></div>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@buil=
droot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listinfo/b=
uildroot</a><br>
</blockquote></div>
</blockquote></div>

--000000000000173645062bd1c838--

--===============0739517732904047471==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0739517732904047471==--
