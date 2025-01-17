Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75F5AC02183
	for <buildroot@archiver.kernel.org>; Fri, 17 Jan 2025 17:43:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E9AE360673;
	Fri, 17 Jan 2025 17:43:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AKa0Yq-GSgOP; Fri, 17 Jan 2025 17:42:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6633760676
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6633760676;
	Fri, 17 Jan 2025 17:42:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0394D69
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 17:42:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DB13F8149C
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 17:42:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xSg9zwQllytX for <buildroot@buildroot.org>;
 Fri, 17 Jan 2025 17:42:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::a30; helo=mail-vk1-xa30.google.com;
 envelope-from=pholden@nklabs.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4049A81320
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4049A81320
Received: from mail-vk1-xa30.google.com (mail-vk1-xa30.google.com
 [IPv6:2607:f8b0:4864:20::a30])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4049A81320
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 17:42:53 +0000 (UTC)
Received: by mail-vk1-xa30.google.com with SMTP id
 71dfb90a1353d-518954032b2so697318e0c.0
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 09:42:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737135772; x=1737740572;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Mu4pCeiwaA8zG3JjPQGr8KbOqDjCOIfpv4aO7d1HOhg=;
 b=DY7QZlPO/THMQJp6rYJ+E4gkah1ugXf4n/FPYpQFwPoT/kprzE14PLbgRI2RGrQT0I
 gnwLf6A/JdQtA3j79Gv7gnoQJSyqClj0ErtYCEuj/NjffX8MLOFn9daAUQkakdex6AuR
 GmwUBVeGrU0eD0rwzsQpL25emjf0gAFCa+2qhcagyMrnSsUXMyXB3zvjo8iVjrEE1eu8
 4T5F32Vx2XndM6JAwuyDUgrEYliOezcYE/YxbzovtvBdp+Z+mqviKgmCPtQjkQdvBc9E
 wABJw/xF55NH7TyXApNhTiuOZjZDsbntIx8alXxFvRR983RGtEorDGnRQnfxvWzYLA7e
 xcfQ==
X-Gm-Message-State: AOJu0Yx+6vnoGjFFwGso5/sdy5Q7fvtHmbbqNp0d3WI8ICTtMWBsuhLt
 e4el/MfL+z9mS0FaCy2vSJ0ucFhxn993zoVlR+UuqMw3zUNbYklbbUfVVYc+l9v9m0MaUguF/tP
 gT6uxVAEvIM62ZpRWyy9yTQxlDulblXYr5iUHX/qo8XigAHKETJw=
X-Gm-Gg: ASbGncud5+ljD2y+0X5+do40X7EnRJA+AxczuXGzxqp2Nw2BeZv6stGXXfwjkU2YpBI
 PfeZbaKwvX01jD5rmOnS0ww17nG7qm4mE+20Kvludk2SOOSd9QCxxmkf3SBohOirAfk8+
X-Google-Smtp-Source: AGHT+IG9t6cqiDXRWAofSG4XvNidKeU3dgKG70YXjoVloWwbLQlmgZPFii+QCafN3wkmnjTbws/7KP8R66BD+sdT7BU=
X-Received: by 2002:a05:6122:9008:b0:51b:8949:c996 with SMTP id
 71dfb90a1353d-51d5b351af7mr3784552e0c.9.1737135771784; Fri, 17 Jan 2025
 09:42:51 -0800 (PST)
MIME-Version: 1.0
References: <CAJ6EmCe5duhjeanDC8NPgR6CWdaUstRc5TcxWnVSBEkF2_dK3Q@mail.gmail.com>
 <CA+R_derbD_Ddd73fddoSaUri7Y+4_YWqZc-VyDjMF0dtd1_OBg@mail.gmail.com>
 <CA+R_deo_Cp-BtFUr2f7Wt0HCpzg8nNqnOzQspgRTZXgc3bCq_Q@mail.gmail.com>
 <CA+R_deow-0ETOu-RnsrNrB=HL573WKj8515yRqa5ngxo2LYr7g@mail.gmail.com>
 <CAJ6EmCcMh1HKi16b0gWeTYudz2Qqv0gDS83D_8x5FEw6Vkzvbw@mail.gmail.com>
 <CAJ6EmCeAXV=d94-Da-PjO36X17YhWqHKeMWyzfo-u8zvpw3vWQ@mail.gmail.com>
 <CAJ6EmCeQbJ9LSY7DPiMS8h9Sgti8qHzgKni63KSRDRTHqG34aA@mail.gmail.com>
 <CA+R_deqY7orDSBq2ORTiapbjJjNs-ZLfb7ZtKyxUvjY7GZK1hw@mail.gmail.com>
 <CAJ6EmCf3zPHKpmRZBcX0zfYsexCiMnOHkSq=x1WR83i_EQAm6g@mail.gmail.com>
 <CA+R_deqC-dZUd0nYwtC41cVX_1VB93=sveCgBQepFXvgDELRrA@mail.gmail.com>
 <CAJ6EmCec1dsAvWZqS1uam5XyZhZAkysPF3CvJoNEhSH6xL60QA@mail.gmail.com>
In-Reply-To: <CAJ6EmCec1dsAvWZqS1uam5XyZhZAkysPF3CvJoNEhSH6xL60QA@mail.gmail.com>
From: Patricia Holden <pholden@nklabs.com>
Date: Fri, 17 Jan 2025 12:42:40 -0500
X-Gm-Features: AbW1kvYGhxR_lOEIV09mmlIfEvYpRW0127-Cu5dt3e09bYZQ8rw4J1-hDkQyQB8
Message-ID: <CAJ6EmCenccG5-SQXk5N7pHWcfqHPXRbRmZZyS6ze1bqjiniJSA@mail.gmail.com>
To: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Cc: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nklabs.com; s=google; t=1737135772; x=1737740572; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Mu4pCeiwaA8zG3JjPQGr8KbOqDjCOIfpv4aO7d1HOhg=;
 b=X57ojk5GA2OJGeEFNdGDP2jlWZpU2fhfVWE/S/qqFagNVWSQjKFRxmQws46W4IH5Q7
 RBjT3PEIWWFud/p3YCRpTaCx2BDb4LSBzPswleyL6DeHKC8vTaM2yZBgkwASNA5Juipo
 dPLtT7QVoidQRyTFNdpalx4uPwVuNpZMCRqIfxBKp4gtuyIjRIObl0+ZXHhNiFRvnRSO
 j8VBfZI0rBfPRtjRNyrCsrohfrJbqOxXgPRWNJTba1oKJmPbbk1EqmBCJZcX3LFwXiPf
 vu+aDqEWfj9nEG/mJPnkAegJ87B+nGbQRcBSYQ0X0MMTNtgEx8BE7Ds8dvfVrz2XtIpu
 8mJQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=nklabs.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=nklabs.com header.i=@nklabs.com header.a=rsa-sha256
 header.s=google header.b=X57ojk5G
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
Content-Type: multipart/mixed; boundary="===============0874348195847463686=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0874348195847463686==
Content-Type: multipart/alternative; boundary="0000000000009ab081062bea700d"

--0000000000009ab081062bea700d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I did a search on my buildroot directory for PKG_CONFIG_SYSROOT_DIR.  I
found it correctly set to
"/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-20
24.11-rc1/output/host/aarch64-buildroot-linux-gnu/sysroot" for other host
packages that were built.  Looking at their mk file to see if
qt6tools missed something for HOST config options.

On Fri, Jan 17, 2025 at 12:34=E2=80=AFPM Patricia Holden <pholden@nklabs.co=
m> wrote:

