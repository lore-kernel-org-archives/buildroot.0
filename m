Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27680C61DA4
	for <buildroot@archiver.kernel.org>; Tue, 14 Feb 2023 07:27:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A97E8610DC;
	Tue, 14 Feb 2023 07:27:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A97E8610DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ybCmm6JhSN00; Tue, 14 Feb 2023 07:27:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 349456110B;
	Tue, 14 Feb 2023 07:27:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 349456110B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0F8761BF239
 for <buildroot@lists.busybox.net>; Tue, 14 Feb 2023 07:27:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DD33481E1F
 for <buildroot@lists.busybox.net>; Tue, 14 Feb 2023 07:27:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD33481E1F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0tuVCbI_sKm4 for <buildroot@lists.busybox.net>;
 Tue, 14 Feb 2023 07:27:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1F9D81E1E
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F1F9D81E1E
 for <buildroot@buildroot.org>; Tue, 14 Feb 2023 07:27:45 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id bx13so12288650oib.13
 for <buildroot@buildroot.org>; Mon, 13 Feb 2023 23:27:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5nOjavAWeTYMNX2cUVfQq2iPRChoKa7HktpOQMufgzA=;
 b=cV/KTxv2OYJX75yJtNEdVf+gZbtYStQaZ/+vczfCUn9i6ydcgI4ToRfaubktPnlEVo
 XSNzjtwofqusw2BQnaIkFNUzF7LOkCeF8UNZ9u/P+qhVcpuNWZcEjFtB2m1FUsvmu5Bi
 vOjQpTj5AoTA7WYgPKURJAyP4rtdNolpsXP3Lc0FLLxvA8fdltf1BUsVWhGGrreDxvbs
 UxUR5G0DVOTltRLubcG5drKLShZlqA1OLom/Wgc5zILB0GNrmjO4mF5DEUEACHbqZhdD
 9kDJXNVURq2JPmLtU7SI4++o2j2nRg7QQxADp0mTTJWxoUCBs4tvcy+dmiaKeKnQ4AVt
 jJdw==
X-Gm-Message-State: AO0yUKXhFwCr47Byi/lJg4DY7ubq9EBVhTGe6Du+DT21X7I/YnTk/+Q9
 pjBbr3sb8xdT3DvN3TY8u6WuuUVfxIEQGBxuAE4=
X-Google-Smtp-Source: AK7set+rXt4n3+AAyXVecA69Z8EAzbQV4VAfeFzlfGtrBrYMrAGXBzeh3dgpwEzGMxuTD3npIxTeS+eId73p9AoNZUw=
X-Received: by 2002:aca:be57:0:b0:367:18a6:eb14 with SMTP id
 o84-20020acabe57000000b0036718a6eb14mr62728oif.208.1676359664869; Mon, 13 Feb
 2023 23:27:44 -0800 (PST)
MIME-Version: 1.0
References: <CADYjeSsqfaF0P7g_hxQ2EjSh=zDG9=FTnLrbq5g4+22UNJq-xw@mail.gmail.com>
 <CACHw65+r07g=hU4yv1Xhb3TFVmOVkYdSpRy3dZF9y+U44TK=Qw@mail.gmail.com>
 <CADYjeStPWnGcr23XOGnB+61eZ=iZKVj8YkhDKSaw0BUFT7WC-A@mail.gmail.com>
 <36be5bdc-591c-71cb-ea31-9e38ae8d643d@inbox.ru>
 <CADYjeSuvmoMXDGgN9rmv+RecroVxqj1_d9x3G4iakwkvLs+j9Q@mail.gmail.com>
 <22e489f3-cc1d-985d-cca6-18f4f6ddecfa@inbox.ru>
 <CADYjeSuBvHsij7YTnyq5tW9jEv1JtV3u1WyYkX2cbffgkQ6_Kw@mail.gmail.com>
 <a481ffb1-5c10-d913-0f8a-cbb5e11ff631@inbox.ru>
 <CADYjeStesndVUqdWqmPVP5=xfW1PFcwzNk=9o0TUM+tXBez8mA@mail.gmail.com>
 <eeb3b4bc-12fa-eea5-4ec0-89c90ac75394@inbox.ru>
 <CADYjeStwFSJQDFvj2z5bAURD0eTLVgYrpEvdEdYMbbVkJmJupQ@mail.gmail.com>
 <CADYjeSv1r61gQMoamBq2VUgSYwmyvvZ8BP2NGBZHNzF6vU7phg@mail.gmail.com>
 <CADvTj4r54pJnngFBGQXx=zATURSmhNAuvtkc7nWA_yvR3kF1Bw@mail.gmail.com>
