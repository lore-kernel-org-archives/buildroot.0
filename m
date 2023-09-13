Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B735ACA5501
	for <buildroot@archiver.kernel.org>; Wed, 13 Sep 2023 07:08:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37B18400DC;
	Wed, 13 Sep 2023 07:08:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37B18400DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8bOcMvnyVkjv; Wed, 13 Sep 2023 07:08:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4B9941B47;
	Wed, 13 Sep 2023 07:08:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4B9941B47
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7113B1BF681
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 07:08:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 499508211E
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 07:08:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 499508211E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U-o3YOSdBbM4 for <buildroot@lists.busybox.net>;
 Wed, 13 Sep 2023 07:07:58 +0000 (UTC)
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1B1248204C
 for <buildroot@buildroot.org>; Wed, 13 Sep 2023 07:07:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B1248204C
Received: by mail-oi1-x22f.google.com with SMTP id
 5614622812f47-3ab2a0391c0so4863460b6e.1
 for <buildroot@buildroot.org>; Wed, 13 Sep 2023 00:07:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694588877; x=1695193677;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HUQWqcMdWG+NX4dSlpywmAgc7FSodjMc6s8FPJ3wCyo=;
 b=Q6KZdWyhTKqyhiKmy6KXKjghnA9lKnX2QH/ZPChMCivcaB1t01g3bz4AM7TIV6mVjd
 eSBRAElGPHKpt3sr7Bs/DY0e0imLKD3LKtpNg7tz9XGi/O9dNYaQj4LYMfLaLrKNvtiC
 7mLUpwBsaCKdjZdx4mQKBa+ULVZ+BycPFanPmjkgvuOA4mxDeHdQFLVEL32L+P4z7Bdq
 6ihk9o58UEoB0ClYbKBYcOr1jG+Ry55jQ8T/zh4edfuM2AxwK2elqGQdwUSjUvfFfLqh
 UJuaI4KRz7UtTopqV1JNM/m6M1oRvJd9+OooxqFVDMHBYNv4mUP952FYKVZsQchzEKVk
 xgYQ==
X-Gm-Message-State: AOJu0YxQwlw/oUVVYENKsVNv7h3M0DK6V9f0T2AOTRAOIS3JagVN8jbB
 1DoaDmLC2l6xzKjr4fNP+boIG7pfQjXM1FxC6OQ=
X-Google-Smtp-Source: AGHT+IG686yDh+uOu35zH85WUCJfjwKPWNZl2x47tCf3cIr3LO5Pyv+1cpzZAHFFYyDv/KN+cg5/Y9lYHPE8kQCOQUs=
X-Received: by 2002:a05:6870:708c:b0:1bf:1c49:7455 with SMTP id
 v12-20020a056870708c00b001bf1c497455mr2247978oae.6.1694588876739; Wed, 13 Sep
 2023 00:07:56 -0700 (PDT)
MIME-Version: 1.0
References: <CADYjeSs8Ou5-Kn4zYqAZa-qr7ALbp2xtiksY1vEb6L+D+7guZQ@mail.gmail.com>
 <CADvTj4pZXmewYMzSRF2QJcvRgzV9nA0bLDCrzEt4Yw_vAZEqBQ@mail.gmail.com>
 <CADYjeSv4hOWHjf78ULEszUUFSKbxqTCzb0ZLAw0tNHhA6LfyVg@mail.gmail.com>
In-Reply-To: <CADYjeSv4hOWHjf78ULEszUUFSKbxqTCzb0ZLAw0tNHhA6LfyVg@mail.gmail.com>
From: Sourabh Hegde <hrsourabh011@gmail.com>
Date: Wed, 13 Sep 2023 09:07:47 +0200
Message-ID: <CADYjeStbPRHh7jge5vU0Z1_5qXUdgVbQCghV2fZ6zSXASP46XQ@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694588877; x=1695193677; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HUQWqcMdWG+NX4dSlpywmAgc7FSodjMc6s8FPJ3wCyo=;
 b=fGn2TgTLG7PQh0UmPdBPxkz+h/pf90XklpZfVYeyIDJKD/mqPPuba9O06biQlawS9d
 MzTomsE30MAFUaFv9xdenoKc7CnNVX6J+DidRnl2JWSiX0+SWws8OqqpPIyaCKLw3oxt
 qPsgNAxFZiMk6T2uP9F31YughfSBMZJ9Nf4qaQQbS896sNMBTN4ithKSSmqkiJRL9wO0
 ejmxNKj7N3VC5MQXjGk6q9DnuBINSf+xR7rknPmM93Sx2y0+cZnnD+zDo02PPYYMXK04
 eyDymf8kq0UWeAxgFBJ0hRnk7Tm9O84fvUupnGhJVbCYJRhdQ+H9hrRD9P0rlboJKOIZ
 ErFQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=fGn2TgTL
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
Content-Type: multipart/mixed; boundary="===============5598780440844910621=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5598780440844910621==
Content-Type: multipart/alternative; boundary="00000000000009d72d06053838b1"

