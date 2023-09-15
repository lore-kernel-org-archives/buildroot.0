Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1274DEED619
	for <buildroot@archiver.kernel.org>; Fri, 15 Sep 2023 16:49:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 89D1160BDE;
	Fri, 15 Sep 2023 16:49:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 89D1160BDE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AYb3NEfecstD; Fri, 15 Sep 2023 16:49:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44D8A60D79;
	Fri, 15 Sep 2023 16:49:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44D8A60D79
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4C9C21BF2CF
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 16:49:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 249D783CBD
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 16:49:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 249D783CBD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hR6DuCmUZfNn for <buildroot@lists.busybox.net>;
 Fri, 15 Sep 2023 16:49:19 +0000 (UTC)
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 711CF83CBC
 for <buildroot@buildroot.org>; Fri, 15 Sep 2023 16:49:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 711CF83CBC
Received: by mail-oi1-x22e.google.com with SMTP id
 5614622812f47-3aca0934e74so1341593b6e.0
 for <buildroot@buildroot.org>; Fri, 15 Sep 2023 09:49:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694796558; x=1695401358;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6FY5LvPQYUH58CAQeogenFGGzbK3mtPf+3oyQBDZeaI=;
 b=wXNp3r9w4gQyhk1CtCBmTe4jNTv8vpyxH/8voDKUlplloOftksMDg4RMmfofK9mKhx
 bI3KAtEJ65oWjvj9rMR2X84z9tiZ4YGPuuZpfeunc3p1aVZe+acvM67axphJaMmxO/75
 7AW5+CFOuPeTRBHNDIkwxYbhhgLBPRY7tuq6wU+R1J3Fkndw/ivgZj/CRb7/LX7h74Lt
 RzO+fXmuO6a+N0eBiLVo+47fvQ7gzQygH6M8qMKs2QI4KIKSObJFxKoRZH6m/L//PhLe
 jFwL2/OHlqLbAtoRl4oZ+iRVr2CzBX1wB41UOVCV8wSLTYSo/Ndp3T/cBkoR2EymVX3j
 6bSg==
X-Gm-Message-State: AOJu0YyrKfS7SyyI+iss1RMy/TeoxPD2e+VN7MPXfFh6x1sZRbPoAsrT
 0TrFM/bUOoKwKvPwB18TuHiGH3/T2vSfI7AHmPJrFbkE
X-Google-Smtp-Source: AGHT+IG2hO9NoaOMuW3Xg0N0pkZXVSErbDH0jtAgfSaqagP1+BB7yh8ujY3v4MTAOz50w5HNuvpIK5EeBELPgx2QNLk=
X-Received: by 2002:a05:6870:828a:b0:1bb:51e4:9483 with SMTP id
 q10-20020a056870828a00b001bb51e49483mr2543417oae.45.1694796558177; Fri, 15
 Sep 2023 09:49:18 -0700 (PDT)
MIME-Version: 1.0
References: <CADYjeSs8Ou5-Kn4zYqAZa-qr7ALbp2xtiksY1vEb6L+D+7guZQ@mail.gmail.com>
 <CADvTj4pZXmewYMzSRF2QJcvRgzV9nA0bLDCrzEt4Yw_vAZEqBQ@mail.gmail.com>
 <CADYjeSv4hOWHjf78ULEszUUFSKbxqTCzb0ZLAw0tNHhA6LfyVg@mail.gmail.com>
 <CADYjeStbPRHh7jge5vU0Z1_5qXUdgVbQCghV2fZ6zSXASP46XQ@mail.gmail.com>
In-Reply-To: <CADYjeStbPRHh7jge5vU0Z1_5qXUdgVbQCghV2fZ6zSXASP46XQ@mail.gmail.com>
From: Sourabh Hegde <hrsourabh011@gmail.com>
Date: Fri, 15 Sep 2023 18:49:06 +0200
Message-ID: <CADYjeStGD0sdj9iT7MDLQG8APoyBFKcLCQEtkcvDz-8WOJ4dcQ@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1694796558; x=1695401358; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6FY5LvPQYUH58CAQeogenFGGzbK3mtPf+3oyQBDZeaI=;
 b=CEXmR+4kUYwJZBIsA1lfzRFfY2iVt3IGR581o8MADfIz+fkeTQ0PaG5YGJLzd6HFyd
 G6UuH/ypOoh4mtRepFu4Q8oIgHABNjg5YeM4z5vQQJKwgbQAjxtSgJzySqbm5A/uSeG9
 RtK/tZBinGOFaLU52r8mR7nC5ecnGJvychkmgBXJBVBvRtk2NGCDLKpMrG54R50jjdcm
 6TgvAfyP6aPqGN18Z1KzkM0KuzDfFmH3l64jWnKcpQDlvWY4zxQS//cH91T4qHnSCbBk
 deQ1ZN/IQXTQJBAU13tzhKa8+frbiBG0iE7BsbYDAZPYZx+ZbcMqZ6oNQYjtxu6qNIEi
 exhA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=CEXmR+4k
Subject: Re: [Buildroot] Error while building tensorflow-lite package
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
Cc: buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============0072026523721295541=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0072026523721295541==
Content-Type: multipart/alternative; boundary="000000000000d122760605689278"

--000000000000d122760605689278
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello James,

Do you have any updates on below issue?
This would be helpful

Thanks in advance

On Wed, Sep 13, 2023, 09:07 Sourabh Hegde <hrsourabh011@gmail.com> wrote:

