From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 12 Dec 2018 10:00:11 +0100
Subject: [Buildroot] [PATCH 1/1] ccid: fix build with pkgconf 1.5.3
In-Reply-To: <317217fa-713a-dd3f-117d-aa49da4f13d3@mind.be>
References: <20181211172124.30082-1-fontaine.fabrice@gmail.com>
 <d8aca54b-9283-d230-e3ba-7cbba7472ddd@mind.be> <20181211185514.GM3383@scaer>
 <8ff6fe47-bbcf-caeb-59cf-72db797cf00b@mind.be>
 <CAPi7W80JJVbLZXGYBbf-i65YCocoTPHp3k75dR-=3D53saMc9g@mail.gmail.com>
 <317217fa-713a-dd3f-117d-aa49da4f13d3@mind.be>
Message-ID: <CAPi7W81h-rNjWd1AJAE223E3JNNVNzop3CFjEfwrhonJ9+owAA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout,
Le mer. 12 d?c. 2018 ? 09:50, Arnout Vandecappelle <arnout@mind.be> a ?crit :
>
>
>
> On 11/12/2018 23:45, Fabrice Fontaine wrote:
> > Hello,
> > Le mar. 11 d?c. 2018 ? 22:57, Arnout Vandecappelle <arnout@mind.be> a ?crit :
> [snip]
> >>  I can't say I really like any of these solutions though...
> > An other option would be to ignore the value provided by pkgconfig.
> > For example, we can pass
> > --enable-usbdropdir=$(TARGET_DIR)/usr/lib/pcsc/drivers to ccid's
> > configure.
> > Would it be acceptable?
>
>  Since a good fundamental solution will take some time to flesh out, and since
> the autobuilders are exploding because of this, it's a great proposal.
>
>  However, shouldn't it be --enable-usbdropdir=/usr/lib/pcsc/drivers? DESTDIR is
> still prepended to it, no?
Yes, you're right.
>
>  Put something like this in the commit message:
>
> Since the bump to 1.5.3, pkgconf prepends the sysroot to all absolute paths
> found in the .pc file. This is correct when the paths refer to something in
> STAGING_DIR (e.g. libdir, includedir), but not when it refers to something used
> for the target.
>
> ccid uses the usbdropdir variable from libpcsclite.pc to decide where to install
> things. Since DESTDIR is prepended to the install destination, this will end up
> in the wrong location.
>
> Until a better solution is found in pkgconf, pass the usbdropdir to use
> explicitly instead of relying on libpcsclite.pc.
OK, I will do.
>
>
>  BTW, is the libva issue similar?
It is somewhat similar, the difference is that build won't fail on
install step but in build step because pkgconfig is used to find
wayland-scanner which is built for the target not the host:
/accts/mlweber1/rclinux/rc-buildroot-test/scripts/instance-3/output/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/bin/wayland-scanner

I will also try to fix the other packages: acsccid, iwd, ...
>
>  Regards,
>  Arnout
Best Regards,

Fabrice
