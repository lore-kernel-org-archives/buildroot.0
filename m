From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Sun, 23 Sep 2007 22:16:52 +0300
Subject: [Buildroot] some tips for x11r7
Message-ID: <46F6BBA4.80002@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here are some tips to make very basic compiling and running x11r7 on arm.
(svn revision 19976)

1) apply xserver_xorg-server-localstatedir.patch ( makes X to create Xorg.0.log in /var/log/ )

2) do this magic command on target:

ln -s 03000000,2 /etc/arm_systype

Otherwise you will get "xf86EnableIOPorts failed to set IOPL for IO" errors.

3) hand-copy your X11 fonts (mine are localed in /usr/X11R6/lib/X11/fonts/misc) to /usr/lib/X11/fonts/misc on the target.
   Buildroot currently fails to create font.alias and font.dir listings.

4) hand-copy from build_arm/staging_dir/usr/lib/xorg/modules to usr/lib/xorg/modules on the target, they are not installed
   automatically by buildroot.

5) hand-copy fbdev_drv.so from build_arm/xdriver_xf86-video-fbdev-0.3.1/src/.libs to
usr/lib/xorg/modules/drivers. It is not installed automatically by buildroot.

6) hand-copy evdev_drv.so, kbd_drv.so, keyboard_drv.so, mouse_drv.so from
   their build dirs to /usr/lib/xorg/modules/input on the target. These libs are also not installed
   automatically.

7) Create your /etc/X11/xorg.conf via /usr/bin/xorgconfig on the target.
   ...
Section "Files"
   FontPath   "/usr/lib/X11/fonts/misc/"
   ...
Section "Device"
    Identifier  "mycard1"
    Driver      "fbdev"
EndSection

8) start your X using "fbdev" driver:

X -allowMouseOpenFail -pointer "mouse" :0

9) Test your X app (I checked xclock application)


Best regards,
Ivan

--------------------------------
Embedded Linux engineer,
Promwad Company: http://www.promwad.com/
Homepage : http://www.ivankuten.com/
--------------------------------