> Hello James,
>
> I am trying to build the "benchmark_model" in the tensorflow-lite package=
.
> The benchmarking application performs a simple TensorFlow Lite model
> inference and prints benchmarking information.
>
> In the tensorflow-lite.mk  I added new section (similar to label_image
> example)
> ifeq ($(BR2_PACKAGE_TENSORFLOW_LITE_BUILD_BENCHMARK_MODEL),y)
> define TENSORFLOW_LITE_BENCHMARK_BUILD_CMDS
>         $(TARGET_MAKE_ENV) $(BR2_CMAKE) --build
> $(TENSORFLOW_LITE_BUILDDIR) -t benchmark_model
> endef
> TENSORFLOW_LITE_POST_BUILD_HOOKS +=3D TENSORFLOW_LITE_BENCHMARK_BUILD_CMD=
S
>
> define TENSORFLOW_LITE_INSTALL_TARGET_BENCHMARK_MODEL
>          $(INSTALL) -D -m0755
> $(@D)/tensorflow/lite/buildroot-build/tools/benchmark/benchmark_model
> $(TARGET_DIR)/usr/bin/benchmark_model
> endef
> TENSORFLOW_LITE_POST_INSTALL_TARGET_HOOKS +=3D
> TENSORFLOW_LITE_INSTALL_TARGET_BENCHMARK_MODEL
> endif
>
> But while building this is giving error:
>
> [ 98%] Building CXX object
> tools/benchmark/CMakeFiles/benchmark_model.dir/__/delegates/xnnpack_deleg=
ate_provider.cc.o
> 2023-09-13T06:49:10 [ 98%] Building CXX object
> tools/benchmark/CMakeFiles/benchmark_model.dir/__/delegates/external_dele=
gate_provider.cc.o
> 2023-09-13T06:49:11 [100%] Linking CXX executable benchmark_model
> 2023-09-13T06:49:11
> /home/.../per-package/tensorflow-lite/host/opt/ext-toolchain/bin/../lib/g=
cc/aarch64-buildroot-linux-gnu/10.3.0/../../../../aarch64-buildroot-linux-g=
nu/bin/ld:
> CMakeFiles/benchmark_model.dir/benchmark_tflite_model.cc.o: in function
> `absl::lts_20211102::strings_internal::Splitter<absl::lts_20211102::ByCha=
r,
> absl::lts_20211102::AllowEmpty, std::basic_string_view<char,
> std::char_traits<char> >
> >::ConvertToContainer<std::vector<std::basic_string_view<char,
> std::char_traits<char> >, std::allocator<std::basic_string_view<char,
> std::char_traits<char> > > >, std::basic_string_view<char,
> std::char_traits<char> >,
> false>::operator()(absl::lts_20211102::strings_internal::Splitter<absl::l=
ts_20211102::ByChar,
> absl::lts_20211102::AllowEmpty, std::basic_string_view<char,
> std::char_traits<char> > > const&) const [clone .isra.0]':
> 2023-09-13T06:49:11 benchmark_tflite_model.cc:(.text+0x204): undefined
> reference to `absl::lts_20211102::ByChar::Find(std::basic_string_view<cha=
r,
> std::char_traits<char> >, unsigned long) const'
> 2023-09-13T06:49:11
> /home/.../per-package/tensorflow-lite/host/opt/ext-toolchain/bin/../lib/g=
cc/aarch64-buildroot-linux-gnu/10.3.0/../../../../aarch64-buildroot-linux-g=
nu/bin/ld:
> benchmark_tflite_model.cc:(.text+0x284): undefined reference to
> `absl::lts_20211102::ByChar::Find(std::basic_string_view<char,
> std::char_traits<char> >, unsigned long) const'
> 2023-09-13T06:49:11
> /home/.../per-package/tensorflow-lite/host/opt/ext-toolchain/bin/../lib/g=
cc/aarch64-buildroot-linux-gnu/10.3.0/../../../../aarch64-buildroot-linux-g=
nu/bin/ld:
> CMakeFiles/benchmark_model.dir/benchmark_tflite_model.cc.o: in function
> `tflite::benchmark::SplitInputLayerNameAndValueFile(std::__cxx11::basic_s=
tring<char,
> std::char_traits<char>, std::allocator<char> > const&,
> std::pair<std::__cxx11::basic_string<char, std::char_traits<char>,
> std::allocator<char> >, std::__cxx11::basic_string<char,
> std::char_traits<char>, std::allocator<char> > >&)':
> 2023-09-13T06:49:11 benchmark_tflite_model.cc:(.text+0xcf0): undefined
> reference to
> `absl::lts_20211102::StrReplaceAll[abi:cxx11](std::basic_string_view<char=
,
> std::char_traits<char> >,
> std::initializer_list<std::pair<std::basic_string_view<char,
> std::char_traits<char> >, std::basic_string_view<char,
> std::char_traits<char> > > >)'
> 2023-09-13T06:49:11
> /home/.../per-package/tensorflow-lite/host/opt/ext-toolchain/bin/../lib/g=
cc/aarch64-buildroot-linux-gnu/10.3.0/../../../../aarch64-buildroot-linux-g=
nu/bin/ld:
> benchmark_tflite_model.cc:(.text+0xdd4): undefined reference to
> `absl::lts_20211102::StrReplaceAll[abi:cxx11](std::basic_string_view<char=
,
> std::char_traits<char> >,
> std::initializer_list<std::pair<std::basic_string_view<char,
> std::char_traits<char> >, std::basic_string_view<char,
> std::char_traits<char> > > >)'
> 2023-09-13T06:49:11
> /home/.../per-package/tensorflow-lite/host/opt/ext-toolchain/bin/../lib/g=
cc/aarch64-buildroot-linux-gnu/10.3.0/../../../../aarch64-buildroot-linux-g=
nu/bin/ld:
> CMakeFiles/benchmark_model.dir/benchmark_tflite_model.cc.o: in function
> `tflite::benchmark::BenchmarkTfLiteModel::ValidateParams()':
> 2023-09-13T06:49:11 benchmark_tflite_model.cc:(.text+0x8388): undefined
> reference to
> `absl::lts_20211102::numbers_internal::safe_strto32_base(std::basic_strin=
g_view<char,
> std::char_traits<char> >, int*, int)'
> 2023-09-13T06:49:11
> /home/.../per-package/tensorflow-lite/host/opt/ext-toolchain/bin/../lib/g=
cc/aarch64-buildroot-linux-gnu/10.3.0/../../../../aarch64-buildroot-linux-g=
nu/bin/ld:
> benchmark_tflite_model.cc:(.text+0x83a4): undefined reference to
> `absl::lts_20211102::numbers_internal::safe_strto32_base(std::basic_strin=
g_view<char,
> std::char_traits<char> >, int*, int)'
> 2023-09-13T06:49:11 collect2: error: ld returned 1 exit status
> 2023-09-13T06:49:11 make[6]: ***
> [tools/benchmark/CMakeFiles/benchmark_model.dir/build.make:476:
> tools/benchmark/benchmark_model] Error 1
> 2023-09-13T06:49:11 make[5]: *** [CMakeFiles/Makefile2:370:
> tools/benchmark/CMakeFiles/benchmark_model.dir/all] Error 2
> 2023-09-13T06:49:11 make[4]: *** [CMakeFiles/Makefile2:377:
> tools/benchmark/CMakeFiles/benchmark_model.dir/rule] Error 2
> 2023-09-13T06:49:11 make[3]: *** [Makefile:268: benchmark_model] Error 2
>
> Do you know what the issue here?
>
> Thank you,
> Sourabh
>
> On Tue, 5 Sept 2023 at 18:28, Sourabh Hegde <hrsourabh011@gmail.com>
> wrote:
>
>> Hello James,
>>
>> Thanks for the update.
>>
>> I could build the tensorflow-lite package.
>>
>> Best Regards,
>> Sourabh
>>
>>
>>
>> On Tue, 5 Sept 2023 at 08:07, James Hilliard <james.hilliard1@gmail.com>
>> wrote:
>>
>>> On Mon, Sep 4, 2023 at 11:13=E2=80=AFAM Sourabh Hegde <hrsourabh011@gma=
il.com>
>>> wrote:
>>> >
>>> > Hello All,
>>> >
>>> > I am trying to add tensorflow-lite to Buildroot package and I found a
>>> git (quite old)
>>> https://github.com/Exein-io/buildroot-tensorflow-lite/tree/master that
>>> I wanted to test.
>>>
>>> Try my v6 patch series:
>>>
>>> https://patchwork.ozlabs.org/project/buildroot/list/?series=3D346546&su=
bmitter=3D&state=3D*&q=3D&archive=3Dboth&delegate=3D
>>>
>>> > But while building it I am getting below error:
>>> >
>>> >
>>> file=3D'/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497=
c68cc4b2ba991967dd/tensorflow/lite/buildroot-build/pthreadpool-download/pth=
readpool-prefix/src/545ebe9f225aec6dca49109516fac02e973a3de2.zip'
>>> > -- Downloading... done
>>> > -- extracting...
>>> >
>>> src=3D'/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c=
68cc4b2ba991967dd/tensorflow/lite/buildroot-build/pthreadpool-download/pthr=
eadpool-prefix/src/545ebe9f225aec6dca49109516fac02e973a3de2.zip'
>>> >
>>> dst=3D'/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c=
68cc4b2ba991967dd/tensorflow/lite/buildroot-build/pthreadpool-source'
>>> > -- extracting... [tar xfz]
>>> > -- extracting... [analysis]
>>> > -- extracting... [rename]
>>> > -- extracting... [clean up]
>>> > -- extracting... done
>>> > [ 33%] No patch step for 'pthreadpool'
>>> > [ 44%] No update step for 'pthreadpool'
>>> > [ 55%] No configure step for 'pthreadpool'
>>> > [ 66%] No build step for 'pthreadpool'
>>> > [ 77%] No install step for 'pthreadpool'
>>> > [ 88%] No test step for 'pthreadpool'
>>> > [100%] Completed 'pthreadpool'
>>> > make[4]: Leaving directory
>>> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b=
2ba991967dd/tensorflow/lite/buildroot-build/pthreadpool-download'
>>> > [100%] Built target pthreadpool
>>> > make[3]: Leaving directory
>>> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b=
2ba991967dd/tensorflow/lite/buildroot-build/pthreadpool-download'
>>> > make[2]: Leaving directory
>>> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b=
2ba991967dd/tensorflow/lite/buildroot-build/pthreadpool-download'
>>> > -- Configuring incomplete, errors occurred!
>>> > See also
>>> "/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b=
2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeOutput.log".
>>> > See also
>>> "/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b=
2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeError.log".
>>> > make[1]: *** [package/pkg-generic.mk:283:
>>> /home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2=
ba991967dd/.stamp_configured]
>>> Error 1
>>> > make: *** [Makefile:23: _all] Error 2
>>> >
>>> > The CMakeError.log
>>> build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorfl=
ow/lite/buildroot-build/CM
>>> > akeFiles shows
>>> >
>>> > Performing C++ SOURCE FILE Test COMPILER_SUPPORT_Wshorten64to32 faile=
d
>>> with the following output:
>>> > Change Dir:
>>> /home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2=
ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp
>>> >
>>> > Run Build Command(s):/usr/bin/make cmTC_76002/fast && make[2]:
>>> Entering directory
>>> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b=
2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
>>> > /usr/bin/make -f CMakeFiles/cmTC_76002.dir/build.make
>>> CMakeFiles/cmTC_76002.dir/build
>>> > make[3]: Entering directory
>>> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b=
2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
>>> > Building CXX object CMakeFiles/cmTC_76002.dir/src.cxx.o
>>> >
>>> /home/test/tmp/.../per-package/tensorflow-lite/host/bin/aarch64-linux-g=
++
>>> --sysroot=3D/home/test/tmp/.../per-package/tensorflow-lite/host/aarch64=
-buildroot-linux-gnu/sysroot
>>>   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64  -=
O3 -g0
>>> -D_FORTIFY_SOURCE=3D2 -ldl -latomic -funsafe-math-optimizations
>>> -march=3Darmv8-a -std=3Dc++03 -pedantic -Wall -Wextra -Wundef -Wcast-al=
ign
>>> -Wchar-subscripts -Wnon-virtual-dtor -Wunused-local-typedefs
>>> -Wpointer-arith -Wwrite-strings -Wformat-security
>>> -DCOMPILER_SUPPORT_Wshorten64to32 -Werror  -DNDEBUG -fPIE
>>>  -Wshorten-64-to-32 -o CMakeFiles/cmTC_76002.dir/src.cxx.o -c
>>> /home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2=
ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp/src.cxx
>>> > aarch64-linux-g++.br_real: error: unrecognized command-line option
>>> '-Wshorten-64-to-32'
>>> > make[3]: *** [CMakeFiles/cmTC_76002.dir/build.make:66:
>>> CMakeFiles/cmTC_76002.dir/src.cxx.o] Error 1
>>> > make[3]: Leaving directory
>>> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b=
2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
>>> > make[2]: *** [Makefile:121: cmTC_76002/fast] Error 2
>>> > make[2]: Leaving directory
>>> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b=
2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
>>> >
>>> >
>>> > Source file was:
>>> > int main() { return 0; }
>>> > Performing C++ SOURCE FILE Test COMPILER_SUPPORT_Wcpp11extensions
>>> failed with the following output:
>>> > Change Dir:
>>> /home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2=
ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp
>>> >
>>> > Run Build Command(s):/usr/bin/make cmTC_0b14f/fast && make[2]:
>>> Entering directory
>>> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b=
2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
>>> > /usr/bin/make -f CMakeFiles/cmTC_0b14f.dir/build.make
>>> CMakeFiles/cmTC_0b14f.dir/build
>>> > make[3]: Entering directory
>>> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b=
2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
>>> > Building CXX object CMakeFiles/cmTC_0b14f.dir/src.cxx.o
>>> >
>>> /home/test/tmp/.../per-package/tensorflow-lite/host/bin/aarch64-linux-g=
++
>>> --sysroot=3D/home/test/tmp/.../per-package/tensorflow-lite/host/aarch64=
-buildroot-linux-gnu/sysroot
>>>   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64  -=
O3 -g0
>>> -D_FORTIFY_SOURCE=3D2 -ldl -latomic -funsafe-math-optimizations
>>> -march=3Darmv8-a -std=3Dc++03 -pedantic -Wall -Wextra -Wundef -Wcast-al=
ign
>>> -Wchar-subscripts -Wnon-virtual-dtor -Wunused-local-typedefs
>>> -Wpointer-arith -Wwrite-strings -Wformat-security -Wlogical-op
>>> -Wenum-conversion -DCOMPILER_SUPPORT_Wcpp11extensions -Werror  -DNDEBUG
>>> -fPIE   -Wc++11-extensions -o CMakeFiles/cmTC_0b14f.dir/src.cxx.o -c
>>> /home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2=
ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp/src.cxx
>>> > aarch64-linux-g++.br_real: error: unrecognized command-line option
>>> '-Wc++11-extensions'; did you mean '-fms-extensions'?
>>> > make[3]: *** [CMakeFiles/cmTC_0b14f.dir/build.make:66:
>>> CMakeFiles/cmTC_0b14f.dir/src.cxx.o] Error 1
>>> > make[3]: Leaving directory
>>> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b=
2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
>>> > make[2]: *** [Makefile:121: cmTC_0b14f/fast] Error 2
>>> > make[2]: Leaving directory
>>> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b=
2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
>>> >
>>> >
>>> > Source file was:
>>> > int main() { return 0; }
>>> > Performing C++ SOURCE FILE Test COMPILER_SUPPORT_wd981 failed with th=
e
>>> following output:
>>> > Change Dir:
>>> /home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2=
ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp
>>> >
>>> > Run Build Command(s):/usr/bin/make cmTC_4c191/fast && make[2]:
>>> Entering directory
>>> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b=
2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
>>> > /usr/bin/make -f CMakeFiles/cmTC_4c191.dir/build.make
>>> CMakeFiles/cmTC_4c191.dir/build
>>> > make[3]: Entering directory
>>> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b=
2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
>>> > Building CXX object CMakeFiles/cmTC_4c191.dir/src.cxx.o
>>> >
>>> /home/test/tmp/.../per-package/tensorflow-lite/host/bin/aarch64-linux-g=
++
>>> --sysroot=3D/home/test/tmp/.../per-package/tensorflow-lite/host/aarch64=
-buildroot-linux-gnu/sysroot
>>>   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64  -=
O3 -g0
>>> -D_FORTIFY_SOURCE=3D2 -ldl -latomic -funsafe-math-optimizations
>>> -march=3Darmv8-a -std=3Dc++03 -pedantic -Wall -Wextra -Wundef -Wcast-al=
ign
>>> -Wchar-subscripts -Wnon-virtual-dtor -Wunused-local-typedefs
>>> -Wpointer-arith -Wwrite-strings -Wformat-security -Wlogical-op
>>> -Wenum-conversion -Wdouble-promotion -Wshadow -Wno-psabi
>>> -Wno-variadic-macros -Wno-long-long -fno-check-new -fno-common
>>> -fstrict-aliasing -DCOMPILER_SUPPORT_wd981 -Werror  -DNDEBUG -fPIE   -w=
d981
>>> -o CMakeFiles/cmTC_4c191.dir/src.cxx.o -c
>>> /home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2=
ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp/src.cxx
>>> > aarch64-linux-g++.br_real: error: unrecognized command-line option
>>> '-wd981'
>>> > make[3]: *** [CMakeFiles/cmTC_4c191.dir/build.make:66:
>>> CMakeFiles/cmTC_4c191.dir/src.cxx.o] Error 1
>>> > make[3]: Leaving directory
>>> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b=
2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
>>> > make[2]: *** [Makefile:121: cmTC_4c191/fast] Error 2
>>> > make[2]: Leaving directory
>>> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b=
2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
>>> >
>>> >
>>> > Source file was:
>>> > int main() { return 0; }
>>> > Performing C++ SOURCE FILE Test COMPILER_SUPPORT_wd2304 failed with
>>> the following output:
>>> > Change Dir:
>>> /home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2=
ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp
>>> >
>>> > Run Build Command(s):/usr/bin/make cmTC_3d2da/fast && make[2]:
>>> Entering directory
>>> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b=
2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
>>> > /usr/bin/make -f CMakeFiles/cmTC_3d2da.dir/build.make
>>> CMakeFiles/cmTC_3d2da.dir/build
>>> > make[3]: Entering directory
>>> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b=
2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
>>> > Building CXX object CMakeFiles/cmTC_3d2da.dir/src.cxx.o
>>> >
>>> /home/test/tmp/.../per-package/tensorflow-lite/host/bin/aarch64-linux-g=
++
>>> --sysroot=3D/home/test/tmp/.../per-package/tensorflow-lite/host/aarch64=
-buildroot-linux-gnu/sysroot
>>>   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64  -=
O3 -g0
>>> -D_FORTIFY_SOURCE=3D2 -ldl -latomic -funsafe-math-optimizations
>>> -march=3Darmv8-a -std=3Dc++03 -pedantic -Wall -Wextra -Wundef -Wcast-al=
ign
>>> -Wchar-subscripts -Wnon-virtual-dtor -Wunused-local-typedefs
>>> -Wpointer-arith -Wwrite-strings -Wformat-security -Wlogical-op
>>> -Wenum-conversion -Wdouble-promotion -Wshadow -Wno-psabi
>>> -Wno-variadic-macros -Wno-long-long -fno-check-new -fno-common
>>> -fstrict-aliasing -DCOMPILER_SUPPORT_wd2304 -Werror  -DNDEBUG -fPIE
>>>  -wd2304 -o CMakeFiles/cmTC_3d2da.dir/src.cxx.o -c
>>> /home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2=
ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp/src.cxx
>>> > aarch64-linux-g++.br_real: error: unrecognized command-line option
>>> '-wd2304'
>>> > make[3]: *** [CMakeFiles/cmTC_3d2da.dir/build.make:66:
>>> CMakeFiles/cmTC_3d2da.dir/src.cxx.o] Error 1
>>> > make[3]: Leaving directory
>>> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b=
2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
>>> > make[2]: *** [Makefile:121: cmTC_3d2da/fast] Error 2
>>> > make[2]: Leaving directory
>>> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b=
2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
>>> >
>>> >
>>> > Source file was:
>>> > int main() { return 0; }
>>> > Performing C++ SOURCE FILE Test COMPILER_SUPPORT_STRICTANSI failed
>>> with the following output:
>>> > Change Dir:
>>> /home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2=
ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp
>>> >
>>> > Run Build Command(s):/usr/bin/make cmTC_b2340/fast && make[2]:
>>> Entering directory
>>> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b=
2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
>>> > /usr/bin/make -f CMakeFiles/cmTC_b2340.dir/build.make
>>> CMakeFiles/cmTC_b2340.dir/build
>>> > make[3]: Entering directory
>>> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b=
2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
>>> > Building CXX object CMakeFiles/cmTC_b2340.dir/src.cxx.o
>>> >
>>> /home/test/tmp/.../per-package/tensorflow-lite/host/bin/aarch64-linux-g=
++
>>> --sysroot=3D/home/test/tmp/.../per-package/tensorflow-lite/host/aarch64=
-buildroot-linux-gnu/sysroot
>>>   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64  -=
O3 -g0
>>> -D_FORTIFY_SOURCE=3D2 -ldl -latomic -funsafe-math-optimizations
>>> -march=3Darmv8-a -std=3Dc++03 -pedantic -Wall -Wextra -Wundef -Wcast-al=
ign
>>> -Wchar-subscripts -Wnon-virtual-dtor -Wunused-local-typedefs
>>> -Wpointer-arith -Wwrite-strings -Wformat-security -Wlogical-op
>>> -Wenum-conversion -Wdouble-promotion -Wshadow -Wno-psabi
>>> -Wno-variadic-macros -Wno-long-long -fno-check-new -fno-common
>>> -fstrict-aliasing -DCOMPILER_SUPPORT_STRICTANSI -Werror  -DNDEBUG -fPIE
>>>  -strict-ansi -o CMakeFiles/cmTC_b2340.dir/src.cxx.o -c
>>> /home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2=
ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp/src.cxx
>>> > aarch64-linux-g++.br_real: error: unrecognized command-line option
>>> '-strict-ansi'; did you mean '-fstrict-enums'?
>>> > make[3]: *** [CMakeFiles/cmTC_b2340.dir/build.make:66:
>>> CMakeFiles/cmTC_b2340.dir/src.cxx.o] Error 1
>>> > make[3]: Leaving directory
>>> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b=
2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
>>> > make[2]: *** [Makefile:121: cmTC_b2340/fast] Error 2
>>> > make[2]: Leaving directory
>>> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b=
2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
>>> >
>>> > Can anyone please let me know what could be an issue and how to
>>> resolve it?
>>> >
>>> > Thanks in advance
>>> >
>>> > _______________________________________________
>>> > buildroot mailing list
>>> > buildroot@buildroot.org
>>> > https://lists.buildroot.org/mailman/listinfo/buildroot
>>>
>>

--000000000000d122760605689278
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hello James,</div><div dir=3D"auto"><br></div><div d=
ir=3D"auto">Do you have any updates on below issue?=C2=A0</div><div dir=3D"=
auto">This would be helpful</div><div dir=3D"auto"><br></div><div dir=3D"au=
to">Thanks in advance</div><div dir=3D"auto"><br><div class=3D"gmail_quote"=
 dir=3D"auto"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 13, 2023, 0=
9:07 Sourabh Hegde &lt;<a href=3D"mailto:hrsourabh011@gmail.com">hrsourabh0=
11@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div di=
r=3D"ltr">Hello James,<div><br></div><div>I am trying to build the &quot;be=
nchmark_model&quot; in the tensorflow-lite package. The benchmarking applic=
ation performs a simple TensorFlow Lite model inference and prints benchmar=
king information.</div><div><br></div><div>In the <a href=3D"http://tensorf=
low-lite.mk" target=3D"_blank" rel=3D"noreferrer">tensorflow-lite.mk</a>=C2=
=A0 I added new section (similar to label_image example)<br></div><div>ifeq=
 ($(BR2_PACKAGE_TENSORFLOW_LITE_BUILD_BENCHMARK_MODEL),y)<br>define TENSORF=
LOW_LITE_BENCHMARK_BUILD_CMDS<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(TARGET_MAKE_=
ENV) $(BR2_CMAKE) --build $(TENSORFLOW_LITE_BUILDDIR) -t benchmark_model<br=
>endef<br>TENSORFLOW_LITE_POST_BUILD_HOOKS +=3D TENSORFLOW_LITE_BENCHMARK_B=
UILD_CMDS<br><br></div><div>define TENSORFLOW_LITE_INSTALL_TARGET_BENCHMARK=
_MODEL<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -D -m0755 $(@D)/tens=
orflow/lite/buildroot-build/tools/benchmark/benchmark_model $(TARGET_DIR)/u=
sr/bin/benchmark_model<br>endef<br>TENSORFLOW_LITE_POST_INSTALL_TARGET_HOOK=
S +=3D TENSORFLOW_LITE_INSTALL_TARGET_BENCHMARK_MODEL<br>endif<br></div><di=
v><br></div><div>But while building this is giving error:</div><div><br></d=
iv><div>[ 98%] Building CXX object tools/benchmark/CMakeFiles/benchmark_mod=
el.dir/__/delegates/xnnpack_delegate_provider.cc.o<br>2023-09-13T06:49:10 [=
 98%] Building CXX object tools/benchmark/CMakeFiles/benchmark_model.dir/__=
/delegates/external_delegate_provider.cc.o<br>2023-09-13T06:49:11 [100%] Li=
nking CXX executable benchmark_model<br>2023-09-13T06:49:11 /home/.../per-p=
ackage/tensorflow-lite/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-buildr=
oot-linux-gnu/10.3.0/../../../../aarch64-buildroot-linux-gnu/bin/ld: CMakeF=
iles/benchmark_model.dir/benchmark_tflite_model.cc.o: in function `absl::lt=
s_20211102::strings_internal::Splitter&lt;absl::lts_20211102::ByChar, absl:=
:lts_20211102::AllowEmpty, std::basic_string_view&lt;char, std::char_traits=
&lt;char&gt; &gt; &gt;::ConvertToContainer&lt;std::vector&lt;std::basic_str=
ing_view&lt;char, std::char_traits&lt;char&gt; &gt;, std::allocator&lt;std:=
:basic_string_view&lt;char, std::char_traits&lt;char&gt; &gt; &gt; &gt;, st=
d::basic_string_view&lt;char, std::char_traits&lt;char&gt; &gt;, false&gt;:=
:operator()(absl::lts_20211102::strings_internal::Splitter&lt;absl::lts_202=
11102::ByChar, absl::lts_20211102::AllowEmpty, std::basic_string_view&lt;ch=
ar, std::char_traits&lt;char&gt; &gt; &gt; const&amp;) const [clone .isra.0=
]&#39;:<br>2023-09-13T06:49:11 benchmark_tflite_model.cc:(.text+0x204): und=
efined reference to `absl::lts_20211102::ByChar::Find(std::basic_string_vie=
w&lt;char, std::char_traits&lt;char&gt; &gt;, unsigned long) const&#39;<br>=
2023-09-13T06:49:11 /home/.../per-package/tensorflow-lite/host/opt/ext-tool=
chain/bin/../lib/gcc/aarch64-buildroot-linux-gnu/10.3.0/../../../../aarch64=
-buildroot-linux-gnu/bin/ld: benchmark_tflite_model.cc:(.text+0x284): undef=
ined reference to `absl::lts_20211102::ByChar::Find(std::basic_string_view&=
lt;char, std::char_traits&lt;char&gt; &gt;, unsigned long) const&#39;<br>20=
23-09-13T06:49:11 /home/.../per-package/tensorflow-lite/host/opt/ext-toolch=
ain/bin/../lib/gcc/aarch64-buildroot-linux-gnu/10.3.0/../../../../aarch64-b=
uildroot-linux-gnu/bin/ld: CMakeFiles/benchmark_model.dir/benchmark_tflite_=
model.cc.o: in function `tflite::benchmark::SplitInputLayerNameAndValueFile=
(std::__cxx11::basic_string&lt;char, std::char_traits&lt;char&gt;, std::all=
ocator&lt;char&gt; &gt; const&amp;, std::pair&lt;std::__cxx11::basic_string=
&lt;char, std::char_traits&lt;char&gt;, std::allocator&lt;char&gt; &gt;, st=
d::__cxx11::basic_string&lt;char, std::char_traits&lt;char&gt;, std::alloca=
tor&lt;char&gt; &gt; &gt;&amp;)&#39;:<br>2023-09-13T06:49:11 benchmark_tfli=
te_model.cc:(.text+0xcf0): undefined reference to `absl::lts_20211102::StrR=
eplaceAll[abi:cxx11](std::basic_string_view&lt;char, std::char_traits&lt;ch=
ar&gt; &gt;, std::initializer_list&lt;std::pair&lt;std::basic_string_view&l=
t;char, std::char_traits&lt;char&gt; &gt;, std::basic_string_view&lt;char, =
std::char_traits&lt;char&gt; &gt; &gt; &gt;)&#39;<br>2023-09-13T06:49:11 /h=
ome/.../per-package/tensorflow-lite/host/opt/ext-toolchain/bin/../lib/gcc/a=
arch64-buildroot-linux-gnu/10.3.0/../../../../aarch64-buildroot-linux-gnu/b=
in/ld: benchmark_tflite_model.cc:(.text+0xdd4): undefined reference to `abs=
l::lts_20211102::StrReplaceAll[abi:cxx11](std::basic_string_view&lt;char, s=
td::char_traits&lt;char&gt; &gt;, std::initializer_list&lt;std::pair&lt;std=
::basic_string_view&lt;char, std::char_traits&lt;char&gt; &gt;, std::basic_=
string_view&lt;char, std::char_traits&lt;char&gt; &gt; &gt; &gt;)&#39;<br>2=
023-09-13T06:49:11 /home/.../per-package/tensorflow-lite/host/opt/ext-toolc=
hain/bin/../lib/gcc/aarch64-buildroot-linux-gnu/10.3.0/../../../../aarch64-=
buildroot-linux-gnu/bin/ld: CMakeFiles/benchmark_model.dir/benchmark_tflite=
_model.cc.o: in function `tflite::benchmark::BenchmarkTfLiteModel::Validate=
Params()&#39;:<br>2023-09-13T06:49:11 benchmark_tflite_model.cc:(.text+0x83=
88): undefined reference to `absl::lts_20211102::numbers_internal::safe_str=
to32_base(std::basic_string_view&lt;char, std::char_traits&lt;char&gt; &gt;=
, int*, int)&#39;<br>2023-09-13T06:49:11 /home/.../per-package/tensorflow-l=
ite/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-buildroot-linux-gnu/10.3.=
0/../../../../aarch64-buildroot-linux-gnu/bin/ld: benchmark_tflite_model.cc=
:(.text+0x83a4): undefined reference to `absl::lts_20211102::numbers_intern=
al::safe_strto32_base(std::basic_string_view&lt;char, std::char_traits&lt;c=
har&gt; &gt;, int*, int)&#39;<br>2023-09-13T06:49:11 collect2: error: ld re=
turned 1 exit status<br>2023-09-13T06:49:11 make[6]: *** [tools/benchmark/C=
MakeFiles/benchmark_model.dir/build.make:476: tools/benchmark/benchmark_mod=
el] Error 1<br>2023-09-13T06:49:11 make[5]: *** [CMakeFiles/Makefile2:370: =
tools/benchmark/CMakeFiles/benchmark_model.dir/all] Error 2<br>2023-09-13T0=
6:49:11 make[4]: *** [CMakeFiles/Makefile2:377: tools/benchmark/CMakeFiles/=
benchmark_model.dir/rule] Error 2<br>2023-09-13T06:49:11 make[3]: *** [Make=
file:268: benchmark_model] Error 2<br></div><div><br></div><div>Do you know=
 what the issue here?</div><div><br></div><div>Thank you,</div><div>Sourabh=
