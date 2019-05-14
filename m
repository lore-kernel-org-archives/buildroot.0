From: Laurentiu-Cristian Duca <laurentiu.duca@gmail.com>
Date: Tue, 14 May 2019 16:51:21 +0300
Subject: [Buildroot] Keyboard and mouse not working in X server
Message-ID: <CAPm8-H57Nh28bx-pB8hukv8FAPLKe4xQ2EgtGVCWvZntThP3Og@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Buildroot community,

  I am an open source enthusisast and I am new to buildroot.
I have built in buildroot 2019.02.1
a raspberry pi 1 configuration
with Xorg server (1.20.3) and xdriver_xf86-input-mouse-1.9.3
xdriver_xf86-input-keyboard-1.9.0 and SystemV init.

  I use simple USB keyboard and mouse.

  Keyboard works in consle tty1 (HDMI display).
  startx runs successfully but mouse and keyboard do not work with X started.
X just shows 3 open xterm windows and I can not write or move mouse cursor
(which is showed in the center of the screen).

  I have tried xorg.conf with:
Section "Device"
        Identifier      "Allwinner A10/A13 FBDEV"
        Driver          "fbturbo"
        Option          "fbdev" "/dev/fb0"
        Option          "SwapbuffersWait" "true"
EndSection

  I have also tried with no success combinations with:

Section "InputDevice"
    Identifier  "Mouse"
    Driver      "mouse"
    Option      "Protocol"      "auto"
    Option      "Device"        "/dev/bus/usb/001/005"
EndSection

Section "InputDevice"
    Identifier     "Keyboard0"
    Driver         "kbd"
    Option         "XkbLayout" "us"
    Option         "XkbModel" "pc105"
EndSection

  When I have nothing connected to usb
find /dev/ | grep -i "usb"
it shows:
/dev/bus/usb
/dev/bus/usb/001
/dev/bus/usb/001/003
/dev/bus/usb/001/002
/dev/bus/usb/001/001
  If I insert keyboard and mouse it also shows:
/dev/bus/usb/001/006
/dev/bus/usb/001/005
/dev/bus/usb/001/004

# ls /usr/lib/xorg/modules/input/
kbd_drv.so    mouse_drv.so
# xinput --list
??? Virtual core pointer                        id=2    [master pointer  (3)]
???   ??? Virtual core XTEST pointer                    id=4    [slave
 pointer  (2)]
??? Virtual core keyboard                       id=3    [master keyboard (2)]
    ??? Virtual core XTEST keyboard                     id=5    [slave
 keyboard (3)]
No success with:
# xinput enable 2
(and 3, 4, 5)

I do not use udev or mdev, instead I use devtmpfs. Is there any way to have
mouse and keyboard working?
# cat /var/log/Xorg.0.log
...
[  2042.804] (II) The server relies on udev to provide the list of
input devices.
        If no devices become available, reconfigure udev or disable
AutoAddDevices.
[  2042.804] (II) Loader magic: 0x1d8e58
[  2042.804] (II) Module ABI versions:
[  2042.804]    X.Org ANSI C Emulation: 0.4
[  2042.804]    X.Org Video Driver: 24.0
[  2042.804]    X.Org XInput driver : 24.1
[  2042.804]    X.Org Server Extension : 10.0
[  2042.816] (++) using VT number 1
...

  Any ideas?

Thank you and best regards,
L-C. Duca
