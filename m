Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55255C61DA4
	for <buildroot@archiver.kernel.org>; Tue, 14 Feb 2023 21:22:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ECC1760F80;
	Tue, 14 Feb 2023 21:22:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ECC1760F80
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XomL8fXDknxc; Tue, 14 Feb 2023 21:22:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 132B560FD1;
	Tue, 14 Feb 2023 21:22:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 132B560FD1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 154481BF94D
 for <buildroot@lists.busybox.net>; Tue, 14 Feb 2023 21:22:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E35C0408CC
 for <buildroot@lists.busybox.net>; Tue, 14 Feb 2023 21:22:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E35C0408CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hcrdy9Kuuhup for <buildroot@lists.busybox.net>;
 Tue, 14 Feb 2023 21:22:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54B28408B0
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 54B28408B0
 for <buildroot@buildroot.org>; Tue, 14 Feb 2023 21:22:37 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-15f97c478a8so20669020fac.13
 for <buildroot@buildroot.org>; Tue, 14 Feb 2023 13:22:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PPwO6EcLDFOqaSvhE78eyBoTX8M9O2AGPkwFebX+RSk=;
 b=JtDsV511zks+vftYwTNapOqwFHCC+SDgh9EAfS/trsmogbVTxL6GT1tNKsKY+U3w95
 l1qI9ugFxEB+9KgxMXu5uZPCZjAKszg3SunXy2tn/SteFW8UORwolI8WuWvDzRsw56Jt
 bTWzysydvyjfeo5nargw/QzSwhBXlWEBqUb2oHpfXAAfJe0S+9GP4fZAhm1qq3u1nQ7W
 VyN3r/2T1aFixBXLBg+dK/EnzVN+PsBvugHzaF11bWH5MRxL4zBFFoscRp0b81bfD1IC
 +3RuPr9xEJiYh658lZmJ3yBeWh3aRVpJNMoJYM6Rkm0YlwjEcpFRdfs+kMQE9ojV/msi
 UKww==
X-Gm-Message-State: AO0yUKXM8pWMsC5V5jYmCViq+Uxs3Fj2K4bNd+cdq/M3A83v8IvEyGW2
 83gwKW90P2YnXpFuxkSDa81nOv22wpYizNp//vifwA/yOd6neA==
X-Google-Smtp-Source: AK7set979Ag3BF/mNrJuOwLLQifrqEDJ05fOp138FhMTEgccDkJ+YBBaLwe1LUdpPwXyBRN4Op+YJR0rKguYpm4oY+k=
X-Received: by 2002:a05:6870:1214:b0:163:42d7:fa0d with SMTP id
 20-20020a056870121400b0016342d7fa0dmr27087oan.208.1676409756265; Tue, 14 Feb
 2023 13:22:36 -0800 (PST)
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
 <CADYjeSta1Noc0jOozULC9CrTZOeHMKOGxj6ApG_acGrdmi6eoA@mail.gmail.com>
 <016a0f72-aa86-dd35-5e6a-100d2564d25a@mind.be>
In-Reply-To: <016a0f72-aa86-dd35-5e6a-100d2564d25a@mind.be>
From: Sourabh Hegde <hrsourabh011@gmail.com>
Date: Tue, 14 Feb 2023 22:22:24 +0100
Message-ID: <CADYjeStyFnf9UF-PjN=Nq9NfzNcVa98RmqaLRzBNO7a-hfjdPA@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PPwO6EcLDFOqaSvhE78eyBoTX8M9O2AGPkwFebX+RSk=;
 b=fdDQb0ETEXIVEbQsCHzrCqV4T5lywbb+pLnLhQLU0XX+n7SNOQzDZkSsb0Z4kJGByd
 8f9NABSX6BhldW3dvFBroCxMRKo0x6ZAUuzbGKhncu4Doh8tiogZ4NBC/p7wKpQEU8mz
 0ZxIfEhJG9SeuXkyNqvkBro4jPX34P9V5o57FljYTOmEwhxscv2fYsLao+4QmrkmeFCO
 bChMc8MEmu7WUxyMDabWAm2LtAxX8BW5PYeVE+4QV8fp8nRIfAA81arO91A3rqtbudJW
 eSMd5TPEcPOjtLg9WWpESL81QmUy6xOj7pERUrVoIl8k1VdYJZaIBxo4IzotSS+BXb6Y
 8bgg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=fdDQb0ET
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
 James Hilliard <james.hilliard1@gmail.com>,
 Ramon Crichlow <rcrichlow9000@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============7566667411149178440=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7566667411149178440==
Content-Type: multipart/alternative; boundary="00000000000005306905f4af903e"

--00000000000005306905f4af903e
Content-Type: text/plain; charset="UTF-8"

Hello Arnout,

Thanks for the update.

On Tue, 14 Feb 2023 at 21:56, Arnout Vandecappelle <arnout@mind.be> wrote:

>
>
> On 14/02/2023 08:27, Sourabh Hegde wrote:
> > Hello James,
> >
> > Thanks for the update.
> >
> > awscrt also has precompiled wheels <
> https://pypi.org/project/awscrt/#files> such
> > as
> awscrt-0.16.10-cp311-cp311-manylinux_2_17_aarch64.manylinux2014_aarch64.whl
> >
> > Can Buildroot use them instead of cross compiling?
>
>   If cross-compiling is difficult, it's fairly likely that there are many
> cases
> where the binary wheel won't work either. Therefore, no, we (probably)
> can't use
> them.
>
> > If not, is it possible
> > to extract it and install manually?
>
>   You can do that in a post-build script. It's going to be something that
> is
> tested in your specific use case only, so not something that we would
> support
> upstream.
>
>   A wheel file is actually a zip file, so you just need to unzip it in the
> site_packages directory. And test if it works, of course.
>