</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_=
attr">On Tue, 5 Sept 2023 at 18:28, Sourabh Hegde &lt;<a href=3D"mailto:hrs=
ourabh011@gmail.com" target=3D"_blank" rel=3D"noreferrer">hrsourabh011@gmai=
l.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex"><div dir=3D"ltr">Hello James,<div><br></div><div>Thanks for the update=
.</div><div><br></div><div>I could build the tensorflow-lite package.</div>=
<div><br></div><div>Best Regards,</div><div>Sourabh</div><div><br></div><di=
v>=C2=A0</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, 5 Sept 2023 at 08:07, James Hilliard &lt;<a href=3D=
"mailto:james.hilliard1@gmail.com" target=3D"_blank" rel=3D"noreferrer">jam=
es.hilliard1@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">On Mon, Sep 4, 2023 at 11:13=E2=80=AFAM Sourabh Hegde=
 &lt;<a href=3D"mailto:hrsourabh011@gmail.com" target=3D"_blank" rel=3D"nor=
eferrer">hrsourabh011@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hello All,<br>
&gt;<br>
&gt; I am trying to add tensorflow-lite to Buildroot package and I found a =
git (quite old) <a href=3D"https://github.com/Exein-io/buildroot-tensorflow=
-lite/tree/master" rel=3D"noreferrer noreferrer" target=3D"_blank">https://=
github.com/Exein-io/buildroot-tensorflow-lite/tree/master</a> that I wanted=
 to test.<br>