> That's definitely suspicious.  Does QT6 tools package need a prefix added
> to direct to target-dir?
>
> On Fri, Jan 17, 2025 at 12:14=E2=80=AFPM Roy Kollen Svendsen <
> roykollensvendsen@gmail.com> wrote:
>
>> I noticed this in the error log: PKG_CONFIG_SYSROOT_DIR=3D"/".
>>
>> fre. 17. jan. 2025, 17:26 skrev Patricia Holden <pholden@nklabs.com>:
>>
>>> No, it does not make much sense to me.  Here's another clue:  I have 2
>>> workspaces on my system.  One workspace now seems to work, the other on=
e I
>>> did a clean build last night and it failed in exactly the same location
>>> (same defconfig).
>>>
>>>  make BR2_EXTERNAL=3D../edvo_br
>>> qttools-everywhere-src-6.7.3.tar.xz: OK (sha256:
>>> f03bb7df619cd9ac9dba110e30b7bcab5dd88eb8bdc9cc752563b4367233203f)
>>> >>> host-qt6tools 6.7.3 Extracting
>>> xzcat
>>> /home/pholden/Projects/TestEdvo3/edvotek-edvocycler3/buildroot-2024.11-=
rc1/dl/qt6tools/qttools-everywhere-src-6.7.3.tar.xz
>>> |
>>> /home/pholden/Projects/TestEdvo3/edvotek-edvocycler3/buildroot-2024.11-=
rc1/output/host/bin/tar
>>> --strip-components=3D1 -C
>>> /home/pholden/Projects/TestEdvo3/edvotek-edvocycler3/buildroot-2024.11-=
rc1/output/build/host-qt6tools-6.7.3
>>>   -xf -
>>> >>> host-qt6tools 6.7.3 Patching
>>> >>> host-qt6tools 6.7.3 Configuring
>>> (mkdir -p
>>> /home/pholden/Projects/TestEdvo3/edvotek-edvocycler3/buildroot-2024.11-=
rc1/output/build/host-qt6tools-6.7.3//buildroot-build
>>> && cd
>>> /home/pholden/Projects/TestEdvo3/edvotek-edvocycler3/buildroot-2024.11-=
rc1/output/build/host-qt6tools-6.7.3//buildroot-build
>>> && rm -f CMakeCache.txt &&
>>> PATH=3D"/home/pholden/Projects/TestEdvo3/edvotek-edvocycler3/buildroot-=
2024.11-rc1/output/host/bin:/home/pholden/Projects/TestEdvo3/edvotek-edvocy=
cler3/buildroot-2024.11-rc1/output/host/sbin:/home/pholden/.pyenv/shims:/ho=
me/pholden/.pyenv/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sb=
in:/bin:/usr/games:/usr/local/games:/snap/bin:/snap/bin"
>>> PKG_CONFIG=3D"/home/pholden/Projects/TestEdvo3/edvotek-edvocycler3/buil=
droot-2024.11-rc1/output/host/bin/pkg-config"
>>> PKG_CONFIG_SYSROOT_DIR=3D"/"
>>> PKG_CONFIG_LIBDIR=3D"/home/pholden/Projects/TestEdvo3/edvotek-edvocycle=
r3/buildroot-2024.11-rc1/output/host/lib/pkgconfig:/home/pholden/Projects/T=
estEdvo3/edvotek-edvocycler3/buildroot-2024.11-rc1/output/host/share/pkgcon=
fig"
>>> PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=3D1 PKG_CONFIG_ALLOW_SYSTEM_LIBS=3D1
>>>  /usr/bin/cmake
>>> /home/pholden/Projects/TestEdvo3/edvotek-edvocycler3/buildroot-2024.11-=
rc1/output/build/host-qt6tools-6.7.3/
>>> -G"Ninja"
>>> -DCMAKE_MAKE_PROGRAM=3D"/home/pholden/Projects/TestEdvo3/edvotek-edvocy=
cler3/buildroot-2024.11-rc1/output/host/bin/ninja"
>>> -DCMAKE_INSTALL_SO_NO_EXE=3D0
>>> -DCMAKE_FIND_ROOT_PATH=3D"/home/pholden/Projects/TestEdvo3/edvotek-edvo=
cycler3/buildroot-2024.11-rc1/output/host"
>>> -DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM=3D"BOTH"
>>> -DCMAKE_FIND_ROOT_PATH_MODE_LIBRARY=3D"BOTH"
>>> -DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE=3D"BOTH"
>>> -DCMAKE_INSTALL_PREFIX=3D"/home/pholden/Projects/TestEdvo3/edvotek-edvo=
cycler3/buildroot-2024.11-rc1/output/host"
>>> -DCMAKE_C_FLAGS=3D"-O2
>>> -I/home/pholden/Projects/TestEdvo3/edvotek-edvocycler3/buildroot-2024.1=
1-rc1/output/host/include"
>>> -DCMAKE_CXX_FLAGS=3D"-O2
>>> -I/home/pholden/Projects/TestEdvo3/edvotek-edvocycler3/buildroot-2024.1=
1-rc1/output/host/include"
>>> -DCMAKE_EXE_LINKER_FLAGS=3D"-L/home/pholden/Projects/TestEdvo3/edvotek-=
edvocycler3/buildroot-2024.11-rc1/output/host/lib
>>> -Wl,-rpath,/home/pholden/Projects/TestEdvo3/edvotek-edvocycler3/buildro=
ot-2024.11-rc1/output/host/lib"
>>> -DCMAKE_SHARED_LINKER_FLAGS=3D"-L/home/pholden/Projects/TestEdvo3/edvot=
ek-edvocycler3/buildroot-2024.11-rc1/output/host/lib
>>> -Wl,-rpath,/home/pholden/Projects/TestEdvo3/edvotek-edvocycler3/buildro=
ot-2024.11-rc1/output/host/lib"
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
>>> /home/pholden/Projects/TestEdvo3/edvotek-edvocycler3/buildroot-2024.11-=
rc1/output/build/host-qt6base-6.7.3/cmake/QtFindPackageHelpers.cmake:156
>>> (find_package)
>>>   configure.cmake:20 (qt_find_package)
>>>
>>> /home/pholden/Projects/TestEdvo3/edvotek-edvocycler3/buildroot-2024.11-=
rc1/output/build/host-qt6base-6.7.3/cmake/QtFeature.cmake:678
>>> (include)
>>>   src/CMakeLists.txt:18 (qt_feature_evaluate_features)
>>>
>>>
>>> -- Configuring incomplete, errors occurred!
>>> See also
>>> "/home/pholden/Projects/TestEdvo3/edvotek-edvocycler3/buildroot-2024.11=
-rc1/output/build/host-qt6tools-6.7.3/buildroot-build/CMakeFiles/CMakeOutpu=
t.log".
>>> make[1]: *** [package/pkg-generic.mk:279:
>>> /home/pholden/Projects/TestEdvo3/edvotek-edvocycler3/buildroot-2024.11-=
rc1/output/build/host-qt6tools-6.7.3/.stamp_configured]
>>> Error 1
>>> make: *** [Makefile:83: _all] Error 2
>>>
>>>
>>> On Fri, Jan 17, 2025 at 12:40=E2=80=AFAM Roy Kollen Svendsen <
>>> roykollensvendsen@gmail.com> wrote:
>>>
>>>> I don't understand why the build depends on what packages are installe=
d
>>>> on your Ubuntu workstation.
>>>>
>>>> Does this make sense to you?
>>>>
>>>>
>>>>
>>>>
>>>> tor. 16. jan. 2025 kl. 18:17 skrev Patricia Holden <pholden@nklabs.com
>>>> >:
>>>>
>>>>> I was able to resolve the problem by installing "clang-format".  We
>>>>> had one Ubuntu workstation that was building host-qt6tools just fine =
and
>>>>> did a comparison of packages installed.  Once I installed clang-forma=
t,
>>>>> build completed no errors and ran fine on our target system.
>>>>>
>>>>> Thanks for your assistance.
>>>>>
>>>>> On Thu, Jan 16, 2025 at 11:34=E2=80=AFAM Patricia Holden <pholden@nkl=
abs.com>
>>>>> wrote:
>>>>>
>>>>>> I attempted to install Clang, version 17 but am unable to find it.
>>>>>> Is this an experimental version of Clang?  Do you have instructions =
on how
>>>>>> to install it for Ubuntu?
>>>>>>
>>>>>> On Thu, Jan 16, 2025 at 11:29=E2=80=AFAM Patricia Holden <pholden@nk=
labs.com>
>>>>>> wrote:
>>>>>>
>>>>>>> Our defconfig is as follows:
>>>>>>>
>>>>>>> BR2_aarch64=3Dy
>>>>>>> BR2_KERNEL_HEADERS_VERSION=3Dy
>>>>>>> BR2_DEFAULT_KERNEL_VERSION=3D"6.1.80"
>>>>>>> BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=3Dy
>>>>>>> BR2_TOOLCHAIN_BUILDROOT_CXX=3Dy
>>>>>>> BR2_SHARED_STATIC_LIBS=3Dy
>>>>>>> BR2_PACKAGE_OVERRIDE_FILE=3D"$(BR2_EXTERNAL_edvo_PATH)/local.mk"
>>>>>>> BR2_TARGET_GENERIC_HOSTNAME=3D"edvocycler3"
>>>>>>> BR2_TARGET_GENERIC_ISSUE=3D"Welcome to Edvocycler3"
>>>>>>> BR2_INIT_SYSTEMD=3Dy
>>>>>>> BR2_TARGET_GENERIC_ROOT_PASSWD=3D"temp1234"
>>>>>>> BR2_SYSTEM_DHCP=3D"wlan0"
>>>>>>> BR2_SYSTEM_DEFAULT_PATH=3D"/bin:/sbin:/usr/bin:/usr/sbin"
>>>>>>>
>>>>>>> BR2_ROOTFS_OVERLAY=3D"$(BR2_EXTERNAL_edvo_PATH)/board/edvotek/rootf=
s-overlay"
>>>>>>> BR2_ROOTFS_POST_IMAGE_SCRIPT=3D"$(BR2_EXTERNAL_edvo_PATH)/board/edv=
otek/post-build.sh
>>>>>>> "
>>>>>>> BR2_LINUX_KERNEL=3Dy
>>>>>>> BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy
>>>>>>> BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"6.1.80"
>>>>>>> BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=3Dy
>>>>>>>
>>>>>>> BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=3D"$(BR2_EXTERNAL_edvo_PATH)/bo=
ard/edvotek/edvo3_defconfig"
>>>>>>> BR2_LINUX_KERNEL_DTS_SUPPORT=3Dy
>>>>>>> BR2_LINUX_KERNEL_DTB_IS_SELF_BUILT=3Dy
>>>>>>> BR2_LINUX_KERNEL_INTREE_DTS_NAME=3D"ti/k3-am623-edvocycler3.dtb"
>>>>>>> BR2_LINUX_KERNEL_DTB_KEEP_DIRNAME=3Dy
>>>>>>> BR2_LINUX_KERNEL_DTB_OVERLAY_SUPPORT=3Dy
>>>>>>>
>>>>>>> BR2_PACKAGE_BUSYBOX_CONFIG=3D"$(BR2_EXTERNAL_edvo_PATH)/board/edvot=
ek/edvo3br_busybox_defconfig"
>>>>>>> BR2_PACKAGE_FFMPEG=3Dy
>>>>>>> BR2_PACKAGE_FFMPEG_SWSCALE=3Dy
>>>>>>> BR2_PACKAGE_BZIP2=3Dy
>>>>>>> BR2_PACKAGE_GZIP=3Dy
>>>>>>> BR2_PACKAGE_XZ=3Dy
>>>>>>> BR2_PACKAGE_SPIDEV_TEST=3Dy
>>>>>>> BR2_PACKAGE_VALGRIND=3Dy
>>>>>>> BR2_PACKAGE_BINUTILS=3Dy
>>>>>>> BR2_PACKAGE_BINUTILS_TARGET=3Dy
>>>>>>> BR2_PACKAGE_LIBTOOL=3Dy
>>>>>>> BR2_PACKAGE_E2FSPROGS=3Dy
>>>>>>> BR2_PACKAGE_E2FSPROGS_RESIZE2FS=3Dy
>>>>>>> BR2_PACKAGE_DEJAVU=3Dy
>>>>>>> BR2_PACKAGE_LIBERATION=3Dy
>>>>>>> BR2_PACKAGE_HICOLOR_ICON_THEME=3Dy
>>>>>>> BR2_PACKAGE_KMSCUBE=3Dy
>>>>>>> BR2_PACKAGE_MESA3D_DEMOS=3Dy
>>>>>>> BR2_PACKAGE_MESA3D=3Dy
>>>>>>> BR2_PACKAGE_MESA3D_OSMESA_GALLIUM=3Dy
>>>>>>> BR2_PACKAGE_MESA3D_OPENGL_EGL=3Dy
>>>>>>> BR2_PACKAGE_MESA3D_OPENGL_ES=3Dy
>>>>>>> BR2_PACKAGE_QT6BASE_DEFAULT_QPA=3D"linuxfb"
>>>>>>> BR2_PACKAGE_QT6BASE_FONTCONFIG=3Dy
>>>>>>> BR2_PACKAGE_QT6BASE_HARFBUZZ=3Dy
>>>>>>> BR2_PACKAGE_QT6BASE_JPEG=3Dy
>>>>>>> BR2_PACKAGE_QT6BASE_PNG=3Dy
>>>>>>> BR2_PACKAGE_QT6BASE_SYSLOG=3Dy
>>>>>>> BR2_PACKAGE_QT6CORE5COMPAT=3Dy
>>>>>>> BR2_PACKAGE_QT6DECLARATIVE_QUICK=3Dy
>>>>>>> BR2_PACKAGE_QT6LANGUAGESERVER=3Dy
>>>>>>> BR2_PACKAGE_QT6VIRTUALKEYBOARD=3Dy
>>>>>>> BR2_PACKAGE_LINUX_FIRMWARE=3Dy
>>>>>>> BR2_PACKAGE_LINUX_FIRMWARE_TI_WL18XX=3Dy
>>>>>>> BR2_PACKAGE_18XX_TI_UTILS=3Dy
>>>>>>> BR2_PACKAGE_EVTEST=3Dy
>>>>>>> BR2_PACKAGE_I2C_TOOLS=3Dy
>>>>>>> BR2_PACKAGE_LIBMANETTE=3Dy
>>>>>>> BR2_PACKAGE_LSHW=3Dy
>>>>>>> BR2_PACKAGE_PARTED=3Dy
>>>>>>> BR2_PACKAGE_PICOCOM=3Dy
>>>>>>> BR2_PACKAGE_SPI_TOOLS=3Dy
>>>>>>> BR2_PACKAGE_STATSERIAL=3Dy
>>>>>>> BR2_PACKAGE_STM32FLASH=3Dy
>>>>>>> BR2_PACKAGE_SYSSTAT=3Dy
>>>>>>> BR2_PACKAGE_TI_UIM=3Dy
>>>>>>> BR2_PACKAGE_TI_UTILS=3Dy
>>>>>>> BR2_PACKAGE_ENSCRIPT=3Dy
>>>>>>> BR2_PACKAGE_LUA=3Dy
>>>>>>> BR2_PACKAGE_LSQLITE3=3Dy
>>>>>>> BR2_PACKAGE_LZLIB=3Dy
>>>>>>> BR2_PACKAGE_PYTHON3=3Dy
>>>>>>> BR2_PACKAGE_PYTHON3_SQLITE=3Dy
>>>>>>> BR2_PACKAGE_PYTHON_CFFI=3Dy
>>>>>>> BR2_PACKAGE_PYTHON_CYCLER=3Dy
>>>>>>> BR2_PACKAGE_PYTHON_FLASK_CORS=3Dy
>>>>>>> BR2_PACKAGE_PYTHON_JSONMODELS=3Dy
>>>>>>> BR2_PACKAGE_PYTHON_JSONSCHEMA=3Dy
>>>>>>> BR2_PACKAGE_PYTHON_KIWISOLVER=3Dy
>>>>>>> BR2_PACKAGE_PYTHON_LIBEVDEV=3Dy
>>>>>>> BR2_PACKAGE_PYTHON_MSGPACK=3Dy
>>>>>>> BR2_PACKAGE_PYTHON_NUMPY=3Dy
>>>>>>> BR2_PACKAGE_PYTHON_PACKAGING=3Dy
>>>>>>> BR2_PACKAGE_PYTHON_PILLOW=3Dy
>>>>>>> BR2_PACKAGE_PYTHON_PIP=3Dy
>>>>>>> BR2_PACKAGE_PYTHON_PYELFTOOLS=3Dy
>>>>>>> BR2_PACKAGE_PYTHON_PYPARSING=3Dy
>>>>>>> BR2_PACKAGE_PYTHON_REGEX=3Dy
>>>>>>> BR2_PACKAGE_PYTHON_SIMPLEJSON=3Dy
>>>>>>> BR2_PACKAGE_PYTHON_SPIDEV=3Dy
>>>>>>> BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS=3Dy
>>>>>>> BR2_PACKAGE_PYTHON_WRAPT=3Dy
>>>>>>> BR2_PACKAGE_PYTHON_ZOPE_INTERFACE=3Dy
>>>>>>> BR2_PACKAGE_CA_CERTIFICATES=3Dy
>>>>>>> BR2_PACKAGE_LIBGCRYPT=3Dy
>>>>>>> BR2_PACKAGE_LIBNSS=3Dy
>>>>>>> BR2_PACKAGE_LIBSECRET=3Dy
>>>>>>> BR2_PACKAGE_LEVELDB=3Dy
>>>>>>> BR2_PACKAGE_CAIRO_TEE=3Dy
>>>>>>> BR2_PACKAGE_CAIROMM=3Dy
>>>>>>> BR2_PACKAGE_CAIROMM1_14=3Dy
>>>>>>> BR2_PACKAGE_GD=3Dy
>>>>>>> BR2_PACKAGE_GIFLIB=3Dy
>>>>>>> BR2_PACKAGE_KMSXX=3Dy
>>>>>>> BR2_PACKAGE_KMSXX_INSTALL_TESTS=3Dy
>>>>>>> BR2_PACKAGE_LIBGTK3=3Dy
>>>>>>> BR2_PACKAGE_LIBJXL=3Dy
>>>>>>> BR2_PACKAGE_LIBSVG_CAIRO=3Dy
>>>>>>> BR2_PACKAGE_OPENJPEG=3Dy
>>>>>>> BR2_PACKAGE_POPPLER=3Dy
>>>>>>> BR2_PACKAGE_WOFF2=3Dy
>>>>>>> BR2_PACKAGE_LIBCEC=3Dy
>>>>>>> BR2_PACKAGE_LIBGPIOD=3Dy
>>>>>>> BR2_PACKAGE_LIBGPIOD_TOOLS=3Dy
>>>>>>> BR2_PACKAGE_LIBINPUT=3Dy
>>>>>>> BR2_PACKAGE_LIBPCIACCESS=3Dy
>>>>>>> BR2_PACKAGE_LIBSERIAL=3Dy
>>>>>>> BR2_PACKAGE_LIBSERIALPORT=3Dy
>>>>>>> BR2_PACKAGE_LIBUSB=3Dy
>>>>>>> BR2_PACKAGE_TSLIB=3Dy
>>>>>>> BR2_PACKAGE_BOOTSTRAP=3Dy
>>>>>>> BR2_PACKAGE_CHARTJS=3Dy
>>>>>>> BR2_PACKAGE_JSON_JAVASCRIPT=3Dy
>>>>>>> BR2_PACKAGE_VUEJS=3Dy
>>>>>>> BR2_PACKAGE_CJSON=3Dy
>>>>>>> BR2_PACKAGE_CJSON_UTILS=3Dy
>>>>>>> BR2_PACKAGE_JANSSON=3Dy
>>>>>>> BR2_PACKAGE_JSON_C=3Dy
>>>>>>> BR2_PACKAGE_JSON_FOR_MODERN_CPP=3Dy
>>>>>>> BR2_PACKAGE_JSON_GLIB=3Dy
>>>>>>> BR2_PACKAGE_JSONCPP=3Dy
>>>>>>> BR2_PACKAGE_LIBJSON=3Dy
>>>>>>> BR2_PACKAGE_LIBUCL=3Dy
>>>>>>> BR2_PACKAGE_LIBXMLPP=3Dy
>>>>>>> BR2_PACKAGE_LIBXSLT=3Dy
>>>>>>> BR2_PACKAGE_LIBYAML=3Dy
>>>>>>> BR2_PACKAGE_YAML_CPP=3Dy
>>>>>>> BR2_PACKAGE_LIBVPX=3Dy
>>>>>>> BR2_PACKAGE_GEOIP=3Dy
>>>>>>> BR2_PACKAGE_LIBCURL=3Dy
>>>>>>> BR2_PACKAGE_LIBIDN2=3Dy
>>>>>>> BR2_PACKAGE_LIBNDP=3Dy
>>>>>>> BR2_PACKAGE_LIBPCAP=3Dy
>>>>>>> BR2_PACKAGE_LIBSOUP3=3Dy
>>>>>>> BR2_PACKAGE_LIBSOUP3_SSL=3Dy
>>>>>>> BR2_PACKAGE_LIBVNCSERVER=3Dy
>>>>>>> BR2_PACKAGE_BOOST_JSON=3Dy
>>>>>>> BR2_PACKAGE_GLM=3Dy
>>>>>>> BR2_PACKAGE_GOBJECT_INTROSPECTION=3Dy
>>>>>>> BR2_PACKAGE_GTEST=3Dy
>>>>>>> BR2_PACKAGE_LIBATOMIC_OPS=3Dy
>>>>>>> BR2_PACKAGE_LIBSECCOMP=3Dy
>>>>>>> BR2_PACKAGE_LIBSOLV=3Dy
>>>>>>> BR2_PACKAGE_LIBUV=3Dy
>>>>>>> BR2_PACKAGE_LINUX_PAM=3Dy
>>>>>>> BR2_PACKAGE_ORC=3Dy
>>>>>>> BR2_PACKAGE_QHULL=3Dy
>>>>>>> BR2_PACKAGE_ENCHANT=3Dy
>>>>>>> BR2_PACKAGE_ICU=3Dy
>>>>>>> BR2_PACKAGE_NCURSES_WCHAR=3Dy
>>>>>>> BR2_PACKAGE_UTF8PROC=3Dy
>>>>>>> BR2_PACKAGE_SHARED_MIME_INFO=3Dy
>>>>>>> BR2_PACKAGE_APACHE=3Dy
>>>>>>> BR2_PACKAGE_AVAHI=3Dy
>>>>>>> BR2_PACKAGE_DHCP=3Dy
>>>>>>> BR2_PACKAGE_DHCP_CLIENT=3Dy
>>>>>>> BR2_PACKAGE_DHCPCD=3Dy
>>>>>>> BR2_PACKAGE_IFUPDOWN=3Dy
>>>>>>> BR2_PACKAGE_IPROUTE2=3Dy
>>>>>>> BR2_PACKAGE_IPUTILS=3Dy
>>>>>>> BR2_PACKAGE_IW=3Dy
>>>>>>> BR2_PACKAGE_IWD=3Dy
>>>>>>> BR2_PACKAGE_NET_TOOLS=3Dy
>>>>>>> BR2_PACKAGE_NTP=3Dy
>>>>>>> BR2_PACKAGE_NTP_NTPDATE=3Dy
>>>>>>> BR2_PACKAGE_NTP_NTPTIME=3Dy
>>>>>>> BR2_PACKAGE_OPENSSH=3Dy
>>>>>>> BR2_PACKAGE_PPPD=3Dy
>>>>>>> BR2_PACKAGE_RSYNC=3Dy
>>>>>>> BR2_PACKAGE_TFTPD=3Dy
>>>>>>> BR2_PACKAGE_WIRELESS_REGDB=3Dy
>>>>>>> BR2_PACKAGE_WIRELESS_TOOLS=3Dy
>>>>>>> BR2_PACKAGE_WPA_SUPPLICANT=3Dy
>>>>>>> BR2_PACKAGE_WPA_SUPPLICANT_WEXT=3Dy
>>>>>>> BR2_PACKAGE_WPA_SUPPLICANT_WIRED=3Dy
>>>>>>> BR2_PACKAGE_WPA_SUPPLICANT_IBSS_RSN=3Dy
>>>>>>> BR2_PACKAGE_WPA_SUPPLICANT_AP_SUPPORT=3Dy
>>>>>>> BR2_PACKAGE_WPA_SUPPLICANT_WIFI_DISPLAY=3Dy
>>>>>>> BR2_PACKAGE_WPA_SUPPLICANT_MESH_NETWORKING=3Dy
>>>>>>> BR2_PACKAGE_WPA_SUPPLICANT_AUTOSCAN=3Dy
>>>>>>> BR2_PACKAGE_WPA_SUPPLICANT_DEBUG_SYSLOG=3Dy
>>>>>>> BR2_PACKAGE_WPA_SUPPLICANT_WPS=3Dy
>>>>>>> BR2_PACKAGE_WPA_SUPPLICANT_WPA3=3Dy
>>>>>>> BR2_PACKAGE_WPA_SUPPLICANT_CLI=3Dy
>>>>>>> BR2_PACKAGE_WPA_SUPPLICANT_WPA_CLIENT_SO=3Dy
>>>>>>> BR2_PACKAGE_WPA_SUPPLICANT_PASSPHRASE=3Dy
>>>>>>> BR2_PACKAGE_WPA_SUPPLICANT_DBUS=3Dy
>>>>>>> BR2_PACKAGE_WPAN_TOOLS=3Dy
>>>>>>> BR2_PACKAGE_XINETD=3Dy
>>>>>>> BR2_PACKAGE_XTABLES_ADDONS=3Dy
>>>>>>> BR2_PACKAGE_BASH=3Dy
>>>>>>> BR2_PACKAGE_SUDO=3Dy
>>>>>>> BR2_PACKAGE_BUBBLEWRAP=3Dy
>>>>>>> BR2_PACKAGE_HTOP=3Dy
>>>>>>> BR2_PACKAGE_PROCPS_NG=3Dy
>>>>>>> BR2_PACKAGE_SEATD=3Dy
>>>>>>> BR2_PACKAGE_SEATD_DAEMON=3Dy
>>>>>>> BR2_PACKAGE_SYSTEMD_RFKILL=3Dy
>>>>>>> BR2_PACKAGE_UTIL_LINUX_BINARIES=3Dy
>>>>>>> BR2_PACKAGE_UTIL_LINUX_KILL=3Dy
>>>>>>> BR2_PACKAGE_UTIL_LINUX_RFKILL=3Dy
>>>>>>> BR2_PACKAGE_XDG_DBUS_PROXY=3Dy
>>>>>>> BR2_PACKAGE_NANO=3Dy
>>>>>>> BR2_TARGET_ROOTFS_TAR_GZIP=3Dy
>>>>>>> BR2_PACKAGE_HOST_CMAKE=3Dy
>>>>>>> BR2_PACKAGE_HOST_DOSFSTOOLS=3Dy
>>>>>>> BR2_PACKAGE_HOST_DTC=3Dy
>>>>>>> BR2_PACKAGE_HOST_E2FSPROGS=3Dy
>>>>>>> BR2_PACKAGE_HOST_GENIMAGE=3Dy
>>>>>>> BR2_PACKAGE_HOST_IMAGEMAGICK=3Dy
>>>>>>> BR2_PACKAGE_HOST_IMAGEMAGICK_XML=3Dy
>>>>>>> BR2_PACKAGE_HOST_KMOD_XZ=3Dy
>>>>>>> BR2_PACKAGE_HOST_MESON_TOOLS=3Dy
>>>>>>> BR2_PACKAGE_HOST_MTOOLS=3Dy
>>>>>>> BR2_PACKAGE_HOST_PYTHON_CYTHON=3Dy
>>>>>>> BR2_PACKAGE_HOST_PYTHON_GREENLET=3Dy
>>>>>>> BR2_PACKAGE_HOST_PYTHON_LXML=3Dy
>>>>>>> BR2_PACKAGE_HOST_PYTHON_PYYAML=3Dy
>>>>>>> BR2_PACKAGE_HOST_PYTHON_XLRD=3Dy
>>>>>>> BR2_PACKAGE_HOST_PYTHON3=3Dy
>>>>>>> BR2_PACKAGE_HOST_PYTHON3_BZIP2=3Dy
>>>>>>> BR2_PACKAGE_HOST_PYTHON3_XZ=3Dy
>>>>>>> BR2_PACKAGE_HOST_PYTHON3_SSL=3Dy
>>>>>>> BR2_PACKAGE_HOST_QT6TOOLS=3Dy
>>>>>>> BR2_PACKAGE_HOST_QT6TOOLS_LINGUIST_TOOLS=3Dy
>>>>>>>
>>>>>>> I applied the patch to qt6tools.mk and still getting the same
>>>>>>> error.  I see in output that the compile flag is present to disable=
 Clang.
>>>>>>>
>>>>>>> Output:
>>>>>>> >>> host-qt6tools 6.7.3 Extracting
>>>>>>> xzcat
>>>>>>> /home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroo=
t-2024.11-rc1/dl/qt6tools/qttools-everywhere-src-6.7.3.tar.xz
>>>>>>> |
>>>>>>> /home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroo=
t-2024.11-rc1/output/host/bin/tar
>>>>>>> --strip-components=3D1 -C
>>>>>>> /home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroo=
t-2024.11-rc1/output/build/host-qt6tools-6.7.3
>>>>>>>   -xf -
>>>>>>> >>> host-qt6tools 6.7.3 Patching
>>>>>>> >>> host-qt6tools 6.7.3 Configuring
>>>>>>> (mkdir -p
>>>>>>> /home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroo=
t-2024.11-rc1/output/build/host-qt6tools-6.7.3//buildroot-build
>>>>>>> && cd
>>>>>>> /home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroo=
t-2024.11-rc1/output/build/host-qt6tools-6.7.3//buildroot-build
>>>>>>> && rm -f CMakeCache.txt &&
>>>>>>> PATH=3D"/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/=
buildroot-2024.11-rc1/output/host/bin:/home/pholden/Projects/Edvotek0107202=
5/edvotek-edvocycler3/buildroot-2024.11-rc1/output/host/sbin:/home/pholden/=
.pyenv/shims:/home/pholden/.pyenv/bin:/usr/local/sbin:/usr/local/bin:/usr/s=
bin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/snap/bin"
>>>>>>> PKG_CONFIG=3D"/home/pholden/Projects/Edvotek01072025/edvotek-edvocy=
cler3/buildroot-2024.11-rc1/output/host/bin/pkg-config"
>>>>>>> PKG_CONFIG_SYSROOT_DIR=3D"/"
>>>>>>> PKG_CONFIG_LIBDIR=3D"/home/pholden/Projects/Edvotek01072025/edvotek=
-edvocycler3/buildroot-2024.11-rc1/output/host/lib/pkgconfig:/home/pholden/=
Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.11-rc1/output/h=
ost/share/pkgconfig"
>>>>>>> PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=3D1 PKG_CONFIG_ALLOW_SYSTEM_LIBS=3D1
>>>>>>>  /usr/bin/cmake
>>>>>>> /home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroo=
t-2024.11-rc1/output/build/host-qt6tools-6.7.3/
>>>>>>> -G"Ninja"
>>>>>>> -DCMAKE_MAKE_PROGRAM=3D"/home/pholden/Projects/Edvotek01072025/edvo=
tek-edvocycler3/buildroot-2024.11-rc1/output/host/bin/ninja"
>>>>>>> -DCMAKE_INSTALL_SO_NO_EXE=3D0
>>>>>>> -DCMAKE_FIND_ROOT_PATH=3D"/home/pholden/Projects/Edvotek01072025/ed=
votek-edvocycler3/buildroot-2024.11-rc1/output/host"
>>>>>>> -DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM=3D"BOTH"
>>>>>>> -DCMAKE_FIND_ROOT_PATH_MODE_LIBRARY=3D"BOTH"
>>>>>>> -DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE=3D"BOTH"
>>>>>>> -DCMAKE_INSTALL_PREFIX=3D"/home/pholden/Projects/Edvotek01072025/ed=
votek-edvocycler3/buildroot-2024.11-rc1/output/host"
>>>>>>> -DCMAKE_C_FLAGS=3D"-O2
>>>>>>> -I/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildr=
oot-2024.11-rc1/output/host/include"
>>>>>>> -DCMAKE_CXX_FLAGS=3D"-O2
>>>>>>> -I/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildr=
oot-2024.11-rc1/output/host/include"
>>>>>>> -DCMAKE_EXE_LINKER_FLAGS=3D"-L/home/pholden/Projects/Edvotek0107202=
5/edvotek-edvocycler3/buildroot-2024.11-rc1/output/host/lib
>>>>>>> -Wl,-rpath,/home/pholden/Projects/Edvotek01072025/edvotek-edvocycle=
r3/buildroot-2024.11-rc1/output/host/lib"
>>>>>>> -DCMAKE_SHARED_LINKER_FLAGS=3D"-L/home/pholden/Projects/Edvotek0107=
2025/edvotek-edvocycler3/buildroot-2024.11-rc1/output/host/lib
>>>>>>> -Wl,-rpath,/home/pholden/Projects/Edvotek01072025/edvotek-edvocycle=
r3/buildroot-2024.11-rc1/output/host/lib"
>>>>>>> -DCMAKE_C_COMPILER=3D"/usr/bin/gcc" -DCMAKE_CXX_COMPILER=3D"/usr/bi=
n/g++"
>>>>>>>  -DCMAKE_C_COMPILER_LAUNCHER=3D"" -DCMAKE_CXX_COMPILER_LAUNCHER=3D"=
"
>>>>>>>  -DCMAKE_COLOR_MAKEFILE=3DOFF -DBUILD_DOC=3DOFF -DBUILD_DOCS=3DOFF
>>>>>>> -DBUILD_EXAMPLE=3DOFF -DBUILD_EXAMPLES=3DOFF -DBUILD_TEST=3DOFF -DB=
UILD_TESTS=3DOFF
>>>>>>> -DBUILD_TESTING=3DOFF -DBUILD_SHARED_LIBS=3DON  -DFEATURE_clang=3DO=
FF
>>>>>>> -DQT_BUILD_EXAMPLES=3DOFF -DQT_BUILD_TESTS=3DOFF -DFEATURE_linguist=
=3DOFF )
>>>>>>> -- The CXX compiler identification is GNU 11.4.0
>>>>>>> -- The C compiler identification is GNU 11.4.0
>>>>>>> -- Detecting CXX compiler ABI info
>>>>>>> -- Detecting CXX compiler ABI info - done
>>>>>>> -- Check for working CXX compiler: /usr/bin/g++ - skipped
>>>>>>> -- Detecting CXX compile features
>>>>>>> -- Detecting CXX compile features - done
>>>>>>> -- Detecting C compiler ABI info
>>>>>>> -- Detecting C compiler ABI info - done
>>>>>>> -- Check for working C compiler: /usr/bin/gcc - skipped
>>>>>>> -- Detecting C compile features
>>>>>>> -- Detecting C compile features - done
>>>>>>> -- Looking for pthread.h
>>>>>>> -- Looking for pthread.h - found
>>>>>>> -- Performing Test CMAKE_HAVE_LIBC_PTHREAD
>>>>>>> -- Performing Test CMAKE_HAVE_LIBC_PTHREAD - Success
>>>>>>> -- Found Threads: TRUE
>>>>>>> -- Performing Test HAVE_STDATOMIC
>>>>>>> -- Performing Test HAVE_STDATOMIC - Success
>>>>>>> -- Found WrapAtomic: TRUE
>>>>>>> -- Force setting build type to 'Release'.
>>>>>>> CMake Error at
>>>>>>> /usr/lib/llvm-14/lib/cmake/clang/ClangTargets.cmake:750 (message):
>>>>>>>   The imported target "clangBasic" references the file
>>>>>>>
>>>>>>>      "/usr/lib/llvm-14/lib/libclangBasic.a"
>>>>>>>
>>>>>>>   but this file does not exist.  Possible reasons include:
>>>>>>>
>>>>>>>   * The file was deleted, renamed, or moved to another location.
>>>>>>>
>>>>>>>   * An install or uninstall procedure did not complete successfully=
.
>>>>>>>
>>>>>>>   * The installation package was faulty and contained
>>>>>>>
>>>>>>>      "/usr/lib/llvm-14/lib/cmake/clang/ClangTargets.cmake"
>>>>>>>
>>>>>>>   but not all the files it references.
>>>>>>>
>>>>>>> Call Stack (most recent call first):
>>>>>>>   /usr/lib/cmake/clang-14/ClangConfig.cmake:19 (include)
>>>>>>>   cmake/FindWrapLibClang.cmake:17 (find_package)
>>>>>>>
>>>>>>> /home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroo=
t-2024.11-rc1/output/build/host-qt6base-6.7.3/cmake/QtFindPackageHelpers.cm=
ake:156
>>>>>>> (find_package)
>>>>>>>   configure.cmake:20 (qt_find_package)
>>>>>>>
>>>>>>> /home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroo=
t-2024.11-rc1/output/build/host-qt6base-6.7.3/cmake/QtFeature.cmake:678
>>>>>>> (include)
>>>>>>>   src/CMakeLists.txt:18 (qt_feature_evaluate_features)
>>>>>>>
>>>>>>>
>>>>>>> -- Configuring incomplete, errors occurred!
>>>>>>> See also
>>>>>>> "/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildro=
ot-2024.11-rc1/output/build/host-qt6tools-6.7.3/buildroot-build/CMakeFiles/=
CMakeOutput.log".
>>>>>>> make[1]: *** [package/pkg-generic.mk:279:
>>>>>>> /home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroo=
t-2024.11-rc1/output/build/host-qt6tools-6.7.3/.stamp_configured]
>>>>>>> Error 1
>>>>>>> make: *** [Makefile:83: _all] Error 2
>>>>>>>
>>>>>>> On Thu, Jan 16, 2025 at 8:00=E2=80=AFAM Roy Kollen Svendsen <
>>>>>>> roykollensvendsen@gmail.com> wrote:
>>>>>>>
>>>>>>>> Hi,
>>>>>>>>
>>>>>>>> Since I'm the root cause of the problem I sent you a patch here:
>>>>>>>>
>>>>>>>>
>>>>>>>> https://patchwork.ozlabs.org/project/buildroot/patch/2025011612553=
7.531666-1-roykollensvendsen@gmail.com/
>>>>>>>>
>>>>>>>> Please test if this fixes your problem add you Tested-By etc.
>>>>>>>>
>>>>>>>> Roy
>>>>>>>>
>>>>>>>> tor. 16. jan. 2025 kl. 13:17 skrev Roy Kollen Svendsen <
>>>>>>>> roykollensvendsen@gmail.com>:
>>>>>>>>
>>>>>>>>>
>>>>>>>>> qttools require at least clang 17. So we should not try to enable
>>>>>>>>> support unless suitable version is available.
>>>>>>>>>
>>>>>>>>> So we should set -DFEATURE_clang=3DOFF
>>>>>>>>>
>>>>>>>>> -Roy
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> tor. 16. jan. 2025 kl. 11:23 skrev Roy Kollen Svendsen <
>>>>>>>>> roykollensvendsen@gmail.com>:
>>>>>>>>>
>>>>>>>>>> Hi Patricia,
>>>>>>>>>>
>>>>>>>>>> I'll take look at this as soon as I get a chance. Can you send m=
e
>>>>>>>>>> a minimal config that recreate the problem?
>>>>>>>>>>
>>>>>>>>>> Thanks in advance,
>>>>>>>>>>
>>>>>>>>>> Roy
>>>>>>>>>>
>>>>>>>>>> tir. 14. jan. 2025 kl. 20:16 skrev Patricia Holden <
>>>>>>>>>> pholden@nklabs.com>:
>>>>>>>>>>
>>>>>>>>>>> We are using Buildroot version "2024.11-rc1.  We just turned on
>>>>>>>>>>> "Host Utilities->host qt6 tools->host linguistic tools".  I run=
 make, get
>>>>>>>>>>> the error and output below.  Is there a fix for this?  Am I mis=
sing a
>>>>>>>>>>> dependency I need to install on my host PC?
>>>>>>>>>>>
>>>>>>>>>>> Thanks!
>>>>>>>>>>> Pat
>>>>>>>>>>>
>>>>>>>>>>> make BR2_EXTERNAL=3D../edvo_br host-qt6tools
>>>>>>>>>>> >>> host-qt6tools 6.7.3 Configuring
>>>>>>>>>>> (mkdir -p
>>>>>>>>>>> /home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buil=
droot-2024.11-rc1/output/build/host-qt6tools-6.7.3//buildroot-build
>>>>>>>>>>> && cd
>>>>>>>>>>> /home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buil=
droot-2024.11-rc1/output/build/host-qt6tools-6.7.3//buildroot-build
>>>>>>>>>>> && rm -f CMakeCache.txt &&
>>>>>>>>>>> PATH=3D"/home/pholden/Projects/Edvotek01072025/edvotek-edvocycl=
er3/buildroot-2024.11-rc1/output/host/bin:/home/pholden/Projects/Edvotek010=
72025/edvotek-edvocycler3/buildroot-2024.11-rc1/output/host/sbin:/home/phol=
den/.pyenv/shims:/home/pholden/.pyenv/bin:/usr/local/sbin:/usr/local/bin:/u=
sr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/snap/bin=
"
>>>>>>>>>>> PKG_CONFIG=3D"/home/pholden/Projects/Edvotek01072025/edvotek-ed=
vocycler3/buildroot-2024.11-rc1/output/host/bin/pkg-config"
>>>>>>>>>>> PKG_CONFIG_SYSROOT_DIR=3D"/"
>>>>>>>>>>> PKG_CONFIG_LIBDIR=3D"/home/pholden/Projects/Edvotek01072025/edv=
otek-edvocycler3/buildroot-2024.11-rc1/output/host/lib/pkgconfig:/home/phol=
den/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.11-rc1/outp=
ut/host/share/pkgconfig"
>>>>>>>>>>> PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=3D1 PKG_CONFIG_ALLOW_SYSTEM_LIBS=
=3D1
>>>>>>>>>>>  /usr/bin/cmake
>>>>>>>>>>> /home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buil=
droot-2024.11-rc1/output/build/host-qt6tools-6.7.3/
>>>>>>>>>>> -G"Ninja"
>>>>>>>>>>> -DCMAKE_MAKE_PROGRAM=3D"/home/pholden/Projects/Edvotek01072025/=
edvotek-edvocycler3/buildroot-2024.11-rc1/output/host/bin/ninja"
>>>>>>>>>>> -DCMAKE_INSTALL_SO_NO_EXE=3D0
>>>>>>>>>>> -DCMAKE_FIND_ROOT_PATH=3D"/home/pholden/Projects/Edvotek0107202=
5/edvotek-edvocycler3/buildroot-2024.11-rc1/output/host"
>>>>>>>>>>> -DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM=3D"BOTH"
>>>>>>>>>>> -DCMAKE_FIND_ROOT_PATH_MODE_LIBRARY=3D"BOTH"
>>>>>>>>>>> -DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE=3D"BOTH"
>>>>>>>>>>> -DCMAKE_INSTALL_PREFIX=3D"/home/pholden/Projects/Edvotek0107202=
5/edvotek-edvocycler3/buildroot-2024.11-rc1/output/host"
>>>>>>>>>>> -DCMAKE_C_FLAGS=3D"-O2
>>>>>>>>>>> -I/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/bu=
ildroot-2024.11-rc1/output/host/include"
>>>>>>>>>>> -DCMAKE_CXX_FLAGS=3D"-O2
>>>>>>>>>>> -I/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/bu=
ildroot-2024.11-rc1/output/host/include"
>>>>>>>>>>> -DCMAKE_EXE_LINKER_FLAGS=3D"-L/home/pholden/Projects/Edvotek010=
72025/edvotek-edvocycler3/buildroot-2024.11-rc1/output/host/lib
>>>>>>>>>>> -Wl,-rpath,/home/pholden/Projects/Edvotek01072025/edvotek-edvoc=
ycler3/buildroot-2024.11-rc1/output/host/lib"
>>>>>>>>>>> -DCMAKE_SHARED_LINKER_FLAGS=3D"-L/home/pholden/Projects/Edvotek=
01072025/edvotek-edvocycler3/buildroot-2024.11-rc1/output/host/lib
>>>>>>>>>>> -Wl,-rpath,/home/pholden/Projects/Edvotek01072025/edvotek-edvoc=
ycler3/buildroot-2024.11-rc1/output/host/lib"
>>>>>>>>>>> -DCMAKE_C_COMPILER=3D"/usr/bin/gcc" -DCMAKE_CXX_COMPILER=3D"/us=
r/bin/g++"
>>>>>>>>>>>  -DCMAKE_C_COMPILER_LAUNCHER=3D"" -DCMAKE_CXX_COMPILER_LAUNCHER=
=3D""
>>>>>>>>>>>  -DCMAKE_COLOR_MAKEFILE=3DOFF -DBUILD_DOC=3DOFF -DBUILD_DOCS=3D=
OFF
>>>>>>>>>>> -DBUILD_EXAMPLE=3DOFF -DBUILD_EXAMPLES=3DOFF -DBUILD_TEST=3DOFF=
 -DBUILD_TESTS=3DOFF
>>>>>>>>>>> -DBUILD_TESTING=3DOFF -DBUILD_SHARED_LIBS=3DON  -DQT_BUILD_EXAM=
PLES=3DOFF
>>>>>>>>>>> -DQT_BUILD_TESTS=3DOFF -DFEATURE_linguist=3DON )
>>>>>>>>>>> -- The CXX compiler identification is GNU 11.4.0
>>>>>>>>>>> -- The C compiler identification is GNU 11.4.0
>>>>>>>>>>> -- Detecting CXX compiler ABI info
>>>>>>>>>>> -- Detecting CXX compiler ABI info - done
>>>>>>>>>>> -- Check for working CXX compiler: /usr/bin/g++ - skipped
>>>>>>>>>>> -- Detecting CXX compile features
>>>>>>>>>>> -- Detecting CXX compile features - done
>>>>>>>>>>> -- Detecting C compiler ABI info
>>>>>>>>>>> -- Detecting C compiler ABI info - done
>>>>>>>>>>> -- Check for working C compiler: /usr/bin/gcc - skipped
>>>>>>>>>>> -- Detecting C compile features
>>>>>>>>>>> -- Detecting C compile features - done
>>>>>>>>>>> -- Looking for pthread.h
>>>>>>>>>>> -- Looking for pthread.h - found
>>>>>>>>>>> -- Performing Test CMAKE_HAVE_LIBC_PTHREAD
>>>>>>>>>>> -- Performing Test CMAKE_HAVE_LIBC_PTHREAD - Success
>>>>>>>>>>> -- Found Threads: TRUE
>>>>>>>>>>> -- Performing Test HAVE_STDATOMIC
>>>>>>>>>>> -- Performing Test HAVE_STDATOMIC - Success
>>>>>>>>>>> -- Found WrapAtomic: TRUE
>>>>>>>>>>> -- Force setting build type to 'Release'.
>>>>>>>>>>> CMake Error at
>>>>>>>>>>> /usr/lib/llvm-14/lib/cmake/clang/ClangTargets.cmake:750 (messag=
e):
>>>>>>>>>>>   The imported target "clangBasic" references the file
>>>>>>>>>>>
>>>>>>>>>>>      "/usr/lib/llvm-14/lib/libclangBasic.a"
>>>>>>>>>>>
>>>>>>>>>>>   but this file does not exist.  Possible reasons include:
>>>>>>>>>>>
>>>>>>>>>>>   * The file was deleted, renamed, or moved to another location=
.
>>>>>>>>>>>
>>>>>>>>>>>   * An install or uninstall procedure did not complete
>>>>>>>>>>> successfully.
>>>>>>>>>>>
>>>>>>>>>>>   * The installation package was faulty and contained
>>>>>>>>>>>
>>>>>>>>>>>      "/usr/lib/llvm-14/lib/cmake/clang/ClangTargets.cmake"
>>>>>>>>>>>
>>>>>>>>>>>   but not all the files it references.
>>>>>>>>>>>
>>>>>>>>>>> Call Stack (most recent call first):
>>>>>>>>>>>   /usr/lib/cmake/clang-14/ClangConfig.cmake:19 (include)
>>>>>>>>>>>   cmake/FindWrapLibClang.cmake:17 (find_package)
>>>>>>>>>>>
>>>>>>>>>>> /home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buil=
droot-2024.11-rc1/output/build/host-qt6base-6.7.3/cmake/QtFindPackageHelper=
s.cmake:156
>>>>>>>>>>> (find_package)
>>>>>>>>>>>   configure.cmake:20 (qt_find_package)
>>>>>>>>>>>
>>>>>>>>>>> /home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buil=
droot-2024.11-rc1/output/build/host-qt6base-6.7.3/cmake/QtFeature.cmake:678
>>>>>>>>>>> (include)
>>>>>>>>>>>   src/CMakeLists.txt:18 (qt_feature_evaluate_features)
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> -- Configuring incomplete, errors occurred!
>>>>>>>>>>> See also
>>>>>>>>>>> "/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/bui=
ldroot-2024.11-rc1/output/build/host-qt6tools-6.7.3/buildroot-build/CMakeFi=
les/CMakeOutput.log".
>>>>>>>>>>> make[1]: *** [package/pkg-generic.mk:279:
>>>>>>>>>>> /home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buil=
droot-2024.11-rc1/output/build/host-qt6tools-6.7.3/.stamp_configured]
>>>>>>>>>>> Error 1
>>>>>>>>>>> make: *** [Makefile:83: _all] Error 2
>>>>>>>>>>> _______________________________________________
>>>>>>>>>>> buildroot mailing list
>>>>>>>>>>> buildroot@buildroot.org
>>>>>>>>>>> https://lists.buildroot.org/mailman/listinfo/buildroot
>>>>>>>>>>>
>>>>>>>>>>

--0000000000009ab081062bea700d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I did a search on my buildroot directory for PKG_CONFIG_SY=
SROOT_DIR.=C2=A0 I found it correctly=C2=A0set to &quot;/home/pholden/Proje=
cts/Edvotek01072025/edvotek-edvocycler3/buildroot-20<br>24.11-rc1/output/ho=
st/aarch64-buildroot-linux-gnu/sysroot&quot; for other host packages that w=
ere built.=C2=A0 Looking at their mk file to see if qt6tools=C2=A0missed so=
mething for HOST config options.</div><br><div class=3D"gmail_quote gmail_q=
uote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jan 17, 2025 =
at 12:34=E2=80=AFPM Patricia Holden &lt;<a href=3D"mailto:pholden@nklabs.co=
m">pholden@nklabs.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex"><div dir=3D"ltr">That&#39;s definitely suspicious.=C2=
=A0 Does QT6 tools package need a prefix added to direct to target-dir?</di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On F=
ri, Jan 17, 2025 at 12:14=E2=80=AFPM Roy Kollen Svendsen &lt;<a href=3D"mai=
lto:roykollensvendsen@gmail.com" target=3D"_blank">roykollensvendsen@gmail.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"><p dir=3D"ltr">I noticed this in the error log: PKG_CONFIG_SYSROOT_DIR=
=3D&quot;/&quot;. </p>
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">fre. 1=
7. jan. 2025, 17:26 skrev Patricia Holden &lt;<a href=3D"mailto:pholden@nkl=
abs.com" target=3D"_blank">pholden@nklabs.com</a>&gt;:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">No, it does not mak=
e much sense to me.=C2=A0 Here&#39;s another clue:=C2=A0 I have 2 workspace=
s on my system.=C2=A0 One workspace now seems to work, the other one I did =
a clean build last night and it failed in exactly the same location (same d=
efconfig).<div><br></div><div>=C2=A0make BR2_EXTERNAL=3D../edvo_br<br>qttoo=
ls-everywhere-src-6.7.3.tar.xz: OK (sha256: f03bb7df619cd9ac9dba110e30b7bca=
b5dd88eb8bdc9cc752563b4367233203f)<br>&gt;&gt;&gt; host-qt6tools 6.7.3 Extr=
acting<br>xzcat /home/pholden/Projects/TestEdvo3/edvotek-edvocycler3/buildr=
oot-2024.11-rc1/dl/qt6tools/qttools-everywhere-src-6.7.3.tar.xz | /home/pho=
lden/Projects/TestEdvo3/edvotek-edvocycler3/buildroot-2024.11-rc1/output/ho=
st/bin/tar --strip-components=3D1 -C /home/pholden/Projects/TestEdvo3/edvot=
ek-edvocycler3/buildroot-2024.11-rc1/output/build/host-qt6tools-6.7.3 =C2=
=A0 -xf -<br>&gt;&gt;&gt; host-qt6tools 6.7.3 Patching<br>&gt;&gt;&gt; host=
-qt6tools 6.7.3 Configuring<br>(mkdir -p /home/pholden/Projects/TestEdvo3/e=
dvotek-edvocycler3/buildroot-2024.11-rc1/output/build/host-qt6tools-6.7.3//=
buildroot-build &amp;&amp; cd /home/pholden/Projects/TestEdvo3/edvotek-edvo=
cycler3/buildroot-2024.11-rc1/output/build/host-qt6tools-6.7.3//buildroot-b=
uild &amp;&amp; rm -f CMakeCache.txt &amp;&amp; PATH=3D&quot;/home/pholden/=
Projects/TestEdvo3/edvotek-edvocycler3/buildroot-2024.11-rc1/output/host/bi=
n:/home/pholden/Projects/TestEdvo3/edvotek-edvocycler3/buildroot-2024.11-rc=
1/output/host/sbin:/home/pholden/.pyenv/shims:/home/pholden/.pyenv/bin:/usr=
/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/lo=
cal/games:/snap/bin:/snap/bin&quot; PKG_CONFIG=3D&quot;/home/pholden/Projec=
ts/TestEdvo3/edvotek-edvocycler3/buildroot-2024.11-rc1/output/host/bin/pkg-=
config&quot; PKG_CONFIG_SYSROOT_DIR=3D&quot;/&quot; PKG_CONFIG_LIBDIR=3D&qu=
ot;/home/pholden/Projects/TestEdvo3/edvotek-edvocycler3/buildroot-2024.11-r=
c1/output/host/lib/pkgconfig:/home/pholden/Projects/TestEdvo3/edvotek-edvoc=
ycler3/buildroot-2024.11-rc1/output/host/share/pkgconfig&quot; PKG_CONFIG_A=
LLOW_SYSTEM_CFLAGS=3D1 PKG_CONFIG_ALLOW_SYSTEM_LIBS=3D1 =C2=A0/usr/bin/cmak=
e /home/pholden/Projects/TestEdvo3/edvotek-edvocycler3/buildroot-2024.11-rc=
1/output/build/host-qt6tools-6.7.3/ -G&quot;Ninja&quot; -DCMAKE_MAKE_PROGRA=
M=3D&quot;/home/pholden/Projects/TestEdvo3/edvotek-edvocycler3/buildroot-20=
24.11-rc1/output/host/bin/ninja&quot; -DCMAKE_INSTALL_SO_NO_EXE=3D0 -DCMAKE=
_FIND_ROOT_PATH=3D&quot;/home/pholden/Projects/TestEdvo3/edvotek-edvocycler=
3/buildroot-2024.11-rc1/output/host&quot; -DCMAKE_FIND_ROOT_PATH_MODE_PROGR=
AM=3D&quot;BOTH&quot; -DCMAKE_FIND_ROOT_PATH_MODE_LIBRARY=3D&quot;BOTH&quot=
; -DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE=3D&quot;BOTH&quot; -DCMAKE_INSTALL_PR=
EFIX=3D&quot;/home/pholden/Projects/TestEdvo3/edvotek-edvocycler3/buildroot=
-2024.11-rc1/output/host&quot; -DCMAKE_C_FLAGS=3D&quot;-O2 -I/home/pholden/=
Projects/TestEdvo3/edvotek-edvocycler3/buildroot-2024.11-rc1/output/host/in=
clude&quot; -DCMAKE_CXX_FLAGS=3D&quot;-O2 -I/home/pholden/Projects/TestEdvo=
3/edvotek-edvocycler3/buildroot-2024.11-rc1/output/host/include&quot; -DCMA=
KE_EXE_LINKER_FLAGS=3D&quot;-L/home/pholden/Projects/TestEdvo3/edvotek-edvo=
cycler3/buildroot-2024.11-rc1/output/host/lib -Wl,-rpath,/home/pholden/Proj=
ects/TestEdvo3/edvotek-edvocycler3/buildroot-2024.11-rc1/output/host/lib&qu=
ot; -DCMAKE_SHARED_LINKER_FLAGS=3D&quot;-L/home/pholden/Projects/TestEdvo3/=
edvotek-edvocycler3/buildroot-2024.11-rc1/output/host/lib -Wl,-rpath,/home/=
pholden/Projects/TestEdvo3/edvotek-edvocycler3/buildroot-2024.11-rc1/output=
/host/lib&quot; -DCMAKE_C_COMPILER=3D&quot;/usr/bin/gcc&quot; -DCMAKE_CXX_C=
OMPILER=3D&quot;/usr/bin/g++&quot; =C2=A0-DCMAKE_C_COMPILER_LAUNCHER=3D&quo=
t;&quot; -DCMAKE_CXX_COMPILER_LAUNCHER=3D&quot;&quot; =C2=A0-DCMAKE_COLOR_M=
AKEFILE=3DOFF -DBUILD_DOC=3DOFF -DBUILD_DOCS=3DOFF -DBUILD_EXAMPLE=3DOFF -D=
BUILD_EXAMPLES=3DOFF -DBUILD_TEST=3DOFF -DBUILD_TESTS=3DOFF -DBUILD_TESTING=
=3DOFF -DBUILD_SHARED_LIBS=3DON =C2=A0-DQT_BUILD_EXAMPLES=3DOFF -DQT_BUILD_=
TESTS=3DOFF -DFEATURE_linguist=3DON )<br>-- The CXX compiler identification=
 is GNU 11.4.0<br>-- The C compiler identification is GNU 11.4.0<br>-- Dete=
cting CXX compiler ABI info<br>-- Detecting CXX compiler ABI info - done<br=
>-- Check for working CXX compiler: /usr/bin/g++ - skipped<br>-- Detecting =
CXX compile features<br>-- Detecting CXX compile features - done<br>-- Dete=
cting C compiler ABI info<br>-- Detecting C compiler ABI info - done<br>-- =
Check for working C compiler: /usr/bin/gcc - skipped<br>-- Detecting C comp=
ile features<br>-- Detecting C compile features - done<br>-- Looking for pt=
hread.h<br>-- Looking for pthread.h - found<br>-- Performing Test CMAKE_HAV=
E_LIBC_PTHREAD<br>-- Performing Test CMAKE_HAVE_LIBC_PTHREAD - Success<br>-=
- Found Threads: TRUE =C2=A0<br>-- Performing Test HAVE_STDATOMIC<br>-- Per=
forming Test HAVE_STDATOMIC - Success<br>-- Found WrapAtomic: TRUE =C2=A0<b=
r>-- Force setting build type to &#39;Release&#39;.<br>CMake Error at /usr/=
lib/llvm-14/lib/cmake/clang/ClangTargets.cmake:750 (message):<br>=C2=A0 The=
 imported target &quot;clangBasic&quot; references the file<br><br>=C2=A0 =
=C2=A0 =C2=A0&quot;/usr/lib/llvm-14/lib/libclangBasic.a&quot;<br><br>=C2=A0=
 but this file does not exist.=C2=A0 Possible reasons include:<br><br>=C2=
=A0 * The file was deleted, renamed, or moved to another location.<br><br>=
=C2=A0 * An install or uninstall procedure did not complete successfully.<b=
r><br>=C2=A0 * The installation package was faulty and contained<br><br>=C2=
=A0 =C2=A0 =C2=A0&quot;/usr/lib/llvm-14/lib/cmake/clang/ClangTargets.cmake&=
quot;<br><br>=C2=A0 but not all the files it references.<br><br>Call Stack =
(most recent call first):<br>=C2=A0 /usr/lib/cmake/clang-14/ClangConfig.cma=
ke:19 (include)<br>=C2=A0 cmake/FindWrapLibClang.cmake:17 (find_package)<br=
>=C2=A0 /home/pholden/Projects/TestEdvo3/edvotek-edvocycler3/buildroot-2024=
.11-rc1/output/build/host-qt6base-6.7.3/cmake/QtFindPackageHelpers.cmake:15=
6 (find_package)<br>=C2=A0 configure.cmake:20 (qt_find_package)<br>=C2=A0 /=
home/pholden/Projects/TestEdvo3/edvotek-edvocycler3/buildroot-2024.11-rc1/o=
utput/build/host-qt6base-6.7.3/cmake/QtFeature.cmake:678 (include)<br>=C2=
=A0 src/CMakeLists.txt:18 (qt_feature_evaluate_features)<br><br><br>-- Conf=
iguring incomplete, errors occurred!<br>See also &quot;/home/pholden/Projec=
ts/TestEdvo3/edvotek-edvocycler3/buildroot-2024.11-rc1/output/build/host-qt=
6tools-6.7.3/buildroot-build/CMakeFiles/CMakeOutput.log&quot;.<br>make[1]: =
*** [package/<a href=3D"http://pkg-generic.mk:279" rel=3D"noreferrer" targe=
t=3D"_blank">pkg-generic.mk:279</a>: /home/pholden/Projects/TestEdvo3/edvot=
ek-edvocycler3/buildroot-2024.11-rc1/output/build/host-qt6tools-6.7.3/.stam=
p_configured] Error 1<br>make: *** [Makefile:83: _all] Error 2<br><br></div=
></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>On Fri, Jan 17, 2025 at 12:40=E2=80=AFAM Roy Kollen Svendsen &lt;<a href=
=3D"mailto:roykollensvendsen@gmail.com" rel=3D"noreferrer" target=3D"_blank=
">roykollensvendsen@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex"><div dir=3D"ltr"><div></div><div>I don&#39;t u=
nderstand why the build depends on what packages are installed on your Ubun=
tu workstation.</div><div><br></div><div>Does this make sense to you?<br></=
div><div><br></div><div><br></div></div><div dir=3D"ltr"><br></div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">tor. 16. jan. =
2025 kl. 18:17 skrev Patricia Holden &lt;<a href=3D"mailto:pholden@nklabs.c=
om" rel=3D"noreferrer" target=3D"_blank">pholden@nklabs.com</a>&gt;:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">I was=
 able to resolve the problem by installing &quot;clang-format&quot;.=C2=A0 =
We had one Ubuntu workstation that was building host-qt6tools just fine and=
 did a comparison of packages installed.=C2=A0 Once I installed clang-forma=
t, build completed no errors and ran fine on our target system.<div><br></d=
iv><div>Thanks for your assistance.</div></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 16, 2025 at 11:34=E2=
=80=AFAM Patricia Holden &lt;<a href=3D"mailto:pholden@nklabs.com" rel=3D"n=
oreferrer" target=3D"_blank">pholden@nklabs.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">I attempted=
 to install Clang, version 17 but am unable to find it.=C2=A0 Is this an ex=
perimental version of Clang?=C2=A0 Do you have instructions on how to insta=
ll it for Ubuntu?</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Thu, Jan 16, 2025 at 11:29=E2=80=AFAM Patricia Holden &=
lt;<a href=3D"mailto:pholden@nklabs.com" rel=3D"noreferrer" target=3D"_blan=
k">pholden@nklabs.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">Our defconfig is as =
follows:<div><br></div><div>BR2_aarch64=3Dy<br>BR2_KERNEL_HEADERS_VERSION=
=3Dy<br>BR2_DEFAULT_KERNEL_VERSION=3D&quot;6.1.80&quot;<br>BR2_PACKAGE_HOST=
_LINUX_HEADERS_CUSTOM_6_1=3Dy<br>BR2_TOOLCHAIN_BUILDROOT_CXX=3Dy<br>BR2_SHA=
RED_STATIC_LIBS=3Dy<br>BR2_PACKAGE_OVERRIDE_FILE=3D&quot;$(BR2_EXTERNAL_edv=
o_PATH)/<a href=3D"http://local.mk" rel=3D"noreferrer" target=3D"_blank">lo=
cal.mk</a>&quot;<br>BR2_TARGET_GENERIC_HOSTNAME=3D&quot;edvocycler3&quot;<b=
r>BR2_TARGET_GENERIC_ISSUE=3D&quot;Welcome to Edvocycler3&quot;<br>BR2_INIT=
_SYSTEMD=3Dy<br>BR2_TARGET_GENERIC_ROOT_PASSWD=3D&quot;temp1234&quot;<br>BR=
2_SYSTEM_DHCP=3D&quot;wlan0&quot;<br>BR2_SYSTEM_DEFAULT_PATH=3D&quot;/bin:/=
sbin:/usr/bin:/usr/sbin&quot;<br>BR2_ROOTFS_OVERLAY=3D&quot;$(BR2_EXTERNAL_=
edvo_PATH)/board/edvotek/rootfs-overlay&quot;<br>BR2_ROOTFS_POST_IMAGE_SCRI=
PT=3D&quot;$(BR2_EXTERNAL_edvo_PATH)/board/edvotek/post-build.sh &quot;<br>=
BR2_LINUX_KERNEL=3Dy<br>BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy<br>BR2_LINUX_KE=
RNEL_CUSTOM_VERSION_VALUE=3D&quot;6.1.80&quot;<br>BR2_LINUX_KERNEL_USE_CUST=
OM_CONFIG=3Dy<br>BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=3D&quot;$(BR2_EXTERNAL=
_edvo_PATH)/board/edvotek/edvo3_defconfig&quot;<br>BR2_LINUX_KERNEL_DTS_SUP=
PORT=3Dy<br>BR2_LINUX_KERNEL_DTB_IS_SELF_BUILT=3Dy<br>BR2_LINUX_KERNEL_INTR=
EE_DTS_NAME=3D&quot;ti/k3-am623-edvocycler3.dtb&quot;<br>BR2_LINUX_KERNEL_D=
TB_KEEP_DIRNAME=3Dy<br>BR2_LINUX_KERNEL_DTB_OVERLAY_SUPPORT=3Dy<br>BR2_PACK=
AGE_BUSYBOX_CONFIG=3D&quot;$(BR2_EXTERNAL_edvo_PATH)/board/edvotek/edvo3br_=
busybox_defconfig&quot;<br>BR2_PACKAGE_FFMPEG=3Dy<br>BR2_PACKAGE_FFMPEG_SWS=
CALE=3Dy<br>BR2_PACKAGE_BZIP2=3Dy<br>BR2_PACKAGE_GZIP=3Dy<br>BR2_PACKAGE_XZ=
=3Dy<br>BR2_PACKAGE_SPIDEV_TEST=3Dy<br>BR2_PACKAGE_VALGRIND=3Dy<br>BR2_PACK=
AGE_BINUTILS=3Dy<br>BR2_PACKAGE_BINUTILS_TARGET=3Dy<br>BR2_PACKAGE_LIBTOOL=
=3Dy<br>BR2_PACKAGE_E2FSPROGS=3Dy<br>BR2_PACKAGE_E2FSPROGS_RESIZE2FS=3Dy<br=
>BR2_PACKAGE_DEJAVU=3Dy<br>BR2_PACKAGE_LIBERATION=3Dy<br>BR2_PACKAGE_HICOLO=
R_ICON_THEME=3Dy<br>BR2_PACKAGE_KMSCUBE=3Dy<br>BR2_PACKAGE_MESA3D_DEMOS=3Dy=
<br>BR2_PACKAGE_MESA3D=3Dy<br>BR2_PACKAGE_MESA3D_OSMESA_GALLIUM=3Dy<br>BR2_=
PACKAGE_MESA3D_OPENGL_EGL=3Dy<br>BR2_PACKAGE_MESA3D_OPENGL_ES=3Dy<br>BR2_PA=
CKAGE_QT6BASE_DEFAULT_QPA=3D&quot;linuxfb&quot;<br>BR2_PACKAGE_QT6BASE_FONT=
CONFIG=3Dy<br>BR2_PACKAGE_QT6BASE_HARFBUZZ=3Dy<br>BR2_PACKAGE_QT6BASE_JPEG=
=3Dy<br>BR2_PACKAGE_QT6BASE_PNG=3Dy<br>BR2_PACKAGE_QT6BASE_SYSLOG=3Dy<br>BR=
2_PACKAGE_QT6CORE5COMPAT=3Dy<br>BR2_PACKAGE_QT6DECLARATIVE_QUICK=3Dy<br>BR2=
_PACKAGE_QT6LANGUAGESERVER=3Dy<br>BR2_PACKAGE_QT6VIRTUALKEYBOARD=3Dy<br>BR2=
_PACKAGE_LINUX_FIRMWARE=3Dy<br>BR2_PACKAGE_LINUX_FIRMWARE_TI_WL18XX=3Dy<br>=
BR2_PACKAGE_18XX_TI_UTILS=3Dy<br>BR2_PACKAGE_EVTEST=3Dy<br>BR2_PACKAGE_I2C_=
TOOLS=3Dy<br>BR2_PACKAGE_LIBMANETTE=3Dy<br>BR2_PACKAGE_LSHW=3Dy<br>BR2_PACK=
AGE_PARTED=3Dy<br>BR2_PACKAGE_PICOCOM=3Dy<br>BR2_PACKAGE_SPI_TOOLS=3Dy<br>B=
R2_PACKAGE_STATSERIAL=3Dy<br>BR2_PACKAGE_STM32FLASH=3Dy<br>BR2_PACKAGE_SYSS=
TAT=3Dy<br>BR2_PACKAGE_TI_UIM=3Dy<br>BR2_PACKAGE_TI_UTILS=3Dy<br>BR2_PACKAG=
E_ENSCRIPT=3Dy<br>BR2_PACKAGE_LUA=3Dy<br>BR2_PACKAGE_LSQLITE3=3Dy<br>BR2_PA=
CKAGE_LZLIB=3Dy<br>BR2_PACKAGE_PYTHON3=3Dy<br>BR2_PACKAGE_PYTHON3_SQLITE=3D=
y<br>BR2_PACKAGE_PYTHON_CFFI=3Dy<br>BR2_PACKAGE_PYTHON_CYCLER=3Dy<br>BR2_PA=
CKAGE_PYTHON_FLASK_CORS=3Dy<br>BR2_PACKAGE_PYTHON_JSONMODELS=3Dy<br>BR2_PAC=
KAGE_PYTHON_JSONSCHEMA=3Dy<br>BR2_PACKAGE_PYTHON_KIWISOLVER=3Dy<br>BR2_PACK=
AGE_PYTHON_LIBEVDEV=3Dy<br>BR2_PACKAGE_PYTHON_MSGPACK=3Dy<br>BR2_PACKAGE_PY=
THON_NUMPY=3Dy<br>BR2_PACKAGE_PYTHON_PACKAGING=3Dy<br>BR2_PACKAGE_PYTHON_PI=
LLOW=3Dy<br>BR2_PACKAGE_PYTHON_PIP=3Dy<br>BR2_PACKAGE_PYTHON_PYELFTOOLS=3Dy=
<br>BR2_PACKAGE_PYTHON_PYPARSING=3Dy<br>BR2_PACKAGE_PYTHON_REGEX=3Dy<br>BR2=
_PACKAGE_PYTHON_SIMPLEJSON=3Dy<br>BR2_PACKAGE_PYTHON_SPIDEV=3Dy<br>BR2_PACK=
AGE_PYTHON_TYPING_EXTENSIONS=3Dy<br>BR2_PACKAGE_PYTHON_WRAPT=3Dy<br>BR2_PAC=
KAGE_PYTHON_ZOPE_INTERFACE=3Dy<br>BR2_PACKAGE_CA_CERTIFICATES=3Dy<br>BR2_PA=
CKAGE_LIBGCRYPT=3Dy<br>BR2_PACKAGE_LIBNSS=3Dy<br>BR2_PACKAGE_LIBSECRET=3Dy<=
br>BR2_PACKAGE_LEVELDB=3Dy<br>BR2_PACKAGE_CAIRO_TEE=3Dy<br>BR2_PACKAGE_CAIR=
OMM=3Dy<br>BR2_PACKAGE_CAIROMM1_14=3Dy<br>BR2_PACKAGE_GD=3Dy<br>BR2_PACKAGE=
_GIFLIB=3Dy<br>BR2_PACKAGE_KMSXX=3Dy<br>BR2_PACKAGE_KMSXX_INSTALL_TESTS=3Dy=
<br>BR2_PACKAGE_LIBGTK3=3Dy<br>BR2_PACKAGE_LIBJXL=3Dy<br>BR2_PACKAGE_LIBSVG=
_CAIRO=3Dy<br>BR2_PACKAGE_OPENJPEG=3Dy<br>BR2_PACKAGE_POPPLER=3Dy<br>BR2_PA=
CKAGE_WOFF2=3Dy<br>BR2_PACKAGE_LIBCEC=3Dy<br>BR2_PACKAGE_LIBGPIOD=3Dy<br>BR=
2_PACKAGE_LIBGPIOD_TOOLS=3Dy<br>BR2_PACKAGE_LIBINPUT=3Dy<br>BR2_PACKAGE_LIB=
PCIACCESS=3Dy<br>BR2_PACKAGE_LIBSERIAL=3Dy<br>BR2_PACKAGE_LIBSERIALPORT=3Dy=
<br>BR2_PACKAGE_LIBUSB=3Dy<br>BR2_PACKAGE_TSLIB=3Dy<br>BR2_PACKAGE_BOOTSTRA=
P=3Dy<br>BR2_PACKAGE_CHARTJS=3Dy<br>BR2_PACKAGE_JSON_JAVASCRIPT=3Dy<br>BR2_=
PACKAGE_VUEJS=3Dy<br>BR2_PACKAGE_CJSON=3Dy<br>BR2_PACKAGE_CJSON_UTILS=3Dy<b=
r>BR2_PACKAGE_JANSSON=3Dy<br>BR2_PACKAGE_JSON_C=3Dy<br>BR2_PACKAGE_JSON_FOR=
_MODERN_CPP=3Dy<br>BR2_PACKAGE_JSON_GLIB=3Dy<br>BR2_PACKAGE_JSONCPP=3Dy<br>=
BR2_PACKAGE_LIBJSON=3Dy<br>BR2_PACKAGE_LIBUCL=3Dy<br>BR2_PACKAGE_LIBXMLPP=
=3Dy<br>BR2_PACKAGE_LIBXSLT=3Dy<br>BR2_PACKAGE_LIBYAML=3Dy<br>BR2_PACKAGE_Y=
AML_CPP=3Dy<br>BR2_PACKAGE_LIBVPX=3Dy<br>BR2_PACKAGE_GEOIP=3Dy<br>BR2_PACKA=
GE_LIBCURL=3Dy<br>BR2_PACKAGE_LIBIDN2=3Dy<br>BR2_PACKAGE_LIBNDP=3Dy<br>BR2_=
PACKAGE_LIBPCAP=3Dy<br>BR2_PACKAGE_LIBSOUP3=3Dy<br>BR2_PACKAGE_LIBSOUP3_SSL=
=3Dy<br>BR2_PACKAGE_LIBVNCSERVER=3Dy<br>BR2_PACKAGE_BOOST_JSON=3Dy<br>BR2_P=
ACKAGE_GLM=3Dy<br>BR2_PACKAGE_GOBJECT_INTROSPECTION=3Dy<br>BR2_PACKAGE_GTES=
T=3Dy<br>BR2_PACKAGE_LIBATOMIC_OPS=3Dy<br>BR2_PACKAGE_LIBSECCOMP=3Dy<br>BR2=
_PACKAGE_LIBSOLV=3Dy<br>BR2_PACKAGE_LIBUV=3Dy<br>BR2_PACKAGE_LINUX_PAM=3Dy<=
br>BR2_PACKAGE_ORC=3Dy<br>BR2_PACKAGE_QHULL=3Dy<br>BR2_PACKAGE_ENCHANT=3Dy<=
br>BR2_PACKAGE_ICU=3Dy<br>BR2_PACKAGE_NCURSES_WCHAR=3Dy<br>BR2_PACKAGE_UTF8=
PROC=3Dy<br>BR2_PACKAGE_SHARED_MIME_INFO=3Dy<br>BR2_PACKAGE_APACHE=3Dy<br>B=
R2_PACKAGE_AVAHI=3Dy<br>BR2_PACKAGE_DHCP=3Dy<br>BR2_PACKAGE_DHCP_CLIENT=3Dy=
<br>BR2_PACKAGE_DHCPCD=3Dy<br>BR2_PACKAGE_IFUPDOWN=3Dy<br>BR2_PACKAGE_IPROU=
TE2=3Dy<br>BR2_PACKAGE_IPUTILS=3Dy<br>BR2_PACKAGE_IW=3Dy<br>BR2_PACKAGE_IWD=
=3Dy<br>BR2_PACKAGE_NET_TOOLS=3Dy<br>BR2_PACKAGE_NTP=3Dy<br>BR2_PACKAGE_NTP=
_NTPDATE=3Dy<br>BR2_PACKAGE_NTP_NTPTIME=3Dy<br>BR2_PACKAGE_OPENSSH=3Dy<br>B=
R2_PACKAGE_PPPD=3Dy<br>BR2_PACKAGE_RSYNC=3Dy<br>BR2_PACKAGE_TFTPD=3Dy<br>BR=
2_PACKAGE_WIRELESS_REGDB=3Dy<br>BR2_PACKAGE_WIRELESS_TOOLS=3Dy<br>BR2_PACKA=
GE_WPA_SUPPLICANT=3Dy<br>BR2_PACKAGE_WPA_SUPPLICANT_WEXT=3Dy<br>BR2_PACKAGE=
_WPA_SUPPLICANT_WIRED=3Dy<br>BR2_PACKAGE_WPA_SUPPLICANT_IBSS_RSN=3Dy<br>BR2=
_PACKAGE_WPA_SUPPLICANT_AP_SUPPORT=3Dy<br>BR2_PACKAGE_WPA_SUPPLICANT_WIFI_D=
ISPLAY=3Dy<br>BR2_PACKAGE_WPA_SUPPLICANT_MESH_NETWORKING=3Dy<br>BR2_PACKAGE=
_WPA_SUPPLICANT_AUTOSCAN=3Dy<br>BR2_PACKAGE_WPA_SUPPLICANT_DEBUG_SYSLOG=3Dy=
<br>BR2_PACKAGE_WPA_SUPPLICANT_WPS=3Dy<br>BR2_PACKAGE_WPA_SUPPLICANT_WPA3=
=3Dy<br>BR2_PACKAGE_WPA_SUPPLICANT_CLI=3Dy<br>BR2_PACKAGE_WPA_SUPPLICANT_WP=
A_CLIENT_SO=3Dy<br>BR2_PACKAGE_WPA_SUPPLICANT_PASSPHRASE=3Dy<br>BR2_PACKAGE=
_WPA_SUPPLICANT_DBUS=3Dy<br>BR2_PACKAGE_WPAN_TOOLS=3Dy<br>BR2_PACKAGE_XINET=
D=3Dy<br>BR2_PACKAGE_XTABLES_ADDONS=3Dy<br>BR2_PACKAGE_BASH=3Dy<br>BR2_PACK=
AGE_SUDO=3Dy<br>BR2_PACKAGE_BUBBLEWRAP=3Dy<br>BR2_PACKAGE_HTOP=3Dy<br>BR2_P=
ACKAGE_PROCPS_NG=3Dy<br>BR2_PACKAGE_SEATD=3Dy<br>BR2_PACKAGE_SEATD_DAEMON=
=3Dy<br>BR2_PACKAGE_SYSTEMD_RFKILL=3Dy<br>BR2_PACKAGE_UTIL_LINUX_BINARIES=
=3Dy<br>BR2_PACKAGE_UTIL_LINUX_KILL=3Dy<br>BR2_PACKAGE_UTIL_LINUX_RFKILL=3D=
y<br>BR2_PACKAGE_XDG_DBUS_PROXY=3Dy<br>BR2_PACKAGE_NANO=3Dy<br>BR2_TARGET_R=
OOTFS_TAR_GZIP=3Dy<br>BR2_PACKAGE_HOST_CMAKE=3Dy<br>BR2_PACKAGE_HOST_DOSFST=
OOLS=3Dy<br>BR2_PACKAGE_HOST_DTC=3Dy<br>BR2_PACKAGE_HOST_E2FSPROGS=3Dy<br>B=
R2_PACKAGE_HOST_GENIMAGE=3Dy<br>BR2_PACKAGE_HOST_IMAGEMAGICK=3Dy<br>BR2_PAC=
KAGE_HOST_IMAGEMAGICK_XML=3Dy<br>BR2_PACKAGE_HOST_KMOD_XZ=3Dy<br>BR2_PACKAG=
E_HOST_MESON_TOOLS=3Dy<br>BR2_PACKAGE_HOST_MTOOLS=3Dy<br>BR2_PACKAGE_HOST_P=
YTHON_CYTHON=3Dy<br>BR2_PACKAGE_HOST_PYTHON_GREENLET=3Dy<br>BR2_PACKAGE_HOS=
T_PYTHON_LXML=3Dy<br>BR2_PACKAGE_HOST_PYTHON_PYYAML=3Dy<br>BR2_PACKAGE_HOST=
_PYTHON_XLRD=3Dy<br>BR2_PACKAGE_HOST_PYTHON3=3Dy<br>BR2_PACKAGE_HOST_PYTHON=
3_BZIP2=3Dy<br>BR2_PACKAGE_HOST_PYTHON3_XZ=3Dy<br>BR2_PACKAGE_HOST_PYTHON3_=
SSL=3Dy<br>BR2_PACKAGE_HOST_QT6TOOLS=3Dy<br>BR2_PACKAGE_HOST_QT6TOOLS_LINGU=
IST_TOOLS=3Dy<br><br></div><div>I applied the patch to <a href=3D"http://qt=
6tools.mk" rel=3D"noreferrer" target=3D"_blank">qt6tools.mk</a> and still g=
etting the same error.=C2=A0 I see in output that the compile flag is prese=
nt to disable Clang.<div><br></div><div>Output:</div><div>&gt;&gt;&gt; host=
-qt6tools 6.7.3 Extracting<br>xzcat /home/pholden/Projects/Edvotek01072025/=
edvotek-edvocycler3/buildroot-2024.11-rc1/dl/qt6tools/qttools-everywhere-sr=
c-6.7.3.tar.xz | /home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3=
/buildroot-2024.11-rc1/output/host/bin/tar --strip-components=3D1 -C /home/=
pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.11-rc1/=
output/build/host-qt6tools-6.7.3 =C2=A0 -xf -<br>&gt;&gt;&gt; host-qt6tools=
 6.7.3 Patching<br>&gt;&gt;&gt; host-qt6tools 6.7.3 Configuring<br>(mkdir -=
p /home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024=
.11-rc1/output/build/host-qt6tools-6.7.3//buildroot-build &amp;&amp; cd /ho=
me/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.11-r=
c1/output/build/host-qt6tools-6.7.3//buildroot-build &amp;&amp; rm -f CMake=
Cache.txt &amp;&amp; PATH=3D&quot;/home/pholden/Projects/Edvotek01072025/ed=
votek-edvocycler3/buildroot-2024.11-rc1/output/host/bin:/home/pholden/Proje=
cts/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.11-rc1/output/host/s=
bin:/home/pholden/.pyenv/shims:/home/pholden/.pyenv/bin:/usr/local/sbin:/us=
r/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap=
/bin:/snap/bin&quot; PKG_CONFIG=3D&quot;/home/pholden/Projects/Edvotek01072=
025/edvotek-edvocycler3/buildroot-2024.11-rc1/output/host/bin/pkg-config&qu=
ot; PKG_CONFIG_SYSROOT_DIR=3D&quot;/&quot; PKG_CONFIG_LIBDIR=3D&quot;/home/=
pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.11-rc1/=
output/host/lib/pkgconfig:/home/pholden/Projects/Edvotek01072025/edvotek-ed=
vocycler3/buildroot-2024.11-rc1/output/host/share/pkgconfig&quot; PKG_CONFI=
G_ALLOW_SYSTEM_CFLAGS=3D1 PKG_CONFIG_ALLOW_SYSTEM_LIBS=3D1 =C2=A0/usr/bin/c=
make /home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2=
024.11-rc1/output/build/host-qt6tools-6.7.3/ -G&quot;Ninja&quot; -DCMAKE_MA=
KE_PROGRAM=3D&quot;/home/pholden/Projects/Edvotek01072025/edvotek-edvocycle=
r3/buildroot-2024.11-rc1/output/host/bin/ninja&quot; -DCMAKE_INSTALL_SO_NO_=
EXE=3D0 -DCMAKE_FIND_ROOT_PATH=3D&quot;/home/pholden/Projects/Edvotek010720=
25/edvotek-edvocycler3/buildroot-2024.11-rc1/output/host&quot; -DCMAKE_FIND=
_ROOT_PATH_MODE_PROGRAM=3D&quot;BOTH&quot; -DCMAKE_FIND_ROOT_PATH_MODE_LIBR=
ARY=3D&quot;BOTH&quot; -DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE=3D&quot;BOTH&quo=
t; -DCMAKE_INSTALL_PREFIX=3D&quot;/home/pholden/Projects/Edvotek01072025/ed=
votek-edvocycler3/buildroot-2024.11-rc1/output/host&quot; -DCMAKE_C_FLAGS=
=3D&quot;-O2 -I/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/b=
uildroot-2024.11-rc1/output/host/include&quot; -DCMAKE_CXX_FLAGS=3D&quot;-O=
2 -I/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-20=
24.11-rc1/output/host/include&quot; -DCMAKE_EXE_LINKER_FLAGS=3D&quot;-L/hom=
e/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.11-rc=
1/output/host/lib -Wl,-rpath,/home/pholden/Projects/Edvotek01072025/edvotek=
-edvocycler3/buildroot-2024.11-rc1/output/host/lib&quot; -DCMAKE_SHARED_LIN=
KER_FLAGS=3D&quot;-L/home/pholden/Projects/Edvotek01072025/edvotek-edvocycl=
er3/buildroot-2024.11-rc1/output/host/lib -Wl,-rpath,/home/pholden/Projects=
/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.11-rc1/output/host/lib&=
quot; -DCMAKE_C_COMPILER=3D&quot;/usr/bin/gcc&quot; -DCMAKE_CXX_COMPILER=3D=
&quot;/usr/bin/g++&quot; =C2=A0-DCMAKE_C_COMPILER_LAUNCHER=3D&quot;&quot; -=
DCMAKE_CXX_COMPILER_LAUNCHER=3D&quot;&quot; =C2=A0-DCMAKE_COLOR_MAKEFILE=3D=
OFF -DBUILD_DOC=3DOFF -DBUILD_DOCS=3DOFF -DBUILD_EXAMPLE=3DOFF -DBUILD_EXAM=
PLES=3DOFF -DBUILD_TEST=3DOFF -DBUILD_TESTS=3DOFF -DBUILD_TESTING=3DOFF -DB=
UILD_SHARED_LIBS=3DON =C2=A0<font color=3D"#ff0000">-DFEATURE_clang=3DOFF</=
font> -DQT_BUILD_EXAMPLES=3DOFF -DQT_BUILD_TESTS=3DOFF -DFEATURE_linguist=
=3DOFF )<br>-- The CXX compiler identification is GNU 11.4.0<br>-- The C co=
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
href=3D"http://pkg-generic.mk:279" rel=3D"noreferrer" target=3D"_blank">pkg=
-generic.mk:279</a>: /home/pholden/Projects/Edvotek01072025/edvotek-edvocyc=
ler3/buildroot-2024.11-rc1/output/build/host-qt6tools-6.7.3/.stamp_configur=
ed] Error 1<br>make: *** [Makefile:83: _all] Error 2<br></div></div></div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu,=
 Jan 16, 2025 at 8:00=E2=80=AFAM Roy Kollen Svendsen &lt;<a href=3D"mailto:=
