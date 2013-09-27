From: Axel Lin <axel.lin@ingics.com>
Date: Fri, 27 Sep 2013 16:19:19 +0800
Subject: [Buildroot] [PATCH] xinetd: needs mmu
Message-ID: <1380269959.32472.1.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
Fixes below build error:

/opt/test/buildroot/buildroot/output/host/usr/bin/arm-buildroot-uclinux-uclibcgnueabi-gcc -pipe -Os   -Wl,-elf2flt -DNO_RPC  -I../libs/include  -o xinetd access.o addr.o builtins.o child.o conf.o confparse.o connection.o env.o ident.o init.o int.o intcommon.o internals.o log.o logctl.o main.o msg.o nvlists.o parse.o parsesup.o parsers.o reconfig.o retry.o sconf.o sensor.o server.o service.o signals.o special.o tcpint.o time.o udpint.o util.o redirect.o xgetloadavg.o options.o includedir.o xtimer.o inet.o xmdns.o -L../libs/lib -lsio -lmisc -lxlog -lportable -lstr -lpset -lm -lcrypt  || rm -f xinetd
init.o: In function `init_daemon':
init.c:(.text+0x318): undefined reference to `fork'
int.o: In function `intercept':
int.c:(.text+0x3a4): undefined reference to `fork'
server.o: In function `server_start':
server.c:(.text+0x1b8): undefined reference to `fork'
collect2: ld returned 1 exit status

 package/xinetd/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/xinetd/Config.in b/package/xinetd/Config.in
index 76fe603..7f3575c 100644
--- a/package/xinetd/Config.in
+++ b/package/xinetd/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XINETD
 	bool "xinetd"
+	depends on BR2_USE_MMU # fork()
 	help
 	  xinetd is a secure replacement for inetd. It was originally written by
 	  panos at cs.colorado.edu.
-- 
1.8.1.2
