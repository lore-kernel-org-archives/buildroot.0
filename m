From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 27 Jun 2016 01:08:32 +0200
Subject: [Buildroot] [PATCH v9 02/11] core: re-enter make if $(CURDIR)
 or $(O) are not absolute canonical path
In-Reply-To: <1461358223-18312-3-git-send-email-s.martin49@gmail.com>
References: <1461358223-18312-1-git-send-email-s.martin49@gmail.com>
 <1461358223-18312-3-git-send-email-s.martin49@gmail.com>
Message-ID: <fd5caea3-3bd6-4481-144a-ed30006d0523@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22-04-16 22:50, Samuel Martin wrote:
> When $(CURDIR) or $(O) contain symlinks in their path, they can be
> resolved differently, depending on each package build-system (whether it
> uses the given paths or get the absolute canonical ones).
> 
> This will make easier tracking down host machine paths leaking into the
  ^^^^To

> host, target or staging trees, the CURDIR and O variables are set to
> their absolute canonical paths.
> 
> In order to recall the toplevel makefile with absolute canonical paths
> for $(CURDIR) and $(O), we need to:
> 1- Move the O variable definition out of any if-block; so they are
>    always available.
> 2- Compute the absolute canonical paths for $(CURDIR) and $(O) that will
>    be passed to the sub-make. This is achieved using the 'realpath' make
>    primitive. However, some care must be taken when manipulating O:
>    - the out-of-tree makefile wrapper happens a trailing "/.", we need
                                        ^^^^^^^appends

>      to strip this part away to not break the comparison driving the
>      sub-make call;

 This is just to avoid another level of recursion, right? It doesn't seem to
work, see below.

>    - according to [1,2], realpath returns an empty string in case of
>      non-existing entry. So, to avoid passing an empty O= variable to
>      sub-make, it is necessary to define the output directory and create
>      it prior to call realpath on it (because on the first invocation,
>      $(O) usually does not yet exists), hence the trick doing the mkdir
>      right before calling realpath.
> 3- Update EXTRAMAKEARGS with the absobulte canonical $(O) and use it
                                   ^^^^^^^^^absolute

>    when call recalling the toplevel makefile with umask and paths
>    correctly set.
> 4- Lastly, update the condition for setting the CONFIG_DIR and
>    NEED_WRAPPER variables.
> 
> Notes:
> * This change takes care of the makefile wrapper installed in $(O) to
>   avoid unneeded make recursion.
> * Now, only $(O) is strip away from MAKEOVERRIDES whatever the build is
                      ^^^^^stripped                 ^^^^^^^^whereever

>   done in- or out-of-tree (i.o.w. without or with O set in the command
>   line); wheares is the previous implementation, all variables set on
>   the command line were stripped away only in the case of out-of-tree
>   build.

 I don't see how this change is related to the rest, actually.


 Maybe this patch is doing a little too much in one go...

 There is a lot of stuff being moved around by this patch, and very little
actual changes. It would help to separate that to start with - now the diff is a
little large. You can make such a patch that has no use at all except for making
the next patch simpler.

> 
> [1] https://www.gnu.org/software/make/manual/html_node/File-Name-Functions.html
> [2] http://man7.org/linux/man-pages/man3/realpath.3.html
> 
> Reported-by: Matthew Weber <matt@thewebers.ws>
> Cc: Matthew Weber <matt@thewebers.ws>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> 
> ---
[snip]
> diff --git a/Makefile b/Makefile
> index 3d86c9b..a05b9e1 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -24,18 +24,68 @@
>  # You shouldn't need to mess with anything beyond this point...
>  #--------------------------------------------------------------
>  
> -# Trick for always running with a fixed umask
> +# Set O variable if not already done on the command line;
> +# or avoid confusing packages that can use the O=<dir> syntax for out-of-tree
> +# build by preventing it from being forwarded to sub-make calls.
> +ifneq ("$(origin O)", "command line")
> +O := $(CURDIR)/output
> +else
> +# Other packages might also support Linux-style out of tree builds
> +# with the O=<dir> syntax (E.G. BusyBox does). As make automatically
> +# forwards command line variable definitions those packages get very
> +# confused. Fix this by telling make to not do so, only for O=..., but
> +# keep all others (such as BR2_EXTERNAL, BR2_DL_DIR, etc).
> +MAKEOVERRIDES := $(filter-out O=%,$(MAKEOVERRIDES))
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
> +# its pre-requisites, which are:
> +#  1- Permissive enough umask:
> +#       Wrong or too restrictive umask will prevent Buildroot and packages from
> +#       creating files and directories.
> +#  2- Absolute canonical CWD (i.e. $(CURDIR)):
> +#       Otherwise, some packages will use CWD as-is, others will compute its
> +#       absolute canonical path. This makes harder tracking and fixing host
> +#       machine path leaks.
> +#  3- Absolute canonical output location (i.e. $(O)):
> +#       For the same reason as the one for CWD.
> +
> +# Current state:
> +CUR_UMASK := $(shell umask)

 We normally use = rather than := unless strictly necessary. Here it is not
