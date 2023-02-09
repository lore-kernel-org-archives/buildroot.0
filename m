Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6041C64EC4
	for <buildroot@archiver.kernel.org>; Thu,  9 Feb 2023 20:12:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 629604011F;
	Thu,  9 Feb 2023 20:12:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 629604011F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zHIhwlShTg4k; Thu,  9 Feb 2023 20:12:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 32034401D2;
	Thu,  9 Feb 2023 20:12:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32034401D2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 20FD81BF57B
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 20:12:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EB7C260E40
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 20:12:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB7C260E40
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RFvDCZl33hcl for <buildroot@lists.busybox.net>;
 Thu,  9 Feb 2023 20:12:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93418608D8
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 93418608D8
 for <buildroot@buildroot.org>; Thu,  9 Feb 2023 20:12:49 +0000 (UTC)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-142b72a728fso4052756fac.9
 for <buildroot@buildroot.org>; Thu, 09 Feb 2023 12:12:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YJJ5g3+TpafkkRG8thf57X9s8szJkfyGxhNVQhosvf0=;
 b=Rs7mu+gqOAkc2J7gU85OOaMZjfHcnUx7Dn0wgMmr1Ufx2sZerl21BBjXdV8h2zmQpt
 NDQsnYMt1CL0p+Ib0QlQOGotCvwY4y1LbekghbpRM0je2PiUkyyaR4Ryzrfc9xQ0IXS0
 YX5jqTYKWTpTG/7e03Hiqdvx8+/qddlTFBvKRi1Dvs5HmlG76w4kINxVefj0yC0pi43e
 Z+8FZsfoC/DEOeriHvOHFY15SCetnPTdnc38JyryBEZ9T1ONDaNkBPvGmLzmnX2JgBGb
 sRuPwKWMAPL7G5Z76zU59ortdGAG3c10bThFRyFfvDt1C50JYMFet/EFTu41CMRZmhLm
 VSwA==
X-Gm-Message-State: AO0yUKVJJYsxGdsFMj/QjX4JnJK4Pa/AQj9g1NT2H7KFYJURyhC08A6O
 sWqiYdWonJyO2lYuOsObge0cyrpUvNd/enkVzH8=
