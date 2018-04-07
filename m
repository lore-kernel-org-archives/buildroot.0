From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 7 Apr 2018 16:33:58 +0200
Subject: [Buildroot] [PATCH v2] Makefile: Avoid executing 'git log' each
 time SOURCE_DATE_EPOCH is used
In-Reply-To: <1523010383-27024-1-git-send-email-james.byrne@origamienergy.com>
References: <1522239999-15582-1-git-send-email-james.byrne@origamienergy.com>
 <1523010383-27024-1-git-send-email-james.byrne@origamienergy.com>
Message-ID: <20180407143358.GA2341@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James, All,

On 2018-04-06 11:26 +0100, James Byrne spake thusly:
> If SOURCE_DATE_EPOCH is not defined it was given a definition that
> caused 'git log' to be executed each time the variable is referenced,
> which is not very efficient given that the answer cannot change.
> 
> This commit moves the definition of BR2_VERSION_GIT_EPOCH after the
> inclusion of Makefile.in (so that GIT is defined) and makes it a simply
> expanded variable so that it is only evaluated once.
> 
> In addition, the git directory is no longer explicitly set to be TOPDIR
> meaning that the default date will come from the commit date of whatever
> repository the code is commited within instead of only doing so if the
> repository is at the same level as the Buildroot tree.

Since your are saying "in addition", it smells like this should have
been two seaparate commits:

  - one to change the variable to being simply expanded

  - a second one to not enforce the git directory.

I am totally OK with the first change, while I am still not convinced by
the second. As I already said, if Buildroot is used from a higher-level
buildsystem, it is the responsibility of that higher-level buildsystem
to appropriately set SOURCE_DATE_EPOCH in the environment.

Also, bear in mind that, even without a higher-level buildsystem, it is
possible to call Buildroot without actualy being in Buildroot's tree,
e.g.:

    $ make -C /path/to/buildroot O=/path/to/build-dir

Or even:

    $ cd /path/to/build-dir
    $ make -C /path/to/buildroot O=$(pwd) foo_defconfig
    $ make

And then you would lose the git info that is present in the Buildroot
tree in /path/to/buildroot. I actually use either forms quite a lot,
especially the second one. In fact, I even never build in the Buildroot
tree, except when people report it is broken and I need to investigate.

So, I am still opposed to the second change.

Regards,
Yann E. MORIN.

> Signed-off-by: James Byrne <james.byrne@origamienergy.com>
> ---
>  Makefile | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 0724f28..3b846b9 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -247,8 +247,6 @@ export TZ = UTC
>  export LANG = C
>  export LC_ALL = C
>  export GZIP = -n
> -BR2_VERSION_GIT_EPOCH = $(shell GIT_DIR=$(TOPDIR)/.git $(GIT) log -1 --format=%at)
> -export SOURCE_DATE_EPOCH ?= $(if $(wildcard $(TOPDIR)/.git),$(BR2_VERSION_GIT_EPOCH),$(BR2_VERSION_EPOCH))
>  endif
> 
>  # To put more focus on warnings, be less verbose as default
> @@ -504,6 +502,14 @@ include support/dependencies/dependencies.mk
>  include $(sort $(wildcard toolchain/*.mk))
>  include $(sort $(wildcard toolchain/*/*.mk))
> 
> +ifeq ($(BR2_REPRODUCIBLE),y)
> +# If SOURCE_DATE_EPOCH has not been set then use the commit date, or the last
> +# release date if the source tree is not within a Git repository.
> +# See: https://reproducible-builds.org/specs/source-date-epoch/
> +BR2_VERSION_GIT_EPOCH := $(shell $(GIT) log -1 --format=%at 2> /dev/null)
> +export SOURCE_DATE_EPOCH ?= $(or $(BR2_VERSION_GIT_EPOCH),$(BR2_VERSION_EPOCH))
> +endif
> +
>  # Include the package override file if one has been provided in the
>  # configuration.
>  PACKAGE_OVERRIDE_FILE = $(call qstrip,$(BR2_PACKAGE_OVERRIDE_FILE))
> --
> 2.7.4
> 
> The contents of this email and any attachment are confidential to the intended recipient(s). If you are not an intended recipient: (i) do not use, disclose, distribute, copy or publish this email or its contents; (ii) please contact the sender immediately; and (iii) delete this email. Origami Energy Limited (company number 8619644); Origami Storage Limited (company number 10436515) and OSSPV001 Limited (company number 10933403), each registered in England and each with a registered office at: Ashcombe Court, Woolsack Way, Godalming, GU7 1LQ.
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
