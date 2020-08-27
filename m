From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 27 Aug 2020 23:18:41 +0200
Subject: [Buildroot] [PATCH] package/gnuradio: backport patch to fix
 INTERFACE_INCLUDE_DIRECTORIES
In-Reply-To: <20200827154903.1107968-1-gwenj@trabucayre.com>
References: <20200827154903.1107968-1-gwenj@trabucayre.com>
Message-ID: <20200827231841.2c970ae9@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 27 Aug 2020 17:49:03 +0200
Gwenhael Goavec-Merou <gwenj@trabucayre.com> wrote:

> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> gnuradio-runtimeTargets.cmake and gnuradio-pmtTargets.cmake are filled
> using CMAKE_INSTALL_PREFIX for INSTALL_INTERFACE.
> 
> Since CMAKE_INSTALL_PREFIX, in buildroot, is set to /usr, these files contains
> path to host system.
> 
> With BR2_COMPILER_PARANOID_UNSAFE_PATH package using gnuradio fails with:
> arm-linux-gnueabihf-g++: ERROR: unsafe header/library path used in cross-compilation: '-isystem' '/usr/include'
> 
> By simply providing 'include', produced .cmake contains:
> INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
> instead of
> INTERFACE_INCLUDE_DIRECTORIES "/usr/include"
> 
> [Upstream status: https://github.com/gnuradio/gnuradio/pull/3737]
> 
> Fix (many) gr-osmosdr build failure:
> - http://autobuild.buildroot.net/results/66b76c07f15bb3e6db697c47796ae3dd15ecf4b9/
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

I've applied to master, but I have a comment below.

> diff --git a/package/gnuradio/0003-gnuradio-runtime_pmt-dont-hardcode-INTERFACE_INCLUDE_DIRECTORIES.patch b/package/gnuradio/0003-gnuradio-runtime_pmt-dont-hardcode-INTERFACE_INCLUDE_DIRECTORIES.patch
> new file mode 100644
> index 0000000000..6b8987fa5f
> --- /dev/null
> +++ b/package/gnuradio/0003-gnuradio-runtime_pmt-dont-hardcode-INTERFACE_INCLUDE_DIRECTORIES.patch
> @@ -0,0 +1,57 @@
> +From 84dea8284c521f08508bb2dcbc99db3b5d3438fd Mon Sep 17 00:00:00 2001
> +From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> +Date: Thu, 27 Aug 2020 17:32:09 +0200
> +Subject: [PATCH] gnuradio-runtime_pmt: dont hardcode
> + INTERFACE_INCLUDE_DIRECTORIES
> +
> +gnuradio-runtimeTargets.cmake and gnuradio-pmtTargets.cmake are filled
> +using CMAKE_INSTALL_PREFIX for INSTALL_INTERFACE.
> +
> +Since CMAKE_INSTALL_PREFIX, in buildroot, is set to /usr, these files contains
> +path to host system.
> +
> +With BR2_COMPILER_PARANOID_UNSAFE_PATH package using gnuradio fails with:
> +arm-linux-gnueabihf-g++: ERROR: unsafe header/library path used in cross-compilation: '-isystem' '/usr/include'

When you submit patches upstream, I recommend you to not mention
Buildroot or Buildroot-specific things in the commit logs. This often
makes upstream maintainers think that Buildroot is special, while here
the problem is general.

A better phrasing would have been something along those lines:

"""
When cross-compiling, it is normal to set CMAKE_INSTALL_PREFIX to /usr,
since gnuradio will be installed and executed from /usr on the target.

However, due to INSTALL_INTERFACE using CMAKE_INSTALL_PREFIX, an
-isystem /usr/include option is added by CMake when building gnuradio,
which is incorrect as at build time, the /usr/include headers are the
ones of the build machine, not the one of the target platform we're
cross-compiling for.
"""

This says the same thing, but without being Buildroot specific: it's a
general cross-compilation issue.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
