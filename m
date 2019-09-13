From: Tudor Holton <tudor@smartguide.com.au>
Date: Fri, 13 Sep 2019 16:24:52 +1000
Subject: [Buildroot] xorg with nodm/xdm init.d script conflicts causes blank
 screen
Message-ID: <e18d5ea17ba0b23913db2136db94d67a@smartguide.com.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello awesome buildroot people, :-)

If I select the X.org server BR2_PACKAGE_XSERVER_XORG_SERVER and a 
display manager like BR2_PACKAGE_NODM, then I get 2 files in 
/etc/init.d:

S40xorg which starts the server /usr/sbin/Xorg first and
S90nodm which then tries to start another copy of Xorg (to call 
/etc/X11/Xsession and get everything on the display).

Obviously, this doesn't work because nodm can't start a second X server, 
and the visual result is a black screen.  The only solution I can see is 
a post-build script to remove the S40xorg script to disable X and allow 
nodm to manage X.

I've tried looking for:
(a) A way to tell Xorg that nodm is the default application
(b) A way to tell nodm that an Xorg is already running (the S90nodm 
script reads /etc/default/* but NODM_XINIT is now ignored and there 
aren't any other obvious options to nodm)
(c) To use a different display manager, xdm, but they all seem to insert 
an init.d file that's in the range S90-S99 and follow the same 
presumption (that X has not started)

What's the best (future-proof) approach to getting a display manager 
working with X in buildroot?

Cheers,
Tudor


P.S. (As an aside, why don't more buildroot init scripts use 
/etc/default config files?)
