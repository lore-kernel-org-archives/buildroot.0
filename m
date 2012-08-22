From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Wed, 22 Aug 2012 10:20:34 +0200
Subject: [Buildroot] [PATCH 04/20] toolchain-external: improve glibc
 support to test availability of RPC
In-Reply-To: <80f89c34315be739c52935f1b0606dc5531e6eb3.1344706801.git.thomas.petazzoni@free-electrons.com>
References: <cover.1344706801.git.thomas.petazzoni@free-electrons.com>
 <80f89c34315be739c52935f1b0606dc5531e6eb3.1344706801.git.thomas.petazzoni@free-electrons.com>
Message-ID: <CAHkwnC_xe8CChBeuoW85EnQLZ_A1PiOQE3Woxqr1NS_GZGFByg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have a build problem with this patch, even when i select a
toolchaing with the native rpc the test fail:

make:
Checking external toolchain settings
RPC support available in C library, please enable BR2_TOOLCHAIN_HAS_NATIVE_RPC
make: *** [/home/fabiopo/at91sam9260ek/buildroot-rpc-support/output/stamps/ext-toolchain-checked]
Error 1


defconfig:
BR2_arm=y
BR2_arm926t=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201103=y


On Sat, Aug 11, 2012 at 7:40 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> ...
> diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
> index 462cd87..7036552 100644
> --- a/toolchain/helpers.mk
> +++ b/toolchain/helpers.mk
> ...
> +check_glibc_rpc_feature = \
> +       IS_IN_LIBC=`test -f $(1)/usr/include/rpc/rpc.h && echo y` ; \
> +       if [ x$(BR2_TOOLCHAIN_EXTERNAL_INET_RPC) != x"y" -a x$${IS_IN_LIBC} = x"y" ] ; then \
Testing the BR2_TOOLCHAIN_HAS_NATIVE_RPC fix the test failure problem.

I don't know if it's the best way to fix this issue.

> +               echo "RPC support available in C library, please enable BR2_TOOLCHAIN_HAS_NATIVE_RPC" ; \
> +               exit 1 ; \
> +       fi ; \
> +       if [ x$(BR2_TOOLCHAIN_EXTERNAL_INET_RPC) = x"y" -a x$${IS_IN_LIBC} != x"y" ] ; then \

Same as above

> +               echo "RPC support not available in C library, please disable BR2_TOOLCHAIN_HAS_NATIVE_RPC" ; \
> +               exit 1 ; \
> +       fi
> +
> +#


Best regards
-- 
Fabio Porcedda
