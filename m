From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 13 Aug 2020 23:21:12 +0200
Subject: [Buildroot] [PATCH v2 1/5]
 support/scripts/gen-bootlin-toolchains: add new script to support Bootlin
 toolchains
In-Reply-To: <20200809193818.1139805-2-thomas.petazzoni@bootlin.com>
References: <20200809193818.1139805-1-thomas.petazzoni@bootlin.com>
 <20200809193818.1139805-2-thomas.petazzoni@bootlin.com>
Message-ID: <20200813212112.GK13263@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2020-08-09 21:38 +0200, Thomas Petazzoni spake thusly:
> https://toolchains.bootlin.com/ has been providing for a few years a
> number of ready-to-use pre-built toolchains, for a wide range of
> architectures (which it turns out, are all built using Buildroot).
> 
> While toolchains.bootlin.com provides Buildroot config fragments to
> easily use those toolchains with Buildroot (see [0] for example), this
> is not visible anywhere. So instead, we would like to add support for
> these toolchains in Buildroot just like we have existing support for
> Linaro, ARM, Synopsys, etc. toolchains.
> 
> [0] https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/fragments/aarch64--glibc--bleeding-edge-2020.02-2.frag
> 
> However, the number of toolchains provided by toolchains.bootlin.com
> is really large, and they are regularly updated. Maintaining that
> manually would be time consuming and error-prone. So instead, this
> commit introduces a script that automatically generates:
> 
>  - toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
>  - toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.mk
>  - toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.hash
>  - support/testing/tests/toolchain/test_external_bootlin.py
> 
> We create a single external toolchain package, with a Kconfig "choice"
> as a sub-option to select the toolchain variant to be used. The script
> contains a Python dict that provides the mapping between the
> toolchains provided by toolchains.bootlin.com, and the architecture
> options/variants they are applicable to.

I think it would be much better if that metadata were to be available on
and served by toolchains.bootlin.com, possibly as a json blob (which
maps very well to, and looks very much like, the python dict). Maybe one
small json blurb for each toolchain.

That way, when you add or remove toolchains, you are also responsible
for updating that metadata on your side, and then the script is more
generic.

Otherwise, that script will get out of sync when / if you change the
configuration of a toolchain (e.g. if the x86-i686 toolchain bumps to at
least i486 instead of i386).

I haven't seriously reviewed the rest of the script, though, as Titouan
did.

Regards,
Yann E. MORIN.

> The test cases allow to verify that the toolchain configuration is
> correct, and that it is able to build a Busybox based system. It
> doesn't do any runtime testing as such testing is already done by
> toolchains.bootlin.com: the test cases here are only meant to verify
> that the toolchain-external-bootlin package works as expected.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
