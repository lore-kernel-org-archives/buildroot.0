From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 14 Mar 2020 11:21:10 +0100
Subject: [Buildroot] Help: error LONG_BIT definition appears wrong for
 platform
In-Reply-To: <20200313150443.682fdc5a@windsurf>
References: <CAA0OSwgGcbzMe9o35FRqmLBZ5PFMx=1+fDYyiqq0yLk5YJyNpQ@mail.gmail.com>
 <20200313150443.682fdc5a@windsurf>
Message-ID: <20200314112110.2d8ce39a@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Mark,

On Fri, 13 Mar 2020 15:04:43 +0100, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Hello,
>
> On Fri, 13 Mar 2020 18:26:38 +0800
> Mark Leo Sumadero <fryu771@gmail.com> wrote:
>
> > /home/falcon/Documents/pisokonek-project/pisokonek/installer/buildroot-2019.02.1/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-gcc
>
> This is the cross-compiler: good!
>
> > -prefer-pic -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
> > -D_FILE_OFFSET_BITS=64 -Os  -DLINUX -D_REENTRANT -D_GNU_SOURCE
> >  -I/home/falcon/Documents/pisokonek-project/pisokonek/installer/buildroot-2019.02.1/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include
> >  -I/home/falcon/Documents/pisokonek-project/pisokonek/installer/buildroot-2019.02.1/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/bin/../../usr/include/apr-1
> >
> > -I/home/falcon/Documents/pisokonek-project/pisokonek/installer/buildroot-2019.02.1/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/bin/../../usr/include/apr-1
> > -I/home/falcon/Documents/pisokonek-project/pisokonek/installer/buildroot-2019.02.1/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/bin/../../../../arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include
> > -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os
> > -I/home/falcon/Documents/pisokonek-project/pisokonek/installer/buildroot-2019.02.1/output/host/include/python3.7m
>
> This is a path to header of host components: BAD!
>
> And this is where your problem is, this header path should *NOT* be
> there when you cross-compile.

The following worked for me (python3 case only):

MOD_WSGI_VERSION = 61359e67448bdfc5fefb1692fd2a97f76394b20c
MOD_WSGI_SITE = $(call github,GrahamDumpleton,mod_wsgi,$(MOD_WSGI_VERSION))
MOD_WSGI_LICENSE = Apache-2.0
MOD_WSGI_LICENSE_FILES = LICENSE
MOD_WSGI_DEPENDENCIES = apache

MOD_WSGI_CONF_OPTS = \
--with-apxs=$(STAGING_DIR)/usr/bin/apxs

ifeq ($(BR2_PACKAGE_PYTHON3),y)
MOD_WSGI_DEPENDENCIES += python3
MOD_WSGI_CONF_ENV += \
        CPPFLAGS="-I$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)" \
        LDFLAGS="-L$(STAGING_DIR)/usr/lib"
endif

$(eval $(autotools-package))

Regards,
Peter

>
> Best regards,
>
> Thomas Petazzoni
