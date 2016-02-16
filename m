From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Tue, 16 Feb 2016 23:57:12 +0100
Subject: [Buildroot] [PATCH v2 1/2] libimxvpuapi: add new package
In-Reply-To: <20160216215313.15f228fe@gmx.net>
References: <1454363759-23349-1-git-send-email-gary.bisson@boundarydevices.com>
 <1454363759-23349-2-git-send-email-gary.bisson@boundarydevices.com>
 <20160216215313.15f228fe@gmx.net>
Message-ID: <CAAMH-yuzsvt-6U-JX7RhNoEcWoJA4ahRm4U27LvWLwXyg4UtTg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On Tue, Feb 16, 2016 at 9:53 PM, Peter Seiderer <ps.report@gmx.net> wrote:
>
> Hello Gary,
>
> On Mon,  1 Feb 2016 22:55:58 +0100, Gary Bisson <gary.bisson@boundarydevices.com> wrote:
>
> > <snip>
> > +LIBIMXVPUAPI_VERSION = 0.10.1
> > +LIBIMXVPUAPI_SITE = $(call github,Freescale,libimxvpuapi,$(LIBIMXVPUAPI_VERSION))
> > +LIBIMXVPUAPI_LICENSE = LGPLv2.1+
> > +LIBIMXVPUAPI_LICENSE_FILES = LICENSE
> > +LIBIMXVPUAPI_DEPENDENCIES = host-pkgconf host-python imx-vpu
> > +LIBIMXVPUAPI_INSTALL_STAGING = YES
> > +
> > +define LIBIMXVPUAPI_CONFIGURE_CMDS
> > +     cd $(@D); \
> > +     $(TARGET_CONFIGURE_OPTS) $(HOST_DIR)/usr/bin/python2 ./waf configure \
> > +             --prefix=/usr
> > +endef
>
> On my x86_64 (OpenSUSE-13.2) host build the libs and libimxvpuapi.pc
> are installed into $(STAGING_DIR)/usr/lib64 and $(TARGET_DIR)/usr/lib64.
>
> To be usable by eg. gst1-imx the install path should be $(STAGING_DIR)/usr/lib
> and $(TARGET_DIR)/usr/lib. To achieve this I added '--libdir=/usr/lib' to
> overwrite the default '/usr/lib64':

I'd like to understand why it behaves like this with your setup. I'm
using a 64-bit OS too (Debian Testing) but the libs go to /usr/lib as
expected.

Could you pastebin the full log of libimxvpuapi build, your buildroot
configuration as well as you 'env'?

> --- a/package/libimxvpuapi/libimxvpuapi.mk
> +++ b/package/libimxvpuapi/libimxvpuapi.mk
> @@ -14,7 +14,7 @@ LIBIMXVPUAPI_INSTALL_STAGING = YES
>  define LIBIMXVPUAPI_CONFIGURE_CMDS
>         cd $(@D); \
>         $(TARGET_CONFIGURE_OPTS) $(HOST_DIR)/usr/bin/python2 ./waf configure \
> -               --prefix=/usr
> +               --prefix=/usr --libdir=/usr/lib
>  endef
>
>  define LIBIMXVPUAPI_BUILD_CMDS
>
>
> With this you can add my
>
> Tested-by: Peter Seiderer <ps.report@gmx.net>
>
> for '...! imxvpudec ! imxipuvideosink'

Ok, I'll do that once I understand the difference which requires this
libdir argument.

> But I had problems using the imxeglvivsink element and
> with qt5 eglfs, suspecting your 'Update most Freescale packages' patch series
> (using buildroot-2016.02-rc1 with your '[PATCH v3 0/2] gst1-imx: bump version to 0.12.0'
> patches on top), but did not find time yet to investigate further...

Does a basic gstreamer pipeline work?
# gst-launch-1.0 videotestsrc ! imxeglvivsink

If not there's no wonder qt5 doesn't like it. I haven't tried qt5 but
I'm sure the gstreamer imxeglvivsink does work.

In case you've enabled BR2_PACKAGE_KERNEL_MODULE_IMX_GPU_VIV, you
might need to load the Galcore module manually in case you don't have
eudev for instance:
# insmod /lib/modules/3.14.28/extra/galcore.ko

Regards,
Gary
