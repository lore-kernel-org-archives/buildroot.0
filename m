From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 01:37:14 +0200
Subject: [Buildroot] [git commit] net-tools: remove libintl static linking
	handling
Message-ID: <20170704233520.374FE7FEE4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e5968727f3c0ea78f4f0525847ad11cf68f5d01c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We no longer support building the full-blown libintl in static linking
scenarios, as it causes too many problems. Patch
0001-Makefile-fix-static-linking-issue-with-lintl.patch was added to
allow passing -lintl through LIBS, in a place that works for static
linking.

However, for dynamic linking, we can simply pass -lintl through the
existing LDFLAGS variable, as it was done prior to commit
38bfd129c64a9cfd82c4fa4c797afadf12a6ffaa ("package/net-tools: fix
static linking issue with lintl").

This commit does that and gets rid of the now useless patch.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...efile-fix-static-linking-issue-with-lintl.patch | 79 ----------------------
 ...1-iptunnel.c-do-not-include-netinet-ip.h.patch} |  0
 package/net-tools/net-tools.mk                     |  2 +-
 3 files changed, 1 insertion(+), 80 deletions(-)

diff --git a/package/net-tools/0001-Makefile-fix-static-linking-issue-with-lintl.patch b/package/net-tools/0001-Makefile-fix-static-linking-issue-with-lintl.patch
deleted file mode 100644
index a2d674e..0000000
--- a/package/net-tools/0001-Makefile-fix-static-linking-issue-with-lintl.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-From a2076079a409141704701ec17a205d89e5b24052 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Sat, 28 May 2016 20:45:02 +0200
-Subject: [PATCH] Makefile: fix static linking issue with lintl
-
-When net-tools are build with uClibc-ng and statically linked,
-some tools like hostname and route needs to link with -lintl.
-
-Adding -lintl in LDFLAGS place the library before object files:
-arm-linux-gcc -O2 -g -Wall -fno-strict-aliasing   -static -lintl -Llib -o hostname hostname.o
-
-Add $(LIBS) after object files in the Makefile to place -lintl correctly.
-
-Fixes:
-http://autobuild.buildroot.net/results/134/1345b6d366125320b89512e7ce7f142f1a03acf8
-
-Ref:
-http://lists.busybox.net/pipermail/buildroot/2016-May/162216.html
-
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- Makefile | 20 ++++++++++----------
- 1 file changed, 10 insertions(+), 10 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 171123d..a2baf79 100644
---- a/Makefile
-+++ b/Makefile
-@@ -158,37 +158,37 @@ subdirs:	libdir
- 		@for i in $(SUBDIRS:$(NET_LIB_PATH)/=); do $(MAKE) -C $$i || exit $$? ; done
- 
- ifconfig:	$(NET_LIB) ifconfig.o
--		$(CC) $(CFLAGS) $(LDFLAGS) -o $@ ifconfig.o $(NLIB)
-+		$(CC) $(CFLAGS) $(LDFLAGS) -o $@ ifconfig.o $(LIBS) $(NLIB)
- 
- nameif:		$(NET_LIB) nameif.o
- 		$(CC) $(CFLAGS) $(LDFLAGS) -o $@ nameif.o $(NLIB)
- 
- hostname:	hostname.o
--		$(CC) $(CFLAGS) $(LDFLAGS) -o $@ hostname.o $(DNLIB)
-+		$(CC) $(CFLAGS) $(LDFLAGS) -o $@ hostname.o $(LIBS) $(DNLIB)
- 
- route:		$(NET_LIB) route.o
--		$(CC) $(CFLAGS) $(LDFLAGS) -o $@ route.o $(NLIB)
-+		$(CC) $(CFLAGS) $(LDFLAGS) -o $@ route.o $(LIBS) $(NLIB)
- 
- arp:		$(NET_LIB) arp.o
--		$(CC) $(CFLAGS) $(LDFLAGS) -o $@ arp.o $(NLIB)
-+		$(CC) $(CFLAGS) $(LDFLAGS) -o $@ arp.o $(LIBS) $(NLIB)
- 
- rarp:		$(NET_LIB) rarp.o
--		$(CC) $(CFLAGS) $(LDFLAGS) -o $@ rarp.o $(NLIB)
-+		$(CC) $(CFLAGS) $(LDFLAGS) -o $@ rarp.o $(LIBS) $(NLIB)
- 
- slattach:	$(NET_LIB) slattach.o
--		$(CC) $(CFLAGS) $(LDFLAGS) -o $@ slattach.o $(NLIB)
-+		$(CC) $(CFLAGS) $(LDFLAGS) -o $@ slattach.o $(LIBS) $(NLIB)
- 
- plipconfig:	$(NET_LIB) plipconfig.o
--		$(CC) $(CFLAGS) $(LDFLAGS) -o $@ plipconfig.o $(NLIB)
-+		$(CC) $(CFLAGS) $(LDFLAGS) -o $@ plipconfig.o $(LIBS) $(NLIB)
- 
- netstat:	$(NET_LIB) netstat.o statistics.o
--		$(CC) $(CFLAGS) $(LDFLAGS) -o $@ netstat.o statistics.o $(NLIB) $(SELIB)
-+		$(CC) $(CFLAGS) $(LDFLAGS) -o $@ netstat.o statistics.o $(LIBS) $(NLIB) $(SELIB)
- 
- iptunnel:	$(NET_LIB) iptunnel.o
--		$(CC) $(CFLAGS) $(LDFLAGS) -o $@ iptunnel.o $(NLIB)
-+		$(CC) $(CFLAGS) $(LDFLAGS) -o $@ iptunnel.o $(LIBS) $(NLIB)
- 
- ipmaddr:	$(NET_LIB) ipmaddr.o
--		$(CC) $(CFLAGS) $(LDFLAGS) -o $@ ipmaddr.o $(NLIB)
-+		$(CC) $(CFLAGS) $(LDFLAGS) -o $@ ipmaddr.o $(LIBS) $(NLIB)
- 
- mii-tool:	$(NET_LIB) mii-tool.o
- 		$(CC) $(CFLAGS) $(LDFLAGS) -o $@ mii-tool.o $(NLIB)
--- 
-2.5.5
-
diff --git a/package/net-tools/0002-iptunnel.c-do-not-include-netinet-ip.h.patch b/package/net-tools/0001-iptunnel.c-do-not-include-netinet-ip.h.patch
similarity index 100%
rename from package/net-tools/0002-iptunnel.c-do-not-include-netinet-ip.h.patch
rename to package/net-tools/0001-iptunnel.c-do-not-include-netinet-ip.h.patch
diff --git a/package/net-tools/net-tools.mk b/package/net-tools/net-tools.mk
index 57a3eb4..bc87290 100644
--- a/package/net-tools/net-tools.mk
+++ b/package/net-tools/net-tools.mk
@@ -35,7 +35,7 @@ NET_TOOLS_POST_CONFIGURE_HOOKS += NET_TOOLS_ENABLE_I18N NET_TOOLS_ENABLE_IPV6
 
 define NET_TOOLS_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) \
-		LIBS=$(TARGET_NLS_LIBS) \
+		LDFLAGS="$(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)" \
 		$(MAKE) -C $(@D)
 endef
 