strictly necessary, becauce CUR_UMASK is used only once anyway.

> +# Remove the trailing '/.' from $(O) as it can be added by the makefile wrapper
> +# installed in the $(O) directory.
> +O := $(patsubst %/.,%,$(O))

 This actually doesn't work, because of the override above you need to use
override here as well. Well, things will still _work_, you just have a redundant
recursion level.

> +
> +# Buildroot requirements:

 This comment (and the 'Current state' above) isn't very well placed here,
because there is a bit too much other stuff (comments etc.) intermingled. I
think it would be better to keep the corresponding options together, so put
REAL_O right below the last O replacement above, then REAL_CURDIR, and finally
both UMASKs. I'm just not sure where to put the EXTRAMAKEARGS.


>  UMASK = 0022
> -ifneq ($(shell umask),$(UMASK))
> +REAL_CURDIR := $(realpath $(CURDIR))

 Here also no real need to use := even though it's used twice, realpath is not
an expensive function.

> +# realpath needs the entry to exists, otherwise an empty string is returned.
> +REAL_O := $(shell mkdir -p $(O) >/dev/null 2>&1)$(realpath $(O))

 Here the := is needed because of the mkdir.

 I don't think redirecting the stderr is a good idea, because the error you get
from it is actually interesting. Instead, I think it's best to use the same
command as for BASE_DIR and just slap a $(realpath ...) around it. Also, we need
that check like for BASE_DIR to error out immediately if the mkdir failed. And
finally, the equivalent for BASE_DIR can be removed. Actually, the whole of
BASE_DIR can be removed - O is now exactly the same as BASE_DIR.

 I propose to split off a separate patch that moves the mkdir from BASE_DIR up
here to REAL_O, and just sets BASE_DIR = $(REAL_O). Then a second patch can add
the recursion, and set BASE_DIR = $(O). And finally a third patch can remove
BASE_DIR completely. It's possible that that third patch gets rejected in the
end BTW.

 Regards,
 Arnout

> +
> +# Make sure O= is passed (with its absolute canonical path) everywhere the
> +# toplevel makefile is called back.
> +EXTRAMAKEARGS := O=$(REAL_O)
> +
> +# Check Buildroot execution pre-requisites here.
> +ifneq ($(CUR_UMASK):$(CURDIR):$(O),$(UMASK):$(REAL_CURDIR):$(REAL_O))
>  .PHONY: _all $(MAKECMDGOALS)
>  
>  $(MAKECMDGOALS): _all
>  	@:
>  
>  _all:
> -	@umask $(UMASK) && $(MAKE) --no-print-directory $(MAKECMDGOALS)
> +	@umask $(UMASK) && \
> +		$(MAKE) -C $(REAL_CURDIR) --no-print-directory \
> +			$(MAKECMDGOALS) $(EXTRAMAKEARGS)
>  
> -else # umask
> +else # umask / $(CURDIR) / $(O)
>  
>  # This is our default rule, so must come first
>  all:
> @@ -110,30 +160,10 @@ comma := ,
>  empty :=
>  space := $(empty) $(empty)
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
> -endif
> -
>  # Set variables related to in-tree or out-of-tree build.
> -ifeq ($(O),output)
> -CONFIG_DIR := $(TOPDIR)
> +# Here, both $(O) and $(CURDIR) are absolute canonical paths.
> +ifeq ($(O),$(CURDIR)/output)
> +CONFIG_DIR := $(CURDIR)
>  NEED_WRAPPER =
>  else
>  CONFIG_DIR := $(O)
> @@ -1017,4 +1047,4 @@ include docs/manual/manual.mk
>  
>  .PHONY: $(noconfig_targets)
>  
> -endif #umask
> +endif #umask / $(CURDIR) / $(O)
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
