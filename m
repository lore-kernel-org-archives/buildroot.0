From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Mar 2017 22:51:21 +0100
Subject: [Buildroot] [PATCH] libsidplay2: fix build on ppc64le by not
 autoreconfiguring
In-Reply-To: <1488401026-27933-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1488401026-27933-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20170301225121.0f20f9a9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  1 Mar 2017 21:43:46 +0100, Thomas Petazzoni wrote:
> The libsidplay2 package build system is completely broken. It is made
> of a top-level configure script, which calls into sub-configure
> scripts in sub-directories. However, since it doesn't use the autoconf
> provided AC_CONFIG_SUBDIRS() mechanism, an "autoreconf" doesn't
> recurse into the subdirectories.
> 
> Due to this, the aclocal.m4 in the libsidplay/ subdirectory doesn't
> get re-generated when Buildroot autoreconfs the package. However,
> since we patch one of the .m4 files in this subdirectory, when build
> time comes, the package notices its aclocal.m4 is older than one of
> the .m4 file, and triggers an automatic autoreconf.
> 
> Since <pkg>_AUTORECONF = YES is enabled, this automatic autoreconf
> works fine: host-autoconf and host-automake are available.
> 
> Expect that on powerpc64le, we patch the configure script itself to
> make it recognize powerpc64le. But this patching of the configure
> script itself gets overwritten by the automatic autoreconf at the
> beginning of the build step, causing the build to fail on powerpc64le.
> 
> Switching to AC_CONFIG_SUBDIRS() would allow to fix this, but
> libsidplay2 needs to pass custom configure options to each of the
> sub-configure scripts, something that AC_CONFIG_SUBDIRS() doesn't
> support. And since libsidplay2 upstream looks completely dead, the
> incentive to fix the whole thing is very limited.
> 
> Since what's broken is the autoreconfiguration of the package, what we
> do is modify patch 0001-sidplay2-libs-2.1.1.patch to directly tweak the
> configure script (instead of the relevant .m4 file). Thanks to this,
> <pkg>_AUTORECONF = YES is no longer needed, the .m4 file is no longer
> newer than the sub-configure script, and no automatic autoreconf
> triggers at build time. This allows the package to build properly on
> powerpc64le.
> 
> While we normally don't like patching 'configure' scripts directly, in
> this case the size of the change in the configure script is very small,
> and as explained above, the incentive to fix the package properly is
> very limited.
> 
> In detail, the changes:
> 
>  * Patch 0001-sidplay2-libs-2.1.1.patch is turned into a Git-formatted
>    patch
> 
>  * The irrelevant changes to Makefile.in files, aclocal.m4, config.h.in,
>    sidint.h are removed.
> 
>  * The change to my_macros.m4 is applied directly to the corresponding
>    configure script.
> 
>  * The change to the configure.ac script regarding libdir is applied
>    directly to the corresponding configure script.
> 
>  * The change to the configure.ac script regarding "*-k*bsd*-gnu" is
>    dropped, since we don't care about kFreeBSD support.
> 
>  * LIBSIDPLAY2_AUTORECONF = YES is dropped from the .mk file.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/1f6a42bfece24e09c9c7f4078d549ec5c099c89d/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/libsidplay2/0001-sidplay2-libs-2.1.1.patch | 254 ++++++---------------
>  package/libsidplay2/libsidplay2.mk                 |   1 -
>  2 files changed, 75 insertions(+), 180 deletions(-)

Applied to master, thanks. Peter, this is a build fix, maybe we want it
for the LTS, even though I agree it only affects ppc64le, so it's maybe
not important enough.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
