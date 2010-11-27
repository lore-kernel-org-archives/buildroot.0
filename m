From: Matt Johnson <mj1856@hotmail.com>
Date: Fri, 26 Nov 2010 17:42:12 -0700
Subject: [Buildroot] xorg-server not using target cflags
Message-ID: <BAY145-w13F5F6FEBA012526351555C2220@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hello,
 
I'm relatively new to buildroot, but I've had some recent success with most of the system.  However, I have been having problems getting X to run on my target platform, which is a custom s3c2410 board. Trying to run Xfbdev always caused an Illegal Instruction error.
 
I'm using a CodeSourcery external toolchain, and it requires -march=armv4t to be supplied, or it builds with armv5t instructions by default.  This hasn't been a problem for most packages, but I found that for the xserver_xorg-server package, none of the CFLAGS were being set properly.
 
I found that the /package/x11r7/xserver_xorg-server/xserver_xorg-server.mk file has overridden the CFLAGS to include the pixman-1 library.  In doing so, it appear that the regular CFLAGS are no longer passed along.  I was able to fix this by including $(TARGET_CFLAGS) as well.  This seems like the best way to resolve the problem properly.
 
 
I no longer get the Illegal Instruction error, and it appears to launch X properly now.
 
 
Assuming this fix is ok, please apply the following patch to buildroot to close this bug.
 
Thanks,
Matt
 
 
 
*** package/x11r7/xserver_xorg-server/xserver_xorg-server.mk 1969-12-31 17:00:00.000000000 -0700
--- package/x11r7/xserver_xorg-server/xserver_xorg-server.mk 2010-11-26 14:57:23.000000000 -0700
***************
*** 60,66 ****
  XSERVER_XORG_SERVER_CONF_OPT = --disable-config-hal \
    --disable-xnest --disable-xephyr --disable-xvfb \
    --with-builder-addr=buildroot at uclibc.org \
!   CFLAGS="-I$(STAGING_DIR)/usr/include/pixman-1" \
    --with-fontdir=/usr/share/fonts/X11/
  
  ifeq ($(BR2_PACKAGE_XSERVER_xorg),y)
--- 60,66 ----
  XSERVER_XORG_SERVER_CONF_OPT = --disable-config-hal \
    --disable-xnest --disable-xephyr --disable-xvfb \
    --with-builder-addr=buildroot at uclibc.org \
!   CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/pixman-1" \
    --with-fontdir=/usr/share/fonts/X11/
  
  ifeq ($(BR2_PACKAGE_XSERVER_xorg),y) 		 	   		  
