From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 May 2017 11:21:49 +0200
Subject: [Buildroot] [PATCHv5] mpir: fix build failure
In-Reply-To: <1492774031-25802-1-git-send-email-semenak94@mail.ru>
References: <mpir: fix build failure>
 <1492774031-25802-1-git-send-email-semenak94@mail.ru>
Message-ID: <20170501112149.46c43ad1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 21 Apr 2017 14:27:11 +0300, Semyon Kolganov wrote:
> Signed-off-by: Semyon Kolganov <semenak94@mail.ru>

When you're fixing build failures from the autobuilders, the commit log
should provide references to the autobuilder failures being fixed.

> +ifeq ($(BR2_MIPS_NABI64),y)
> +MPIR_CONF_OPTS += ABI=n64
> +endif

You did not even test this, because it fails to build:

configure: error: ABI=n64 is not among the following valid choices: 64 n32 o32

So I've fixed that to ABI=64

> +ifeq ($(BR2_powerpc_CLASSIC),y)
> +MPIR_CONF_OPTS += ABI=mode64
> +MPIR_CONF_ENV += MPN_PATH=generic
> +endif

This looks bogus. mode64 seems to refer to a 64-bit ABI, while
BR2_powerpc_CLASSIC is not necessarily 64 bit.

So, I've applied after changing ABI=n64 to ABI=64, dropping the PowerPC
stuff and adding a reference to the autobuilder failure being fixes.

That being said, there are still several other mpir related build
failures that have not been fixed:

 * On ARM, we fail with the old Crosstool-NG toolchains, but apparently
   not with other ARM toolchains. Both the ARMv5 and ARMv7 Crosstool-NG
   toolchains are failing to build MPIR:

   http://autobuild.buildroot.net/results/fd0/fd032f7dbd4cace84bb31e8017cb6139ef3c1072/build-end.log
   http://autobuild.buildroot.net/results/c36/c360581c2925529f18635aac32c2865899f5e0f5/build-end.log

 * On MIPS64r6

   http://autobuild.buildroot.net/results/c45/c45dd59f10693b0d9a86dac4733c6c3dde4554f1/build-end.log

 * On PowerPC64

   http://autobuild.buildroot.net/results/be1/be1478836b2e7b580174641f48de92c9b02512a7/build-end.log

Could you have a look and fix those remaining issues?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
