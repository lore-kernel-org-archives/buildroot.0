From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 31 Mar 2019 12:30:46 +0200
Subject: [Buildroot] [PATCH v2] package/unixbench: new package
In-Reply-To: <20190328192524.28352-1-itsatharva@gmail.com>
References: <20190328192524.28352-1-itsatharva@gmail.com>
Message-ID: <20190331103046.GB2587@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Atharva, All,

On 2019-03-29 00:55 +0530, Atharva Lele spake thusly:
> UnixBench tries to compile its binaries regargless of them being
> compiled or not. We patch it to disable this behaviour since
> we may not always have a compiler onboard.

This second iteration is pretty good, now. :-)
Sorry it took me a while to get at it...

You forgot to add (small) explanations for the unixbench wrapper you
install in /usr/bin/, for example:

    UnixBench installs a collection of many small executables, and
    a "Run" script that runs them in sequence. To avoid polluting
    /usr/bin, we install them all in /usr/lib/unixbench/ and add a
    small wrapper in /usr/bin/, not unlike what ArchLinux does.

> Signed-off-by: Atharva Lele <itsatharva@gmail.com>
> ---
> Changes v1 -> v2:
>   - fixed entry into DEVELOPERS files (suggested by Yann E. Morin)
>   - added commit log to .patch file (suggested by Yann, Romain)
>   - removed commented out lines (suggested by Yann, Romain)
>   - UnixBench now depends on having a MMU and selects Perl for
>     runtime (Suggested by Yann, Romain)
>   - added hash for LICENSE file (suggested by Yann, Romain)
>   - now makefile does not copy unnecessary directories onto target
>     (suggested by Romain)

Good changelog, thanks.

It is customary that, when you resend a patch, you inform the previous
reviewers. Add them as Cc: tags just below your signed-off-by line; git
send-email will notice and automatically add those in Cc of the mail:

    Signed-off-by: Atharva Lele <itsatharva@gmail.com>
    Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
    Cc: Romain Naour <romain.naour@gmail.com>

[--SNIP--]
> diff --git a/package/unixbench/0001-remove-make-check.patch b/package/unixbench/0001-remove-make-check.patch
> new file mode 100644
> index 0000000000..e8f5d683a1
> --- /dev/null
> +++ b/package/unixbench/0001-remove-make-check.patch
[--SNIP--]
> +diff --git a/UnixBench/Run b/UnixBench/Run
> +index b4abd26..e86a08a 100755
> +--- a/UnixBench/Run
> ++++ b/UnixBench/Run
> +@@ -875,13 +875,6 @@ sub preChecks {
> + 
> +     # Check that the required files are in the proper places.
> +     my $make = $ENV{MAKE} || "make";

Ideally, the two lines above could very well have been removed as well,
since $make is no longer used.

[--SNIP--]
> diff --git a/package/unixbench/Config.in b/package/unixbench/Config.in
> new file mode 100644
> index 0000000000..b2ba055bfb
> --- /dev/null
> +++ b/package/unixbench/Config.in
> @@ -0,0 +1,18 @@
> +config BR2_PACKAGE_UNIXBENCH
> +	bool "unixbench"
> +	depends on BR2_USE_MMU

This dependency on MMU is because of perl, so we indicate it as:

    depends on BR2_USE_MMU # perl

> +	select BR2_PACKAGE_PERL # runtime

Yes.

[--SNIP--]
> diff --git a/package/unixbench/unixbench.mk b/package/unixbench/unixbench.mk
> new file mode 100644
> index 0000000000..570ef6a75f
> --- /dev/null
> +++ b/package/unixbench/unixbench.mk
> @@ -0,0 +1,41 @@
> +################################################################################
> +#
> +# unixbench
> +#
> +################################################################################
> +
> +# The latest updates to the git tree of UnixBench enable setting compiler flags
> +# using make. They also fix various compiler warnings and update the makefile
> +# structure. The tree hasn't been updated since early 2018, and the binaries
> +# built from the latest commit have been stable.

All this blurb is not really interesting, in fact. What you could just
do, is add something in the commit log tthat explains why we use a git
sha1:

    Upstream has not made any release in the past 4 years or so, so use
    the latest commit on the master branch.

> +UNIXBENCH_VERSION = 070030e09f6effdf0c6721e8fcc3a5c6fb5bed1a
> +UNIXBENCH_SITE = $(call github,kdlucas,byte-unixbench,$(UNIXBENCH_VERSION))
> +UNIXBENCH_LICENSE = GPL-2.0
> +UNIXBENCH_LICENSE_FILE = LICENSE.txt
> +
> +# UnixBench tries to compile its binaries regargless of them being compiled
> +# or not. The patch will disable that since we may not always have a compiler
> +# onboard.

This comment is now unneeded, as it is explained in the patch itself,
and in the commit log.

> +# Auto detection would set CFLAGS for the host machine, using -march=native
> +# and -mtune=native which does not make sense for cross compilation, resulting
> +# in a failed compile. Setting UB_GCC_OPTIONS skips the detection process
> +# and forces CFLAGS we're interested in.

I'd have prefered that you explain this in the commit log, and that
you'd just use a simpler comment here:

    # Set CFLAGS in UB_GCC_OPTIONS to avoid faulty auto-detection.

> +define UNIXBENCH_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) \
> +	$(MAKE) \
> +		-C $(@D)/UnixBench \
> +		UB_GCC_OPTIONS="$(TARGET_CFLAGS)" \
> +		CC="$(TARGET_CC)"

In my twisted head, I find it would be more logical to specofy CC first,
and then its options. But there is no technical consequence, it's just
about "human" logic...

> +endef
> +
> +# Copy the compiled files into the proper location and install the binary.
> +# pgms stores binaries, results stores results, Run is the perl script to
> +# run the benchmark.

This is a bit overly verbose. The only intreresting part is:

    # pgms contains the individual test executables.

The rest is obvious by name.

No need to resend the patch for now, I guess.

> +define UNIXBENCH_INSTALL_TARGET_CMDS
> +	mkdir -p $(TARGET_DIR)/usr/lib/unixbench
> +	cp -a $(@D)/UnixBench/{pgms,results,Run} $(TARGET_DIR)/usr/lib/unixbench/
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
