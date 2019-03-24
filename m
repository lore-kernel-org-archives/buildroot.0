From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 24 Mar 2019 19:27:03 +0100
Subject: [Buildroot] [PATCH] package/unixbench: new package
In-Reply-To: <20190324175940.25686-1-itsatharva@gmail.com>
References: <20190324175940.25686-1-itsatharva@gmail.com>
Message-ID: <20190324182703.GJ2660@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Atharva, All,

On 2019-03-24 23:29 +0530, Atharva Lele spake thusly:
> UnixBench is the original BYTE UNIX benchmark suite, updated and revised by many people over the years.
> The purpose of UnixBench is to provide a basic indicator of the performance of a Unix-like system.

Although it is nice to have a brief explanation of what the package is,
a commit log is should contain the explanations of the packaging itself.

I.e. all the tricks you had to do to make it work. You (and I because I
helped on IRC) know what's going on, but think about the others: you
have to explain them.

Also, there is *one* person you should also consider explaining this
package: yourself in the future. When you come back months, or even
years from now, on this package, you will have forgotten why you did
what you did.

For example, here you would explain why you need to patch-out the Run
script. You would also explain why you pass CC and UB_GCC_OPTION on the
command line.

> Signed-off-by: Atharva Lele <itsatharva@gmail.com>
> ---
>  DEVELOPERS                                    |  3 ++
>  package/Config.in                             |  1 +
>  .../unixbench/0001-remove-make-check.patch    | 25 +++++++++++++
>  package/unixbench/Config.in                   | 19 ++++++++++
>  package/unixbench/unixbench                   |  3 ++
>  package/unixbench/unixbench.hash              |  2 ++
>  package/unixbench/unixbench.mk                | 36 +++++++++++++++++++
>  7 files changed, 89 insertions(+)
>  create mode 100644 package/unixbench/0001-remove-make-check.patch
>  create mode 100644 package/unixbench/Config.in
>  create mode 100644 package/unixbench/unixbench
>  create mode 100644 package/unixbench/unixbench.hash
>  create mode 100644 package/unixbench/unixbench.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index c0a4814a86..fa0357aabc 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -236,6 +236,9 @@ F:	package/luasec/
>  F:	package/lua-ev/
>  F:	package/orbit/
>  
> +N:	Atharva Lele <itsatharva@gmail.com>
> +F:	package/unixbench

This is adirectory, so should be terminated with a '/' (see the other
entries around).

[--SNIP--]
> diff --git a/package/unixbench/0001-remove-make-check.patch b/package/unixbench/0001-remove-make-check.patch
> new file mode 100644
> index 0000000000..331fab5c44
> --- /dev/null
> +++ b/package/unixbench/0001-remove-make-check.patch

Patches themselves should have a commit log of their own, and should
also carry your signed-off-by as well.