--00000000000009d72d06053838b1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello James,

I am trying to build the "benchmark_model" in the tensorflow-lite package.
The benchmarking application performs a simple TensorFlow Lite model
inference and prints benchmarking information.

In the tensorflow-lite.mk  I added new section (similar to label_image
example)
ifeq ($(BR2_PACKAGE_TENSORFLOW_LITE_BUILD_BENCHMARK_MODEL),y)
define TENSORFLOW_LITE_BENCHMARK_BUILD_CMDS
        $(TARGET_MAKE_ENV) $(BR2_CMAKE) --build $(TENSORFLOW_LITE_BUILDDIR)
-t benchmark_model
endef
TENSORFLOW_LITE_POST_BUILD_HOOKS +=3D TENSORFLOW_LITE_BENCHMARK_BUILD_CMDS

define TENSORFLOW_LITE_INSTALL_TARGET_BENCHMARK_MODEL
         $(INSTALL) -D -m0755
$(@D)/tensorflow/lite/buildroot-build/tools/benchmark/benchmark_model
$(TARGET_DIR)/usr/bin/benchmark_model
endef
TENSORFLOW_LITE_POST_INSTALL_TARGET_HOOKS +=3D
TENSORFLOW_LITE_INSTALL_TARGET_BENCHMARK_MODEL
endif

But while building this is giving error:

