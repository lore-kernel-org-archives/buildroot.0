Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6939ACD343B
	for <buildroot@archiver.kernel.org>; Tue, 19 Sep 2023 05:11:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E3FDC400D7;
	Tue, 19 Sep 2023 05:11:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3FDC400D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uTell3Pwh3Fo; Tue, 19 Sep 2023 05:11:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9C349416A4;
	Tue, 19 Sep 2023 05:11:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C349416A4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AE7A21BF34F
 for <buildroot@lists.busybox.net>; Tue, 19 Sep 2023 05:11:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9453E61025
 for <buildroot@lists.busybox.net>; Tue, 19 Sep 2023 05:11:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9453E61025
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id glBHR0NTWyv4 for <buildroot@lists.busybox.net>;
 Tue, 19 Sep 2023 05:11:21 +0000 (UTC)
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2D77960EC2
 for <buildroot@buildroot.org>; Tue, 19 Sep 2023 05:11:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D77960EC2
Received: by mail-oi1-x22e.google.com with SMTP id
 5614622812f47-3a88ff732aeso3327930b6e.0
 for <buildroot@buildroot.org>; Mon, 18 Sep 2023 22:11:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695100280; x=1695705080;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5sp4dW3xlLsGxAcXkqMm9XAi/edF0kXHgkfeXuox5TI=;
 b=pXVCgZApPaV8uoigaSKxE+mUbuV7YYJbBgb+3/PzQpJFHiGsh1ljYeMhEKkHeDCjp2
 r91zISNciSeuPuxBlmdBQRUYobev7IWksWReBbB7Jc6xFl5ZXAzWdxodJzcQ8ArBzGjX
 r/0bcl8E9G+1R986BPrcuVj4eihV42R1BpWQkqdK2RcXX5wv8SRnVQgGNN+odljbXQw8
 HYXm6Tkb+NDHeMIUyEnce8jfkHWCoDp54mUwT6jDXTKxGY7zWGMDuKTbBs2AiiBTjPz9
 S+dqTbUg9/skEcCWKLjbDFztSabAfi26t2+YmJIHR5zrPVLxGsiuVg3v30FmLJh/pUVM
 P7UQ==
X-Gm-Message-State: AOJu0YwBT9F0BSld65Ap40UogX9nn1U62HXWlwwxhiYow72IK6V0+MfH
 rvcdN5VWmY/BTPZq8xm6dqPKJV5ojpOonERkmAXF3xa0
X-Google-Smtp-Source: AGHT+IHUbp9FejL3vd4Bn9WwAXwmVswGlN22ESYvx5FqXzuSbiCOqjCeSianNXIlXJbVByY+0c7IniRx4DNhpZYKBM0=
X-Received: by 2002:a05:6808:1407:b0:3aa:1369:e11 with SMTP id
 w7-20020a056808140700b003aa13690e11mr1026116oiv.5.1695100279878; Mon, 18 Sep
 2023 22:11:19 -0700 (PDT)
MIME-Version: 1.0
References: <CADYjeSs8Ou5-Kn4zYqAZa-qr7ALbp2xtiksY1vEb6L+D+7guZQ@mail.gmail.com>
 <CADvTj4pZXmewYMzSRF2QJcvRgzV9nA0bLDCrzEt4Yw_vAZEqBQ@mail.gmail.com>
 <CADYjeSv4hOWHjf78ULEszUUFSKbxqTCzb0ZLAw0tNHhA6LfyVg@mail.gmail.com>
 <CADYjeStbPRHh7jge5vU0Z1_5qXUdgVbQCghV2fZ6zSXASP46XQ@mail.gmail.com>
 <CADYjeStGD0sdj9iT7MDLQG8APoyBFKcLCQEtkcvDz-8WOJ4dcQ@mail.gmail.com>
 <CADYjeSvoxnVhWW9BYkEyJeudsB8ZvYk6pGOjuXJUyh49XQAU_Q@mail.gmail.com>
 <CADvTj4ou41gxNjqMbwjCwtNKGhFzz6uhCwZa+iCgBRwnjUBziQ@mail.gmail.com>
 <CADvTj4q7bCjTN75deJr=WGgoPKNCdqnQt_fkBMY9yiA-2m1v_Q@mail.gmail.com>
 <CADYjeStNG+u8osymoboH7ChLNjNGY3i3BeGLwSppybSWB9bcRg@mail.gmail.com>
 <CADvTj4qx52yQkTvR5XOu58+ssOEodovr0wynVNNhYi9tUe6KXw@mail.gmail.com>
 <CADYjeStEDyGBq3zTOiveO8vhA6v1N5UPvzVZfgrtfTCKC+iAGA@mail.gmail.com>
 <CADvTj4r37uTdWjmY2pgJKMuwizPAziQtCeCXvAL2-TPW4zyV1Q@mail.gmail.com>
In-Reply-To: <CADvTj4r37uTdWjmY2pgJKMuwizPAziQtCeCXvAL2-TPW4zyV1Q@mail.gmail.com>
From: Sourabh Hegde <hrsourabh011@gmail.com>
Date: Tue, 19 Sep 2023 07:11:08 +0200
Message-ID: <CADYjeSv9JSqQ2h160R60z75h2DJdW8pyTHdMUZksmpTi-H64=w@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695100280; x=1695705080; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5sp4dW3xlLsGxAcXkqMm9XAi/edF0kXHgkfeXuox5TI=;
 b=fvEoOss44FriOu6o0mUxS7IOe1ZK3F1mhHO7x2fSRh5LIlrDERXuUF5r+dA06KMV02
 4dPZRcmkeOvKOfqyAa4azbviVUDnqXGdLtFEXzvsPxthy4/nK62TByZFsqN1SEPVH5SY
 ICOQ7tyr9jylvkcsmgAfCM5mOGbDFrNmwOyrofbj6FxBDLpkWbS0qk0kanM5W1UHWj86
 kpQ79oBbAu1H/yDYvJlTDa7km0qkhKYdb76uo5gSKqI5rGZi+TY1u92XuE1Csui2fhxD
 QA8KEkrxDqbnyW0CwzUhMuVoUXliBk9CV2ecVjutDs78ozMu5VgEzsKEUG6f2/GoZa3m
 YWIw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=fvEoOss4
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
Cc: stefan.hager@ginzinger.com, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============1028131744417957000=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1028131744417957000==
Content-Type: multipart/alternative; boundary="0000000000000a79520605af4aad"

--0000000000000a79520605af4aad
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes, I have commented it. I also tried your PR for label_example and
it worked.

On Tue, Sep 19, 2023, 04:58 James Hilliard <james.hilliard1@gmail.com>
wrote:

> On Mon, Sep 18, 2023 at 2:11=E2=80=AFPM Sourabh Hegde <hrsourabh011@gmail=
.com>
> wrote:
> >
> > Hello James,
> >
> > I tried your PR. I created a .patch file to enable benchmark model
> config option and updated tensorflow/lite/tools/benchmark/CMakeLists.txt
> and passed -DTFLITE_ENABLE_BENCHMARK_MODEL=3DON to TENSORFLOW_LITE_CONF_O=
PTS
> in tensorflow-lite.mk but, I get same error as above
>
> Just to confirm you also removed the TENSORFLOW_LITE_BENCHMARK_BUILD_CMDS
> right?
>
> >
> > [ 98%] Building CXX object
> tools/benchmark/CMakeFiles/benchmark_model.dir/__/delegates/xnnpack_deleg=
ate_provider.cc.o
> > 2023-09-13T06:49:10 [ 98%] Building CXX object
> tools/benchmark/CMakeFiles/benchmark_model.dir/__/delegates/external_dele=
gate_provider.cc.o
> > 2023-09-13T06:49:11 [100%] Linking CXX executable benchmark_model
> > 2023-09-13T06:49:11
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
> > 2023-09-13T06:49:11 benchmark_tflite_model.cc:(.text+0x204): undefined
> reference to `absl::lts_20211102::ByChar::Find(std::basic_string_view<cha=
r,
> std::char_traits<char> >, unsigned long) const'
> > 2023-09-13T06:49:11
> /home/.../per-package/tensorflow-lite/host/opt/ext-toolchain/bin/../lib/g=
cc/aarch64-buildroot-linux-gnu/10.3.0/../../../../aarch64-buildroot-linux-g=
nu/bin/ld:
> benchmark_tflite_model.cc:(.text+0x284): undefined reference to
> `absl::lts_20211102::ByChar::Find(std::basic_string_view<char,
> std::char_traits<char> >, unsigned long) const'
> > 2023-09-13T06:49:11
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
> >
> > On Mon, 18 Sept 2023 at 19:17, James Hilliard <james.hilliard1@gmail.co=
m>
> wrote:
> >>
> >> On Mon, Sep 18, 2023 at 11:01=E2=80=AFAM Sourabh Hegde <hrsourabh011@g=
mail.com>
> wrote:
> >> >
> >> > Hi James,
> >> >
> >> > Thanks for the update and PR:
> >> > I will try this.
> >> >
> >> > However, for testing I changed the c++ std in libabseil-cpp.mk to
> "17" and rebuilt the libabseil-cpp package. There were no errors.
> >> > I did this because I read a similar error in abseil-cpp repo.
> >> >
> >> > Now I cleaned the tensorflow-lite package and rebuilt it. There were
> no errors related to linking now.. and benchmark_model is installed to
> target dir.
> >> >
> >> > Do you think is this a good approach? And is it possible to tell
> Buildroot to use c++std=3D17 for libabseil in tensorflow-lite.mk as
> TENSORFLOW_LITE_CONF_OPTS or TENSORFLOW_LITE_ENV variable?
> >>
> >> I suspect that may just be masking an issue with incorrect cmake
> options being
> >> passed to the benchmark_model build.
> >>
> >> See if the new config option in my PR fixes the build as that allows
> the build
> >> to properly use our cmake infrastructure by making it part of the main
> >> tensorflow
> >> build invocation.
> >>
> >> >
> >> > On Mon, 18 Sept 2023 at 18:38, James Hilliard <
> james.hilliard1@gmail.com> wrote:
> >> >>
> >> >> On Mon, Sep 18, 2023 at 10:22=E2=80=AFAM James Hilliard
> >> >> <james.hilliard1@gmail.com> wrote:
> >> >> >
> >> >> > On Mon, Sep 18, 2023 at 10:04=E2=80=AFAM Sourabh Hegde <
> hrsourabh011@gmail.com> wrote:
> >> >> > >
> >> >> > > Hello Stefan, James,
> >> >> > >
> >> >> > > Have you tried building the benchmark_model from
> tensorflow-lite? I am getting above errors during the build...
> >> >> > >
> >> >> > > On Fri, 15 Sept 2023 at 18:49, Sourabh Hegde <
> hrsourabh011@gmail.com> wrote:
> >> >> > >>
> >> >> > >> Hello James,
> >> >> > >>
> >> >> > >> Do you have any updates on below issue?
> >> >> > >> This would be helpful
> >> >> > >>
> >> >> > >> Thanks in advance
> >> >> > >>
> >> >> > >> On Wed, Sep 13, 2023, 09:07 Sourabh Hegde <
> hrsourabh011@gmail.com> wrote:
> >> >> > >>>
> >> >> > >>> Hello James,
> >> >> > >>>
> >> >> > >>> I am trying to build the "benchmark_model" in the
> tensorflow-lite package. The benchmarking application performs a simple
> TensorFlow Lite model inference and prints benchmarking information.
> >> >> > >>>
> >> >> > >>> In the tensorflow-lite.mk  I added new section (similar to
> label_image example)
> >> >> > >>> ifeq ($(BR2_PACKAGE_TENSORFLOW_LITE_BUILD_BENCHMARK_MODEL),y)
> >> >> > >>> define TENSORFLOW_LITE_BENCHMARK_BUILD_CMDS
> >> >> > >>>         $(TARGET_MAKE_ENV) $(BR2_CMAKE) --build
> $(TENSORFLOW_LITE_BUILDDIR) -t benchmark_model
> >> >> > >>> endef
> >> >> > >>> TENSORFLOW_LITE_POST_BUILD_HOOKS +=3D
> TENSORFLOW_LITE_BENCHMARK_BUILD_CMDS
> >> >> > >>>
> >> >> > >>> define TENSORFLOW_LITE_INSTALL_TARGET_BENCHMARK_MODEL
> >> >> > >>>          $(INSTALL) -D -m0755
> $(@D)/tensorflow/lite/buildroot-build/tools/benchmark/benchmark_model
> $(TARGET_DIR)/usr/bin/benchmark_model
> >> >> > >>> endef
> >> >> > >>> TENSORFLOW_LITE_POST_INSTALL_TARGET_HOOKS +=3D
> TENSORFLOW_LITE_INSTALL_TARGET_BENCHMARK_MODEL
> >> >> > >>> endif
> >> >> > >>>
> >> >> > >>> But while building this is giving error:
> >> >> > >>>
> >> >> > >>> [ 98%] Building CXX object
> tools/benchmark/CMakeFiles/benchmark_model.dir/__/delegates/xnnpack_deleg=
ate_provider.cc.o
> >> >> > >>> 2023-09-13T06:49:10 [ 98%] Building CXX object
> tools/benchmark/CMakeFiles/benchmark_model.dir/__/delegates/external_dele=
gate_provider.cc.o
> >> >> > >>> 2023-09-13T06:49:11 [100%] Linking CXX executable
> benchmark_model
> >> >> > >>> 2023-09-13T06:49:11
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
> >> >> > >>> 2023-09-13T06:49:11 benchmark_tflite_model.cc:(.text+0x204):
> undefined reference to
> `absl::lts_20211102::ByChar::Find(std::basic_string_view<char,
> std::char_traits<char> >, unsigned long) const'
> >> >> > >>> 2023-09-13T06:49:11
> /home/.../per-package/tensorflow-lite/host/opt/ext-toolchain/bin/../lib/g=
cc/aarch64-buildroot-linux-gnu/10.3.0/../../../../aarch64-buildroot-linux-g=
nu/bin/ld:
> benchmark_tflite_model.cc:(.text+0x284): undefined reference to
> `absl::lts_20211102::ByChar::Find(std::basic_string_view<char,
> std::char_traits<char> >, unsigned long) const'
> >> >> > >>> 2023-09-13T06:49:11
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
> >> >> > >>> 2023-09-13T06:49:11 benchmark_tflite_model.cc:(.text+0xcf0):
> undefined reference to
> `absl::lts_20211102::StrReplaceAll[abi:cxx11](std::basic_string_view<char=
,
> std::char_traits<char> >,
> std::initializer_list<std::pair<std::basic_string_view<char,
> std::char_traits<char> >, std::basic_string_view<char,
> std::char_traits<char> > > >)'
> >> >> > >>> 2023-09-13T06:49:11
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
> >> >> > >>> 2023-09-13T06:49:11
> /home/.../per-package/tensorflow-lite/host/opt/ext-toolchain/bin/../lib/g=
cc/aarch64-buildroot-linux-gnu/10.3.0/../../../../aarch64-buildroot-linux-g=
nu/bin/ld:
> CMakeFiles/benchmark_model.dir/benchmark_tflite_model.cc.o: in function
> `tflite::benchmark::BenchmarkTfLiteModel::ValidateParams()':
> >> >> > >>> 2023-09-13T06:49:11 benchmark_tflite_model.cc:(.text+0x8388):
> undefined reference to
> `absl::lts_20211102::numbers_internal::safe_strto32_base(std::basic_strin=
g_view<char,
> std::char_traits<char> >, int*, int)'
> >> >> > >>> 2023-09-13T06:49:11
> /home/.../per-package/tensorflow-lite/host/opt/ext-toolchain/bin/../lib/g=
cc/aarch64-buildroot-linux-gnu/10.3.0/../../../../aarch64-buildroot-linux-g=
nu/bin/ld:
> benchmark_tflite_model.cc:(.text+0x83a4): undefined reference to
> `absl::lts_20211102::numbers_internal::safe_strto32_base(std::basic_strin=
g_view<char,
> std::char_traits<char> >, int*, int)'
> >> >> > >>> 2023-09-13T06:49:11 collect2: error: ld returned 1 exit statu=
s
> >> >> > >>> 2023-09-13T06:49:11 make[6]: ***
> [tools/benchmark/CMakeFiles/benchmark_model.dir/build.make:476:
> tools/benchmark/benchmark_model] Error 1
> >> >> > >>> 2023-09-13T06:49:11 make[5]: *** [CMakeFiles/Makefile2:370:
> tools/benchmark/CMakeFiles/benchmark_model.dir/all] Error 2
> >> >> > >>> 2023-09-13T06:49:11 make[4]: *** [CMakeFiles/Makefile2:377:
> tools/benchmark/CMakeFiles/benchmark_model.dir/rule] Error 2
> >> >> > >>> 2023-09-13T06:49:11 make[3]: *** [Makefile:268:
> benchmark_model] Error 2
> >> >> > >>>
> >> >> > >>> Do you know what the issue here?
> >> >> >
> >> >> > You probably need to patch the tensorflow source code similar to
> this
> >> >> > as we don't
> >> >> > really support multiple cmake build invocations for a single
> package:
> >> >> > https://github.com/tensorflow/tensorflow/pull/60021
> >> >> >
> >> >> > This line is preventing it from being built properly as part of t=
he
> >> >> > normal tensorflow-lite
> >> >> > build:
> >> >> >
> https://github.com/tensorflow/tensorflow/blob/v2.11.0/tensorflow/lite/too=
ls/benchmark/CMakeLists.txt#L84
> >> >>
> >> >> Try applying these changes and enabling the new cmake config flag:
> >> >> https://github.com/tensorflow/tensorflow/pull/61897
> >> >>
> >> >> >
> >> >> > >>>
> >> >> > >>> Thank you,
> >> >> > >>> Sourabh
> >> >> > >>>
> >> >> > >>> On Tue, 5 Sept 2023 at 18:28, Sourabh Hegde <
> hrsourabh011@gmail.com> wrote:
> >> >> > >>>>
> >> >> > >>>> Hello James,
> >> >> > >>>>
> >> >> > >>>> Thanks for the update.
> >> >> > >>>>
> >> >> > >>>> I could build the tensorflow-lite package.
> >> >> > >>>>
> >> >> > >>>> Best Regards,
> >> >> > >>>> Sourabh
> >> >> > >>>>
> >> >> > >>>>
> >> >> > >>>>
> >> >> > >>>> On Tue, 5 Sept 2023 at 08:07, James Hilliard <
> james.hilliard1@gmail.com> wrote:
> >> >> > >>>>>
> >> >> > >>>>> On Mon, Sep 4, 2023 at 11:13=E2=80=AFAM Sourabh Hegde <
> hrsourabh011@gmail.com> wrote:
> >> >> > >>>>> >
> >> >> > >>>>> > Hello All,
> >> >> > >>>>> >
> >> >> > >>>>> > I am trying to add tensorflow-lite to Buildroot package
> and I found a git (quite old)
> https://github.com/Exein-io/buildroot-tensorflow-lite/tree/master that I
> wanted to test.
> >> >> > >>>>>
> >> >> > >>>>> Try my v6 patch series:
> >> >> > >>>>>
> https://patchwork.ozlabs.org/project/buildroot/list/?series=3D346546&subm=
itter=3D&state=3D*&q=3D&archive=3Dboth&delegate=3D
> >> >> > >>>>>
> >> >> > >>>>> > But while building it I am getting below error:
> >> >> > >>>>> >
> >> >> > >>>>> >
> file=3D'/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c6=
8cc4b2ba991967dd/tensorflow/lite/buildroot-build/pthreadpool-download/pthre=
adpool-prefix/src/545ebe9f225aec6dca49109516fac02e973a3de2.zip'
> >> >> > >>>>> > -- Downloading... done
> >> >> > >>>>> > -- extracting...
> >> >> > >>>>> >
> src=3D'/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68=
cc4b2ba991967dd/tensorflow/lite/buildroot-build/pthreadpool-download/pthrea=
dpool-prefix/src/545ebe9f225aec6dca49109516fac02e973a3de2.zip'
> >> >> > >>>>> >
> dst=3D'/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68=
cc4b2ba991967dd/tensorflow/lite/buildroot-build/pthreadpool-source'
> >> >> > >>>>> > -- extracting... [tar xfz]
> >> >> > >>>>> > -- extracting... [analysis]
> >> >> > >>>>> > -- extracting... [rename]
> >> >> > >>>>> > -- extracting... [clean up]
> >> >> > >>>>> > -- extracting... done
> >> >> > >>>>> > [ 33%] No patch step for 'pthreadpool'
> >> >> > >>>>> > [ 44%] No update step for 'pthreadpool'
> >> >> > >>>>> > [ 55%] No configure step for 'pthreadpool'
> >> >> > >>>>> > [ 66%] No build step for 'pthreadpool'
> >> >> > >>>>> > [ 77%] No install step for 'pthreadpool'
> >> >> > >>>>> > [ 88%] No test step for 'pthreadpool'
> >> >> > >>>>> > [100%] Completed 'pthreadpool'
> >> >> > >>>>> > make[4]: Leaving directory
> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/pthreadpool-download'
> >> >> > >>>>> > [100%] Built target pthreadpool
> >> >> > >>>>> > make[3]: Leaving directory
> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/pthreadpool-download'
> >> >> > >>>>> > make[2]: Leaving directory
> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/pthreadpool-download'
> >> >> > >>>>> > -- Configuring incomplete, errors occurred!
> >> >> > >>>>> > See also
> "/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeOutput.log".
> >> >> > >>>>> > See also
> "/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeError.log".
> >> >> > >>>>> > make[1]: *** [package/pkg-generic.mk:283:
> /home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba=
991967dd/.stamp_configured]
> Error 1
> >> >> > >>>>> > make: *** [Makefile:23: _all] Error 2
> >> >> > >>>>> >
> >> >> > >>>>> > The CMakeError.log
> build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow=
/lite/buildroot-build/CM
> >> >> > >>>>> > akeFiles shows
> >> >> > >>>>> >
> >> >> > >>>>> > Performing C++ SOURCE FILE Test
> COMPILER_SUPPORT_Wshorten64to32 failed with the following output:
> >> >> > >>>>> > Change Dir:
> /home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba=
991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp
> >> >> > >>>>> >
> >> >> > >>>>> > Run Build Command(s):/usr/bin/make cmTC_76002/fast &&
> make[2]: Entering directory
> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
> >> >> > >>>>> > /usr/bin/make -f CMakeFiles/cmTC_76002.dir/build.make
> CMakeFiles/cmTC_76002.dir/build
> >> >> > >>>>> > make[3]: Entering directory
> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
> >> >> > >>>>> > Building CXX object CMakeFiles/cmTC_76002.dir/src.cxx.o
> >> >> > >>>>> >
> /home/test/tmp/.../per-package/tensorflow-lite/host/bin/aarch64-linux-g++
> --sysroot=3D/home/test/tmp/.../per-package/tensorflow-lite/host/aarch64-b=
uildroot-linux-gnu/sysroot
>   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64  -O3=
 -g0