roykollensvendsen@gmail.com" rel=3D"noreferrer" target=3D"_blank">roykollen=
svendsen@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex"><div dir=3D"ltr"><div>Hi,</div><div><br></div><div>Since =
I&#39;m the root cause of the problem I sent you a patch here:<br></div><di=
v><br></div><div><a href=3D"https://patchwork.ozlabs.org/project/buildroot/=
patch/20250116125537.531666-1-roykollensvendsen@gmail.com/" rel=3D"noreferr=
er" target=3D"_blank">https://patchwork.ozlabs.org/project/buildroot/patch/=
20250116125537.531666-1-roykollensvendsen@gmail.com/</a></div><div><br></di=
v><div>Please test if this fixes your problem add you Tested-By etc.</div><=
div><br></div><div>Roy<br></div></div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">tor. 16. jan. 2025 kl. 13:17 skrev Roy Koll=
en Svendsen &lt;<a href=3D"mailto:roykollensvendsen@gmail.com" rel=3D"noref=
errer" target=3D"_blank">roykollensvendsen@gmail.com</a>&gt;:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div><br></d=
iv><div>qttools require at least clang 17. So we should not try to enable s=
upport unless suitable version is available.</div><div><br></div><div>So we=
 should set -DFEATURE_clang=3DOFF</div><div><br></div><div>-Roy<br></div><b=
