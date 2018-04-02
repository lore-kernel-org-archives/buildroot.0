From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 2 Apr 2018 15:07:16 +0200
Subject: [Buildroot] [PATCH] linux-tool-perf: permit TUI build
In-Reply-To: <20180402125145.13431-1-john@metanate.com>
References: <20180402125145.13431-1-john@metanate.com>
Message-ID: <20180402130716.GM3625@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

John, All,

On 2018-04-02 13:51 +0100, John Keeping spake thusly:
> Since Linux 3.10, perf's NO_NEWT configuration option simply sets
> NO_SLANG=1 and there is no dependency on libnewt.
> 
> We already handle NO_SLANG correctly based on whether or not
> BR2_PACKAGE_SLANG is selected, so all we accomplish by setting NO_NEWT=1
> is disabling perf's TUI when all of the dependencies are available.
> 
> Linux 3.10 is almost 5 years old now, so there doesn't seem to be any
> point in jumping through additional hoops to make perf from older kernel
> versions build when the newt package is not available.

But we still support kernels back to 3.0...

I would instead suggest you add an option in
package/linux-tools/Config.in:

    config BR2_PACKAGE_LINUX_TOOLS_PERF_TUI

And do a check in package/linux-tools/linux-tool-perf.mk.in whether it
is valid o not, if needed.

Regards,
Yann E. MORIN.

> Signed-off-by: John Keeping <john@metanate.com>
> ---
>  package/linux-tools/linux-tool-perf.mk.in | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/package/linux-tools/linux-tool-perf.mk.in b/package/linux-tools/linux-tool-perf.mk.in
> index 69492ba8da..bb9d1655e6 100644
> --- a/package/linux-tools/linux-tool-perf.mk.in
> +++ b/package/linux-tools/linux-tool-perf.mk.in
> @@ -22,7 +22,6 @@ PERF_MAKE_FLAGS = \
>  	prefix=/usr \
>  	WERROR=0 \
>  	NO_LIBAUDIT=1 \
> -	NO_NEWT=1 \
>  	NO_GTK2=1 \
>  	NO_LIBPERL=1 \
>  	NO_LIBPYTHON=1 \
> -- 
> 2.16.3
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
