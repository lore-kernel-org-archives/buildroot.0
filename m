From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 3 Feb 2016 21:15:27 +0100
Subject: [Buildroot] [PATCH v6 03/13] core: re-enter make if $(CURDIR)
 or $(O) are not absolute canonical path
In-Reply-To: <1454342021-22960-4-git-send-email-s.martin49@gmail.com>
References: <1454342021-22960-1-git-send-email-s.martin49@gmail.com>
 <1454342021-22960-4-git-send-email-s.martin49@gmail.com>
Message-ID: <20160203211527.009e08aa@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  1 Feb 2016 16:53:31 +0100, Samuel Martin wrote:
> When $(CURDIR) or $(O) contain symlinks (or mount-bind) in their path,
> they can be resolved differently, depending on each package build-system
> (whether it uses the given paths or get the absolute canonical ones).
> 
> Thus, to make easier tracking down host machine paths leaking into the
> host, target or staging trees, the CURDIR and O variables are set to
> their absolute canonical paths.
> 
> Note that this change takes care of the makefile wrapper installed in
> $(O) to avoid unneeded make recursion.
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>

I have to say I kind of hate how complicated our Makefile "entry" logic
has become over time. But well, certainly not your fault.

> +# Check if we need to re-enter make for one or several of the following reasons:
> +# 1- Wrong (too restrictive) umask:
> +#    This prevents Buildroot and packages from creating files and directories.
> +# 2- CWD (i.e. $(CURDIR)) not being the absolute canonical path:
> +#    This makes harder tracking and fixing host machine path leaks.
> +# 3- Output location (i.e. $(O)) not being the absolute canonical path:
> +#    This makes harder tracking and fixing host machine path leaks.
> +#
> +# Note:
> +# - remove the trailing '/.' from $(O) as it can be added by the makefile
> +#   wrapper installed in the $(O).
> +ifneq ($(shell umask):$(CURDIR):$(patsubst %/.,%,$(O)),$(UMASK):$(realpath $(CURDIR)):$(realpath $(O)))

Can we simplify this a bit with an intermediate "NEED_RECURSE" or
something like that ?

# umask is too restrictive
ifneq ($(shell umask),$(UMASK))
NEED_RECURSE = YES
endif

...

ifeq ($(NEED_RECURSE),YES)

Maybe "RECURSE" is not the appropriate word. Maybe "NEED_SUBMAKE" is
better. Or other folks might have better suggestions.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
