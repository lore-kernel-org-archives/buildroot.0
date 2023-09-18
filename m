Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AAD7CD37B0
	for <buildroot@archiver.kernel.org>; Mon, 18 Sep 2023 16:04:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97A1F4013B;
	Mon, 18 Sep 2023 16:04:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97A1F4013B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uwBi6cTMQpE0; Mon, 18 Sep 2023 16:04:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED7394014F;
	Mon, 18 Sep 2023 16:04:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED7394014F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E04541BF3ED
 for <buildroot@lists.busybox.net>; Mon, 18 Sep 2023 16:04:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C420B4013B
 for <buildroot@lists.busybox.net>; Mon, 18 Sep 2023 16:04:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C420B4013B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zMpOQv_Ejury for <buildroot@lists.busybox.net>;
 Mon, 18 Sep 2023 16:04:36 +0000 (UTC)
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [IPv6:2001:4860:4864:20::31])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DBF7640056
 for <buildroot@buildroot.org>; Mon, 18 Sep 2023 16:04:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DBF7640056
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-1d643db2c98so2664104fac.0
 for <buildroot@buildroot.org>; Mon, 18 Sep 2023 09:04:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695053075; x=1695657875;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6SnyvqHnJwOBhWtIstGXc13OGcslR7lMvj0CqfVHhhA=;
 b=YRD6hc7MR1g8XIRZBf8AI0ht7jHx8O6kbyfvJJjbNqHRw3XLsMf2OKxCk+AlIf1RQQ
 JgztY0bpZQvDGd6g/D75Lr3rwUcrkI1K7Ra/x3i42hc5bSdap6Heo7qAknktju+sf5I8
 j6fQp7cU+3yjH16hdD8RPt5XtTmI+1trJBGU7v6zfFYjUY1r/vKBPNfsRNvor2fzG2sR
 w/x2OHB75Pd/isUa+JnWWaJbFT4mPf+zOVX28oTW/B20I0F3xaBffKX340CPsOFI33S3
 5mAZXPogS+41yCEQprXBNxaku+VVFwD0DOJe+cUrfh+UNAla1bMxpb0X7wdmNfHnmcgr
 t6CA==
X-Gm-Message-State: AOJu0Yye+a1Gy/b8vCv3Jx9IY5r3SR6z3xhN7VfvGH604kKKX3M0pL0z
 5GORpQJ2H2YdmJHvg0hG0wWGXoBPLp+s9I6OtD0=
X-Google-Smtp-Source: AGHT+IF6V8t7o347/MmdMcOFOCgzj98DYQogoCSraLhYWsfUxQGh/ZXfQWofSQHPiFStywwPSLFo+eOBvtZXnExSxeE=
X-Received: by 2002:a05:6870:5606:b0:1b0:3637:2bbe with SMTP id
 m6-20020a056870560600b001b036372bbemr11431663oao.54.1695053074541; Mon, 18
 Sep 2023 09:04:34 -0700 (PDT)
MIME-Version: 1.0
References: <CADYjeSs8Ou5-Kn4zYqAZa-qr7ALbp2xtiksY1vEb6L+D+7guZQ@mail.gmail.com>
 <CADvTj4pZXmewYMzSRF2QJcvRgzV9nA0bLDCrzEt4Yw_vAZEqBQ@mail.gmail.com>
 <CADYjeSv4hOWHjf78ULEszUUFSKbxqTCzb0ZLAw0tNHhA6LfyVg@mail.gmail.com>
 <CADYjeStbPRHh7jge5vU0Z1_5qXUdgVbQCghV2fZ6zSXASP46XQ@mail.gmail.com>
 <CADYjeStGD0sdj9iT7MDLQG8APoyBFKcLCQEtkcvDz-8WOJ4dcQ@mail.gmail.com>
In-Reply-To: <CADYjeStGD0sdj9iT7MDLQG8APoyBFKcLCQEtkcvDz-8WOJ4dcQ@mail.gmail.com>
From: Sourabh Hegde <hrsourabh011@gmail.com>
Date: Mon, 18 Sep 2023 18:04:23 +0200
Message-ID: <CADYjeSvoxnVhWW9BYkEyJeudsB8ZvYk6pGOjuXJUyh49XQAU_Q@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>, stefan.hager@ginzinger.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695053075; x=1695657875; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6SnyvqHnJwOBhWtIstGXc13OGcslR7lMvj0CqfVHhhA=;
 b=beduMg4FJYHhj4LITgQAvNqU4e0v0ippXPnLKNe08y9TR7noTiHd0Uj4As/0h+J5ZD
 mk0BLn0zclPNl4O9KzQ/mpfVY5SWZ6/UJX52cH3bSYtAPIbapLMlA5be6vvOsBsgdRgK
 kHaXR2kBV1g9hwhhyPLgbJex3K7URmfRJGWW1IelAyfsZuW7VRaph2s17nmn4/H4U0Cp
 N9IJFCBMaC6+zZnHwKgAU0t4tgH4FgzO8IEb8NqhO5/+z182eayvoZhJk0mNDNwpH0EL
 BI+UOyTcM9Wa9xR2oO0mIFiarQ0rKb8v0xQHNFJraOOzKSzfxJTDotx2G3xIqX92FkRu
 ashA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=beduMg4F
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
Content-Type: multipart/mixed; boundary="===============8735331740456009349=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8735331740456009349==
Content-Type: multipart/alternative; boundary="0000000000006232ca0605a44cd4"

