From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 Jul 2017 17:32:43 +0200
Subject: [Buildroot] [PATCH v6 2/4] infra: add support for MIPS32 FP mode
In-Reply-To: <20170628151713.10746-2-Vincent.Riera@imgtec.com>
References: <20170628151713.10746-1-Vincent.Riera@imgtec.com>
 <20170628151713.10746-2-Vincent.Riera@imgtec.com>
Message-ID: <20170716173243.4262f35f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 28 Jun 2017 16:17:11 +0100, Vicente Olivert Riera wrote:
> MIPS32 support different FP modes (32,xx,64), so give the user the
> opportunity to choose between them. That will cause host-gcc to be built
> using the --with-fp-32=[32|xx|64] configure option. Also the
> -mfp[32|xx|64] gcc option will be added to TARGET_CFLAGS and to the
> toolchain wrapper.
> 
> FP mode option shouldn't be used for soft-float, so we add logic in the
> toolchain wrapper if -msoft-float is among the arguments in order to not
> append the -fp[[32|xx|64] option, otherwise the compilation may fail.
> 
> Information about FP modes here:
> 
> - https://sourceware.org/binutils/docs/as/MIPS-Options.html
> - https://dmz-portal.imgtec.com/wiki/MIPS_O32_ABI_-_FR0_and_FR1_Interlinking#5._Generating_modeless_code
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
> Changes v3 -> v6:
>  - Nothing.
> Changes v2 -> v3:
>  - Change toolchain-wrapper.c to not add FP32 mode option when
>    -msoft-float is used.
> Changes v1 -> v2:
>  - Nothing. Patch introduced in v2.
> ---
>  arch/Config.in                                     |  3 +++
>  arch/Config.in.mips                                | 25 ++++++++++++++++++++++
>  package/gcc/gcc.mk                                 |  7 ++++++
>  .../toolchain-external/pkg-toolchain-external.mk   |  5 +++++
>  toolchain/toolchain-wrapper.c                      | 10 +++++++++
>  5 files changed, 50 insertions(+)

I've applied your patch. Here as well, a follow-up patch to improve the
Config.in help text would be good.

Also, the gcc documentation says:

--without-odd-spreg-32

    On MIPS targets, set the -mno-odd-spreg option by default when
    using the o32 ABI. This is normally used in conjunction with
    --with-fp-32=64 in order to target the o32 FP64A ABI extension.

Should we use this additional option when FP32 mode is 64 ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