X-Google-Smtp-Source: AK7set/SQ9jTa7sFkX8IjOtoKWImkxSoVukQUfns+nsUsrBsMqo4a1+iJWPmo6u5CBnYCZPMSI2uh6TIHrRtE4ZnvgE=
X-Received: by 2002:a05:6870:468c:b0:163:501b:e7b with SMTP id
 a12-20020a056870468c00b00163501b0e7bmr720756oap.18.1675973568300; Thu, 09 Feb
 2023 12:12:48 -0800 (PST)
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
In-Reply-To: <CADYjeSv1r61gQMoamBq2VUgSYwmyvvZ8BP2NGBZHNzF6vU7phg@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 9 Feb 2023 13:12:37 -0700
Message-ID: <CADvTj4r54pJnngFBGQXx=zATURSmhNAuvtkc7nWA_yvR3kF1Bw@mail.gmail.com>
To: Sourabh Hegde <hrsourabh011@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YJJ5g3+TpafkkRG8thf57X9s8szJkfyGxhNVQhosvf0=;
 b=HYxuQnUu1Vk33Eqa83W8zylR6ZvAOd5B1a4aVhOtbez+28NcAJFdsyvCNIWj7MifUn
 hoXLXY6lcIFBvh7DpJSilcTK5oOSowk2w6kLc/nEwqdrBWKGa5nm2GoPeHEQnvFYjEFN
 EI2GpXy6ft1Nc0rAd3oDd1RRWSabGuDIuzlJcoqf/5jv/bWLUxneX8qmDEXXgstMoxjU
 9gMKL4zl3f4Jxh1pMvQVO8W6XwiyT88EJ2WzwvLQqBwxkgp9iDN0wdDUy404tHiTuW5O
 bvO0tBmasKUaDMeFnw97f0UD1hWGrxIumM+h5ICcdcSY8DuSGriTsjwYzuk4kNtG5qKA
 UfMg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=HYxuQnUu
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, Feb 9, 2023 at 5:10 AM Sourabh Hegde <hrsourabh011@gmail.com> wrote:
>
> Hello Maxim,
>
> While doing make with new Buildroot-packages I getting:
>
> [ 51%] Building ASM object aws-lc/crypto/CMakeFiles/crypto_objects.dir/hrss/asm/poly_rq_mul.S.o
> /home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrss/asm/poly_rq_mul.S: Assembler messages:
> /home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrss/asm/poly_rq_mul.S:304: Error: unknown pseudo-op: `.att_syntax'
> /home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrss/asm/poly_rq_mul.S:307: Error: unknown mnemonic `push' -- `push %rbp'
> /home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrss/asm/poly_rq_mul.S:309: Error: bad register expression
> /home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrss/asm/poly_rq_mul.S:310: Error: unknown mnemonic `movq' -- `movq %rsp,%rbp'
> /home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrss/asm/poly_rq_mul.S:311: Error: bad register expression
> /home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrss/asm/poly_rq_mul.S:312: Error: unknown mnemonic `push' -- `push %r12'
> /home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrss/asm/poly_rq_mul.S:313: Error: bad register expression
> /home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrss/asm/poly_rq_mul.S:321: Error: operand 1 must be an integer register -- `mov %rcx,%r8'
> /home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrss/asm/poly_rq_mul.S:322: Error: unknown mnemonic `addq' -- `addq $6144+12288+512+9408+32,%r8'
> /home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrss/asm/poly_rq_mul.S:323: Error: operand 1 must be an integer register -- `mov %r8,%rax'
> /home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrss/asm/poly_rq_mul.S:324: Error: unknown mnemonic `subq' -- `subq $6144,%r8'
> /home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrss/asm/poly_rq_mul.S:325: Error: operand 1 must be an integer register -- `mov %r8,%r11'
> /home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrss/asm/poly_rq_mul.S:326: Error: unknown mnemonic `subq' -- `subq $12288,%r8'
> /home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrss/asm/poly_rq_mul.S:327: Error: operand 1 must be an integer register -- `mov %r8,%r12'
> /home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrss/asm/poly_rq_mul.S:328: Error: unknown mnemonic `subq' -- `subq $512,%r8'
> /home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrss/asm/poly_rq_mul.S:329: Error: unknown mnemonic `vmovdqa' -- `vmovdqa const3(%rip),%ymm3'
> /home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrss/asm/poly_rq_mul.S:330: Error: unknown mnemonic `vmovdqu' -- `vmovdqu 0(%rsi),%ymm0'
> /home/amazone/output/build/python-awscrt-0.16.10/crt/aws-lc/crypto/hrss/asm/poly_rq_mul.S:331: Error: unknown mnemonic `vmovdqu' -- `vmovdqu 88(%rsi),%ymm1'
> .
> .
> .
> Any idea what it is complaining about?

The problem here is that while the python awscrt package uses setuptools
it's not a normal python setuptools package, the setup.py installs both a normal
setuptools package and a vendored cmake package(meta package really).

See cmake build wrapper functionality here in the setuptools setup.py file:
https://github.com/awslabs/aws-crt-python/blob/v0.16.10/setup.py#L156-L272

This is the cmake meta project root which is vendored inside of awscrt:
https://github.com/awslabs/aws-crt-python/tree/v0.16.10/crt

See meta cmakelists build:
https://github.com/awslabs/aws-crt-python/blob/v0.16.10/crt/CMakeLists.txt

This meta project is made up of multiple subprojects:
aws-c-auth
aws-c-cal
aws-c-common
aws-c-compression
aws-c-event-stream
aws-checksums
aws-c-http
aws-c-io
aws-c-mqtt
aws-c-s3
aws-c-sdkutils
aws-lc
s2n

In buildroot we expect cmake packages to use our cmake infrastructure
as it will set up the cross compilation environment correctly while the
awscrt setuptools cmake wrapper does not.

I confirmed that the cmake packages build correctly when using our
cmake infrastructure:
################################################################################
#
# python-awscrt
#
################################################################################

PYTHON_AWSCRT_VERSION = 0.16.10
PYTHON_AWSCRT_SOURCE = awscrt-$(PYTHON_AWSCRT_VERSION).tar.gz
PYTHON_AWSCRT_SITE =
https://files.pythonhosted.org/packages/ae/98/dda092078f2d47bad08e184ab9d364b8f89166497062bc1cf811c0bbbde2
PYTHON_AWSCRT_SUBDIR = crt

$(eval $(cmake-package))

See:
https://buildroot.org/downloads/manual/manual.html#_infrastructure_for_cmake_based_packages

