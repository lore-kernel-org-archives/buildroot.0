From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 5 Nov 2017 09:35:49 +0100
Subject: [Buildroot] BR2_REPRODUCIBLE issues
In-Reply-To: <1509720041684-0.post@n4.nabble.com>
References: <1509720041684-0.post@n4.nabble.com>
Message-ID: <20171105083549.GD2996@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Einar, All,

On 2017-11-03 07:40 -0700, Einar J?n Gunnarsson spake thusly:
> I've been using BR2_REPRODUCIBLE, and it mostly works.
> 
> But when it is using a git repo, I have the following issues with creating
> SOURCE_DATE_EPOCH:
> 1) It uses $(GIT), but the GIT variable is only defined in line 487:
> "include package/Makefile.in".

That's not true. In current master, it is defined in:

package/pkg-download.mk:15:export GIT := $(call qstrip,$(BR2_GIT))

And GIT has never been defined in package.Makefile.in, ever.

What version of Buildroot are you using?

> Note that this is done around line 250 in $(TOPDIR)/Makefile, so sometimes
> $(GIT) is unset then getting BR2_VERSION_GIT_EPOCH

No it iis not, because BR2_VERSION_GIT_EPOCH is a recursively-expanded
varible, that is its value is only evaluated when the variable is
evalauated, not when it is asigned.

You can test with the simple Makefile:

    FOO = $(BAR)
    BAR = yes, works

    all:
        @echo "'$(FOO)'"

And BR2_VERSION_GIT_EPOCH is only defined when we BR2_REPRODUCIBLE is
defioned, which can be true only when we have a .config file, as
BR2_REPRODUCIBLE comes form the .config file.

And in that case, BR2_GIT is defined, and thus GIT is defined.

Note: if the user defied an empty value for BR2_GIT, then quite a few
other things will go south as well...

> 2) It always uses the last git commit to calculate the date. So any commit
> changes the timestamp, while the non-git timestamp stays the same.
> This makes the whole thing almost useless.

Absolutely not, this is expected: the source-date-epoch stuff guarantees
that, given a set of source files, you always get the same binaries (at
elast with rgard to date/time).

So you really want to use the date of the commit, not the date of the
build.

See:
    https://reproducible-builds.org/specs/source-date-epoch/

So, this patch is NAK from me.

However, if you really, like realy-really, want to override it to
something else, then just export SOURCE_DATE_EPOCH before calling
Buildroot.

Regards,
Yann E. MORIN.

> If the git log command could take a parameter, you could make reproducible
> builds based on e.g. tag 2017.08, which would be much more useful.
> 
> Regards,
> Einar J?n
> 
> An idea for a patch made against origin/next - feel free to do whatever with
> it.
> if BR2_REPRODUCIBLE_CUSTOM_REPO_VERSION is empty, the behaviour is unchanged
> from before.
> Maybe setting the default value of BR2_REPRODUCIBLE_CUSTOM_REPO_VERSION to
> the last major tag version might make sense.
> ------
> From ba5e36391f698946e6b5e02c4e7ab389f88f1373 Mon Sep 17 00:00:00 2001
> From: Einar Jon Gunnarsson <tolvupostur@gmail.com>
> Date: Fri, 3 Nov 2017 15:15:16 +0100
> Subject: [PATCH] BR2_REPRODUCIBLE can use a custom git commit
> 
> ---
>  Config.in | 12 ++++++++++++
>  Makefile  |  3 ++-
>  2 files changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/Config.in b/Config.in
> index e395995..faab671 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -726,6 +726,18 @@ config BR2_REPRODUCIBLE
>           This is labeled as an experimental feature, as not all
>           packages behave properly to ensure reproducibility.
> 
> +if BR2_REPRODUCIBLE
> +
> +config BR2_REPRODUCIBLE_CUSTOM_REPO_VERSION
> +       string "Git version for reproducible builds"
> +       help
> +         Revision to use in the typical format used by Git
> +         E.G. a sha id, a tag, branch, ..
> +         Uses the last commit if empty.
> +         Only useful if TOPDIR is a git repository.
> +
> +endif
> +
>  endmenu
> 
>  endmenu
> diff --git a/Makefile b/Makefile
> index 6d4aeca..a19d20e 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -253,7 +253,8 @@ export TZ = UTC
>  export LANG = C
>  export LC_ALL = C
>  export GZIP = -n
> -BR2_VERSION_GIT_EPOCH = $(shell GIT_DIR=$(TOPDIR)/.git $(GIT) log -1
> --format=%at)
> +GIT := $(call qstrip,$(BR2_GIT))
> +BR2_VERSION_GIT_EPOCH = $(shell GIT_DIR=$(TOPDIR)/.git $(GIT) log -1
> --format=%at $(BR2_REPRODUCIBLE_CUSTOM_REPO_VERSION))
>  export SOURCE_DATE_EPOCH = $(if $(wildcard
> $(TOPDIR)/.git),$(BR2_VERSION_GIT_EPOCH),$(BR2_VERSION_EPOCH))
>  DEPENDENCIES_HOST_PREREQ += host-fakedate
>  endif
> --
> 1.9.1
> 
> 
> 
> --
> Sent from: http://buildroot-busybox.2317881.n4.nabble.com/
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
