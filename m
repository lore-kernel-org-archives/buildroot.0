From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 7 Aug 2013 00:11:50 +0200
Subject: [Buildroot] Updated Patch to add OLA package
In-Reply-To: <CALy4uEU6ZFcmeBhO_-Z0HF5GMou-E+a2GijNbuidvv_QA_ndww@mail.gmail.com>
References: <CALy4uEU6ZFcmeBhO_-Z0HF5GMou-E+a2GijNbuidvv_QA_ndww@mail.gmail.com>
Message-ID: <20130807001150.385e13ef@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear David Skok,

On Tue, 6 Aug 2013 08:07:35 -0400, David Skok wrote:
> Hi Thomas Pettazoni,
> 
> Somehow I missed your e-mail with suggestions to my original patch
> post and was notified by Thomas De Schampheleire when I re-post my
> patch.  I attempted reply to post to your response through gmane to no
> avail so regretfully I post the new patch separate.  I address all
> your suggestions including moving package to hardware handling,
> removed option for select version, added dependencies and fixed
> indents.

Thanks for taking into account the comments.

Unfortunately, the patch still cannot be applied as is:

 * You shouldn't paste the patch below an e-mail. The patch by itself
   should be an e-mail on its own. I'd suggest you to use 'git
   send-email' to send your patches.

 * Due to not using 'git send-email', your patch has been wrapped in
   some places, making it non applicable.

A few other comments below.

> From e15c5aeaeac9edc13b26131de244665e6651c0d7 Mon Sep 17 00:00:00 2001
> From: Dave Skok <blanco.ether@gmail.com>
> Date: Mon, 5 Aug 2013 14:36:45 -0400
> Subject: [PATCH 1/1] OLA package with updates to reflect suggestions for
>  accepting package

The title of the patch should be:

	ola: new package

> +config BR2_PACKAGE_OLA
> +	bool "open lighting architecture"
> +	select BR2_PACKAGE_PROTOBUF
> +	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
> +	select BR2_PACKAGE_UTIL_LINUX
> +	depends on BR2_INSTALL_LIBSTDCPP # protobuf
> +	depends on BR2_LARGEFILE # util-linux
> +	depends on BR2_USE_WCHAR # util-linux
> +	help
> +	  Open Lighting Architecture provides applications
> +	  with a mechanism to send and receive DMX512 & RDM
> +	  commands using hardware devices and DMX over IP protocols.
> +
> +	  http://www.opendmx.net/index.php/OLA
> +
> +comment "OLA requires a toolchain with C++ support enabled"
> +	depends on !BR2_INSTALL_LIBSTDCPP
> +comment "OLA requires a toolchain with LARGEFILE support"
> +	depends on !BR2_LARGEFILE
> +comment "OLA requires a toolchain with WCHAR support"
> +	depends on !BR2_USE_WCHAR

This should be one comment:

comment "ola requires a toolchain with C++, largefile and wchar support"
	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE || !BR2_USE_WCHAR

> +if BR2_PACKAGE_OLA
> +
> +menu "OLA Bindings and Interface"
> +
> +config BR2_PACKAGE_OLA_WEB
> +	bool "http interface"
> +	select BR2_PACKAGE_LIBMICROHTTPD
> +	help
> +	  Build OLA with browser interface.
> +
> +config BR2_PACKAGE_OLA_SLP
> +	bool "slp tools"
> +	help
> +	  Build OLA with slp tools.
> +
> +config BR2_PACKAGE_OLA_PYTHON_BINDINGS
> +	bool "python bindings"
> +	select BR2_PACKAGE_PYTHON
> +	select BR2_PACKAGE_PYTHON_PROTOBUF

This needs a "depends on BR2_USE_MMU" since Python has this dependency.
Or maybe your entire Ola package needs this dependency. You can also
leave it as it is for now, the autobuilders will figure out whether MMU
support is needed or not.

> diff --git a/package/ola/ola.mk b/package/ola/ola.mk
> new file mode 100644
> index 0000000..bf89bac
> --- /dev/null
> +++ b/package/ola/ola.mk
> @@ -0,0 +1,152 @@
> +#
> +# ola
> +#

This is not the standard header. Have a look at package/bind/bind.mk
for an example. Also, one empty line after the header.

> +OLA_VERSION=0.8.30

Spaces around '='.

> +OLA_SITE = https://code.google.com/p/open-lighting/
> +OLA_SITE_METHOD = git
> +
> +# autoreconf required for source pulled from git repo
> +# as it does not track configuration
> +OLA_AUTORECONF = YES
> +OLA_LICENSE = LGPLv2.1+
> +OLA_LICENSE_FILES = LICENSE COPYING.LGPLv2.1
> +
> +# util-linux provides uuid lib
> +OLA_DEPENDENCIES = protobuf util-linux
> +
> +OLA_CONF_OPT = \
> +	--disable-gcov \
> +	--disable-tcmalloc \
> +	--disable-unittests \
> +	--disable-root-check \
> +	--disable-java-libs
> +
> +# sets where to find python libs built for target and required by ola
> +OLA_CONF_ENV =
> PYTHONPATH=$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages
> +OLA_MAKE_ENV =
> PYTHONPATH=$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages

This is where I've seen your patch was line wrapped.

> +## OLA Bindings and Interface selections
> +
> +ifeq ($(BR2_PACKAGE_OLA_WEB),y)
> +OLA_CONF_OPT += --enable-http
> +OLA_DEPENDENCIES += libmicrohttpd
> +else
> +OLA_CONF_OPT += --disable-http
> +endif
> +
> +ifeq ($(BR2_PACKAGE_OLA_SLP),y)
> +OLA_CONF_OPT += --enable-slp
> +else
> +OLA_CONF_OPT += --disable-slp
> +endif
> +
> +ifeq ($(BR2_PACKAGE_OLA_PYTHON_BINDINGS),y)
> +OLA_CONF_OPT += --enable-python-libs
> +OLA_DEPENDENCIES += python python-protobuf
> +else
> +OLA_CONF_OPT += --disable-python-libs
> +endif
> +
> +## OLA Examples and Tests
> +
> +ifeq ($(BR2_PACKAGE_OLA_EXAMPLES),y)
> +OLA_CONF_OPT += --enable-examples
> +OLA_DEPENDENCIES += ncurses
> +else
> +OLA_CONF_OPT += --disable-examples
> +endif
> +
> +ifeq ($(BR2_PACKAGE_OLA_RDM_TESTS),y)
> +OLA_CONF_OPT += --enable-rdm-tests
> +else
> +OLA_CONF_OPT += --disable-rdm-tests
> +endif
> +
> +## OLA Plugin selections
> +
> +ifeq ($(BR2_PACKAGE_OLA_PLUGIN_ARTNET),y)
> +OLA_CONF_OPT += --enable-artnet
> +else
> +OLA_CONF_OPT += --disable-artnet
> +endif
> +
> +ifeq ($(BR2_PACKAGE_OLA_PLUGIN_DUMMY),y)
> +OLA_CONF_OPT += --enable-dummy
> +else
> +OLA_CONF_OPT += --disable-dummy
> +endif
> +
> +ifeq ($(BR2_PACKAGE_OLA_PLUGIN_E131),y)
> +OLA_CONF_OPT += --enable-e131
> +else
> +OLA_CONF_OPT += --disable-e131
> +endif
> +
> +ifeq ($(BR2_PACKAGE_OLA_PLUGIN_ESPNET),y)
> +OLA_CONF_OPT += --enable-espnet
> +else
> +OLA_CONF_OPT += --disable-espnet
> +endif
> +
> +ifeq ($(BR2_PACKAGE_OLA_PLUGIN_KINET),y)
> +OLA_CONF_OPT += --enable-kinet
> +else
> +OLA_CONF_OPT += --disable-kinet
> +endif
> +
> +ifeq ($(BR2_PACKAGE_OLA_PLUGIN_OPENDMX),y)
> +OLA_CONF_OPT += --enable-opendmx
> +else
> +OLA_CONF_OPT += --disable-opendmx
> +endif
> +
> +ifeq ($(BR2_PACKAGE_OLA_PLUGIN_PATHPORT),y)
> +OLA_CONF_OPT += --enable-pathport
> +else
> +OLA_CONF_OPT += --disable-pathport
> +endif
> +
> +ifeq ($(BR2_PACKAGE_OLA_PLUGIN_SANDNET),y)
> +OLA_CONF_OPT += --enable-sandnet
> +else
> +OLA_CONF_OPT += --disable-sandnet
> +endif
> +
> +ifeq ($(BR2_PACKAGE_OLA_PLUGIN_SHOWNET),y)
> +OLA_CONF_OPT += --enable-shownet
> +else
> +OLA_CONF_OPT += --disable-shownet
> +endif
> +
> +ifeq ($(BR2_PACKAGE_OLA_PLUGIN_KARATE),y)
> +OLA_CONF_OPT += --enable-karate
> +else
> +OLA_CONF_OPT += --disable-karate
> +endif
> +
> +ifeq ($(BR2_PACKAGE_OLA_PLUGIN_SPI),y)
> +OLA_CONF_OPT += --enable-spi
> +else
> +OLA_CONF_OPT += --disable-spi
> +endif
> +
> +ifeq ($(BR2_PACKAGE_OLA_PLUGIN_STAGEPROFI),y)
> +OLA_CONF_OPT += --enable-stageprofi
> +else
> +OLA_CONF_OPT += --disable-stageprofi
> +endif
> +
> +ifeq ($(BR2_PACKAGE_OLA_PLUGIN_USBPRO),y)
> +OLA_CONF_OPT += --enable-usbpro
> +else
> +OLA_CONF_OPT += --disable-usbpro
> +endif
> +
> +ifeq ($(BR2_PACKAGE_OLA_PLUGIN_OSC),y)
> +OLA_CONF_OPT += --enable-osc
> +OLA_DEPENDENCIES += liblo
> +else
> +OLA_CONF_OPT += --disable-osc
> +endif
> +
> +$(eval $(autotools-package))

Other than that, it looks fine!

Can you take those additional comments into account and resend?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
