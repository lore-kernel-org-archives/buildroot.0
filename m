From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 27 Jan 2015 23:58:14 +0100
Subject: [Buildroot] [git commit] rt-tests: fix build dependencies
Message-ID: <20150127225936.C10027FC85@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f0ea0e75337bf81bbf075bc8f517b6d5b5962a11
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some tests didn't list librttest in their dependencies.

Fixes:
http://autobuild.buildroot.net/results/999/9998dcf8c82989d9eba772e16ce3905b24badbfc/
http://autobuild.buildroot.net/results/b1e/b1e078591d65a3b5c9d638ad5bbb4ec8c28c38ef/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../04-Makefile-fix-tests-dependencies.patch       |   50 ++++++++++++++++++++
 1 files changed, 50 insertions(+), 0 deletions(-)

diff --git a/package/rt-tests/04-Makefile-fix-tests-dependencies.patch b/package/rt-tests/04-Makefile-fix-tests-dependencies.patch
new file mode 100644
index 0000000..0b2feb1
--- /dev/null
+++ b/package/rt-tests/04-Makefile-fix-tests-dependencies.patch
@@ -0,0 +1,50 @@
+From e464368807211978fe2dfccf081fa8dc7a35b71b Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Fri, 23 Jan 2015 07:52:21 +0200
+Subject: [PATCH] Makefile: fix tests dependencies
+
+librttest is listed in $(LIBS) so all tests must depend on librttest.a.
+Fixes build failures like:
+
+.../armv7-ctng-linux-gnueabihf-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -Os -g2  -o hackbench hackbench.o -lrt -lpthread -lrttest -L.
+.../armv7-ctng-linux-gnueabihf/bin/ld: cannot find -lrttest
+collect2: error: ld returned 1 exit status
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+ Makefile | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index a3879cea8164..b9a1fed1b920 100644
+--- a/Makefile
++++ b/Makefile
+@@ -69,14 +69,14 @@ cyclictest: cyclictest.o librttest.a
+ signaltest: signaltest.o librttest.a
+ 	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS)
+ 
+-pi_stress: pi_stress.o
++pi_stress: pi_stress.o librttest.a
+ 	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS)
+ 
+ hwlatdetect:  src/hwlatdetect/hwlatdetect.py
+ 	chmod +x src/hwlatdetect/hwlatdetect.py
+ 	ln -s src/hwlatdetect/hwlatdetect.py hwlatdetect
+ 
+-rt-migrate-test: rt-migrate-test.o
++rt-migrate-test: rt-migrate-test.o librttest.a
+ 	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS)
+ 
+ ptsematest: ptsematest.o librttest.a
+@@ -97,7 +97,7 @@ sendme: sendme.o librttest.a
+ pip_stress: pip_stress.o librttest.a
+ 	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS)
+ 
+-hackbench: hackbench.o
++hackbench: hackbench.o librttest.a
+ 	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS)
+ 
+ librttest.a: rt-utils.o error.o rt-get_cpu.o
+-- 
+2.1.4
+
