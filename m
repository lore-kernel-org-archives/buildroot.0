From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 18 May 2012 22:27:33 +0200
Subject: [Buildroot] [git commit branch/next] mrouted: bump to version 3.9.6
Message-ID: <20120518202900.C6E8296D27@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=28fa6f19517847c0d515d97f787cef85736957b0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/mrouted/mrouted-3.9.4-bcopy.patch          |   21 -------
 package/mrouted/mrouted-3.9.4-makefile-flags.patch |   64 --------------------
 package/mrouted/mrouted-bcopy.patch                |   39 ++++++++++++
 package/mrouted/mrouted.mk                         |    6 +-
 4 files changed, 42 insertions(+), 88 deletions(-)

diff --git a/package/mrouted/mrouted-3.9.4-bcopy.patch b/package/mrouted/mrouted-3.9.4-bcopy.patch
deleted file mode 100644
index ea8f6db..0000000
--- a/package/mrouted/mrouted-3.9.4-bcopy.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-diff -Nura mrouted-3.9.4/mtrace.c mrouted-3.9.4-memmove/mtrace.c
---- mrouted-3.9.4/mtrace.c	2010-11-19 20:53:19.000000000 -0300
-+++ mrouted-3.9.4-memmove/mtrace.c	2012-05-03 08:27:33.895422455 -0300
-@@ -556,7 +556,7 @@
- 		save->rtime = ((tr.tv_sec + JAN_1970) << 16) +
- 		    (tr.tv_usec << 10) / 15625;
- 		save->len = len;
--		bcopy((char *)igmp, (char *)&save->igmp, ipdatalen);
-+		memmove((char *)&save->igmp, (char *)igmp, ipdatalen);
- 	    }
- 	    return recvlen;
- 	}
-@@ -646,7 +646,7 @@
- 	base.rtime = ((tr.tv_sec + JAN_1970) << 16) +
- 	    (tr.tv_usec << 10) / 15625;
- 	base.len = len;
--	bcopy((char *)igmp, (char *)&base.igmp, ipdatalen);
-+	memmove((char *)&base.igmp, (char *)igmp, ipdatalen);
- 	/*
- 	 * If the user specified which traces to monitor,
- 	 * only accept traces that correspond to the
diff --git a/package/mrouted/mrouted-3.9.4-makefile-flags.patch b/package/mrouted/mrouted-3.9.4-makefile-flags.patch
deleted file mode 100644
index 932bec0..0000000
--- a/package/mrouted/mrouted-3.9.4-makefile-flags.patch
+++ /dev/null
@@ -1,64 +0,0 @@
----
- Makefile |   20 +++++++++-----------
- 1 file changed, 9 insertions(+), 11 deletions(-)
-
-Index: mrouted-3.9.4/Makefile
-===================================================================
---- mrouted-3.9.4.orig/Makefile
-+++ mrouted-3.9.4/Makefile
-@@ -42,11 +42,9 @@
- #MSTAT_OBJS    = mstat.o $(EXTRA_OBJS)
- 
- ## Common
--CFLAGS        = $(MCAST_INCLUDE) $(SNMPDEF) $(RSRRDEF) $(INCLUDES) $(DEFS) $(USERCOMPILE)
--CFLAGS       += -O2 -W -Wall -Werror
--#CFLAGS       += -O -g
--LDLIBS        = $(SNMPLIBDIR) $(SNMPLIBS) $(EXTRA_LIBS)
--LDFLAGS      += -Wl,-Map,$@.map
-+MROUTED_CFLAGS   = $(MCAST_INCLUDE) $(SNMPDEF) $(RSRRDEF) $(INCLUDES) $(DEFS) $(USERCOMPILE)
-+LDLIBS           = $(SNMPLIBDIR) $(SNMPLIBS) $(EXTRA_LIBS)
-+MROUTED_LDFLAGS += -Wl,-Map,$@.map
- OBJS          = $(IGMP_OBJS) $(ROUTER_OBJS) $(MAPPER_OBJS) $(MRINFO_OBJS) \
- 		$(MTRACE_OBJS) $(MSTAT_OBJS)
- SRCS          = $(OBJS:.o=.c)
-@@ -65,7 +63,7 @@
- 
- .c.o:
- 	@printf "  CC      $@\n"
--	@$(CC) $(CFLAGS) $(CPPFLAGS) -c -o $@ $<
-+	@$(CC) $(CFLAGS) $(MROUTED_CFLAGS) $(CPPFLAGS) -c -o $@ $<
- 
- install: $(EXECS)
- 	@install -d $(DESTDIR)$(prefix)/sbin
-@@ -95,26 +93,26 @@
- 
- mrouted: $(IGMP_OBJS) $(ROUTER_OBJS) $(CMULIBS)
- 	@printf "  LINK    $@\n"
--	@$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $(IGMP_OBJS) $(ROUTER_OBJS) $(LDLIBS)
-+	@$(CC) $(CFLAGS) $(MROUTED_CFLAGS) $(LDFLAGS) $(MROUTED_LDFLAGS) -o $@ $(IGMP_OBJS) $(ROUTER_OBJS) $(LDLIBS)
- 
- vers.c: Makefile
- 	@echo $(VERSION) | sed -e 's/.*/char todaysversion[]="&";/' > vers.c
- 
- map-mbone: $(IGMP_OBJS) $(MAPPER_OBJS)
- 	@printf "  LINK    $@\n"
--	@$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $(IGMP_OBJS) $(MAPPER_OBJS) $(LDLIBS)
-+	@$(CC) $(CFLAGS) $(MROUTED_CFLAGS) $(LDFLAGS) $(MROUTED_LDFLAGS) -o $@ $(IGMP_OBJS) $(MAPPER_OBJS) $(LDLIBS)
- 
- mrinfo: $(IGMP_OBJS) $(MRINFO_OBJS)
- 	@printf "  LINK    $@\n"
--	@$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $(IGMP_OBJS) $(MRINFO_OBJS) $(LDLIBS)
-+	@$(CC) $(CFLAGS) $(MROUTED_CFLAGS) $(LDFLAGS) $(MROUTED_LDFLAGS) -o $@ $(IGMP_OBJS) $(MRINFO_OBJS) $(LDLIBS)
- 
- mtrace: $(IGMP_OBJS) $(MTRACE_OBJS)
- 	@printf "  LINK    $@\n"
--	@$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $(IGMP_OBJS) $(MTRACE_OBJS) $(LDLIBS)
-+	@$(CC) $(CFLAGS) $(MROUTED_CFLAGS) $(LDFLAGS) $(MROUTED_LDFLAGS) -o $@ $(IGMP_OBJS) $(MTRACE_OBJS) $(LDLIBS)
- 
- mstat: $(MSTAT_OBJS) $(CMULIBS)
- 	@printf "  LINK    $@\n"
--	@$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $(MSTAT_OBJS) $(LDLIBS)
-+	@$(CC) $(CFLAGS) $(MROUTED_CFLAGS) $(LDFLAGS) $(MROUTED_LDFLAGS) -o $@ $(MSTAT_OBJS) $(LDLIBS)
- 
- clean: $(SNMPCLEAN)
- 	-@$(RM) $(OBJS) $(EXECS)
diff --git a/package/mrouted/mrouted-bcopy.patch b/package/mrouted/mrouted-bcopy.patch
new file mode 100644
index 0000000..74af02d
--- /dev/null
+++ b/package/mrouted/mrouted-bcopy.patch
@@ -0,0 +1,39 @@
+From 2d33110ee18fb59a1d6917d598fc1f4eb3c4cf83 Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Mon, 7 May 2012 16:32:10 -0300
+Subject: [PATCH] Switch from bcopy to memmove
+
+The bcopy() function is marked as legacy per POSIX.1-2001 and removed by
+POSIX-1.2008 thus shouldn't be used.
+So switch over to memmove()
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ mtrace.c |    4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/mtrace.c b/mtrace.c
+index c982a67..64630bf 100644
+--- a/mtrace.c
++++ b/mtrace.c
+@@ -556,7 +556,7 @@ int send_recv(u_int32_t dst, int type, int code, int tries, struct resp_buf *sav
+ 		save->rtime = ((tr.tv_sec + JAN_1970) << 16) +
+ 		    (tr.tv_usec << 10) / 15625;
+ 		save->len = len;
+-		bcopy((char *)igmp, (char *)&save->igmp, ipdatalen);
++		memmove((char *)&save->igmp, (char *)igmp, ipdatalen);
+ 	    }
+ 	    return recvlen;
+ 	}
+@@ -646,7 +646,7 @@ void passive_mode(void)
+ 	base.rtime = ((tr.tv_sec + JAN_1970) << 16) +
+ 	    (tr.tv_usec << 10) / 15625;
+ 	base.len = len;
+-	bcopy((char *)igmp, (char *)&base.igmp, ipdatalen);
++	memmove((char *)&base.igmp, (char *)igmp, ipdatalen);
+ 	/*
+ 	 * If the user specified which traces to monitor,
+ 	 * only accept traces that correspond to the
+-- 
+1.7.3.4
+
diff --git a/package/mrouted/mrouted.mk b/package/mrouted/mrouted.mk
index 99b54bc..7a3203a 100644
--- a/package/mrouted/mrouted.mk
+++ b/package/mrouted/mrouted.mk
@@ -2,11 +2,11 @@
 #
 # mrouted
 #
-#
 #############################################################
-MROUTED_VERSION = 3.9.4
+
+MROUTED_VERSION = 3.9.6
 MROUTED_SOURCE = mrouted-$(MROUTED_VERSION).tar.bz2
-MROUTED_SITE = http://ftp.vmlinux.org/pub/People/jocke/mrouted
+MROUTED_SITE = http://cloud.github.com/downloads/troglobit/mrouted
 
 define MROUTED_BUILD_CMDS
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
