From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 26 Nov 2018 22:26:08 +0100
Subject: [Buildroot] [PATCH 1/1] civetweb: bump version to 1.11
In-Reply-To: <20180925232917.24591-1-jfaith@impinj.com>
References: <20180925232917.24591-1-jfaith@impinj.com>
Message-ID: <20181126222608.1c378e62@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks a lot for your contribution, and sorry for the very slow
feedback. See below.

On Tue, 25 Sep 2018 23:29:42 +0000, John Faith wrote:
> v1.11 now has library and header install targets for use by apps
> that serve pages.  The config changes allow enabling the civetweb
> webserver app binary and/or libs and headers.
> 
> If the civetweb lib is enabled, the static lib will always be built
> and if BR2_STATIC_LIBS is not on, also build the shared object.
> The C++ interface option is automatic based on available C++ support.
> If both the library and server options are disabled, don't do a
> target install.
> 
> The civetweb Makefile sets -fPIC in CFLAGS when linking shared
> objects, but not when compiling the objects used in the library
> resulting in a link failure, so add -fPIC to COPT which is added
> to CFLAGS in its Makefile.
> 
> The typo patch has already been incorporated upstream, so it was
> removed.
> 
> Signed-off-by: John Faith <jfaith@impinj.com>
> ---
>  ...ua-fix-a-typo-changing-LFS_DIR-to-LFS_DIR.patch | 27 -----------------
>  package/civetweb/Config.in                         | 25 +++++++++++++++-
>  package/civetweb/civetweb.hash                     |  2 +-
>  package/civetweb/civetweb.mk                       | 34 +++++++++++++++++++---
>  4 files changed, 55 insertions(+), 33 deletions(-)
>  delete mode 100644 package/civetweb/0001-Lua-fix-a-typo-changing-LFS_DIR-to-LFS_DIR.patch

I have applied to next, after doing the following changes:

    [Thomas:
     - keep using "config", a "menuconfig" for just three sub-options is
       not relevant
     - move the BR2_PACKAGE_CIVETWEB_LIB option near the existing
       BR2_PACKAGE_CIVETWEB_SERVER option, since both allow to select what
       should be built/installed
     - remove BR2_PACKAGE_CIVETWEB_SHARED_LIB, the .mk file will use
       BR2_STATIC_LIBS/BR2_SHARED_LIBS/BR2_STATIC_SHARED_LIBS to know what
       to do
     - select BR2_PACKAGE_CIVETWEB_SERVER if BR2_PACKAGE_CIVETWEB_LIB is
       not enabled to ensure at least the server *or* the library is
       selected
     - introduce CIVETWEB_BUILD_TARGETS in the .mk file to properly use
       the appropriate make targets to build the server, static library
       and/or shared library
     - cleanup the use of CIVETWEB_INSTALL_TARGETS, and use it for both
       target and staging installation
     - factorize common installation options into a CIVETWEB_INSTALL_OPTS
       variable that is used for both the target and staging installation]

Thanks again!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
