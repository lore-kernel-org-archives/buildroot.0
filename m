Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE13CC02180
	for <buildroot@archiver.kernel.org>; Thu, 16 Jan 2025 13:01:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B91E83BD3;
	Thu, 16 Jan 2025 13:01:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 21UCN9BLDb0d; Thu, 16 Jan 2025 13:00:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 294F983C30
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 294F983C30;
	Thu, 16 Jan 2025 13:00:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DAB3DB89
 for <buildroot@buildroot.org>; Thu, 16 Jan 2025 13:00:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D449D4062F
 for <buildroot@buildroot.org>; Thu, 16 Jan 2025 13:00:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VYuoOtWviExh for <buildroot@buildroot.org>;
 Thu, 16 Jan 2025 13:00:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b36; helo=mail-yb1-xb36.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D59DB40792
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D59DB40792
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D59DB40792
 for <buildroot@buildroot.org>; Thu, 16 Jan 2025 13:00:54 +0000 (UTC)
Received: by mail-yb1-xb36.google.com with SMTP id
 3f1490d57ef6-e455bf1f4d3so1240270276.2
 for <buildroot@buildroot.org>; Thu, 16 Jan 2025 05:00:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737032453; x=1737637253;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CLXQCjiKOpNpF9yuEh8M5tsnVgUt2sOjeOgb9cy4UZw=;
 b=rdiAr6dmQzRoD+9QnbeUMkbTr8jBQmB4g/ur3R7nhfaUCNdQ4KAZ3kD1Q3PzsqELDL
 lE9zZ/hEO6oR1r7BI0/JQ4Z3iAPw+MB+jW56fFLdSlOxaoqtN2mAfiRyxcdJpZD3xRko
 zeK3HQ78CKRXc3tZ81buVnCtGLZYw8Nctk1JiozyB36+X1qnx2K7M0FQ6oGGIeqJRgvg
 dnGIz7j7g7r/9rCQ+MESU3UR5/ZDU+waoMPJF13mllwM+XOu77t+0apVgY6yVmVckVAC
 hemuMt78F5UJmbl5paAMQQ37DKRazUCSP9i0i3tCVzS9w7pHlKs7MY5gP+LBaVP9PU3e
 kIMw==
X-Gm-Message-State: AOJu0YxKT11Tq1/t5yvsbmBWQITtWXynW1xIam3wj+zS6jweWloRFx4Y
 Qlut9iVK5AdEF78Wx/9IRrGsdRg+JKvT38ItikXOueX5sFS5wooe9WIkx/Y5fCtAar5ChzARa5a
 600BkbQFmybWa5JgfCZIX4L2RDUswiX8w
X-Gm-Gg: ASbGnct8bL/zVBGaGyMbTpNPHkm+R94IFwu/Dm1O2R4hLSfiZEe8ynvTqYewk2skkoT
 gOEbmOcgzLbP2wpe8aqsUl57EhOn7XWDvsgq3zGQ=
X-Google-Smtp-Source: AGHT+IGFZj0cN2LTUectMkO2kf6LrRqaIiqFg3Wl43X/cY6EalLbenX++XpzftTk/MewtpV6yG/xE8JkHEAKkOmMIIY=
X-Received: by 2002:a05:6902:2b92:b0:e57:3960:ffad with SMTP id
 3f1490d57ef6-e573961031dmr14925114276.30.1737032452818; Thu, 16 Jan 2025
 05:00:52 -0800 (PST)
MIME-Version: 1.0
References: <CAJ6EmCe5duhjeanDC8NPgR6CWdaUstRc5TcxWnVSBEkF2_dK3Q@mail.gmail.com>
 <CA+R_derbD_Ddd73fddoSaUri7Y+4_YWqZc-VyDjMF0dtd1_OBg@mail.gmail.com>
 <CA+R_deo_Cp-BtFUr2f7Wt0HCpzg8nNqnOzQspgRTZXgc3bCq_Q@mail.gmail.com>