<br>
Try my v6 patch series:<br>
<a href=3D"https://patchwork.ozlabs.org/project/buildroot/list/?series=3D34=
6546&amp;submitter=3D&amp;state=3D*&amp;q=3D&amp;archive=3Dboth&amp;delegat=
e=3D" rel=3D"noreferrer noreferrer" target=3D"_blank">https://patchwork.ozl=
abs.org/project/buildroot/list/?series=3D346546&amp;submitter=3D&amp;state=
=3D*&amp;q=3D&amp;archive=3Dboth&amp;delegate=3D</a><br>
<br>
&gt; But while building it I am getting below error:<br>
&gt;<br>
&gt; file=3D&#39;/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b=
0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-build/pthreadpool-downloa=
d/pthreadpool-prefix/src/545ebe9f225aec6dca49109516fac02e973a3de2.zip&#39;<=
br>
&gt; -- Downloading... done<br>
&gt; -- extracting...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 src=3D&#39;/home/test/tmp/.../build/tensorflow-lit=
e-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-build/=
pthreadpool-download/pthreadpool-prefix/src/545ebe9f225aec6dca49109516fac02=
e973a3de2.zip&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 dst=3D&#39;/home/test/tmp/.../build/tensorflow-lit=
e-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-build/=
pthreadpool-source&#39;<br>
&gt; -- extracting... [tar xfz]<br>
&gt; -- extracting... [analysis]<br>
&gt; -- extracting... [rename]<br>
&gt; -- extracting... [clean up]<br>
&gt; -- extracting... done<br>
&gt; [ 33%] No patch step for &#39;pthreadpool&#39;<br>
&gt; [ 44%] No update step for &#39;pthreadpool&#39;<br>
&gt; [ 55%] No configure step for &#39;pthreadpool&#39;<br>
&gt; [ 66%] No build step for &#39;pthreadpool&#39;<br>
&gt; [ 77%] No install step for &#39;pthreadpool&#39;<br>
&gt; [ 88%] No test step for &#39;pthreadpool&#39;<br>
&gt; [100%] Completed &#39;pthreadpool&#39;<br>
&gt; make[4]: Leaving directory &#39;/home/test/tmp/.../build/tensorflow-li=
te-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-build=
/pthreadpool-download&#39;<br>
&gt; [100%] Built target pthreadpool<br>
&gt; make[3]: Leaving directory &#39;/home/test/tmp/.../build/tensorflow-li=
te-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-build=
/pthreadpool-download&#39;<br>
&gt; make[2]: Leaving directory &#39;/home/test/tmp/.../build/tensorflow-li=
te-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-build=
/pthreadpool-download&#39;<br>
&gt; -- Configuring incomplete, errors occurred!<br>
&gt; See also &quot;/home/test/tmp/.../build/tensorflow-lite-9663abe4c90370=
30b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMake=
Output.log&quot;.<br>
&gt; See also &quot;/home/test/tmp/.../build/tensorflow-lite-9663abe4c90370=
30b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMake=
Error.log&quot;.<br>
&gt; make[1]: *** [package/<a href=3D"http://pkg-generic.mk:283" rel=3D"nor=
eferrer noreferrer" target=3D"_blank">pkg-generic.mk:283</a>: /home/test/tm=
p/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/.stamp=
_configured] Error 1<br>
&gt; make: *** [Makefile:23: _all] Error 2<br>
&gt;<br>
&gt; The CMakeError.log build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b=
2ba991967dd/tensorflow/lite/buildroot-build/CM<br>
&gt; akeFiles shows<br>
&gt;<br>
&gt; Performing C++ SOURCE FILE Test COMPILER_SUPPORT_Wshorten64to32 failed=
 with the following output:<br>
