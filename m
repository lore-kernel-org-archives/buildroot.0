From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 31 May 2014 00:18:40 +0200
Subject: [Buildroot] [PATCH v2] Improve tar check if bsdtar is installed
In-Reply-To: <1401487838-4010-1-git-send-email-abrahamh@web.de>
References: <1401464676-2315-1-git-send-email-abrahamh@web.de>
 <1401487838-4010-1-git-send-email-abrahamh@web.de>
Message-ID: <20140530221840.GI3474@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Heiko, All,

On 2014-05-31 00:10 +0200, Heiko Abraham spake thusly:
> If bsdtar is installed, fix script error for tar version detection.
> 
> bsdtar not provide all expected command line (long) options

bsdtar _does_ not provide [...]

> like "--hard-dereference". To ensure compatibly mark version
> of tar as 'invalid' and trigger rebuild of 'host-tar'.
> 
> Signed-off-by: Heiko Abraham <abrahamh@web.de>

Except for the minor nit in the commit log, which can be fixed by
Peter when he commits:

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  support/dependencies/check-host-tar.sh | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/support/dependencies/check-host-tar.sh b/support/dependencies/check-host-tar.sh
> index 2cfc2b3..932d3c4 100755
> --- a/support/dependencies/check-host-tar.sh
> +++ b/support/dependencies/check-host-tar.sh
> @@ -14,10 +14,17 @@ fi
>  # Output of 'tar --version' examples:
>  # tar (GNU tar) 1.15.1
>  # tar (GNU tar) 1.25
> +# bsdtar 2.8.3 - libarchive 2.8.3
>  version=`$tar --version | head -n 1 | sed 's/^.*\s\([0-9]\+\.\S\+\).*$/\1/'`
>  major=`echo "$version" | cut -d. -f1`
>  minor=`echo "$version" | cut -d. -f2`
>  bugfix=`echo "$version" | cut -d. -f3`
> +version_bsd=`$tar --version | grep 'bsdtar'`
> +if [ ! -z "${version_bsd}" ] ; then 
> +  # mark as invalid version - not all command line options are available
> +  major=0
> +  minor=0
> +fi
>  
>  # Minimal version = 1.17 (previous versions do not correctly unpack archives
>  # containing hard-links if the --strip-components option is used).
> -- 
> 1.8.5.2 (Apple Git-48)
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
