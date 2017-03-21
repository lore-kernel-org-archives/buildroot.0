From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 21 Mar 2017 17:24:34 +0100
Subject: [Buildroot] [git commit] Makefile: add check of binaries
	architecture
In-Reply-To: <20170320212621.499227FB10@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Mon, 20 Mar 2017 22:22:22 +0100")
References: <20170320212621.499227FB10@busybox.osuosl.org>
Message-ID: <877f3imwcd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=bbb7f6c16cd5ff04ec9b78713f42ea53a940529f
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > As shown recently by the firejail example, it is easy to miss that a
 > package builds and installs binaries without actually cross-compiling
 > them: they are built for the host architecture instead of the target
 > architecture.

 > This commit adds a small helper script, check-bin-arch, called as a
 > GLOBAL_INSTRUMENTATION_HOOKS at the end of the target installation of
 > each package, to verify that the files installed by this package have
 > been built for the correct architecture.

 > Being called as a GLOBAL_INSTRUMENTATION_HOOKS allows the build to error
 > out right after the installation of the faulty package, and therefore
 > get autobuilder error detection properly assigned to this specific
 > package.

 > Example output with the firejail package enabled, when building for an
 > ARM target:

 > ERROR: architecture for ./usr/lib/firejail/libconnect.so is Advanced Micro Devices X86-64, should be ARM
 > ERROR: architecture for ./usr/bin/firejail is Advanced Micro Devices X86-64, should be ARM
 > ERROR: architecture for ./usr/lib/firejail/libtrace.so is Advanced Micro Devices X86-64, should be ARM
 > ERROR: architecture for ./usr/lib/firejail/libtracelog.so is Advanced Micro Devices X86-64, should be ARM
 > ERROR: architecture for ./usr/lib/firejail/ftee is Advanced Micro Devices X86-64, should be ARM
 > ERROR: architecture for ./usr/lib/firejail/faudit is Advanced Micro Devices X86-64, should be ARM
 > ERROR: architecture for ./usr/bin/firemon is Advanced Micro Devices X86-64, should be ARM
 > ERROR: architecture for ./usr/bin/firecfg is Advanced Micro Devices X86-64, should be ARM

 > Many thanks to Yann E. Morin and Arnout Vandecappelle for their reviews
 > and suggestions.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > ---
 >  package/pkg-generic.mk         | 11 +++++++++
 >  support/scripts/check-bin-arch | 52 ++++++++++++++++++++++++++++++++++++++++++
 >  2 files changed, 63 insertions(+)

 > diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
 > index e8a8021..dd8a1e2 100644
 > --- a/package/pkg-generic.mk
 > +++ b/package/pkg-generic.mk
 > @@ -87,6 +87,17 @@ define step_pkg_size
 >  endef
 >  GLOBAL_INSTRUMENTATION_HOOKS += step_pkg_size
 
 > +# Relies on step_pkg_size, so must be after
 > +define check_bin_arch
 > +	$(if $(filter end-install-target,$(1)-$(2)),\
 > +		support/scripts/check-bin-arch -p $(3) \
 > +			-l $(BUILD_DIR)/packages-file-list.txt \
 > +			-r $(TARGET_READELF) \
 > +			-a $(BR2_READELF_ARCH_NAME))
 > +endef
 > +
 > +GLOBAL_INSTRUMENTATION_HOOKS += check_bin_arch
 > +
 >  # This hook checks that host packages that need libraries that we build
 >  # have a proper DT_RPATH or DT_RUNPATH tag
 >  define check_host_rpath
 > diff --git a/support/scripts/check-bin-arch b/support/scripts/check-bin-arch
 > new file mode 100755
 > index 0000000..2c619ad
 > --- /dev/null
 > +++ b/support/scripts/check-bin-arch
 > @@ -0,0 +1,52 @@
 > +#!/bin/bash
 > +
 > +while getopts p:l:r:a: OPT ; do
 > +	case "${OPT}" in
 > +	p) package="${OPTARG}";;
 > +	l) pkg_list="${OPTARG}";;
 > +	r) readelf="${OPTARG}";;
 > +	a) arch_name="${OPTARG}";;
 > +	:) error "option '%s' expects a mandatory argument\n" "${OPTARG}";;
 > +	\?) error "unknown option '%s'\n" "${OPTARG}";;
 > +	esac
 > +done
 > +
 > +if test -z "${package}" -o -z "${pkg_list}" -o -z "${readelf}" -o -z "${arch_name}" ; then
 > +	echo "Usage: $0 -p <pkg> -l <pkg-file-list> -r <readelf> -a <arch name>"
 > +	exit 1
 > +fi
 > +
 > +exitcode=0
 > +
 > +pkg_files=$(sed -r -e "/^${package},(.+)$/!d; s//\1/;" ${pkg_list})
 > +
 > +for f in ${pkg_files} ; do