&gt; Change Dir: /home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b=
0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp=
<br>
&gt;<br>
&gt; Run Build Command(s):/usr/bin/make cmTC_76002/fast &amp;&amp; make[2]:=
 Entering directory &#39;/home/test/tmp/.../build/tensorflow-lite-9663abe4c=
9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/=
CMakeTmp&#39;<br>
&gt; /usr/bin/make -f CMakeFiles/cmTC_76002.dir/build.make CMakeFiles/cmTC_=
76002.dir/build<br>
&gt; make[3]: Entering directory &#39;/home/test/tmp/.../build/tensorflow-l=
ite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-buil=
d/CMakeFiles/CMakeTmp&#39;<br>
&gt; Building CXX object CMakeFiles/cmTC_76002.dir/src.cxx.o<br>
&gt; /home/test/tmp/.../per-package/tensorflow-lite/host/bin/aarch64-linux-=
g++ --sysroot=3D/home/test/tmp/.../per-package/tensorflow-lite/host/aarch64=
-buildroot-linux-gnu/sysroot=C2=A0 =C2=A0 -D_LARGEFILE_SOURCE -D_LARGEFILE6=
4_SOURCE -D_FILE_OFFSET_BITS=3D64=C2=A0 -O3 -g0 -D_FORTIFY_SOURCE=3D2 -ldl =
-latomic -funsafe-math-optimizations=C2=A0 -march=3Darmv8-a -std=3Dc++03 -p=
edantic -Wall -Wextra -Wundef -Wcast-align -Wchar-subscripts -Wnon-virtual-=
dtor -Wunused-local-typedefs -Wpointer-arith -Wwrite-strings -Wformat-secur=
ity -DCOMPILER_SUPPORT_Wshorten64to32 -Werror=C2=A0 -DNDEBUG -fPIE=C2=A0 =
=C2=A0-Wshorten-64-to-32 -o CMakeFiles/cmTC_76002.dir/src.cxx.o -c /home/te=
st/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/t=
ensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp/src.cxx<br>
&gt; aarch64-linux-g++.br_real: error: unrecognized command-line option &#3=
9;-Wshorten-64-to-32&#39;<br>
&gt; make[3]: *** [CMakeFiles/cmTC_76002.dir/build.make:66: CMakeFiles/cmTC=
_76002.dir/src.cxx.o] Error 1<br>
&gt; make[3]: Leaving directory &#39;/home/test/tmp/.../build/tensorflow-li=
te-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-build=
/CMakeFiles/CMakeTmp&#39;<br>
&gt; make[2]: *** [Makefile:121: cmTC_76002/fast] Error 2<br>
&gt; make[2]: Leaving directory &#39;/home/test/tmp/.../build/tensorflow-li=
te-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-build=
/CMakeFiles/CMakeTmp&#39;<br>
&gt;<br>
&gt;<br>
&gt; Source file was:<br>
&gt; int main() { return 0; }<br>
&gt; Performing C++ SOURCE FILE Test COMPILER_SUPPORT_Wcpp11extensions fail=
ed with the following output:<br>
&gt; Change Dir: /home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b=
0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp=
<br>
&gt;<br>
&gt; Run Build Command(s):/usr/bin/make cmTC_0b14f/fast &amp;&amp; make[2]:=
 Entering directory &#39;/home/test/tmp/.../build/tensorflow-lite-9663abe4c=
