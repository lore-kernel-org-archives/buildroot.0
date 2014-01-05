From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 05 Jan 2014 21:10:37 +0100
Subject: [Buildroot] [PATCH 02/36] xorg: Bump xcb-proto & libxcb version
	to 1.10
In-Reply-To: <BLU0-SMTP401025A09E72B56EC74214CD9B50@phx.gbl> (Bernd Kuhls's
 message of "Sat, 4 Jan 2014 14:38:31 +0100")
References: <1388842746-12510-1-git-send-email-berndkuhls@hotmail.com>
 <BLU0-SMTP401025A09E72B56EC74214CD9B50@phx.gbl>
Message-ID: <87ioty5gw2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <berndkuhls@hotmail.com> writes:

 > updated pkgconfig variables code taken from OpenELEC:
 > https://github.com/OpenELEC/OpenELEC.tv/blob/master/packages/x11/lib/libxcb/package.mk

It would have been good if you could have described why you bumped these
two packages in the same commit so I didn't had to figure it out myself.

I've amended the commit message with a description why.

 > Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
 > ---
 >  package/x11r7/libxcb/libxcb.mk       |   10 ++++++----
 >  package/x11r7/xcb-proto/xcb-proto.mk |    2 +-
 >  2 files changed, 7 insertions(+), 5 deletions(-)

 > diff --git a/package/x11r7/libxcb/libxcb.mk b/package/x11r7/libxcb/libxcb.mk
 > index dfcf6fa..c3cbfab 100644
 > --- a/package/x11r7/libxcb/libxcb.mk
 > +++ b/package/x11r7/libxcb/libxcb.mk
 > @@ -4,7 +4,7 @@
 >  #
 >  ################################################################################
 
 > -LIBXCB_VERSION = 1.8.1
 > +LIBXCB_VERSION = 1.10
 >  LIBXCB_SOURCE = libxcb-$(LIBXCB_VERSION).tar.bz2
 >  LIBXCB_SITE = http://xcb.freedesktop.org/dist/
 >  LIBXCB_LICENSE = MIT
 > @@ -15,9 +15,11 @@ LIBXCB_INSTALL_STAGING = YES
 >  LIBXCB_DEPENDENCIES = \
 >  	host-libxslt xlib_libpthread-stubs xcb-proto xlib_libXdmcp xlib_libXau \
 >  	host-xcb-proto host-python host-pkgconf
 > -LIBXCB_CONF_ENV = STAGING_DIR="$(STAGING_DIR)"
 > -LIBXCB_MAKE_OPT = XCBPROTO_XCBINCLUDEDIR=$(STAGING_DIR)/usr/share/xcb \
 > -	XCBPROTO_XCBPYTHONDIR=$(HOST_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages
 > +
 > +LIBXCB_CONF_ENV = PKG_CONFIG="$$PKG_CONFIG \
 > +	--define-variable=pythondir=$(HOST_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages \
 > +	--define-variable=xcbincludedir=$(STAGING_DIR)/usr/share/xcb"
 > +

I think it makes more sense to simply fixup those variables in
xcb-proto.pc instead, similar like what we do for include/libdir, so
I've done that in xcb-proto.mk and dropped this.

Committed with these changes, thanks.

-- 
Bye, Peter Korsgaard