> -D_FORTIFY_SOURCE=3D2 -ldl -latomic -funsafe-math-optimizations
> -march=3Darmv8-a -std=3Dc++03 -pedantic -Wall -Wextra -Wundef -Wcast-alig=
n
> -Wchar-subscripts -Wnon-virtual-dtor -Wunused-local-typedefs
> -Wpointer-arith -Wwrite-strings -Wformat-security
> -DCOMPILER_SUPPORT_Wshorten64to32 -Werror  -DNDEBUG -fPIE
>  -Wshorten-64-to-32 -o CMakeFiles/cmTC_76002.dir/src.cxx.o -c
> /home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba=
991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp/src.cxx
> >> >> > >>>>> > aarch64-linux-g++.br_real: error: unrecognized
> command-line option '-Wshorten-64-to-32'
> >> >> > >>>>> > make[3]: *** [CMakeFiles/cmTC_76002.dir/build.make:66:
> CMakeFiles/cmTC_76002.dir/src.cxx.o] Error 1
> >> >> > >>>>> > make[3]: Leaving directory
> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
> >> >> > >>>>> > make[2]: *** [Makefile:121: cmTC_76002/fast] Error 2
> >> >> > >>>>> > make[2]: Leaving directory
> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
> >> >> > >>>>> >
> >> >> > >>>>> >
> >> >> > >>>>> > Source file was:
> >> >> > >>>>> > int main() { return 0; }
> >> >> > >>>>> > Performing C++ SOURCE FILE Test
> COMPILER_SUPPORT_Wcpp11extensions failed with the following output:
> >> >> > >>>>> > Change Dir:
> /home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba=
991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp
> >> >> > >>>>> >
> >> >> > >>>>> > Run Build Command(s):/usr/bin/make cmTC_0b14f/fast &&
> make[2]: Entering directory
> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
> >> >> > >>>>> > /usr/bin/make -f CMakeFiles/cmTC_0b14f.dir/build.make
> CMakeFiles/cmTC_0b14f.dir/build
> >> >> > >>>>> > make[3]: Entering directory
> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
> >> >> > >>>>> > Building CXX object CMakeFiles/cmTC_0b14f.dir/src.cxx.o
> >> >> > >>>>> >
> /home/test/tmp/.../per-package/tensorflow-lite/host/bin/aarch64-linux-g++
> --sysroot=3D/home/test/tmp/.../per-package/tensorflow-lite/host/aarch64-b=
uildroot-linux-gnu/sysroot
>   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64  -O3=
 -g0
> -D_FORTIFY_SOURCE=3D2 -ldl -latomic -funsafe-math-optimizations
> -march=3Darmv8-a -std=3Dc++03 -pedantic -Wall -Wextra -Wundef -Wcast-alig=
n
> -Wchar-subscripts -Wnon-virtual-dtor -Wunused-local-typedefs
> -Wpointer-arith -Wwrite-strings -Wformat-security -Wlogical-op
> -Wenum-conversion -DCOMPILER_SUPPORT_Wcpp11extensions -Werror  -DNDEBUG
> -fPIE   -Wc++11-extensions -o CMakeFiles/cmTC_0b14f.dir/src.cxx.o -c
> /home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba=
991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp/src.cxx
> >> >> > >>>>> > aarch64-linux-g++.br_real: error: unrecognized
> command-line option '-Wc++11-extensions'; did you mean '-fms-extensions'?
> >> >> > >>>>> > make[3]: *** [CMakeFiles/cmTC_0b14f.dir/build.make:66:
> CMakeFiles/cmTC_0b14f.dir/src.cxx.o] Error 1
> >> >> > >>>>> > make[3]: Leaving directory
> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
> >> >> > >>>>> > make[2]: *** [Makefile:121: cmTC_0b14f/fast] Error 2
> >> >> > >>>>> > make[2]: Leaving directory
> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
> >> >> > >>>>> >
> >> >> > >>>>> >
> >> >> > >>>>> > Source file was:
> >> >> > >>>>> > int main() { return 0; }
> >> >> > >>>>> > Performing C++ SOURCE FILE Test COMPILER_SUPPORT_wd981
> failed with the following output:
> >> >> > >>>>> > Change Dir:
> /home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba=
991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp
> >> >> > >>>>> >
> >> >> > >>>>> > Run Build Command(s):/usr/bin/make cmTC_4c191/fast &&
> make[2]: Entering directory
> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
> >> >> > >>>>> > /usr/bin/make -f CMakeFiles/cmTC_4c191.dir/build.make
> CMakeFiles/cmTC_4c191.dir/build
> >> >> > >>>>> > make[3]: Entering directory
> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
> >> >> > >>>>> > Building CXX object CMakeFiles/cmTC_4c191.dir/src.cxx.o
> >> >> > >>>>> >
> /home/test/tmp/.../per-package/tensorflow-lite/host/bin/aarch64-linux-g++
> --sysroot=3D/home/test/tmp/.../per-package/tensorflow-lite/host/aarch64-b=
uildroot-linux-gnu/sysroot
>   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64  -O3=
 -g0
