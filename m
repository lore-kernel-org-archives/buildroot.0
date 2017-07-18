From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 Jul 2017 21:06:43 +0200
Subject: [Buildroot] [PATCH] package/linux-tools: change method for
 including linux-tool sub-makefiles
In-Reply-To: <20170718181137.23347-1-mmayer@broadcom.com>
References: <20170718181137.23347-1-mmayer@broadcom.com>
Message-ID: <20170718190643.GA2583@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Markus, All,

On 2017-07-18 11:11 -0700, Markus Mayer spake thusly:
> Make inclusion ordering of all linux-tool-*.mk sub-makefiles explicit
> instead of relying on alphabetical sort order. This is done by
> renaming the Linux tools sub-makefiles to the format linux-tool-*.mk.in.
> This causes the top-level Makefile to ignore the Linux tools
> sub-makefiles.
> 
> Until now, the main Makefile included all linux-tool-*.mk files, as
> well as linux-tools.mk, and it relied on alphabetical sorting to
> include them in the proper order (linux-tool-*.mk before
> linux-tools.mk).
> 
> Signed-off-by: Markus Mayer <mmayer@broadcom.com>

Thank you for this new iteration.

I have a small comment, see below...

[--SNIP--]
> diff --git a/package/linux-tools/linux-tools.mk b/package/linux-tools/linux-tools.mk
> index 7fa8d19..2827ade 100644
> --- a/package/linux-tools/linux-tools.mk
> +++ b/package/linux-tools/linux-tools.mk
> @@ -10,15 +10,13 @@
>  #
>  # So, all tools refer to $(LINUX_DIR) instead of $(@D).
>  
> -# Note: we need individual tools .mk files to be included *before* this one
> -# to guarantee that each tool has a chance to register itself before we build
> -# the list of build and install hooks, below.
> -#
> -# This is currently guaranteed by the naming of each file:
> -# - they get included by the top-level Makefile, with $(sort $(wildcard ...))
> -# - make's $(sort) function will aways sort in the C locale
> -# - the files names correctly sort out in the C locale so that each tool's
> -#   .mk file is included before this one.
> +# Note: we need individual tools makefiles to be included *before* we build
> +# the list of build and install hooks below to guarantee that each tool has
> +# a chance to register itself. Therefore, the makefiles are named
> +# linux-tool-*.mk.in, so they won't be picked up by the top-level Makefile,
> +# but can be included here, guaranteeing proper ordering.

There are two important and crucial points:

  - guaranteeing inclusion ordering,
  - guaranteeing single inclusion.

If only the first were needed, then we could simply include the tools
here without renaming; they'd be included twice, but that is not a
problem for the first point.

But the second point is also important, because we do not want tools to
register themselves twice, nor do we want they break their variables by
appending stuff already added.

So, I would keep your comment as is, except I'd add a bit on the third
and last lines:

# Note: we need individual tools makefiles to be included *before* we build
# the list of build and install hooks below to guarantee that each tool has
# a chance to register itself once, and only once. Therefore, the makefiles
# are named linux-tool-*.mk.in, so they won't be picked up by the top-level
# Makefile, but can be included here, guaranteeing the single inclusion and
# the proper ordering.

(Bonus point: ithe comment all lines up perfectly well, now! ;-] )

No need to respin, I gues, a maintainer can tweak the message when
applying.

Thanks! :-)

Regards,
Yann E. MORIN.

> +include $(sort $(wildcard package/linux-tools/*.mk.in))
>  
>  # We only need the kernel to be extracted, not actually built
>  LINUX_TOOLS_PATCH_DEPENDENCIES = linux
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