r></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">tor. 16. jan. 2025 kl. 11:23 skrev Roy Kollen Svendsen &lt;<a href=3D"mai=
lto:roykollensvendsen@gmail.com" rel=3D"noreferrer" target=3D"_blank">royko=
llensvendsen@gmail.com</a>&gt;:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex"><div dir=3D"ltr"><div>Hi Patricia,</div><div><br></div><div=
>I&#39;ll take look at this as soon as I get a chance. Can you send me a mi=
nimal config that recreate the problem?</div><div><br></div><div>Thanks in =
advance,</div><div><br></div><div>Roy</div></div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">tir. 14. jan. 2025 kl. 20:16 skr=
ev Patricia Holden &lt;<a href=3D"mailto:pholden@nklabs.com" rel=3D"norefer=
rer" target=3D"_blank">pholden@nklabs.com</a>&gt;:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">We are using Buildroot =
version &quot;2024.11-rc1.=C2=A0 We just turned on &quot;Host Utilities-&gt=
;host qt6 tools-&gt;host linguistic tools&quot;.=C2=A0 I run make, get the =
error and output below.=C2=A0 Is there a fix for this?=C2=A0 Am I missing a=
 dependency I need to install on my host PC?<div><br></div><div>Thanks!</di=
v><div>Pat<br><div><br></div><div>make BR2_EXTERNAL=3D../edvo_br host-qt6to=
ols<br>&gt;&gt;&gt; host-qt6tools 6.7.3 Configuring<br>(mkdir -p /home/phol=
den/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.11-rc1/outp=
ut/build/host-qt6tools-6.7.3//buildroot-build &amp;&amp; cd /home/pholden/P=
rojects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.11-rc1/output/bu=
ild/host-qt6tools-6.7.3//buildroot-build &amp;&amp; rm -f CMakeCache.txt &a=
mp;&amp; PATH=3D&quot;/home/pholden/Projects/Edvotek01072025/edvotek-edvocy=
cler3/buildroot-2024.11-rc1/output/host/bin:/home/pholden/Projects/Edvotek0=
1072025/edvotek-edvocycler3/buildroot-2024.11-rc1/output/host/sbin:/home/ph=
olden/.pyenv/shims:/home/pholden/.pyenv/bin:/usr/local/sbin:/usr/local/bin:=
/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/snap/b=
in&quot; PKG_CONFIG=3D&quot;/home/pholden/Projects/Edvotek01072025/edvotek-=
edvocycler3/buildroot-2024.11-rc1/output/host/bin/pkg-config&quot; PKG_CONF=
IG_SYSROOT_DIR=3D&quot;/&quot; PKG_CONFIG_LIBDIR=3D&quot;/home/pholden/Proj=
ects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.11-rc1/output/host/=
lib/pkgconfig:/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/bu=
ildroot-2024.11-rc1/output/host/share/pkgconfig&quot; PKG_CONFIG_ALLOW_SYST=
EM_CFLAGS=3D1 PKG_CONFIG_ALLOW_SYSTEM_LIBS=3D1 =C2=A0/usr/bin/cmake /home/p=
holden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.11-rc1/o=
utput/build/host-qt6tools-6.7.3/ -G&quot;Ninja&quot; -DCMAKE_MAKE_PROGRAM=
=3D&quot;/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildro=
ot-2024.11-rc1/output/host/bin/ninja&quot; -DCMAKE_INSTALL_SO_NO_EXE=3D0 -D=
CMAKE_FIND_ROOT_PATH=3D&quot;/home/pholden/Projects/Edvotek01072025/edvotek=
-edvocycler3/buildroot-2024.11-rc1/output/host&quot; -DCMAKE_FIND_ROOT_PATH=
_MODE_PROGRAM=3D&quot;BOTH&quot; -DCMAKE_FIND_ROOT_PATH_MODE_LIBRARY=3D&quo=
t;BOTH&quot; -DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE=3D&quot;BOTH&quot; -DCMAKE=
_INSTALL_PREFIX=3D&quot;/home/pholden/Projects/Edvotek01072025/edvotek-edvo=
cycler3/buildroot-2024.11-rc1/output/host&quot; -DCMAKE_C_FLAGS=3D&quot;-O2=
 -I/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-202=
4.11-rc1/output/host/include&quot; -DCMAKE_CXX_FLAGS=3D&quot;-O2 -I/home/ph=
olden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.11-rc1/ou=
tput/host/include&quot; -DCMAKE_EXE_LINKER_FLAGS=3D&quot;-L/home/pholden/Pr=
ojects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.11-rc1/output/hos=
t/lib -Wl,-rpath,/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3=
/buildroot-2024.11-rc1/output/host/lib&quot; -DCMAKE_SHARED_LINKER_FLAGS=3D=
&quot;-L/home/pholden/Projects/Edvotek01072025/edvotek-edvocycler3/buildroo=
t-2024.11-rc1/output/host/lib -Wl,-rpath,/home/pholden/Projects/Edvotek0107=
2025/edvotek-edvocycler3/buildroot-2024.11-rc1/output/host/lib&quot; -DCMAK=
E_C_COMPILER=3D&quot;/usr/bin/gcc&quot; -DCMAKE_CXX_COMPILER=3D&quot;/usr/b=
in/g++&quot; =C2=A0-DCMAKE_C_COMPILER_LAUNCHER=3D&quot;&quot; -DCMAKE_CXX_C=
OMPILER_LAUNCHER=3D&quot;&quot; =C2=A0-DCMAKE_COLOR_MAKEFILE=3DOFF -DBUILD_=
DOC=3DOFF -DBUILD_DOCS=3DOFF -DBUILD_EXAMPLE=3DOFF -DBUILD_EXAMPLES=3DOFF -=
DBUILD_TEST=3DOFF -DBUILD_TESTS=3DOFF -DBUILD_TESTING=3DOFF -DBUILD_SHARED_=
LIBS=3DON =C2=A0-DQT_BUILD_EXAMPLES=3DOFF -DQT_BUILD_TESTS=3DOFF -DFEATURE_=
linguist=3DON )<br>-- The CXX compiler identification is GNU 11.4.0<br>-- T=
he C compiler identification is GNU 11.4.0<br>-- Detecting CXX compiler ABI=
 info<br>-- Detecting CXX compiler ABI info - done<br>-- Check for working =