Sorry for the late response (nice feature!), but doesn't this get very
confused if any package ever install any files with spaces or special
characters?

That presumably doesn't happen often, but it could. E.G. If I check
/usr/share on my (Debian) laptop:

find /usr/share -name '* *'
/usr/share/cmake-3.7/Help/generator/Sublime Text 2.rst
/usr/share/cmake-3.7/Help/generator/MinGW Makefiles.rst
/usr/share/cmake-3.7/Help/generator/Green Hills MULTI.rst
/usr/share/cmake-3.7/Help/generator/Visual Studio 8 2005.rst
/usr/share/cmake-3.7/Help/generator/Visual Studio 11 2012.rst
/usr/share/cmake-3.7/Help/generator/Visual Studio 14 2015.rst
/usr/share/cmake-3.7/Help/generator/Visual Studio 9 2008.rst
/usr/share/cmake-3.7/Help/generator/Visual Studio 12 2013.rst
/usr/share/cmake-3.7/Help/generator/MSYS Makefiles.rst
/usr/share/cmake-3.7/Help/generator/Watcom WMake.rst
/usr/share/cmake-3.7/Help/generator/Unix Makefiles.rst
/usr/share/cmake-3.7/Help/generator/Borland Makefiles.rst
/usr/share/cmake-3.7/Help/generator/Visual Studio 10 2010.rst
/usr/share/cmake-3.7/Help/generator/Visual Studio 7 .NET 2003.rst
/usr/share/cmake-3.7/Help/generator/Visual Studio 6.rst
/usr/share/cmake-3.7/Help/generator/Visual Studio 15 2017.rst
/usr/share/cmake-3.7/Help/generator/NMake Makefiles JOM.rst
/usr/share/cmake-3.7/Help/generator/NMake Makefiles.rst
/usr/share/cmake-3.7/Help/generator/Visual Studio 7.rst
/usr/share/cmake-3.7/Help/generator/Eclipse CDT4.rst
/usr/share/games/supertuxkart/data/ttf/SIL Open Font License.txt
/usr/share/games/supertuxkart/data/tracks/xr591/tube 1.b3d
/usr/share/games/supertuxkart/data/tracks/xr591/tube 2.b3d
/usr/share/games/supertuxkart/data/tracks/overworld/Mushroom 1.png
/usr/share/games/supertuxkart/data/tracks/overworld/Mushroom 2 side.png
/usr/share/games/supertuxkart/data/tracks/overworld/Mushroom 7.png
/usr/share/games/supertuxkart/data/tracks/overworld/Mushroom 3 side.png
/usr/share/games/supertuxkart/data/tracks/overworld/Mushroom 3.png
/usr/share/games/supertuxkart/data/tracks/overworld/Mushroom 7 side.png
/usr/share/games/supertuxkart/data/tracks/overworld/Mushroom 1 side.png
/usr/share/games/supertuxkart/data/tracks/overworld/Mushroom 2.png
/usr/share/games/supertuxkart/data/tracks/snowmountain/konqi eye.png
/usr/share/games/supertuxkart/data/tracks/mansion/konqi eye.png
/usr/share/games/supertuxkart/data/karts/sara_the_wizard/sara the wizard.b3d
/usr/share/games/supertuxkart/data/karts/sara_the_racer/sara the racer.b3d
/usr/share/games/supertuxkart/data/karts/konqi/konqiV2 wheel texture.png
/usr/share/games/supertuxkart/data/karts/konqi/konqiV1 shadow.png
/usr/share/games/supertuxkart/data/karts/konqi/konqi vehicle texture up1.png
/usr/share/games/supertuxkart/data/karts/konqi/konqi eye.png

I'm not sure what the best way of fixing this is. We could either play
with IFS or translate \n -> \0 and use xargs -0. Yann, any ideas?

-- 
Bye, Peter Korsgaard