In-Reply-To: <CA+R_deo_Cp-BtFUr2f7Wt0HCpzg8nNqnOzQspgRTZXgc3bCq_Q@mail.gmail.com>
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Date: Thu, 16 Jan 2025 14:00:41 +0100
X-Gm-Features: AbW1kvb7n96IvnMUGOfiQcP0v1Szz4oPUpScuThOmRQTpLAd2kJj0Pb6D9BMZzw
Message-ID: <CA+R_deow-0ETOu-RnsrNrB=HL573WKj8515yRqa5ngxo2LYr7g@mail.gmail.com>
To: Patricia Holden <pholden@nklabs.com>
Cc: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737032453; x=1737637253; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CLXQCjiKOpNpF9yuEh8M5tsnVgUt2sOjeOgb9cy4UZw=;
 b=hC6xxPSwu/szpnyHfABke2XmCYUWcEd9OFLBAVWUK1SYR6yvUvWysK5VmAQy2Whamx
 icTddjuLooKxC9KXvjGO786ZsQevdAUkImwpHU9KF5D1vuCY80K6PR4uhNL40M0Toby4
 Yp6e/VQ9pwey0nS36M4+LLQpR7xqLzOPOe/47Wts0Hvuj19UayqsHFPX/LQG23vFdo45
 LbNTenVd1+04WUUJRmVFHRyUmF6/vlSrxx+/hOQjRnVGfakX5WrhlVN8WhXHvZsDLfNv
 x/kpymXPD3Ui6UKIpp/FpY3cTV04jNtz2VfwqaHDJKzllHeDxGwt6qUa57Jb32w3Gyib
 LEzQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hC6xxPSw
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
Content-Type: multipart/mixed; boundary="===============8518603521806120452=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8518603521806120452==
Content-Type: multipart/alternative; boundary="000000000000504c85062bd26208"

--000000000000504c85062bd26208
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Since I'm the root cause of the problem I sent you a patch here:

https://patchwork.ozlabs.org/project/buildroot/patch/20250116125537.531666-=
1-roykollensvendsen@gmail.com/

Please test if this fixes your problem add you Tested-By etc.

Roy

tor. 16. jan. 2025 kl. 13:17 skrev Roy Kollen Svendsen <
roykollensvendsen@gmail.com>:

