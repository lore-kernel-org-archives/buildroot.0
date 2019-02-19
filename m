From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 19 Feb 2019 11:38:34 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2019-02-17
In-Reply-To: <20190218150524.58b7f1a1@x230>
References: <20190218070048.D838922270@silver.osuosl.org>
 <20190218150524.58b7f1a1@x230>
Message-ID: <20190219113834.073a4630@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 18 Feb 2019 15:05:24 +0100
Gwenhael Goavec-Merou <gwenj@trabucayre.com> wrote:

> fftw is unable to find libquadmath.so but this library is  missing in
> x86_64-ctng_locales-linux-gnu.tar.xz.

Grmfmfm. We currently have:

config BR2_TOOLCHAIN_HAS_LIBQUADMATH
        bool
        default y if BR2_i386 || BR2_x86_64

However, it turns out that libquadmath can be disabled in gcc, and
guess what, the gcc in the toolchain causing the failure has been built
with --disable-libquadmath.

So it seems like we need to turn this into a real Config.in option:

 - BR2_TOOLCHAIN_HAS_LIBQUADMATH remains a hidden option, has no
   default value, and a depends on BR2_i386 || BR2_x86_64

 - The internal toolchain backend selects it because we always enable
   it for internal toolchains (to be checked)

 - All pre-defined external toolchain packages must be updated to
   select it

 - toolchain-external-custom needs to be extended with a
   BR2_TOOLCHAIN_EXTERNAL_LIBQUADMATH option that users can set/unset.
   It should depends on BR2_i386 / BR2_x86_64, default to yes, and
   select BR2_TOOLCHAIN_HAS_LIBQUADMATH.

 - A check needs to be added in toolchain/helpers.mk to verify that the
   value of BR2_TOOLCHAIN_HAS_LIBQUADMATH matches the presence/absence
   of libquadmath in the toolchain.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
