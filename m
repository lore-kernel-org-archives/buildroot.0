From: Remi Pommarel <repk@triplefau.lt>
Date: Wed, 4 Nov 2015 20:37:30 +0100
Subject: [Buildroot] [PATCH v3 1/3] package/git: Add needed library for
 static compilation
In-Reply-To: <20151104144806.6a35229f@free-electrons.com>
References: <1446452252-10647-1-git-send-email-repk@triplefau.lt>
 <1446452252-10647-2-git-send-email-repk@triplefau.lt>
 <20151104144806.6a35229f@free-electrons.com>
Message-ID: <20151104193730.GH13534@cruxbox>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Nov 04, 2015 at 02:48:06PM +0100, Thomas Petazzoni wrote:
> Dear Remi Pommarel,
> 
> On Mon,  2 Nov 2015 09:17:30 +0100, Remi Pommarel wrote:
> > Add missing ssl and crypto libraries in LIBS variable used by configure.
> > 
> > A statically compiled libcurl need to be linked with some libraries to get all
> > its undefined symbols resolved. Indeed when libcurl supports openssl it needs
> > -lssl to satisfy all its dependencies, the same goes for crypto symbols.
> 
> It isn't clear what is the relation here between libcurl and openssl.
> Can you detail?
> 

Libcurl uses openssl (when compiled with ssl support) functions to
support protocol such as HTTPS. So libcurl will have many undefined
symbols from openssl.

> > diff --git a/package/git/git.mk b/package/git/git.mk
> > index 2bd6a01..2c404b4 100644
> > --- a/package/git/git.mk
> > +++ b/package/git/git.mk
> > @@ -14,7 +14,7 @@ GIT_DEPENDENCIES = zlib host-gettext
> >  ifeq ($(BR2_PACKAGE_OPENSSL),y)
> >  GIT_DEPENDENCIES += openssl
> >  GIT_CONF_OPTS += --with-openssl
> > -GIT_CONF_ENV_LIBS += $(if $(BR2_STATIC_LIBS),-lz)
> > +GIT_CONF_ENV_LIBS += $(if $(BR2_STATIC_LIBS),-lssl -lcrypto -lz)
> >  else
> >  GIT_CONF_OPTS += --without-openssl
> >  endif
> 
> What is this fixing exactly? I've tried building Git statically, then
> Git+OpenSSL statically, then Git+OpenSSL+libcurl statically, and all
> these configurations. Can you rework your patch to clearly indicate in
> the commit log which configuration is currently failing and how it is
> failing (relevant error messages) ?
> 
> The following configuration:
> 
> BR2_arm=y
> BR2_STATIC_LIBS=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-static-2015.08-647-gc356fb2.tar.bz2"
> BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
> BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_14=y
> BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
> # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
> BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
> BR2_TOOLCHAIN_EXTERNAL_CXX=y
> BR2_INIT_NONE=y
> BR2_SYSTEM_BIN_SH_NONE=y
> # BR2_PACKAGE_BUSYBOX is not set
> BR2_PACKAGE_GIT=y
> BR2_PACKAGE_OPENSSL=y
> BR2_PACKAGE_LIBCURL=y
> # BR2_TARGET_ROOTFS_TAR is not set
> 
> Builds just fine here.

It builds fine, but git-http-{fetch,push} will not be built as they
should be. What happens is that configure fail to detect libcurl because
its simple test program will not compile due to missing ssl library.

Thanks,

-- 
Remi