So what I think you need to do is create buildroot cmake packages for all
these subprojects using buildroot's cmake infrastructure:
https://github.com/awslabs/aws-c-auth
https://github.com/awslabs/aws-c-cal
https://github.com/awslabs/aws-c-common
https://github.com/awslabs/aws-c-compression
https://github.com/awslabs/aws-c-event-stream
https://github.com/awslabs/aws-checksums
https://github.com/awslabs/aws-c-http
https://github.com/awslabs/aws-c-io
https://github.com/awslabs/aws-c-mqtt
https://github.com/awslabs/aws-c-s3
https://github.com/awslabs/aws-c-sdkutils
https://github.com/awslabs/aws-lc
https://github.com/aws/s2n-tls

You will then probably need to modify the setup.py file
(https://github.com/awslabs/aws-crt-python/blob/v0.16.10/setup.py) so that
instead of using the cmake build functions have it use the system versions
of these libraries pre-installed via the buildroot cmake infrastructure.

You can probably use and check for an env variable such as this in the setup.py:
PYTHON_AWSCRT_USE_SYSTEM_CRT=1

When present have it disable building the cmake libraries itself and search
for the installed system crt libraries instead of using the vendored
cmake build.

You should upstream this setup.py functionality to the aws-crt-project as well
so that we don't need to carry a patch in buildroot for python-awscrt to use
the system crt libraries.

Then from the python-awscrt buildroot package you would set that env
variable and add all the cmake subprojects as buildroot package dependencies.

First thing you should start with is adding the cmake buildroot packages for
the crt subprojects to buildroot then work on modifying aws-crt-python to
work correctly with them instead of trying to use its broken cmake setuptools
wrapper.

>
> Thanks in advance
>
> On Thu, 9 Feb 2023 at 10:28, Sourabh Hegde <hrsourabh011@gmail.com> wrote:
>>
>> Hi Maxim,
>>
>> I was missing python setuptools on my host. After installing it, I can add the package. Also, the added package is available in menuconfig
>>
>> Thank you for the support!
>>
>> On Thu, 9 Feb 2023 at 10:10, Maxim Kochetkov <fido_max@inbox.ru> wrote:
>>>
>>>
>>>
>>> On 09.02.2023 12:03, Sourabh Hegde wrote:
>>> > Hello Maxim,
>>> >
>>> > Update:
>>> >
>>> > The above issue resolved by itself!
>>> >
>>> > Now when I do: utils/scanpypi awscrt -o package , it says
>>> >
>>> > spdx_lookup module is not installed. This can lead to an inaccurate
>>> > licence detection. Please install it via
>>> > pip install spdx_lookup
>>> > buildroot package name for awscrt: python-awscrt
>>> > Package: python-awscrt
>>> > Fetching package awscrt
>>> > ERROR: Could not find package awscrt.
>>> > Check syntax inside the python package index:
>>> > https://pypi.python.org/pypi/ <https://pypi.python.org/pypi/>
>>> >
>>> > But the package is available at https://pypi.org/project/awscrt/
>>> > <https://pypi.org/project/awscrt/>
>>>
>>> It works fine for me:
>>>
>>> buildroot package name for awscrt: python-awscrt
>>> Package: python-awscrt
>>> Fetching package awscrt
>>> Downloading package awscrt from
>>> https://files.pythonhosted.org/packages/ae/98/dda092078f2d47bad08e184ab9d364b8f89166497062bc1cf811c0bbbde2/awscrt-0.16.10.tar.gz...
>>> Checking if package package/python-awscrt already exists...
>>> Creating package/python-awscrt/python-awscrt.mk...
>>> More than one file found for license: LICENSE, crt/aws-c-common/LICENSE,
>>> crt/aws-c-io/LICENSE, crt/aws-lc/LICENSE,
>>> crt/aws-lc/third_party/fiat/LICENSE, crt/aws-c-mqtt/LICENSE,
>>> crt/aws-checksums/LICENSE, crt/aws-c-s3/LICENSE,
>>> crt/aws-c-compression/LICENSE, crt/aws-c-http/LICENSE,
>>> crt/aws-c-sdkutils/LICENSE, crt/s2n/LICENSE, crt/aws-c-cal/LICENSE,
>>> crt/aws-c-auth/LICENSE, crt/aws-c-event-stream/LICENSE
>>> Creating package/python-awscrt/python-awscrt.hash...
>>> Creating package/python-awscrt/Config.in...
>>> NOTE: Remember to also make an update to the DEVELOPERS file
>>>        and include an entry for the pkg in packages/Config.in
>>>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
