From: lpdev at cordier.org <lpdev@cordier.org>
Date: Mon,  4 Feb 2019 10:23:51 +0100 (CET)
Subject: [Buildroot] [PATCH v2 2/6] intel-mediadriver: new package.
In-Reply-To: <20190202170330.27653572@windsurf>
Message-ID: <ea-mime-5c5804a7-3d6b-3704bb69@www-5.netcourrier.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> De : Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ? : Louis-Paul Cordier <lpdev@cordier.org>
> Sujet : Re: [Buildroot] [PATCH v2 2/6] intel-mediadriver: new package.
> Date : 02/02/2019 17:03:30 Europe/Paris
> Copie ? : buildroot at buildroot.org;
>    Bernd Kuhls <bernd.kuhls@t-online.de>;
>    MahyarKoshkouei <mahyar.koshkouei@gmail.com>
>
> Hello,
>
> Commit tite should be:
>
> package/intel-mediadriver: new package
>
> On Thu, 31 Jan 2019 13:15:22 +0100
> Louis-Paul Cordier <lpdev@cordier.org> wrote:
>
> > package/Config.in | 1 +
> > package/intel-mediadriver/Config.in | 17 +++++++++++
> > .../intel-mediadriver/intel-mediadriver.hash | 2 ++
> > .../intel-mediadriver/intel-mediadriver.mk | 29 +++++++++++++++++++
> > 4 files changed, 49 insertions(+)
>
> Missing update to the DEVELOPERS file.
>
> > diff --git a/package/intel-mediadriver/Config.in b/package/intel-mediadriver/Config.in
> > new file mode 100644
> > index 0000000000..ab44a65b91
> > --- /dev/null
> > +++ b/package/intel-mediadriver/Config.in
> > @@ -0,0 +1,17 @@
> > +config BR2_PACKAGE_INTEL_MEDIADRIVER
> > + bool "intel-mediadriver"
> > + depends on BR2_x86_64
> > + select BR2_PACKAGE_INTEL_GMMLIB
> > + select BR2_PACKAGE_LIBPCIACCESS
> > + select BR2_PACKAGE_LIBVA
> > + select BR2_PACKAGE_MESA3D
> > + select BR2_PACKAGE_XLIB_LIBX11
>
> You cannot select all those packages without replicating their
> dependencies.
>
> libva has:
>
> depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm/libpthread-stubs
> depends on !BR2_STATIC_LIBS
>
> mesa3d has:
>
> depends on BR2_INSTALL_LIBSTDCPP
> depends on !BR2_STATIC_LIBS
> depends on BR2_TOOLCHAIN_HAS_SYNC_1
> depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
>
> and for libx11, you need to add:
>
> depends on BR2_PACKAGE_XORG7
>
> > +
>
> Unneeded blank line.
>
> > + help
> > + The Intel(R) Media Driver for VAAPI is a new VA-API (Video
> > + Acceleration API) user mode driver supporting hardware
> > + accelerated decoding, encoding, and video post processing for
> > + GEN based graphics hardware.
>
> Please add a blank line, followed by the upstream URL of the project.
>
> > +comment "intel-mediadriver needs libx11"
> > + depends on !BR2_PACKAGE_XLIB_LIBX11
>
> This particular comment didn't make much sense, because you are
> selecting BR2_PACKAGE_XLIB_LIBX11.
>
> Instead, we need a comment that details the "depends on" dependencies
> of this package.
>

Should I create 1 comment per dependency? 

> > diff --git a/package/intel-mediadriver/intel-mediadriver.hash b/package/intel-mediadriver/intel-mediadriver.hash
> > new file mode 100644
> > index 0000000000..9068b40e07
> > --- /dev/null
> > +++ b/package/intel-mediadriver/intel-mediadriver.hash
> > @@ -0,0 +1,2 @@
> > +# Locally computed
> > +sha256 df9af1cc796b4123508aacaf19d040cc5d8c5742c05199f45c9a3905ed8d1b52 intel-media-18.3.0.tar.gz
>
> Please add a hash for the license file.
>
> > diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
> > new file mode 100644
> > index 0000000000..77a757f212
> > --- /dev/null
> > +++ b/package/intel-mediadriver/intel-mediadriver.mk
> > @@ -0,0 +1,29 @@
> > +################################################################################
> > +#
> > +# intel-mediadriver
> > +#
> > +################################################################################
> > +
> > +# based on https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
> > +
> > +INTEL_MEDIADRIVER_VERSION = 18.3.0
>
> A 18.4.0 release is now available.
>

I just noticed that MediaSDK 2018 Q4 has been released few days ago. I did not had time to test it though. Please note that each version of the MediaSDK is tightly coupled with specific versions of its depependencies. In the case of MediaSDK2018 Q3.1, gmmlib 18.3.0 MUST be used.

> > +INTEL_MEDIADRIVER_SITE = http://github.com/intel/media-driver/archive
> > +INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
> > +INTEL_MEDIADRIVER_LICENSE = MIT BSD-3-Clause
>
> The list of licenses is comma-separated.
>
> > +INTEL_MEDIADRIVER_LICENSE_FILES = LICENSE.md
> > +
> > +INTEL_MEDIADRIVER_DEPENDENCIES += intel-gmmlib
> > +INTEL_MEDIADRIVER_DEPENDENCIES += libpciaccess
> > +INTEL_MEDIADRIVER_DEPENDENCIES += libva
> > +INTEL_MEDIADRIVER_DEPENDENCIES += mesa3d
> > +INTEL_MEDIADRIVER_DEPENDENCIES += xlib_libX11
>
> Please us a single assignment:
>
> INTEL_MEDIADRIVER_DEPENDENCIES = \
> intel-gmmlib \
> libpciaccess \
> libva \
> mesa3d \
> xlib_libx11
>
> > +
> > +INTEL_MEDIADRIVER_SUPPORTS_IN_SOURCE_BUILD = NO
> > +
> > +INTEL_MEDIADRIVER_CONF_OPTS += -DMEDIA_VERSION="2.0.0"\
>
> No need for += here, a regular = assignment will be fine.
>
> > + -DBUILD_ALONG_WITH_CMRTLIB=1 \
> > + -DINSTALL_DRIVERS_SYSCONF=OFF \
> > + -DMEDIA_RUN_TEST_SUITE=OFF \
> > + -DRUN_TEST_SUITE=OFF
> > +
> > +$(eval $(cmake-package))
>

I have read somewhere that INTEL_MEDIADRIVER_CONF_OPTS has some default values. Simple assignement will remove these default options, isn't it?

> Thanks!
>
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
