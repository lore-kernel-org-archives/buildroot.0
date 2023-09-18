Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 296E3C46CA1
	for <buildroot@archiver.kernel.org>; Mon, 18 Sep 2023 17:01:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5E35614F7;
	Mon, 18 Sep 2023 17:01:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B5E35614F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i-ONE8YggmjC; Mon, 18 Sep 2023 17:01:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3095F61502;
	Mon, 18 Sep 2023 17:01:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3095F61502
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BE1211BF2C6
 for <buildroot@lists.busybox.net>; Mon, 18 Sep 2023 17:01:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9302C40942
 for <buildroot@lists.busybox.net>; Mon, 18 Sep 2023 17:01:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9302C40942
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YDeys0EfFaUg for <buildroot@lists.busybox.net>;
 Mon, 18 Sep 2023 17:01:20 +0000 (UTC)
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [IPv6:2001:4860:4864:20::2a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3393B40964
 for <buildroot@buildroot.org>; Mon, 18 Sep 2023 17:01:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3393B40964
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-1d598ba1b74so3077557fac.0
 for <buildroot@buildroot.org>; Mon, 18 Sep 2023 10:01:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695056479; x=1695661279;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dFBqQwdMVCLiI7PwSq4/Hbu9WRUTlzgmCVwFKJjuPH8=;
 b=g4yA/fprJZao22ydaGvMK8Y9v/HqfPR2wxeS0wkSwRqp1RTwU2xk+hzzKHLH0G0MQ9
 GNVJk/h4fQpXvyTNSqR6wKF0bzImsXmneYouAPMJjRMPibS6WX277S3IGYnCWvX01aci
 lEy+ojrQIorEsNs6g6+EKpKCSD4Ch6IM2wyYJerzzoPwJd0CurtJ60AjexkyNLPc5PKW
 0qFBw+fzEg82nJPfuhBYbM4yIlH43nExRnV+X6xsn2kxVEPYoAT9+d0vMjntA1XKx7NG
 eUHxhhxL5yz3KzlycIuvWVrSU9e50H/9sbO2iQhQTNYl4Uib42N410heLvUdG0tAf9t1
 TjZg==
X-Gm-Message-State: AOJu0YwbjUCO3566jDrjpCo8d/WMeOWWZn8WwSYExn/LAPcE+uiHiKSI
 NzO+3yMt933x6ow3S39ebj95aYar/rzzfmKXJRZly6x5R4s=
X-Google-Smtp-Source: AGHT+IGaCwmQiulqASdrwWaovVj+ESv5sYeNUTzU+XbCt5ohrsZY3BaVoydvbO635Y+u8VZyqIbveJbQ57bE5+ugFA4=
X-Received: by 2002:a05:6870:e244:b0:1bb:ac7:2e34 with SMTP id
 d4-20020a056870e24400b001bb0ac72e34mr10889974oac.40.1695056478760; Mon, 18
 Sep 2023 10:01:18 -0700 (PDT)
MIME-Version: 1.0
References: <CADYjeSs8Ou5-Kn4zYqAZa-qr7ALbp2xtiksY1vEb6L+D+7guZQ@mail.gmail.com>
 <CADvTj4pZXmewYMzSRF2QJcvRgzV9nA0bLDCrzEt4Yw_vAZEqBQ@mail.gmail.com>
 <CADYjeSv4hOWHjf78ULEszUUFSKbxqTCzb0ZLAw0tNHhA6LfyVg@mail.gmail.com>
 <CADYjeStbPRHh7jge5vU0Z1_5qXUdgVbQCghV2fZ6zSXASP46XQ@mail.gmail.com>
 <CADYjeStGD0sdj9iT7MDLQG8APoyBFKcLCQEtkcvDz-8WOJ4dcQ@mail.gmail.com>
 <CADYjeSvoxnVhWW9BYkEyJeudsB8ZvYk6pGOjuXJUyh49XQAU_Q@mail.gmail.com>
 <CADvTj4ou41gxNjqMbwjCwtNKGhFzz6uhCwZa+iCgBRwnjUBziQ@mail.gmail.com>
 <CADvTj4q7bCjTN75deJr=WGgoPKNCdqnQt_fkBMY9yiA-2m1v_Q@mail.gmail.com>
In-Reply-To: <CADvTj4q7bCjTN75deJr=WGgoPKNCdqnQt_fkBMY9yiA-2m1v_Q@mail.gmail.com>
From: Sourabh Hegde <hrsourabh011@gmail.com>
Date: Mon, 18 Sep 2023 19:01:07 +0200
Message-ID: <CADYjeStNG+u8osymoboH7ChLNjNGY3i3BeGLwSppybSWB9bcRg@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695056479; x=1695661279; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dFBqQwdMVCLiI7PwSq4/Hbu9WRUTlzgmCVwFKJjuPH8=;
 b=IQrQwyJQmjaBSzr/X3wMbN2LCd/c0GyJR1/HSYA6QdpNcvmeewRC81u0mrCCmqpFgZ
 NNtz5oFS8ZVexJ25j+LrA0gDEJOW+jeyJV2Xt5Zg2AlGB/SiNuht0nQZMLNg0FzH+6jv
 tbdyjMJ71pEuzMXK2Sy/Z+n4Oh62QRCxVonwon+6Vr7yW4X7f98fHckwzWYz+1P8ay2K
 8QbyRnOges7HkUkMPRC/r2RjWJD2DBvkCLqTmvx0u87Tmn6fvLnlV7unWDPAHEaetD2X
 2ktesENaqpmPVEowmMj620OusRfJMf8JJ2AzKsyBjjb73BEsDA3ZQKwVDq8Ei8Ux7z/v
 Pfyg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=IQrQwyJQ
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
Content-Type: multipart/mixed; boundary="===============4468585135751110058=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4468585135751110058==
Content-Type: multipart/alternative; boundary="0000000000004a80bb0605a517bf"

--0000000000004a80bb0605a517bf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi James,

Thanks for the update and PR:
I will try this.

However, for testing I changed the c++ std in libabseil-cpp.mk
<https://github.com/buildroot/buildroot/blob/master/package/libabseil-cpp/l=
ibabseil-cpp.mk>
to
"17" and rebuilt the libabseil-cpp package. There were no errors.
I did this because I read a similar error in abseil-cpp repo
<https://github.com/abseil/abseil-cpp/issues/1051>.

Now I cleaned the tensorflow-lite package and rebuilt it. There were no
errors related to linking now.. and benchmark_model is installed to target
dir.

Do you think is this a good approach? And is it possible to tell Buildroot
to use c++std=3D17 for libabseil in tensorflow-lite.mk
as TENSORFLOW_LITE_CONF_OPTS or TENSORFLOW_LITE_ENV variable?

On Mon, 18 Sept 2023 at 18:38, James Hilliard <james.hilliard1@gmail.com>
wrote:

> On Mon, Sep 18, 2023 at 10:22=E2=80=AFAM James Hilliard
> <james.hilliard1@gmail.com> wrote:
> >
> > On Mon, Sep 18, 2023 at 10:04=E2=80=AFAM Sourabh Hegde <hrsourabh011@gm=
ail.com>
> wrote:
> > >
> > > Hello Stefan, James,
> > >
> > > Have you tried building the benchmark_model from tensorflow-lite? I a=
m
> getting above errors during the build...
> > >
> > > On Fri, 15 Sept 2023 at 18:49, Sourabh Hegde <hrsourabh011@gmail.com>
> wrote:
> > >>
> > >> Hello James,
> > >>
> > >> Do you have any updates on below issue?
> > >> This would be helpful
> > >>
> > >> Thanks in advance
> > >>
> > >> On Wed, Sep 13, 2023, 09:07 Sourabh Hegde <hrsourabh011@gmail.com>
> wrote:
> > >>>
> > >>> Hello James,
> > >>>
> > >>> I am trying to build the "benchmark_model" in the tensorflow-lite
> package. The benchmarking application performs a simple TensorFlow Lite
> model inference and prints benchmarking information.
> > >>>
> > >>> In the tensorflow-lite.mk  I added new section (similar to
> label_image example)
> > >>> ifeq ($(BR2_PACKAGE_TENSORFLOW_LITE_BUILD_BENCHMARK_MODEL),y)
> > >>> define TENSORFLOW_LITE_BENCHMARK_BUILD_CMDS
> > >>>         $(TARGET_MAKE_ENV) $(BR2_CMAKE) --build
> $(TENSORFLOW_LITE_BUILDDIR) -t benchmark_model
> > >>> endef
> > >>> TENSORFLOW_LITE_POST_BUILD_HOOKS +=3D
> TENSORFLOW_LITE_BENCHMARK_BUILD_CMDS
> > >>>
> > >>> define TENSORFLOW_LITE_INSTALL_TARGET_BENCHMARK_MODEL
> > >>>          $(INSTALL) -D -m0755
> $(@D)/tensorflow/lite/buildroot-build/tools/benchmark/benchmark_model
> $(TARGET_DIR)/usr/bin/benchmark_model
> > >>> endef
> > >>> TENSORFLOW_LITE_POST_INSTALL_TARGET_HOOKS +=3D
> TENSORFLOW_LITE_INSTALL_TARGET_BENCHMARK_MODEL
> > >>> endif
> > >>>
> > >>> But while building this is giving error:
> > >>>
> > >>> [ 98%] Building CXX object
> tools/benchmark/CMakeFiles/benchmark_model.dir/__/delegates/xnnpack_deleg=
ate_provider.cc.o
> > >>> 2023-09-13T06:49:10 [ 98%] Building CXX object
> tools/benchmark/CMakeFiles/benchmark_model.dir/__/delegates/external_dele=
gate_provider.cc.o
> > >>> 2023-09-13T06:49:11 [100%] Linking CXX executable benchmark_model
> > >>> 2023-09-13T06:49:11
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
> > >>> 2023-09-13T06:49:11 benchmark_tflite_model.cc:(.text+0x204):
> undefined reference to
> `absl::lts_20211102::ByChar::Find(std::basic_string_view<char,
> std::char_traits<char> >, unsigned long) const'
> > >>> 2023-09-13T06:49:11
> /home/.../per-package/tensorflow-lite/host/opt/ext-toolchain/bin/../lib/g=
cc/aarch64-buildroot-linux-gnu/10.3.0/../../../../aarch64-buildroot-linux-g=
nu/bin/ld:
> benchmark_tflite_model.cc:(.text+0x284): undefined reference to
> `absl::lts_20211102::ByChar::Find(std::basic_string_view<char,
> std::char_traits<char> >, unsigned long) const'
> > >>> 2023-09-13T06:49:11
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
> > >>> 2023-09-13T06:49:11 benchmark_tflite_model.cc:(.text+0xcf0):
> undefined reference to
> `absl::lts_20211102::StrReplaceAll[abi:cxx11](std::basic_string_view<char=
,
> std::char_traits<char> >,
> std::initializer_list<std::pair<std::basic_string_view<char,
> std::char_traits<char> >, std::basic_string_view<char,
> std::char_traits<char> > > >)'
> > >>> 2023-09-13T06:49:11
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
> > >>> 2023-09-13T06:49:11
> /home/.../per-package/tensorflow-lite/host/opt/ext-toolchain/bin/../lib/g=
cc/aarch64-buildroot-linux-gnu/10.3.0/../../../../aarch64-buildroot-linux-g=
nu/bin/ld:
> CMakeFiles/benchmark_model.dir/benchmark_tflite_model.cc.o: in function
> `tflite::benchmark::BenchmarkTfLiteModel::ValidateParams()':
> > >>> 2023-09-13T06:49:11 benchmark_tflite_model.cc:(.text+0x8388):
> undefined reference to
> `absl::lts_20211102::numbers_internal::safe_strto32_base(std::basic_strin=
g_view<char,
> std::char_traits<char> >, int*, int)'
> > >>> 2023-09-13T06:49:11
> /home/.../per-package/tensorflow-lite/host/opt/ext-toolchain/bin/../lib/g=
cc/aarch64-buildroot-linux-gnu/10.3.0/../../../../aarch64-buildroot-linux-g=
nu/bin/ld:
> benchmark_tflite_model.cc:(.text+0x83a4): undefined reference to
> `absl::lts_20211102::numbers_internal::safe_strto32_base(std::basic_strin=
g_view<char,
> std::char_traits<char> >, int*, int)'
> > >>> 2023-09-13T06:49:11 collect2: error: ld returned 1 exit status
> > >>> 2023-09-13T06:49:11 make[6]: ***
> [tools/benchmark/CMakeFiles/benchmark_model.dir/build.make:476:
> tools/benchmark/benchmark_model] Error 1
> > >>> 2023-09-13T06:49:11 make[5]: *** [CMakeFiles/Makefile2:370:
> tools/benchmark/CMakeFiles/benchmark_model.dir/all] Error 2
> > >>> 2023-09-13T06:49:11 make[4]: *** [CMakeFiles/Makefile2:377:
> tools/benchmark/CMakeFiles/benchmark_model.dir/rule] Error 2
> > >>> 2023-09-13T06:49:11 make[3]: *** [Makefile:268: benchmark_model]
> Error 2
> > >>>
> > >>> Do you know what the issue here?
> >
> > You probably need to patch the tensorflow source code similar to this
> > as we don't
> > really support multiple cmake build invocations for a single package:
> > https://github.com/tensorflow/tensorflow/pull/60021
> >
> > This line is preventing it from being built properly as part of the
> > normal tensorflow-lite
> > build:
> >
> https://github.com/tensorflow/tensorflow/blob/v2.11.0/tensorflow/lite/too=
ls/benchmark/CMakeLists.txt#L84
>
> Try applying these changes and enabling the new cmake config flag:
> https://github.com/tensorflow/tensorflow/pull/61897
>
> >
> > >>>
> > >>> Thank you,
> > >>> Sourabh
> > >>>
> > >>> On Tue, 5 Sept 2023 at 18:28, Sourabh Hegde <hrsourabh011@gmail.com=
>
> wrote:
> > >>>>
> > >>>> Hello James,
> > >>>>
> > >>>> Thanks for the update.
> > >>>>
> > >>>> I could build the tensorflow-lite package.
> > >>>>
> > >>>> Best Regards,
> > >>>> Sourabh
> > >>>>
> > >>>>
> > >>>>
> > >>>> On Tue, 5 Sept 2023 at 08:07, James Hilliard <
> james.hilliard1@gmail.com> wrote:
> > >>>>>
> > >>>>> On Mon, Sep 4, 2023 at 11:13=E2=80=AFAM Sourabh Hegde <
> hrsourabh011@gmail.com> wrote:
> > >>>>> >
> > >>>>> > Hello All,
> > >>>>> >
> > >>>>> > I am trying to add tensorflow-lite to Buildroot package and I
> found a git (quite old)
> https://github.com/Exein-io/buildroot-tensorflow-lite/tree/master that I
> wanted to test.
> > >>>>>
> > >>>>> Try my v6 patch series:
> > >>>>>
> https://patchwork.ozlabs.org/project/buildroot/list/?series=3D346546&subm=
itter=3D&state=3D*&q=3D&archive=3Dboth&delegate=3D
> > >>>>>
> > >>>>> > But while building it I am getting below error:
> > >>>>> >
> > >>>>> >
> file=3D'/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c6=
8cc4b2ba991967dd/tensorflow/lite/buildroot-build/pthreadpool-download/pthre=
adpool-prefix/src/545ebe9f225aec6dca49109516fac02e973a3de2.zip'
> > >>>>> > -- Downloading... done
> > >>>>> > -- extracting...
> > >>>>> >
> src=3D'/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68=
cc4b2ba991967dd/tensorflow/lite/buildroot-build/pthreadpool-download/pthrea=
dpool-prefix/src/545ebe9f225aec6dca49109516fac02e973a3de2.zip'
> > >>>>> >
> dst=3D'/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68=
cc4b2ba991967dd/tensorflow/lite/buildroot-build/pthreadpool-source'
> > >>>>> > -- extracting... [tar xfz]
> > >>>>> > -- extracting... [analysis]
> > >>>>> > -- extracting... [rename]
> > >>>>> > -- extracting... [clean up]
> > >>>>> > -- extracting... done
> > >>>>> > [ 33%] No patch step for 'pthreadpool'
> > >>>>> > [ 44%] No update step for 'pthreadpool'
> > >>>>> > [ 55%] No configure step for 'pthreadpool'
> > >>>>> > [ 66%] No build step for 'pthreadpool'
> > >>>>> > [ 77%] No install step for 'pthreadpool'
> > >>>>> > [ 88%] No test step for 'pthreadpool'
> > >>>>> > [100%] Completed 'pthreadpool'
> > >>>>> > make[4]: Leaving directory
> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/pthreadpool-download'
> > >>>>> > [100%] Built target pthreadpool
> > >>>>> > make[3]: Leaving directory
> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/pthreadpool-download'
> > >>>>> > make[2]: Leaving directory
> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/pthreadpool-download'
> > >>>>> > -- Configuring incomplete, errors occurred!
> > >>>>> > See also
> "/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeOutput.log".
> > >>>>> > See also
> "/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeError.log".
> > >>>>> > make[1]: *** [package/pkg-generic.mk:283:
> /home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba=
991967dd/.stamp_configured]
> Error 1
> > >>>>> > make: *** [Makefile:23: _all] Error 2
> > >>>>> >
> > >>>>> > The CMakeError.log
> build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow=
/lite/buildroot-build/CM
> > >>>>> > akeFiles shows
> > >>>>> >
> > >>>>> > Performing C++ SOURCE FILE Test COMPILER_SUPPORT_Wshorten64to32
> failed with the following output:
> > >>>>> > Change Dir:
> /home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba=
991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp
> > >>>>> >
> > >>>>> > Run Build Command(s):/usr/bin/make cmTC_76002/fast && make[2]:
> Entering directory
> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
> > >>>>> > /usr/bin/make -f CMakeFiles/cmTC_76002.dir/build.make
> CMakeFiles/cmTC_76002.dir/build
> > >>>>> > make[3]: Entering directory
> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
> > >>>>> > Building CXX object CMakeFiles/cmTC_76002.dir/src.cxx.o
> > >>>>> >
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
> > >>>>> > aarch64-linux-g++.br_real: error: unrecognized command-line
> option '-Wshorten-64-to-32'
> > >>>>> > make[3]: *** [CMakeFiles/cmTC_76002.dir/build.make:66:
> CMakeFiles/cmTC_76002.dir/src.cxx.o] Error 1
> > >>>>> > make[3]: Leaving directory
> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
> > >>>>> > make[2]: *** [Makefile:121: cmTC_76002/fast] Error 2
> > >>>>> > make[2]: Leaving directory
> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
> > >>>>> >
> > >>>>> >
> > >>>>> > Source file was:
> > >>>>> > int main() { return 0; }
> > >>>>> > Performing C++ SOURCE FILE Test
> COMPILER_SUPPORT_Wcpp11extensions failed with the following output:
> > >>>>> > Change Dir:
> /home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba=
991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp
> > >>>>> >
> > >>>>> > Run Build Command(s):/usr/bin/make cmTC_0b14f/fast && make[2]:
> Entering directory
> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
> > >>>>> > /usr/bin/make -f CMakeFiles/cmTC_0b14f.dir/build.make
> CMakeFiles/cmTC_0b14f.dir/build
> > >>>>> > make[3]: Entering directory
> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
> > >>>>> > Building CXX object CMakeFiles/cmTC_0b14f.dir/src.cxx.o
> > >>>>> >
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
> > >>>>> > aarch64-linux-g++.br_real: error: unrecognized command-line
> option '-Wc++11-extensions'; did you mean '-fms-extensions'?
> > >>>>> > make[3]: *** [CMakeFiles/cmTC_0b14f.dir/build.make:66:
> CMakeFiles/cmTC_0b14f.dir/src.cxx.o] Error 1
> > >>>>> > make[3]: Leaving directory
> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
> > >>>>> > make[2]: *** [Makefile:121: cmTC_0b14f/fast] Error 2
> > >>>>> > make[2]: Leaving directory
> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
> > >>>>> >
> > >>>>> >
> > >>>>> > Source file was:
> > >>>>> > int main() { return 0; }
> > >>>>> > Performing C++ SOURCE FILE Test COMPILER_SUPPORT_wd981 failed
> with the following output:
> > >>>>> > Change Dir:
> /home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba=
991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp
> > >>>>> >
> > >>>>> > Run Build Command(s):/usr/bin/make cmTC_4c191/fast && make[2]:
> Entering directory
> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
> > >>>>> > /usr/bin/make -f CMakeFiles/cmTC_4c191.dir/build.make
> CMakeFiles/cmTC_4c191.dir/build
> > >>>>> > make[3]: Entering directory
> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
> > >>>>> > Building CXX object CMakeFiles/cmTC_4c191.dir/src.cxx.o
> > >>>>> >
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
> > >>>>> > aarch64-linux-g++.br_real: error: unrecognized command-line
> option '-wd981'
> > >>>>> > make[3]: *** [CMakeFiles/cmTC_4c191.dir/build.make:66:
> CMakeFiles/cmTC_4c191.dir/src.cxx.o] Error 1
> > >>>>> > make[3]: Leaving directory
> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
> > >>>>> > make[2]: *** [Makefile:121: cmTC_4c191/fast] Error 2
> > >>>>> > make[2]: Leaving directory
> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
> > >>>>> >
> > >>>>> >
> > >>>>> > Source file was:
> > >>>>> > int main() { return 0; }
> > >>>>> > Performing C++ SOURCE FILE Test COMPILER_SUPPORT_wd2304 failed
> with the following output:
> > >>>>> > Change Dir:
> /home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba=
991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp
> > >>>>> >
> > >>>>> > Run Build Command(s):/usr/bin/make cmTC_3d2da/fast && make[2]:
> Entering directory
> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
> > >>>>> > /usr/bin/make -f CMakeFiles/cmTC_3d2da.dir/build.make
> CMakeFiles/cmTC_3d2da.dir/build
> > >>>>> > make[3]: Entering directory
> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
> > >>>>> > Building CXX object CMakeFiles/cmTC_3d2da.dir/src.cxx.o
> > >>>>> >
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
> > >>>>> > aarch64-linux-g++.br_real: error: unrecognized command-line
> option '-wd2304'
> > >>>>> > make[3]: *** [CMakeFiles/cmTC_3d2da.dir/build.make:66:
> CMakeFiles/cmTC_3d2da.dir/src.cxx.o] Error 1
> > >>>>> > make[3]: Leaving directory
> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
> > >>>>> > make[2]: *** [Makefile:121: cmTC_3d2da/fast] Error 2
> > >>>>> > make[2]: Leaving directory
> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
> > >>>>> >
> > >>>>> >
> > >>>>> > Source file was:
> > >>>>> > int main() { return 0; }
> > >>>>> > Performing C++ SOURCE FILE Test COMPILER_SUPPORT_STRICTANSI
> failed with the following output:
> > >>>>> > Change Dir:
> /home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba=
991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp
> > >>>>> >
> > >>>>> > Run Build Command(s):/usr/bin/make cmTC_b2340/fast && make[2]:
> Entering directory
> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
> > >>>>> > /usr/bin/make -f CMakeFiles/cmTC_b2340.dir/build.make
> CMakeFiles/cmTC_b2340.dir/build
> > >>>>> > make[3]: Entering directory
> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
> > >>>>> > Building CXX object CMakeFiles/cmTC_b2340.dir/src.cxx.o
> > >>>>> >
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
> > >>>>> > aarch64-linux-g++.br_real: error: unrecognized command-line
> option '-strict-ansi'; did you mean '-fstrict-enums'?
> > >>>>> > make[3]: *** [CMakeFiles/cmTC_b2340.dir/build.make:66:
> CMakeFiles/cmTC_b2340.dir/src.cxx.o] Error 1
> > >>>>> > make[3]: Leaving directory
> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
> > >>>>> > make[2]: *** [Makefile:121: cmTC_b2340/fast] Error 2
> > >>>>> > make[2]: Leaving directory
> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
> > >>>>> >
> > >>>>> > Can anyone please let me know what could be an issue and how to
> resolve it?
> > >>>>> >
> > >>>>> > Thanks in advance
> > >>>>> >
> > >>>>> > _______________________________________________
> > >>>>> > buildroot mailing list
> > >>>>> > buildroot@buildroot.org
> > >>>>> > https://lists.buildroot.org/mailman/listinfo/buildroot
>

--0000000000004a80bb0605a517bf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi James,<div><br></div><div>Thanks for the update and PR:=
</div><div>I will try this.</div><div><br></div><div>However, for testing I=
 changed the c++ std in=C2=A0<a href=3D"https://github.com/buildroot/buildr=
oot/blob/master/package/libabseil-cpp/libabseil-cpp.mk">libabseil-cpp.mk</a=
>=C2=A0to &quot;17&quot; and rebuilt the libabseil-cpp package. There were =
no errors.</div><div>I did this because=C2=A0I read a similar error in=C2=
=A0<a href=3D"https://github.com/abseil/abseil-cpp/issues/1051">abseil-cpp =
repo</a>.</div><div><br></div><div>Now I cleaned the tensorflow-lite packag=
e and rebuilt it. There were no errors related to linking now.. and benchma=
rk_model is installed to target dir.</div><div><br></div><div>Do you think =
is this a good approach? And is it possible=C2=A0to tell Buildroot to use c=
++std=3D17 for libabseil in <a href=3D"http://tensorflow-lite.mk">tensorflo=
w-lite.mk</a> as=C2=A0TENSORFLOW_LITE_CONF_OPTS or=C2=A0TENSORFLOW_LITE_ENV=
 variable?</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, 18 Sept 2023 at 18:38, James Hilliard &lt;<a href=
=3D"mailto:james.hilliard1@gmail.com">james.hilliard1@gmail.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon, Sep =
18, 2023 at 10:22=E2=80=AFAM James Hilliard<br>
&lt;<a href=3D"mailto:james.hilliard1@gmail.com" target=3D"_blank">james.hi=
lliard1@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Mon, Sep 18, 2023 at 10:04=E2=80=AFAM Sourabh Hegde &lt;<a href=3D"=
mailto:hrsourabh011@gmail.com" target=3D"_blank">hrsourabh011@gmail.com</a>=
&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; Hello Stefan, James,<br>
&gt; &gt;<br>
&gt; &gt; Have you tried building the benchmark_model from tensorflow-lite?=
 I am getting above errors during the build...<br>
&gt; &gt;<br>
&gt; &gt; On Fri, 15 Sept 2023 at 18:49, Sourabh Hegde &lt;<a href=3D"mailt=
o:hrsourabh011@gmail.com" target=3D"_blank">hrsourabh011@gmail.com</a>&gt; =
wrote:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Hello James,<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Do you have any updates on below issue?<br>
&gt; &gt;&gt; This would be helpful<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Thanks in advance<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; On Wed, Sep 13, 2023, 09:07 Sourabh Hegde &lt;<a href=3D"mail=
to:hrsourabh011@gmail.com" target=3D"_blank">hrsourabh011@gmail.com</a>&gt;=
 wrote:<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; Hello James,<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; I am trying to build the &quot;benchmark_model&quot; in t=
he tensorflow-lite package. The benchmarking application performs a simple =
TensorFlow Lite model inference and prints benchmarking information.<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; In the <a href=3D"http://tensorflow-lite.mk" rel=3D"noref=
errer" target=3D"_blank">tensorflow-lite.mk</a>=C2=A0 I added new section (=
similar to label_image example)<br>
&gt; &gt;&gt;&gt; ifeq ($(BR2_PACKAGE_TENSORFLOW_LITE_BUILD_BENCHMARK_MODEL=
),y)<br>
&gt; &gt;&gt;&gt; define TENSORFLOW_LITE_BENCHMARK_BUILD_CMDS<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(TARGET_MAKE_ENV) $(BR2=
_CMAKE) --build $(TENSORFLOW_LITE_BUILDDIR) -t benchmark_model<br>
&gt; &gt;&gt;&gt; endef<br>
&gt; &gt;&gt;&gt; TENSORFLOW_LITE_POST_BUILD_HOOKS +=3D TENSORFLOW_LITE_BEN=
CHMARK_BUILD_CMDS<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; define TENSORFLOW_LITE_INSTALL_TARGET_BENCHMARK_MODEL<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(INSTALL) -D -m0755 $(=
@D)/tensorflow/lite/buildroot-build/tools/benchmark/benchmark_model $(TARGE=
T_DIR)/usr/bin/benchmark_model<br>
&gt; &gt;&gt;&gt; endef<br>
&gt; &gt;&gt;&gt; TENSORFLOW_LITE_POST_INSTALL_TARGET_HOOKS +=3D TENSORFLOW=
_LITE_INSTALL_TARGET_BENCHMARK_MODEL<br>
&gt; &gt;&gt;&gt; endif<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; But while building this is giving error:<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; [ 98%] Building CXX object tools/benchmark/CMakeFiles/ben=
chmark_model.dir/__/delegates/xnnpack_delegate_provider.cc.o<br>
&gt; &gt;&gt;&gt; 2023-09-13T06:49:10 [ 98%] Building CXX object tools/benc=
hmark/CMakeFiles/benchmark_model.dir/__/delegates/external_delegate_provide=
r.cc.o<br>
&gt; &gt;&gt;&gt; 2023-09-13T06:49:11 [100%] Linking CXX executable benchma=
rk_model<br>
&gt; &gt;&gt;&gt; 2023-09-13T06:49:11 /home/.../per-package/tensorflow-lite=
/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-buildroot-linux-gnu/10.3.0/.=
./../../../aarch64-buildroot-linux-gnu/bin/ld: CMakeFiles/benchmark_model.d=
ir/benchmark_tflite_model.cc.o: in function `absl::lts_20211102::strings_in=
ternal::Splitter&lt;absl::lts_20211102::ByChar, absl::lts_20211102::AllowEm=
pty, std::basic_string_view&lt;char, std::char_traits&lt;char&gt; &gt; &gt;=
::ConvertToContainer&lt;std::vector&lt;std::basic_string_view&lt;char, std:=
:char_traits&lt;char&gt; &gt;, std::allocator&lt;std::basic_string_view&lt;=
char, std::char_traits&lt;char&gt; &gt; &gt; &gt;, std::basic_string_view&l=
t;char, std::char_traits&lt;char&gt; &gt;, false&gt;::operator()(absl::lts_=
20211102::strings_internal::Splitter&lt;absl::lts_20211102::ByChar, absl::l=
ts_20211102::AllowEmpty, std::basic_string_view&lt;char, std::char_traits&l=
t;char&gt; &gt; &gt; const&amp;) const [clone .isra.0]&#39;:<br>
&gt; &gt;&gt;&gt; 2023-09-13T06:49:11 benchmark_tflite_model.cc:(.text+0x20=
4): undefined reference to `absl::lts_20211102::ByChar::Find(std::basic_str=
ing_view&lt;char, std::char_traits&lt;char&gt; &gt;, unsigned long) const&#=
39;<br>
&gt; &gt;&gt;&gt; 2023-09-13T06:49:11 /home/.../per-package/tensorflow-lite=
/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-buildroot-linux-gnu/10.3.0/.=
./../../../aarch64-buildroot-linux-gnu/bin/ld: benchmark_tflite_model.cc:(.=
text+0x284): undefined reference to `absl::lts_20211102::ByChar::Find(std::=
basic_string_view&lt;char, std::char_traits&lt;char&gt; &gt;, unsigned long=
) const&#39;<br>
&gt; &gt;&gt;&gt; 2023-09-13T06:49:11 /home/.../per-package/tensorflow-lite=
/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-buildroot-linux-gnu/10.3.0/.=
./../../../aarch64-buildroot-linux-gnu/bin/ld: CMakeFiles/benchmark_model.d=
ir/benchmark_tflite_model.cc.o: in function `tflite::benchmark::SplitInputL=
ayerNameAndValueFile(std::__cxx11::basic_string&lt;char, std::char_traits&l=
t;char&gt;, std::allocator&lt;char&gt; &gt; const&amp;, std::pair&lt;std::_=
_cxx11::basic_string&lt;char, std::char_traits&lt;char&gt;, std::allocator&=
lt;char&gt; &gt;, std::__cxx11::basic_string&lt;char, std::char_traits&lt;c=
har&gt;, std::allocator&lt;char&gt; &gt; &gt;&amp;)&#39;:<br>
&gt; &gt;&gt;&gt; 2023-09-13T06:49:11 benchmark_tflite_model.cc:(.text+0xcf=
0): undefined reference to `absl::lts_20211102::StrReplaceAll[abi:cxx11](st=
d::basic_string_view&lt;char, std::char_traits&lt;char&gt; &gt;, std::initi=
alizer_list&lt;std::pair&lt;std::basic_string_view&lt;char, std::char_trait=
s&lt;char&gt; &gt;, std::basic_string_view&lt;char, std::char_traits&lt;cha=
r&gt; &gt; &gt; &gt;)&#39;<br>
&gt; &gt;&gt;&gt; 2023-09-13T06:49:11 /home/.../per-package/tensorflow-lite=
/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-buildroot-linux-gnu/10.3.0/.=
./../../../aarch64-buildroot-linux-gnu/bin/ld: benchmark_tflite_model.cc:(.=
text+0xdd4): undefined reference to `absl::lts_20211102::StrReplaceAll[abi:=
cxx11](std::basic_string_view&lt;char, std::char_traits&lt;char&gt; &gt;, s=
td::initializer_list&lt;std::pair&lt;std::basic_string_view&lt;char, std::c=
har_traits&lt;char&gt; &gt;, std::basic_string_view&lt;char, std::char_trai=
ts&lt;char&gt; &gt; &gt; &gt;)&#39;<br>
&gt; &gt;&gt;&gt; 2023-09-13T06:49:11 /home/.../per-package/tensorflow-lite=
/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-buildroot-linux-gnu/10.3.0/.=
./../../../aarch64-buildroot-linux-gnu/bin/ld: CMakeFiles/benchmark_model.d=
ir/benchmark_tflite_model.cc.o: in function `tflite::benchmark::BenchmarkTf=
LiteModel::ValidateParams()&#39;:<br>
&gt; &gt;&gt;&gt; 2023-09-13T06:49:11 benchmark_tflite_model.cc:(.text+0x83=
88): undefined reference to `absl::lts_20211102::numbers_internal::safe_str=
to32_base(std::basic_string_view&lt;char, std::char_traits&lt;char&gt; &gt;=
, int*, int)&#39;<br>
&gt; &gt;&gt;&gt; 2023-09-13T06:49:11 /home/.../per-package/tensorflow-lite=
/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-buildroot-linux-gnu/10.3.0/.=
./../../../aarch64-buildroot-linux-gnu/bin/ld: benchmark_tflite_model.cc:(.=
text+0x83a4): undefined reference to `absl::lts_20211102::numbers_internal:=
:safe_strto32_base(std::basic_string_view&lt;char, std::char_traits&lt;char=
&gt; &gt;, int*, int)&#39;<br>
&gt; &gt;&gt;&gt; 2023-09-13T06:49:11 collect2: error: ld returned 1 exit s=
tatus<br>
&gt; &gt;&gt;&gt; 2023-09-13T06:49:11 make[6]: *** [tools/benchmark/CMakeFi=
les/benchmark_model.dir/build.make:476: tools/benchmark/benchmark_model] Er=
ror 1<br>
&gt; &gt;&gt;&gt; 2023-09-13T06:49:11 make[5]: *** [CMakeFiles/Makefile2:37=
0: tools/benchmark/CMakeFiles/benchmark_model.dir/all] Error 2<br>
&gt; &gt;&gt;&gt; 2023-09-13T06:49:11 make[4]: *** [CMakeFiles/Makefile2:37=
7: tools/benchmark/CMakeFiles/benchmark_model.dir/rule] Error 2<br>
&gt; &gt;&gt;&gt; 2023-09-13T06:49:11 make[3]: *** [Makefile:268: benchmark=
_model] Error 2<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; Do you know what the issue here?<br>
&gt;<br>
&gt; You probably need to patch the tensorflow source code similar to this<=
br>
&gt; as we don&#39;t<br>
&gt; really support multiple cmake build invocations for a single package:<=
br>
&gt; <a href=3D"https://github.com/tensorflow/tensorflow/pull/60021" rel=3D=
"noreferrer" target=3D"_blank">https://github.com/tensorflow/tensorflow/pul=
l/60021</a><br>
&gt;<br>
&gt; This line is preventing it from being built properly as part of the<br=
>
&gt; normal tensorflow-lite<br>
&gt; build:<br>
&gt; <a href=3D"https://github.com/tensorflow/tensorflow/blob/v2.11.0/tenso=
rflow/lite/tools/benchmark/CMakeLists.txt#L84" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/tensorflow/tensorflow/blob/v2.11.0/tensorflow/l=
ite/tools/benchmark/CMakeLists.txt#L84</a><br>
<br>
Try applying these changes and enabling the new cmake config flag:<br>
<a href=3D"https://github.com/tensorflow/tensorflow/pull/61897" rel=3D"nore=
ferrer" target=3D"_blank">https://github.com/tensorflow/tensorflow/pull/618=
97</a><br>
<br>
&gt;<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; Thank you,<br>
&gt; &gt;&gt;&gt; Sourabh<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; On Tue, 5 Sept 2023 at 18:28, Sourabh Hegde &lt;<a href=
=3D"mailto:hrsourabh011@gmail.com" target=3D"_blank">hrsourabh011@gmail.com=
</a>&gt; wrote:<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt; Hello James,<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt; Thanks for the update.<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt; I could build the tensorflow-lite package.<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt; Best Regards,<br>
&gt; &gt;&gt;&gt;&gt; Sourabh<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt; On Tue, 5 Sept 2023 at 08:07, James Hilliard &lt;<a h=
ref=3D"mailto:james.hilliard1@gmail.com" target=3D"_blank">james.hilliard1@=
gmail.com</a>&gt; wrote:<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; On Mon, Sep 4, 2023 at 11:13=E2=80=AFAM Sourabh H=
egde &lt;<a href=3D"mailto:hrsourabh011@gmail.com" target=3D"_blank">hrsour=
abh011@gmail.com</a>&gt; wrote:<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; Hello All,<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; I am trying to add tensorflow-lite to Buildr=
oot package and I found a git (quite old) <a href=3D"https://github.com/Exe=
in-io/buildroot-tensorflow-lite/tree/master" rel=3D"noreferrer" target=3D"_=
blank">https://github.com/Exein-io/buildroot-tensorflow-lite/tree/master</a=
> that I wanted to test.<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; Try my v6 patch series:<br>
&gt; &gt;&gt;&gt;&gt;&gt; <a href=3D"https://patchwork.ozlabs.org/project/b=
uildroot/list/?series=3D346546&amp;submitter=3D&amp;state=3D*&amp;q=3D&amp;=
archive=3Dboth&amp;delegate=3D" rel=3D"noreferrer" target=3D"_blank">https:=
//patchwork.ozlabs.org/project/buildroot/list/?series=3D346546&amp;submitte=
r=3D&amp;state=3D*&amp;q=3D&amp;archive=3Dboth&amp;delegate=3D</a><br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; But while building it I am getting below err=
or:<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; file=3D&#39;/home/test/tmp/.../build/tensorf=
low-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot=
-build/pthreadpool-download/pthreadpool-prefix/src/545ebe9f225aec6dca491095=
16fac02e973a3de2.zip&#39;<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; -- Downloading... done<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; -- extracting...<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 src=3D&#39;/home/test/tm=
p/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensor=
flow/lite/buildroot-build/pthreadpool-download/pthreadpool-prefix/src/545eb=
e9f225aec6dca49109516fac02e973a3de2.zip&#39;<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 dst=3D&#39;/home/test/tm=
p/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensor=
flow/lite/buildroot-build/pthreadpool-source&#39;<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; -- extracting... [tar xfz]<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; -- extracting... [analysis]<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; -- extracting... [rename]<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; -- extracting... [clean up]<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; -- extracting... done<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; [ 33%] No patch step for &#39;pthreadpool&#3=
9;<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; [ 44%] No update step for &#39;pthreadpool&#=
39;<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; [ 55%] No configure step for &#39;pthreadpoo=
l&#39;<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; [ 66%] No build step for &#39;pthreadpool&#3=
9;<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; [ 77%] No install step for &#39;pthreadpool&=
#39;<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; [ 88%] No test step for &#39;pthreadpool&#39=
;<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; [100%] Completed &#39;pthreadpool&#39;<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; make[4]: Leaving directory &#39;/home/test/t=
mp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tenso=
rflow/lite/buildroot-build/pthreadpool-download&#39;<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; [100%] Built target pthreadpool<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; make[3]: Leaving directory &#39;/home/test/t=
mp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tenso=
rflow/lite/buildroot-build/pthreadpool-download&#39;<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; make[2]: Leaving directory &#39;/home/test/t=
mp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tenso=
rflow/lite/buildroot-build/pthreadpool-download&#39;<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; -- Configuring incomplete, errors occurred!<=
br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; See also &quot;/home/test/tmp/.../build/tens=
orflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/buildr=
oot-build/CMakeFiles/CMakeOutput.log&quot;.<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; See also &quot;/home/test/tmp/.../build/tens=
orflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/buildr=
oot-build/CMakeFiles/CMakeError.log&quot;.<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; make[1]: *** [package/<a href=3D"http://pkg-=
generic.mk:283" rel=3D"noreferrer" target=3D"_blank">pkg-generic.mk:283</a>=
: /home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba=
991967dd/.stamp_configured] Error 1<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; make: *** [Makefile:23: _all] Error 2<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; The CMakeError.log build/tensorflow-lite-966=
3abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-build/CM<br=
>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; akeFiles shows<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; Performing C++ SOURCE FILE Test COMPILER_SUP=
PORT_Wshorten64to32 failed with the following output:<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; Change Dir: /home/test/tmp/.../build/tensorf=
low-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot=
-build/CMakeFiles/CMakeTmp<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; Run Build Command(s):/usr/bin/make cmTC_7600=
2/fast &amp;&amp; make[2]: Entering directory &#39;/home/test/tmp/.../build=
/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/b=
uildroot-build/CMakeFiles/CMakeTmp&#39;<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; /usr/bin/make -f CMakeFiles/cmTC_76002.dir/b=
uild.make CMakeFiles/cmTC_76002.dir/build<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; make[3]: Entering directory &#39;/home/test/=
tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tens=
orflow/lite/buildroot-build/CMakeFiles/CMakeTmp&#39;<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; Building CXX object CMakeFiles/cmTC_76002.di=
r/src.cxx.o<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; /home/test/tmp/.../per-package/tensorflow-li=
te/host/bin/aarch64-linux-g++ --sysroot=3D/home/test/tmp/.../per-package/te=
nsorflow-lite/host/aarch64-buildroot-linux-gnu/sysroot=C2=A0 =C2=A0 -D_LARG=
EFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64=C2=A0 -O3 -g0 -=
D_FORTIFY_SOURCE=3D2 -ldl -latomic -funsafe-math-optimizations=C2=A0 -march=
=3Darmv8-a -std=3Dc++03 -pedantic -Wall -Wextra -Wundef -Wcast-align -Wchar=
-subscripts -Wnon-virtual-dtor -Wunused-local-typedefs -Wpointer-arith -Wwr=
ite-strings -Wformat-security -DCOMPILER_SUPPORT_Wshorten64to32 -Werror=C2=
=A0 -DNDEBUG -fPIE=C2=A0 =C2=A0-Wshorten-64-to-32 -o CMakeFiles/cmTC_76002.=
dir/src.cxx.o -c /home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b=
0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp=
/src.cxx<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; aarch64-linux-g++.br_real: error: unrecogniz=
ed command-line option &#39;-Wshorten-64-to-32&#39;<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; make[3]: *** [CMakeFiles/cmTC_76002.dir/buil=
d.make:66: CMakeFiles/cmTC_76002.dir/src.cxx.o] Error 1<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; make[3]: Leaving directory &#39;/home/test/t=
mp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tenso=
rflow/lite/buildroot-build/CMakeFiles/CMakeTmp&#39;<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; make[2]: *** [Makefile:121: cmTC_76002/fast]=
 Error 2<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; make[2]: Leaving directory &#39;/home/test/t=
mp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tenso=
rflow/lite/buildroot-build/CMakeFiles/CMakeTmp&#39;<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; Source file was:<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; int main() { return 0; }<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; Performing C++ SOURCE FILE Test COMPILER_SUP=
PORT_Wcpp11extensions failed with the following output:<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; Change Dir: /home/test/tmp/.../build/tensorf=
low-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot=
-build/CMakeFiles/CMakeTmp<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; Run Build Command(s):/usr/bin/make cmTC_0b14=
f/fast &amp;&amp; make[2]: Entering directory &#39;/home/test/tmp/.../build=
/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/b=
uildroot-build/CMakeFiles/CMakeTmp&#39;<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; /usr/bin/make -f CMakeFiles/cmTC_0b14f.dir/b=
uild.make CMakeFiles/cmTC_0b14f.dir/build<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; make[3]: Entering directory &#39;/home/test/=
tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tens=
orflow/lite/buildroot-build/CMakeFiles/CMakeTmp&#39;<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; Building CXX object CMakeFiles/cmTC_0b14f.di=
r/src.cxx.o<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; /home/test/tmp/.../per-package/tensorflow-li=
te/host/bin/aarch64-linux-g++ --sysroot=3D/home/test/tmp/.../per-package/te=
nsorflow-lite/host/aarch64-buildroot-linux-gnu/sysroot=C2=A0 =C2=A0 -D_LARG=
EFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64=C2=A0 -O3 -g0 -=
D_FORTIFY_SOURCE=3D2 -ldl -latomic -funsafe-math-optimizations=C2=A0 -march=
=3Darmv8-a -std=3Dc++03 -pedantic -Wall -Wextra -Wundef -Wcast-align -Wchar=
-subscripts -Wnon-virtual-dtor -Wunused-local-typedefs -Wpointer-arith -Wwr=
ite-strings -Wformat-security -Wlogical-op -Wenum-conversion -DCOMPILER_SUP=
PORT_Wcpp11extensions -Werror=C2=A0 -DNDEBUG -fPIE=C2=A0 =C2=A0-Wc++11-exte=
nsions -o CMakeFiles/cmTC_0b14f.dir/src.cxx.o -c /home/test/tmp/.../build/t=
ensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/bui=
ldroot-build/CMakeFiles/CMakeTmp/src.cxx<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; aarch64-linux-g++.br_real: error: unrecogniz=
ed command-line option &#39;-Wc++11-extensions&#39;; did you mean &#39;-fms=
-extensions&#39;?<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; make[3]: *** [CMakeFiles/cmTC_0b14f.dir/buil=
d.make:66: CMakeFiles/cmTC_0b14f.dir/src.cxx.o] Error 1<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; make[3]: Leaving directory &#39;/home/test/t=
mp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tenso=
rflow/lite/buildroot-build/CMakeFiles/CMakeTmp&#39;<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; make[2]: *** [Makefile:121: cmTC_0b14f/fast]=
 Error 2<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; make[2]: Leaving directory &#39;/home/test/t=
mp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tenso=
rflow/lite/buildroot-build/CMakeFiles/CMakeTmp&#39;<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; Source file was:<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; int main() { return 0; }<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; Performing C++ SOURCE FILE Test COMPILER_SUP=
PORT_wd981 failed with the following output:<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; Change Dir: /home/test/tmp/.../build/tensorf=
low-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot=
-build/CMakeFiles/CMakeTmp<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; Run Build Command(s):/usr/bin/make cmTC_4c19=
1/fast &amp;&amp; make[2]: Entering directory &#39;/home/test/tmp/.../build=
/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/b=
uildroot-build/CMakeFiles/CMakeTmp&#39;<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; /usr/bin/make -f CMakeFiles/cmTC_4c191.dir/b=
uild.make CMakeFiles/cmTC_4c191.dir/build<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; make[3]: Entering directory &#39;/home/test/=
tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tens=
orflow/lite/buildroot-build/CMakeFiles/CMakeTmp&#39;<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; Building CXX object CMakeFiles/cmTC_4c191.di=
r/src.cxx.o<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; /home/test/tmp/.../per-package/tensorflow-li=
te/host/bin/aarch64-linux-g++ --sysroot=3D/home/test/tmp/.../per-package/te=
nsorflow-lite/host/aarch64-buildroot-linux-gnu/sysroot=C2=A0 =C2=A0 -D_LARG=
EFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64=C2=A0 -O3 -g0 -=
D_FORTIFY_SOURCE=3D2 -ldl -latomic -funsafe-math-optimizations=C2=A0 -march=
=3Darmv8-a -std=3Dc++03 -pedantic -Wall -Wextra -Wundef -Wcast-align -Wchar=
-subscripts -Wnon-virtual-dtor -Wunused-local-typedefs -Wpointer-arith -Wwr=
ite-strings -Wformat-security -Wlogical-op -Wenum-conversion -Wdouble-promo=
tion -Wshadow -Wno-psabi -Wno-variadic-macros -Wno-long-long -fno-check-new=
 -fno-common -fstrict-aliasing -DCOMPILER_SUPPORT_wd981 -Werror=C2=A0 -DNDE=
BUG -fPIE=C2=A0 =C2=A0-wd981 -o CMakeFiles/cmTC_4c191.dir/src.cxx.o -c /hom=
e/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967=
dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp/src.cxx<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; aarch64-linux-g++.br_real: error: unrecogniz=
ed command-line option &#39;-wd981&#39;<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; make[3]: *** [CMakeFiles/cmTC_4c191.dir/buil=
d.make:66: CMakeFiles/cmTC_4c191.dir/src.cxx.o] Error 1<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; make[3]: Leaving directory &#39;/home/test/t=
mp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tenso=
rflow/lite/buildroot-build/CMakeFiles/CMakeTmp&#39;<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; make[2]: *** [Makefile:121: cmTC_4c191/fast]=
 Error 2<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; make[2]: Leaving directory &#39;/home/test/t=
mp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tenso=
rflow/lite/buildroot-build/CMakeFiles/CMakeTmp&#39;<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; Source file was:<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; int main() { return 0; }<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; Performing C++ SOURCE FILE Test COMPILER_SUP=
PORT_wd2304 failed with the following output:<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; Change Dir: /home/test/tmp/.../build/tensorf=
low-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot=
-build/CMakeFiles/CMakeTmp<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; Run Build Command(s):/usr/bin/make cmTC_3d2d=
a/fast &amp;&amp; make[2]: Entering directory &#39;/home/test/tmp/.../build=
/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/b=
uildroot-build/CMakeFiles/CMakeTmp&#39;<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; /usr/bin/make -f CMakeFiles/cmTC_3d2da.dir/b=
uild.make CMakeFiles/cmTC_3d2da.dir/build<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; make[3]: Entering directory &#39;/home/test/=
tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tens=
orflow/lite/buildroot-build/CMakeFiles/CMakeTmp&#39;<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; Building CXX object CMakeFiles/cmTC_3d2da.di=
r/src.cxx.o<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; /home/test/tmp/.../per-package/tensorflow-li=
te/host/bin/aarch64-linux-g++ --sysroot=3D/home/test/tmp/.../per-package/te=
nsorflow-lite/host/aarch64-buildroot-linux-gnu/sysroot=C2=A0 =C2=A0 -D_LARG=
EFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64=C2=A0 -O3 -g0 -=
D_FORTIFY_SOURCE=3D2 -ldl -latomic -funsafe-math-optimizations=C2=A0 -march=
=3Darmv8-a -std=3Dc++03 -pedantic -Wall -Wextra -Wundef -Wcast-align -Wchar=
-subscripts -Wnon-virtual-dtor -Wunused-local-typedefs -Wpointer-arith -Wwr=
ite-strings -Wformat-security -Wlogical-op -Wenum-conversion -Wdouble-promo=
tion -Wshadow -Wno-psabi -Wno-variadic-macros -Wno-long-long -fno-check-new=
 -fno-common -fstrict-aliasing -DCOMPILER_SUPPORT_wd2304 -Werror=C2=A0 -DND=
EBUG -fPIE=C2=A0 =C2=A0-wd2304 -o CMakeFiles/cmTC_3d2da.dir/src.cxx.o -c /h=
ome/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba9919=
67dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp/src.cxx<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; aarch64-linux-g++.br_real: error: unrecogniz=
ed command-line option &#39;-wd2304&#39;<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; make[3]: *** [CMakeFiles/cmTC_3d2da.dir/buil=
d.make:66: CMakeFiles/cmTC_3d2da.dir/src.cxx.o] Error 1<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; make[3]: Leaving directory &#39;/home/test/t=
mp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tenso=
rflow/lite/buildroot-build/CMakeFiles/CMakeTmp&#39;<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; make[2]: *** [Makefile:121: cmTC_3d2da/fast]=
 Error 2<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; make[2]: Leaving directory &#39;/home/test/t=
mp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tenso=
rflow/lite/buildroot-build/CMakeFiles/CMakeTmp&#39;<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; Source file was:<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; int main() { return 0; }<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; Performing C++ SOURCE FILE Test COMPILER_SUP=
PORT_STRICTANSI failed with the following output:<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; Change Dir: /home/test/tmp/.../build/tensorf=
low-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/buildroot=
-build/CMakeFiles/CMakeTmp<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; Run Build Command(s):/usr/bin/make cmTC_b234=
0/fast &amp;&amp; make[2]: Entering directory &#39;/home/test/tmp/.../build=
/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow/lite/b=
uildroot-build/CMakeFiles/CMakeTmp&#39;<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; /usr/bin/make -f CMakeFiles/cmTC_b2340.dir/b=
uild.make CMakeFiles/cmTC_b2340.dir/build<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; make[3]: Entering directory &#39;/home/test/=
tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tens=
orflow/lite/buildroot-build/CMakeFiles/CMakeTmp&#39;<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; Building CXX object CMakeFiles/cmTC_b2340.di=
r/src.cxx.o<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; /home/test/tmp/.../per-package/tensorflow-li=
te/host/bin/aarch64-linux-g++ --sysroot=3D/home/test/tmp/.../per-package/te=
nsorflow-lite/host/aarch64-buildroot-linux-gnu/sysroot=C2=A0 =C2=A0 -D_LARG=
EFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64=C2=A0 -O3 -g0 -=
D_FORTIFY_SOURCE=3D2 -ldl -latomic -funsafe-math-optimizations=C2=A0 -march=
=3Darmv8-a -std=3Dc++03 -pedantic -Wall -Wextra -Wundef -Wcast-align -Wchar=
-subscripts -Wnon-virtual-dtor -Wunused-local-typedefs -Wpointer-arith -Wwr=
ite-strings -Wformat-security -Wlogical-op -Wenum-conversion -Wdouble-promo=
tion -Wshadow -Wno-psabi -Wno-variadic-macros -Wno-long-long -fno-check-new=
 -fno-common -fstrict-aliasing -DCOMPILER_SUPPORT_STRICTANSI -Werror=C2=A0 =
-DNDEBUG -fPIE=C2=A0 =C2=A0-strict-ansi -o CMakeFiles/cmTC_b2340.dir/src.cx=
x.o -c /home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc=
4b2ba991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp/src.cxx<b=
r>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; aarch64-linux-g++.br_real: error: unrecogniz=
ed command-line option &#39;-strict-ansi&#39;; did you mean &#39;-fstrict-e=
nums&#39;?<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; make[3]: *** [CMakeFiles/cmTC_b2340.dir/buil=
d.make:66: CMakeFiles/cmTC_b2340.dir/src.cxx.o] Error 1<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; make[3]: Leaving directory &#39;/home/test/t=
mp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tenso=
rflow/lite/buildroot-build/CMakeFiles/CMakeTmp&#39;<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; make[2]: *** [Makefile:121: cmTC_b2340/fast]=
 Error 2<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; make[2]: Leaving directory &#39;/home/test/t=
mp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tenso=
rflow/lite/buildroot-build/CMakeFiles/CMakeTmp&#39;<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; Can anyone please let me know what could be =
an issue and how to resolve it?<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; Thanks in advance<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; ____________________________________________=
___<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; buildroot mailing list<br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; <a href=3D"mailto:buildroot@buildroot.org" t=
arget=3D"_blank">buildroot@buildroot.org</a><br>
&gt; &gt;&gt;&gt;&gt;&gt; &gt; <a href=3D"https://lists.buildroot.org/mailm=
an/listinfo/buildroot" rel=3D"noreferrer" target=3D"_blank">https://lists.b=
uildroot.org/mailman/listinfo/buildroot</a><br>
</blockquote></div>

--0000000000004a80bb0605a517bf--

--===============4468585135751110058==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4468585135751110058==--
