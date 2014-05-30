From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 30 May 2014 19:16:07 +0200
Subject: [Buildroot] [PATCH] Improve tar check if bsdtar is installed
In-Reply-To: <1401464676-2315-1-git-send-email-abrahamh@web.de>
References: <1401464676-2315-1-git-send-email-abrahamh@web.de>
Message-ID: <20140530171607.GC3474@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Heiko, All,

On 2014-05-30 17:44 +0200, Heiko Abraham spake thusly:
> If bsdtar is installed, fix script error for tar version detection.
> Set tar version to 'invalid' to trigger rebuild of 'host-tar'.
> ---
>  support/dependencies/check-host-tar.sh | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/support/dependencies/check-host-tar.sh b/support/dependencies/check-host-tar.sh
> index 2cfc2b3..b5818f0 100755
> --- a/support/dependencies/check-host-tar.sh
> +++ b/support/dependencies/check-host-tar.sh
> @@ -14,10 +14,18 @@ fi
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

if [ -n "${version_bsd}" ]; then

> +  # mark as invalid tar version
> +  major=1
> +  minor=14
> +  bugfix=1

Any reason you used 1.14.1? To be obvious that this is an invalid
version, I'd have set it to something like:
    major=0
    minor=0

Alternatively, since our minimal supported version is 1.17, I'd have
used something like:
    major=1
    minor=16

And, no need to set bugfix, it;s not used in the check.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