In-Reply-To: <CADvTj4r54pJnngFBGQXx=zATURSmhNAuvtkc7nWA_yvR3kF1Bw@mail.gmail.com>
From: Sourabh Hegde <hrsourabh011@gmail.com>
Date: Tue, 14 Feb 2023 08:27:34 +0100
Message-ID: <CADYjeSta1Noc0jOozULC9CrTZOeHMKOGxj6ApG_acGrdmi6eoA@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5nOjavAWeTYMNX2cUVfQq2iPRChoKa7HktpOQMufgzA=;
 b=KiCK5REca8p/fbNJmntUxAMTT1G4X/lRLHo7PtElz09+g6n/j7tnz0+UktmvSfo+Qb
 TQ3GaO0BibTZzjdAupOU4M6O7grvHpRt0/viwBaqJpUDt44XakCu8R4hbQ4tN6Ag01gH
 IOaERfijPQLxfdGp283jTWHhasNzptSiPJTAvO9dZ+c1tBmsDsK9G1u24OlyWVnQYaBO
 Vnm+eYwawrO6FNr0ClZCCExvMq7+K90efZs2uVSzTyxaQDc0r2Czr8QzHt/0B+AOPp6L
 CaC+uUVn+QGIhUbFMDmiPlm0FvxlRxYG5xM6U5EokqKUZTOIcid5dKQTk1O74FZwpS+M
 5yzQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=KiCK5REc
Subject: Re: [Buildroot] How to install custom sdk in buildroot?
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>,
 Ramon Crichlow <rcrichlow9000@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============6228506579198772498=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6228506579198772498==
Content-Type: multipart/alternative; boundary="0000000000005724c305f4a3e6ae"

--0000000000005724c305f4a3e6ae
Content-Type: text/plain; charset="UTF-8"

Hello James,

Thanks for the update.

awscrt also has precompiled wheels
<https://pypi.org/project/awscrt/#files> such
as
awscrt-0.16.10-cp311-cp311-manylinux_2_17_aarch64.manylinux2014_aarch64.whl

Can Buildroot use them instead of cross compiling? If not, is it possible
to extract it and install manually?

Thanks in advance

On Thu, 9 Feb 2023 at 21:12, James Hilliard <james.hilliard1@gmail.com>
wrote:

> On Thu, Feb 9, 2023 at 5:10 AM Sourabh Hegde <hrsourabh011@gmail.com>
> wrote:
> >
> > Hello Maxim,
> >
> > While doing make with new Buildroot-packages I getting:
> >
> > [ 51%] Building ASM object
> aws-lc/crypto/CMakeFiles/crypto_objects.dir/hrss/asm/poly_rq_mul.S.o
> >
> /home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrss/asm/poly_rq_mul.S:
> Assembler messages:
> >
> /home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrss/asm/poly_rq_mul.S:304:
> Error: unknown pseudo-op: `.att_syntax'
> >
> /home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrss/asm/poly_rq_mul.S:307:
> Error: unknown mnemonic `push' -- `push %rbp'
> >
> /home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrss/asm/poly_rq_mul.S:309:
> Error: bad register expression
> >
> /home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrss/asm/poly_rq_mul.S:310:
> Error: unknown mnemonic `movq' -- `movq %rsp,%rbp'
> >
> /home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrss/asm/poly_rq_mul.S:311:
> Error: bad register expression
> >
> /home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrss/asm/poly_rq_mul.S:312:
> Error: unknown mnemonic `push' -- `push %r12'
> >
> /home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrss/asm/poly_rq_mul.S:313:
> Error: bad register expression
> >
> /home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrss/asm/poly_rq_mul.S:321:
> Error: operand 1 must be an integer register -- `mov %rcx,%r8'
> >
> /home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrss/asm/poly_rq_mul.S:322:
> Error: unknown mnemonic `addq' -- `addq $6144+12288+512+9408+32,%r8'
> >
> /home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrss/asm/poly_rq_mul.S:323:
> Error: operand 1 must be an integer register -- `mov %r8,%rax'
> >
> /home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrss/asm/poly_rq_mul.S:324:
> Error: unknown mnemonic `subq' -- `subq $6144,%r8'
> >
> /home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrss/asm/poly_rq_mul.S:325:
> Error: operand 1 must be an integer register -- `mov %r8,%r11'
> >
> /home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrss/asm/poly_rq_mul.S:326:
> Error: unknown mnemonic `subq' -- `subq $12288,%r8'
> >
> /home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrss/asm/poly_rq_mul.S:327:
> Error: operand 1 must be an integer register -- `mov %r8,%r12'
> >
> /home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrss/asm/poly_rq_mul.S:328:
> Error: unknown mnemonic `subq' -- `subq $512,%r8'
> >
> /home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrss/asm/poly_rq_mul.S:329:
> Error: unknown mnemonic `vmovdqa' -- `vmovdqa const3(%rip),%ymm3'
> >
> /home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrss/asm/poly_rq_mul.S:330:
> Error: unknown mnemonic `vmovdqu' -- `vmovdqu 0(%rsi),%ymm0'
> >
> /home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrss/asm/poly_rq_mul.S:331:
> Error: unknown mnemonic `vmovdqu' -- `vmovdqu 88(%rsi),%ymm1'
> > .
> > .
> > .
> > Any idea what it is complaining about?
>
> The problem here is that while the python awscrt package uses setuptools
> it's not a normal python setuptools package, the setup.py installs both a
> normal
> setuptools package and a vendored cmake package(meta package really).
>
> See cmake build wrapper functionality here in the setuptools setup.py file:
> https://github.com/awslabs/aws-crt-python/blob/v0.16.10/setup.py#L156-L272
>
> This is the cmake meta project root which is vendored inside of awscrt:
> https://github.com/awslabs/aws-crt-python/tree/v0.16.10/crt
>
> See meta cmakelists build:
> https://github.com/awslabs/aws-crt-python/blob/v0.16.10/crt/CMakeLists.txt
>
> This meta project is made up of multiple subprojects:
> aws-c-auth
> aws-c-cal
> aws-c-common
> aws-c-compression
> aws-c-event-stream
> aws-checksums
> aws-c-http
> aws-c-io
> aws-c-mqtt
> aws-c-s3
> aws-c-sdkutils
> aws-lc
> s2n
>
> In buildroot we expect cmake packages to use our cmake infrastructure
> as it will set up the cross compilation environment correctly while the
> awscrt setuptools cmake wrapper does not.
>
> I confirmed that the cmake packages build correctly when using our
> cmake infrastructure:
>
> ################################################################################
> #
> # python-awscrt
> #
>
> ################################################################################
>
> PYTHON_AWSCRT_VERSION = 0.16.10
> PYTHON_AWSCRT_SOURCE = awscrt-$(PYTHON_AWSCRT_VERSION).tar.gz
> PYTHON_AWSCRT_SITE =
>
> https://files.pythonhosted.org/packages/ae/98/dda092078f2d47bad08e184ab9d364b8f89166497062bc1cf811c0bbbde2
> PYTHON_AWSCRT_SUBDIR = crt
>
> $(eval $(cmake-package))
>
> See:
>
> https://buildroot.org/downloads/manual/manual.html#_infrastructure_for_cmake_based_packages
>
> So what I think you need to do is create buildroot cmake packages for all
> these subprojects using buildroot's cmake infrastructure:
> https://github.com/awslabs/aws-c-auth
> https://github.com/awslabs/aws-c-cal
> https://github.com/awslabs/aws-c-common
> https://github.com/awslabs/aws-c-compression
> https://github.com/awslabs/aws-c-event-stream
> https://github.com/awslabs/aws-checksums
> https://github.com/awslabs/aws-c-http
> https://github.com/awslabs/aws-c-io
> https://github.com/awslabs/aws-c-mqtt
> https://github.com/awslabs/aws-c-s3
> https://github.com/awslabs/aws-c-sdkutils
> https://github.com/awslabs/aws-lc
> https://github.com/aws/s2n-tls
>
> You will then probably need to modify the setup.py file
> (https://github.com/awslabs/aws-crt-python/blob/v0.16.10/setup.py) so that
> instead of using the cmake build functions have it use the system versions
> of these libraries pre-installed via the buildroot cmake infrastructure.
>
> You can probably use and check for an env variable such as this in the
> setup.py:
> PYTHON_AWSCRT_USE_SYSTEM_CRT=1
>
> When present have it disable building the cmake libraries itself and search
> for the installed system crt libraries instead of using the vendored
> cmake build.
>
> You should upstream this setup.py functionality to the aws-crt-project as
> well
> so that we don't need to carry a patch in buildroot for python-awscrt to
> use
> the system crt libraries.
>
> Then from the python-awscrt buildroot package you would set that env
> variable and add all the cmake subprojects as buildroot package
> dependencies.
>
> First thing you should start with is adding the cmake buildroot packages
> for
> the crt subprojects to buildroot then work on modifying aws-crt-python to
> work correctly with them instead of trying to use its broken cmake
> setuptools
> wrapper.
>
> >
> > Thanks in advance
> >
> > On Thu, 9 Feb 2023 at 10:28, Sourabh Hegde <hrsourabh011@gmail.com>
> wrote:
> >>
> >> Hi Maxim,
> >>
> >> I was missing python setuptools on my host. After installing it, I can
> add the package. Also, the added package is available in menuconfig
> >>
> >> Thank you for the support!
> >>
> >> On Thu, 9 Feb 2023 at 10:10, Maxim Kochetkov <fido_max@inbox.ru> wrote:
> >>>
> >>>
> >>>
> >>> On 09.02.2023 12:03, Sourabh Hegde wrote:
> >>> > Hello Maxim,
> >>> >
> >>> > Update:
> >>> >
> >>> > The above issue resolved by itself!
> >>> >
> >>> > Now when I do: utils/scanpypi awscrt -o package , it says
> >>> >
> >>> > spdx_lookup module is not installed. This can lead to an inaccurate
> >>> > licence detection. Please install it via
> >>> > pip install spdx_lookup
> >>> > buildroot package name for awscrt: python-awscrt
> >>> > Package: python-awscrt
> >>> > Fetching package awscrt
> >>> > ERROR: Could not find package awscrt.
> >>> > Check syntax inside the python package index:
> >>> > https://pypi.python.org/pypi/ <https://pypi.python.org/pypi/>
> >>> >
> >>> > But the package is available at https://pypi.org/project/awscrt/
> >>> > <https://pypi.org/project/awscrt/>
> >>>
> >>> It works fine for me:
> >>>
> >>> buildroot package name for awscrt: python-awscrt
> >>> Package: python-awscrt
> >>> Fetching package awscrt
> >>> Downloading package awscrt from
> >>>
> https://files.pythonhosted.org/packages/ae/98/dda092078f2d47bad08e184ab9d364b8f89166497062bc1cf811c0bbbde2/awscrt-0.16.10.tar.gz.
> ..
> >>> Checking if package package/python-awscrt already exists...
> >>> Creating package/python-awscrt/python-awscrt.mk...
> >>> More than one file found for license: LICENSE,
> crt/aws-c-common/LICENSE,
> >>> crt/aws-c-io/LICENSE, crt/aws-lc/LICENSE,
> >>> crt/aws-lc/third_party/fiat/LICENSE, crt/aws-c-mqtt/LICENSE,
> >>> crt/aws-checksums/LICENSE, crt/aws-c-s3/LICENSE,
> >>> crt/aws-c-compression/LICENSE, crt/aws-c-http/LICENSE,
> >>> crt/aws-c-sdkutils/LICENSE, crt/s2n/LICENSE, crt/aws-c-cal/LICENSE,
> >>> crt/aws-c-auth/LICENSE, crt/aws-c-event-stream/LICENSE
> >>> Creating package/python-awscrt/python-awscrt.hash...
> >>> Creating package/python-awscrt/Config.in...
> >>> NOTE: Remember to also make an update to the DEVELOPERS file
> >>>        and include an entry for the pkg in packages/Config.in
> >>>
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
>

--0000000000005724c305f4a3e6ae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello James,<div><br></div><div>Thanks for the update.=C2=
=A0</div><div><br></div><div>awscrt also has=C2=A0<a href=3D"https://pypi.o=
rg/project/awscrt/#files">precompiled wheels</a>=C2=A0such as=C2=A0<span st=
yle=3D"background-color:rgba(175,184,193,0.2);color:rgb(36,41,47);font-fami=
ly:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Lib=
eration Mono&quot;,monospace;font-size:11.9px;white-space:break-spaces">aws=
crt-0.16.10-cp311-cp311-manylinux_2_17_aarch64.manylinux2014_aarch64.whl</s=
pan></div><div><span style=3D"background-color:rgba(175,184,193,0.2);color:=
rgb(36,41,47);font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,M=
enlo,Consolas,&quot;Liberation Mono&quot;,monospace;font-size:11.9px;white-=
space:break-spaces"><br></span></div><div>Can Buildroot use them instead of=
 cross compiling? If not, is it possible to=C2=A0extract it and install man=
ually?</div><div><br></div><div>Thanks in advance</div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 9 Feb 2023 a=
t 21:12, James Hilliard &lt;<a href=3D"mailto:james.hilliard1@gmail.com">ja=
mes.hilliard1@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">On Thu, Feb 9, 2023 at 5:10 AM Sourabh Hegde &lt;<a =
href=3D"mailto:hrsourabh011@gmail.com" target=3D"_blank">hrsourabh011@gmail=
.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hello Maxim,<br>
&gt;<br>
&gt; While doing make with new Buildroot-packages I getting:<br>
&gt;<br>
&gt; [ 51%] Building ASM object aws-lc/crypto/CMakeFiles/crypto_objects.dir=
/hrss/asm/poly_rq_mul.S.o<br>
&gt; /home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrs=
s/asm/poly_rq_mul.S: Assembler messages:<br>
&gt; /home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrs=
s/asm/poly_rq_mul.S:304: Error: unknown pseudo-op: `.att_syntax&#39;<br>
&gt; /home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrs=
s/asm/poly_rq_mul.S:307: Error: unknown mnemonic `push&#39; -- `push %rbp&#=
39;<br>
&gt; /home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrs=
s/asm/poly_rq_mul.S:309: Error: bad register expression<br>
&gt; /home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrs=
s/asm/poly_rq_mul.S:310: Error: unknown mnemonic `movq&#39; -- `movq %rsp,%=
rbp&#39;<br>
&gt; /home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrs=
s/asm/poly_rq_mul.S:311: Error: bad register expression<br>
&gt; /home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrs=
s/asm/poly_rq_mul.S:312: Error: unknown mnemonic `push&#39; -- `push %r12&#=
39;<br>
&gt; /home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrs=
s/asm/poly_rq_mul.S:313: Error: bad register expression<br>
&gt; /home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrs=
s/asm/poly_rq_mul.S:321: Error: operand 1 must be an integer register -- `m=
ov %rcx,%r8&#39;<br>
&gt; /home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrs=
s/asm/poly_rq_mul.S:322: Error: unknown mnemonic `addq&#39; -- `addq $6144+=
12288+512+9408+32,%r8&#39;<br>
&gt; /home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrs=
s/asm/poly_rq_mul.S:323: Error: operand 1 must be an integer register -- `m=
ov %r8,%rax&#39;<br>
&gt; /home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrs=
s/asm/poly_rq_mul.S:324: Error: unknown mnemonic `subq&#39; -- `subq $6144,=
%r8&#39;<br>
&gt; /home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrs=
s/asm/poly_rq_mul.S:325: Error: operand 1 must be an integer register -- `m=
ov %r8,%r11&#39;<br>
&gt; /home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrs=
s/asm/poly_rq_mul.S:326: Error: unknown mnemonic `subq&#39; -- `subq $12288=
,%r8&#39;<br>
&gt; /home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrs=
s/asm/poly_rq_mul.S:327: Error: operand 1 must be an integer register -- `m=
ov %r8,%r12&#39;<br>
&gt; /home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrs=
s/asm/poly_rq_mul.S:328: Error: unknown mnemonic `subq&#39; -- `subq $512,%=
r8&#39;<br>
&gt; /home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrs=
s/asm/poly_rq_mul.S:329: Error: unknown mnemonic `vmovdqa&#39; -- `vmovdqa =
const3(%rip),%ymm3&#39;<br>
&gt; /home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrs=
s/asm/poly_rq_mul.S:330: Error: unknown mnemonic `vmovdqu&#39; -- `vmovdqu =
0(%rsi),%ymm0&#39;<br>
&gt; /home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrs=
s/asm/poly_rq_mul.S:331: Error: unknown mnemonic `vmovdqu&#39; -- `vmovdqu =
88(%rsi),%ymm1&#39;<br>
&gt; .<br>
&gt; .<br>
&gt; .<br>
&gt; Any idea what it is complaining about?<br>
<br>
The problem here is that while the python awscrt package uses setuptools<br=
>
it&#39;s not a normal python setuptools package, the setup.py installs both=
 a normal<br>
setuptools package and a vendored cmake package(meta package really).<br>
<br>
See cmake build wrapper functionality here in the setuptools setup.py file:=
<br>
<a href=3D"https://github.com/awslabs/aws-crt-python/blob/v0.16.10/setup.py=
#L156-L272" rel=3D"noreferrer" target=3D"_blank">https://github.com/awslabs=
/aws-crt-python/blob/v0.16.10/setup.py#L156-L272</a><br>
<br>
This is the cmake meta project root which is vendored inside of awscrt:<br>
<a href=3D"https://github.com/awslabs/aws-crt-python/tree/v0.16.10/crt" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/awslabs/aws-crt-python=
/tree/v0.16.10/crt</a><br>
<br>
See meta cmakelists build:<br>
<a href=3D"https://github.com/awslabs/aws-crt-python/blob/v0.16.10/crt/CMak=
eLists.txt" rel=3D"noreferrer" target=3D"_blank">https://github.com/awslabs=
/aws-crt-python/blob/v0.16.10/crt/CMakeLists.txt</a><br>
<br>
This meta project is made up of multiple subprojects:<br>
aws-c-auth<br>
aws-c-cal<br>
aws-c-common<br>
aws-c-compression<br>
aws-c-event-stream<br>
aws-checksums<br>
aws-c-http<br>
aws-c-io<br>
aws-c-mqtt<br>
aws-c-s3<br>
aws-c-sdkutils<br>
aws-lc<br>
s2n<br>
<br>
In buildroot we expect cmake packages to use our cmake infrastructure<br>
as it will set up the cross compilation environment correctly while the<br>
awscrt setuptools cmake wrapper does not.<br>
<br>
I confirmed that the cmake packages build correctly when using our<br>
cmake infrastructure:<br>
###########################################################################=
#####<br>
#<br>
# python-awscrt<br>
#<br>
###########################################################################=
#####<br>
<br>
PYTHON_AWSCRT_VERSION =3D 0.16.10<br>
PYTHON_AWSCRT_SOURCE =3D awscrt-$(PYTHON_AWSCRT_VERSION).tar.gz<br>
PYTHON_AWSCRT_SITE =3D<br>
<a href=3D"https://files.pythonhosted.org/packages/ae/98/dda092078f2d47bad0=
8e184ab9d364b8f89166497062bc1cf811c0bbbde2" rel=3D"noreferrer" target=3D"_b=
lank">https://files.pythonhosted.org/packages/ae/98/dda092078f2d47bad08e184=
ab9d364b8f89166497062bc1cf811c0bbbde2</a><br>
PYTHON_AWSCRT_SUBDIR =3D crt<br>
<br>
$(eval $(cmake-package))<br>
<br>
See:<br>
<a href=3D"https://buildroot.org/downloads/manual/manual.html#_infrastructu=
re_for_cmake_based_packages" rel=3D"noreferrer" target=3D"_blank">https://b=
uildroot.org/downloads/manual/manual.html#_infrastructure_for_cmake_based_p=
ackages</a><br>
<br>
So what I think you need to do is create buildroot cmake packages for all<b=
r>
these subprojects using buildroot&#39;s cmake infrastructure:<br>
<a href=3D"https://github.com/awslabs/aws-c-auth" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/awslabs/aws-c-auth</a><br>
<a href=3D"https://github.com/awslabs/aws-c-cal" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/awslabs/aws-c-cal</a><br>
<a href=3D"https://github.com/awslabs/aws-c-common" rel=3D"noreferrer" targ=
et=3D"_blank">https://github.com/awslabs/aws-c-common</a><br>
<a href=3D"https://github.com/awslabs/aws-c-compression" rel=3D"noreferrer"=
 target=3D"_blank">https://github.com/awslabs/aws-c-compression</a><br>
<a href=3D"https://github.com/awslabs/aws-c-event-stream" rel=3D"noreferrer=
" target=3D"_blank">https://github.com/awslabs/aws-c-event-stream</a><br>
<a href=3D"https://github.com/awslabs/aws-checksums" rel=3D"noreferrer" tar=
get=3D"_blank">https://github.com/awslabs/aws-checksums</a><br>
<a href=3D"https://github.com/awslabs/aws-c-http" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/awslabs/aws-c-http</a><br>
<a href=3D"https://github.com/awslabs/aws-c-io" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/awslabs/aws-c-io</a><br>
<a href=3D"https://github.com/awslabs/aws-c-mqtt" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/awslabs/aws-c-mqtt</a><br>
<a href=3D"https://github.com/awslabs/aws-c-s3" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/awslabs/aws-c-s3</a><br>
<a href=3D"https://github.com/awslabs/aws-c-sdkutils" rel=3D"noreferrer" ta=
rget=3D"_blank">https://github.com/awslabs/aws-c-sdkutils</a><br>
<a href=3D"https://github.com/awslabs/aws-lc" rel=3D"noreferrer" target=3D"=
_blank">https://github.com/awslabs/aws-lc</a><br>
<a href=3D"https://github.com/aws/s2n-tls" rel=3D"noreferrer" target=3D"_bl=
ank">https://github.com/aws/s2n-tls</a><br>
<br>
You will then probably need to modify the setup.py file<br>
(<a href=3D"https://github.com/awslabs/aws-crt-python/blob/v0.16.10/setup.p=
y" rel=3D"noreferrer" target=3D"_blank">https://github.com/awslabs/aws-crt-=
python/blob/v0.16.10/setup.py</a>) so that<br>
instead of using the cmake build functions have it use the system versions<=
br>
of these libraries pre-installed via the buildroot cmake infrastructure.<br=
>
<br>
You can probably use and check for an env variable such as this in the setu=
p.py:<br>
PYTHON_AWSCRT_USE_SYSTEM_CRT=3D1<br>
<br>
When present have it disable building the cmake libraries itself and search=
<br>
for the installed system crt libraries instead of using the vendored<br>
cmake build.<br>
<br>
You should upstream this setup.py functionality to the aws-crt-project as w=
ell<br>
so that we don&#39;t need to carry a patch in buildroot for python-awscrt t=
o use<br>
the system crt libraries.<br>
<br>
Then from the python-awscrt buildroot package you would set that env<br>
variable and add all the cmake subprojects as buildroot package dependencie=
s.<br>
<br>
First thing you should start with is adding the cmake buildroot packages fo=
r<br>
the crt subprojects to buildroot then work on modifying aws-crt-python to<b=
r>
work correctly with them instead of trying to use its broken cmake setuptoo=
ls<br>
wrapper.<br>
<br>
&gt;<br>
&gt; Thanks in advance<br>
&gt;<br>
&gt; On Thu, 9 Feb 2023 at 10:28, Sourabh Hegde &lt;<a href=3D"mailto:hrsou=
rabh011@gmail.com" target=3D"_blank">hrsourabh011@gmail.com</a>&gt; wrote:<=
br>
&gt;&gt;<br>
&gt;&gt; Hi Maxim,<br>
&gt;&gt;<br>
&gt;&gt; I was missing python setuptools on my host. After installing it, I=
 can add the package. Also, the added package is available in menuconfig<br=
>
&gt;&gt;<br>
&gt;&gt; Thank you for the support!<br>
&gt;&gt;<br>
&gt;&gt; On Thu, 9 Feb 2023 at 10:10, Maxim Kochetkov &lt;<a href=3D"mailto=
:fido_max@inbox.ru" target=3D"_blank">fido_max@inbox.ru</a>&gt; wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On 09.02.2023 12:03, Sourabh Hegde wrote:<br>
&gt;&gt;&gt; &gt; Hello Maxim,<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; Update:<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; The above issue resolved by itself!<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; Now when I do: utils/scanpypi awscrt -o package , it says=
<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; spdx_lookup module is not installed. This can lead to an =
inaccurate<br>
&gt;&gt;&gt; &gt; licence detection. Please install it via<br>
&gt;&gt;&gt; &gt; pip install spdx_lookup<br>
&gt;&gt;&gt; &gt; buildroot package name for awscrt: python-awscrt<br>
&gt;&gt;&gt; &gt; Package: python-awscrt<br>
&gt;&gt;&gt; &gt; Fetching package awscrt<br>
&gt;&gt;&gt; &gt; ERROR: Could not find package awscrt.<br>
&gt;&gt;&gt; &gt; Check syntax inside the python package index:<br>
&gt;&gt;&gt; &gt; <a href=3D"https://pypi.python.org/pypi/" rel=3D"noreferr=
er" target=3D"_blank">https://pypi.python.org/pypi/</a> &lt;<a href=3D"http=
s://pypi.python.org/pypi/" rel=3D"noreferrer" target=3D"_blank">https://pyp=
i.python.org/pypi/</a>&gt;<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; But the package is available at <a href=3D"https://pypi.o=
rg/project/awscrt/" rel=3D"noreferrer" target=3D"_blank">https://pypi.org/p=
roject/awscrt/</a><br>
&gt;&gt;&gt; &gt; &lt;<a href=3D"https://pypi.org/project/awscrt/" rel=3D"n=
oreferrer" target=3D"_blank">https://pypi.org/project/awscrt/</a>&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; It works fine for me:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; buildroot package name for awscrt: python-awscrt<br>
&gt;&gt;&gt; Package: python-awscrt<br>
&gt;&gt;&gt; Fetching package awscrt<br>
&gt;&gt;&gt; Downloading package awscrt from<br>
&gt;&gt;&gt; <a href=3D"https://files.pythonhosted.org/packages/ae/98/dda09=
2078f2d47bad08e184ab9d364b8f89166497062bc1cf811c0bbbde2/awscrt-0.16.10.tar.=
gz." rel=3D"noreferrer" target=3D"_blank">https://files.pythonhosted.org/pa=
ckages/ae/98/dda092078f2d47bad08e184ab9d364b8f89166497062bc1cf811c0bbbde2/a=
wscrt-0.16.10.tar.gz.</a>..<br>
&gt;&gt;&gt; Checking if package package/python-awscrt already exists...<br=
>
&gt;&gt;&gt; Creating package/python-awscrt/python-awscrt.mk...<br>
&gt;&gt;&gt; More than one file found for license: LICENSE, crt/aws-c-commo=
n/LICENSE,<br>
&gt;&gt;&gt; crt/aws-c-io/LICENSE, crt/aws-lc/LICENSE,<br>
&gt;&gt;&gt; crt/aws-lc/third_party/fiat/LICENSE, crt/aws-c-mqtt/LICENSE,<b=
r>
&gt;&gt;&gt; crt/aws-checksums/LICENSE, crt/aws-c-s3/LICENSE,<br>
&gt;&gt;&gt; crt/aws-c-compression/LICENSE, crt/aws-c-http/LICENSE,<br>
&gt;&gt;&gt; crt/aws-c-sdkutils/LICENSE, crt/s2n/LICENSE, crt/aws-c-cal/LIC=
ENSE,<br>
&gt;&gt;&gt; crt/aws-c-auth/LICENSE, crt/aws-c-event-stream/LICENSE<br>
&gt;&gt;&gt; Creating package/python-awscrt/python-awscrt.hash...<br>
&gt;&gt;&gt; Creating package/python-awscrt/Config.in...<br>
&gt;&gt;&gt; NOTE: Remember to also make an update to the DEVELOPERS file<b=
r>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 and include an entry for the pkg in=
 packages/Config.in<br>
&gt;&gt;&gt;<br>
&gt; _______________________________________________<br>
&gt; buildroot mailing list<br>
&gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot=
@buildroot.org</a><br>
&gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=
=3D"noreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listi=
nfo/buildroot</a><br>
</blockquote></div>

--0000000000005724c305f4a3e6ae--

--===============6228506579198772498==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6228506579198772498==--
