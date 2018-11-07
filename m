From: Tim Harvey <tharvey@gateworks.com>
Date: Wed, 7 Nov 2018 08:17:47 -0800
Subject: [Buildroot] Altering a package to pull from GIT
Message-ID: <CAJ+vNU2bzK3AD8BV6u_F-eXGdyKjGrrmGkyGT-e2kyRNxEE+zg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings,

I'm trying to alter the openocd package to pull code from a specific git
sha. Looking over the manual and searching a bit it seems like the
following is the thing to do:

diff --git a/package/openocd/openocd.mk b/package/openocd/openocd.mk
index 548d8b8..76594fe 100644
--- a/package/openocd/openocd.mk
+++ b/package/openocd/openocd.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################

-OPENOCD_VERSION = 0.10.0
+OPENOCD_VERSION = da4b2d5beb
 OPENOCD_SOURCE = openocd-$(OPENOCD_VERSION).tar.bz2
-OPENOCD_SITE =
http://sourceforge.net/projects/openocd/files/openocd/$(OPENOCD_VERSION)
+OPENOCD_SITE = git://git.code.sf.net/p/openocd/code
+OPENCOD_SITE_METHOD = git
 OPENOCD_LICENSE = GPL-2.0+
 OPENOCD_LICENSE_FILES = COPYING
 # 0002-configure-enable-build-on-uclinux.patch patches configure.ac


In other words _SITE needs to be the git:// URL and _VERSION should be the
branch/tag/sha. However when I build I get:

>>> openocd da4b2d5beb Extracting
bzcat /usr/src/ventana/buildroot/dl/openocd/openocd-da4b2d5beb.tar.bz2 |
tar --s
trip-components=1 -C
/usr/src/ventana/buildroot/output/build/openocd-da4b2d5beb
  -xf -
bzcat: /usr/src/ventana/buildroot/dl/openocd/openocd-da4b2d5beb.tar.bz2 is
not a
 bzip2 file.
tar: This does not look like a tar archive
tar: Exiting with failure status due to previous errors
package/pkg-generic.mk:160: recipe for target
'/usr/src/ventana/buildroot/output
/build/openocd-da4b2d5beb/.stamp_extracted' failed
make[1]: ***
[/usr/src/ventana/buildroot/output/build/openocd-da4b2d5beb/.stamp_
extracted] Error 2
Makefile:84: recipe for target '_all' failed
make: *** [_all] Error 2

I thought it was the fact there was an openocd.hash but removing it still
fails. Any ideas?

Best regards,

Tim
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20181107/183304b7/attachment.html>
