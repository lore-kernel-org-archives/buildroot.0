From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 20 Nov 2013 23:12:53 +0100
Subject: [Buildroot] [PATCH 1/3] ccache: change compilercheck to use
 compiler and toolchain info
In-Reply-To: <1383188064-2380-2-git-send-email-danomimanchego123@gmail.com>
References: <1383188064-2380-1-git-send-email-danomimanchego123@gmail.com>
 <1383188064-2380-2-git-send-email-danomimanchego123@gmail.com>
Message-ID: <528D33E5.2080004@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 31/10/13 03:54, Danomi Manchego wrote:
> When CCACHE_COMPILERCHECK is set to "none", then ccache can be fooled in certain
> circumstances, resulting in using objects compiled with, say, the wrong toolchain.
> (This was discovered when compiling kmod from the same project, but with different
> external toolchains.)
>
> So let's try to make ccache use as safe as possible:
>
> - Use "%compiler% -v" in CCACHE_COMPILERCHECK to capture changes purely in an
>    externally provided toolchain.  See CCACHE_COMPILERCHECK and wrapper sections
>    at http://ccache.samba.org/manual.html for more info.

  As I said in the previous discussion, this makes the ccache almost 
useless unless absolute paths are filtered out from the output. Or am I 
mistaken?

>
> - Additionally, use the hash of part of the .config to describe toolchain and
>    C-library configuration that cannot be captured by the -v output:
>
>    + Use first section of .config, "Target Architecture" - "1,/^# Commands/", to
>      capture arch/cpu settings built into the external toolchain wrapper (for when
>      external toolchain it used) and the toolchain/c-library compilation settings
>      (for when toolchain is built).
>
>    + Use "Toolchain" section of .config - "/^\# Toolchain/,/^\# System config/",
>      for additional toolchain settings.
>
>    + Filter out blanks, comments, and dont-care stuff, then sort, to try to make
>      immune to minor kconfig organizational changes.

  If we're going to change this again, it should really be perfect this 
time :-) so let's analyse it carefully.

  The compiler that is called can be one of the following: HOSTCC, 
HOSTCXX, TARGET_CC, TARGET_CXX, or some other cross-tool that is called 
through CROSS_COMPILE. The last one we can safely ignore because ccache 
doesn't do anything with non-C-code. CC and CXX we can safely treat the 
same, because ccache always includes the basename into the hash. So we 
just have to support HOSTCC and TARGET_CC.

  For HOSTCC, mtime and %compiler% -v are probably equally good. mtime 
would be preferred, because it's much faster.

  For TARGET_CC, we again have several situations:

* Predefined external toolchain: the hash of the selected toolchain + the 
options passed when compiling the wrapper are enough. Since the latter 
also depend exclusively on the toolchain config options, hashing those is 
probably sufficient. Note that it doesn't really matter if the toolchain 
is preinstalled or downloaded (assuming the preinstalled one is the 
correct one).

* Custom external toolchain: we can assume that mtime of the real 
toolchain (not the wrapper) is pretty accurate here (when combined with 
the options embedded in the external toolchain wrapper). %compiler% -v 
doesn't work well, because it contains an absolute path to the 
lto-wrapper so its hash depends on where you extract the toolchain - if 
it's a downloaded toolchain, it will be different for different output 
directories. Purely the hash of the toolchain options doesn't work very 
well because the toolchain may be changed externally while staying in the 
same location (URL or path).

* Buildroot toolchain: in most cases, the arch and toolchain options 
(gcc, uclibc, binutils, elf2flt) accurately determine the compiler hash. 
There is one exception: when something changes in buildroot itself 
(adding a gcc patch, changing the way the compiler is built, ...), this 
will not be detected. But I think we can assume that a buildroot 
developer who is busy with that is smart enough to clean the cache. 
%compiler% -v doesn't work because it contains paths to the output 
directory and buildroot's git hash. mtime doesn't work because it changes 
every time the compiler is rebuilt.

To summarize, the ideal hash for each case is:

host gcc: mtime or %compiler% -v

predefined external toolchain: toolchain choice + wrapper options