>
> qttools require at least clang 17. So we should not try to enable support
> unless suitable version is available.
>
> So we should set -DFEATURE_clang=3DOFF
>
> -Roy
>
>
> tor. 16. jan. 2025 kl. 11:23 skrev Roy Kollen Svendsen <
> roykollensvendsen@gmail.com>:
>
>> Hi Patricia,
>>
>> I'll take look at this as soon as I get a chance. Can you send me a
>> minimal config that recreate the problem?
>>
>> Thanks in advance,
>>
>> Roy
>>
>> tir. 14. jan. 2025 kl. 20:16 skrev Patricia Holden <pholden@nklabs.com>:
>>
>>> We are using Buildroot version "2024.11-rc1.  We just turned on "Host
>>> Utilities->host qt6 tools->host linguistic tools".  I run make, get the
>>> error and output below.  Is there a fix for this?  Am I missing a
>>> dependency I need to install on my host PC?
>>>
>>> Thanks!
>>> Pat
>>>
>>> make BR2_EXTERNAL=3D../edvo_br host-qt6tools
>>> >>> host-qt6tools 6.7.3 Configuring
>>> (mkdir -p
>>> /home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-20=
24.11-rc1/output/build/host-qt6tools-6.7.3//buildroot-build
>>> && cd
>>> /home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-20=
24.11-rc1/output/build/host-qt6tools-6.7.3//buildroot-build
>>> && rm -f CMakeCache.txt &&
>>> PATH=3D"/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buil=
droot-2024.11-rc1/output/host/bin:/home/pholden/Projects/Edvotek01072025/ed=
votek-edvocycler3/buildroot-2024.11-rc1/output/host/sbin:/home/pholden/.pye=
nv/shims:/home/pholden/.pyenv/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:=
/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/snap/bin"
>>> PKG_CONFIG=3D"/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler=
3/buildroot-2024.11-rc1/output/host/bin/pkg-config"
>>> PKG_CONFIG_SYSROOT_DIR=3D"/"
>>> PKG_CONFIG_LIBDIR=3D"/home/pholden/Projects/Edvotek01072025/edvotek-edv=
ocycler3/buildroot-2024.11-rc1/output/host/lib/pkgconfig:/home/pholden/Proj=
ects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.11-rc1/output/host/=
share/pkgconfig"
>>> PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=3D1 PKG_CONFIG_ALLOW_SYSTEM_LIBS=3D1
>>>  /usr/bin/cmake
>>> /home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-20=
24.11-rc1/output/build/host-qt6tools-6.7.3/
>>> -G"Ninja"
>>> -DCMAKE_MAKE_PROGRAM=3D"/home/pholden/Projects/Edvotek01072025/edvotek-=
edvocycler3/buildroot-2024.11-rc1/output/host/bin/ninja"
>>> -DCMAKE_INSTALL_SO_NO_EXE=3D0
>>> -DCMAKE_FIND_ROOT_PATH=3D"/home/pholden/Projects/Edvotek01072025/edvote=
k-edvocycler3/buildroot-2024.11-rc1/output/host"
>>> -DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM=3D"BOTH"
>>> -DCMAKE_FIND_ROOT_PATH_MODE_LIBRARY=3D"BOTH"
>>> -DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE=3D"BOTH"
>>> -DCMAKE_INSTALL_PREFIX=3D"/home/pholden/Projects/Edvotek01072025/edvote=
k-edvocycler3/buildroot-2024.11-rc1/output/host"
>>> -DCMAKE_C_FLAGS=3D"-O2
>>> -I/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-=
2024.11-rc1/output/host/include"
>>> -DCMAKE_CXX_FLAGS=3D"-O2
>>> -I/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-=
2024.11-rc1/output/host/include"
>>> -DCMAKE_EXE_LINKER_FLAGS=3D"-L/home/pholden/Projects/Edvotek01072025/ed=
votek-edvocycler3/buildroot-2024.11-rc1/output/host/lib
>>> -Wl,-rpath,/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/b=
uildroot-2024.11-rc1/output/host/lib"
>>> -DCMAKE_SHARED_LINKER_FLAGS=3D"-L/home/pholden/Projects/Edvotek01072025=
/edvotek-edvocycler3/buildroot-2024.11-rc1/output/host/lib
>>> -Wl,-rpath,/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/b=
uildroot-2024.11-rc1/output/host/lib"
>>> -DCMAKE_C_COMPILER=3D"/usr/bin/gcc" -DCMAKE_CXX_COMPILER=3D"/usr/bin/g+=
+"
>>>  -DCMAKE_C_COMPILER_LAUNCHER=3D"" -DCMAKE_CXX_COMPILER_LAUNCHER=3D""
>>>  -DCMAKE_COLOR_MAKEFILE=3DOFF -DBUILD_DOC=3DOFF -DBUILD_DOCS=3DOFF
>>> -DBUILD_EXAMPLE=3DOFF -DBUILD_EXAMPLES=3DOFF -DBUILD_TEST=3DOFF -DBUILD=
_TESTS=3DOFF
>>> -DBUILD_TESTING=3DOFF -DBUILD_SHARED_LIBS=3DON  -DQT_BUILD_EXAMPLES=3DO=
FF
>>> -DQT_BUILD_TESTS=3DOFF -DFEATURE_linguist=3DON )
>>> -- The CXX compiler identification is GNU 11.4.0
>>> -- The C compiler identification is GNU 11.4.0
>>> -- Detecting CXX compiler ABI info
>>> -- Detecting CXX compiler ABI info - done
>>> -- Check for working CXX compiler: /usr/bin/g++ - skipped
>>> -- Detecting CXX compile features
>>> -- Detecting CXX compile features - done
>>> -- Detecting C compiler ABI info
>>> -- Detecting C compiler ABI info - done
>>> -- Check for working C compiler: /usr/bin/gcc - skipped
>>> -- Detecting C compile features
>>> -- Detecting C compile features - done
>>> -- Looking for pthread.h
>>> -- Looking for pthread.h - found
>>> -- Performing Test CMAKE_HAVE_LIBC_PTHREAD
>>> -- Performing Test CMAKE_HAVE_LIBC_PTHREAD - Success
>>> -- Found Threads: TRUE
>>> -- Performing Test HAVE_STDATOMIC
>>> -- Performing Test HAVE_STDATOMIC - Success
>>> -- Found WrapAtomic: TRUE
>>> -- Force setting build type to 'Release'.
>>> CMake Error at /usr/lib/llvm-14/lib/cmake/clang/ClangTargets.cmake:750
>>> (message):
>>>   The imported target "clangBasic" references the file
>>>
>>>      "/usr/lib/llvm-14/lib/libclangBasic.a"
>>>
>>>   but this file does not exist.  Possible reasons include:
>>>
>>>   * The file was deleted, renamed, or moved to another location.
>>>
>>>   * An install or uninstall procedure did not complete successfully.
>>>
>>>   * The installation package was faulty and contained
>>>
>>>      "/usr/lib/llvm-14/lib/cmake/clang/ClangTargets.cmake"
>>>
>>>   but not all the files it references.
>>>
>>> Call Stack (most recent call first):
>>>   /usr/lib/cmake/clang-14/ClangConfig.cmake:19 (include)
>>>   cmake/FindWrapLibClang.cmake:17 (find_package)
>>>
>>> /home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-20=
24.11-rc1/output/build/host-qt6base-6.7.3/cmake/QtFindPackageHelpers.cmake:=
156
>>> (find_package)
>>>   configure.cmake:20 (qt_find_package)
>>>
>>> /home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-20=
24.11-rc1/output/build/host-qt6base-6.7.3/cmake/QtFeature.cmake:678
>>> (include)
>>>   src/CMakeLists.txt:18 (qt_feature_evaluate_features)
>>>
>>>
>>> -- Configuring incomplete, errors occurred!
>>> See also
>>> "/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2=
024.11-rc1/output/build/host-qt6tools-6.7.3/buildroot-build/CMakeFiles/CMak=
eOutput.log".
>>> make[1]: *** [package/pkg-generic.mk:279:
>>> /home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-20=
24.11-rc1/output/build/host-qt6tools-6.7.3/.stamp_configured]
>>> Error 1
>>> make: *** [Makefile:83: _all] Error 2
>>> _______________________________________________
>>> buildroot mailing list
>>> buildroot@buildroot.org
>>> https://lists.buildroot.org/mailman/listinfo/buildroot
>>>
>>