CXX compiler: /usr/bin/g++ - skipped<br>-- Detecting CXX compile features<b=
r>-- Detecting CXX compile features - done<br>-- Detecting C compiler ABI i=
nfo<br>-- Detecting C compiler ABI info - done<br>-- Check for working C co=
mpiler: /usr/bin/gcc - skipped<br>-- Detecting C compile features<br>-- Det=
ecting C compile features - done<br>-- Looking for pthread.h<br>-- Looking =
for pthread.h - found<br>-- Performing Test CMAKE_HAVE_LIBC_PTHREAD<br>-- P=
erforming Test CMAKE_HAVE_LIBC_PTHREAD - Success<br>-- Found Threads: TRUE =
=C2=A0<br>-- Performing Test HAVE_STDATOMIC<br>-- Performing Test HAVE_STDA=
TOMIC - Success<br>-- Found WrapAtomic: TRUE =C2=A0<br>-- Force setting bui=
ld type to &#39;Release&#39;.<br>CMake Error at /usr/lib/llvm-14/lib/cmake/=
clang/ClangTargets.cmake:750 (message):<br>=C2=A0 The imported target &quot=
;clangBasic&quot; references the file<br><br>=C2=A0 =C2=A0 =C2=A0&quot;/usr=
/lib/llvm-14/lib/libclangBasic.a&quot;<br><br>=C2=A0 but this file does not=
 exist.=C2=A0 Possible reasons include:<br><br>=C2=A0 * The file was delete=
