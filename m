From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 30 Dec 2019 21:52:18 +0100
Subject: [Buildroot] [PATCH 1/1] package/ltp-testsuite: Replace libtirpc
 patch with simple removing files
In-Reply-To: <20191230202750.12541-1-petr.vorel@gmail.com>
References: <20191230202750.12541-1-petr.vorel@gmail.com>
Message-ID: <20191230205218.GV26395@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Petr, All,

On 2019-12-30 21:27 +0100, Petr Vorel spake thusly:
> We delete files anyway, so let's use this way instead of applying patch.

No, we prefer patches over hooks, and we've in the past replaced hooks
that tweak/remove files with patches with the same effect.

Besides, I'm pretty sure your patch is wrong, see below...

> Since libtirpc update to 1.2.5 commit message in patch was wrong anyway
> (libtirpc patch 0005-Disable-DES-authentification-support.patch was
> replaced by upstream solution).

Then it is better to fix the description of the patch.

[--SNIP--]
> diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
> index ce02cc4e98..0d81afc2a4 100644
> --- a/package/ltp-testsuite/ltp-testsuite.mk
> +++ b/package/ltp-testsuite/ltp-testsuite.mk
> @@ -62,13 +62,18 @@ LTP_TESTSUITE_CONF_ENV += \
>  	LIBS="$(LTP_TESTSUITE_LIBS)" \
>  	SYSROOT="$(STAGING_DIR)"
>  
> +# libtirpc 1.2.5 has by default authdes disabled
> +LTP_TESTSUITE_UNSUPPORTED_TEST_CASES = \
> +	testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_auth_authdes_create/ \
> +	testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_auth_authdes_seccreate/
> +
>  # uclibc: bessel support normally not enabled
>  ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
> -LTP_TESTSUITE_UNSUPPORTED_TEST_CASES = \
> +LTP_TESTSUITE_UNSUPPORTED_TEST_CASES += \
>  	testcases/misc/math/float/bessel/ \
> -	testcases/misc/math/float/float_bessel.c
> +	testcases/misc/math/float/float_bessel.c \

I doubt this trailiing '\' is correct, or it would add the next line to
the definition, and thus the line:

>  else ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)

would not be treated as Makefile code, but as part of the variable
LTP_TESTSUITE_UNSUPPORTED_TEST_CASES.

Sorry, I've marked your patch as rejected.

Regards,
Yann E. MORIN.

> -LTP_TESTSUITE_UNSUPPORTED_TEST_CASES = \
> +LTP_TESTSUITE_UNSUPPORTED_TEST_CASES += \
>  	testcases/kernel/pty/pty01.c \
>  	testcases/kernel/pty/pty02.c \
>  	testcases/kernel/pty/ptem01.c \
> @@ -97,7 +102,6 @@ LTP_TESTSUITE_UNSUPPORTED_TEST_CASES = \
>  	testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_regunreg_svc_unregister/ \
>  	testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_regunreg_xprt_register/ \
>  	testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_regunreg_xprt_unregister/ \
> -	testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_auth_authdes_seccreate/ \
>  	utils/benchmark/ebizzy-0.3
>  endif
>  
> -- 
> 2.24.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
