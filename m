From: =?UTF-8?Q?Einar_J=C3=B3n?= <tolvupostur@gmail.com>
Date: Sun, 1 Mar 2020 14:55:33 +0100
Subject: [Buildroot] Beaglebone support
In-Reply-To: <CAPmASeu4KLNSK=nkgb04C4UKwTsDfjyZ0RXOCkF2r3yWyHYWJg@mail.gmail.com>
References: <CAPmASeu4KLNSK=nkgb04C4UKwTsDfjyZ0RXOCkF2r3yWyHYWJg@mail.gmail.com>
Message-ID: <CABhNV22j46zXYJimCgP7Z-VK=kbbosiQr0V7ObVW0Y3cW-VVZg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Andrea, Sebastien

Sorry for the late response. I've been meaning to build and fix the qt5 for
beaglebone, but I'm in the middle of switching jobs and moving countries,
and I don't have the buildroot repo.
The beaglebone_qt5_defconfig should mostly work with the latest addition of
new ti-sgx drivers (added in November or so). It now builds the latest
drivers for ti-sgx (which finally builds the KMS plugin for QT), and
QtMultimedia should work. I have been building QtMultimedia and QtWebEngine
with the old ti-sgx drivers and writing directly to the frame buffer (no
acceleration because KMS plugin wouldn't build, no Weston) for over a year.

I haven't tried that exact setup since the addition, but you probably need
to add
BR2_KERNEL_NEEDS_OPENSSL=y
for it to build. Compare beaglebone_qt5_defconfig to beaglebone_defconfig
for exact spelling of this option.

There is also an environment variable:
export QT_QPA_EGLFS_INTEGRATION=eglfs_kms
that needs to be set to  to use the kms plugin (or
QT_QPA_EGLFS_INTEGRATION=none to run it without acceleration).
It can be set on the command line, or a default value in package/qt5/
qt5base.mk
See https://doc.qt.io/qt-5.12/embedded-linux.html

Other stuff to consider:
1) Note that the framebuffer must be writable for the user running the QT
program (e.g. "sudo chmod 666 /dev/fb0" ).
2) There are 2 sets of libgbm: ti-sgx-um and ti-sgx-libgbm provide one each
(libgbm.so.1.0.0 and libgbm.so.2.0.0). I think the ti-sgx-libgbm should not
be there at all - ti-sgx-um internalized libgbm recently, and that's
probably the one to use.

Good luck
Einar J?n

On Fri, 31 Jan 2020 at 14:28, Andrea Simeoni <andreasimeoni73@gmail.com>
wrote:

> Hi, because I was not able to run Buildroot on RPi4+Qt5/QML w/ hw
> acceleration, I'm going to give it a try with a Beaglebone Black.
>
> I'm aware you cannot try *all* the almost infinite combinations of
> packages, but I politely ask if someone tried to use this board with
> Qt5/QML, QtMultimedia (broken since a lot of years on RPi - not a Buildroot
> fault, of course!) and omxplayer.
>
> I would like to run Qt5 with a GPU driver, not a standard linuxfb.
> Thanks in advance
> Andrea
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>


-- 
Regards
Einar J?n
+31 610 957234
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200301/b136922c/attachment.html>
