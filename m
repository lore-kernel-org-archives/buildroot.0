From: claurita <claudio.laurita@integrazionetotale.it>
Date: Tue, 23 Sep 2014 10:06:40 -0700 (PDT)
Subject: [Buildroot] [PATCH v7] canfestival: new package
In-Reply-To: <1404048539-14788-1-git-send-email-s.martin49@gmail.com>
References: <1404048539-14788-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1411492000260-80004.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'd like to propose a little patch to add pkg-config support.
It's only a draft proposal, even if I'm using it. I hope it could be useful.
Claudio

diff --git a/canfestival.pc.in b/canfestival.pc.in
new file mode 100644
index 0000000..08ecbe1
--- /dev/null
+++ b/canfestival.pc.in
@@ -0,0 +1,12 @@
+PREFIX = SUB_PREFIX
+TARGET = SUB_TARGET
+
+prefix=${DESTDIR}${PREFIX}
+libdir=${prefix}/lib
+includedir=${prefix}/include/canfestival
+
+Name: Canfestival
+Description: Canfestival CANOpen library 
+Version: 1
+Libs: -L${libdir} -lcanfestival -lcanfestival_${TARGET} -lrt -ldl -lpthread
+Cflags: -I${includedir}
diff --git a/configure b/configure
index b63b276..6d909d6 100755
--- a/configure
+++ b/configure
@@ -825,6 +825,7 @@ elif [ "$SUB_TARGET" = "unix" -a "$SUB_TIMERS_DRIVER" =
"kernel_xeno" ]; then
 
 elif [ "$SUB_TARGET" = "unix" ]; then
 	MAKEFILES=$MAKEFILES\
+\	canfestival.pc.in\
 \	examples/CANOpenShell/Makefile.in\
 \	examples/TestMasterSlave/Makefile.in\
 \	examples/TestMasterSlaveLSS/Makefile.in\
diff --git a/src/Makefile.in b/src/Makefile.in
index e709f4f..8bee33d 100644
--- a/src/Makefile.in
+++ b/src/Makefile.in
@@ -132,9 +132,10 @@ $(TARGET)_%.o: %.c
 	$(CC) $(CFLAGS) $(PROG_CFLAGS) ${PROGDEFINES} $(INCLUDES) -o $@ -c $<
 
 install: libcanfestival.a
-	mkdir -p $(DESTDIR)$(PREFIX)/lib/
+	mkdir -p $(DESTDIR)$(PREFIX)/lib/pkgconfig/
 	mkdir -p $(DESTDIR)$(PREFIX)/include/canfestival
 	cp libcanfestival.a $(DESTDIR)$(PREFIX)/lib/
+	cp ../canfestival.pc $(DESTDIR)$(PREFIX)/lib/pkgconfig/
 	cp ../include/*.h $(DESTDIR)$(PREFIX)/include/canfestival
 
 uninstall:



--
View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/PATCH-v7-canfestival-new-package-tp73727p80004.html
Sent from the Buildroot (busybox) mailing list archive@Nabble.com.