--000000000000504c85062bd26208
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br></div><div>Since I&#39;m the root c=
ause of the problem I sent you a patch here:<br></div><div><br></div><div><=
a href=3D"https://patchwork.ozlabs.org/project/buildroot/patch/202501161255=
37.531666-1-roykollensvendsen@gmail.com/">https://patchwork.ozlabs.org/proj=
ect/buildroot/patch/20250116125537.531666-1-roykollensvendsen@gmail.com/</a=
></div><div><br></div><div>Please test if this fixes your problem add you T=
ested-By etc.</div><div><br></div><div>Roy<br></div></div><br><div class=3D=
"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">t=
or. 16. jan. 2025 kl. 13:17 skrev Roy Kollen Svendsen &lt;<a href=3D"mailto=
:roykollensvendsen@gmail.com">roykollensvendsen@gmail.com</a>&gt;:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div><b=
r></div><div>qttools require at least clang 17. So we should not try to ena=
ble support unless suitable version is available.</div><div><br></div><div>=
So we should set -DFEATURE_clang=3DOFF</div><div><br></div><div>-Roy<br></d=
iv><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">tor. 16. jan. 2025 kl. 11:23 skrev Roy Kollen Svendsen &lt;<a href=
=3D"mailto:roykollensvendsen@gmail.com" target=3D"_blank">roykollensvendsen=
@gmail.com</a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex"><div dir=3D"ltr"><div>Hi Patricia,</div><div><br></div><div>I&#39;ll ta=
ke look at this as soon as I get a chance. Can you send me a minimal config=
 that recreate the problem?</div><div><br></div><div>Thanks in advance,</di=
v><div><br></div><div>Roy</div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">tir. 14. jan. 2025 kl. 20:16 skrev Patricia =
Holden &lt;<a href=3D"mailto:pholden@nklabs.com" target=3D"_blank">pholden@=
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
</blockquote></div>
</blockquote></div>

--000000000000504c85062bd26208--

--===============8518603521806120452==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8518603521806120452==--
