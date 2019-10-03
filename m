From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 3 Oct 2019 18:25:28 +0200
Subject: [Buildroot] [PATCH v1] package/libv4l: bump version to 1.18.0
In-Reply-To: <20191002225753.10192fd9@gmx.net>
References: <20191002194316.978-1-ps.report@gmx.net>
 <20191002215346.695a5310@windsurf>
 <20191002222516.043555a1@gmx.net>
 <20191002223511.2f98969c@windsurf.home>
 <20191002225753.10192fd9@gmx.net>
Message-ID: <20191003182529.52c4886d@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Wed, 2 Oct 2019 22:57:53 +0200, Peter Seiderer <ps.report@gmx.net> wrote:

> Hello Thomas,
>
> On Wed, 2 Oct 2019 22:35:11 +0200, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
>
> > On Wed, 2 Oct 2019 22:25:16 +0200
> > Peter Seiderer <ps.report@gmx.net> wrote:
> >
> > > > On Wed,  2 Oct 2019 21:43:16 +0200
> > > > Peter Seiderer <ps.report@gmx.net> wrote:
> > > >
> > > > > - remove 0001-fixup-lfs-mismatch-in-preload-libraries.patch
> > > > >   (Upstream applied [1])
> > > > > - remove 0002-keytable-fix-EVIOCSCLOCKID-related-compile-failure.patch
> > > > >   (Upstream applied [2])
> > > > > - remove 0003-Build-sdlcam-only-if-jpeg-is-enabled.patch
> > > > >   (Upstream applied [3])
> > > > > - remove 0004-v4l2-compliance-needs-fork.patch
> > > > >   (Upstream applied [4])
> > > >
> > > > Since there are no patch left, do we still need AUTORECONF = YES and
> > > > the dependency on host-gettext ?
> > >
> > > Good catch (autoreconf/host-gettext) was added with the 0003-Build-sdlcam-only-if-jpeg-is-enabled.patch
> > > patch ([5]), but without autoreconf I get the following build error (using the config from [6]):
> > >
> > >   .../host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/7.4.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: qv4l2-qv4l2.o: undefined reference to symbol '__atomic_fetch_add_4@@LIBATOMIC_1.0'
> > >   .../host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/7.4.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: /home/seiderer/Work/Buildroot/build_sparc_qt5multimedia_001/host/sparc-buildroot-linux-uclibc/sysroot/lib/libatomic.so.1: error adding symbols: DSO missing from command line
> >
> > How come this is related to autoreconf ? On SPARC, you need to link
> > with -latomic, so this build failure is not too surprising. What is
> > surprising is that an autoreconf fixes it. Do you think you could
> > investigate this ?
>
> Can (try) to investigate, the difference seems to be how the qt compile/link flags
> are generated with/without autoreconf, the bug fixed with 'package/qt5base: fix libtool
> la file dependency_libs entries' ([6]) was only triggered on libv4l/utils/qv4l with
> autoreconf enabled too...

Both versions (autoreconf-enabled/autoreconf-disabled) use the same libtool command line
to link  libv4l-1.18.0/utils/qv4l2/qv4l2 but the resulting command line in the the
autoreconf-disabled case is missing the -latomic part.

	$ diff -u build/libv4l-1.18.0-autoreconf-disabled/libtool build/libv4l-1.18.0-autoreconf-enabled/libtool
[...]
@@ -411,7 +412,7 @@
 inherit_rpath=no

 # Whether libtool must link a program against all its dependency libraries.
-link_all_deplibs=no
+link_all_deplibs=unknown

 # Set to "yes" if exported symbols are required.
 always_export_symbols=no
@@ -542,7 +543,7 @@

 PROGRAM=libtool
 PACKAGE=libtool
-VERSION="2.4.6 Debian-2.4.6-11"
+VERSION=2.4.6
 package_revision=2.4.6

[...]

Searching for 'link_all_deplibs no unknown' gives the following
result:
	https://lists.gnu.org/archive/html/libtool/2007-09/msg00012.html

Stating:

	FYI, in GNU Libtool currently no system get link_all_deplibs set to no.
	(Some distributions change this in their version; Debian for example.)
	This is because link_all_deplibs=no exposes some bugs in libtool, that
	are rather nontrivial to fix.

Regards,
Peter

>
> Regards,
> Peter
>
> [6] https://git.buildroot.net/buildroot/commit/?id=4ad73bf5e6326f7a414ecc94dbac0c79f5d33b31
>
> >
> > Thomas
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
