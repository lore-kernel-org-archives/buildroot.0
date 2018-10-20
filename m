From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 20 Oct 2018 12:49:58 +0200
Subject: [Buildroot] [PATCH v7 1/4] toolchain/toolchain-wrapper: add
 BR2_RELRO_
In-Reply-To: <1537219312-59962-2-git-send-email-matthew.weber@rockwellcollins.com>
 (Matt Weber's message of "Mon, 17 Sep 2018 16:21:49 -0500")
References: <1537219312-59962-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1537219312-59962-2-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <87o9boevu1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matt" == Matt Weber <matthew.weber@rockwellcollins.com> writes:

 > The RELRO/PIE flags are currently passed via CFLAGS/LDFLAGS and this patch
 > proposes moving them to the toolchain wrapper.

 >  (1) The flags should _always_ be passed, without leaving the possibility
 >      for any package to ignore them. I.e, when BR2_RELRO_FULL=y is used
 >      in a build, all executables should be built PIE. Passing those
 >      options through the wrapper ensures they are used during the build
 >      of all packages.

 >  (2) Some options are incompatible with -fPIE. For example, when
 >      building object files for a shared libraries, -fPIC is used, and
 >      -fPIE shouldn't be used in combination with -fPIE. Similarly, -r
 >      or -static are directly incompatible as they are different link
 >      time behaviors then the intent of PIE. Passing those options
 >      through the wrapper allows to add some "smart" logic to only pass
 >      -fPIE/-pie when relevant.

 >  (3) Some toolchain, kernel and bootloader packages may want to
 >      explicitly disable PIE in a build where the rest of the userspace
 >      has intentionally enabled it. The wrapper provides an option
 >      to key on the -fno-pie/-no-pie and bypass the appending of RELRO
 >      flags.
 >      The current Kernel and U-boot source trees include this option.
 >      https://github.com/torvalds/linux/commit/8438ee76b004ef66d125ade64c91fc128047d244
 >      https://github.com/u-boot/u-boot/commit/6ace36e19a8cfdd16ce7c02625edf36864897bf5
 >      If using PIE with a older Kernel and/or U-boot version, a backport of these
 >      changes  might be required. However this patchset also uses the
 >      __KERNEL__ and __UBOOT__ defines as a way to disable PIE.

 > NOTE: The current implementation via CFLAGS/LDFLAGS is has caused some
 > build time failures as the conditional logic doesn't yet exist in
 > Buildroot.
 > https://bugs.busybox.net/show_bug.cgi?id=11206
 > https://bugs.busybox.net/show_bug.cgi?id=11321

 > Good summary of the most common build failures related to
 > enabling pie. https://wiki.ubuntu.com/SecurityTeam/PIE

 > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>

 > ---
 > Changes
 > v6 -> v7
 >  - Fixed rebase error with a stray endif

 > v5 -> v6
 > [Thomas
 >  - Fixed commit logs description to describe the change
 >  - Moved relro partial options to wrapper and updated this commit
 >    title to make the patch generically capture the move of _RELRO_
 >  - Added comment to wrapper and commit about use of no-pie
 >  - Added a comment in the wrapper and above to cover conversation on
 >    Linux kernel and uboot no-pie fix-ups. Plus added a condition
 >    checking for the __KERNEL__ and __UBOOT__ defines
 >  - Add comment that -fPIE and -pie can interchangeably be used during
 >    link/compile and are correctly ignored when not used.

 > [Arnout
 >  - Collapsed the -pie conditional in the wrapper to be within the
 >    check for use of -fPIE. Also resolves missing -Wl,-r in the -fPIE loop
 >  - Removed specfile and consolidated into just the gcc frontend wrapper

 > v4 -> v5
 >  - Found -r can also be -wl,r. Wrapper has been updated to cover
 >    that case.
 > v3 -> v4
 > [Matt W
 >  - Added no-pie/pic options to allow per package tweaking of
 >    wrapper setting the option.  This lines up with other distros
 > [Arnout
 >  - After realizing that a LD invocation doesn't use the specfile,
 >    I agree with Arnout and have tested the solution can completely
 >    occur within the compiler wrapper. This version updates to just
 >    have modifications in the wrapper.

 > v2 -> v3
 >  - Fell back on a linker approach using a spec file and kept compiler
 >    flag tweaks in the wrapper

 > v1 -> v2
 >  - Reworked handling of pie/pic/shared to replace each time they
 >    occur with a dummy string and then insert the right combination
 >    when rebuilding the exec string.
 >  - Fixed mix of tabs and spaces
 >  - Swapped order of shared and pie.  Originally coded it backwards.
 > ---
 >  package/Makefile.in            | 11 ------
 >  toolchain/toolchain-wrapper.c  | 82 ++++++++++++++++++++++++++++++++++++++++--
 >  toolchain/toolchain-wrapper.mk |  6 ++++
 >  3 files changed, 86 insertions(+), 13 deletions(-)

 > diff --git a/package/Makefile.in b/package/Makefile.in
 > index abfdb81..cd21482 100644
 > --- a/package/Makefile.in
 > +++ b/package/Makefile.in
 > @@ -141,9 +141,6 @@ ifeq ($(BR2_DEBUG_3),y)
 >  TARGET_DEBUGGING = -g3
 >  endif
 
 > -TARGET_CFLAGS_RELRO = -Wl,-z,relro
 > -TARGET_CFLAGS_RELRO_FULL = -Wl,-z,now $(TARGET_CFLAGS_RELRO)
 > -
 >  TARGET_LDFLAGS = $(call qstrip,$(BR2_TARGET_LDFLAGS))
 
 >  ifeq ($(BR2_SSP_REGULAR),y)
 > @@ -154,14 +151,6 @@ else ifeq ($(BR2_SSP_ALL),y)
 >  TARGET_HARDENED += -fstack-protector-all
 >  endif
 
 > -ifeq ($(BR2_RELRO_PARTIAL),y)
 > -TARGET_HARDENED += $(TARGET_CFLAGS_RELRO)
 > -TARGET_LDFLAGS += $(TARGET_CFLAGS_RELRO)
 > -else ifeq ($(BR2_RELRO_FULL),y)
 > -TARGET_HARDENED += -fPIE $(TARGET_CFLAGS_RELRO_FULL)
 > -TARGET_LDFLAGS += -pie $(TARGET_CFLAGS_RELRO_FULL)
 > -endif
 > -
 >  ifeq ($(BR2_FORTIFY_SOURCE_1),y)
 >  TARGET_HARDENED += -D_FORTIFY_SOURCE=1
 >  else ifeq ($(BR2_FORTIFY_SOURCE_2),y)
 > diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
 > index c5eb813..153ba87 100644
 > --- a/toolchain/toolchain-wrapper.c
 > +++ b/toolchain/toolchain-wrapper.c
 > @@ -49,8 +49,12 @@ static char _date_[sizeof("-D__DATE__=\"MMM DD YYYY\"")];
 >   * 	-D__TIME__=
 >   * 	-D__DATE__=
 >   * 	-Wno-builtin-macro-redefined
 > + * 	-Wl,-z,now
 > + * 	-Wl,-z,relro
 > + * 	-fPIE
 > + * 	-pie
 >   */
 > -#define EXCLUSIVE_ARGS	6
 > +#define EXCLUSIVE_ARGS	10
 
 >  static char *predef_args[] = {
 >  #ifdef BR_CCACHE
 > @@ -236,7 +240,8 @@ int main(int argc, char **argv)
 >  	char *env_debug;
 >  	char *paranoid_wrapper;
 >  	int paranoid;
 > -	int ret, i, count = 0, debug;
 > +	int ret, i, j, count = 0, debug;
 > +	unsigned int found_shared = 0;

There is not really any specific reason why found_shared is unsigned, so
I've dropped that.


 >  	/* Calculate the relative paths */
 >  	basename = strrchr(progpath, '/');
 > @@ -363,6 +368,79 @@ int main(int argc, char **argv)
 >  		*cur++ = "-Wno-builtin-macro-redefined";
 >  	}
 
 > +#ifdef BR2_RELRO_FULL
 > +	/* Patterned after Fedora/Gentoo hardening approaches.
 > +	 * https://fedoraproject.org/wiki/Changes/Harden_All_Packages
 > +	 * https://wiki.gentoo.org/wiki/Hardened/Toolchain#Position_Independent_Executables_.28PIEs.29
 > +	 *
 > +	 * A few checks are added to enable disabling of PIE

enable disabling sounds quite confusing to me, so I've changed it to
"to allow disabling of PIE"

> +	 * 1) -fno-pie and -no-pie are used by other distros to disable PIE in
 > +	 *    cases where the compiler enables it by default. The logic below
 > +	 *    maintains that behavior.
 > +	 *         Ref: https://wiki.ubuntu.com/SecurityTeam/PIE
 > +	 * 2) A check for -fno-PIE has been used in older Linux Kernel builds
 > +	 *    in a similar way to -fno-pie or -no-pie.
 > +	 * 3) A check is added for Kernel and U-boot defines
 > +	 *    (-D__KERNEL__ and -D__UBOOT__).
 > +	 */
 > +	for (i = 1; i < argc; i++) {
 > +		/* Apply all incompatible link flag and disable checks first */
 > +		if (!strcmp(argv[i], "-r") ||
 > +		    !strcmp(argv[i], "-Wl,-r") ||
 > +		    !strcmp(argv[i], "-static") ||
 > +		    !strcmp(argv[i], "-D__KERNEL__") ||
 > +		    !strcmp(argv[i], "-D__UBOOT__") ||
 > +		    !strcmp(argv[i], "-fno-pie") ||
 > +		    !strcmp(argv[i], "-fno-PIE") ||
 > +		    !strcmp(argv[i], "-no-pie"))
 > +			break;
 > +		/* Record that shared was present which disables -pie but don't
 > +		 * break out of loop as a check needs to occur that possibly
 > +		 * still allows -fPIE to be set
 > +		 */
 > +		if (!strcmp(argv[i], "-shared"))
 > +			found_shared = 1;
 > +	}
 > +	if (i == argc) {

It would IMHO have been a bit clearer to add the found_shared / -fpie
logic here right after the check, but OK.


 > +		/* Compile and link condition checking have been kept split
 > +		 * between these two loops, as there maybe already valid

This also sounds a bit odd to me. I've added "are", E.G. "as there maybe
already are valid"


 > +		 * compile flags set for position independence. In that case
 > +		 * the wrapper just adds the -pie for link.
 > +		 */
 > +		for (j = 1; j < argc; j++) {

There is not really any reason to use a different loop iteration
variable than 'i' here, so I've dropped the 'j' variable.


> +			if (!strcmp(argv[j], "-fpie") ||
 > +			    !strcmp(argv[j], "-fPIE") ||
 > +			    !strcmp(argv[j], "-fpic") ||
 > +			    !strcmp(argv[j], "-fPIC"))
 > +				break;
 > +		}
 > +		/* Both args below can be set at compile/link time
 > +                 * and are ignored correctly when not used
 > +                 */

Indentation looks a bit odd here, fixed.

 > +#ifdef BR2_RELRO_FULL
 > +		*cur++ = "-Wl,-z,now";
 > +		*cur++ = "-Wl,-z,relro";
 > +#endif
 > +	}
 > +	

Trailing spaces.

Committed with these minor fixes, thanks.

-- 
Bye, Peter Korsgaard
