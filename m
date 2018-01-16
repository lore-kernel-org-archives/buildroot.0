From: Guillermo A. Amaral <g@maral.me>
Date: Tue, 16 Jan 2018 10:05:56 -0800
Subject: [Buildroot] [PATCH 2/2] package/rpi-fbcp: Added package for
 Raspberry Pi
In-Reply-To: <20180116092633.668590e9@windsurf>
References: <20180116033450.6926-1-g@maral.me>
 <20180116033450.6926-2-g@maral.me>
 <20180116092633.668590e9@windsurf>
Message-ID: <20180116180556.GC28324@enterprise.starfleet>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Howdy,

I'll also update this patch too, thanks for taking a look.

I did try to contact the developer about a year ago (via GitHub) about
it. No luck.

I'll try via social media, maybe I can get him to BSD or MIT it and be
done with it.

Thanks again!

On Tue, Jan 16, 2018 at 09:26:33AM +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Mon, 15 Jan 2018 19:34:50 -0800, Guillermo A. Amaral wrote:
> > Raspberry Pi utility used to mirror primary framebuffer to secondary
> > framebuffer.
> > 
> > Signed-off-by: Guillermo A. Amaral <g@maral.me>
> > ---
> >  package/Config.in                                  |  1 +
> >  .../rpi-fbcp/0001-make-buildroot-friendly.patch    | 35 ++++++++++++++++++++++
> >  package/rpi-fbcp/Config.in                         | 13 ++++++++
> >  package/rpi-fbcp/rpi-fbcp.mk                       | 11 +++++++
> 
> Could you add an entry in the DEVELOPERS file for this package?
> 
> > diff --git a/package/rpi-fbcp/0001-make-buildroot-friendly.patch b/package/rpi-fbcp/0001-make-buildroot-friendly.patch
> > new file mode 100644
> > index 000000000..5f86f5af6
> > --- /dev/null
> > +++ b/package/rpi-fbcp/0001-make-buildroot-friendly.patch
> > @@ -0,0 +1,35 @@
> > +From 8218434aafd18f7a1f742bddeef10b8829d59f89 Mon Sep 17 00:00:00 2001
> > +From: "Guillermo A. Amaral" <g@maral.me>
> > +Date: Sun, 14 Jan 2018 15:22:21 -0800
> > +Subject: [PATCH] Make build script more buildroot friendly
> > +
> > +Signed-off-by: Guillermo A. Amaral <g@maral.me>
> 
> Here as well, this Buildroot-specific patch is not nice.
> 
> > +---
> > + CMakeLists.txt | 13 +++----------
> > + 1 file changed, 3 insertions(+), 10 deletions(-)
> > +
> > +diff --git a/CMakeLists.txt b/CMakeLists.txt
> > +index 6202553..367182c 100644
> > +--- a/CMakeLists.txt
> > ++++ b/CMakeLists.txt
> > +@@ -1,14 +1,7 @@
> > + cmake_minimum_required(VERSION 2.8)
> > + 
> > +-SET(COMPILE_DEFINITIONS -Werror)
> > +-
> > +-include_directories(/opt/vc/include)
> > +-include_directories(/opt/vc/include/interface/vcos/pthreads)
> > +-include_directories(/opt/vc/include/interface/vmcs_host)
> > +-include_directories(/opt/vc/include/interface/vmcs_host/linux)
> > +-
> > +-link_directories(/opt/vc/lib)
> > +-
> 
> What about using pkg-config again ?
> 
> > + add_executable(fbcp main.c)
> > + 
> > +-target_link_libraries(fbcp bcm_host)
> > ++target_link_libraries(fbcp bcm_host vchostif)
> > ++
> > ++install(TARGETS fbcp RUNTIME DESTINATION "${CMAKE_INSTALL_PREFIX}/sbin")
> > +-- 
> > +2.13.6
> > +
> > diff --git a/package/rpi-fbcp/Config.in b/package/rpi-fbcp/Config.in
> > new file mode 100644
> > index 000000000..9a186de9c
> > --- /dev/null
> > +++ b/package/rpi-fbcp/Config.in
> > @@ -0,0 +1,13 @@
> > +config BR2_PACKAGE_RPI_FBCP
> > +	bool "rpi-fbcp"
> > +	depends on BR2_arm
> > +	depends on BR2_PACKAGE_RPI_USERLAND
> > +	help
> > +	  Raspberry Pi utility. Used for mirror primary framebuffer to
> > +	  secondary framebuffer.
> > +
> > +	  https://github.com/tasanakorn/rpi-fbcp
> > +
> > +comment "rpi-fbc needs rpi-userland"
> > +	depends on BR2_arm
> > +	depends on !BR2_PACKAGE_RPI_USERLAND
> > diff --git a/package/rpi-fbcp/rpi-fbcp.mk b/package/rpi-fbcp/rpi-fbcp.mk
> > new file mode 100644
> > index 000000000..72f778c1e
> > --- /dev/null
> > +++ b/package/rpi-fbcp/rpi-fbcp.mk
> > @@ -0,0 +1,11 @@
> > +################################################################################
> > +#
> > +# rpi-fbcp
> > +#
> > +################################################################################
> > +
> > +RPI_FBCP_VERSION = 8087a71d0330a078d91aa78656684ab5313616c6
> > +RPI_FBCP_SITE = $(call github,tasanakorn,rpi-fbcp,$(RPI_FBCP_VERSION))
> > +RPI_FBCP_DEPENDENCIES = rpi-userland
> 
> The package upstream has no license information, which basically means
> you're not allowed to distribute it. A bit annoying, no?
> 
> Could you get in touch with the upstream developer to ask him/her to
> add license information. I do realize that this repository hasn't seen
> any update since 4 years, so there are some chances that the upstream
> developer doesn't answer. But really, shipping code that has no license
> is bad.
> 
> Thanks!
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com

-- 
gamaral
