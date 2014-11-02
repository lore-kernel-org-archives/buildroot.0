From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 2 Nov 2014 17:00:55 +0100
Subject: [Buildroot] [PATCH 1/2] Add package bdwgc: A garbage collector
 for C and C++. The Boehm-Demers-Weiser conservative garbage collector can
 be used as a garbage collecting replacement for C 'malloc' or C++ 'new'.
In-Reply-To: <1414941345-16581-2-git-send-email-paguilar@paguilar.org>
References: <1414941345-16581-1-git-send-email-paguilar@paguilar.org>
 <1414941345-16581-2-git-send-email-paguilar@paguilar.org>
Message-ID: <20141102160055.GC11634@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Pedro, All,

The commit log should be formatted as specified in the manual, which
follows standard practive to format git commit logs, especially chapter
21.5.2. Patch revision changelog:
    http://nightly.buildroot.org/#submitting-patches 

which would give something like the following for this patch:

    bdwgc: new package

    bdwgc is a garbage collector for C and C++. The Boehm-Demers-Weiser
    conservative garbage collector can be used as a garbage collecting
    replacement for C 'malloc' or C++ 'new'.

    Signed-off-by: YOU <you@there>

Otherwise, git will not recognise the subject of the patch, and mangles
the commit log into an ugly mail subject, as you may notice here. ;-)

On 2014-11-02 16:15 +0100, Pedro Aguilar spake thusly:
> Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>
> ---
>  package/Config.in       |  1 +
>  package/bdwgc/Config.in |  9 +++++++++
>  package/bdwgc/bdwgc.mk  | 18 ++++++++++++++++++
>  3 files changed, 28 insertions(+)
>  create mode 100644 package/bdwgc/Config.in
>  create mode 100644 package/bdwgc/bdwgc.mk
> 
> diff --git a/package/bdwgc/Config.in b/package/bdwgc/Config.in
> new file mode 100644
> index 0000000..38f612f
> --- /dev/null
> +++ b/package/bdwgc/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_BDWGC
> +	bool "bdwgc"
> +	help

Indentation for kconfig keywords is: one tab. You have one tab followed
by one extra space.

Also, it seems it depends on libatomics_ops, so you should have:

    depends on BR2_PACKAGE_LIBATOMIC_ARCH_SUPPORTS # libatomic_ops
    select BR2_PACKAGE_LIBATOMIC_OPS

It bundles its own version of libatomic_ops, but I'd prefer we disable the
bundled one, and use the one already packaged in Buildroot, which seems
the default if an external one is found; from configure.ac:

    [...]
    # Do we want to use an external libatomic_ops? By default use it if  it's
    # found.
    AC_ARG_WITH([libatomic-ops],
        [AS_HELP_STRING([--with-libatomic-ops[=yes|no|check]],
                        [Use a external libatomic_ops? (default: check)])],
        [], [with_libatomic_ops=check])

    # Check for an external libatomic_ops if the answer was yes or check. If not
    # found, fail on yes, and convert check to no.
    [...]

> +      The Boehm-Demers-Weiser conservative garbage collector can 
> +      be used as a garbage collecting replacement for C 'malloc'
> +      or C++ 'new'.
> +
> +      http://www.hboehm.info/gc/

Indentation for the help text itself is: one tab and two spaces. You
have 6 spaces.

> diff --git a/package/bdwgc/bdwgc.mk b/package/bdwgc/bdwgc.mk
> new file mode 100644
> index 0000000..9419265
> --- /dev/null
> +++ b/package/bdwgc/bdwgc.mk
> @@ -0,0 +1,18 @@
> +################################################################################
> +#
> +# bdwgc
> +#
> +################################################################################
> +
> +BDWGC_VERSION = 7.2f
> +BDWGC_SOURCE  = gc-$(BDWGC_VERSION).tar.gz
> +BDWGC_SITE    = http://www.hboehm.info/gc/gc_source
> +BDWGC_INSTALL_STAGING = YES
> +BDWGC_LICENSE = GPL compatible

My. What a mess of a license... :-(

From what I understand:
  - bdwgc itself is using its own license, not unlike MIT, but not MIT
  - it uses some GPL-licensed parts with exceptions
  - the license of the build files (autostuff) is irrelevant, since they
    do not end up in the target

So I would just say something like:   bdwgc license
and let the user decide by himself.

> +BDWGC_LICENSE_FILES = README
> +BDWGC_LIBTOOL_PATCH = NO
> +
> +BDWGC_DEPENDENCIES = host-bdwgc

You also need:  libatomic_ops

Host variant will automatically catch the dependency on host-libatomic_ops,
so no need to specify it explicitly.

Regards,
Yann E. MORIN.

> +$(eval $(autotools-package))
> +$(eval $(host-autotools-package))
> -- 
> 1.9.1
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