> -D_FORTIFY_SOURCE=3D2 -ldl -latomic -funsafe-math-optimizations
> -march=3Darmv8-a -std=3Dc++03 -pedantic -Wall -Wextra -Wundef -Wcast-alig=
n
> -Wchar-subscripts -Wnon-virtual-dtor -Wunused-local-typedefs
> -Wpointer-arith -Wwrite-strings -Wformat-security -Wlogical-op
> -Wenum-conversion -Wdouble-promotion -Wshadow -Wno-psabi
> -Wno-variadic-macros -Wno-long-long -fno-check-new -fno-common
> -fstrict-aliasing -DCOMPILER_SUPPORT_wd981 -Werror  -DNDEBUG -fPIE   -wd9=
81
> -o CMakeFiles/cmTC_4c191.dir/src.cxx.o -c
> /home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba=
991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp/src.cxx
> >> >> > >>>>> > aarch64-linux-g++.br_real: error: unrecognized
> command-line option '-wd981'
> >> >> > >>>>> > make[3]: *** [CMakeFiles/cmTC_4c191.dir/build.make:66:
> CMakeFiles/cmTC_4c191.dir/src.cxx.o] Error 1
> >> >> > >>>>> > make[3]: Leaving directory
> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
> >> >> > >>>>> > make[2]: *** [Makefile:121: cmTC_4c191/fast] Error 2
> >> >> > >>>>> > make[2]: Leaving directory
> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
> >> >> > >>>>> >
> >> >> > >>>>> >
> >> >> > >>>>> > Source file was:
> >> >> > >>>>> > int main() { return 0; }
> >> >> > >>>>> > Performing C++ SOURCE FILE Test COMPILER_SUPPORT_wd2304
> failed with the following output:
> >> >> > >>>>> > Change Dir:
> /home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba=
991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp
> >> >> > >>>>> >
> >> >> > >>>>> > Run Build Command(s):/usr/bin/make cmTC_3d2da/fast &&
> make[2]: Entering directory
> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
> >> >> > >>>>> > /usr/bin/make -f CMakeFiles/cmTC_3d2da.dir/build.make
> CMakeFiles/cmTC_3d2da.dir/build
> >> >> > >>>>> > make[3]: Entering directory
> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
> >> >> > >>>>> > Building CXX object CMakeFiles/cmTC_3d2da.dir/src.cxx.o
> >> >> > >>>>> >
> /home/test/tmp/.../per-package/tensorflow-lite/host/bin/aarch64-linux-g++
> --sysroot=3D/home/test/tmp/.../per-package/tensorflow-lite/host/aarch64-b=
uildroot-linux-gnu/sysroot
>   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64  -O3=
 -g0
> -D_FORTIFY_SOURCE=3D2 -ldl -latomic -funsafe-math-optimizations
> -march=3Darmv8-a -std=3Dc++03 -pedantic -Wall -Wextra -Wundef -Wcast-alig=
n
> -Wchar-subscripts -Wnon-virtual-dtor -Wunused-local-typedefs
> -Wpointer-arith -Wwrite-strings -Wformat-security -Wlogical-op
> -Wenum-conversion -Wdouble-promotion -Wshadow -Wno-psabi
> -Wno-variadic-macros -Wno-long-long -fno-check-new -fno-common
> -fstrict-aliasing -DCOMPILER_SUPPORT_wd2304 -Werror  -DNDEBUG -fPIE
>  -wd2304 -o CMakeFiles/cmTC_3d2da.dir/src.cxx.o -c
> /home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba=
991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp/src.cxx
> >> >> > >>>>> > aarch64-linux-g++.br_real: error: unrecognized
> command-line option '-wd2304'
> >> >> > >>>>> > make[3]: *** [CMakeFiles/cmTC_3d2da.dir/build.make:66:
> CMakeFiles/cmTC_3d2da.dir/src.cxx.o] Error 1
> >> >> > >>>>> > make[3]: Leaving directory
> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
> >> >> > >>>>> > make[2]: *** [Makefile:121: cmTC_3d2da/fast] Error 2
> >> >> > >>>>> > make[2]: Leaving directory
> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
> >> >> > >>>>> >
> >> >> > >>>>> >
> >> >> > >>>>> > Source file was:
> >> >> > >>>>> > int main() { return 0; }
> >> >> > >>>>> > Performing C++ SOURCE FILE Test
> COMPILER_SUPPORT_STRICTANSI failed with the following output:
> >> >> > >>>>> > Change Dir:
> /home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba=
991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp
> >> >> > >>>>> >
> >> >> > >>>>> > Run Build Command(s):/usr/bin/make cmTC_b2340/fast &&
> make[2]: Entering directory
> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
> >> >> > >>>>> > /usr/bin/make -f CMakeFiles/cmTC_b2340.dir/build.make
> CMakeFiles/cmTC_b2340.dir/build
> >> >> > >>>>> > make[3]: Entering directory
> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
> >> >> > >>>>> > Building CXX object CMakeFiles/cmTC_b2340.dir/src.cxx.o
> >> >> > >>>>> >
> /home/test/tmp/.../per-package/tensorflow-lite/host/bin/aarch64-linux-g++
> --sysroot=3D/home/test/tmp/.../per-package/tensorflow-lite/host/aarch64-b=
uildroot-linux-gnu/sysroot
>   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64  -O3=
 -g0
> -D_FORTIFY_SOURCE=3D2 -ldl -latomic -funsafe-math-optimizations
> -march=3Darmv8-a -std=3Dc++03 -pedantic -Wall -Wextra -Wundef -Wcast-alig=
n
> -Wchar-subscripts -Wnon-virtual-dtor -Wunused-local-typedefs
> -Wpointer-arith -Wwrite-strings -Wformat-security -Wlogical-op
> -Wenum-conversion -Wdouble-promotion -Wshadow -Wno-psabi
> -Wno-variadic-macros -Wno-long-long -fno-check-new -fno-common
> -fstrict-aliasing -DCOMPILER_SUPPORT_STRICTANSI -Werror  -DNDEBUG -fPIE
>  -strict-ansi -o CMakeFiles/cmTC_b2340.dir/src.cxx.o -c
> /home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba=
991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp/src.cxx
> >> >> > >>>>> > aarch64-linux-g++.br_real: error: unrecognized
> command-line option '-strict-ansi'; did you mean '-fstrict-enums'?
> >> >> > >>>>> > make[3]: *** [CMakeFiles/cmTC_b2340.dir/build.make:66:
> CMakeFiles/cmTC_b2340.dir/src.cxx.o] Error 1
> >> >> > >>>>> > make[3]: Leaving directory
> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
> >> >> > >>>>> > make[2]: *** [Makefile:121: cmTC_b2340/fast] Error 2
> >> >> > >>>>> > make[2]: Leaving directory
> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
> >> >> > >>>>> >
> >> >> > >>>>> > Can anyone please let me know what could be an issue and
> how to resolve it?
> >> >> > >>>>> >
> >> >> > >>>>> > Thanks in advance
> >> >> > >>>>> >
> >> >> > >>>>> > _______________________________________________
> >> >> > >>>>> > buildroot mailing list
> >> >> > >>>>> > buildroot@buildroot.org
> >> >> > >>>>> > https://lists.buildroot.org/mailman/listinfo/buildroot
>