--0000000000006232ca0605a44cd4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Stefan, James,

Have you tried building the benchmark_model from tensorflow-lite? I am
getting above errors during the build...

On Fri, 15 Sept 2023 at 18:49, Sourabh Hegde <hrsourabh011@gmail.com> wrote=
:

> Hello James,
>
> Do you have any updates on below issue?
> This would be helpful
>
> Thanks in advance
>
> On Wed, Sep 13, 2023, 09:07 Sourabh Hegde <hrsourabh011@gmail.com> wrote:
>
>> Hello James,
>>
>> I am trying to build the "benchmark_model" in the tensorflow-lite
>> package. The benchmarking application performs a simple TensorFlow Lite
>> model inference and prints benchmarking information.
>>
>> In the tensorflow-lite.mk  I added new section (similar to label_image
>> example)
>> ifeq ($(BR2_PACKAGE_TENSORFLOW_LITE_BUILD_BENCHMARK_MODEL),y)
>> define TENSORFLOW_LITE_BENCHMARK_BUILD_CMDS
>>         $(TARGET_MAKE_ENV) $(BR2_CMAKE) --build
>> $(TENSORFLOW_LITE_BUILDDIR) -t benchmark_model
>> endef
>> TENSORFLOW_LITE_POST_BUILD_HOOKS +=3D TENSORFLOW_LITE_BENCHMARK_BUILD_CM=
DS
>>
>> define TENSORFLOW_LITE_INSTALL_TARGET_BENCHMARK_MODEL
>>          $(INSTALL) -D -m0755
>> $(@D)/tensorflow/lite/buildroot-build/tools/benchmark/benchmark_model
>> $(TARGET_DIR)/usr/bin/benchmark_model
>> endef
>> TENSORFLOW_LITE_POST_INSTALL_TARGET_HOOKS +=3D
>> TENSORFLOW_LITE_INSTALL_TARGET_BENCHMARK_MODEL
>> endif
>>
>> But while building this is giving error:
>>
>> [ 98%] Building CXX object
>> tools/benchmark/CMakeFiles/benchmark_model.dir/__/delegates/xnnpack_dele=
gate_provider.cc.o
>> 2023-09-13T06:49:10 [ 98%] Building CXX object
>> tools/benchmark/CMakeFiles/benchmark_model.dir/__/delegates/external_del=
egate_provider.cc.o
>> 2023-09-13T06:49:11 [100%] Linking CXX executable benchmark_model
>> 2023-09-13T06:49:11
>> /home/.../per-package/tensorflow-lite/host/opt/ext-toolchain/bin/../lib/=
gcc/aarch64-buildroot-linux-gnu/10.3.0/../../../../aarch64-buildroot-linux-=
gnu/bin/ld:
>> CMakeFiles/benchmark_model.dir/benchmark_tflite_model.cc.o: in function
>> `absl::lts_20211102::strings_internal::Splitter<absl::lts_20211102::ByCh=
ar,
>> absl::lts_20211102::AllowEmpty, std::basic_string_view<char,
>> std::char_traits<char> >
>> >::ConvertToContainer<std::vector<std::basic_string_view<char,
>> std::char_traits<char> >, std::allocator<std::basic_string_view<char,
>> std::char_traits<char> > > >, std::basic_string_view<char,
>> std::char_traits<char> >,
>> false>::operator()(absl::lts_20211102::strings_internal::Splitter<absl::=
lts_20211102::ByChar,
>> absl::lts_20211102::AllowEmpty, std::basic_string_view<char,
>> std::char_traits<char> > > const&) const [clone .isra.0]':
>> 2023-09-13T06:49:11 benchmark_tflite_model.cc:(.text+0x204): undefined
>> reference to `absl::lts_20211102::ByChar::Find(std::basic_string_view<ch=
ar,
>> std::char_traits<char> >, unsigned long) const'
>> 2023-09-13T06:49:11
>> /home/.../per-package/tensorflow-lite/host/opt/ext-toolchain/bin/../lib/=
gcc/aarch64-buildroot-linux-gnu/10.3.0/../../../../aarch64-buildroot-linux-=
gnu/bin/ld:
>> benchmark_tflite_model.cc:(.text+0x284): undefined reference to
>> `absl::lts_20211102::ByChar::Find(std::basic_string_view<char,
>> std::char_traits<char> >, unsigned long) const'
>> 2023-09-13T06:49:11
>> /home/.../per-package/tensorflow-lite/host/opt/ext-toolchain/bin/../lib/=
gcc/aarch64-buildroot-linux-gnu/10.3.0/../../../../aarch64-buildroot-linux-=
gnu/bin/ld:
>> CMakeFiles/benchmark_model.dir/benchmark_tflite_model.cc.o: in function
>> `tflite::benchmark::SplitInputLayerNameAndValueFile(std::__cxx11::basic_=
string<char,
>> std::char_traits<char>, std::allocator<char> > const&,
>> std::pair<std::__cxx11::basic_string<char, std::char_traits<char>,
>> std::allocator<char> >, std::__cxx11::basic_string<char,
>> std::char_traits<char>, std::allocator<char> > >&)':
>> 2023-09-13T06:49:11 benchmark_tflite_model.cc:(.text+0xcf0): undefined
>> reference to
>> `absl::lts_20211102::StrReplaceAll[abi:cxx11](std::basic_string_view<cha=
r,
>> std::char_traits<char> >,
>> std::initializer_list<std::pair<std::basic_string_view<char,
>> std::char_traits<char> >, std::basic_string_view<char,
>> std::char_traits<char> > > >)'
>> 2023-09-13T06:49:11
>> /home/.../per-package/tensorflow-lite/host/opt/ext-toolchain/bin/../lib/=
gcc/aarch64-buildroot-linux-gnu/10.3.0/../../../../aarch64-buildroot-linux-=
gnu/bin/ld:
>> benchmark_tflite_model.cc:(.text+0xdd4): undefined reference to
>> `absl::lts_20211102::StrReplaceAll[abi:cxx11](std::basic_string_view<cha=
r,
>> std::char_traits<char> >,
>> std::initializer_list<std::pair<std::basic_string_view<char,
>> std::char_traits<char> >, std::basic_string_view<char,
>> std::char_traits<char> > > >)'
>> 2023-09-13T06:49:11
>> /home/.../per-package/tensorflow-lite/host/opt/ext-toolchain/bin/../lib/=
gcc/aarch64-buildroot-linux-gnu/10.3.0/../../../../aarch64-buildroot-linux-=
gnu/bin/ld:
>> CMakeFiles/benchmark_model.dir/benchmark_tflite_model.cc.o: in function
>> `tflite::benchmark::BenchmarkTfLiteModel::ValidateParams()':
>> 2023-09-13T06:49:11 benchmark_tflite_model.cc:(.text+0x8388): undefined
>> reference to
>> `absl::lts_20211102::numbers_internal::safe_strto32_base(std::basic_stri=
ng_view<char,
>> std::char_traits<char> >, int*, int)'
>> 2023-09-13T06:49:11
>> /home/.../per-package/tensorflow-lite/host/opt/ext-toolchain/bin/../lib/=
gcc/aarch64-buildroot-linux-gnu/10.3.0/../../../../aarch64-buildroot-linux-=
gnu/bin/ld:
>> benchmark_tflite_model.cc:(.text+0x83a4): undefined reference to
>> `absl::lts_20211102::numbers_internal::safe_strto32_base(std::basic_stri=
ng_view<char,
>> std::char_traits<char> >, int*, int)'
>> 2023-09-13T06:49:11 collect2: error: ld returned 1 exit status
>> 2023-09-13T06:49:11 make[6]: ***
>> [tools/benchmark/CMakeFiles/benchmark_model.dir/build.make:476:
>> tools/benchmark/benchmark_model] Error 1
>> 2023-09-13T06:49:11 make[5]: *** [CMakeFiles/Makefile2:370:
>> tools/benchmark/CMakeFiles/benchmark_model.dir/all] Error 2
>> 2023-09-13T06:49:11 make[4]: *** [CMakeFiles/Makefile2:377:
>> tools/benchmark/CMakeFiles/benchmark_model.dir/rule] Error 2
>> 2023-09-13T06:49:11 make[3]: *** [Makefile:268: benchmark_model] Error 2
>>
>> Do you know what the issue here?
>>
>> Thank you,
>> Sourabh
>>
>> On Tue, 5 Sept 2023 at 18:28, Sourabh Hegde <hrsourabh011@gmail.com>
>> wrote:
>>
>>> Hello James,
>>>
>>> Thanks for the update.
>>>
>>> I could build the tensorflow-lite package.
>>>
>>> Best Regards,
>>> Sourabh
>>>
>>>
>>>
>>> On Tue, 5 Sept 2023 at 08:07, James Hilliard <james.hilliard1@gmail.com=
>
>>> wrote:
>>>
>>>> On Mon, Sep 4, 2023 at 11:13=E2=80=AFAM Sourabh Hegde <hrsourabh011@gm=
ail.com>
>>>> wrote:
>>>> >
>>>> > Hello All,
>>>> >
>>>> > I am trying to add tensorflow-lite to Buildroot package and I found =
a
>>>> git (quite old)
>>>> https://github.com/Exein-io/buildroot-tensorflow-lite/tree/master that
>>>> I wanted to test.
>>>>
>>>> Try my v6 patch series:
>>>>
>>>> https://patchwork.ozlabs.org/project/buildroot/list/?series=3D346546&s=
ubmitter=3D&state=3D*&q=3D&archive=3Dboth&delegate=3D
>>>>
>>>> > But while building it I am getting below error:
>>>> >
>>>> >
>>>> file=3D'/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b49=
7c68cc4b2ba991967dd/tensorflow/lite/buildroot-build/pthreadpool-download/pt=
hreadpool-prefix/src/545ebe9f225aec6dca49109516fac02e973a3de2.zip'
>>>> > -- Downloading... done
>>>> > -- extracting...
>>>> >
>>>> src=3D'/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497=
c68cc4b2ba991967dd/tensorflow/lite/buildroot-build/pthreadpool-download/pth=
readpool-prefix/src/545ebe9f225aec6dca49109516fac02e973a3de2.zip'
>>>> >
>>>> dst=3D'/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497=
c68cc4b2ba991967dd/tensorflow/lite/buildroot-build/pthreadpool-source'
>>>> > -- extracting... [tar xfz]
>>>> > -- extracting... [analysis]
>>>> > -- extracting... [rename]
>>>> > -- extracting... [clean up]
>>>> > -- extracting... done
>>>> > [ 33%] No patch step for 'pthreadpool'
>>>> > [ 44%] No update step for 'pthreadpool'
>>>> > [ 55%] No configure step for 'pthreadpool'
>>>> > [ 66%] No build step for 'pthreadpool'
>>>> > [ 77%] No install step for 'pthreadpool'
>>>> > [ 88%] No test step for 'pthreadpool'
>>>> > [100%] Completed 'pthreadpool'
>>>> > make[4]: Leaving directory
>>>> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4=
b2ba991967dd/tensorflow/lite/buildroot-build/pthreadpool-download'
>>>> > [100%] Built target pthreadpool
>>>> > make[3]: Leaving directory
>>>> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4=
b2ba991967dd/tensorflow/lite/buildroot-build/pthreadpool-download'
>>>> > make[2]: Leaving directory
>>>> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4=
b2ba991967dd/tensorflow/lite/buildroot-build/pthreadpool-download'
>>>> > -- Configuring incomplete, errors occurred!
>>>> > See also
>>>> "/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4=
b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeOutput.log".
>>>> > See also
>>>> "/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4=
b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeError.log".
>>>> > make[1]: *** [package/pkg-generic.mk:283:
>>>> /home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b=
2ba991967dd/.stamp_configured]
>>>> Error 1
>>>> > make: *** [Makefile:23: _all] Error 2
>>>> >
>>>> > The CMakeError.log
>>>> build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorf=
low/lite/buildroot-build/CM
>>>> > akeFiles shows
>>>> >
>>>> > Performing C++ SOURCE FILE Test COMPILER_SUPPORT_Wshorten64to32
>>>> failed with the following output:
>>>> > Change Dir:
>>>> /home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b=
2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp
>>>> >
>>>> > Run Build Command(s):/usr/bin/make cmTC_76002/fast && make[2]:
>>>> Entering directory
>>>> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4=
b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
>>>> > /usr/bin/make -f CMakeFiles/cmTC_76002.dir/build.make
>>>> CMakeFiles/cmTC_76002.dir/build
>>>> > make[3]: Entering directory
>>>> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4=
b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
>>>> > Building CXX object CMakeFiles/cmTC_76002.dir/src.cxx.o
>>>> >
>>>> /home/test/tmp/.../per-package/tensorflow-lite/host/bin/aarch64-linux-=
g++
>>>> --sysroot=3D/home/test/tmp/.../per-package/tensorflow-lite/host/aarch6=
4-buildroot-linux-gnu/sysroot
>>>>   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64  =
-O3 -g0
>>>> -D_FORTIFY_SOURCE=3D2 -ldl -latomic -funsafe-math-optimizations
>>>> -march=3Darmv8-a -std=3Dc++03 -pedantic -Wall -Wextra -Wundef -Wcast-a=
lign
>>>> -Wchar-subscripts -Wnon-virtual-dtor -Wunused-local-typedefs
>>>> -Wpointer-arith -Wwrite-strings -Wformat-security
>>>> -DCOMPILER_SUPPORT_Wshorten64to32 -Werror  -DNDEBUG -fPIE
>>>>  -Wshorten-64-to-32 -o CMakeFiles/cmTC_76002.dir/src.cxx.o -c
>>>> /home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b=
2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp/src.cxx
>>>> > aarch64-linux-g++.br_real: error: unrecognized command-line option
>>>> '-Wshorten-64-to-32'
>>>> > make[3]: *** [CMakeFiles/cmTC_76002.dir/build.make:66:
>>>> CMakeFiles/cmTC_76002.dir/src.cxx.o] Error 1
>>>> > make[3]: Leaving directory
>>>> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4=
b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
>>>> > make[2]: *** [Makefile:121: cmTC_76002/fast] Error 2
>>>> > make[2]: Leaving directory
>>>> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4=
b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
>>>> >
>>>> >
>>>> > Source file was:
>>>> > int main() { return 0; }
>>>> > Performing C++ SOURCE FILE Test COMPILER_SUPPORT_Wcpp11extensions
>>>> failed with the following output:
>>>> > Change Dir:
>>>> /home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b=
2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp
>>>> >
>>>> > Run Build Command(s):/usr/bin/make cmTC_0b14f/fast && make[2]:
>>>> Entering directory
>>>> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4=
b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
>>>> > /usr/bin/make -f CMakeFiles/cmTC_0b14f.dir/build.make
>>>> CMakeFiles/cmTC_0b14f.dir/build
>>>> > make[3]: Entering directory
>>>> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4=
b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
>>>> > Building CXX object CMakeFiles/cmTC_0b14f.dir/src.cxx.o
>>>> >
>>>> /home/test/tmp/.../per-package/tensorflow-lite/host/bin/aarch64-linux-=
g++
>>>> --sysroot=3D/home/test/tmp/.../per-package/tensorflow-lite/host/aarch6=
4-buildroot-linux-gnu/sysroot
>>>>   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64  =
-O3 -g0
>>>> -D_FORTIFY_SOURCE=3D2 -ldl -latomic -funsafe-math-optimizations
>>>> -march=3Darmv8-a -std=3Dc++03 -pedantic -Wall -Wextra -Wundef -Wcast-a=
lign
>>>> -Wchar-subscripts -Wnon-virtual-dtor -Wunused-local-typedefs
>>>> -Wpointer-arith -Wwrite-strings -Wformat-security -Wlogical-op
>>>> -Wenum-conversion -DCOMPILER_SUPPORT_Wcpp11extensions -Werror  -DNDEBU=
G
>>>> -fPIE   -Wc++11-extensions -o CMakeFiles/cmTC_0b14f.dir/src.cxx.o -c
>>>> /home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b=
2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp/src.cxx
>>>> > aarch64-linux-g++.br_real: error: unrecognized command-line option
>>>> '-Wc++11-extensions'; did you mean '-fms-extensions'?
>>>> > make[3]: *** [CMakeFiles/cmTC_0b14f.dir/build.make:66:
>>>> CMakeFiles/cmTC_0b14f.dir/src.cxx.o] Error 1
>>>> > make[3]: Leaving directory
>>>> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4=
b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
>>>> > make[2]: *** [Makefile:121: cmTC_0b14f/fast] Error 2
>>>> > make[2]: Leaving directory
>>>> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4=
b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
>>>> >
>>>> >
>>>> > Source file was:
>>>> > int main() { return 0; }
>>>> > Performing C++ SOURCE FILE Test COMPILER_SUPPORT_wd981 failed with
>>>> the following output:
>>>> > Change Dir:
>>>> /home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b=
2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp
>>>> >
>>>> > Run Build Command(s):/usr/bin/make cmTC_4c191/fast && make[2]:
>>>> Entering directory
>>>> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4=
b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
>>>> > /usr/bin/make -f CMakeFiles/cmTC_4c191.dir/build.make
>>>> CMakeFiles/cmTC_4c191.dir/build
>>>> > make[3]: Entering directory
>>>> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4=
b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
>>>> > Building CXX object CMakeFiles/cmTC_4c191.dir/src.cxx.o
>>>> >
>>>> /home/test/tmp/.../per-package/tensorflow-lite/host/bin/aarch64-linux-=
g++
>>>> --sysroot=3D/home/test/tmp/.../per-package/tensorflow-lite/host/aarch6=
4-buildroot-linux-gnu/sysroot
>>>>   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64  =
-O3 -g0
>>>> -D_FORTIFY_SOURCE=3D2 -ldl -latomic -funsafe-math-optimizations
>>>> -march=3Darmv8-a -std=3Dc++03 -pedantic -Wall -Wextra -Wundef -Wcast-a=
lign
>>>> -Wchar-subscripts -Wnon-virtual-dtor -Wunused-local-typedefs
>>>> -Wpointer-arith -Wwrite-strings -Wformat-security -Wlogical-op
>>>> -Wenum-conversion -Wdouble-promotion -Wshadow -Wno-psabi
>>>> -Wno-variadic-macros -Wno-long-long -fno-check-new -fno-common
>>>> -fstrict-aliasing -DCOMPILER_SUPPORT_wd981 -Werror  -DNDEBUG -fPIE   -=
wd981
>>>> -o CMakeFiles/cmTC_4c191.dir/src.cxx.o -c
>>>> /home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b=
2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp/src.cxx
>>>> > aarch64-linux-g++.br_real: error: unrecognized command-line option
>>>> '-wd981'
>>>> > make[3]: *** [CMakeFiles/cmTC_4c191.dir/build.make:66:
>>>> CMakeFiles/cmTC_4c191.dir/src.cxx.o] Error 1
>>>> > make[3]: Leaving directory
>>>> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4=
b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
>>>> > make[2]: *** [Makefile:121: cmTC_4c191/fast] Error 2
>>>> > make[2]: Leaving directory
>>>> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4=
b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
>>>> >
>>>> >
>>>> > Source file was:
>>>> > int main() { return 0; }
>>>> > Performing C++ SOURCE FILE Test COMPILER_SUPPORT_wd2304 failed with
>>>> the following output:
>>>> > Change Dir:
>>>> /home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b=
2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp
>>>> >
>>>> > Run Build Command(s):/usr/bin/make cmTC_3d2da/fast && make[2]:
>>>> Entering directory
>>>> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4=
b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
>>>> > /usr/bin/make -f CMakeFiles/cmTC_3d2da.dir/build.make
>>>> CMakeFiles/cmTC_3d2da.dir/build
>>>> > make[3]: Entering directory
>>>> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4=
b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
>>>> > Building CXX object CMakeFiles/cmTC_3d2da.dir/src.cxx.o
>>>> >
>>>> /home/test/tmp/.../per-package/tensorflow-lite/host/bin/aarch64-linux-=
g++
>>>> --sysroot=3D/home/test/tmp/.../per-package/tensorflow-lite/host/aarch6=
4-buildroot-linux-gnu/sysroot
>>>>   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64  =
-O3 -g0
>>>> -D_FORTIFY_SOURCE=3D2 -ldl -latomic -funsafe-math-optimizations
>>>> -march=3Darmv8-a -std=3Dc++03 -pedantic -Wall -Wextra -Wundef -Wcast-a=
lign
>>>> -Wchar-subscripts -Wnon-virtual-dtor -Wunused-local-typedefs
>>>> -Wpointer-arith -Wwrite-strings -Wformat-security -Wlogical-op
>>>> -Wenum-conversion -Wdouble-promotion -Wshadow -Wno-psabi
>>>> -Wno-variadic-macros -Wno-long-long -fno-check-new -fno-common
>>>> -fstrict-aliasing -DCOMPILER_SUPPORT_wd2304 -Werror  -DNDEBUG -fPIE
>>>>  -wd2304 -o CMakeFiles/cmTC_3d2da.dir/src.cxx.o -c
>>>> /home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b=
2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp/src.cxx
>>>> > aarch64-linux-g++.br_real: error: unrecognized command-line option
>>>> '-wd2304'
>>>> > make[3]: *** [CMakeFiles/cmTC_3d2da.dir/build.make:66:
>>>> CMakeFiles/cmTC_3d2da.dir/src.cxx.o] Error 1
>>>> > make[3]: Leaving directory
>>>> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4=
b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
>>>> > make[2]: *** [Makefile:121: cmTC_3d2da/fast] Error 2
>>>> > make[2]: Leaving directory
>>>> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4=
b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
>>>> >
>>>> >
>>>> > Source file was:
>>>> > int main() { return 0; }
>>>> > Performing C++ SOURCE FILE Test COMPILER_SUPPORT_STRICTANSI failed
>>>> with the following output:
>>>> > Change Dir:
>>>> /home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b=
2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp
>>>> >
>>>> > Run Build Command(s):/usr/bin/make cmTC_b2340/fast && make[2]:
>>>> Entering directory
>>>> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4=
b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
>>>> > /usr/bin/make -f CMakeFiles/cmTC_b2340.dir/build.make
>>>> CMakeFiles/cmTC_b2340.dir/build
>>>> > make[3]: Entering directory
>>>> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4=
b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
>>>> > Building CXX object CMakeFiles/cmTC_b2340.dir/src.cxx.o
>>>> >
>>>> /home/test/tmp/.../per-package/tensorflow-lite/host/bin/aarch64-linux-=
g++
>>>> --sysroot=3D/home/test/tmp/.../per-package/tensorflow-lite/host/aarch6=
4-buildroot-linux-gnu/sysroot
>>>>   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64  =
-O3 -g0
>>>> -D_FORTIFY_SOURCE=3D2 -ldl -latomic -funsafe-math-optimizations
>>>> -march=3Darmv8-a -std=3Dc++03 -pedantic -Wall -Wextra -Wundef -Wcast-a=
lign
>>>> -Wchar-subscripts -Wnon-virtual-dtor -Wunused-local-typedefs
>>>> -Wpointer-arith -Wwrite-strings -Wformat-security -Wlogical-op
>>>> -Wenum-conversion -Wdouble-promotion -Wshadow -Wno-psabi
>>>> -Wno-variadic-macros -Wno-long-long -fno-check-new -fno-common
>>>> -fstrict-aliasing -DCOMPILER_SUPPORT_STRICTANSI -Werror  -DNDEBUG -fPI=
E
>>>>  -strict-ansi -o CMakeFiles/cmTC_b2340.dir/src.cxx.o -c
>>>> /home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b=
2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp/src.cxx
>>>> > aarch64-linux-g++.br_real: error: unrecognized command-line option
>>>> '-strict-ansi'; did you mean '-fstrict-enums'?
>>>> > make[3]: *** [CMakeFiles/cmTC_b2340.dir/build.make:66:
>>>> CMakeFiles/cmTC_b2340.dir/src.cxx.o] Error 1
>>>> > make[3]: Leaving directory
>>>> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4=
b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
>>>> > make[2]: *** [Makefile:121: cmTC_b2340/fast] Error 2
>>>> > make[2]: Leaving directory
>>>> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4=
b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
>>>> >
>>>> > Can anyone please let me know what could be an issue and how to
>>>> resolve it?
>>>> >
>>>> > Thanks in advance
>>>> >
>>>> > _______________________________________________
>>>> > buildroot mailing list
>>>> > buildroot@buildroot.org
>>>> > https://lists.buildroot.org/mailman/listinfo/buildroot
>>>>
>>>

--0000000000006232ca0605a44cd4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Stefan, James,<div><br></div><div>Have you tried bui=
lding the benchmark_model from tensorflow-lite? I am getting=C2=A0above err=
ors during the build...</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Fri, 15 Sept 2023 at 18:49, Sourabh Hegde =
&lt;<a href=3D"mailto:hrsourabh011@gmail.com">hrsourabh011@gmail.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div di=
r=3D"auto"><div>Hello James,</div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">Do you have any updates on below issue?=C2=A0</div><div dir=3D"auto">T=
his would be helpful</div><div dir=3D"auto"><br></div><div dir=3D"auto">Tha=
nks in advance</div><div dir=3D"auto"><br><div class=3D"gmail_quote" dir=3D=
"auto"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 13, 2023, 09:07 So=
urabh Hegde &lt;<a href=3D"mailto:hrsourabh011@gmail.com" target=3D"_blank"=
>hrsourabh011@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex"><div dir=3D"ltr">Hello James,<div><br></div><div>I a=
m trying to build the &quot;benchmark_model&quot; in the tensorflow-lite pa=
ckage. The benchmarking application performs a simple TensorFlow Lite model=
 inference and prints benchmarking information.</div><div><br></div><div>In=
 the <a href=3D"http://tensorflow-lite.mk" rel=3D"noreferrer" target=3D"_bl=
ank">tensorflow-lite.mk</a>=C2=A0 I added new section (similar to label_ima=
ge example)<br></div><div>ifeq ($(BR2_PACKAGE_TENSORFLOW_LITE_BUILD_BENCHMA=
RK_MODEL),y)<br>define TENSORFLOW_LITE_BENCHMARK_BUILD_CMDS<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 $(TARGET_MAKE_ENV) $(BR2_CMAKE) --build $(TENSORFLOW_LITE=
_BUILDDIR) -t benchmark_model<br>endef<br>TENSORFLOW_LITE_POST_BUILD_HOOKS =
+=3D TENSORFLOW_LITE_BENCHMARK_BUILD_CMDS<br><br></div><div>define TENSORFL=
OW_LITE_INSTALL_TARGET_BENCHMARK_MODEL<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0$(INSTALL) -D -m0755 $(@D)/tensorflow/lite/buildroot-build/tools/benchma=
rk/benchmark_model $(TARGET_DIR)/usr/bin/benchmark_model<br>endef<br>TENSOR=
FLOW_LITE_POST_INSTALL_TARGET_HOOKS +=3D TENSORFLOW_LITE_INSTALL_TARGET_BEN=
CHMARK_MODEL<br>endif<br></div><div><br></div><div>But while building this =
is giving error:</div><div><br></div><div>[ 98%] Building CXX object tools/=
benchmark/CMakeFiles/benchmark_model.dir/__/delegates/xnnpack_delegate_prov=
ider.cc.o<br>2023-09-13T06:49:10 [ 98%] Building CXX object tools/benchmark=
/CMakeFiles/benchmark_model.dir/__/delegates/external_delegate_provider.cc.=
o<br>2023-09-13T06:49:11 [100%] Linking CXX executable benchmark_model<br>2=
023-09-13T06:49:11 /home/.../per-package/tensorflow-lite/host/opt/ext-toolc=
hain/bin/../lib/gcc/aarch64-buildroot-linux-gnu/10.3.0/../../../../aarch64-=
buildroot-linux-gnu/bin/ld: CMakeFiles/benchmark_model.dir/benchmark_tflite=
_model.cc.o: in function `absl::lts_20211102::strings_internal::Splitter&lt=
;absl::lts_20211102::ByChar, absl::lts_20211102::AllowEmpty, std::basic_str=
ing_view&lt;char, std::char_traits&lt;char&gt; &gt; &gt;::ConvertToContaine=
r&lt;std::vector&lt;std::basic_string_view&lt;char, std::char_traits&lt;cha=
r&gt; &gt;, std::allocator&lt;std::basic_string_view&lt;char, std::char_tra=
its&lt;char&gt; &gt; &gt; &gt;, std::basic_string_view&lt;char, std::char_t=
raits&lt;char&gt; &gt;, false&gt;::operator()(absl::lts_20211102::strings_i=
nternal::Splitter&lt;absl::lts_20211102::ByChar, absl::lts_20211102::AllowE=
mpty, std::basic_string_view&lt;char, std::char_traits&lt;char&gt; &gt; &gt=
; const&amp;) const [clone .isra.0]&#39;:<br>2023-09-13T06:49:11 benchmark_=
tflite_model.cc:(.text+0x204): undefined reference to `absl::lts_20211102::=
ByChar::Find(std::basic_string_view&lt;char, std::char_traits&lt;char&gt; &=
gt;, unsigned long) const&#39;<br>2023-09-13T06:49:11 /home/.../per-package=
/tensorflow-lite/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-buildroot-li=
nux-gnu/10.3.0/../../../../aarch64-buildroot-linux-gnu/bin/ld: benchmark_tf=
lite_model.cc:(.text+0x284): undefined reference to `absl::lts_20211102::By=
Char::Find(std::basic_string_view&lt;char, std::char_traits&lt;char&gt; &gt=
;, unsigned long) const&#39;<br>2023-09-13T06:49:11 /home/.../per-package/t=
ensorflow-lite/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-buildroot-linu=
x-gnu/10.3.0/../../../../aarch64-buildroot-linux-gnu/bin/ld: CMakeFiles/ben=
chmark_model.dir/benchmark_tflite_model.cc.o: in function `tflite::benchmar=
k::SplitInputLayerNameAndValueFile(std::__cxx11::basic_string&lt;char, std:=
:char_traits&lt;char&gt;, std::allocator&lt;char&gt; &gt; const&amp;, std::=
pair&lt;std::__cxx11::basic_string&lt;char, std::char_traits&lt;char&gt;, s=
td::allocator&lt;char&gt; &gt;, std::__cxx11::basic_string&lt;char, std::ch=
ar_traits&lt;char&gt;, std::allocator&lt;char&gt; &gt; &gt;&amp;)&#39;:<br>=
2023-09-13T06:49:11 benchmark_tflite_model.cc:(.text+0xcf0): undefined refe=
rence to `absl::lts_20211102::StrReplaceAll[abi:cxx11](std::basic_string_vi=
ew&lt;char, std::char_traits&lt;char&gt; &gt;, std::initializer_list&lt;std=
::pair&lt;std::basic_string_view&lt;char, std::char_traits&lt;char&gt; &gt;=
, std::basic_string_view&lt;char, std::char_traits&lt;char&gt; &gt; &gt; &g=
t;)&#39;<br>2023-09-13T06:49:11 /home/.../per-package/tensorflow-lite/host/=
opt/ext-toolchain/bin/../lib/gcc/aarch64-buildroot-linux-gnu/10.3.0/../../.=
./../aarch64-buildroot-linux-gnu/bin/ld: benchmark_tflite_model.cc:(.text+0=
xdd4): undefined reference to `absl::lts_20211102::StrReplaceAll[abi:cxx11]=
(std::basic_string_view&lt;char, std::char_traits&lt;char&gt; &gt;, std::in=
itializer_list&lt;std::pair&lt;std::basic_string_view&lt;char, std::char_tr=
aits&lt;char&gt; &gt;, std::basic_string_view&lt;char, std::char_traits&lt;=
char&gt; &gt; &gt; &gt;)&#39;<br>2023-09-13T06:49:11 /home/.../per-package/=
tensorflow-lite/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-buildroot-lin=
ux-gnu/10.3.0/../../../../aarch64-buildroot-linux-gnu/bin/ld: CMakeFiles/be=
nchmark_model.dir/benchmark_tflite_model.cc.o: in function `tflite::benchma=
rk::BenchmarkTfLiteModel::ValidateParams()&#39;:<br>2023-09-13T06:49:11 ben=
chmark_tflite_model.cc:(.text+0x8388): undefined reference to `absl::lts_20=
211102::numbers_internal::safe_strto32_base(std::basic_string_view&lt;char,=
 std::char_traits&lt;char&gt; &gt;, int*, int)&#39;<br>2023-09-13T06:49:11 =
/home/.../per-package/tensorflow-lite/host/opt/ext-toolchain/bin/../lib/gcc=
/aarch64-buildroot-linux-gnu/10.3.0/../../../../aarch64-buildroot-linux-gnu=
/bin/ld: benchmark_tflite_model.cc:(.text+0x83a4): undefined reference to `=
absl::lts_20211102::numbers_internal::safe_strto32_base(std::basic_string_v=
iew&lt;char, std::char_traits&lt;char&gt; &gt;, int*, int)&#39;<br>2023-09-=
13T06:49:11 collect2: error: ld returned 1 exit status<br>2023-09-13T06:49:=
11 make[6]: *** [tools/benchmark/CMakeFiles/benchmark_model.dir/build.make:=
476: tools/benchmark/benchmark_model] Error 1<br>2023-09-13T06:49:11 make[5=
]: *** [CMakeFiles/Makefile2:370: tools/benchmark/CMakeFiles/benchmark_mode=
l.dir/all] Error 2<br>2023-09-13T06:49:11 make[4]: *** [CMakeFiles/Makefile=
2:377: tools/benchmark/CMakeFiles/benchmark_model.dir/rule] Error 2<br>2023=
-09-13T06:49:11 make[3]: *** [Makefile:268: benchmark_model] Error 2<br></d=
iv><div><br></div><div>Do you know what the issue here?</div><div><br></div=
><div>Thank you,</div><div>Sourabh</div></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 5 Sept 2023 at 18:28, Soura=
bh Hegde &lt;<a href=3D"mailto:hrsourabh011@gmail.com" rel=3D"noreferrer" t=
arget=3D"_blank">hrsourabh011@gmail.com</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Hello James,<div><b=
r></div><div>Thanks for the update.</div><div><br></div><div>I could build =
the tensorflow-lite package.</div><div><br></div><div>Best Regards,</div><d=
iv>Sourabh</div><div><br></div><div>=C2=A0</div></div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 5 Sept 2023 at 08:0=
7, James Hilliard &lt;<a href=3D"mailto:james.hilliard1@gmail.com" rel=3D"n=
oreferrer" target=3D"_blank">james.hilliard1@gmail.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon, Sep 4, 2023 a=
t 11:13=E2=80=AFAM Sourabh Hegde &lt;<a href=3D"mailto:hrsourabh011@gmail.c=
om" rel=3D"noreferrer" target=3D"_blank">hrsourabh011@gmail.com</a>&gt; wro=
te:<br>
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
&gt; <a href=3D"mailto:buildroot@buildroot.org" rel=3D"noreferrer" target=
=3D"_blank">buildroot@buildroot.org</a><br>
&gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=
=3D"noreferrer noreferrer" target=3D"_blank">https://lists.buildroot.org/ma=
ilman/listinfo/buildroot</a><br>
</blockquote></div>
</blockquote></div>
</blockquote></div></div></div>
</blockquote></div>

--0000000000006232ca0605a44cd4--


--===============8735331740456009349==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8735331740456009349==--


