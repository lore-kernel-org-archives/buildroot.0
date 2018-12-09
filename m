From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 09 Dec 2018 19:31:58 +0100
Subject: [Buildroot] [PATCH] pkgconf: bump to 1.5.3, change upstream
References: <20180908200507.23939-1-thomas.petazzoni@bootlin.com>
Message-ID: <ul30efx8ue.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sat, 08 Sep 2018 22:05:07 +0200 schrieb Thomas Petazzoni:

> Of course, updating pkgconf has the potential of breaking lots of
> things, that's why I would suggest to update early in the development
> cycle, to leave us enough time to resolve issues.

Hi,

libxcb got broken due to this bump:
http://autobuild.buildroot.net/?reason=libxcb-1.13

Libxcb configure checks for the variable xcbincludedir of the xcb-proto 
package during configure:
https://cgit.freedesktop.org/xcb/libxcb/tree/configure.ac#n75

This results in

$ /home/bernd/buildroot/br8_ffmpeg3_kodi17_github/output/host/bin/pkg-
config --variable=xcbincludedir xcb-proto

/home/bernd/buildroot/br8_ffmpeg3_kodi17_github/output/host/x86_64-
buildroot-linux-uclibc/sysroot/home/bernd/buildroot/
br8_ffmpeg3_kodi17_github/output/host/bin/../x86_64-buildroot-linux-
uclibc/sysroot/usr/share/xcb

Please note that "/home/bernd/buildroot/..." is present twice in the 
pkgconfig result.

There seems to be an attempt to fix the problem
https://patchwork.freedesktop.org/patch/179233/
but it makes things even worse:

checking XCBPROTO_XCBINCLUDEDIR... /home/bernd/buildroot/
br8_ffmpeg3_kodi17_github/output/host/x86_64-buildroot-linux-uclibc/
sysroot/home/bernd/buildroot/br8_ffmpeg3_kodi17_github/output/host/bin/../
x86_64-buildroot-linux-uclibc/sysroot/home/bernd/buildroot/
br8_ffmpeg3_kodi17_github/output/host/bin/../x86_64-buildroot-linux-
uclibc/sysroot/usr/share/xcb
checking XCBPROTO_XCBPYTHONDIR... /home/bernd/buildroot/
br8_ffmpeg3_kodi17_github/output/host/x86_64-buildroot-linux-uclibc/
sysroot/home/bernd/buildroot/br8_ffmpeg3_kodi17_github/output/host/bin/../
x86_64-buildroot-linux-uclibc/sysroot/home/bernd/buildroot/
br8_ffmpeg3_kodi17_github/output/host/bin/../x86_64-buildroot-linux-
uclibc/sysroot/usr/lib/python2.7/site-packages

Now "/home/bernd/buildroot/..." is present three times...

Regards, Bernd