[ 98%] Building CXX object
tools/benchmark/CMakeFiles/benchmark_model.dir/__/delegates/xnnpack_delegat=
e_provider.cc.o
2023-09-13T06:49:10 [ 98%] Building CXX object
tools/benchmark/CMakeFiles/benchmark_model.dir/__/delegates/external_delega=
te_provider.cc.o
2023-09-13T06:49:11 [100%] Linking CXX executable benchmark_model
2023-09-13T06:49:11
/home/.../per-package/tensorflow-lite/host/opt/ext-toolchain/bin/../lib/gcc=
/aarch64-buildroot-linux-gnu/10.3.0/../../../../aarch64-buildroot-linux-gnu=
/bin/ld:
CMakeFiles/benchmark_model.dir/benchmark_tflite_model.cc.o: in function
`absl::lts_20211102::strings_internal::Splitter<absl::lts_20211102::ByChar,
absl::lts_20211102::AllowEmpty, std::basic_string_view<char,
std::char_traits<char> >
>::ConvertToContainer<std::vector<std::basic_string_view<char,
std::char_traits<char> >, std::allocator<std::basic_string_view<char,
std::char_traits<char> > > >, std::basic_string_view<char,
std::char_traits<char> >,
false>::operator()(absl::lts_20211102::strings_internal::Splitter<absl::lts=
_20211102::ByChar,
absl::lts_20211102::AllowEmpty, std::basic_string_view<char,
std::char_traits<char> > > const&) const [clone .isra.0]':
2023-09-13T06:49:11 benchmark_tflite_model.cc:(.text+0x204): undefined
reference to `absl::lts_20211102::ByChar::Find(std::basic_string_view<char,
std::char_traits<char> >, unsigned long) const'
2023-09-13T06:49:11
/home/.../per-package/tensorflow-lite/host/opt/ext-toolchain/bin/../lib/gcc=
/aarch64-buildroot-linux-gnu/10.3.0/../../../../aarch64-buildroot-linux-gnu=
/bin/ld:
benchmark_tflite_model.cc:(.text+0x284): undefined reference to
`absl::lts_20211102::ByChar::Find(std::basic_string_view<char,
std::char_traits<char> >, unsigned long) const'
2023-09-13T06:49:11
/home/.../per-package/tensorflow-lite/host/opt/ext-toolchain/bin/../lib/gcc=
/aarch64-buildroot-linux-gnu/10.3.0/../../../../aarch64-buildroot-linux-gnu=
/bin/ld:
CMakeFiles/benchmark_model.dir/benchmark_tflite_model.cc.o: in function
`tflite::benchmark::SplitInputLayerNameAndValueFile(std::__cxx11::basic_str=
ing<char,
std::char_traits<char>, std::allocator<char> > const&,
std::pair<std::__cxx11::basic_string<char, std::char_traits<char>,
std::allocator<char> >, std::__cxx11::basic_string<char,
std::char_traits<char>, std::allocator<char> > >&)':
2023-09-13T06:49:11 benchmark_tflite_model.cc:(.text+0xcf0): undefined
reference to
`absl::lts_20211102::StrReplaceAll[abi:cxx11](std::basic_string_view<char,
std::char_traits<char> >,
std::initializer_list<std::pair<std::basic_string_view<char,
std::char_traits<char> >, std::basic_string_view<char,
std::char_traits<char> > > >)'
2023-09-13T06:49:11
/home/.../per-package/tensorflow-lite/host/opt/ext-toolchain/bin/../lib/gcc=
/aarch64-buildroot-linux-gnu/10.3.0/../../../../aarch64-buildroot-linux-gnu=
/bin/ld:
benchmark_tflite_model.cc:(.text+0xdd4): undefined reference to
`absl::lts_20211102::StrReplaceAll[abi:cxx11](std::basic_string_view<char,
std::char_traits<char> >,
std::initializer_list<std::pair<std::basic_string_view<char,
std::char_traits<char> >, std::basic_string_view<char,
std::char_traits<char> > > >)'
2023-09-13T06:49:11
/home/.../per-package/tensorflow-lite/host/opt/ext-toolchain/bin/../lib/gcc=
/aarch64-buildroot-linux-gnu/10.3.0/../../../../aarch64-buildroot-linux-gnu=
/bin/ld:
CMakeFiles/benchmark_model.dir/benchmark_tflite_model.cc.o: in function
`tflite::benchmark::BenchmarkTfLiteModel::ValidateParams()':
2023-09-13T06:49:11 benchmark_tflite_model.cc:(.text+0x8388): undefined
reference to
`absl::lts_20211102::numbers_internal::safe_strto32_base(std::basic_string_=
view<char,
std::char_traits<char> >, int*, int)'
2023-09-13T06:49:11
/home/.../per-package/tensorflow-lite/host/opt/ext-toolchain/bin/../lib/gcc=
/aarch64-buildroot-linux-gnu/10.3.0/../../../../aarch64-buildroot-linux-gnu=
/bin/ld:
benchmark_tflite_model.cc:(.text+0x83a4): undefined reference to
`absl::lts_20211102::numbers_internal::safe_strto32_base(std::basic_string_=
view<char,
std::char_traits<char> >, int*, int)'
2023-09-13T06:49:11 collect2: error: ld returned 1 exit status
2023-09-13T06:49:11 make[6]: ***
[tools/benchmark/CMakeFiles/benchmark_model.dir/build.make:476:
tools/benchmark/benchmark_model] Error 1
2023-09-13T06:49:11 make[5]: *** [CMakeFiles/Makefile2:370:
tools/benchmark/CMakeFiles/benchmark_model.dir/all] Error 2
2023-09-13T06:49:11 make[4]: *** [CMakeFiles/Makefile2:377:
tools/benchmark/CMakeFiles/benchmark_model.dir/rule] Error 2
2023-09-13T06:49:11 make[3]: *** [Makefile:268: benchmark_model] Error 2

Do you know what the issue here?

Thank you,
Sourabh

On Tue, 5 Sept 2023 at 18:28, Sourabh Hegde <hrsourabh011@gmail.com> wrote:

> Hello James,
>
> Thanks for the update.
>
> I could build the tensorflow-lite package.
>
> Best Regards,
> Sourabh
>
>
>
> On Tue, 5 Sept 2023 at 08:07, James Hilliard <james.hilliard1@gmail.com>
> wrote:
>
>> On Mon, Sep 4, 2023 at 11:13=E2=80=AFAM Sourabh Hegde <hrsourabh011@gmai=
l.com>
>> wrote:
>> >
>> > Hello All,
>> >
>> > I am trying to add tensorflow-lite to Buildroot package and I found a
>> git (quite old)
>> https://github.com/Exein-io/buildroot-tensorflow-lite/tree/master that I
>> wanted to test.
>>
>> Try my v6 patch series:
>>
>> https://patchwork.ozlabs.org/project/buildroot/list/?series=3D346546&sub=
mitter=3D&state=3D*&q=3D&archive=3Dboth&delegate=3D
>>
>> > But while building it I am getting below error:
>> >
>> >
>> file=3D'/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c=
68cc4b2ba991967dd/tensorflow/lite/buildroot-build/pthreadpool-download/pthr=
eadpool-prefix/src/545ebe9f225aec6dca49109516fac02e973a3de2.zip'
>> > -- Downloading... done
>> > -- extracting...
>> >
>> src=3D'/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c6=
8cc4b2ba991967dd/tensorflow/lite/buildroot-build/pthreadpool-download/pthre=
adpool-prefix/src/545ebe9f225aec6dca49109516fac02e973a3de2.zip'
>> >
>> dst=3D'/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c6=
8cc4b2ba991967dd/tensorflow/lite/buildroot-build/pthreadpool-source'
>> > -- extracting... [tar xfz]
>> > -- extracting... [analysis]
>> > -- extracting... [rename]
>> > -- extracting... [clean up]
>> > -- extracting... done
>> > [ 33%] No patch step for 'pthreadpool'
>> > [ 44%] No update step for 'pthreadpool'
>> > [ 55%] No configure step for 'pthreadpool'
>> > [ 66%] No build step for 'pthreadpool'
>> > [ 77%] No install step for 'pthreadpool'
>> > [ 88%] No test step for 'pthreadpool'
>> > [100%] Completed 'pthreadpool'
>> > make[4]: Leaving directory
>> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2=
ba991967dd/tensorflow/lite/buildroot-build/pthreadpool-download'
>> > [100%] Built target pthreadpool
>> > make[3]: Leaving directory
>> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2=
ba991967dd/tensorflow/lite/buildroot-build/pthreadpool-download'
>> > make[2]: Leaving directory
>> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2=
ba991967dd/tensorflow/lite/buildroot-build/pthreadpool-download'
>> > -- Configuring incomplete, errors occurred!
>> > See also
>> "/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2=
ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeOutput.log".
>> > See also
>> "/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2=
ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeError.log".
>> > make[1]: *** [package/pkg-generic.mk:283:
>> /home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/.stamp_configured]
>> Error 1
>> > make: *** [Makefile:23: _all] Error 2
>> >
>> > The CMakeError.log
>> build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflo=
w/lite/buildroot-build/CM
>> > akeFiles shows
>> >
>> > Performing C++ SOURCE FILE Test COMPILER_SUPPORT_Wshorten64to32 failed
>> with the following output:
>> > Change Dir:
>> /home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp
>> >
>> > Run Build Command(s):/usr/bin/make cmTC_76002/fast && make[2]: Enterin=
g
>> directory
>> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2=
ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
>> > /usr/bin/make -f CMakeFiles/cmTC_76002.dir/build.make
>> CMakeFiles/cmTC_76002.dir/build
>> > make[3]: Entering directory
>> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2=
ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
>> > Building CXX object CMakeFiles/cmTC_76002.dir/src.cxx.o
>> >
>> /home/test/tmp/.../per-package/tensorflow-lite/host/bin/aarch64-linux-g+=
+
>> --sysroot=3D/home/test/tmp/.../per-package/tensorflow-lite/host/aarch64-=
buildroot-linux-gnu/sysroot
>>   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64  -O=
3 -g0
>> -D_FORTIFY_SOURCE=3D2 -ldl -latomic -funsafe-math-optimizations
>> -march=3Darmv8-a -std=3Dc++03 -pedantic -Wall -Wextra -Wundef -Wcast-ali=
gn
>> -Wchar-subscripts -Wnon-virtual-dtor -Wunused-local-typedefs
>> -Wpointer-arith -Wwrite-strings -Wformat-security
>> -DCOMPILER_SUPPORT_Wshorten64to32 -Werror  -DNDEBUG -fPIE
>>  -Wshorten-64-to-32 -o CMakeFiles/cmTC_76002.dir/src.cxx.o -c
>> /home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp/src.cxx
>> > aarch64-linux-g++.br_real: error: unrecognized command-line option
>> '-Wshorten-64-to-32'
>> > make[3]: *** [CMakeFiles/cmTC_76002.dir/build.make:66:
>> CMakeFiles/cmTC_76002.dir/src.cxx.o] Error 1
>> > make[3]: Leaving directory
>> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2=
ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
>> > make[2]: *** [Makefile:121: cmTC_76002/fast] Error 2
>> > make[2]: Leaving directory
>> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2=
ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
>> >
>> >
>> > Source file was:
>> > int main() { return 0; }
>> > Performing C++ SOURCE FILE Test COMPILER_SUPPORT_Wcpp11extensions
>> failed with the following output:
>> > Change Dir:
>> /home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp
>> >
>> > Run Build Command(s):/usr/bin/make cmTC_0b14f/fast && make[2]: Enterin=
g
>> directory
>> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2=
ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
>> > /usr/bin/make -f CMakeFiles/cmTC_0b14f.dir/build.make
>> CMakeFiles/cmTC_0b14f.dir/build
>> > make[3]: Entering directory
>> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2=
ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
>> > Building CXX object CMakeFiles/cmTC_0b14f.dir/src.cxx.o
>> >
>> /home/test/tmp/.../per-package/tensorflow-lite/host/bin/aarch64-linux-g+=
+
>> --sysroot=3D/home/test/tmp/.../per-package/tensorflow-lite/host/aarch64-=
buildroot-linux-gnu/sysroot
>>   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64  -O=
3 -g0
>> -D_FORTIFY_SOURCE=3D2 -ldl -latomic -funsafe-math-optimizations
>> -march=3Darmv8-a -std=3Dc++03 -pedantic -Wall -Wextra -Wundef -Wcast-ali=
gn
>> -Wchar-subscripts -Wnon-virtual-dtor -Wunused-local-typedefs
>> -Wpointer-arith -Wwrite-strings -Wformat-security -Wlogical-op
>> -Wenum-conversion -DCOMPILER_SUPPORT_Wcpp11extensions -Werror  -DNDEBUG
>> -fPIE   -Wc++11-extensions -o CMakeFiles/cmTC_0b14f.dir/src.cxx.o -c
>> /home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp/src.cxx
>> > aarch64-linux-g++.br_real: error: unrecognized command-line option
>> '-Wc++11-extensions'; did you mean '-fms-extensions'?
>> > make[3]: *** [CMakeFiles/cmTC_0b14f.dir/build.make:66:
>> CMakeFiles/cmTC_0b14f.dir/src.cxx.o] Error 1
>> > make[3]: Leaving directory
>> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2=
ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
>> > make[2]: *** [Makefile:121: cmTC_0b14f/fast] Error 2
>> > make[2]: Leaving directory
>> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2=
ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
>> >
>> >
>> > Source file was:
>> > int main() { return 0; }
>> > Performing C++ SOURCE FILE Test COMPILER_SUPPORT_wd981 failed with the
>> following output:
>> > Change Dir:
>> /home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp
>> >
>> > Run Build Command(s):/usr/bin/make cmTC_4c191/fast && make[2]: Enterin=
g
>> directory
>> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2=
ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
>> > /usr/bin/make -f CMakeFiles/cmTC_4c191.dir/build.make
>> CMakeFiles/cmTC_4c191.dir/build
>> > make[3]: Entering directory
>> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2=
ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
>> > Building CXX object CMakeFiles/cmTC_4c191.dir/src.cxx.o
>> >
>> /home/test/tmp/.../per-package/tensorflow-lite/host/bin/aarch64-linux-g+=
+
>> --sysroot=3D/home/test/tmp/.../per-package/tensorflow-lite/host/aarch64-=
buildroot-linux-gnu/sysroot
>>   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64  -O=
3 -g0
>> -D_FORTIFY_SOURCE=3D2 -ldl -latomic -funsafe-math-optimizations
>> -march=3Darmv8-a -std=3Dc++03 -pedantic -Wall -Wextra -Wundef -Wcast-ali=
gn
>> -Wchar-subscripts -Wnon-virtual-dtor -Wunused-local-typedefs
>> -Wpointer-arith -Wwrite-strings -Wformat-security -Wlogical-op
>> -Wenum-conversion -Wdouble-promotion -Wshadow -Wno-psabi
>> -Wno-variadic-macros -Wno-long-long -fno-check-new -fno-common
>> -fstrict-aliasing -DCOMPILER_SUPPORT_wd981 -Werror  -DNDEBUG -fPIE   -wd=
981
>> -o CMakeFiles/cmTC_4c191.dir/src.cxx.o -c
>> /home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp/src.cxx
>> > aarch64-linux-g++.br_real: error: unrecognized command-line option
>> '-wd981'
>> > make[3]: *** [CMakeFiles/cmTC_4c191.dir/build.make:66:
>> CMakeFiles/cmTC_4c191.dir/src.cxx.o] Error 1
>> > make[3]: Leaving directory
>> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2=
ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
>> > make[2]: *** [Makefile:121: cmTC_4c191/fast] Error 2
>> > make[2]: Leaving directory
>> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2=
ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
>> >
>> >
>> > Source file was:
>> > int main() { return 0; }
>> > Performing C++ SOURCE FILE Test COMPILER_SUPPORT_wd2304 failed with th=
e
>> following output:
>> > Change Dir:
>> /home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp
>> >
>> > Run Build Command(s):/usr/bin/make cmTC_3d2da/fast && make[2]: Enterin=
g
>> directory
>> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2=
ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
>> > /usr/bin/make -f CMakeFiles/cmTC_3d2da.dir/build.make
>> CMakeFiles/cmTC_3d2da.dir/build
>> > make[3]: Entering directory
>> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2=
ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
>> > Building CXX object CMakeFiles/cmTC_3d2da.dir/src.cxx.o
>> >
>> /home/test/tmp/.../per-package/tensorflow-lite/host/bin/aarch64-linux-g+=
+
>> --sysroot=3D/home/test/tmp/.../per-package/tensorflow-lite/host/aarch64-=
buildroot-linux-gnu/sysroot
>>   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64  -O=
3 -g0
>> -D_FORTIFY_SOURCE=3D2 -ldl -latomic -funsafe-math-optimizations
>> -march=3Darmv8-a -std=3Dc++03 -pedantic -Wall -Wextra -Wundef -Wcast-ali=
gn
>> -Wchar-subscripts -Wnon-virtual-dtor -Wunused-local-typedefs
>> -Wpointer-arith -Wwrite-strings -Wformat-security -Wlogical-op
>> -Wenum-conversion -Wdouble-promotion -Wshadow -Wno-psabi
>> -Wno-variadic-macros -Wno-long-long -fno-check-new -fno-common
>> -fstrict-aliasing -DCOMPILER_SUPPORT_wd2304 -Werror  -DNDEBUG -fPIE
>>  -wd2304 -o CMakeFiles/cmTC_3d2da.dir/src.cxx.o -c
>> /home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp/src.cxx
>> > aarch64-linux-g++.br_real: error: unrecognized command-line option
>> '-wd2304'
>> > make[3]: *** [CMakeFiles/cmTC_3d2da.dir/build.make:66:
>> CMakeFiles/cmTC_3d2da.dir/src.cxx.o] Error 1
>> > make[3]: Leaving directory
>> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2=
ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
>> > make[2]: *** [Makefile:121: cmTC_3d2da/fast] Error 2
>> > make[2]: Leaving directory
>> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2=
ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
>> >
>> >
>> > Source file was:
>> > int main() { return 0; }
>> > Performing C++ SOURCE FILE Test COMPILER_SUPPORT_STRICTANSI failed wit=
h
>> the following output:
>> > Change Dir:
>> /home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp
>> >
>> > Run Build Command(s):/usr/bin/make cmTC_b2340/fast && make[2]: Enterin=
g
>> directory
>> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2=
ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
>> > /usr/bin/make -f CMakeFiles/cmTC_b2340.dir/build.make
>> CMakeFiles/cmTC_b2340.dir/build
>> > make[3]: Entering directory
>> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2=
ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
>> > Building CXX object CMakeFiles/cmTC_b2340.dir/src.cxx.o
>> >
>> /home/test/tmp/.../per-package/tensorflow-lite/host/bin/aarch64-linux-g+=
+
>> --sysroot=3D/home/test/tmp/.../per-package/tensorflow-lite/host/aarch64-=
buildroot-linux-gnu/sysroot
>>   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64  -O=
3 -g0
>> -D_FORTIFY_SOURCE=3D2 -ldl -latomic -funsafe-math-optimizations
>> -march=3Darmv8-a -std=3Dc++03 -pedantic -Wall -Wextra -Wundef -Wcast-ali=
gn
>> -Wchar-subscripts -Wnon-virtual-dtor -Wunused-local-typedefs
>> -Wpointer-arith -Wwrite-strings -Wformat-security -Wlogical-op
>> -Wenum-conversion -Wdouble-promotion -Wshadow -Wno-psabi
>> -Wno-variadic-macros -Wno-long-long -fno-check-new -fno-common
>> -fstrict-aliasing -DCOMPILER_SUPPORT_STRICTANSI -Werror  -DNDEBUG -fPIE
>>  -strict-ansi -o CMakeFiles/cmTC_b2340.dir/src.cxx.o -c
>> /home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp/src.cxx
>> > aarch64-linux-g++.br_real: error: unrecognized command-line option
>> '-strict-ansi'; did you mean '-fstrict-enums'?
>> > make[3]: *** [CMakeFiles/cmTC_b2340.dir/build.make:66:
>> CMakeFiles/cmTC_b2340.dir/src.cxx.o] Error 1
>> > make[3]: Leaving directory
>> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2=
ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
>> > make[2]: *** [Makefile:121: cmTC_b2340/fast] Error 2
>> > make[2]: Leaving directory
>> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2=
ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
>> >
>> > Can anyone please let me know what could be an issue and how to resolv=
e
>> it?
>> >
>> > Thanks in advance
>> >
>> > _______________________________________________
>> > buildroot mailing list
>> > buildroot@buildroot.org
>> > https://lists.buildroot.org/mailman/listinfo/buildroot
>>
>

--00000000000009d72d06053838b1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello James,<div><br></div><div>I am trying to build the &=
quot;benchmark_model&quot; in the tensorflow-lite package. The benchmarking=
 application performs a simple TensorFlow Lite model inference and prints b=
enchmarking information.</div><div><br></div><div>In the <a href=3D"http://=
tensorflow-lite.mk">tensorflow-lite.mk</a>=C2=A0 I added new section (simil=
ar to label_image example)<br></div><div>ifeq ($(BR2_PACKAGE_TENSORFLOW_LIT=
E_BUILD_BENCHMARK_MODEL),y)<br>define TENSORFLOW_LITE_BENCHMARK_BUILD_CMDS<=
br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(TARGET_MAKE_ENV) $(BR2_CMAKE) --build $(TE=
NSORFLOW_LITE_BUILDDIR) -t benchmark_model<br>endef<br>TENSORFLOW_LITE_POST=
_BUILD_HOOKS +=3D TENSORFLOW_LITE_BENCHMARK_BUILD_CMDS<br><br></div><div>de=
fine TENSORFLOW_LITE_INSTALL_TARGET_BENCHMARK_MODEL<br>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0$(INSTALL) -D -m0755 $(@D)/tensorflow/lite/buildroot-build/to=
ols/benchmark/benchmark_model $(TARGET_DIR)/usr/bin/benchmark_model<br>ende=
f<br>TENSORFLOW_LITE_POST_INSTALL_TARGET_HOOKS +=3D TENSORFLOW_LITE_INSTALL=
_TARGET_BENCHMARK_MODEL<br>endif<br></div><div><br></div><div>But while bui=
lding this is giving error:</div><div><br></div><div>[ 98%] Building CXX ob=
ject tools/benchmark/CMakeFiles/benchmark_model.dir/__/delegates/xnnpack_de=
legate_provider.cc.o<br>2023-09-13T06:49:10 [ 98%] Building CXX object tool=
s/benchmark/CMakeFiles/benchmark_model.dir/__/delegates/external_delegate_p=
rovider.cc.o<br>2023-09-13T06:49:11 [100%] Linking CXX executable benchmark=
_model<br>2023-09-13T06:49:11 /home/.../per-package/tensorflow-lite/host/op=
t/ext-toolchain/bin/../lib/gcc/aarch64-buildroot-linux-gnu/10.3.0/../../../=
../aarch64-buildroot-linux-gnu/bin/ld: CMakeFiles/benchmark_model.dir/bench=
mark_tflite_model.cc.o: in function `absl::lts_20211102::strings_internal::=
Splitter&lt;absl::lts_20211102::ByChar, absl::lts_20211102::AllowEmpty, std=
::basic_string_view&lt;char, std::char_traits&lt;char&gt; &gt; &gt;::Conver=
tToContainer&lt;std::vector&lt;std::basic_string_view&lt;char, std::char_tr=
aits&lt;char&gt; &gt;, std::allocator&lt;std::basic_string_view&lt;char, st=
d::char_traits&lt;char&gt; &gt; &gt; &gt;, std::basic_string_view&lt;char, =
std::char_traits&lt;char&gt; &gt;, false&gt;::operator()(absl::lts_20211102=
::strings_internal::Splitter&lt;absl::lts_20211102::ByChar, absl::lts_20211=
102::AllowEmpty, std::basic_string_view&lt;char, std::char_traits&lt;char&g=
t; &gt; &gt; const&amp;) const [clone .isra.0]&#39;:<br>2023-09-13T06:49:11=
 benchmark_tflite_model.cc:(.text+0x204): undefined reference to `absl::lts=
_20211102::ByChar::Find(std::basic_string_view&lt;char, std::char_traits&lt=
;char&gt; &gt;, unsigned long) const&#39;<br>2023-09-13T06:49:11 /home/.../=
per-package/tensorflow-lite/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-b=
uildroot-linux-gnu/10.3.0/../../../../aarch64-buildroot-linux-gnu/bin/ld: b=
enchmark_tflite_model.cc:(.text+0x284): undefined reference to `absl::lts_2=
0211102::ByChar::Find(std::basic_string_view&lt;char, std::char_traits&lt;c=
har&gt; &gt;, unsigned long) const&#39;<br>2023-09-13T06:49:11 /home/.../pe=
r-package/tensorflow-lite/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-bui=
ldroot-linux-gnu/10.3.0/../../../../aarch64-buildroot-linux-gnu/bin/ld: CMa=
keFiles/benchmark_model.dir/benchmark_tflite_model.cc.o: in function `tflit=
e::benchmark::SplitInputLayerNameAndValueFile(std::__cxx11::basic_string&lt=
;char, std::char_traits&lt;char&gt;, std::allocator&lt;char&gt; &gt; const&=
amp;, std::pair&lt;std::__cxx11::basic_string&lt;char, std::char_traits&lt;=
char&gt;, std::allocator&lt;char&gt; &gt;, std::__cxx11::basic_string&lt;ch=
ar, std::char_traits&lt;char&gt;, std::allocator&lt;char&gt; &gt; &gt;&amp;=
)&#39;:<br>2023-09-13T06:49:11 benchmark_tflite_model.cc:(.text+0xcf0): und=
efined reference to `absl::lts_20211102::StrReplaceAll[abi:cxx11](std::basi=
c_string_view&lt;char, std::char_traits&lt;char&gt; &gt;, std::initializer_=
list&lt;std::pair&lt;std::basic_string_view&lt;char, std::char_traits&lt;ch=
ar&gt; &gt;, std::basic_string_view&lt;char, std::char_traits&lt;char&gt; &=
gt; &gt; &gt;)&#39;<br>2023-09-13T06:49:11 /home/.../per-package/tensorflow=
-lite/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-buildroot-linux-gnu/10.=
3.0/../../../../aarch64-buildroot-linux-gnu/bin/ld: benchmark_tflite_model.=
cc:(.text+0xdd4): undefined reference to `absl::lts_20211102::StrReplaceAll=
[abi:cxx11](std::basic_string_view&lt;char, std::char_traits&lt;char&gt; &g=
t;, std::initializer_list&lt;std::pair&lt;std::basic_string_view&lt;char, s=
td::char_traits&lt;char&gt; &gt;, std::basic_string_view&lt;char, std::char=
_traits&lt;char&gt; &gt; &gt; &gt;)&#39;<br>2023-09-13T06:49:11 /home/.../p=
er-package/tensorflow-lite/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-bu=
ildroot-linux-gnu/10.3.0/../../../../aarch64-buildroot-linux-gnu/bin/ld: CM=
akeFiles/benchmark_model.dir/benchmark_tflite_model.cc.o: in function `tfli=
te::benchmark::BenchmarkTfLiteModel::ValidateParams()&#39;:<br>2023-09-13T0=
6:49:11 benchmark_tflite_model.cc:(.text+0x8388): undefined reference to `a=
bsl::lts_20211102::numbers_internal::safe_strto32_base(std::basic_string_vi=
ew&lt;char, std::char_traits&lt;char&gt; &gt;, int*, int)&#39;<br>2023-09-1=
3T06:49:11 /home/.../per-package/tensorflow-lite/host/opt/ext-toolchain/bin=
/../lib/gcc/aarch64-buildroot-linux-gnu/10.3.0/../../../../aarch64-buildroo=
t-linux-gnu/bin/ld: benchmark_tflite_model.cc:(.text+0x83a4): undefined ref=
erence to `absl::lts_20211102::numbers_internal::safe_strto32_base(std::bas=
ic_string_view&lt;char, std::char_traits&lt;char&gt; &gt;, int*, int)&#39;<=
br>2023-09-13T06:49:11 collect2: error: ld returned 1 exit status<br>2023-0=
9-13T06:49:11 make[6]: *** [tools/benchmark/CMakeFiles/benchmark_model.dir/=
build.make:476: tools/benchmark/benchmark_model] Error 1<br>2023-09-13T06:4=
9:11 make[5]: *** [CMakeFiles/Makefile2:370: tools/benchmark/CMakeFiles/ben=
chmark_model.dir/all] Error 2<br>2023-09-13T06:49:11 make[4]: *** [CMakeFil=
es/Makefile2:377: tools/benchmark/CMakeFiles/benchmark_model.dir/rule] Erro=
r 2<br>2023-09-13T06:49:11 make[3]: *** [Makefile:268: benchmark_model] Err=
or 2<br></div><div><br></div><div>Do you know what the issue here?</div><di=
v><br></div><div>Thank you,</div><div>Sourabh</div></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 5 Sept 2023 at 1=
8:28, Sourabh Hegde &lt;<a href=3D"mailto:hrsourabh011@gmail.com" target=3D=
"_blank">hrsourabh011@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr">Hello James,<div><br></di=
v><div>Thanks for the update.</div><div><br></div><div>I could build the te=
nsorflow-lite package.</div><div><br></div><div>Best Regards,</div><div>Sou=
rabh</div><div><br></div><div>=C2=A0</div></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 5 Sept 2023 at 08:07, Jam=
es Hilliard &lt;<a href=3D"mailto:james.hilliard1@gmail.com" target=3D"_bla=
nk">james.hilliard1@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">On Mon, Sep 4, 2023 at 11:13=E2=80=AFAM Sourab=
h Hegde &lt;<a href=3D"mailto:hrsourabh011@gmail.com" target=3D"_blank">hrs=
ourabh011@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hello All,<br>
&gt;<br>
&gt; I am trying to add tensorflow-lite to Buildroot package and I found a =
git (quite old) <a href=3D"https://github.com/Exein-io/buildroot-tensorflow=
-lite/tree/master" rel=3D"noreferrer" target=3D"_blank">https://github.com/=
Exein-io/buildroot-tensorflow-lite/tree/master</a> that I wanted to test.<b=
r>
<br>
Try my v6 patch series:<br>
<a href=3D"https://patchwork.ozlabs.org/project/buildroot/list/?series=3D34=
6546&amp;submitter=3D&amp;state=3D*&amp;q=3D&amp;archive=3Dboth&amp;delegat=
e=3D" rel=3D"noreferrer" target=3D"_blank">https://patchwork.ozlabs.org/pro=
ject/buildroot/list/?series=3D346546&amp;submitter=3D&amp;state=3D*&amp;q=
=3D&amp;archive=3Dboth&amp;delegate=3D</a><br>
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
eferrer" target=3D"_blank">pkg-generic.mk:283</a>: /home/test/tmp/.../build=
/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/.stamp_configured=
] Error 1<br>
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
&gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot=
@buildroot.org</a><br>
&gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=
=3D"noreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listi=
nfo/buildroot</a><br>
</blockquote></div>
</blockquote></div>

--00000000000009d72d06053838b1--


--===============5598780440844910621==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5598780440844910621==--


