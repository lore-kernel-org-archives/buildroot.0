From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 16 Oct 2016 17:39:09 +0200
Subject: [Buildroot] [PATCH v11 2/4] core: reorder top-level Makefile
 and document things
In-Reply-To: <20161016115423.17881-3-s.martin49@gmail.com>
References: <20161016115423.17881-1-s.martin49@gmail.com>
 <20161016115423.17881-3-s.martin49@gmail.com>
Message-ID: <3be61187-1dbd-d578-a076-6e6fdbc5ed2f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 16-10-16 13:54, Samuel Martin wrote:
> This change only moves things around and comments what is done in the
> top-level Makefile file, in order to prepare the next changes.

 Well, you actually also missed something in the move (see below), you rename
UMASK to REQ_UMASK, and you introduce CUR_UMASK.

> 
> Note that moving the definition of $(O) before or after re-entering make
> does not change anything on the buildroot behavior.
> 
> Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> 
> ---
> changes v10->v11:
> - fix typos in umask variable
> 
> changes v9->v10:
> - new patch (Arnout)
> - s/:=/=/ in CUR_MASK assignation (Arnout)
> ---
>  Makefile | 57 ++++++++++++++++++++++++++++++++-------------------------
>  1 file changed, 32 insertions(+), 25 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 2c0ac23..71b7dc8 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -29,16 +29,44 @@ SHELL := $(shell if [ -x "$$BASH" ]; then echo $$BASH; \
>  	 else if [ -x /bin/bash ]; then echo /bin/bash; \
>  	 else echo sh; fi; fi)
>  
> -# Trick for always running with a fixed umask
> -UMASK = 0022
> -ifneq ($(shell umask),$(UMASK))
> +# Set O variable if not already done on the command line;
> +# or avoid confusing packages that can use the O=<dir> syntax for out-of-tree
> +# build by preventing it from being forwarded to sub-make calls.
> +ifneq ("$(origin O)", "command line")
> +O := output
> +else
> +# Other packages might also support Linux-style out of tree builds
> +# with the O=<dir> syntax (E.G. BusyBox does). As make automatically
> +# forwards command line variable definitions those packages get very
> +# confused. Fix this by telling make to not do so.
> +MAKEOVERRIDES :=
> +# Strangely enough O is still passed to submakes with MAKEOVERRIDES
> +# (with make 3.81 atleast), the only thing that changes is the output
> +# of the origin function (command line -> environment).
> +# Unfortunately some packages don't look at origin (E.G. uClibc 0.9.31+)
> +# To really make O go away, we have to override it.
> +override O := $(O)
> +endif
> +
> +# Check if the current Buildroot execution meets all the pre-requisites.
> +# If they are not met, Buildroot will actually do its job in a sub-make meeting
> +# its pre-requisites, which is:
> +#  1- Permissive enough umask:
> +#       Wrong or too restrictive umask will prevent Buildroot and packages from
> +#       creating files and directories.
> +
> +CUR_UMASK = $(shell umask)
> +REQ_UMASK = 0022
> +
> +# Check Buildroot execution pre-requisites here.
> +ifneq ($(CUR_UMASK),$(REQ_UMASK))

 I think I said it before: I don't like it when a variable (CUR_UMASK) is used
only once. IMHO it makes understanding the code more complicated, not simpler.

 But I'll accept it this way too. So you can add my
 Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
after fixing up the commit message and the missed EXTRAMAKEARGS (see below),
whether or not you change this CUR_UMASK. Or Thomas/Peter can do that while
applying.

>  .PHONY: _all $(MAKECMDGOALS)
>  
>  $(MAKECMDGOALS): _all
>  	@:
>  
>  _all:
> -	@umask $(UMASK) && $(MAKE) --no-print-directory $(MAKECMDGOALS)
> +	@umask $(REQ_UMASK) && $(MAKE) --no-print-directory $(MAKECMDGOALS)
>  
>  else # umask
>  
> @@ -109,27 +137,6 @@ endif
>  # Include some helper macros and variables
>  include support/misc/utils.mk
>  
> -# Set O variable if not already done on the command line;
> -# or avoid confusing packages that can use the O=<dir> syntax for out-of-tree
> -# build by preventing it from being forwarded to sub-make calls.
> -ifneq ("$(origin O)", "command line")
> -O := output
> -else
> -# other packages might also support Linux-style out of tree builds
> -# with the O=<dir> syntax (E.G. BusyBox does). As make automatically
> -# forwards command line variable definitions those packages get very
> -# confused. Fix this by telling make to not do so
> -MAKEOVERRIDES =
> -# strangely enough O is still passed to submakes with MAKEOVERRIDES
> -# (with make 3.81 atleast), the only thing that changes is the output
> -# of the origin function (command line -> environment).
> -# Unfortunately some packages don't look at origin (E.G. uClibc 0.9.31+)
> -# To really make O go away, we have to override it.
> -override O := $(O)
> -# we need to pass O= everywhere we call back into the toplevel makefile
> -EXTRAMAKEARGS = O=$(O)

 This bit got removed. It is reintroduced in patch 3/4 that's why you didn't notice.


 Regards,
 Arnout

> -endif
> -
>  # Set variables related to in-tree or out-of-tree build.
>  ifeq ($(O),output)
>  CONFIG_DIR := $(TOPDIR)
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