9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/=
CMakeTmp&#39;<br>
&gt; /usr/bin/make -f CMakeFiles/cmTC_0b14f.dir/build.make CMakeFiles/cmTC_=
0b14f.dir/build<br>
&gt; make[3]: Entering directory &#39;/home/test/tmp/.../build/tensorflow-l=
ite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-buil=
d/CMakeFiles/CMakeTmp&#39;<br>
&gt; Building CXX object CMakeFiles/cmTC_0b14f.dir/src.cxx.o<br>
&gt; /home/test/tmp/.../per-package/tensorflow-lite/host/bin/aarch64-linux-=
g++ --sysroot=3D/home/test/tmp/.../per-package/tensorflow-lite/host/aarch64=
-buildroot-linux-gnu/sysroot=C2=A0 =C2=A0 -D_LARGEFILE_SOURCE -D_LARGEFILE6=
4_SOURCE -D_FILE_OFFSET_BITS=3D64=C2=A0 -O3 -g0 -D_FORTIFY_SOURCE=3D2 -ldl =
-latomic -funsafe-math-optimizations=C2=A0 -march=3Darmv8-a -std=3Dc++03 -p=
edantic -Wall -Wextra -Wundef -Wcast-align -Wchar-subscripts -Wnon-virtual-=
dtor -Wunused-local-typedefs -Wpointer-arith -Wwrite-strings -Wformat-secur=
ity -Wlogical-op -Wenum-conversion -DCOMPILER_SUPPORT_Wcpp11extensions -Wer=
ror=C2=A0 -DNDEBUG -fPIE=C2=A0 =C2=A0-Wc++11-extensions -o CMakeFiles/cmTC_=
0b14f.dir/src.cxx.o -c /home/test/tmp/.../build/tensorflow-lite-9663abe4c90=
37030b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CM=
akeTmp/src.cxx<br>
&gt; aarch64-linux-g++.br_real: error: unrecognized command-line option &#3=
9;-Wc++11-extensions&#39;; did you mean &#39;-fms-extensions&#39;?<br>
&gt; make[3]: *** [CMakeFiles/cmTC_0b14f.dir/build.make:66: CMakeFiles/cmTC=
_0b14f.dir/src.cxx.o] Error 1<br>
&gt; make[3]: Leaving directory &#39;/home/test/tmp/.../build/tensorflow-li=
te-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-build=
/CMakeFiles/CMakeTmp&#39;<br>
&gt; make[2]: *** [Makefile:121: cmTC_0b14f/fast] Error 2<br>
&gt; make[2]: Leaving directory &#39;/home/test/tmp/.../build/tensorflow-li=
te-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-build=
/CMakeFiles/CMakeTmp&#39;<br>
&gt;<br>
&gt;<br>
&gt; Source file was:<br>
&gt; int main() { return 0; }<br>
&gt; Performing C++ SOURCE FILE Test COMPILER_SUPPORT_wd981 failed with the=
 following output:<br>
