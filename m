Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D672C83F3E
	for <buildroot@archiver.kernel.org>; Tue,  5 Sep 2023 16:29:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF36641827;
	Tue,  5 Sep 2023 16:29:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF36641827
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dj7Djy4VTEup; Tue,  5 Sep 2023 16:29:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A85BC4182D;
	Tue,  5 Sep 2023 16:29:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A85BC4182D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E24D81BF2CD
 for <buildroot@lists.busybox.net>; Tue,  5 Sep 2023 16:29:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B67CE41827
 for <buildroot@lists.busybox.net>; Tue,  5 Sep 2023 16:29:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B67CE41827
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ctBqlLr0Bltm for <buildroot@lists.busybox.net>;
 Tue,  5 Sep 2023 16:28:59 +0000 (UTC)
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com
 [IPv6:2607:f8b0:4864:20::c2b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 366B04182D
 for <buildroot@buildroot.org>; Tue,  5 Sep 2023 16:28:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 366B04182D
Received: by mail-oo1-xc2b.google.com with SMTP id
 006d021491bc7-5738949f62cso1622066eaf.0
 for <buildroot@buildroot.org>; Tue, 05 Sep 2023 09:28:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693931338; x=1694536138;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HNYm3A91ayQZY+Yx1AyQNa7wKUQuOmvfrmMHnm+Uvzo=;
 b=Y2YGD23hGNMuinBLGeZr/+doSqnvpEgedTvS8ZpdcaAEU/0CDuNxoBIqBNjn+Lx6qd
 7G4XXPpiLpM+9TrqOKjdwA4oKaawWSP6Rza+yw2FMoWbKKZm5NQ7F4/uqvPxXGRd9VWp
 EhUO5TSDtgmMD2Atl70Hbg+nWR40yTg3wAnQ3snhh18eoG7lVxVEv/K5a+xXM9UCE9ux
 H81eImI+yFK54qrff0jmeZK0JBv9tIPy7KX+qhl/gBUJmTim3oPosuaDjwor3DVvVMuv
 2RVLF3AB0fmnyDniaXUXMebE5pRftQp9zsfBO6hcYhwAQBCdYz0oQAdfDO9kjS0cv075
 5mkQ==
X-Gm-Message-State: AOJu0YzHakRWbTOEpzjwF7kIDq0tZlkDg5CTKc9Zfk8H4Etw5zzdzAPV
 lmvswXZf0jD1jSSE72/EJEQY1ZkX5WPLOwjEgEc=
X-Google-Smtp-Source: AGHT+IHutKHla1xuzym87weMJ7apURZrMbQHDW2vDI4HtO8uSz9aIj+khocvByCcGB+umwyO+NH3Vhz3lXQYkNyhO+Q=
X-Received: by 2002:a4a:2a0f:0:b0:573:55f4:5175 with SMTP id
 k15-20020a4a2a0f000000b0057355f45175mr11216473oof.0.1693931338004; Tue, 05
 Sep 2023 09:28:58 -0700 (PDT)
MIME-Version: 1.0
References: <CADYjeSs8Ou5-Kn4zYqAZa-qr7ALbp2xtiksY1vEb6L+D+7guZQ@mail.gmail.com>
 <CADvTj4pZXmewYMzSRF2QJcvRgzV9nA0bLDCrzEt4Yw_vAZEqBQ@mail.gmail.com>
In-Reply-To: <CADvTj4pZXmewYMzSRF2QJcvRgzV9nA0bLDCrzEt4Yw_vAZEqBQ@mail.gmail.com>
From: Sourabh Hegde <hrsourabh011@gmail.com>
Date: Tue, 5 Sep 2023 18:28:47 +0200
Message-ID: <CADYjeSv4hOWHjf78ULEszUUFSKbxqTCzb0ZLAw0tNHhA6LfyVg@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693931338; x=1694536138; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HNYm3A91ayQZY+Yx1AyQNa7wKUQuOmvfrmMHnm+Uvzo=;
 b=k0oXTtyTnWcThsUfqM+JBF0fV3AnyQzEpPL+2rcfqCMxAevZD2k2d1noOQqOTsW1Jj
 R0syHQegTjbWXdyVHOmz1c3eWVBhe4hE+JTofKz1n/8Ik5gAV4IGKF0+nU6q2VUZNC0w
 KkV8TKheO+nNVYOxT6C9e7+BgSQ+BAdPBqJjTzpiFWyjhs5tm/Tf3vKWDy3jINDqoDrX
 MVskdegM/bsERHuT7DQ5+Ldya/tVDMat2cohp2oruR10r9gtnakLrsHCS1C7O1Om8jrj
 AigvJDNKvgVNcoBHaIkFx8iuFGpXcCLlN5RQbmepnUhrKrPN9dtLkRwtmKoJ4aCG5un9
 UNLg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=k0oXTtyT
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
Content-Type: multipart/mixed; boundary="===============5084634955979171422=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5084634955979171422==
Content-Type: multipart/alternative; boundary="000000000000acfe4e06049f1f94"

--000000000000acfe4e06049f1f94
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello James,

Thanks for the update.

I could build the tensorflow-lite package.

Best Regards,
Sourabh



On Tue, 5 Sept 2023 at 08:07, James Hilliard <james.hilliard1@gmail.com>
wrote:

> On Mon, Sep 4, 2023 at 11:13=E2=80=AFAM Sourabh Hegde <hrsourabh011@gmail=
.com>
> wrote:
> >
> > Hello All,
> >
> > I am trying to add tensorflow-lite to Buildroot package and I found a
> git (quite old)
> https://github.com/Exein-io/buildroot-tensorflow-lite/tree/master that I
> wanted to test.
>
> Try my v6 patch series:
>
> https://patchwork.ozlabs.org/project/buildroot/list/?series=3D346546&subm=
itter=3D&state=3D*&q=3D&archive=3Dboth&delegate=3D
>
> > But while building it I am getting below error:
> >
> >
> file=3D'/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c6=
8cc4b2ba991967dd/tensorflow/lite/buildroot-build/pthreadpool-download/pthre=
adpool-prefix/src/545ebe9f225aec6dca49109516fac02e973a3de2.zip'
> > -- Downloading... done
> > -- extracting...
> >
> src=3D'/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68=
cc4b2ba991967dd/tensorflow/lite/buildroot-build/pthreadpool-download/pthrea=
dpool-prefix/src/545ebe9f225aec6dca49109516fac02e973a3de2.zip'
> >
> dst=3D'/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68=
cc4b2ba991967dd/tensorflow/lite/buildroot-build/pthreadpool-source'
> > -- extracting... [tar xfz]
> > -- extracting... [analysis]
> > -- extracting... [rename]
> > -- extracting... [clean up]
> > -- extracting... done
> > [ 33%] No patch step for 'pthreadpool'
> > [ 44%] No update step for 'pthreadpool'
> > [ 55%] No configure step for 'pthreadpool'
> > [ 66%] No build step for 'pthreadpool'
> > [ 77%] No install step for 'pthreadpool'
> > [ 88%] No test step for 'pthreadpool'
> > [100%] Completed 'pthreadpool'
> > make[4]: Leaving directory
> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/pthreadpool-download'
> > [100%] Built target pthreadpool
> > make[3]: Leaving directory
> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/pthreadpool-download'
> > make[2]: Leaving directory
> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/pthreadpool-download'
> > -- Configuring incomplete, errors occurred!
> > See also
> "/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeOutput.log".
> > See also
> "/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeError.log".
> > make[1]: *** [package/pkg-generic.mk:283:
> /home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba=
991967dd/.stamp_configured]
> Error 1
> > make: *** [Makefile:23: _all] Error 2
> >
> > The CMakeError.log
> build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba991967dd/tensorflow=
/lite/buildroot-build/CM
> > akeFiles shows
> >
> > Performing C++ SOURCE FILE Test COMPILER_SUPPORT_Wshorten64to32 failed
> with the following output:
> > Change Dir:
> /home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba=
991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp
> >
> > Run Build Command(s):/usr/bin/make cmTC_76002/fast && make[2]: Entering
> directory
> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
> > /usr/bin/make -f CMakeFiles/cmTC_76002.dir/build.make
> CMakeFiles/cmTC_76002.dir/build
> > make[3]: Entering directory
> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
> > Building CXX object CMakeFiles/cmTC_76002.dir/src.cxx.o
> >
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
> > aarch64-linux-g++.br_real: error: unrecognized command-line option
> '-Wshorten-64-to-32'
> > make[3]: *** [CMakeFiles/cmTC_76002.dir/build.make:66:
> CMakeFiles/cmTC_76002.dir/src.cxx.o] Error 1
> > make[3]: Leaving directory
> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
> > make[2]: *** [Makefile:121: cmTC_76002/fast] Error 2
> > make[2]: Leaving directory
> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
> >
> >
> > Source file was:
> > int main() { return 0; }
> > Performing C++ SOURCE FILE Test COMPILER_SUPPORT_Wcpp11extensions faile=
d
> with the following output:
> > Change Dir:
> /home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba=
991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp
> >
> > Run Build Command(s):/usr/bin/make cmTC_0b14f/fast && make[2]: Entering
> directory
> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
> > /usr/bin/make -f CMakeFiles/cmTC_0b14f.dir/build.make
> CMakeFiles/cmTC_0b14f.dir/build
> > make[3]: Entering directory
> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
> > Building CXX object CMakeFiles/cmTC_0b14f.dir/src.cxx.o
> >
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
> > aarch64-linux-g++.br_real: error: unrecognized command-line option
> '-Wc++11-extensions'; did you mean '-fms-extensions'?
> > make[3]: *** [CMakeFiles/cmTC_0b14f.dir/build.make:66:
> CMakeFiles/cmTC_0b14f.dir/src.cxx.o] Error 1
> > make[3]: Leaving directory
> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
> > make[2]: *** [Makefile:121: cmTC_0b14f/fast] Error 2
> > make[2]: Leaving directory
> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
> >
> >
> > Source file was:
> > int main() { return 0; }
> > Performing C++ SOURCE FILE Test COMPILER_SUPPORT_wd981 failed with the
> following output:
> > Change Dir:
> /home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba=
991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp
> >
> > Run Build Command(s):/usr/bin/make cmTC_4c191/fast && make[2]: Entering
> directory
> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
> > /usr/bin/make -f CMakeFiles/cmTC_4c191.dir/build.make
> CMakeFiles/cmTC_4c191.dir/build
> > make[3]: Entering directory
> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
> > Building CXX object CMakeFiles/cmTC_4c191.dir/src.cxx.o
> >
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
> > aarch64-linux-g++.br_real: error: unrecognized command-line option
> '-wd981'
> > make[3]: *** [CMakeFiles/cmTC_4c191.dir/build.make:66:
> CMakeFiles/cmTC_4c191.dir/src.cxx.o] Error 1
> > make[3]: Leaving directory
> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
> > make[2]: *** [Makefile:121: cmTC_4c191/fast] Error 2
> > make[2]: Leaving directory
> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
> >
> >
> > Source file was:
> > int main() { return 0; }
> > Performing C++ SOURCE FILE Test COMPILER_SUPPORT_wd2304 failed with the
> following output:
> > Change Dir:
> /home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba=
991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp
> >
> > Run Build Command(s):/usr/bin/make cmTC_3d2da/fast && make[2]: Entering
> directory
> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
> > /usr/bin/make -f CMakeFiles/cmTC_3d2da.dir/build.make
> CMakeFiles/cmTC_3d2da.dir/build
> > make[3]: Entering directory
> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
> > Building CXX object CMakeFiles/cmTC_3d2da.dir/src.cxx.o
> >
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
> > aarch64-linux-g++.br_real: error: unrecognized command-line option
> '-wd2304'
> > make[3]: *** [CMakeFiles/cmTC_3d2da.dir/build.make:66:
> CMakeFiles/cmTC_3d2da.dir/src.cxx.o] Error 1
> > make[3]: Leaving directory
> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
> > make[2]: *** [Makefile:121: cmTC_3d2da/fast] Error 2
> > make[2]: Leaving directory
> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
> >
> >
> > Source file was:
> > int main() { return 0; }
> > Performing C++ SOURCE FILE Test COMPILER_SUPPORT_STRICTANSI failed with
> the following output:
> > Change Dir:
> /home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2ba=
991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp
> >
> > Run Build Command(s):/usr/bin/make cmTC_b2340/fast && make[2]: Entering
> directory
> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
> > /usr/bin/make -f CMakeFiles/cmTC_b2340.dir/build.make
> CMakeFiles/cmTC_b2340.dir/build
> > make[3]: Entering directory
> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
> > Building CXX object CMakeFiles/cmTC_b2340.dir/src.cxx.o
> >
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
> > aarch64-linux-g++.br_real: error: unrecognized command-line option
> '-strict-ansi'; did you mean '-fstrict-enums'?
> > make[3]: *** [CMakeFiles/cmTC_b2340.dir/build.make:66:
> CMakeFiles/cmTC_b2340.dir/src.cxx.o] Error 1
> > make[3]: Leaving directory
> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
> > make[2]: *** [Makefile:121: cmTC_b2340/fast] Error 2
> > make[2]: Leaving directory
> '/home/test/tmp/.../build/tensorflow-lite-9663abe4c9037030b0b497c68cc4b2b=
a991967dd/tensorflow/lite/buildroot-build/CMakeFiles/CMakeTmp'
> >
> > Can anyone please let me know what could be an issue and how to resolve
> it?
> >
> > Thanks in advance
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
>

--000000000000acfe4e06049f1f94
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello James,<div><br></div><div>Thanks for the update.</di=
v><div><br></div><div>I could build the tensorflow-lite package.</div><div>=
<br></div><div>Best Regards,</div><div>Sourabh</div><div><br></div><div>=C2=
=A0</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gma=
il_attr">On Tue, 5 Sept 2023 at 08:07, James Hilliard &lt;<a href=3D"mailto=
:james.hilliard1@gmail.com">james.hilliard1@gmail.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon, Sep 4, 2023 at=
 11:13=E2=80=AFAM Sourabh Hegde &lt;<a href=3D"mailto:hrsourabh011@gmail.co=
m" target=3D"_blank">hrsourabh011@gmail.com</a>&gt; wrote:<br>
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

--000000000000acfe4e06049f1f94--

--===============5084634955979171422==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5084634955979171422==--