To understand it correctly, should I unzip the wheel file into
"/target/lib/python3.10/site-packages/" after the make?

But, this "awscrt" is the dependency for https://pypi.org/project/awsiotsdk/
 https://github.com/aws/aws-iot-device-sdk-python-v2#installation-issues
And now how can I select this dependency during build?


>
>   Regards,
>   Arnout
>
> >
> > Thanks in advance
> >
> > On Thu, 9 Feb 2023 at 21:12, James Hilliard <james.hilliard1@gmail.com
> > <mailto:james.hilliard1@gmail.com>> wrote:
> >
> >     On Thu, Feb 9, 2023 at 5:10 AM Sourabh Hegde <hrsourabh011@gmail.com
> >     <mailto:hrsourabh011@gmail.com>> wrote:
> >      >
> >      > Hello Maxim,
> >      >
> >      > While doing make with new Buildroot-packages I getting:
> >      >
> >      > [ 51%] Building ASM object
> >     aws-lc/crypto/CMakeFiles/crypto_objects.dir/hrss/asm/poly_rq_mul.S.o
> >      >
> >
>  /home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrss/asm/poly_rq_mul.S:
> Assembler messages:
> >      >
> >
>  /home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrss/asm/poly_rq_mul.S:304:
> Error: unknown pseudo-op: `.att_syntax'
> >      >
> >
>  /home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrss/asm/poly_rq_mul.S:307:
> Error: unknown mnemonic `push' -- `push %rbp'
> >      >
> >
>  /home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrss/asm/poly_rq_mul.S:309:
> Error: bad register expression
> >      >
> >
>  /home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrss/asm/poly_rq_mul.S:310:
> Error: unknown mnemonic `movq' -- `movq %rsp,%rbp'
> >      >
> >
>  /home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrss/asm/poly_rq_mul.S:311:
> Error: bad register expression
> >      >
> >
>  /home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrss/asm/poly_rq_mul.S:312:
> Error: unknown mnemonic `push' -- `push %r12'
> >      >
> >
>  /home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrss/asm/poly_rq_mul.S:313:
> Error: bad register expression
> >      >
> >
>  /home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrss/asm/poly_rq_mul.S:321:
> Error: operand 1 must be an integer register -- `mov %rcx,%r8'
> >      >
> >
>  /home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrss/asm/poly_rq_mul.S:322:
> Error: unknown mnemonic `addq' -- `addq $6144+12288+512+9408+32,%r8'
> >      >
> >
>  /home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrss/asm/poly_rq_mul.S:323:
> Error: operand 1 must be an integer register -- `mov %r8,%rax'
> >      >
> >
>  /home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrss/asm/poly_rq_mul.S:324:
> Error: unknown mnemonic `subq' -- `subq $6144,%r8'
> >      >
> >
>  /home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrss/asm/poly_rq_mul.S:325:
> Error: operand 1 must be an integer register -- `mov %r8,%r11'
> >      >
> >
>  /home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrss/asm/poly_rq_mul.S:326:
> Error: unknown mnemonic `subq' -- `subq $12288,%r8'
> >      >
> >
>  /home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrss/asm/poly_rq_mul.S:327:
> Error: operand 1 must be an integer register -- `mov %r8,%r12'
> >      >
> >
>  /home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrss/asm/poly_rq_mul.S:328:
> Error: unknown mnemonic `subq' -- `subq $512,%r8'
> >      >
> >
>  /home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrss/asm/poly_rq_mul.S:329:
> Error: unknown mnemonic `vmovdqa' -- `vmovdqa const3(%rip),%ymm3'
> >      >
> >
>  /home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrss/asm/poly_rq_mul.S:330:
> Error: unknown mnemonic `vmovdqu' -- `vmovdqu 0(%rsi),%ymm0'
> >      >
> >
>  /home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrss/asm/poly_rq_mul.S:331:
> Error: unknown mnemonic `vmovdqu' -- `vmovdqu 88(%rsi),%ymm1'
> >      > .
> >      > .
> >      > .
> >      > Any idea what it is complaining about?
> >
> >     The problem here is that while the python awscrt package uses
> setuptools
> >     it's not a normal python setuptools package, the setup.py installs
> both a normal
> >     setuptools package and a vendored cmake package(meta package really).
> >
> >     See cmake build wrapper functionality here in the setuptools
> setup.py file:
> >
> https://github.com/awslabs/aws-crt-python/blob/v0.16.10/setup.py#L156-L272
> >     <
> https://github.com/awslabs/aws-crt-python/blob/v0.16.10/setup.py#L156-L272
> >
> >
> >     This is the cmake meta project root which is vendored inside of
> awscrt:
> >     https://github.com/awslabs/aws-crt-python/tree/v0.16.10/crt
> >     <https://github.com/awslabs/aws-crt-python/tree/v0.16.10/crt>
> >
> >     See meta cmakelists build:
> >
> https://github.com/awslabs/aws-crt-python/blob/v0.16.10/crt/CMakeLists.txt
> >     <
> https://github.com/awslabs/aws-crt-python/blob/v0.16.10/crt/CMakeLists.txt
> >
> >
> >     This meta project is made up of multiple subprojects:
> >     aws-c-auth
> >     aws-c-cal
> >     aws-c-common
> >     aws-c-compression
> >     aws-c-event-stream
> >     aws-checksums
> >     aws-c-http
> >     aws-c-io
> >     aws-c-mqtt
> >     aws-c-s3
> >     aws-c-sdkutils
> >     aws-lc
> >     s2n
> >
> >     In buildroot we expect cmake packages to use our cmake infrastructure
> >     as it will set up the cross compilation environment correctly while
> the
> >     awscrt setuptools cmake wrapper does not.
> >
> >     I confirmed that the cmake packages build correctly when using our
> >     cmake infrastructure:
> >
>  ################################################################################
> >     #
> >     # python-awscrt
> >     #
> >
>  ################################################################################
> >
> >     PYTHON_AWSCRT_VERSION = 0.16.10
> >     PYTHON_AWSCRT_SOURCE = awscrt-$(PYTHON_AWSCRT_VERSION).tar.gz
> >     PYTHON_AWSCRT_SITE =
> >
> https://files.pythonhosted.org/packages/ae/98/dda092078f2d47bad08e184ab9d364b8f89166497062bc1cf811c0bbbde2
> <
> https://files.pythonhosted.org/packages/ae/98/dda092078f2d47bad08e184ab9d364b8f89166497062bc1cf811c0bbbde2
> >
> >     PYTHON_AWSCRT_SUBDIR = crt
> >
> >     $(eval $(cmake-package))
> >
> >     See:
> >
> https://buildroot.org/downloads/manual/manual.html#_infrastructure_for_cmake_based_packages
> <
> https://buildroot.org/downloads/manual/manual.html#_infrastructure_for_cmake_based_packages
> >
> >
> >     So what I think you need to do is create buildroot cmake packages
> for all
> >     these subprojects using buildroot's cmake infrastructure:
> >     https://github.com/awslabs/aws-c-auth <
> https://github.com/awslabs/aws-c-auth>
> >     https://github.com/awslabs/aws-c-cal <
> https://github.com/awslabs/aws-c-cal>
> >     https://github.com/awslabs/aws-c-common
> >     <https://github.com/awslabs/aws-c-common>
> >     https://github.com/awslabs/aws-c-compression
> >     <https://github.com/awslabs/aws-c-compression>
> >     https://github.com/awslabs/aws-c-event-stream
> >     <https://github.com/awslabs/aws-c-event-stream>
> >     https://github.com/awslabs/aws-checksums
> >     <https://github.com/awslabs/aws-checksums>
> >     https://github.com/awslabs/aws-c-http <
> https://github.com/awslabs/aws-c-http>
> >     https://github.com/awslabs/aws-c-io <
> https://github.com/awslabs/aws-c-io>
> >     https://github.com/awslabs/aws-c-mqtt <
> https://github.com/awslabs/aws-c-mqtt>
> >     https://github.com/awslabs/aws-c-s3 <
> https://github.com/awslabs/aws-c-s3>
> >     https://github.com/awslabs/aws-c-sdkutils
> >     <https://github.com/awslabs/aws-c-sdkutils>
> >     https://github.com/awslabs/aws-lc <https://github.com/awslabs/aws-lc
> >
> >     https://github.com/aws/s2n-tls <https://github.com/aws/s2n-tls>
> >
> >     You will then probably need to modify the setup.py file
> >     (https://github.com/awslabs/aws-crt-python/blob/v0.16.10/setup.py
> >     <https://github.com/awslabs/aws-crt-python/blob/v0.16.10/setup.py>)
> so that
> >     instead of using the cmake build functions have it use the system
> versions
> >     of these libraries pre-installed via the buildroot cmake
> infrastructure.
> >
> >     You can probably use and check for an env variable such as this in
> the setup.py:
> >     PYTHON_AWSCRT_USE_SYSTEM_CRT=1
> >
> >     When present have it disable building the cmake libraries itself and
> search
> >     for the installed system crt libraries instead of using the vendored
> >     cmake build.
> >
> >     You should upstream this setup.py functionality to the
> aws-crt-project as well
> >     so that we don't need to carry a patch in buildroot for
> python-awscrt to use
> >     the system crt libraries.
> >
> >     Then from the python-awscrt buildroot package you would set that env
> >     variable and add all the cmake subprojects as buildroot package
> dependencies.
> >
> >     First thing you should start with is adding the cmake buildroot
> packages for
> >     the crt subprojects to buildroot then work on modifying
> aws-crt-python to
> >     work correctly with them instead of trying to use its broken cmake
> setuptools
> >     wrapper.
> >
> >      >
> >      > Thanks in advance
> >      >
> >      > On Thu, 9 Feb 2023 at 10:28, Sourabh Hegde <
> hrsourabh011@gmail.com
> >     <mailto:hrsourabh011@gmail.com>> wrote:
> >      >>
> >      >> Hi Maxim,
> >      >>
> >      >> I was missing python setuptools on my host. After installing it,
> I can
> >     add the package. Also, the added package is available in menuconfig
> >      >>
> >      >> Thank you for the support!
> >      >>
> >      >> On Thu, 9 Feb 2023 at 10:10, Maxim Kochetkov <fido_max@inbox.ru
> >     <mailto:fido_max@inbox.ru>> wrote:
> >      >>>
> >      >>>
> >      >>>
> >      >>> On 09.02.2023 12:03, Sourabh Hegde wrote:
> >      >>> > Hello Maxim,
> >      >>> >
> >      >>> > Update:
> >      >>> >
> >      >>> > The above issue resolved by itself!
> >      >>> >
> >      >>> > Now when I do: utils/scanpypi awscrt -o package , it says
> >      >>> >
> >      >>> > spdx_lookup module is not installed. This can lead to an
> inaccurate
> >      >>> > licence detection. Please install it via
> >      >>> > pip install spdx_lookup
> >      >>> > buildroot package name for awscrt: python-awscrt
> >      >>> > Package: python-awscrt
> >      >>> > Fetching package awscrt
> >      >>> > ERROR: Could not find package awscrt.
> >      >>> > Check syntax inside the python package index:
> >      >>> > https://pypi.python.org/pypi/ <https://pypi.python.org/pypi/>
> >     <https://pypi.python.org/pypi/ <https://pypi.python.org/pypi/>>
> >      >>> >
> >      >>> > But the package is available at
> https://pypi.org/project/awscrt/
> >     <https://pypi.org/project/awscrt/>
> >      >>> > <https://pypi.org/project/awscrt/ <
> https://pypi.org/project/awscrt/>>
> >      >>>
> >      >>> It works fine for me:
> >      >>>
> >      >>> buildroot package name for awscrt: python-awscrt
> >      >>> Package: python-awscrt
> >      >>> Fetching package awscrt
> >      >>> Downloading package awscrt from
> >      >>>
> >
> https://files.pythonhosted.org/packages/ae/98/dda092078f2d47bad08e184ab9d364b8f89166497062bc1cf811c0bbbde2/awscrt-0.16.10.tar.gz.
> <
> https://files.pythonhosted.org/packages/ae/98/dda092078f2d47bad08e184ab9d364b8f89166497062bc1cf811c0bbbde2/awscrt-0.16.10.tar.gz
> .>..
> >      >>> Checking if package package/python-awscrt already exists...
> >      >>> Creating package/python-awscrt/python-awscrt.mk...
> >      >>> More than one file found for license: LICENSE,
> crt/aws-c-common/LICENSE,
> >      >>> crt/aws-c-io/LICENSE, crt/aws-lc/LICENSE,
> >      >>> crt/aws-lc/third_party/fiat/LICENSE, crt/aws-c-mqtt/LICENSE,
> >      >>> crt/aws-checksums/LICENSE, crt/aws-c-s3/LICENSE,
> >      >>> crt/aws-c-compression/LICENSE, crt/aws-c-http/LICENSE,
> >      >>> crt/aws-c-sdkutils/LICENSE, crt/s2n/LICENSE,
> crt/aws-c-cal/LICENSE,
> >      >>> crt/aws-c-auth/LICENSE, crt/aws-c-event-stream/LICENSE
> >      >>> Creating package/python-awscrt/python-awscrt.hash...
> >      >>> Creating package/python-awscrt/Config.in...
> >      >>> NOTE: Remember to also make an update to the DEVELOPERS file
> >      >>>        and include an entry for the pkg in packages/Config.in
> >      >>>
> >      > _______________________________________________
> >      > buildroot mailing list
> >      > buildroot@buildroot.org <mailto:buildroot@buildroot.org>
> >      > https://lists.buildroot.org/mailman/listinfo/buildroot
> >     <https://lists.buildroot.org/mailman/listinfo/buildroot>
> >
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
>

--00000000000005306905f4af903e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hello=C2=A0Arnout,<div><br></div><div>Tha=
nks for the update.</div><div><br></div></div><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Tue, 14 Feb 2023 at 21:56, Arnout Va=
ndecappelle &lt;<a href=3D"mailto:arnout@mind.be">arnout@mind.be</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On 14/02/2023 08:27, Sourabh Hegde wrote:<br>
&gt; Hello James,<br>
&gt; <br>
&gt; Thanks for the update.<br>
&gt; <br>
&gt; awscrt also has precompiled wheels &lt;<a href=3D"https://pypi.org/pro=
ject/awscrt/#files" rel=3D"noreferrer" target=3D"_blank">https://pypi.org/p=
roject/awscrt/#files</a>&gt;=C2=A0such <br>
&gt; as awscrt-0.16.10-cp311-cp311-manylinux_2_17_aarch64.manylinux2014_aar=
ch64.whl<br>
&gt; <br>
&gt; Can Buildroot use them instead of cross compiling?<br>
<br>
=C2=A0 If cross-compiling is difficult, it&#39;s fairly likely that there a=
re many cases <br>
where the binary wheel won&#39;t work either. Therefore, no, we (probably) =
can&#39;t use <br>
them.<br>
<br>
&gt; If not, is it possible <br>
&gt; to=C2=A0extract it and install manually?<br>
<br>
=C2=A0 You can do that in a post-build script. It&#39;s going to be somethi=
ng that is <br>
tested in your specific use case only, so not something that we would suppo=
rt <br>
upstream.<br>
<br>
=C2=A0 A wheel file is actually a zip file, so you just need to unzip it in=
 the <br>
site_packages directory. And test if it works, of course.<br></blockquote><=
div><br></div><div>To understand it correctly, should I unzip the wheel fil=
e into &quot;/target/lib/python3.10/site-packages/&quot; after the make?</d=
iv><div><br></div><div>But, this &quot;awscrt&quot; is the dependency for=
=C2=A0<a href=3D"https://pypi.org/project/awsiotsdk/">https://pypi.org/proj=
ect/awsiotsdk/</a>=C2=A0<a href=3D"https://github.com/aws/aws-iot-device-sd=
k-python-v2#installation-issues">https://github.com/aws/aws-iot-device-sdk-=
python-v2#installation-issues</a></div><div>And now how can I select this d=
ependency during build?</div><div>=C2=A0</div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
<br>
=C2=A0 Regards,<br>
=C2=A0 Arnout<br>
<br>
&gt; <br>
&gt; Thanks in advance<br>
&gt; <br>
&gt; On Thu, 9 Feb 2023 at 21:12, James Hilliard &lt;<a href=3D"mailto:jame=
s.hilliard1@gmail.com" target=3D"_blank">james.hilliard1@gmail.com</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:james.hilliard1@gmail.com" target=3D"_bla=
nk">james.hilliard1@gmail.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On Thu, Feb 9, 2023 at 5:10 AM Sourabh Hegde &lt;<a=
 href=3D"mailto:hrsourabh011@gmail.com" target=3D"_blank">hrsourabh011@gmai=
l.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:hrsourabh011@gmail.com=
" target=3D"_blank">hrsourabh011@gmail.com</a>&gt;&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Hello Maxim,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; While doing make with new Buildroot-packages =
I getting:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; [ 51%] Building ASM object<br>
&gt;=C2=A0 =C2=A0 =C2=A0aws-lc/crypto/CMakeFiles/crypto_objects.dir/hrss/as=
m/poly_rq_mul.S.o<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0/home/amazone/output/build/python-awscrt-0.16.10/cr=
t/aws-lc/crypto/hrss/asm/poly_rq_mul.S: Assembler messages:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0/home/amazone/output/build/python-awscrt-0.16.10/cr=
t/aws-lc/crypto/hrss/asm/poly_rq_mul.S:304: Error: unknown pseudo-op: `.att=
_syntax&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0/home/amazone/output/build/python-awscrt-0.16.10/cr=
t/aws-lc/crypto/hrss/asm/poly_rq_mul.S:307: Error: unknown mnemonic `push&#=
39; -- `push %rbp&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0/home/amazone/output/build/python-awscrt-0.16.10/cr=
t/aws-lc/crypto/hrss/asm/poly_rq_mul.S:309: Error: bad register expression<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0/home/amazone/output/build/python-awscrt-0.16.10/cr=
t/aws-lc/crypto/hrss/asm/poly_rq_mul.S:310: Error: unknown mnemonic `movq&#=
39; -- `movq %rsp,%rbp&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0/home/amazone/output/build/python-awscrt-0.16.10/cr=
t/aws-lc/crypto/hrss/asm/poly_rq_mul.S:311: Error: bad register expression<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0/home/amazone/output/build/python-awscrt-0.16.10/cr=
t/aws-lc/crypto/hrss/asm/poly_rq_mul.S:312: Error: unknown mnemonic `push&#=
39; -- `push %r12&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0/home/amazone/output/build/python-awscrt-0.16.10/cr=
t/aws-lc/crypto/hrss/asm/poly_rq_mul.S:313: Error: bad register expression<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0/home/amazone/output/build/python-awscrt-0.16.10/cr=
t/aws-lc/crypto/hrss/asm/poly_rq_mul.S:321: Error: operand 1 must be an int=
eger register -- `mov %rcx,%r8&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0/home/amazone/output/build/python-awscrt-0.16.10/cr=
t/aws-lc/crypto/hrss/asm/poly_rq_mul.S:322: Error: unknown mnemonic `addq&#=
39; -- `addq $6144+12288+512+9408+32,%r8&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0/home/amazone/output/build/python-awscrt-0.16.10/cr=
t/aws-lc/crypto/hrss/asm/poly_rq_mul.S:323: Error: operand 1 must be an int=
eger register -- `mov %r8,%rax&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0/home/amazone/output/build/python-awscrt-0.16.10/cr=
t/aws-lc/crypto/hrss/asm/poly_rq_mul.S:324: Error: unknown mnemonic `subq&#=
39; -- `subq $6144,%r8&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0/home/amazone/output/build/python-awscrt-0.16.10/cr=
t/aws-lc/crypto/hrss/asm/poly_rq_mul.S:325: Error: operand 1 must be an int=
eger register -- `mov %r8,%r11&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0/home/amazone/output/build/python-awscrt-0.16.10/cr=
t/aws-lc/crypto/hrss/asm/poly_rq_mul.S:326: Error: unknown mnemonic `subq&#=
39; -- `subq $12288,%r8&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0/home/amazone/output/build/python-awscrt-0.16.10/cr=
t/aws-lc/crypto/hrss/asm/poly_rq_mul.S:327: Error: operand 1 must be an int=
eger register -- `mov %r8,%r12&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0/home/amazone/output/build/python-awscrt-0.16.10/cr=
t/aws-lc/crypto/hrss/asm/poly_rq_mul.S:328: Error: unknown mnemonic `subq&#=
39; -- `subq $512,%r8&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0/home/amazone/output/build/python-awscrt-0.16.10/cr=
t/aws-lc/crypto/hrss/asm/poly_rq_mul.S:329: Error: unknown mnemonic `vmovdq=
a&#39; -- `vmovdqa const3(%rip),%ymm3&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0/home/amazone/output/build/python-awscrt-0.16.10/cr=
t/aws-lc/crypto/hrss/asm/poly_rq_mul.S:330: Error: unknown mnemonic `vmovdq=
u&#39; -- `vmovdqu 0(%rsi),%ymm0&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0/home/amazone/output/build/python-awscrt-0.16.10/cr=
t/aws-lc/crypto/hrss/asm/poly_rq_mul.S:331: Error: unknown mnemonic `vmovdq=
u&#39; -- `vmovdqu 88(%rsi),%ymm1&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; .<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; .<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; .<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Any idea what it is complaining about?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0The problem here is that while the python awscrt pa=
ckage uses setuptools<br>
&gt;=C2=A0 =C2=A0 =C2=A0it&#39;s not a normal python setuptools package, th=
e setup.py installs both a normal<br>
&gt;=C2=A0 =C2=A0 =C2=A0setuptools package and a vendored cmake package(met=
a package really).<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0See cmake build wrapper functionality here in the s=
etuptools setup.py file:<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/awslabs/aws-crt-pytho=
n/blob/v0.16.10/setup.py#L156-L272" rel=3D"noreferrer" target=3D"_blank">ht=
tps://github.com/awslabs/aws-crt-python/blob/v0.16.10/setup.py#L156-L272</a=
><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://github.com/awslabs/aws-crt-p=
ython/blob/v0.16.10/setup.py#L156-L272" rel=3D"noreferrer" target=3D"_blank=
">https://github.com/awslabs/aws-crt-python/blob/v0.16.10/setup.py#L156-L27=
2</a>&gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0This is the cmake meta project root which is vendor=
ed inside of awscrt:<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/awslabs/aws-crt-pytho=
n/tree/v0.16.10/crt" rel=3D"noreferrer" target=3D"_blank">https://github.co=
m/awslabs/aws-crt-python/tree/v0.16.10/crt</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://github.com/awslabs/aws-crt-p=
ython/tree/v0.16.10/crt" rel=3D"noreferrer" target=3D"_blank">https://githu=
b.com/awslabs/aws-crt-python/tree/v0.16.10/crt</a>&gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0See meta cmakelists build:<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/awslabs/aws-crt-pytho=
n/blob/v0.16.10/crt/CMakeLists.txt" rel=3D"noreferrer" target=3D"_blank">ht=
tps://github.com/awslabs/aws-crt-python/blob/v0.16.10/crt/CMakeLists.txt</a=
><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://github.com/awslabs/aws-crt-p=
ython/blob/v0.16.10/crt/CMakeLists.txt" rel=3D"noreferrer" target=3D"_blank=
">https://github.com/awslabs/aws-crt-python/blob/v0.16.10/crt/CMakeLists.tx=
t</a>&gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0This meta project is made up of multiple subproject=
s:<br>
&gt;=C2=A0 =C2=A0 =C2=A0aws-c-auth<br>
&gt;=C2=A0 =C2=A0 =C2=A0aws-c-cal<br>
&gt;=C2=A0 =C2=A0 =C2=A0aws-c-common<br>
&gt;=C2=A0 =C2=A0 =C2=A0aws-c-compression<br>
&gt;=C2=A0 =C2=A0 =C2=A0aws-c-event-stream<br>
&gt;=C2=A0 =C2=A0 =C2=A0aws-checksums<br>
&gt;=C2=A0 =C2=A0 =C2=A0aws-c-http<br>
&gt;=C2=A0 =C2=A0 =C2=A0aws-c-io<br>
&gt;=C2=A0 =C2=A0 =C2=A0aws-c-mqtt<br>
&gt;=C2=A0 =C2=A0 =C2=A0aws-c-s3<br>
&gt;=C2=A0 =C2=A0 =C2=A0aws-c-sdkutils<br>
&gt;=C2=A0 =C2=A0 =C2=A0aws-lc<br>
&gt;=C2=A0 =C2=A0 =C2=A0s2n<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0In buildroot we expect cmake packages to use our cm=
ake infrastructure<br>
&gt;=C2=A0 =C2=A0 =C2=A0as it will set up the cross compilation environment=
 correctly while the<br>
&gt;=C2=A0 =C2=A0 =C2=A0awscrt setuptools cmake wrapper does not.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0I confirmed that the cmake packages build correctly=
 when using our<br>
&gt;=C2=A0 =C2=A0 =C2=A0cmake infrastructure:<br>
&gt;=C2=A0 =C2=A0 =C2=A0###################################################=
#############################<br>
&gt;=C2=A0 =C2=A0 =C2=A0#<br>
&gt;=C2=A0 =C2=A0 =C2=A0# python-awscrt<br>
&gt;=C2=A0 =C2=A0 =C2=A0#<br>
&gt;=C2=A0 =C2=A0 =C2=A0###################################################=
#############################<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0PYTHON_AWSCRT_VERSION =3D 0.16.10<br>
&gt;=C2=A0 =C2=A0 =C2=A0PYTHON_AWSCRT_SOURCE =3D awscrt-$(PYTHON_AWSCRT_VER=
SION).tar.gz<br>
&gt;=C2=A0 =C2=A0 =C2=A0PYTHON_AWSCRT_SITE =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://files.pythonhosted.org/packages/=
ae/98/dda092078f2d47bad08e184ab9d364b8f89166497062bc1cf811c0bbbde2" rel=3D"=
noreferrer" target=3D"_blank">https://files.pythonhosted.org/packages/ae/98=
/dda092078f2d47bad08e184ab9d364b8f89166497062bc1cf811c0bbbde2</a> &lt;<a hr=
ef=3D"https://files.pythonhosted.org/packages/ae/98/dda092078f2d47bad08e184=
ab9d364b8f89166497062bc1cf811c0bbbde2" rel=3D"noreferrer" target=3D"_blank"=
>https://files.pythonhosted.org/packages/ae/98/dda092078f2d47bad08e184ab9d3=
64b8f89166497062bc1cf811c0bbbde2</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0PYTHON_AWSCRT_SUBDIR =3D crt<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0$(eval $(cmake-package))<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0See:<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://buildroot.org/downloads/manual/m=
anual.html#_infrastructure_for_cmake_based_packages" rel=3D"noreferrer" tar=
get=3D"_blank">https://buildroot.org/downloads/manual/manual.html#_infrastr=
ucture_for_cmake_based_packages</a> &lt;<a href=3D"https://buildroot.org/do=
wnloads/manual/manual.html#_infrastructure_for_cmake_based_packages" rel=3D=
"noreferrer" target=3D"_blank">https://buildroot.org/downloads/manual/manua=
l.html#_infrastructure_for_cmake_based_packages</a>&gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0So what I think you need to do is create buildroot =
cmake packages for all<br>
&gt;=C2=A0 =C2=A0 =C2=A0these subprojects using buildroot&#39;s cmake infra=
structure:<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/awslabs/aws-c-auth" r=
el=3D"noreferrer" target=3D"_blank">https://github.com/awslabs/aws-c-auth</=
a> &lt;<a href=3D"https://github.com/awslabs/aws-c-auth" rel=3D"noreferrer"=
 target=3D"_blank">https://github.com/awslabs/aws-c-auth</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/awslabs/aws-c-cal" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/awslabs/aws-c-cal</a>=
 &lt;<a href=3D"https://github.com/awslabs/aws-c-cal" rel=3D"noreferrer" ta=
rget=3D"_blank">https://github.com/awslabs/aws-c-cal</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/awslabs/aws-c-common"=
 rel=3D"noreferrer" target=3D"_blank">https://github.com/awslabs/aws-c-comm=
on</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://github.com/awslabs/aws-c-com=
mon" rel=3D"noreferrer" target=3D"_blank">https://github.com/awslabs/aws-c-=
common</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/awslabs/aws-c-compres=
sion" rel=3D"noreferrer" target=3D"_blank">https://github.com/awslabs/aws-c=
-compression</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://github.com/awslabs/aws-c-com=
pression" rel=3D"noreferrer" target=3D"_blank">https://github.com/awslabs/a=
ws-c-compression</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/awslabs/aws-c-event-s=
tream" rel=3D"noreferrer" target=3D"_blank">https://github.com/awslabs/aws-=
c-event-stream</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://github.com/awslabs/aws-c-eve=
nt-stream" rel=3D"noreferrer" target=3D"_blank">https://github.com/awslabs/=
aws-c-event-stream</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/awslabs/aws-checksums=
" rel=3D"noreferrer" target=3D"_blank">https://github.com/awslabs/aws-check=
sums</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://github.com/awslabs/aws-check=
sums" rel=3D"noreferrer" target=3D"_blank">https://github.com/awslabs/aws-c=
hecksums</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/awslabs/aws-c-http" r=
el=3D"noreferrer" target=3D"_blank">https://github.com/awslabs/aws-c-http</=
a> &lt;<a href=3D"https://github.com/awslabs/aws-c-http" rel=3D"noreferrer"=
 target=3D"_blank">https://github.com/awslabs/aws-c-http</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/awslabs/aws-c-io" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/awslabs/aws-c-io</a> &=
lt;<a href=3D"https://github.com/awslabs/aws-c-io" rel=3D"noreferrer" targe=
t=3D"_blank">https://github.com/awslabs/aws-c-io</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/awslabs/aws-c-mqtt" r=
el=3D"noreferrer" target=3D"_blank">https://github.com/awslabs/aws-c-mqtt</=
a> &lt;<a href=3D"https://github.com/awslabs/aws-c-mqtt" rel=3D"noreferrer"=
 target=3D"_blank">https://github.com/awslabs/aws-c-mqtt</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/awslabs/aws-c-s3" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/awslabs/aws-c-s3</a> &=
lt;<a href=3D"https://github.com/awslabs/aws-c-s3" rel=3D"noreferrer" targe=
t=3D"_blank">https://github.com/awslabs/aws-c-s3</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/awslabs/aws-c-sdkutil=
s" rel=3D"noreferrer" target=3D"_blank">https://github.com/awslabs/aws-c-sd=
kutils</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://github.com/awslabs/aws-c-sdk=
utils" rel=3D"noreferrer" target=3D"_blank">https://github.com/awslabs/aws-=
c-sdkutils</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/awslabs/aws-lc" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/awslabs/aws-lc</a> &lt=
;<a href=3D"https://github.com/awslabs/aws-lc" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/awslabs/aws-lc</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/aws/s2n-tls" rel=3D"n=
oreferrer" target=3D"_blank">https://github.com/aws/s2n-tls</a> &lt;<a href=
=3D"https://github.com/aws/s2n-tls" rel=3D"noreferrer" target=3D"_blank">ht=
tps://github.com/aws/s2n-tls</a>&gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0You will then probably need to modify the setup.py =
file<br>
&gt;=C2=A0 =C2=A0 =C2=A0(<a href=3D"https://github.com/awslabs/aws-crt-pyth=
on/blob/v0.16.10/setup.py" rel=3D"noreferrer" target=3D"_blank">https://git=
hub.com/awslabs/aws-crt-python/blob/v0.16.10/setup.py</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://github.com/awslabs/aws-crt-p=
ython/blob/v0.16.10/setup.py" rel=3D"noreferrer" target=3D"_blank">https://=
github.com/awslabs/aws-crt-python/blob/v0.16.10/setup.py</a>&gt;) so that<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0instead of using the cmake build functions have it =
use the system versions<br>
&gt;=C2=A0 =C2=A0 =C2=A0of these libraries pre-installed via the buildroot =
cmake infrastructure.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0You can probably use and check for an env variable =
such as this in the setup.py:<br>
&gt;=C2=A0 =C2=A0 =C2=A0PYTHON_AWSCRT_USE_SYSTEM_CRT=3D1<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0When present have it disable building the cmake lib=
raries itself and search<br>
&gt;=C2=A0 =C2=A0 =C2=A0for the installed system crt libraries instead of u=
sing the vendored<br>
&gt;=C2=A0 =C2=A0 =C2=A0cmake build.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0You should upstream this setup.py functionality to =
the aws-crt-project as well<br>
&gt;=C2=A0 =C2=A0 =C2=A0so that we don&#39;t need to carry a patch in build=
root for python-awscrt to use<br>
&gt;=C2=A0 =C2=A0 =C2=A0the system crt libraries.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Then from the python-awscrt buildroot package you w=
ould set that env<br>
&gt;=C2=A0 =C2=A0 =C2=A0variable and add all the cmake subprojects as build=
root package dependencies.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0First thing you should start with is adding the cma=
ke buildroot packages for<br>
&gt;=C2=A0 =C2=A0 =C2=A0the crt subprojects to buildroot then work on modif=
ying aws-crt-python to<br>
&gt;=C2=A0 =C2=A0 =C2=A0work correctly with them instead of trying to use i=
ts broken cmake setuptools<br>
&gt;=C2=A0 =C2=A0 =C2=A0wrapper.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Thanks in advance<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; On Thu, 9 Feb 2023 at 10:28, Sourabh Hegde &l=
t;<a href=3D"mailto:hrsourabh011@gmail.com" target=3D"_blank">hrsourabh011@=
gmail.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:hrsourabh011@gmail.com=
" target=3D"_blank">hrsourabh011@gmail.com</a>&gt;&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; Hi Maxim,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; I was missing python setuptools on my hos=
t. After installing it, I can<br>
&gt;=C2=A0 =C2=A0 =C2=A0add the package. Also, the added package is availab=
le in menuconfig<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; Thank you for the support!<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; On Thu, 9 Feb 2023 at 10:10, Maxim Kochet=
kov &lt;<a href=3D"mailto:fido_max@inbox.ru" target=3D"_blank">fido_max@inb=
ox.ru</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:fido_max@inbox.ru" tar=
get=3D"_blank">fido_max@inbox.ru</a>&gt;&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; On 09.02.2023 12:03, Sourabh Hegde wr=
ote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; &gt; Hello Maxim,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; &gt; Update:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; &gt; The above issue resolved by itse=
lf!<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; &gt; Now when I do: utils/scanpypi aw=
scrt -o package , it says<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; &gt; spdx_lookup module is not instal=
led. This can lead to an inaccurate<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; &gt; licence detection. Please instal=
l it via<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; &gt; pip install spdx_lookup<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; &gt; buildroot package name for awscr=
t: python-awscrt<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; &gt; Package: python-awscrt<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; &gt; Fetching package awscrt<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; &gt; ERROR: Could not find package aw=
scrt.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; &gt; Check syntax inside the python p=
ackage index:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; &gt; <a href=3D"https://pypi.python.o=
rg/pypi/" rel=3D"noreferrer" target=3D"_blank">https://pypi.python.org/pypi=
/</a> &lt;<a href=3D"https://pypi.python.org/pypi/" rel=3D"noreferrer" targ=
et=3D"_blank">https://pypi.python.org/pypi/</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://pypi.python.org/pypi/" rel=
=3D"noreferrer" target=3D"_blank">https://pypi.python.org/pypi/</a> &lt;<a =
href=3D"https://pypi.python.org/pypi/" rel=3D"noreferrer" target=3D"_blank"=
>https://pypi.python.org/pypi/</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; &gt; But the package is available at =
<a href=3D"https://pypi.org/project/awscrt/" rel=3D"noreferrer" target=3D"_=
blank">https://pypi.org/project/awscrt/</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://pypi.org/project/awscrt/" re=
l=3D"noreferrer" target=3D"_blank">https://pypi.org/project/awscrt/</a>&gt;=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; &gt; &lt;<a href=3D"https://pypi.org/=
project/awscrt/" rel=3D"noreferrer" target=3D"_blank">https://pypi.org/proj=
ect/awscrt/</a> &lt;<a href=3D"https://pypi.org/project/awscrt/" rel=3D"nor=
eferrer" target=3D"_blank">https://pypi.org/project/awscrt/</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; It works fine for me:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; buildroot package name for awscrt: py=
thon-awscrt<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; Package: python-awscrt<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; Fetching package awscrt<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; Downloading package awscrt from<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://files.pythonhosted.org/packages/=
ae/98/dda092078f2d47bad08e184ab9d364b8f89166497062bc1cf811c0bbbde2/awscrt-0=
.16.10.tar.gz" rel=3D"noreferrer" target=3D"_blank">https://files.pythonhos=
ted.org/packages/ae/98/dda092078f2d47bad08e184ab9d364b8f89166497062bc1cf811=
c0bbbde2/awscrt-0.16.10.tar.gz</a>. &lt;<a href=3D"https://files.pythonhost=
ed.org/packages/ae/98/dda092078f2d47bad08e184ab9d364b8f89166497062bc1cf811c=
0bbbde2/awscrt-0.16.10.tar.gz" rel=3D"noreferrer" target=3D"_blank">https:/=
/files.pythonhosted.org/packages/ae/98/dda092078f2d47bad08e184ab9d364b8f891=
66497062bc1cf811c0bbbde2/awscrt-0.16.10.tar.gz</a>.&gt;..<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; Checking if package package/python-aw=
scrt already exists...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; Creating package/python-awscrt/python=
-awscrt.mk...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; More than one file found for license:=
 LICENSE, crt/aws-c-common/LICENSE,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; crt/aws-c-io/LICENSE, crt/aws-lc/LICE=
NSE,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; crt/aws-lc/third_party/fiat/LICENSE, =
crt/aws-c-mqtt/LICENSE,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; crt/aws-checksums/LICENSE, crt/aws-c-=
s3/LICENSE,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; crt/aws-c-compression/LICENSE, crt/aw=
s-c-http/LICENSE,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; crt/aws-c-sdkutils/LICENSE, crt/s2n/L=
ICENSE, crt/aws-c-cal/LICENSE,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; crt/aws-c-auth/LICENSE, crt/aws-c-eve=
nt-stream/LICENSE<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; Creating package/python-awscrt/python=
-awscrt.hash...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; Creating package/python-awscrt/Config=
.in...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; NOTE: Remember to also make an update=
 to the DEVELOPERS file<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 and includ=
e an entry for the pkg in packages/Config.in<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; _____________________________________________=
__<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; buildroot mailing list<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; <a href=3D"mailto:buildroot@buildroot.org" ta=
rget=3D"_blank">buildroot@buildroot.org</a> &lt;mailto:<a href=3D"mailto:bu=
ildroot@buildroot.org" target=3D"_blank">buildroot@buildroot.org</a>&gt;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; <a href=3D"https://lists.buildroot.org/mailma=
n/listinfo/buildroot" rel=3D"noreferrer" target=3D"_blank">https://lists.bu=
ildroot.org/mailman/listinfo/buildroot</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://lists.buildroot.org/mailman/=
listinfo/buildroot" rel=3D"noreferrer" target=3D"_blank">https://lists.buil=
droot.org/mailman/listinfo/buildroot</a>&gt;<br>
&gt; <br>
&gt; <br>
&gt; _______________________________________________<br>
&gt; buildroot mailing list<br>
&gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot=
@buildroot.org</a><br>
&gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=
=3D"noreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listi=
nfo/buildroot</a><br>
</blockquote></div></div>

--00000000000005306905f4af903e--


--===============7566667411149178440==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7566667411149178440==--


