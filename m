From: Dan Nicolaescu <dann@ics.uci.edu>
Date: Fri, 08 Feb 2008 17:01:30 -0800
Subject: [Buildroot] building just x11r7 client, no server
Message-ID: <200802090101.m1911U0w008013@sallyv1.ics.uci.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


It seems that it is not possible to build just the client side of x11r7,
without building the server.

This code in package/Makefile.in:

# X Windowing system

XSERVER:=
ifeq ($(strip $(BR2_PACKAGE_TINYX)),y)
XSERVER+=tinyx
endif
ifeq ($(strip $(BR2_PACKAGE_XORG)),y)
XSERVER+=xorg
endif
ifeq ($(strip $(BR2_PACKAGE_XORG7)),y)
XSERVER+=xserver_xorg-server
endif
ifeq ($(strip $(BR2_PACKAGE_XGGI)),y)
XSERVER+=xggi
endif

means XSERVER will be set to xserver_xorg-server

and this in package/cairo/cairo.mk:

cairo: uclibc gettext libintl pkgconfig libglib2 zlib png fontconfig $(XSERVER) $(TARGET_DIR)/lib/libcairo.so.2.9.3

means that xserver_xorg-server will be built before cairo.

Not sure what the best solution is... Suggestions?

Thanks

        --dan
