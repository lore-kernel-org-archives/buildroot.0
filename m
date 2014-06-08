From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 8 Jun 2014 21:20:43 +0200
Subject: [Buildroot] [PATCH 1/1] Option to copy Linaro gconv libs to
 target
In-Reply-To: <1383428236-3842-1-git-send-email-svlasic@gmail.com>
References: <1383428236-3842-1-git-send-email-svlasic@gmail.com>
Message-ID: <20140608192043.GQ3266@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Stanislav, All,

On 2013-11-02 22:37 +0100, Stanislav Vasic spake thusly:
> Also exports GCONV_PATH if folder exists on target.
> That is needed because some programs (eg. XBMC) dont
> see gconv libs if GCONV_PATH is not exported.
[--SNIP--]
> diff --git a/system/skeleton/etc/profile b/system/skeleton/etc/profile
> index 31d3180..d7fef65 100644
> --- a/system/skeleton/etc/profile
> +++ b/system/skeleton/etc/profile
> @@ -8,6 +8,12 @@ export PATH=\
>  /usr/bin/X11:\
>  /usr/local/bin
>  
> +# If gconv folder exists, export GCONV_PATH
> +
> +if [ -d /usr/lib/gconv ]; then
> +    export GCONV_PATH = /usr/lib/gconv
> +fi

This will only work for programs started from a login shell. Programs
that are started /automatically/ (eg. by startup scripts, like we do for
XBMC) will not have that variable in their environment, so will still
fail to find the gconv libs.

I've looked at the glibc source code, and besides the GCONV_PATH
solution, I can't see another wayt to tell where to look for the gconv
libs.

All this multi-arch stuff is so utterly broken, and there is not even a
real use-case for it. Not even a Debian developper I talked to, which
was involved in the mess, was able to explain what the reason was, that
was not already covered by existing mechanisms. That's a shame...

I still have to look if it is possible to pass an alternative path to
the dynamic linker in one of its config files...

Sigh...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
