From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 01 May 2014 22:45:58 +0200
Subject: [Buildroot] [PATCH 1/1 v2] libwebsockets : bump version
In-Reply-To: <1398897900-31163-1-git-send-email-sagaert.johan@skynet.be>
 (Sagaert Johan's message of "Thu, 1 May 2014 00:45:00 +0200")
References: <1398897900-31163-1-git-send-email-sagaert.johan@skynet.be>
Message-ID: <878uqlrzw9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sagaert" == Sagaert Johan <sagaert.johan@skynet.be> writes:

 > bump to v1.23-chrome32-firefox24
 > The latest releases use the cmake build infrastructure.
 > Converted the makefile to the cmake infrastructure.
 > The autotools infrastructure is no longer supported.

 > Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
 > ---
 > v2 :added comment on the removed autotools support.

 >  package/libwebsockets/libwebsockets.mk | 12 ++++++++----
 >  1 file changed, 8 insertions(+), 4 deletions(-)

 > diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
 > index ec5244c..1d76bc9 100644
 > --- a/package/libwebsockets/libwebsockets.mk
 > +++ b/package/libwebsockets/libwebsockets.mk
 > @@ -4,14 +4,18 @@
 >  #
 >  ################################################################################
 
 > -LIBWEBSOCKETS_VERSION = v1.22-chrome26-firefox18
 > +LIBWEBSOCKETS_VERSION = v1.23-chrome32-firefox24
 >  LIBWEBSOCKETS_SOURCE = libwebsockets-$(LIBWEBSOCKETS_VERSION).tar.xz
 >  LIBWEBSOCKETS_SITE = http://git.libwebsockets.org/cgi-bin/cgit/libwebsockets/snapshot
 >  LIBWEBSOCKETS_LICENSE = LGPLv2.1
 >  LIBWEBSOCKETS_LICENSE_FILES = COPYING

The license file is now called LICENSE.

 >  LIBWEBSOCKETS_DEPENDENCIES = zlib
 > -LIBWEBSOCKETS_AUTORECONF = YES
 > -LIBWEBSOCKETS_CONF_OPT = --without-testapps
 >  LIBWEBSOCKETS_INSTALL_STAGING = YES
 
 > -$(eval $(autotools-package))
 > +LIBWEBSOCKETS_CONF_OPT += -DWITHOUT_TESTAPPS=ON
 > +
 > +ifeq ($(BR2_PACKAGE_OPENSSL),)
 > +	LIBWEBSOCKETS_CONF_OPT += -DWITH_SSL=OFF
 > +endif

We also have to ensure that openssl is built before libwebsockets if
enabled.

Committed with those issues fixed, thanks.

-- 
Bye, Peter Korsgaard