custom external toolchain: mtime of real toolchain + wrapper options

buildroot toolchain: toolchain options


  So, how can we make optimal use of this? For the target toolchain, we 
can pre-compute the required information and set CCACHE_COMPILERCHECK to 
'echo $(TOOLCHAIN_HASH)'. That means we loose caching for the host 
packages, but has no other adverse effects.

  The stupid thing is that we know exactly what the compiler hash is at 
the time that we call ccache. So an even better solution would be if 
ccache had a way to pass options on the command line, so we can pass a 
different hash depending on which compiler is called.

  One more option is to always generate a wrapper, also for the internal 
toolchain. That one can set CCACHE_EXTRAFILES to a file that contains the 
toolchain options, and set CCACHE_COMPILERCHECK to none. The external 
toolchain wrapper could similarly be extended to call ccache instead of 
the compiler - and then it can just use mtime. And for the host compiler 
nothing needs to be done, it can just default to mtime.

  Does this sound more or less sane?

  Regards,
  Arnout

>
> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
>
> ---
>
> Mailing list thread: http://lists.busybox.net/pipermail/buildroot/2013-April/070819.html
> ---
>   package/ccache/ccache.mk |   25 ++++++++++++++++++++++++-
>   1 file changed, 24 insertions(+), 1 deletion(-)
>
> diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
> index 82a53f3..9ad5129 100644
> --- a/package/ccache/ccache.mk
> +++ b/package/ccache/ccache.mk
> @@ -26,13 +26,36 @@ HOST_CCACHE_CONF_OPT += ccache_cv_zlib_1_2_3=no
>   #    is already used by autotargets for the ccache package.
>   #    BUILDROOT_CACHE_DIR is exported by Makefile based on config option
>   #    BR2_CCACHE_DIR.
> +#
>   #  - ccache shouldn't use the compiler binary mtime to detect a change in
>   #    the compiler, because in the context of Buildroot, that completely
>   #    defeats the purpose of ccache. Of course, that leaves the user
>   #    responsible for purging its cache when the compiler changes.
> +#
> +#    But let's try to make ccache use as safe as possible.  Let's use
> +#    "%compiler% -v" in CCACHE_COMPILERCHECK to capture changes in external
> +#    toolchains.  See CCACHE_COMPILERCHECK and wrapper sections at
> +#    http://ccache.samba.org/manual.html for more info.
> +#
> +#    Additionally, use the hash of part of the .config to describe toolchain and
> +#    C-library configuration that cannot be captured by the compiler's -v output:
> +#
> +#    + Use first section of .config, "Target Architecture" - "1,/^# Commands/", to
> +#      capture arch/cpu settings built into the external toolchain wrapper (for when
> +#      external toolchain it used) and the toolchain/c-library compilation settings
> +#      (for when toolchain is built).
> +#
> +#    + Use "Toolchain" section of .config - "/^\# Toolchain/,/^\# System config/",
> +#      for additional toolchain settings.
> +#
> +#    + Filter out blanks, comments, and dont-care stuff, then sort, to try to make
> +#      immune to minor kconfig organizational changes.
>   define HOST_CCACHE_PATCH_CONFIGURATION
>   	sed -i 's,getenv("CCACHE_DIR"),getenv("BUILDROOT_CACHE_DIR"),' $(@D)/ccache.c
> -	sed -i 's,getenv("CCACHE_COMPILERCHECK"),"none",' $(@D)/ccache.c
> +	sed -n '1,/^# Commands/p; /^\# Toolchain/,/^\# System config/p' $(BUILDROOT_CONFIG) | \
> +		grep -v -e '^$$' -e '^\#' -e GDB -e ECLIPSE | \
> +		sort > $(STAMP_DIR)/ccache-toolchain-config
> +	sed -i "s,getenv(\"CCACHE_COMPILERCHECK\"),\"%compiler% -v; echo \'$$(md5sum < $(STAMP_DIR)/ccache-toolchain-config)\'\"," $(@D)/ccache.c
>   endef
>
>   HOST_CCACHE_POST_CONFIGURE_HOOKS += \
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