> @@ -0,0 +1,25 @@
> +diff --git a/UnixBench/Run b/UnixBench/Run
> +index b4abd26..46d5414 100755
> +--- a/UnixBench/Run
> ++++ b/UnixBench/Run
> +@@ -875,13 +875,13 @@ sub preChecks {
> + 
> +     # Check that the required files are in the proper places.
> +     my $make = $ENV{MAKE} || "make";
> +-    system("$make check");
> +-    if ($? != 0) {
> +-        system("$make all");
> +-        if ($? != 0) {
> +-            abortRun("\"$make all\" failed");
> +-        }
> +-    }
> ++#    system("$make check");
> ++#    if ($? != 0) {
> ++#        system("$make all");
> ++#        if ($? != 0) {
> ++#            abortRun("\"$make all\" failed");
> ++#        }
> ++#    }

Don't keep commented-out lines; just remove them.

> + 
> +     # Create a script to kill this run.
> +     system("echo \"kill -9 $$\" > \"${TMPDIR}/kill_run\"");
> diff --git a/package/unixbench/Config.in b/package/unixbench/Config.in
> new file mode 100644
> index 0000000000..ffcc5803f7
> --- /dev/null
> +++ b/package/unixbench/Config.in
> @@ -0,0 +1,19 @@
> +config BR2_PACKAGE_UNIXBENCH
> +		select BR2_PACKAGE_PERL

Perl depends on MMU, so you have to propagate that dependency to
UnixBench as well.

Also, did you try a minimalist build with no other package and see if
something is missing at runtime?

> +		bool "unixbench"
> +		help
> +		  UnixBench is the original BYTE UNIX benchmark suite, updated and
> +		  revised by many people over the years.
> +         
> +		  The purpose of UnixBench is to provide a basic indicator of the
> +		  performance of a Unix-like system; hence multiple tests are used
> +		  to test various aspects of the system's performance. These test
> +		  results are then compared to the scores from a baseline system to
> +		  produce an index value, which is easier to handle than raw scores.
> +		  The entire set of index values is then combined to make an overall
> +		  index for the system.
> +         
> +		  Some simple graphics tests are included to test 2D and 3D performance
> +		  of the system. Multi-CPU systems are also handled.
> +         
> +		  https://github.com/kdlucas/byte-unixbench

There should be only one leading TAB, not two. Please run:

    $ ./utils/check-package package/unixbench/*

[--SNIP--]
> diff --git a/package/unixbench/unixbench.hash b/package/unixbench/unixbench.hash
> new file mode 100644
> index 0000000000..ccec430c66
> --- /dev/null
> +++ b/package/unixbench/unixbench.hash
> @@ -0,0 +1,2 @@
> +# sha256 locally computed
> +sha256 1677dcdcbed78805848b3c3fd58a6d052b677b6a4ee7add4db74acc4d3364a79 unixbench-070030e09f6effdf0c6721e8fcc3a5c6fb5bed1a.tar.gz

Please also add a hash for the license file.

> diff --git a/package/unixbench/unixbench.mk b/package/unixbench/unixbench.mk
> new file mode 100644
> index 0000000000..06f1903871
> --- /dev/null
> +++ b/package/unixbench/unixbench.mk
> @@ -0,0 +1,36 @@
> +################################################################################
> +#
> +# unixbench
> +#
> +################################################################################
> +
> +UNIXBENCH_VERSION = 070030e09f6effdf0c6721e8fcc3a5c6fb5bed1a
> +UNIXBENCH_SITE = $(call github,kdlucas,byte-unixbench,$(UNIXBENCH_VERSION))
> +UNIXBENCH_LICENSE = GPL-2.0
> +UNIXBENCH_LICENSE_FILE = LICENSE.txt
> +
> +# UnixBench tries to compile its binaries regargless of them being compiled
> +# or not. The patch will disable that since we may not always have a compiler
> +# onboard.

The comment above should go as the commjit log of the patch.

> +# set UB_GCC_OPTIONS to default optimization from UnixBench (Line #88 in makefile).
> +# cross compilation fails if UnixBench makefile tries to detect
> +# architecture and OS. This is due to cross compiler not supporting
> +# 'native' value for -march and -mtune flags.

I'm afraid this comment is not entirely clear for those that did not
follow on IRC and for posterity. Let me suggest an alternative
formulation:

    # Auto-detection would set CFLAGS for the host machine, using
    # -march=native and -mtune=native, which does not make sense for
    # cross-compilation and so a cross-gcc fails in this case.
    # Setting UB_GCC_OPTIONS skips this auto-detection and forces
    # the CFLAGS we are interested in.

> +define UNIXBENCH_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) \
> +	$(MAKE) \
> +		CC="$(TARGET_CC)" -C $(@D)/UnixBench \
> +		UB_GCC_OPTIONS="$(TARGET_CFLAGS)"

It's better to keep all variables together and the -C option first:

    $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) \
        -C $(@D)/UnixBench \
        CC="$(TARGET_CC)" \
        UB_GCC_OPTIONS="$(TARGET_CFLAGS)"

Also, I wonder if we should not also pass TARGET_LDFLAGS too...

> +endef
> +
> +# UnixBench doesn't have any install script of its own. Since $(INSTALL)
> +# cannot copy whole directories, we have to copy files and then chmod them.

That last part does not make sense, and does not reflect what you are
doing below:

> +define UNIXBENCH_INSTALL_TARGET_CMDS
> +	mkdir -p $(TARGET_DIR)/usr/lib/unixbench
> +	cp -a $(@D)/UnixBench/{pgms,results,testdir,tmp,Run} $(TARGET_DIR)/usr/lib/unixbench/
> +	chmod -R 0755 $(TARGET_DIR)/usr/lib/unixbench

... here, you only chmod the directory, not the individual files. And it
is not needed to do that chmod to begin with.

And 'cp -a' does keep the executable bit on the executables compiled by
UnixBench.

So, this is overall a pretty good first patch. I've certainly seen
worse, by far!

So, now I've made my review, others may also chime in and provide thir
comments as well. Wait a bit (one day or two), then apply the requested
changes and resend the patch.

Thank you!

Regards,
Yann E. MORIN.

> +	$(INSTALL) -D -m 0755 $(UNIXBENCH_PKGDIR)/unixbench $(TARGET_DIR)/usr/bin/unixbench
> +endef
> +
> +$(eval $(generic-package))
> -- 
> 2.21.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
