From: Quotient Remainder <quotientvremainder@gmail.com>
Date: Fri, 10 Dec 2010 17:44:46 +0000
Subject: [Buildroot] host-ncurses: cannot find -lstdc++
Message-ID: <1292003086.27164.12.camel@dubciaranr0.verifone.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

OK, possibly a little bit OT since this isn't actually in mainline but
it's very close and may be useful.
I "added" host-ncurses by applying this trivial patch.

--8<--
diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index 0a49887..0aa66d7 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -121,3 +121,4 @@ define NCURSES_INSTALL_TARGET_CMDS
 endef # NCURSES_INSTALL_TARGET_CMDS
 
 $(eval $(call AUTOTARGETS,package,ncurses))
+$(eval $(call AUTOTARGETS,package,ncurses,host))
-->8--

Minimum test case is configure for ARM CodeSourcery 2010q1 and try "make
dirs cross && make host-ncurses".

        make[2]: Entering directory `/home/qvr/obair/community/buildroot/output/build/host-ncurses-5.7/c++'
        /usr/lib64/ccache/g++  -o demo ../objects/demo.o -L../lib -lncurses++ -static -L../lib -lform -lmenu -lpanel -lncurses  -dynamic  -L/home/qvr/obair/community/buildroot/output/host/lib -L/home/qvr/obair/community/buildroot/output/host/usr/lib -Wl,-rpath,/home/qvr/obair/community/buildroot/output/host/usr/lib  -I../c++ -I../include -I. -DHAVE_CONFIG_H -I. -I../include  -D_GNU_SOURCE -DNDEBUG -I/home/qvr/obair/community/buildroot/output/host/usr/include/ncurses -I/home/qvr/obair/community/buildroot/output/host/include -I/home/qvr/obair/community/buildroot/output/host/usr/include 
        /usr/bin/ld: cannot find -lstdc++
        collect2: ld returned 1 exit status
        make[2]: *** [demo] Error 1
        make[2]: Leaving directory `/home/qvr/obair/community/buildroot/output/build/host-ncurses-5.7/c++'


"locate libstdc++.so" gives:
        /usr/lib/libstdc++.so.6
        /usr/lib/libstdc++.so.6.0.14
        /usr/lib/gcc/x86_64-redhat-linux/4.5.1/libstdc++.so
        /usr/lib/gcc/x86_64-redhat-linux/4.5.1/32/libstdc++.so
        /usr/lib64/libstdc++.so.5
        /usr/lib64/libstdc++.so.5.0.7
        /usr/lib64/libstdc++.so.6
        /usr/lib64/libstdc++.so.6.0.14
        /home/qvr/CodeSourcery/Sourcery_G++_Lite/arm-none-linux-gnueabi/libc/armv4t/usr/lib/libstdc++.so
        /home/qvr/CodeSourcery/Sourcery_G++_Lite/arm-none-linux-gnueabi/libc/armv4t/usr/lib/libstdc++.so.6
        /home/qvr/CodeSourcery/Sourcery_G++_Lite/arm-none-linux-gnueabi/libc/armv4t/usr/lib/libstdc++.so.6.0.12
        /home/qvr/CodeSourcery/Sourcery_G++_Lite/arm-none-linux-gnueabi/libc/thumb2/usr/lib/libstdc++.so
        /home/qvr/CodeSourcery/Sourcery_G++_Lite/arm-none-linux-gnueabi/libc/thumb2/usr/lib/libstdc++.so.6
        /home/qvr/CodeSourcery/Sourcery_G++_Lite/arm-none-linux-gnueabi/libc/thumb2/usr/lib/libstdc++.so.6.0.12
        /home/qvr/CodeSourcery/Sourcery_G++_Lite/arm-none-linux-gnueabi/libc/usr/lib/libstdc++.so
        /home/qvr/CodeSourcery/Sourcery_G++_Lite/arm-none-linux-gnueabi/libc/usr/lib/libstdc++.so.6
        /home/qvr/CodeSourcery/Sourcery_G++_Lite/arm-none-linux-gnueabi/libc/usr/lib/libstdc++.so.6.0.12

I don't see anything specifically on libstdc++ on the list previously.
Build machine x86_64 running Fedora 14 with make downgraded to v3.81.
Any ideas?
