From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 24 Mar 2019 19:37:03 +0100
Subject: [Buildroot] [PATCH] package/unixbench: new package
In-Reply-To: <20190324175940.25686-1-itsatharva@gmail.com>
References: <20190324175940.25686-1-itsatharva@gmail.com>
Message-ID: <81f09ffd-c49d-d42a-3d90-36d022bb79fe@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Atharva,

Thanks for you contribution!

Le 24/03/2019 ? 18:59, Atharva Lele a ?crit?:
> UnixBench is the original BYTE UNIX benchmark suite, updated and revised by many people over the years.
> The purpose of UnixBench is to provide a basic indicator of the performance of a Unix-like system.
> 
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
> +
>  N:	Bartosz Bilas <b.bilas@grinn-global.com>
>  F:	package/qt5/qt5scxml/
>  
> diff --git a/package/Config.in b/package/Config.in
> index b5321aeb49..521308c1d8 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -132,6 +132,7 @@ menu "Debugging, profiling and benchmark"
>  	source "package/trace-cmd/Config.in"
>  	source "package/trinity/Config.in"
>  	source "package/uclibc-ng-test/Config.in"
> +	source "package/unixbench/Config.in"
>  	source "package/valgrind/Config.in"
>  	source "package/vmtouch/Config.in"
>  	source "package/whetstone/Config.in"
> diff --git a/package/unixbench/0001-remove-make-check.patch b/package/unixbench/0001-remove-make-check.patch
> new file mode 100644
> index 0000000000..331fab5c44
> --- /dev/null
> +++ b/package/unixbench/0001-remove-make-check.patch

You should add some comments on this patch and add your SoB line.
See
https://buildroot.org/downloads/manual/manual.html#_format_and_licensing_of_the_package_patches

Also use a git formatted patch since the upstream project use git.

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

You should just remove these lines instead.

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

Perl is a runtime dependency (add a comment # Runtime).
Also, since perl package depends on MMU unixbench must also depend on it.

I believe, unixbench should depend on perl instead.
The user must select perl interpreter in order to be able to select unixbench.

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

So, how behave/build these graphics tests if the target doesn't have a GPU ?

> +         
> +		  https://github.com/kdlucas/byte-unixbench

There is two tab instead of one.
See: https://buildroot.org/downloads/manual/manual.html#_config_files

Also it's recommended to use utils/check-package script.
See: https://buildroot.org/downloads/manual/manual.html#_tips_and_tricks

> diff --git a/package/unixbench/unixbench b/package/unixbench/unixbench
> new file mode 100644
> index 0000000000..01412efbb4
> --- /dev/null
> +++ b/package/unixbench/unixbench
> @@ -0,0 +1,3 @@
> +#!/bin/bash

unixbench script needs bash interpreter here.
sh should be enough.

> +cd /usr/lib/unixbench
> +exec ./Run "${@}"

Why "Run" can't be used outside of /usr/lib/unixbench ?

> diff --git a/package/unixbench/unixbench.hash b/package/unixbench/unixbench.hash
> new file mode 100644
> index 0000000000..ccec430c66
> --- /dev/null
> +++ b/package/unixbench/unixbench.hash
> @@ -0,0 +1,2 @@
> +# sha256 locally computed
> +sha256 1677dcdcbed78805848b3c3fd58a6d052b677b6a4ee7add4db74acc4d3364a79 unixbench-070030e09f6effdf0c6721e8fcc3a5c6fb5bed1a.tar.gz

Add a hash for the LICENSE.txt file.

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

Add a comment to explain why you are using this specific hash.
> +UNIXBENCH_VERSION = 070030e09f6effdf0c6721e8fcc3a5c6fb5bed1a
> +UNIXBENCH_SITE = $(call github,kdlucas,byte-unixbench,$(UNIXBENCH_VERSION))
> +UNIXBENCH_LICENSE = GPL-2.0
> +UNIXBENCH_LICENSE_FILE = LICENSE.txt
> +
> +# UnixBench tries to compile its binaries regargless of them being compiled
> +# or not. The patch will disable that since we may not always have a compiler
> +# onboard.
> +
> +# set UB_GCC_OPTIONS to default optimization from UnixBench (Line #88 in makefile).
> +# cross compilation fails if UnixBench makefile tries to detect
> +# architecture and OS. This is due to cross compiler not supporting
> +# 'native' value for -march and -mtune flags.
> +define UNIXBENCH_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) \
> +	$(MAKE) \
> +		CC="$(TARGET_CC)" -C $(@D)/UnixBench \
> +		UB_GCC_OPTIONS="$(TARGET_CFLAGS)"
> +endef
> +
> +# UnixBench doesn't have any install script of its own. Since $(INSTALL)
> +# cannot copy whole directories, we have to copy files and then chmod them.
> +define UNIXBENCH_INSTALL_TARGET_CMDS
> +	mkdir -p $(TARGET_DIR)/usr/lib/unixbench
> +	cp -a $(@D)/UnixBench/{pgms,results,testdir,tmp,Run} $(TARGET_DIR)/usr/lib/unixbench/

I only see pgms, testdir and Run inside UnixBench directory.
testdir doesn't seems useful on the target.

results and tmp are probably generated while building unixbench package.

Best regards,
Romain

> +	chmod -R 0755 $(TARGET_DIR)/usr/lib/unixbench
> +	$(INSTALL) -D -m 0755 $(UNIXBENCH_PKGDIR)/unixbench $(TARGET_DIR)/usr/bin/unixbench
> +endef
> +
> +$(eval $(generic-package))
> 
