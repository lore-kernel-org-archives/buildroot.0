From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 9 Dec 2018 20:59:31 +0100
Subject: [Buildroot] [PATCH] pkgconf: bump to 1.5.3, change upstream
In-Reply-To: <ul30efx8ue.ln2@ID-313208.user.individual.net>
References: <20180908200507.23939-1-thomas.petazzoni@bootlin.com>
 <ul30efx8ue.ln2@ID-313208.user.individual.net>
Message-ID: <20181209195931.GE3383@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2018-12-09 19:31 +0100, Bernd Kuhls spake thusly:
> Am Sat, 08 Sep 2018 22:05:07 +0200 schrieb Thomas Petazzoni:
> 
> > Of course, updating pkgconf has the potential of breaking lots of
> > things, that's why I would suggest to update early in the development
> > cycle, to leave us enough time to resolve issues.
> 
> Hi,
> 
> libxcb got broken due to this bump:
> http://autobuild.buildroot.net/?reason=libxcb-1.13
> 
> Libxcb configure checks for the variable xcbincludedir of the xcb-proto 
> package during configure:
> https://cgit.freedesktop.org/xcb/libxcb/tree/configure.ac#n75
> 
> This results in
> 
> $ /home/bernd/buildroot/br8_ffmpeg3_kodi17_github/output/host/bin/pkg-
> config --variable=xcbincludedir xcb-proto
> 
> /home/bernd/buildroot/br8_ffmpeg3_kodi17_github/output/host/x86_64-
> buildroot-linux-uclibc/sysroot/home/bernd/buildroot/
> br8_ffmpeg3_kodi17_github/output/host/bin/../x86_64-buildroot-linux-
> uclibc/sysroot/usr/share/xcb
> 
> Please note that "/home/bernd/buildroot/..." is present twice in the 
> pkgconfig result.

Have you noticed that it is us that are adding the sysroot to the
xcb-proto.pc file:

    https://git.buildroot.org/buildroot/tree/package/x11r7/xcb-proto/xcb-proto.mk#n18

and thus maybe we need to dfrop this tweak now that pkgconf does it for
us?

Regards,
Yann E. MORIN.

> There seems to be an attempt to fix the problem
> https://patchwork.freedesktop.org/patch/179233/
> but it makes things even worse:
> 
> checking XCBPROTO_XCBINCLUDEDIR... /home/bernd/buildroot/
> br8_ffmpeg3_kodi17_github/output/host/x86_64-buildroot-linux-uclibc/
> sysroot/home/bernd/buildroot/br8_ffmpeg3_kodi17_github/output/host/bin/../
> x86_64-buildroot-linux-uclibc/sysroot/home/bernd/buildroot/
> br8_ffmpeg3_kodi17_github/output/host/bin/../x86_64-buildroot-linux-
> uclibc/sysroot/usr/share/xcb
> checking XCBPROTO_XCBPYTHONDIR... /home/bernd/buildroot/
> br8_ffmpeg3_kodi17_github/output/host/x86_64-buildroot-linux-uclibc/
> sysroot/home/bernd/buildroot/br8_ffmpeg3_kodi17_github/output/host/bin/../
> x86_64-buildroot-linux-uclibc/sysroot/home/bernd/buildroot/
> br8_ffmpeg3_kodi17_github/output/host/bin/../x86_64-buildroot-linux-
> uclibc/sysroot/usr/lib/python2.7/site-packages
> 
> Now "/home/bernd/buildroot/..." is present three times...
> 
> Regards, Bernd
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
