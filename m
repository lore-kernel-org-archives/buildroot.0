From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 21 Jan 2015 00:44:33 +0100
Subject: [Buildroot] setting up xorg in buildroot
Message-ID: <trinity-76b3a5be-0b9d-44eb-9471-9e5c055992a7-1421797473752@3capp-gmx-bs26>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Lou,

On Sun, Jan 18, 2015 at 10:46:56PM -0600, Lou Crittenden wrote:
> I was wondering how to set up X in buildroot to work with the waveshare32b
> display, and to where it will work with the touchscreen we got working
> earlier. I have xorg and xorg-server installed, but when I run it as root,
> it outputs: "*Caught signal 11 (Segmentation fault). Server aborting*" when
> I run it on my raspberry pi. It outputs "server must be suid root", but
> oddly when I run it in a qemu-based raspberry pi emulator, it starts up,
> but I can't use a keyboard or mouse. I was also able to get X to start up
> at boot by editing /etc/init.d/rcs, but with the same symptoms.

Not much help here, I normaly run qt applications with linuxfb driver
(without X) e.g.:

$ some_qt_app -platform linuxfb:fb=/dev/fb1 -plugin evdevtouch:/dev/input/event3:rotate=270

But tested KDrive/TinyX with my adafruit28 display.

Enabled the following buildroot configs (dillo only as test application):

BR2_PACKAGE_XORG7=y
BR2_PACKAGE_XSERVER_XORG_SERVER=y
BR2_PACKAGE_XSERVER_XORG_SERVER_KDRIVE_EVDEV=y
BR2_PACKAGE_DILLO=y

After build and deploy to target run the following on the target:

$ X &
$ export DISPLAY=localhost:0
$ dillo

should show the dillo web browser on your hdmi monitor.

Or (after killing the previous X server, or reboot):

$ X -fb /dev/fb1 &
$ export DISPLAY=localhost:0
$ dillo

should show the dillo web browser on your waveshare32b display...

Did not investigate how to configure input in case of KDrive yet...

Regards,
Peter
