From: Sergey Bobrenok <bobrofon@gmail.com>
Date: Sun, 1 Nov 2020 23:12:28 +0700
Subject: [Buildroot] [PATCH 1/1] sdbus-cpp: new package
In-Reply-To: <20201031235531.338830a6@windsurf>
References: <20201029142346.144261-1-bobrofon@gmail.com>
 <20201031235531.338830a6@windsurf>
Message-ID: <20201101231228.7aebeddb@navi.uac>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Sat, 31 Oct 2020 23:55:31 +0100
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Hello Sergey,
> 
> Thanks for this contribution. First just to make sure: this is really
> a different library than package/sdbusplus/ that we already have in
> Buildroot ?

Yes. sdbusplus and sdbus-cpp are different libraries.

> 
> The commit title should be:
> 
> 	package/sdbus-cpp: new package

Ok. I missed it when I was reading the contribution manual. Will fix it.

> 
> On Thu, 29 Oct 2020 21:23:46 +0700
> Sergey Bobrenok <bobrofon@gmail.com> wrote:
> 
> > sdbus-c++ is a high-level C++ D-Bus library for Linux.
> > 
> > The target build produces sdbus-c++ library itself. The host build
> > produces helper tool sdbus-c++-xml2cpp. sdbus-c++-xml2cpp can be
> > used to generate sdbus-c++ stub .h files from xml files.
> > 
> > Signed-off-by: Sergey Bobrenok <bobrofon@gmail.com>
> > ---
> >  package/Config.in                |  1 +
> >  package/sdbus-cpp/Config.in      | 18 ++++++++++++++++++
> >  package/sdbus-cpp/sdbus-cpp.hash |  3 +++
> >  package/sdbus-cpp/sdbus-cpp.mk   | 18 ++++++++++++++++++
> >  4 files changed, 40 insertions(+)  
> 
> Please add an entry in the DEVELOPERS file.

I'll fix it.

> 
> > diff --git a/package/sdbus-cpp/Config.in
> > b/package/sdbus-cpp/Config.in new file mode 100644
> > index 0000000000..7a952d78a5
> > --- /dev/null
> > +++ b/package/sdbus-cpp/Config.in
> > @@ -0,0 +1,18 @@
> > +config BR2_PACKAGE_SDBUS_CPP
> > +	bool "sdbus-c++"
> > +	depends on BR2_INSTALL_LIBSTDCPP
> > +	depends on BR2_PACKAGE_SYSTEMD
> > +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
> > +	select BR2_PACKAGE_EXPAT # host package  
> 
> It's only the host package that needs host-expat. Selecting
> BR2_PACKAGE_EXPAT means "I need the target expat", which is not the
> case here.

You're right. The host-sdbus-cpp package doesn't need to select
BR2_PACKAGE_EXPAT. It just needs to declare a dependency on host-expat.
I will delete BR2_PACKAGE_EXPAT from here.

> 
> > +	help
> > +	  sdbus-c++ is a high-level C++ D-Bus library for Linux
> > +	  designed to provide expressive, easy-to-use API in
> > modern C++. +
> > +	  This will build the target library and the host side
> > native
> > +	  stub generator tool (sdbus-c++-xml2cpp).  
> 
> No, your package as it is written today will not build the host side.

Can you explain what do you mean? This package is providing
'host-sdbus-cpp' target that can be used to build 'sdbus-c++-xml2cpp'
generator tool by dependency. This is that I was trying to achieve and
that how I use it (and it works). I am not sure what should I change.

> 
> > diff --git a/package/sdbus-cpp/sdbus-cpp.mk
> > b/package/sdbus-cpp/sdbus-cpp.mk new file mode 100644
> > index 0000000000..608919a050
> > --- /dev/null
> > +++ b/package/sdbus-cpp/sdbus-cpp.mk
> > @@ -0,0 +1,18 @@
> > +################################################################################
> > +#
> > +# sdbus-c++
> > +#
> > +################################################################################
> > +
> > +SDBUS_CPP_VERSION = 0.8.3
> > +SDBUS_CPP_SOURCE = v$(SDBUS_CPP_VERSION).tar.gz
> > +SDBUS_CPP_SITE =
> > https://github.com/Kistler-Group/sdbus-cpp/archive  
> 
> These are auto-generated archives. In this case, please use our $(call
> github,...) macro instead.

I'll fix it.

> 
> > +SDBUS_CPP_INSTALL_STAGING = YES
> > +SDBUS_CPP_DEPENDENCIES = systemd
> > +SDBUS_CPP_LICENSE = LGPL-2.1-or-later  
> 
> I know LGPL-2.1-or-later is the correct SPDX encoding, but we use
> LGPL-2.1+ in Buildroot, for historical reasons.

I'll fix it.
