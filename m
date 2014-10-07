From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Tue, 7 Oct 2014 14:12:24 +0200
Subject: [Buildroot] [PATCH 1/3] host-pkgconf: install pkg-config-native
In-Reply-To: <87r3ylhtfe.fsf@dell.be.48ers.dk>
References: <1411489271-26899-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1411489271-26899-2-git-send-email-eric.le.bihan.dev@free.fr>
 <87r3ylhtfe.fsf@dell.be.48ers.dk>
Message-ID: <20141007121217.GA4028@rmm-p1267483>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

On Mon, Oct 06, 2014 at 09:47:17PM +0200, Peter Korsgaard wrote:
> >>>>> "Eric" == Eric Le Bihan <eric.le.bihan.dev@free.fr> writes:
>
>  > The package host-pkgconf now provides `pkg-config-native`, which uses the
>  > host native sysroot. It is useful for packages which compile build-time
>  > helper tools (such as Gtk+ 3.0).
>
>  > Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
>  > ---
>  >  package/pkgconf/pkg-config-native.in | 3 +++
>  >  package/pkgconf/pkgconf.mk           | 8 ++++++++
>  >  2 files changed, 11 insertions(+)
>  >  create mode 100644 package/pkgconf/pkg-config-native.in
>
>  > diff --git a/package/pkgconf/pkg-config-native.in b/package/pkgconf/pkg-config-native.in
>  > new file mode 100644
>  > index 0000000..7e25cd2
>  > --- /dev/null
>  > +++ b/package/pkgconf/pkg-config-native.in
>  > @@ -0,0 +1,3 @@
>  > +#!/bin/sh
>  > +
>  > +PKG_CONFIG_LIBDIR=@HOST_DIR@/usr/lib/pkgconfig:@HOST_DIR@/usr/share/pkgconfig @HOST_DIR@/usr/bin/pkgconf $@
>
> Why is that needed? host-pkgconf is already built with
> --prefix=$HOST_DIR/usr, so it does the right thing:
>
> strace output/host/usr/bin/pkgconf --cflags blah 2>&1 |grep blah                      ~/source/buildroot
> execve("output/host/usr/bin/pkgconf", ["output/host/usr/bin/pkgconf", "--cflags", "blah"], [/* 50 vars */]) = 0
> open("/home/peko/source/buildroot/output/host/usr/lib/pkgconfig/blah-uninstalled.pc", O_RDONLY) = -1 ENOENT (No such file or directory)
> open("/home/peko/source/buildroot/output/host/usr/lib/pkgconfig/blah.pc", O_RDONLY) = -1 ENOENT (No such file or directory)
> open("/home/peko/source/buildroot/output/host/usr/share/pkgconfig/blah-uninstalled.pc", O_RDONLY) = -1 ENOENT (No such file or directory)
> open("/home/peko/source/buildroot/output/host/usr/share/pkgconfig/blah.pc", O_RDONLY) = -1 ENOENT (No such file or directory)

Of course! No need to re-invent the wheel! Thanks for pointing it out. I will
remove this patch and update the one for libgtk3.

Best regards,
ELB
