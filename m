From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Jul 2010 08:55:16 +0200
Subject: [Buildroot] Issue with Xfbdev and keyboard
Message-ID: <20100720085516.0f7b0887@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I'm trying to use our Xfbdev X.org server, but it unfortunately
complains on startup with:

===================================================================
(EE) XKB: Couldn't open rules file /usr/share/X11/xkb/rules/base
XKB: Failed to compile keymap
Keyboard initialization failed. This could be a missing or incorrect
setup of xkeyboard-config
===================================================================

And indeed, I haven't compiled xkeyboard-config. However, it seems to
me that in the past, all the keymap mess wasn't necessary by default.
Is this a behaviour change in X.org server ? If xkeyboard-config is
really mandatory, then it should become a dependency of xserver_xorg.
Any hints on this ?

To solve this, I enabled the compilation of xkeyboard-config, which
needs xkbcomp on the host, so I added a dependency on
host-xapp_xkbcomp. But unfortunately, host-xapp_xkbcomp would depend on
host-xlib_libX11, which we until now managed to avoid building. And in
turn host-xlib_libX11 would depend on quite a few things, which would
give the following dependency chain:

 xkeyboard-config
   |
   |-> host-xapp_xkbcomp
         |
         |-> host_xlib_libX11
              |
              |-> host-libxcb
              |-> host-xutil_util-macros
              |-> host-xlib_xtrans (already built)
              |-> host-xlib_libXau
              |-> host-xlib_libXdmcp
              |-> host-xproto_kbproto
              |-> host-xproto_xproto (already built)
              |-> host-xproto_xextproto
              |-> host-xproto_inputproto
              |-> host-xproto_xf86bigfontproto
              |-> host-xproto_bigreqsproto
              |-> host-xproto_xcmiscproto

Do we want to go down this road ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
