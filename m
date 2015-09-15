From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 15 Sep 2015 22:45:29 +0200
Subject: [Buildroot] [PATCH 1/3] Experimental addition of the newlib
 library
In-Reply-To: <20150913101738.238ebc06@free-electrons.com>
References: <1442127768-26447-1-git-send-email-cjwfirmware@vxmdesign.com>
 <20150913101738.238ebc06@free-electrons.com>
Message-ID: <20150915204528.GD3650@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Cris, All,

On 2015-09-13 10:17 +0200, Thomas Petazzoni spake thusly:
> 
> On Sun, 13 Sep 2015 03:02:46 -0400, Chris Wardman wrote:
> > This patch add support for a newlib library build of the gcc toolchain.
> > This is designed to build arm-none-eabi- toolchain, and it was tested against an stm32f4discovery board.
> > 
> > Hopefully this will help people build bare metal code for arm processors
[--SNIP--]
> > diff --git a/package/newlib/newlib.mk b/package/newlib/newlib.mk
> > new file mode 100644
> > index 0000000..02008e5
> > --- /dev/null
> > +++ b/package/newlib/newlib.mk
> > @@ -0,0 +1,48 @@
> > +################################################################################
> > +#
> > +# newlib
> > +#
> > +################################################################################
> > +
> > +NEWLIB_VERSION = 2.2.0
> > +NEWLIB_SITE = ftp://sourceware.org/pub/newlib
> > +NEWLIB_LICENSE = MIT
> > +NEWLIB_LICENSE_FILES = COPYRIGHT
> > +
> > +NEWLIB_DEPENDENCIES = host-gcc-initial
> > +NEWLIB_ADD_TOOLCHAIN_DEPENDENCY = NO
> > +NEWLIB_INSTALL_STAGING = YES
> > +
> > +define NEWLIB_CONFIGURE_CMDS
> > +	(cd $(@D); \
> > +		$(TARGET_MAKE_ENV) \
> > +		./configure \
> > +			--target=$(GNU_TARGET_NAME) \
> > +			--host=$(GNU_HOST_NAME) \
> > +			--build=$(GNU_HOST_NAME) \
> > +			--prefix=$(STAGING_DIR) \
> > +			--includedir=$(STAGING_DIR)/usr/include \
> > +			--oldincludedir=$(STAGING_DIR)/usr/include \
> > +			--with-build-sysroot=$(STAGING_DIR) \
> > +			--enable-newlib-io-long-long \
> > +			--enable-newlib-register-fini \
> > +			--disable-newlib-supplied-syscalls \
> > +			--disable-nls)
> 
> Why don't you use the autotools-package infrastructure? newlib is using
> autoconf, so I believe it does make sense to use the autotools-package
> infrastructure.

Because newlib does not interpret --build, --host and --target like the
other autotools-based packages do. newlib basically ignores --build,
considers --host as the buld machine, and --target as the host. :-/

[--SNIP--]
> > +define NEWLIB_INSTALL_STAGING_CMDS
> > +	mkdir -p $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/lib
> > +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
> 
> Except the mkdir, the install command is not needed if you use the
> autotools-package infrastructure.

In which case a pre-install hook can be used to do the mkdir.

But it would probably not be needed if $(GNU_TARGET_NAME) is a symlink
to "." .

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