d, renamed, or moved to another location.<br><br>=C2=A0 * An install or uni=
nstall procedure did not complete successfully.<br><br>=C2=A0 * The install=
ation package was faulty and contained<br><br>=C2=A0 =C2=A0 =C2=A0&quot;/us=
r/lib/llvm-14/lib/cmake/clang/ClangTargets.cmake&quot;<br><br>=C2=A0 but no=
t all the files it references.<br><br>Call Stack (most recent call first):<=
br>=C2=A0 /usr/lib/cmake/clang-14/ClangConfig.cmake:19 (include)<br>=C2=A0 =
cmake/FindWrapLibClang.cmake:17 (find_package)<br>=C2=A0 /home/pholden/Proj=
ects/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.11-rc1/output/build=
/host-qt6base-6.7.3/cmake/QtFindPackageHelpers.cmake:156 (find_package)<br>=
=C2=A0 configure.cmake:20 (qt_find_package)<br>=C2=A0 /home/pholden/Project=
s/Edvotek01072025/edvotek-edvocycler3/buildroot-2024.11-rc1/output/build/ho=
st-qt6base-6.7.3/cmake/QtFeature.cmake:678 (include)<br>=C2=A0 src/CMakeLis=
ts.txt:18 (qt_feature_evaluate_features)<br><br><br>-- Configuring incomple=
te, errors occurred!<br>See also &quot;/home/pholden/Projects/Edvotek010720=
25/edvotek-edvocycler3/buildroot-2024.11-rc1/output/build/host-qt6tools-6.7=
.3/buildroot-build/CMakeFiles/CMakeOutput.log&quot;.<br>make[1]: *** [packa=
ge/<a href=3D"http://pkg-generic.mk:279" rel=3D"noreferrer" target=3D"_blan=
k">pkg-generic.mk:279</a>: /home/pholden/Projects/Edvotek01072025/edvotek-e=
dvocycler3/buildroot-2024.11-rc1/output/build/host-qt6tools-6.7.3/.stamp_co=
nfigured] Error 1<br>make: *** [Makefile:83: _all] Error 2<br></div></div><=
/div>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" rel=3D"noreferrer" target=3D"_bl=
ank">buildroot@buildroot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">https://lists.buildroot.org/mailman=
/listinfo/buildroot</a><br>
</blockquote></div>
</blockquote></div>
</blockquote></div>
</blockquote></div></div>
</blockquote></div>
</blockquote></div>
</blockquote></div>
</blockquote></div>
</blockquote></div>
</blockquote></div>
</blockquote></div>

--0000000000009ab081062bea700d--

--===============0874348195847463686==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0874348195847463686==--