--0000000000000a79520605af4aad
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Yes, I have commented it. I also tried your PR for label_=
example and it=C2=A0worked.</div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Tue, Sep 19, 2023, 04:58 James Hilliard &lt;<=
a href=3D"mailto:james.hilliard1@gmail.com">james.hilliard1@gmail.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">On Mon, Sep 18, 2023 at 2=
:11=E2=80=AFPM Sourabh Hegde &lt;<a href=3D"mailto:hrsourabh011@gmail.com" =
target=3D"_blank" rel=3D"noreferrer">hrsourabh011@gmail.com</a>&gt; wrote:<=
br>
&gt;<br>
&gt; Hello James,<br>
&gt;<br>
&gt; I tried your PR. I created a .patch file to enable benchmark model con=
fig option and updated tensorflow/lite/tools/benchmark/CMakeLists.txt and p=
assed -DTFLITE_ENABLE_BENCHMARK_MODEL=3DON to TENSORFLOW_LITE_CONF_OPTS in =
<a href=3D"http://tensorflow-lite.mk" rel=3D"noreferrer noreferrer" target=
=3D"_blank">tensorflow-lite.mk</a> but, I get same error as above<br>
<br>
Just to confirm you also removed the TENSORFLOW_LITE_BENCHMARK_BUILD_CMDS r=
ight?<br>
<br>
&gt;<br>
&gt; [ 98%] Building CXX object tools/benchmark/CMakeFiles/benchmark_model.=
dir/__/delegates/xnnpack_delegate_provider.cc.o<br>
&gt; 2023-09-13T06:49:10 [ 98%] Building CXX object tools/benchmark/CMakeFi=
les/benchmark_model.dir/__/delegates/external_delegate_provider.cc.o<br>
&gt; 2023-09-13T06:49:11 [100%] Linking CXX executable benchmark_model<br>
&gt; 2023-09-13T06:49:11 /home/.../per-package/tensorflow-lite/host/opt/ext=
-toolchain/bin/../lib/gcc/aarch64-buildroot-linux-gnu/10.3.0/../../../../aa=
rch64-buildroot-linux-gnu/bin/ld: CMakeFiles/benchmark_model.dir/benchmark_=
tflite_model.cc.o: in function `absl::lts_20211102::strings_internal::Split=
ter&lt;absl::lts_20211102::ByChar, absl::lts_20211102::AllowEmpty, std::bas=
ic_string_view&lt;char, std::char_traits&lt;char&gt; &gt; &gt;::ConvertToCo=
ntainer&lt;std::vector&lt;std::basic_string_view&lt;char, std::char_traits&=
lt;char&gt; &gt;, std::allocator&lt;std::basic_string_view&lt;char, std::ch=
ar_traits&lt;char&gt; &gt; &gt; &gt;, std::basic_string_view&lt;char, std::=
char_traits&lt;char&gt; &gt;, false&gt;::operator()(absl::lts_20211102::str=
ings_internal::Splitter&lt;absl::lts_20211102::ByChar, absl::lts_20211102::=
AllowEmpty, std::basic_string_view&lt;char, std::char_traits&lt;char&gt; &g=
t; &gt; const&amp;) const [clone .isra.0]&#39;:<br>
&gt; 2023-09-13T06:49:11 benchmark_tflite_model.cc:(.text+0x204): undefined=
 reference to `absl::lts_20211102::ByChar::Find(std::basic_string_view&lt;c=
har, std::char_traits&lt;char&gt; &gt;, unsigned long) const&#39;<br>
&gt; 2023-09-13T06:49:11 /home/.../per-package/tensorflow-lite/host/opt/ext=
-toolchain/bin/../lib/gcc/aarch64-buildroot-linux-gnu/10.3.0/../../../../aa=
rch64-buildroot-linux-gnu/bin/ld: benchmark_tflite_model.cc:(.text+0x284): =
undefined reference to `absl::lts_20211102::ByChar::Find(std::basic_string_=
view&lt;char, std::char_traits&lt;char&gt; &gt;, unsigned long) const&#39;<=
br>
&gt; 2023-09-13T06:49:11 /home/.../per-package/tensorflow-lite/host/opt/ext=
-toolchain/bin/../lib/gcc/aarch64-buildroot-linux-gnu/10.3.0/../../../../aa=
rch64-buildroot-linux-gnu/bin/ld: CMakeFiles/benchmark_model.dir/benchmark_=
tflite_model.cc.o: in function `tflite::benchmark::SplitInputLayerNameAndVa=
lueFile(std::__cxx11::basic_string&lt;char, std::char_traits&lt;char&gt;, s=
td::allocator&lt;char&gt; &gt; const&amp;, std::pair&lt;std::__cxx11::basic=
_string&lt;char, std::char_traits&lt;char&gt;, std::allocator&lt;char&gt; &=
gt;, std::__cxx11::basic_string&lt;char, std::char_traits&lt;char&gt;, std:=
:allocator&lt;char&gt; &gt; &gt;&amp;)&#39;:<br>
&gt;<br>
&gt; On Mon, 18 Sept 2023 at 19:17, James Hilliard &lt;<a href=3D"mailto:ja=
mes.hilliard1@gmail.com" target=3D"_blank" rel=3D"noreferrer">james.hilliar=
d1@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Mon, Sep 18, 2023 at 11:01=E2=80=AFAM Sourabh Hegde &lt;<a href=
=3D"mailto:hrsourabh011@gmail.com" target=3D"_blank" rel=3D"noreferrer">hrs=
ourabh011@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Hi James,<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Thanks for the update and PR:<br>
&gt;&gt; &gt; I will try this.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; However, for testing I changed the c++ std in <a href=3D"http=
://libabseil-cpp.mk" rel=3D"noreferrer noreferrer" target=3D"_blank">libabs=
eil-cpp.mk</a> to &quot;17&quot; and rebuilt the libabseil-cpp package. The=
re were no errors.<br>
&gt;&gt; &gt; I did this because I read a similar error in abseil-cpp repo.=
<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Now I cleaned the tensorflow-lite package and rebuilt it. The=
re were no errors related to linking now.. and benchmark_model is installed=
 to target dir.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Do you think is this a good approach? And is it possible to t=
ell Buildroot to use c++std=3D17 for libabseil in <a href=3D"http://tensorf=
low-lite.mk" rel=3D"noreferrer noreferrer" target=3D"_blank">tensorflow-lit=
e.mk</a> as TENSORFLOW_LITE_CONF_OPTS or TENSORFLOW_LITE_ENV variable?<br>
&gt;&gt;<br>
&gt;&gt; I suspect that may just be masking an issue with incorrect cmake o=
ptions being<br>
&gt;&gt; passed to the benchmark_model build.<br>
&gt;&gt;<br>
&gt;&gt; See if the new config option in my PR fixes the build as that allo=
ws the build<br>
&gt;&gt; to properly use our cmake infrastructure by making it part of the =
main<br>
&gt;&gt; tensorflow<br>
&gt;&gt; build invocation.<br>
&gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; On Mon, 18 Sept 2023 at 18:38, James Hilliard &lt;<a href=3D"=
mailto:james.hilliard1@gmail.com" target=3D"_blank" rel=3D"noreferrer">jame=
s.hilliard1@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; On Mon, Sep 18, 2023 at 10:22=E2=80=AFAM James Hilliard<b=
r>
&gt;&gt; &gt;&gt; &lt;<a href=3D"mailto:james.hilliard1@gmail.com" target=
=3D"_blank" rel=3D"noreferrer">james.hilliard1@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; On Mon, Sep 18, 2023 at 10:04=E2=80=AFAM Sourabh Heg=
de &lt;<a href=3D"mailto:hrsourabh011@gmail.com" target=3D"_blank" rel=3D"n=
oreferrer">hrsourabh011@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt; Hello Stefan, James,<br>
&gt;&gt; &gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt; Have you tried building the benchmark_model fro=
m tensorflow-lite? I am getting above errors during the build...<br>
&gt;&gt; &gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt; On Fri, 15 Sept 2023 at 18:49, Sourabh Hegde &l=
t;<a href=3D"mailto:hrsourabh011@gmail.com" target=3D"_blank" rel=3D"norefe=
rrer">hrsourabh011@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; Hello James,<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; Do you have any updates on below issue?<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; This would be helpful<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; Thanks in advance<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; On Wed, Sep 13, 2023, 09:07 Sourabh Hegde &=
lt;<a href=3D"mailto:hrsourabh011@gmail.com" target=3D"_blank" rel=3D"noref=
errer">hrsourabh011@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt; Hello James,<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt; I am trying to build the &quot;benchmar=
k_model&quot; in the tensorflow-lite package. The benchmarking application =
performs a simple TensorFlow Lite model inference and prints benchmarking i=
nformation.<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt; In the <a href=3D"http://tensorflow-lit=
e.mk" rel=3D"noreferrer noreferrer" target=3D"_blank">tensorflow-lite.mk</a=
>=C2=A0 I added new section (similar to label_image example)<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt; ifeq ($(BR2_PACKAGE_TENSORFLOW_LITE_BUI=
LD_BENCHMARK_MODEL),y)<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt; define TENSORFLOW_LITE_BENCHMARK_BUILD_=
CMDS<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(TARG=
ET_MAKE_ENV) $(BR2_CMAKE) --build $(TENSORFLOW_LITE_BUILDDIR) -t benchmark_=
model<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt; endef<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt; TENSORFLOW_LITE_POST_BUILD_HOOKS +=3D T=
ENSORFLOW_LITE_BENCHMARK_BUILD_CMDS<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt; define TENSORFLOW_LITE_INSTALL_TARGET_B=
ENCHMARK_MODEL<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(INS=
TALL) -D -m0755 $(@D)/tensorflow/lite/buildroot-build/tools/benchmark/bench=
mark_model $(TARGET_DIR)/usr/bin/benchmark_model<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt; endef<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt; TENSORFLOW_LITE_POST_INSTALL_TARGET_HOO=
KS +=3D TENSORFLOW_LITE_INSTALL_TARGET_BENCHMARK_MODEL<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt; endif<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt; But while building this is giving error=
:<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt; [ 98%] Building CXX object tools/benchm=
ark/CMakeFiles/benchmark_model.dir/__/delegates/xnnpack_delegate_provider.c=
c.o<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt; 2023-09-13T06:49:10 [ 98%] Building CXX=
 object tools/benchmark/CMakeFiles/benchmark_model.dir/__/delegates/externa=