&gt; Change Dir: /home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b=
0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp=
<br>
&gt;<br>
&gt; Run Build Command(s):/usr/bin/make cmTC_4c191/fast &amp;&amp; make[2]:=
 Entering directory &#39;/home/test/tmp/.../build/tensorflow-lite-9663abe4c=
9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/=
CMakeTmp&#39;<br>
&gt; /usr/bin/make -f CMakeFiles/cmTC_4c191.dir/build.make CMakeFiles/cmTC_=
4c191.dir/build<br>
&gt; make[3]: Entering directory &#39;/home/test/tmp/.../build/tensorflow-l=
ite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-buil=
d/CMakeFiles/CMakeTmp&#39;<br>
&gt; Building CXX object CMakeFiles/cmTC_4c191.dir/src.cxx.o<br>
&gt; /home/test/tmp/.../per-package/tensorflow-lite/host/bin/aarch64-linux-=
g++ --sysroot=3D/home/test/tmp/.../per-package/tensorflow-lite/host/aarch64=
-buildroot-linux-gnu/sysroot=C2=A0 =C2=A0 -D_LARGEFILE_SOURCE -D_LARGEFILE6=
4_SOURCE -D_FILE_OFFSET_BITS=3D64=C2=A0 -O3 -g0 -D_FORTIFY_SOURCE=3D2 -ldl =
-latomic -funsafe-math-optimizations=C2=A0 -march=3Darmv8-a -std=3Dc++03 -p=
edantic -Wall -Wextra -Wundef -Wcast-align -Wchar-subscripts -Wnon-virtual-=
dtor -Wunused-local-typedefs -Wpointer-arith -Wwrite-strings -Wformat-secur=
ity -Wlogical-op -Wenum-conversion -Wdouble-promotion -Wshadow -Wno-psabi -=
Wno-variadic-macros -Wno-long-long -fno-check-new -fno-common -fstrict-alia=
sing -DCOMPILER_SUPPORT_wd981 -Werror=C2=A0 -DNDEBUG -fPIE=C2=A0 =C2=A0-wd9=
81 -o CMakeFiles/cmTC_4c191.dir/src.cxx.o -c /home/test/tmp/.../build/tenso=
rflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/buildro=
ot-build/CMakeFiles/CMakeTmp/src.cxx<br>
&gt; aarch64-linux-g++.br_real: error: unrecognized command-line option &#3=
9;-wd981&#39;<br>
&gt; make[3]: *** [CMakeFiles/cmTC_4c191.dir/build.make:66: CMakeFiles/cmTC=
_4c191.dir/src.cxx.o] Error 1<br>
&gt; make[3]: Leaving directory &#39;/home/test/tmp/.../build/tensorflow-li=
te-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-build=
/CMakeFiles/CMakeTmp&#39;<br>
&gt; make[2]: *** [Makefile:121: cmTC_4c191/fast] Error 2<br>
&gt; make[2]: Leaving directory &#39;/home/test/tmp/.../build/tensorflow-li=
te-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-build=
/CMakeFiles/CMakeTmp&#39;<br>
&gt;<br>
&gt;<br>
&gt; Source file was:<br>
&gt; int main() { return 0; }<br>
&gt; Performing C++ SOURCE FILE Test COMPILER_SUPPORT_wd2304 failed with th=
e following output:<br>
&gt; Change Dir: /home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b=
0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp=
<br>
&gt;<br>
&gt; Run Build Command(s):/usr/bin/make cmTC_3d2da/fast &amp;&amp; make[2]:=
 Entering directory &#39;/home/test/tmp/.../build/tensorflow-lite-9663abe4c=
