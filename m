From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 9 Dec 2020 23:50:10 +0100
Subject: [Buildroot] [PATCH/next v1 1/2] package/ninja: bump version to
 1.10.2
In-Reply-To: <20201205212830.6cb9158d@windsurf.home>
References: <20201202194236.1751-1-ps.report@gmx.net>
 <20201205212830.6cb9158d@windsurf.home>
Message-ID: <20201209235010.5105b11c@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Sat, 5 Dec 2020 21:28:30 +0100, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> On Wed,  2 Dec 2020 20:42:35 +0100
> Peter Seiderer <ps.report@gmx.net> wrote:
>
> > - rebased 0001-set-minimum-cmake-version-to-3.10.patch
> >
> > - removed 0002-remove-fdiagnostics-color-from-make-command.patch
> >   (superseeded by upstream commit [1])
> >
> > - rebased package/ninja/0003-CMake-fix-object-library-usage.patch
> >
> > [1] https://github.com/ninja-build/ninja/commit/418d59b8a6054ce9ef1a28c07c41d3a0bb386836
> >
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > ---
> >  ...01-set-minimum-cmake-version-to-3.10.patch | 20 +++---
> >  ...fdiagnostics-color-from-make-command.patch | 29 --------
> >  .../0003-CMake-fix-object-library-usage.patch | 67 ++++++++++---------
> >  package/ninja/ninja.hash                      |  4 +-
> >  package/ninja/ninja.mk                        |  2 +-
> >  5 files changed, 49 insertions(+), 73 deletions(-)
> >  delete mode 100644 package/ninja/0002-remove-fdiagnostics-color-from-make-command.patch
>
> Both applied. Could you keep an eye of meson-based package failures in
> the coming days? Updates of Meson have had a tendency to break stuff a
> bit in the past. Thanks!

No breakage detected (yet?), the only new feature is the following
deprecation warning:

	DEPRECATION: c_args in the [properties] section of the machine file is deprecated, use the [built-in options] section.
	DEPRECATION: c_link_args in the [properties] section of the machine file is deprecated, use the [built-in options] section.
	DEPRECATION: cpp_args in the [properties] section of the machine file is deprecated, use the [built-in options] section.
	DEPRECATION: cpp_link_args in the [properties] section of the machine file is deprecated, use the [built-in options] section.


Which can be fixed by the following patch:

--- a/package/meson/cross-compilation.conf.in
+++ b/package/meson/cross-compilation.conf.in
@@ -14,13 +14,15 @@ g-ir-scanner = '@STAGING_DIR@/usr/bin/g-ir-scanner'

 [properties]
 needs_exe_wrapper = true
+sys_root = '@STAGING_DIR@'
+pkg_config_libdir = '@STAGING_DIR@/usr/lib/pkgconfig:@STAGING_DIR@/usr/share/pkgconfig'
+pkg_config_static = '@STATIC@'
+
+[built-in options]
 c_args = [@TARGET_CFLAGS@]
 c_link_args = [@TARGET_LDFLAGS@]
 cpp_args = [@TARGET_CXXFLAGS@]
 cpp_link_args = [@TARGET_LDFLAGS@]
-sys_root = '@STAGING_DIR@'
-pkg_config_libdir = '@STAGING_DIR@/usr/lib/pkgconfig:@STAGING_DIR@/usr/share/pkgconfig'
-pkg_config_static = '@STATIC@'

 [host_machine]
 system = 'linux'


Regards,
Peter

>
> Thomas
