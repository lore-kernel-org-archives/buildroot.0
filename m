From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 3 Nov 2013 11:24:04 +0100
Subject: [Buildroot] [PATCH] Makefile: fix out-of-tree builds with
 multiple targets with 'all'
In-Reply-To: <1383473902-27845-1-git-send-email-yann.morin.1998@free.fr>
References: <1383473902-27845-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20131103102404.GA3615@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All,

On 2013-11-03 11:18 +0100, Yann E. MORIN spake thusly:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> For out-of-tree builds, this use-case fails to build:
>     $ make clean all
> 
> This is because 'all' is filtered-out in the Makefile wrapper, since
> the wrapper itself has a 'all' target.
> 
> The 'all' target is just the usual naming for the default target in a
> Makefile. In fact, the first target is the default one, so we can name
> it whatever we want.
> 
> Rename the Makefile wrapper 'all' target to avoid name-clashing.

Sorry, I forgot one occurence of 'all'. New patch on its way...

Regards,
Yann E. MORIN.

> Reported-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Ryan Barnett <rjbarnet@rockwellcollins.com>
> ---
>  support/scripts/mkmakefile | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/support/scripts/mkmakefile b/support/scripts/mkmakefile
> index cef2ec7..89dc649 100755
> --- a/support/scripts/mkmakefile
> +++ b/support/scripts/mkmakefile
> @@ -32,14 +32,14 @@ MAKEFLAGS += --no-print-directory
>  
>  .PHONY: all \$(MAKECMDGOALS)
>  
> -all	:= \$(filter-out all Makefile,\$(MAKECMDGOALS))
> +all	:= \$(filter-out Makefile,\$(MAKECMDGOALS))
>  
> -all:
> +_all:
>  	\$(MAKE) \$(MAKEARGS) \$(all)
>  
>  Makefile:;
>  
> -\$(all): all
> +\$(all): _all
>  	@:
>  
>  %/: all
> -- 
> 1.8.1.2
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
