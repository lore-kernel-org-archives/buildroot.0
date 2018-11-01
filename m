From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 1 Nov 2018 21:44:41 +0100
Subject: [Buildroot] [PATCH 1/1] support/scripts/mkmakefile: Silent
 wrapper
In-Reply-To: <20181026112621.8146-1-serj.kalichev@gmail.com>
References: <20181026112621.8146-1-serj.kalichev@gmail.com>
Message-ID: <20181101204441.GW28575@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Serj, All,

On 2018-10-26 14:26 +0300, Serj Kalichev spake thusly:
>  Suppose we use Makefile wrapper and build
>  project out of buildroot tree (with O=...). The commands like "make
>  busybox-all-external-deps" will output the string "uname 022 && make ..." to
>  stdout before the usefull information. It pollutes stdout. In the same time
>  if we use the same command in the buildroot source-tree then we don't get the
>  additional output. Some external scripts can analyze output of make and
>  additional output can break them. This patch make wrapper silent.
>  
>  Sorry for the previous ugly-formatted patch.

Do not put personal messages like that in the commit log. You may put
them after the three-dash line...

> Signed-off-by: Serj Kalichev <serj.kalichev@gmail.com>
> ---

... here.

>  support/scripts/mkmakefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/support/scripts/mkmakefile b/support/scripts/mkmakefile
> index 37162a3173..3b1a9f8774 100755
> --- a/support/scripts/mkmakefile
> +++ b/support/scripts/mkmakefile
> @@ -33,7 +33,7 @@ MAKEFLAGS += --no-print-directory
>  all	:= \$(filter-out Makefile,\$(MAKECMDGOALS))
>  
>  _all:
> -	umask 0022 && \$(MAKE) \$(MAKEARGS) \$(all)
> +	@umask 0022 && \$(MAKE) \$(MAKEARGS) \$(all)

I actually prefer when I can see the path of Buildroot. Since I can use
many Buildroot trees to do tests, I do want to check that I am indeed
using the correct one.

However, I understand that it is weird that the in-tree and out-of-tree
do not print the same stuff, and that can be confusing.

After discussing this on IRC with Thomas, we think it would be nice if
we could mimick what the kernel currently does:
    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/scripts/mkmakefile

The default would be to be silent (what you expect), while still
allowing people like me to turn on the verbose mode when needed.

Care to look into that, please?

In the mean time, I've marked your patch as "changes requested" in
patchwork. Thanks!

Regards,
Yann E. MORIN.

>  Makefile:;
>  
> -- 
> 2.17.1
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
