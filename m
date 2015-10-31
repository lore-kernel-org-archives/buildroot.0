From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 31 Oct 2015 15:59:53 +0100
Subject: [Buildroot] [git commit] package/dvblast: fix static linking
Message-ID: <20151031150258.CC1E681910@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bbb66c1044f73591f4d450b9b8a346027e1eabd3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

dvblast links to -lev, which calls functions from -lm, like floor().

dvblast does not use libtool, so it does not pull in the libev
dependencies when doing a static link.

Fix that by always pulling in -lm after -lev. We can not do it from the
.mk, because libraries passed from the .mk end up at the beginning of
the list.

Fixes:
    http://autobuild.buildroot.org/results/1f0/1f02f84fb926839a1adbe3af457bb909fdc44433/
    http://autobuild.buildroot.org/results/6af/6af3abcdced1cc689a59fe11483f5cdcae0cfd38/
    ...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Julian Scheel <julian@jusst.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dvblast/0001-missing-lm.patch |   29 +++++++++++++++++++++++++++++
 1 files changed, 29 insertions(+), 0 deletions(-)

diff --git a/package/dvblast/0001-missing-lm.patch b/package/dvblast/0001-missing-lm.patch
new file mode 100644
index 0000000..2efbec4
--- /dev/null
+++ b/package/dvblast/0001-missing-lm.patch
@@ -0,0 +1,29 @@
+dvblast: fix static linking
+
+dvblast links to -lev, wihch uses functions from the maths library,
+like floor().
+
+When linking to a shared libev.so, that dependency is automatically
+pulled in because libev as a DT_NEEDED ELF tag on libm.so.
+
+But when lnking to the static libev.a, since there is no way to express
+such dependencies in static libraries, libm is not pulled in, which
+leads to build failures such as;
+    http://autobuild.buildroot.org/results/1f0/1f02f84fb926839a1adbe3af457bb909fdc44433/build-end.log
+
+Fix that by always linking to -lm (which must come *after* -lev).
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff -durN dvblast-3.0.orig/Makefile dvblast-3.0/Makefile
+--- dvblast-3.0.orig/Makefile	2015-10-05 17:51:14.000000000 +0200
++++ dvblast-3.0/Makefile	2015-10-30 15:57:19.547123894 +0100
+@@ -28,7 +28,7 @@
+ LDLIBS += -lstreammaster
+ endif
+ 
+-LDLIBS_DVBLAST += -lpthread -lev
++LDLIBS_DVBLAST += -lpthread -lev -lm
+ 
+ OBJ_DVBLAST = dvblast.o util.o dvb.o udp.o asi.o demux.o output.o en50221.o comm.o mrtg-cnt.o asi-deltacast.o
+ OBJ_DVBLASTCTL = util.o dvblastctl.o
