From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 21 Mar 2017 22:57:07 +0100
Subject: [Buildroot] [PATCH] ltp-testsuite: disable Open POSIX testsuite
In-Reply-To: <1490131280-1379-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1490131280-1379-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20170321215707.GE3735@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-03-21 22:21 +0100, Thomas Petazzoni spake thusly:
> The Open POSIX testsuite builds and installs to the target directory a
> program called 't0' that isn't cross-compiled, which is bad.
> 
> Since the LTP build system is autoconf but not automake based, and the
> Open POSIX testsuite is a sort of sub-project inside it, fixing the
> issue is not trivial.
> 
> Therefore, we simply disable the Open POSIX testsuite entirely. Oddly
> enough, --without-open-posix-testsuite doesn't work due to another bug,
> so we simply have to remove --with-open-posix-testsuite.
> 
> Open POSIX testsuite cross-compilation issue reported at
> https://github.com/linux-test-project/ltp/issues/144.
> 
> Configure script bug reported at
> https://github.com/linux-test-project/ltp/issues/143.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/8326ba9eb257dfc92c1ad282ba6d3565e8250def/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/ltp-testsuite/ltp-testsuite.mk | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
> index 9d82087..29f374b 100644
> --- a/package/ltp-testsuite/ltp-testsuite.mk
> +++ b/package/ltp-testsuite/ltp-testsuite.mk
> @@ -9,8 +9,16 @@ LTP_TESTSUITE_SOURCE = ltp-full-$(LTP_TESTSUITE_VERSION).tar.xz
>  LTP_TESTSUITE_SITE = https://github.com/linux-test-project/ltp/releases/download/$(LTP_TESTSUITE_VERSION)
>  LTP_TESTSUITE_LICENSE = GPLv2, GPLv2+
>  LTP_TESTSUITE_LICENSE_FILES = COPYING
> +
> +# Do not enable Open POSIX testsuite as it doesn't cross-compile
> +# properly: t0 program is built for the host machine. Notice that due
> +# to a bug, --without-open-posix-testsuite actually enables the test
> +# suite.
> +# See https://github.com/linux-test-project/ltp/issues/143 (invalid
> +# autoconf test) and
> +# https://github.com/linux-test-project/ltp/issues/144 (Open POSIX
> +# testsuite not cross-compiling).
>  LTP_TESTSUITE_CONF_OPTS += \
> -	--with-open-posix-testsuite \
>  	--with-realtime-testsuite
>  
>  ifeq ($(BR2_LINUX_KERNEL),y)
> -- 
> 2.7.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
