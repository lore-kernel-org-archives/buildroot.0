From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Sep 2014 19:56:33 +0200
Subject: [Buildroot] [git commit] sudo: don't use hardening flags on host
	tools
Message-ID: <20140921175639.E7E909D4C0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=22b65765556d544678749fc24fcd03d968a9a1c5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Don't use hardening (SSP_CFLAGS & PIE_CFLAGS) flags on host tools since
the host compiler may differ wildly from the tests run on the cross
compiler and they might not work. Fixes:
http://autobuild.buildroot.net/results/b10/b1091bd04ab988744548b74fb48c64bf291fed2f/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...do-0002-drop-sspcflags-piecflags-for-host.patch |   21 ++++++++++++++++++++
 1 files changed, 21 insertions(+), 0 deletions(-)

diff --git a/package/sudo/sudo-0002-drop-sspcflags-piecflags-for-host.patch b/package/sudo/sudo-0002-drop-sspcflags-piecflags-for-host.patch
new file mode 100644
index 0000000..9f09656
--- /dev/null
+++ b/package/sudo/sudo-0002-drop-sspcflags-piecflags-for-host.patch
@@ -0,0 +1,21 @@
+Don't use SSP_CFLAGS and PIE_CFLAGS for host tools.
+http://www.sudo.ws/bugs/show_bug.cgi?id=662
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura sudo-1.8.10p3.orig/compat/Makefile.in sudo-1.8.10p3/compat/Makefile.in
+--- sudo-1.8.10p3.orig/compat/Makefile.in	2014-03-07 18:51:19.000000000 -0300
++++ sudo-1.8.10p3/compat/Makefile.in	2014-09-20 07:29:30.913108029 -0300
+@@ -96,10 +96,10 @@
+ 	./mksigname > $@
+ 
+ mksiglist: $(srcdir)/mksiglist.c $(srcdir)/mksiglist.h $(incdir)/missing.h $(top_builddir)/config.h
+-	$(CC) $(CPPFLAGS) $(CFLAGS) $(PIE_CFLAGS) $(SSP_CFLAGS) $(DEFS) $(srcdir)/mksiglist.c -o $@
++	$(CC) $(CPPFLAGS) $(CFLAGS) $(DEFS) $(srcdir)/mksiglist.c -o $@
+ 
+ mksigname: $(srcdir)/mksigname.c $(srcdir)/mksigname.h $(incdir)/missing.h $(top_builddir)/config.h
+-	$(CC) $(CPPFLAGS) $(CFLAGS) $(PIE_CFLAGS) $(SSP_CFLAGS) $(DEFS) $(srcdir)/mksigname.c -o $@
++	$(CC) $(CPPFLAGS) $(CFLAGS) $(DEFS) $(srcdir)/mksigname.c -o $@
+ 
+ fnm_test: fnm_test.o libreplace.la
+ 	$(LIBTOOL) --mode=link $(CC) -o $@ fnm_test.o libreplace.la $(PIE_LDFLAGS) $(SSP_LDFLAGS)
