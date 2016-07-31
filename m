From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 Jul 2016 23:20:39 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xserver_xorg-server:
	needs dri/dri2/dri3 for libdrm support
In-Reply-To: <1469968714-27285-1-git-send-email-bernd.kuhls@t-online.de>
 (Bernd Kuhls's message of "Sun, 31 Jul 2016 14:38:34 +0200")
References: <1469968714-27285-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <87a8gxqzbs.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Rework dependency handling as pointed out by Thomas:
 > http://lists.busybox.net/pipermail/buildroot/2016-July/168433.html

 > Fixes
 > http://autobuild.buildroot.net/results/2d3/2d38637e7904f3e382e41745a82ee1a1cf19ba71/

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > ---
 >  package/x11r7/xserver_xorg-server/Config.in              | 11 +++++++++--
 >  package/x11r7/xserver_xorg-server/xserver_xorg-server.mk |  4 ++--
 >  2 files changed, 11 insertions(+), 4 deletions(-)

 > diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
 > index df3801c..5715a56 100644
 > --- a/package/x11r7/xserver_xorg-server/Config.in
 > +++ b/package/x11r7/xserver_xorg-server/Config.in
 > @@ -55,6 +55,10 @@ config BR2_PACKAGE_XSERVER_XORG_SERVER
 
 >  if BR2_PACKAGE_XSERVER_XORG_SERVER
 
 > +config BR2_PACKAGE_XSERVER_XORG_SERVER_NEEDS_LIBDRM
 > +	bool
 > +	select BR2_PACKAGE_LIBDRM

Why the extra redirection with this symbol instead of just directly
using LIBDRM?

 > +++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
 > @@ -97,7 +97,7 @@ endif
 >  ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR),y)
 >  XSERVER_XORG_SERVER_CONF_OPTS += --enable-xorg
 >  XSERVER_XORG_SERVER_DEPENDENCIES += libpciaccess
 > -ifeq ($(BR2_PACKAGE_LIBDRM),y)
 > +ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER_NEEDS_LIBDRM),y)
 >  XSERVER_XORG_SERVER_DEPENDENCIES += libdrm
 >  XSERVER_XORG_SERVER_CONF_OPTS += --enable-libdrm
 >  else
 > @@ -164,7 +164,7 @@ ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 >  XSERVER_XORG_SERVER_DEPENDENCIES += udev
 >  XSERVER_XORG_SERVER_CONF_OPTS += --enable-config-udev
 >  # udev kms support depends on libdrm and dri2
 > -ifeq ($(BR2_PACKAGE_LIBDRM)$(BR2_PACKAGE_XPROTO_DRI2PROTO),yy)
 > +ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER_NEEDS_LIBDRM)$(BR2_PACKAGE_XPROTO_DRI2PROTO),yy)

As XPROTO_DRI2PROTO already pulls in LIBDRM, this could be simplified to
only check for DRI2PROTO.

>  XSERVER_XORG_SERVER_CONF_OPTS += --enable-config-udev-kms
 >  else
 >  XSERVER_XORG_SERVER_CONF_OPTS += --disable-config-udev-kms
 > -- 
 > 2.8.1

 > _______________________________________________
 > buildroot mailing list
 > buildroot at busybox.net
 > http://lists.busybox.net/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
