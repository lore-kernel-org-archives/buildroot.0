From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 27 May 2017 15:24:56 +0200
Subject: [Buildroot] [PATCH 1/1] keepalived: Allow the package to be
 selected only if linux-headers >= 3.4
In-Reply-To: <1495889267-7358-1-git-send-email-apalos@gmail.com>
References: <1495889267-7358-1-git-send-email-apalos@gmail.com>
Message-ID: <20170527132456.GB7728@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ilias, All,

On 2017-05-27 15:47 +0300, Ilias Apalodimas spake thusly:
> Hello everyone,

This greeting should not be part of a commit log.

> This patch fixes build issues of keepalived reported here:
> http://autobuild.buildroot.net/results/770d8fd2f3bacbdbe233da1b4d6e64e20a84d5a5
> http://autobuild.buildroot.net/results/1adb710b915427f681eae37452a0942833ce533e
> http://autobuild.buildroot.net/results/70b31547e51ec7213372d2ef07bec34c5df77560

Usually, the commit log should be:

    topic: one-line title quickly describing the change  (72 chars)

    One or more paragraph explaining the problem, on
    multiple lines if needed, to descibe the symptoms.

    An explanation on how we solve the issue, as detailed
    as needed.

    Fixes:
        list of autobuilders references,
        or reference to a bug number.

    Signed-off-by: You
    Cc: Interested parties someone-interested at somewhere.net

    ---
    Whatever is after the --- line is ignored by git.

> These builds are all using an external toolchain and linux-3.2 headers.
> Keepalived includes linux_ip_set.h when ipset package is enabled,
> which conflicts with linux xt_set.h header(prior to 3.4).

After I had a quick look at the code, there appears to be explicit test
for pre-3.4 headers, but that check fails to work...

> As Yann Morin suggested we are making keepalived depending on the kernel-headers
> version.

What about this commit log:

    keepalived: needs headers >= 3.4

    keepalived fails to build on toolchains with headers older than 3.4,
    because of a namespace clash between the xt_set.h header from the
    kernel and the linux_ip_set.h header installed by ipset.

    Even though keepalived does check for pre-3.4 headers, the check
    somehow fails to work correctly.

    We fix that by making keepalived depend on headers 3.4 or later.

    Fixes:
        http://autobuild.buildroot.org/results/770/770d8fd2f3bacbdbe233da1b4d6e64e20a84d5a5/
        http://autobuild.buildroot.org/results/1ad/1adb710b915427f681eae37452a0942833ce533e/
        http://autobuild.buildroot.org/results/70b/70b31547e51ec7213372d2ef07bec34c5df77560/
        [...]

    Signed-off-by: Ilias Apalodimas <apalos@gmail.com>
    Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>

    ---
    Dependency added as suggested by Yann.

Another little nit below...

> Regards
> Ilias
> 
> Signed-off-by: Ilias Apalodimas <apalos@gmail.com>
> ---
>  package/keepalived/Config.in | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/keepalived/Config.in b/package/keepalived/Config.in
> index efa745a..790cc03 100644
> --- a/package/keepalived/Config.in
> +++ b/package/keepalived/Config.in
> @@ -2,6 +2,7 @@ config BR2_PACKAGE_KEEPALIVED
>  	bool "keepalived"
>  	depends on BR2_USE_MMU
>  	depends on !BR2_STATIC_LIBS # uses libdl
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
>  	select BR2_PACKAGE_OPENSSL
>  	select BR2_PACKAGE_POPT
>  	help
> @@ -15,6 +16,6 @@ config BR2_PACKAGE_KEEPALIVED
>  
>  	  http://www.keepalived.org/
>  
> -comment "keepalived needs a toolchain w/ dynamic library"
> +comment "keepalived needs a toolchain w/ dynamic library w/ headers >= 3.4"

The different parts are to be separated by commas:

    ... toolchain w/ dynamic library, headers >= 3.4

Otherwise:

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

>  	depends on BR2_USE_MMU
> -	depends on BR2_STATIC_LIBS
> +	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
> -- 
> 1.9.1
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
