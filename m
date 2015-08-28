From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Aug 2015 12:21:38 +0200
Subject: [Buildroot] [PATCH v2 1/2] libssh: new package
In-Reply-To: <1438089479-30678-2-git-send-email-fancp2007@gmail.com>
References: <1438089479-30678-1-git-send-email-fancp2007@gmail.com>
 <1438089479-30678-2-git-send-email-fancp2007@gmail.com>
Message-ID: <20150828122138.0a0dddec@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Scott Fan,

Thanks for this patch!

On Tue, 28 Jul 2015 21:17:58 +0800, Scott Fan wrote:
> libssh2 and libssh both implement SSH and provide a library API for apps.
> Both support SSH, SFTP, auth, channels etc. Both are 25K-30K lines of code.
> 
> [libssh2 vs libssh - A comparison]
> http://www.libssh2.org/libssh2-vs-libssh.html
> 
> Signed-off-by: Scott Fan <fancp2007@gmail.com>

I've tried to merge this package, but it really doesn't work:

 * It wants zlib unless -DWITH_LIB=OFF

 * It needs either libgcrypt or OpenSSL

 * It needs to be passed -DHAVE_WORDS_BIGENDIAN=0 or 1 depending on the
   endianness of the platform.

And even with all this fixed, it still fails to build:

Building C object src/CMakeFiles/ssh_shared.dir/bignum.c.o
In file included from /home/thomas/projets/buildroot/output/build/libssh-0.7.1/src/bignum.c:24:0:
/home/thomas/projets/buildroot/output/build/libssh-0.7.1/include/libssh/priv.h:42:4: error: #error "no strtoull function found"
In file included from /home/thomas/projets/buildroot/output/build/libssh-0.7.1/src/buffer.c:34:0:
/home/thomas/projets/buildroot/output/build/libssh-0.7.1/include/libssh/priv.h:42:4: error: #error "no strtoull function found"
In file included from /home/thomas/projets/buildroot/output/build/libssh-0.7.1/src/auth.c:34:0:
/home/thomas/projets/buildroot/output/build/libssh-0.7.1/include/libssh/priv.h:42:4: error: #error "no strtoull function found"
In file included from /home/thomas/projets/buildroot/output/build/libssh-0.7.1/src/buffer.c:34:0:
/home/thomas/projets/buildroot/output/build/libssh-0.7.1/include/libssh/priv.h:154:4: error: #error "Your system must provide a __func__ macro"
In file included from /home/thomas/projets/buildroot/output/build/libssh-0.7.1/src/bignum.c:24:0:
/home/thomas/projets/buildroot/output/build/libssh-0.7.1/include/libssh/priv.h:154:4: error: #error "Your system must provide a __func__ macro"
In file included from /home/thomas/projets/buildroot/output/build/libssh-0.7.1/src/auth.c:34:0:
/home/thomas/projets/buildroot/output/build/libssh-0.7.1/include/libssh/priv.h:154:4: error: #error "Your system must provide a __func__ macro"
src/CMakeFiles/ssh_shared.dir/build.make:123: recipe for target 'src/CMakeFiles/ssh_shared.dir/bignum.c.o' failed
make[4]: *** [src/CMakeFiles/ssh_shared.dir/bignum.c.o] Error 1

I believe you probably haven't tested this package throughly enough.
Please make sure that:

 * You do a Buildroot build with only this package enabled, and nothing
   else. This will make sure you get the dependencies correct.

 * You do a Buildroot build with a uClibc toolchain. You can for
   example use the base configuration
   http://autobuild.buildroot.org/toolchains/configs/br-arm-full.config
   to use a pre-built uClibc external toolchain, which will avoid the
   need for building the toolchain.

For reference, here is the libssh.mk file that I have right now:

################################################################################
#
## libssh
#
#################################################################################

LIBSSH_VERSION = 0.7.1
LIBSSH_SOURCE = libssh-$(LIBSSH_VERSION).tar.xz
LIBSSH_SITE = https://red.libssh.org/attachments/download/154
LIBSSH_LICENSE = LGPLv2.1
LIBSSH_LICENSE_FILES = COPYING
LIBSSH_INSTALL_STAGING = YES
LIBSSH_SUPPORTS_IN_SOURCE_BUILD = NO
LIBSSH_CONF_OPTS = \
	-DWITH_SERVER=OFF

ifeq ($(BR2_ENDIAN),"BIG")
LIBSSH_CONF_OPTS += -DHAVE_WORDS_BIGENDIAN=1
else
LIBSSH_CONF_OPTS += -DHAVE_WORDS_BIGENDIAN=0
endif

ifeq ($(BR2_PACKAGE_ZLIB),y)
LIBSSH_CONF_OPTS += -DWITH_ZLIB=ON
LIBSSH_DEPENDENCIES += zlib
else
LIBSSH_CONF_OPTS += -DWITH_ZLIB=OFF
endif

ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
LIBSSH_CONF_OPTS += -DWITH_GCRYPT=ON
LIBSSH_DEPENDENCIES += libgcrypt
else
LIBSSH_CONF_OPTS += -DWITH_GCRYPT=OFF
endif

ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
LIBSSH_CONF_OPTS += -DWITH_OPENSSL=ON
LIBSSH_DEPENDENCIES += openssl
else
LIBSSH_CONF_OPTS += -DWITH_OPENSSL=OFF
endif

$(eval $(cmake-package))

And the Config.in file:

config BR2_PACKAGE_LIBSSH
	bool "libssh"
	# Either OpenSSL or libgcrypt are mandatory
	select BR2_PACKAGE_LIBGCRYPT if !BR2_PACKAGE_OPENSSL
	help
	  libssh is a mulitplatform C library implementing the SSHv2
	  and SSHv1 protocol on client and server side. With libssh,
	  you can remotely execute programs, transfer files, use a
	  secure and transparent tunnel for your remote applications.

	  http://www.libssh.org/

Can you resubmit this patch after making sure the package builds
properly?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
