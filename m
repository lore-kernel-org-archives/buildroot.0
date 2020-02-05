From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 5 Feb 2020 11:30:59 +0100
Subject: [Buildroot] [PATCH 2/2] toolchain: Get ld.so name if available
In-Reply-To: <1577937441-18703-2-git-send-email-han_mao@c-sky.com>
References: <1577937441-18703-1-git-send-email-han_mao@c-sky.com>
 <1577937441-18703-2-git-send-email-han_mao@c-sky.com>
Message-ID: <CAAXf6LUV+WOJc+x_yZtDQbEXq6yH4uD67mvMHZoRQGnj4nrsjg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Mao Han,

El jue., 2 ene. 2020 a las 5:15, Mao Han (<han_mao@c-sky.com>) escribi?:
>
> RISC-V multilib toolchain(github.com/riscv/riscv-gnu-toolchain.git) put
> multi ld.so with different ABI under sysroot/lib:
> sysroot/lib/ld-linux-riscv32-ilp32d.so.1
> sysroot/lib/ld-linux-riscv32-ilp32.so.1
> sysroot/lib/ld-linux-riscv64-lp64d.so.1
> sysroot/lib/ld-linux-riscv64-lp64.so.1
> Current buildroot script can't handle multi ld.so and report:
> >>> toolchain-external-custom  Copying external toolchain sysroot to staging...
> /bin/bash: line 0: [: too many arguments
> This patch try to get the exact name for ld.so and avoid multi ld.so check in
> the script.
>
> Signed-off-by: Qu Xianmiao <xianmiao_qu@c-sky.com>
> Signed-off-by: Chen Hongdeng <hongdeng_chen@c-sky.com>
> Signed-off-by: Guo Ren<ren_guo@c-sky.com>
> Signed-off-by: Mao Han <han_mao@c-sky.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Mark Corbin <mark.corbin@embecosm.com>
> ---
>  toolchain/helpers.mk                                   | 10 ++++++++--
>  toolchain/toolchain-external/pkg-toolchain-external.mk |  3 ++-
>  2 files changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
> index 03355f5..cc581fc 100644
> --- a/toolchain/helpers.mk
> +++ b/toolchain/helpers.mk
> @@ -104,6 +104,7 @@ copy_toolchain_sysroot = \
>         ARCH_SUBDIR="$(strip $3)"; \
>         ARCH_LIB_DIR="$(strip $4)" ; \
>         SUPPORT_LIB_DIR="$(strip $5)" ; \
> +       SPECIFIC_LD_NAME="$(strip $6)" ; \
>         for i in etc $${ARCH_LIB_DIR} sbin usr usr/$${ARCH_LIB_DIR}; do \
>                 if [ ! -d $${ARCH_SYSROOT_DIR}/$$i ] ; then \
>                         continue ; \
> @@ -136,8 +137,13 @@ copy_toolchain_sysroot = \
>                 done ; \
>         fi ; \
>         if [ ! -e $(STAGING_DIR)/lib/ld*.so.* ]; then \
> -               if [ -e $${ARCH_SYSROOT_DIR}/lib/ld*.so.* ]; then \
> -                       cp -a $${ARCH_SYSROOT_DIR}/lib/ld*.so.* $(STAGING_DIR)/lib/ ; \
> +               if [ "$${SPECIFIC_LD_NAME}" != "" ]; then \
> +                       LD_NAME=$${SPECIFIC_LD_NAME}; \
> +               else \
> +                       LD_NAME="ld*.so.*"; \
> +               fi; \

In addition to the comments posted previously by Yann E. Morin, I
wonder if there can actually be a case where SPECIFIC_LD_NAME is
empty. What I mean is: do we still need the wildcard-based approach if
we are using a more correct approach of actually checking the
interpreter via readelf?
Removing the wildcards would make the code a bit more clear. In this
case, the name 'SPECIFIC_LD_NAME' could perhaps be renamed to just
'LD_SO_FILENAME' or something.

Best regards,
Thomas
