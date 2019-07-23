From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 23 Jul 2019 21:36:46 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2019-07-20
In-Reply-To: <9d0c9348-7ca4-bca5-3c89-17c1b1358069@andin.de>
References: <20190721060040.4E27586230@whitealder.osuosl.org>
 <20190721210110.0b3620b0@gmx.net>
 <9f2cfe09-b9af-285f-b192-f7b2bc975d68@andin.de>
 <20190722202140.207e29c3@gmx.net>
 <9d0c9348-7ca4-bca5-3c89-17c1b1358069@andin.de>
Message-ID: <20190723213646.326c6fd9@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Andreas,

On Tue, 23 Jul 2019 15:14:50 +0200, Andreas Naumann <dev@andin.de> wrote:

> Hi Peter,
>
> Am 22.07.19 um 20:21 schrieb Peter Seiderer:
> > Hello Andreas,
> >
> > On Mon, 22 Jul 2019 16:09:59 +0200, Andreas Naumann <dev@andin.de> wrote:
> >
> >> Hello Peter, all,
> >>
> >>
> >> Am 21.07.19 um 21:01 schrieb Peter Seiderer:
> >>> Hello *,
> >>>
> >>> On Sun, 21 Jul 2019 06:00:34 -0000, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
> >>>
> >>>> Hello,
> >>>>
> >>>> Build statistics for 2019-07-20
> >>>
> >>> [...]
> >>>
> >>>>        sparc64 |                  libv4l-1.16.5 | NOK | http://autobuild.buildroot.net/results/79c1e1b7a1bc53c1e9b2ae0c9acb443e6d2e2994 |
> >>>
> >>> make[4]: Entering directory '/home/buildroot/build/instance-1/output/build/libv4l-1.16.5/utils/qv4l2'
> >>>
> >>> [...]
> >>>
> >>>     CXXLD    qv4l2
> >>> libtool: warning: library '/home/buildroot/build/instance-1/output/host/bin/../sparc64-buildroot-linux-gnu/sysroot/usr/lib/libQt5Widgets.la' was moved.
> >>> libtool:   error: cannot find the library '' or unhandled argument '/libQt5Gui.so'
> >>> Makefile:571: recipe for target 'qv4l2' failed
> >>>
> >>>
> >>> >From host/sparc64-buildroot-linux-gnu/sysroot/usr/lib/libQt5Widgets.la:
> >>>
> >>> 	# Libraries that this one depends upon.
> >>> 	dependency_libs='-latomic /libQt5Gui.so /libQt5Core.so -lpthread -lrt -lpthread -ldl '
> >>
> >>
> >> I have rebuilt the sparc config that led to this failure as well as an
> >> arm config (imx6-sabresd_qt5) and can confirm that both now (Qt 5.12.4)
> >> create lines like
> >>     dependency_libs='-latomic <pkg-build-dir>/lib/libQt5Core.so -lpthread
> >> -lrt -lpthread -ldl '
> >>
> >> instead of (Qt 5.11.3)
> >>     dependency_libs='-L<pkd-build-dir>/lib -lQt5Core -lrt -ldl -latomic
> >> -lpthread '
> >>
> >> Right now I dont have the time to find out why and what exactly has
> >> changed in Qt (or elsewhere) to cause that.
> >>
> >>>
> >>> This can be fixed by reverting 'qt5: Remove *.la/*.prl fixup script' ([1]), and adding
> >>>
> >>> 	-e "s:\/lib\([a-zA-Z0-9_-]*\)\.so:-l\1:g"
> >>>
> >>> to the sed statement, resulting in the following dependency_libs line:
> >>>
> >>> 	# Libraries that this one depends upon.
> >>> 	dependency_libs='-latomic -lQt5Gui -lQt5Core -lpthread -lrt -lpthread -ldl '
> >>
> >> Obviously the la fixup code in pkg-generic.mk is no longer able to
> >> handle the occurence of so-files with full path correctly. However, I
> >> wonder if pkg-generic would be an acceptable place to fix the issue.?
> >
> > Can confirm that the following (quick hack) fixes the problem too:
> >
> > --- a/package/pkg-generic.mk
> > +++ b/package/pkg-generic.mk
> > @@ -305,6 +305,7 @@ $(BUILD_DIR)/%/.stamp_staging_installed:
> >                                  -e "s:@TOOLCHAIN_EXTERNAL_INSTALL_DIR@:$(TOOLCHAIN_EXTERNAL_INSTALL_DIR):g") \
> >                          -e "s:@STAGING_DIR@:$(STAGING_DIR):g" \
> >                          -e "s:@BASE_DIR@:$(BASE_DIR):g" \
> > +                       -e "s:\/lib\([a-zA-Z0-9_-]*\)\.so:-l\1:g" \
> >                          "$${la}.fixed" && \
> >                  if cmp -s "$${la}" "$${la}.fixed"; then \
> >                          rm -f "$${la}.fixed"; \
>
> Somebody reported a similar issue (and workaround) in the QT bugracker:
> https://bugreports.qt.io/browse/QTBUG-76625
> Theres also a fix for it, however it has no effect on the appearance of
> so-file. As I understand it they rather fix the path to it.
>
> The real reason behind our problem seems to be:
>
> commit 5b3dfa470ed7ea40103daa785286ab71fb7aa230
> Author: Oswald Buddenhagen <oswald.buddenhagen@qt.io>
> Date:   Wed Dec 19 12:46:52 2018 +0100
>
>      qmake: link qt libraries by full path
>
>      this avoids the scenario where the linker would pick up the wrong qt
>      libraries for LIBS_PRIVATE because LIBS added the "wrong" path first.
>      this is also consistent with configure-supplied dependencies as of
>      recently.
>
>      as a side effect, this also removes pretenses of lsb linker
> handling, as
>      it makes no sense after the change and is certainly obsolete anyway.
>
>      Fixes: QTBUG-50921
>
> I made a comment in 76625. If I understand the issue correctly, then
> qmake needs to add '-l' in front of the absolute so-files. We in turn
> would need to not remove the build-dir when occuring in an so-file, but
> replace it with the staging dir. Otherwise we might hit the same issue
> that 5b3dfa4 was trying to fix, right?

