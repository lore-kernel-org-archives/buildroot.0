From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Feb 2014 18:19:25 +0100
Subject: [Buildroot] [PATCH v2 1/2] rt-tests: disable for uclibc mips
In-Reply-To: <1393110449-12710-1-git-send-email-rjbarnet@rockwellcollins.com>
References: <1393110449-12710-1-git-send-email-rjbarnet@rockwellcollins.com>
Message-ID: <20140223171925.GD32759@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ryan, Peter, All,

On 2014-02-23 00:07 +0100, Ryan Barnett spake thusly:
> rt-tests is not supported by a uclibc toolchain that does not implement
> _pid in struct sigevent. Currently this is all MIPS architectures
> in uclibc.
> 
> Fixes:
>   http://autobuild.buildroot.net/results/074/074265602bec4aba6c82d1aee389045e8ad33d4b
> 
> Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
> ---
>  package/rt-tests/Config.in | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/rt-tests/Config.in b/package/rt-tests/Config.in
> index 58a88a8..a8cede0 100644
> --- a/package/rt-tests/Config.in
> +++ b/package/rt-tests/Config.in
> @@ -5,6 +5,9 @@ config BR2_PACKAGE_RT_TESTS
>  	depends on !BR2_PTHREADS && !BR2_PTHREADS_OLD
>  	# no NPTL for these archs
>  	depends on !BR2_avr32 && !BR2_xtensa && !BR2_arc
> +	# no _tid field in 'struct sigevent'
> +	depends on !BR2_TOOLCHAIN_USES_UCLIBC if (BR2_mips || BR2_mipsel || \
> +		BR2_mips64 || BR2_mips64el)

Gah! This is not correct Kconfig syntax and breaks:

    $ make menuconfig
    [...]
    package/rt-tests/Config.in:10: syntax error
    package/rt-tests/Config.in:9: invalid option
    package/rt-tests/Config.in:36: syntax error
    package/rt-tests/Config.in:35: invalid option
    make[1]: *** [oldconfig] Error 1

Peter, can we revert this change until we have a proper fix, please?

Ryan, what were you trying to do here? Why can you use something like
(variable abbreviated for clarity):

    depends on ! ( UCLIBC && ( mips || mipsel || mips64 || mips64el ) )

>  	help
>  	  Set of utilities for testing the real-time behaviour of a
>  	  Linux system.
> @@ -27,3 +30,7 @@ comment "rt-tests needs a toolchain w/ threads"
>  	depends on !BR2_PTHREADS && !BR2_PTHREADS_OLD
>  	depends on !BR2_avr32 && !BR2_xtensa && !BR2_arc
>  	depends on !BR2_TOOLCHAIN_HAS_THREADS
> +
> +comment "rt-tests needs an (e)glibc toolchain"
> +	depends on BR2_TOOLCHAIN_USES_UCLIBC if (BR2_mips || BR2_mipsel || \
> +		BR2_mips64 || BR2_mips64el)

Ditto.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