l_delegate_provider.cc.o<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt; 2023-09-13T06:49:11 [100%] Linking CXX =
executable benchmark_model<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt; 2023-09-13T06:49:11 /home/.../per-packa=
ge/tensorflow-lite/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-buildroot-=
linux-gnu/10.3.0/../../../../aarch64-buildroot-linux-gnu/bin/ld: CMakeFiles=
/benchmark_model.dir/benchmark_tflite_model.cc.o: in function `absl::lts_20=
211102::strings_internal::Splitter&lt;absl::lts_20211102::ByChar, absl::lts=
_20211102::AllowEmpty, std::basic_string_view&lt;char, std::char_traits&lt;=
char&gt; &gt; &gt;::ConvertToContainer&lt;std::vector&lt;std::basic_string_=
view&lt;char, std::char_traits&lt;char&gt; &gt;, std::allocator&lt;std::bas=
ic_string_view&lt;char, std::char_traits&lt;char&gt; &gt; &gt; &gt;, std::b=
asic_string_view&lt;char, std::char_traits&lt;char&gt; &gt;, false&gt;::ope=
rator()(absl::lts_20211102::strings_internal::Splitter&lt;absl::lts_2021110=
2::ByChar, absl::lts_20211102::AllowEmpty, std::basic_string_view&lt;char, =
std::char_traits&lt;char&gt; &gt; &gt; const&amp;) const [clone .isra.0]&#3=
9;:<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt; 2023-09-13T06:49:11 benchmark_tflite_mo=
del.cc:(.text+0x204): undefined reference to `absl::lts_20211102::ByChar::F=
ind(std::basic_string_view&lt;char, std::char_traits&lt;char&gt; &gt;, unsi=
gned long) const&#39;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt; 2023-09-13T06:49:11 /home/.../per-packa=
ge/tensorflow-lite/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-buildroot-=
linux-gnu/10.3.0/../../../../aarch64-buildroot-linux-gnu/bin/ld: benchmark_=
tflite_model.cc:(.text+0x284): undefined reference to `absl::lts_20211102::=
ByChar::Find(std::basic_string_view&lt;char, std::char_traits&lt;char&gt; &=
gt;, unsigned long) const&#39;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt; 2023-09-13T06:49:11 /home/.../per-packa=
ge/tensorflow-lite/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-buildroot-=
linux-gnu/10.3.0/../../../../aarch64-buildroot-linux-gnu/bin/ld: CMakeFiles=
/benchmark_model.dir/benchmark_tflite_model.cc.o: in function `tflite::benc=
hmark::SplitInputLayerNameAndValueFile(std::__cxx11::basic_string&lt;char, =
std::char_traits&lt;char&gt;, std::allocator&lt;char&gt; &gt; const&amp;, s=
td::pair&lt;std::__cxx11::basic_string&lt;char, std::char_traits&lt;char&gt=
;, std::allocator&lt;char&gt; &gt;, std::__cxx11::basic_string&lt;char, std=
::char_traits&lt;char&gt;, std::allocator&lt;char&gt; &gt; &gt;&amp;)&#39;:=
<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt; 2023-09-13T06:49:11 benchmark_tflite_mo=
del.cc:(.text+0xcf0): undefined reference to `absl::lts_20211102::StrReplac=
eAll[abi:cxx11](std::basic_string_view&lt;char, std::char_traits&lt;char&gt=
; &gt;, std::initializer_list&lt;std::pair&lt;std::basic_string_view&lt;cha=
r, std::char_traits&lt;char&gt; &gt;, std::basic_string_view&lt;char, std::=
char_traits&lt;char&gt; &gt; &gt; &gt;)&#39;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt; 2023-09-13T06:49:11 /home/.../per-packa=
ge/tensorflow-lite/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-buildroot-=
linux-gnu/10.3.0/../../../../aarch64-buildroot-linux-gnu/bin/ld: benchmark_=
tflite_model.cc:(.text+0xdd4): undefined reference to `absl::lts_20211102::=
StrReplaceAll[abi:cxx11](std::basic_string_view&lt;char, std::char_traits&l=
t;char&gt; &gt;, std::initializer_list&lt;std::pair&lt;std::basic_string_vi=
ew&lt;char, std::char_traits&lt;char&gt; &gt;, std::basic_string_view&lt;ch=
ar, std::char_traits&lt;char&gt; &gt; &gt; &gt;)&#39;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt; 2023-09-13T06:49:11 /home/.../per-packa=
ge/tensorflow-lite/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-buildroot-=
linux-gnu/10.3.0/../../../../aarch64-buildroot-linux-gnu/bin/ld: CMakeFiles=
/benchmark_model.dir/benchmark_tflite_model.cc.o: in function `tflite::benc=
hmark::BenchmarkTfLiteModel::ValidateParams()&#39;:<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt; 2023-09-13T06:49:11 benchmark_tflite_mo=
del.cc:(.text+0x8388): undefined reference to `absl::lts_20211102::numbers_=
internal::safe_strto32_base(std::basic_string_view&lt;char, std::char_trait=
s&lt;char&gt; &gt;, int*, int)&#39;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt; 2023-09-13T06:49:11 /home/.../per-packa=
ge/tensorflow-lite/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-buildroot-=
linux-gnu/10.3.0/../../../../aarch64-buildroot-linux-gnu/bin/ld: benchmark_=
tflite_model.cc:(.text+0x83a4): undefined reference to `absl::lts_20211102:=
:numbers_internal::safe_strto32_base(std::basic_string_view&lt;char, std::c=
har_traits&lt;char&gt; &gt;, int*, int)&#39;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt; 2023-09-13T06:49:11 collect2: error: ld=
 returned 1 exit status<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt; 2023-09-13T06:49:11 make[6]: *** [tools=
/benchmark/CMakeFiles/benchmark_model.dir/build.make:476: tools/benchmark/b=
enchmark_model] Error 1<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt; 2023-09-13T06:49:11 make[5]: *** [CMake=
Files/Makefile2:370: tools/benchmark/CMakeFiles/benchmark_model.dir/all] Er=
ror 2<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt; 2023-09-13T06:49:11 make[4]: *** [CMake=
Files/Makefile2:377: tools/benchmark/CMakeFiles/benchmark_model.dir/rule] E=
rror 2<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt; 2023-09-13T06:49:11 make[3]: *** [Makef=
ile:268: benchmark_model] Error 2<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt; Do you know what the issue here?<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; You probably need to patch the tensorflow source cod=
e similar to this<br>
&gt;&gt; &gt;&gt; &gt; as we don&#39;t<br>
&gt;&gt; &gt;&gt; &gt; really support multiple cmake build invocations for =
a single package:<br>
&gt;&gt; &gt;&gt; &gt; <a href=3D"https://github.com/tensorflow/tensorflow/=
pull/60021" rel=3D"noreferrer noreferrer" target=3D"_blank">https://github.=
com/tensorflow/tensorflow/pull/60021</a><br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; This line is preventing it from being built properly=
 as part of the<br>
&gt;&gt; &gt;&gt; &gt; normal tensorflow-lite<br>
&gt;&gt; &gt;&gt; &gt; build:<br>
&gt;&gt; &gt;&gt; &gt; <a href=3D"https://github.com/tensorflow/tensorflow/=
blob/v2.11.0/tensorflow/lite/tools/benchmark/CMakeLists.txt#L84" rel=3D"nor=
eferrer noreferrer" target=3D"_blank">https://github.com/tensorflow/tensorf=
low/blob/v2.11.0/tensorflow/lite/tools/benchmark/CMakeLists.txt#L84</a><br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Try applying these changes and enabling the new cmake con=
fig flag:<br>
&gt;&gt; &gt;&gt; <a href=3D"https://github.com/tensorflow/tensorflow/pull/=
61897" rel=3D"noreferrer noreferrer" target=3D"_blank">https://github.com/t=
ensorflow/tensorflow/pull/61897</a><br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt; Thank you,<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt; Sourabh<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt; On Tue, 5 Sept 2023 at 18:28, Sourabh H=
egde &lt;<a href=3D"mailto:hrsourabh011@gmail.com" target=3D"_blank" rel=3D=
"noreferrer">hrsourabh011@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt; Hello James,<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt; Thanks for the update.<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt; I could build the tensorflow-lite p=
ackage.<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt; Best Regards,<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt; Sourabh<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt; On Tue, 5 Sept 2023 at 08:07, James=
 Hilliard &lt;<a href=3D"mailto:james.hilliard1@gmail.com" target=3D"_blank=
" rel=3D"noreferrer">james.hilliard1@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; On Mon, Sep 4, 2023 at 11:13=E2=
=80=AFAM Sourabh Hegde &lt;<a href=3D"mailto:hrsourabh011@gmail.com" target=
=3D"_blank" rel=3D"noreferrer">hrsourabh011@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; Hello All,<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; I am trying to add tensorf=
low-lite to Buildroot package and I found a git (quite old) <a href=3D"http=
s://github.com/Exein-io/buildroot-tensorflow-lite/tree/master" rel=3D"noref=
errer noreferrer" target=3D"_blank">https://github.com/Exein-io/buildroot-t=
ensorflow-lite/tree/master</a> that I wanted to test.<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; Try my v6 patch series:<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; <a href=3D"https://patchwork.oz=
labs.org/project/buildroot/list/?series=3D346546&amp;submitter=3D&amp;state=
=3D*&amp;q=3D&amp;archive=3Dboth&amp;delegate=3D" rel=3D"noreferrer norefer=
rer" target=3D"_blank">https://patchwork.ozlabs.org/project/buildroot/list/=
?series=3D346546&amp;submitter=3D&amp;state=3D*&amp;q=3D&amp;archive=3Dboth=
&amp;delegate=3D</a><br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; But while building it I am=
 getting below error:<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; file=3D&#39;/home/test/tmp=
/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorf=
low/lite/buildroot-build/pthreadpool-download/pthreadpool-prefix/src/545ebe=
9f225aec6dca49109516fac02e973a3de2.zip&#39;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; -- Downloading... done<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; -- extracting...<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 src=3D=
&#39;/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b=
2ba991967dd/tensorflow/lite/buildroot-build/pthreadpool-download/pthreadpoo=
l-prefix/src/545ebe9f225aec6dca49109516fac02e973a3de2.zip&#39;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 dst=3D=
&#39;/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b=
2ba991967dd/tensorflow/lite/buildroot-build/pthreadpool-source&#39;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; -- extracting... [tar xfz]=
<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; -- extracting... [analysis=
]<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; -- extracting... [rename]<=
br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; -- extracting... [clean up=
]<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; -- extracting... done<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; [ 33%] No patch step for &=
#39;pthreadpool&#39;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; [ 44%] No update step for =
&#39;pthreadpool&#39;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; [ 55%] No configure step f=
or &#39;pthreadpool&#39;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; [ 66%] No build step for &=
#39;pthreadpool&#39;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; [ 77%] No install step for=
 &#39;pthreadpool&#39;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; [ 88%] No test step for &#=
39;pthreadpool&#39;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; [100%] Completed &#39;pthr=
eadpool&#39;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; make[4]: Leaving directory=
 &#39;/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4=
b2ba991967dd/tensorflow/lite/buildroot-build/pthreadpool-download&#39;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; [100%] Built target pthrea=
dpool<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; make[3]: Leaving directory=
 &#39;/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4=
b2ba991967dd/tensorflow/lite/buildroot-build/pthreadpool-download&#39;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; make[2]: Leaving directory=
 &#39;/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4=
b2ba991967dd/tensorflow/lite/buildroot-build/pthreadpool-download&#39;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; -- Configuring incomplete,=
 errors occurred!<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; See also &quot;/home/test/=
tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tens=
orflow/lite/buildroot-build/CMakeFiles/CMakeOutput.log&quot;.<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; See also &quot;/home/test/=
tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tens=
orflow/lite/buildroot-build/CMakeFiles/CMakeError.log&quot;.<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; make[1]: *** [package/<a h=
ref=3D"http://pkg-generic.mk:283" rel=3D"noreferrer noreferrer" target=3D"_=
blank">pkg-generic.mk:283</a>: /home/test/tmp/.../build/tensorflow-lite-966=
3abe4c9037030b0b497c68cc4b2ba991967dd/.stamp_configured] Error 1<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; make: *** [Makefile:23: _a=
ll] Error 2<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; The CMakeError.log build/t=
ensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/bui=
ldroot-build/CM<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; akeFiles shows<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; Performing C++ SOURCE FILE=
 Test COMPILER_SUPPORT_Wshorten64to32 failed with the following output:<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; Change Dir: /home/test/tmp=
/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorf=
low/lite/buildroot-build/CMakeFiles/CMakeTmp<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; Run Build Command(s):/usr/=
bin/make cmTC_76002/fast &amp;&amp; make[2]: Entering directory &#39;/home/=
test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd=
/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp&#39;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; /usr/bin/make -f CMakeFile=
s/cmTC_76002.dir/build.make CMakeFiles/cmTC_76002.dir/build<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; make[3]: Entering director=
y &#39;/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc=
4b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp&#39;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; Building CXX object CMakeF=
iles/cmTC_76002.dir/src.cxx.o<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; /home/test/tmp/.../per-pac=
kage/tensorflow-lite/host/bin/aarch64-linux-g++ --sysroot=3D/home/test/tmp/=
.../per-package/tensorflow-lite/host/aarch64-buildroot-linux-gnu/sysroot=C2=
=A0 =C2=A0 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D=
64=C2=A0 -O3 -g0 -D_FORTIFY_SOURCE=3D2 -ldl -latomic -funsafe-math-optimiza=
tions=C2=A0 -march=3Darmv8-a -std=3Dc++03 -pedantic -Wall -Wextra -Wundef -=
Wcast-align -Wchar-subscripts -Wnon-virtual-dtor -Wunused-local-typedefs -W=
pointer-arith -Wwrite-strings -Wformat-security -DCOMPILER_SUPPORT_Wshorten=
64to32 -Werror=C2=A0 -DNDEBUG -fPIE=C2=A0 =C2=A0-Wshorten-64-to-32 -o CMake=
Files/cmTC_76002.dir/src.cxx.o -c /home/test/tmp/.../build/tensorflow-lite-=
9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-build/CM=
akeFiles/CMakeTmp/src.cxx<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; aarch64-linux-g++.br_real:=
 error: unrecognized command-line option &#39;-Wshorten-64-to-32&#39;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; make[3]: *** [CMakeFiles/c=
mTC_76002.dir/build.make:66: CMakeFiles/cmTC_76002.dir/src.cxx.o] Error 1<b=
r>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; make[3]: Leaving directory=
 &#39;/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4=
b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp&#39;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; make[2]: *** [Makefile:121=
: cmTC_76002/fast] Error 2<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; make[2]: Leaving directory=
 &#39;/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4=
b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp&#39;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; Source file was:<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; int main() { return 0; }<b=
r>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; Performing C++ SOURCE FILE=
 Test COMPILER_SUPPORT_Wcpp11extensions failed with the following output:<b=
r>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; Change Dir: /home/test/tmp=
/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorf=
low/lite/buildroot-build/CMakeFiles/CMakeTmp<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; Run Build Command(s):/usr/=
bin/make cmTC_0b14f/fast &amp;&amp; make[2]: Entering directory &#39;/home/=
test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd=
/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp&#39;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; /usr/bin/make -f CMakeFile=
s/cmTC_0b14f.dir/build.make CMakeFiles/cmTC_0b14f.dir/build<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; make[3]: Entering director=
y &#39;/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc=
4b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp&#39;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; Building CXX object CMakeF=
iles/cmTC_0b14f.dir/src.cxx.o<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; /home/test/tmp/.../per-pac=
kage/tensorflow-lite/host/bin/aarch64-linux-g++ --sysroot=3D/home/test/tmp/=
.../per-package/tensorflow-lite/host/aarch64-buildroot-linux-gnu/sysroot=C2=
=A0 =C2=A0 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D=
64=C2=A0 -O3 -g0 -D_FORTIFY_SOURCE=3D2 -ldl -latomic -funsafe-math-optimiza=
tions=C2=A0 -march=3Darmv8-a -std=3Dc++03 -pedantic -Wall -Wextra -Wundef -=
Wcast-align -Wchar-subscripts -Wnon-virtual-dtor -Wunused-local-typedefs -W=
pointer-arith -Wwrite-strings -Wformat-security -Wlogical-op -Wenum-convers=
ion -DCOMPILER_SUPPORT_Wcpp11extensions -Werror=C2=A0 -DNDEBUG -fPIE=C2=A0 =
=C2=A0-Wc++11-extensions -o CMakeFiles/cmTC_0b14f.dir/src.cxx.o -c /home/te=
st/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/t=
ensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp/src.cxx<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; aarch64-linux-g++.br_real:=
 error: unrecognized command-line option &#39;-Wc++11-extensions&#39;; did =
you mean &#39;-fms-extensions&#39;?<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; make[3]: *** [CMakeFiles/c=
mTC_0b14f.dir/build.make:66: CMakeFiles/cmTC_0b14f.dir/src.cxx.o] Error 1<b=
r>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; make[3]: Leaving directory=
 &#39;/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4=
b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp&#39;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; make[2]: *** [Makefile:121=
: cmTC_0b14f/fast] Error 2<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; make[2]: Leaving directory=
 &#39;/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4=
b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp&#39;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; Source file was:<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; int main() { return 0; }<b=
r>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; Performing C++ SOURCE FILE=
 Test COMPILER_SUPPORT_wd981 failed with the following output:<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; Change Dir: /home/test/tmp=
/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorf=
low/lite/buildroot-build/CMakeFiles/CMakeTmp<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; Run Build Command(s):/usr/=
bin/make cmTC_4c191/fast &amp;&amp; make[2]: Entering directory &#39;/home/=
test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd=
/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp&#39;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; /usr/bin/make -f CMakeFile=
s/cmTC_4c191.dir/build.make CMakeFiles/cmTC_4c191.dir/build<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; make[3]: Entering director=
y &#39;/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc=
4b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp&#39;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; Building CXX object CMakeF=
iles/cmTC_4c191.dir/src.cxx.o<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; /home/test/tmp/.../per-pac=
kage/tensorflow-lite/host/bin/aarch64-linux-g++ --sysroot=3D/home/test/tmp/=
.../per-package/tensorflow-lite/host/aarch64-buildroot-linux-gnu/sysroot=C2=
=A0 =C2=A0 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D=
64=C2=A0 -O3 -g0 -D_FORTIFY_SOURCE=3D2 -ldl -latomic -funsafe-math-optimiza=
tions=C2=A0 -march=3Darmv8-a -std=3Dc++03 -pedantic -Wall -Wextra -Wundef -=
Wcast-align -Wchar-subscripts -Wnon-virtual-dtor -Wunused-local-typedefs -W=
pointer-arith -Wwrite-strings -Wformat-security -Wlogical-op -Wenum-convers=
ion -Wdouble-promotion -Wshadow -Wno-psabi -Wno-variadic-macros -Wno-long-l=
ong -fno-check-new -fno-common -fstrict-aliasing -DCOMPILER_SUPPORT_wd981 -=
Werror=C2=A0 -DNDEBUG -fPIE=C2=A0 =C2=A0-wd981 -o CMakeFiles/cmTC_4c191.dir=
/src.cxx.o -c /home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b4=
97c68cc4b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp/sr=
c.cxx<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; aarch64-linux-g++.br_real:=
 error: unrecognized command-line option &#39;-wd981&#39;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; make[3]: *** [CMakeFiles/c=
mTC_4c191.dir/build.make:66: CMakeFiles/cmTC_4c191.dir/src.cxx.o] Error 1<b=
r>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; make[3]: Leaving directory=
 &#39;/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4=
b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp&#39;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; make[2]: *** [Makefile:121=
: cmTC_4c191/fast] Error 2<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; make[2]: Leaving directory=
 &#39;/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4=
b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp&#39;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; Source file was:<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; int main() { return 0; }<b=
r>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; Performing C++ SOURCE FILE=
 Test COMPILER_SUPPORT_wd2304 failed with the following output:<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; Change Dir: /home/test/tmp=
/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorf=
low/lite/buildroot-build/CMakeFiles/CMakeTmp<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; Run Build Command(s):/usr/=
bin/make cmTC_3d2da/fast &amp;&amp; make[2]: Entering directory &#39;/home/=
test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd=
/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp&#39;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; /usr/bin/make -f CMakeFile=
s/cmTC_3d2da.dir/build.make CMakeFiles/cmTC_3d2da.dir/build<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; make[3]: Entering director=
y &#39;/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc=
4b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp&#39;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; Building CXX object CMakeF=
iles/cmTC_3d2da.dir/src.cxx.o<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; /home/test/tmp/.../per-pac=
kage/tensorflow-lite/host/bin/aarch64-linux-g++ --sysroot=3D/home/test/tmp/=
.../per-package/tensorflow-lite/host/aarch64-buildroot-linux-gnu/sysroot=C2=
=A0 =C2=A0 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D=
64=C2=A0 -O3 -g0 -D_FORTIFY_SOURCE=3D2 -ldl -latomic -funsafe-math-optimiza=
tions=C2=A0 -march=3Darmv8-a -std=3Dc++03 -pedantic -Wall -Wextra -Wundef -=
Wcast-align -Wchar-subscripts -Wnon-virtual-dtor -Wunused-local-typedefs -W=
pointer-arith -Wwrite-strings -Wformat-security -Wlogical-op -Wenum-convers=
ion -Wdouble-promotion -Wshadow -Wno-psabi -Wno-variadic-macros -Wno-long-l=
ong -fno-check-new -fno-common -fstrict-aliasing -DCOMPILER_SUPPORT_wd2304 =
-Werror=C2=A0 -DNDEBUG -fPIE=C2=A0 =C2=A0-wd2304 -o CMakeFiles/cmTC_3d2da.d=
ir/src.cxx.o -c /home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0=
b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp/=
src.cxx<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; aarch64-linux-g++.br_real:=
 error: unrecognized command-line option &#39;-wd2304&#39;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; make[3]: *** [CMakeFiles/c=
mTC_3d2da.dir/build.make:66: CMakeFiles/cmTC_3d2da.dir/src.cxx.o] Error 1<b=
r>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; make[3]: Leaving directory=
 &#39;/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4=
b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp&#39;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; make[2]: *** [Makefile:121=
: cmTC_3d2da/fast] Error 2<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; make[2]: Leaving directory=
 &#39;/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4=
b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp&#39;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; Source file was:<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; int main() { return 0; }<b=
r>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; Performing C++ SOURCE FILE=
 Test COMPILER_SUPPORT_STRICTANSI failed with the following output:<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; Change Dir: /home/test/tmp=
/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorf=
low/lite/buildroot-build/CMakeFiles/CMakeTmp<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; Run Build Command(s):/usr/=
bin/make cmTC_b2340/fast &amp;&amp; make[2]: Entering directory &#39;/home/=
test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd=
/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp&#39;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; /usr/bin/make -f CMakeFile=
s/cmTC_b2340.dir/build.make CMakeFiles/cmTC_b2340.dir/build<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; make[3]: Entering director=
y &#39;/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc=
4b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp&#39;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; Building CXX object CMakeF=
iles/cmTC_b2340.dir/src.cxx.o<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; /home/test/tmp/.../per-pac=
kage/tensorflow-lite/host/bin/aarch64-linux-g++ --sysroot=3D/home/test/tmp/=
.../per-package/tensorflow-lite/host/aarch64-buildroot-linux-gnu/sysroot=C2=
=A0 =C2=A0 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D=
64=C2=A0 -O3 -g0 -D_FORTIFY_SOURCE=3D2 -ldl -latomic -funsafe-math-optimiza=
tions=C2=A0 -march=3Darmv8-a -std=3Dc++03 -pedantic -Wall -Wextra -Wundef -=
Wcast-align -Wchar-subscripts -Wnon-virtual-dtor -Wunused-local-typedefs -W=
pointer-arith -Wwrite-strings -Wformat-security -Wlogical-op -Wenum-convers=
ion -Wdouble-promotion -Wshadow -Wno-psabi -Wno-variadic-macros -Wno-long-l=
ong -fno-check-new -fno-common -fstrict-aliasing -DCOMPILER_SUPPORT_STRICTA=
NSI -Werror=C2=A0 -DNDEBUG -fPIE=C2=A0 =C2=A0-strict-ansi -o CMakeFiles/cmT=
C_b2340.dir/src.cxx.o -c /home/test/tmp/.../build/tensorflow-lite-9663abe4c=
9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/=
CMakeTmp/src.cxx<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; aarch64-linux-g++.br_real:=
 error: unrecognized command-line option &#39;-strict-ansi&#39;; did you me=
an &#39;-fstrict-enums&#39;?<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; make[3]: *** [CMakeFiles/c=
mTC_b2340.dir/build.make:66: CMakeFiles/cmTC_b2340.dir/src.cxx.o] Error 1<b=
r>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; make[3]: Leaving directory=
 &#39;/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4=
b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp&#39;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; make[2]: *** [Makefile:121=
: cmTC_b2340/fast] Error 2<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; make[2]: Leaving directory=
 &#39;/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4=
b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp&#39;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; Can anyone please let me k=
now what could be an issue and how to resolve it?<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; Thanks in advance<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; __________________________=
_____________________<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; buildroot mailing list<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; <a href=3D"mailto:buildroo=
t@buildroot.org" target=3D"_blank" rel=3D"noreferrer">buildroot@buildroot.o=
rg</a><br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &gt; <a href=3D"https://lists.b=
uildroot.org/mailman/listinfo/buildroot" rel=3D"noreferrer noreferrer" targ=
et=3D"_blank">https://lists.buildroot.org/mailman/listinfo/buildroot</a><br=
>
</blockquote></div>

--0000000000000a79520605af4aad--

--===============1028131744417957000==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1028131744417957000==--