Thanks for investigation and the hints...., with the following patch

--- qt5base-5.12.4/mkspecs/features/qt.prf-001	2019-07-23 20:57:39.668312458 +0200
+++ qt5base-5.12.4/mkspecs/features/qt.prf	2019-07-23 20:58:44.289581880 +0200
@@ -217,7 +217,7 @@
                     lib = $$MODULE_LIBS/$$QMAKE_PREFIX_STATICLIB$${lib}.$$QMAKE_EXTENSION_STATICLIB
                     PRE_TARGETDEPS += $$lib
                 } else {
-                    lib = $$MODULE_LIBS/$$QMAKE_PREFIX_SHLIB$${lib}.$$QMAKE_EXTENSION_SHLIB
+                    lib = -L$$MODULE_LIBS -l$${lib}
                 }
                 LIBS$$var_sfx += $$lib
             }


I get the following entry in build/qt5base-5.12.4/lib/libQt5Widgets.la:

	dependency_libs='-L/home/seiderer/Work/Buildroot/build_sparc_qt_libv4l_001/build/qt5base-5.12.4/lib -lQt5Gui -lQt5Core -latomic -lrt -ldl -lpthread -lrt -lpthread -ldl '

And in host/sparc64-buildroot-linux-gnu/sysroot/usr/lib/libQt5Widgets.la:

	dependency_libs=' -lQt5Gui -lQt5Core -latomic -lrt -ldl -lpthread -lrt -lpthread -ldl '

And the build of libv4l/utils/qv4l2 succeeds...

Regards,
Peter

>
> regards,
> Andreas
>
> >
> > Regards,
> > Peter
> >
> >>
> >>
> >> regards,
> >> Andreas
> >>
> >>
> >>>
> >>> Regards,
> >>> Peter
> >>>
> >>> [1] https://git.buildroot.net/buildroot/commit/?id=428e5276e4df0b4bbd75df38565298ad53ea4f8b
> >>> _______________________________________________
> >>> buildroot mailing list
> >>> buildroot at busybox.net
> >>> http://lists.busybox.net/mailman/listinfo/buildroot
> >>>
> >