9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/=
CMakeTmp&#39;<br>
&gt; /usr/bin/make -f CMakeFiles/cmTC_3d2da.dir/build.make CMakeFiles/cmTC_=
3d2da.dir/build<br>
&gt; make[3]: Entering directory &#39;/home/test/tmp/.../build/tensorflow-l=
ite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-buil=
d/CMakeFiles/CMakeTmp&#39;<br>
&gt; Building CXX object CMakeFiles/cmTC_3d2da.dir/src.cxx.o<br>
&gt; /home/test/tmp/.../per-package/tensorflow-lite/host/bin/aarch64-linux-=
g++ --sysroot=3D/home/test/tmp/.../per-package/tensorflow-lite/host/aarch64=
-buildroot-linux-gnu/sysroot=C2=A0 =C2=A0 -D_LARGEFILE_SOURCE -D_LARGEFILE6=
4_SOURCE -D_FILE_OFFSET_BITS=3D64=C2=A0 -O3 -g0 -D_FORTIFY_SOURCE=3D2 -ldl =
-latomic -funsafe-math-optimizations=C2=A0 -march=3Darmv8-a -std=3Dc++03 -p=
edantic -Wall -Wextra -Wundef -Wcast-align -Wchar-subscripts -Wnon-virtual-=
dtor -Wunused-local-typedefs -Wpointer-arith -Wwrite-strings -Wformat-secur=
ity -Wlogical-op -Wenum-conversion -Wdouble-promotion -Wshadow -Wno-psabi -=
Wno-variadic-macros -Wno-long-long -fno-check-new -fno-common -fstrict-alia=
sing -DCOMPILER_SUPPORT_wd2304 -Werror=C2=A0 -DNDEBUG -fPIE=C2=A0 =C2=A0-wd=
2304 -o CMakeFiles/cmTC_3d2da.dir/src.cxx.o -c /home/test/tmp/.../build/ten=
sorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/build=
root-build/CMakeFiles/CMakeTmp/src.cxx<br>
&gt; aarch64-linux-g++.br_real: error: unrecognized command-line option &#3=
9;-wd2304&#39;<br>
&gt; make[3]: *** [CMakeFiles/cmTC_3d2da.dir/build.make:66: CMakeFiles/cmTC=
_3d2da.dir/src.cxx.o] Error 1<br>
&gt; make[3]: Leaving directory &#39;/home/test/tmp/.../build/tensorflow-li=
te-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-build=
/CMakeFiles/CMakeTmp&#39;<br>
&gt; make[2]: *** [Makefile:121: cmTC_3d2da/fast] Error 2<br>
&gt; make[2]: Leaving directory &#39;/home/test/tmp/.../build/tensorflow-li=
te-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-build=
/CMakeFiles/CMakeTmp&#39;<br>
&gt;<br>
&gt;<br>
&gt; Source file was:<br>
&gt; int main() { return 0; }<br>
&gt; Performing C++ SOURCE FILE Test COMPILER_SUPPORT_STRICTANSI failed wit=
h the following output:<br>
&gt; Change Dir: /home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b=
0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp=
<br>
&gt;<br>
&gt; Run Build Command(s):/usr/bin/make cmTC_b2340/fast &amp;&amp; make[2]:=
 Entering directory &#39;/home/test/tmp/.../build/tensorflow-lite-9663abe4c=
9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/=
CMakeTmp&#39;<br>
&gt; /usr/bin/make -f CMakeFiles/cmTC_b2340.dir/build.make CMakeFiles/cmTC_=
b2340.dir/build<br>
&gt; make[3]: Entering directory &#39;/home/test/tmp/.../build/tensorflow-l=
ite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-buil=
d/CMakeFiles/CMakeTmp&#39;<br>
&gt; Building CXX object CMakeFiles/cmTC_b2340.dir/src.cxx.o<br>
&gt; /home/test/tmp/.../per-package/tensorflow-lite/host/bin/aarch64-linux-=
g++ --sysroot=3D/home/test/tmp/.../per-package/tensorflow-lite/host/aarch64=
-buildroot-linux-gnu/sysroot=C2=A0 =C2=A0 -D_LARGEFILE_SOURCE -D_LARGEFILE6=
4_SOURCE -D_FILE_OFFSET_BITS=3D64=C2=A0 -O3 -g0 -D_FORTIFY_SOURCE=3D2 -ldl =
-latomic -funsafe-math-optimizations=C2=A0 -march=3Darmv8-a -std=3Dc++03 -p=
edantic -Wall -Wextra -Wundef -Wcast-align -Wchar-subscripts -Wnon-virtual-=
dtor -Wunused-local-typedefs -Wpointer-arith -Wwrite-strings -Wformat-secur=
ity -Wlogical-op -Wenum-conversion -Wdouble-promotion -Wshadow -Wno-psabi -=
Wno-variadic-macros -Wno-long-long -fno-check-new -fno-common -fstrict-alia=
sing -DCOMPILER_SUPPORT_STRICTANSI -Werror=C2=A0 -DNDEBUG -fPIE=C2=A0 =C2=
=A0-strict-ansi -o CMakeFiles/cmTC_b2340.dir/src.cxx.o -c /home/test/tmp/..=
./build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow=
/lite/buildroot-build/CMakeFiles/CMakeTmp/src.cxx<br>
&gt; aarch64-linux-g++.br_real: error: unrecognized command-line option &#3=
9;-strict-ansi&#39;; did you mean &#39;-fstrict-enums&#39;?<br>
&gt; make[3]: *** [CMakeFiles/cmTC_b2340.dir/build.make:66: CMakeFiles/cmTC=
_b2340.dir/src.cxx.o] Error 1<br>
&gt; make[3]: Leaving directory &#39;/home/test/tmp/.../build/tensorflow-li=
te-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-build=
/CMakeFiles/CMakeTmp&#39;<br>
&gt; make[2]: *** [Makefile:121: cmTC_b2340/fast] Error 2<br>
&gt; make[2]: Leaving directory &#39;/home/test/tmp/.../build/tensorflow-li=
te-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-build=
/CMakeFiles/CMakeTmp&#39;<br>
&gt;<br>
&gt; Can anyone please let me know what could be an issue and how to resolv=
e it?<br>
&gt;<br>
&gt; Thanks in advance<br>
&gt;<br>
&gt; _______________________________________________<br>
&gt; buildroot mailing list<br>
&gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank" rel=3D"no=
referrer">buildroot@buildroot.org</a><br>
&gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=
=3D"noreferrer noreferrer" target=3D"_blank">https://lists.buildroot.org/ma=
ilman/listinfo/buildroot</a><br>
</blockquote></div>
</blockquote></div>
</blockquote></div></div></div>

--000000000000d122760605689278--


--===============0072026523721295541==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0072026523721295541==--


