From: Martin Banky <martin.banky@gmail.com>
Date: Tue,  5 Oct 2010 15:45:52 -0700
Subject: [Buildroot] [PATCH 1/1] mrouted: convet to gentargets and bump to
	version 3.9.2
In-Reply-To: <1286318752-26740-1-git-send-email-Martin.Banky@gmail.com>
References: <1286318752-26740-1-git-send-email-Martin.Banky@gmail.com>
Message-ID: <1286318752-26740-2-git-send-email-Martin.Banky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mrouted is once again being actively developed.
See http://github.com/troglobit/mrouted

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
---
 package/mrouted/Config.in                          |    2 +-
 .../mrouted-3.9-beta3-bcopy_bcmp_bzero.patch       |  164 --------------------
 package/mrouted/mrouted-3.9.2-bcopy.patch          |   20 +++
 package/mrouted/mrouted-3.9.2-makefile-flags.patch |   62 ++++++++
 package/mrouted/mrouted-sys_errlist.patch          |   44 ------
 package/mrouted/mrouted.mk                         |   59 ++-----
 6 files changed, 99 insertions(+), 252 deletions(-)
 delete mode 100644 package/mrouted/mrouted-3.9-beta3-bcopy_bcmp_bzero.patch
 create mode 100644 package/mrouted/mrouted-3.9.2-bcopy.patch
 create mode 100644 package/mrouted/mrouted-3.9.2-makefile-flags.patch
 delete mode 100644 package/mrouted/mrouted-sys_errlist.patch

diff --git a/package/mrouted/Config.in b/package/mrouted/Config.in
index df3c567..ed5852b 100644
--- a/package/mrouted/Config.in
+++ b/package/mrouted/Config.in
@@ -3,4 +3,4 @@ config BR2_PACKAGE_MROUTED
 	help
 	  An implementation of the DVMRP multicast routing protocol.
 
-	  http://freshmeat.net/projects/mrouted/
+	  http://github.com/troglobit/mrouted
diff --git a/package/mrouted/mrouted-3.9-beta3-bcopy_bcmp_bzero.patch b/package/mrouted/mrouted-3.9-beta3-bcopy_bcmp_bzero.patch
deleted file mode 100644
index e38efd2..0000000
--- a/package/mrouted/mrouted-3.9-beta3-bcopy_bcmp_bzero.patch
+++ /dev/null
@@ -1,164 +0,0 @@
-diff -urN mrouted-3.9-beta3.0rig/cfparse.y mrouted-3.9-beta3/cfparse.y
---- mrouted-3.9-beta3.0rig/cfparse.y	1998-03-01 02:48:58.000000000 +0100
-+++ mrouted-3.9-beta3/cfparse.y	2009-01-14 21:17:00.000000000 +0100
-@@ -583,8 +583,7 @@
- 				  if (hp->h_addr_list[1])
- 				    fatal("Hostname %s does not %s",
- 					$1, "map to a unique address");
--
--				  bcopy(hp->h_addr_list[0], &$$,
-+				  memmove (&$$,	hp->h_addr_list[0],
- 					    hp->h_length);
- 				}
- 
-diff -urN mrouted-3.9-beta3.0rig/config.c mrouted-3.9-beta3/config.c
---- mrouted-3.9-beta3.0rig/config.c	1998-01-06 02:57:41.000000000 +0100
-+++ mrouted-3.9-beta3/config.c	2009-01-14 21:18:59.000000000 +0100
-@@ -89,7 +89,7 @@
- 	 * SIOCGIFFLAGS stomps over it because the requests
- 	 * are returned in a union.)
- 	 */
--	bcopy(ifrp->ifr_name, ifr.ifr_name, sizeof(ifr.ifr_name));
-+	memmove	(ifr.ifr_name,	ifrp->ifr_name,	sizeof(ifr.ifr_name));
- 
- 	/*
- 	 * Ignore loopback interfaces and interfaces that do not support
-diff -urN mrouted-3.9-beta3.0rig/defs.h mrouted-3.9-beta3/defs.h
---- mrouted-3.9-beta3.0rig/defs.h	2009-01-14 21:12:22.000000000 +0100
-+++ mrouted-3.9-beta3/defs.h	2009-01-14 21:20:05.000000000 +0100
-@@ -116,8 +116,6 @@
- #endif /* RSRR */
- 
- #ifdef SYSV
--#define bcopy(a, b, c)	memcpy(b, a, c)
--#define bzero(s, n) 	memset((s), 0, (n))
- #define setlinebuf(s)	setvbuf(s, NULL, _IOLBF, 0)
- #endif
- 
-diff -urN mrouted-3.9-beta3.0rig/igmp.c mrouted-3.9-beta3/igmp.c
---- mrouted-3.9-beta3.0rig/igmp.c	1998-01-06 02:57:43.000000000 +0100
-+++ mrouted-3.9-beta3/igmp.c	2009-01-14 21:27:41.000000000 +0100
-@@ -56,7 +56,7 @@
-     k_set_loop(FALSE);		/* disable multicast loopback     */
- 
-     ip         = (struct ip *)send_buf;
--    bzero(ip, sizeof(struct ip));
-+    memset(ip, 0, sizeof(struct ip));
-     /*
-      * Fields zeroed that aren't filled in later:
-      * - IP ID (let the kernel fill it in)
-@@ -421,7 +421,7 @@
- 	}
-     }
- 
--    bzero(&sdst, sizeof(sdst));
-+    memset(&sdst, 0, sizeof(sdst));
-     sdst.sin_family = AF_INET;
- #ifdef HAVE_SA_LEN
-     sdst.sin_len = sizeof(sdst);
-diff -urN mrouted-3.9-beta3.0rig/ipip.c mrouted-3.9-beta3/ipip.c
---- mrouted-3.9-beta3.0rig/ipip.c	1998-01-06 02:57:45.000000000 +0100
-+++ mrouted-3.9-beta3/ipip.c	2009-01-14 21:28:19.000000000 +0100
-@@ -61,7 +61,7 @@
-     ip = v->uv_encap_hdr = (struct ip *)malloc(sizeof(struct ip));
-     if (ip == NULL)
- 	log(LOG_ERR, 0, "out of memory");
--    bzero(ip, sizeof(struct ip));
-+    memset(ip, 0, sizeof(struct ip));
-     /*
-      * Fields zeroed that aren't filled in later:
-      * - IP ID (let the kernel fill it in)
-@@ -111,7 +111,7 @@
-     ip->ip_len = htons(ip->ip_len);
- #endif
- 
--    bzero(&sdst, sizeof(sdst));
-+    memset(&sdst, 0, sizeof(sdst));
-     sdst.sin_family = AF_INET;
- #ifdef HAVE_SA_LEN
-     sdst.sin_len = sizeof(sdst);
-@@ -123,7 +123,7 @@
-     iov[1].iov_base = (caddr_t)send_buf;
-     iov[1].iov_len = MIN_IP_HEADER_LEN + IGMP_MINLEN + datalen;
- 
--    bzero(&msg, sizeof(msg));
-+    memset(&msg, 0, sizeof(msg));
-     msg.msg_name = (caddr_t)&sdst;
-     msg.msg_namelen = sizeof(sdst);
-     msg.msg_iov = iov;
-diff -urN mrouted-3.9-beta3.0rig/main.c mrouted-3.9-beta3/main.c
---- mrouted-3.9-beta3.0rig/main.c	2009-01-14 21:12:22.000000000 +0100
-+++ mrouted-3.9-beta3/main.c	2009-01-14 21:22:33.000000000 +0100
-@@ -429,7 +429,7 @@
-     gettimeofday(&curtime, NULL);
-     lasttime = curtime;
-     for(;;) {
--	bcopy((char *)&readers, (char *)&rfds, sizeof(rfds));
-+	memmove	((char *)&rfds,	(char *)&readers,	sizeof(rfds));
- 	secs = timer_nextTimer();
- 	if (secs == -1)
- 	    timeout = NULL;
-diff -urN mrouted-3.9-beta3.0rig/prune.c mrouted-3.9-beta3/prune.c
---- mrouted-3.9-beta3.0rig/prune.c	1998-03-01 03:06:32.000000000 +0100
-+++ mrouted-3.9-beta3/prune.c	2009-01-14 21:27:06.000000000 +0100
-@@ -2450,7 +2450,7 @@
-     /* copy the packet to the sending buffer */
-     p = send_buf + MIN_IP_HEADER_LEN + IGMP_MINLEN;
-     
--    bcopy(data, p, datalen);
-+    memmove	(p,	data,	datalen);
-     
-     p += datalen;
-     
-@@ -2469,7 +2469,7 @@
-      * fill in initial response fields
-      */
-     resp = (struct tr_resp *)p;
--    bzero(resp, sizeof(struct tr_resp));
-+    memset(resp, 0, sizeof(struct tr_resp));
-     datalen += RLEN;
- 
-     resp->tr_qarr    = htonl(((tp.tv_sec + JAN_1970) << 16) + 
-diff -urN mrouted-3.9-beta3.0rig/route.c mrouted-3.9-beta3/route.c
---- mrouted-3.9-beta3.0rig/route.c	1998-01-15 01:08:34.000000000 +0100
-+++ mrouted-3.9-beta3/route.c	2009-01-14 21:26:37.000000000 +0100
-@@ -388,7 +388,8 @@
-     else                              r->rt_originwidth = 1;
-     r->rt_flags        = 0;
-     r->rt_dominants    = (u_int32 *)(r + 1);
--    bzero(r->rt_dominants, numvifs * sizeof(u_int32));
-+    memset(r->rt_dominants, 0, numvifs * sizeof(u_int32));
-+
-     r->rt_groups       = NULL;
-     VIFM_CLRALL(r->rt_children);
-     NBRM_CLRALL(r->rt_subordinates);
-@@ -968,7 +969,7 @@
-     bh->bh_dst = dst;
-     bh->bh_level = level;
-     bh->bh_datalen = datalen;
--    bcopy(p, (char *)(bh + 1), datalen);
-+    memmove	((char *)(bh + 1),	p,	datalen);
-     v->uv_blasterend += bblen;
- 
-     if (v->uv_blastertimer == 0) {
-diff -urN mrouted-3.9-beta3.0rig/rsrr.c mrouted-3.9-beta3/rsrr.c
---- mrouted-3.9-beta3.0rig/rsrr.c	1998-01-06 02:57:58.000000000 +0100
-+++ mrouted-3.9-beta3/rsrr.c	2009-01-14 21:29:18.000000000 +0100
-@@ -81,7 +81,7 @@
- 	log(LOG_ERR, errno, "Can't create RSRR socket");
- 
-     unlink(RSRR_SERV_PATH);
--    bzero((char *) &serv_addr, sizeof(serv_addr));
-+    memset((char *) &serv_addr, 0, sizeof(serv_addr));
-     serv_addr.sun_family = AF_UNIX;
-     strcpy(serv_addr.sun_path, RSRR_SERV_PATH);
- #ifdef HAVE_SA_LEN
-@@ -107,7 +107,7 @@
- {
-     register int rsrr_recvlen;
-     
--    bzero((char *) &client_addr, sizeof(client_addr));
-+    memset((char *) &client_addr, 0, sizeof(client_addr));
-     rsrr_recvlen = recvfrom(rsrr_socket, rsrr_recv_buf, sizeof(rsrr_recv_buf),
- 			    0, (struct sockaddr *)&client_addr, &client_length);
-     if (rsrr_recvlen < 0) {	
diff --git a/package/mrouted/mrouted-3.9.2-bcopy.patch b/package/mrouted/mrouted-3.9.2-bcopy.patch
new file mode 100644
index 0000000..d20e4df
--- /dev/null
+++ b/package/mrouted/mrouted-3.9.2-bcopy.patch
@@ -0,0 +1,20 @@
+--- troglobit-mrouted-b192f82/mtrace.c-orig	2010-08-20 11:27:26.000000000 -0700
++++ troglobit-mrouted-b192f82/mtrace.c	2010-10-02 22:34:17.000000000 -0700
+@@ -558,7 +558,7 @@ int send_recv(u_int32_t dst, int type, i
+ 		save->rtime = ((tr.tv_sec + JAN_1970) << 16) +
+ 		    (tr.tv_usec << 10) / 15625;
+ 		save->len = len;
+-		bcopy((char *)igmp, (char *)&save->igmp, ipdatalen);
++		memmove((char *)&save->igmp, (char *)igmp, ipdatalen)
+ 	    }
+ 	    return recvlen;
+ 	}
+@@ -651,6 +651,8 @@ void passive_mode(void)
+ 	    (tr.tv_usec << 10) / 15625;
+ 	base.len = len;
+ 	bcopy((char *)igmp, (char *)&base.igmp, ipdatalen);
++	memmove((char *)&base.igmp, (char *)igmp, ipdatalen)
++
+ 	/*
+ 	 * If the user specified which traces to monitor,
+ 	 * only accept traces that correspond to the
diff --git a/package/mrouted/mrouted-3.9.2-makefile-flags.patch b/package/mrouted/mrouted-3.9.2-makefile-flags.patch
new file mode 100644
index 0000000..c70cf3a
--- /dev/null
+++ b/package/mrouted/mrouted-3.9.2-makefile-flags.patch
@@ -0,0 +1,62 @@
+--- a/Makefile	2010-08-20 11:27:26.000000000 -0700
++++ b/Makefile	2010-10-05 15:25:32.000000000 -0700
+@@ -64,8 +64,8 @@ include config.mk
+ include snmp.mk
+ 
+ ## Common
+-CFLAGS        = ${MCAST_INCLUDE} ${SNMPDEF} ${RSRRDEF} $(INCLUDES) $(DEFS) $(USERCOMPILE)
+-CFLAGS       += -O2 -W -Wall -Werror
++MROUTED_CFLAGS = ${MCAST_INCLUDE} ${SNMPDEF} ${RSRRDEF} $(INCLUDES) $(DEFS) $(USERCOMPILE)
++#CFLAGS       += -O2 -W -Wall
+ #CFLAGS       += -O -g
+ LDLIBS        = ${SNMPLIBDIR} ${SNMPLIBS} ${LIB2}
+ OBJS          = ${IGMP_OBJS} ${ROUTER_OBJS} ${MAPPER_OBJS} ${MRINFO_OBJS} \
+@@ -80,6 +80,9 @@ LINTFLAGS     = ${MCAST_INCLUDE} $(filte
+ 
+ all: $(EXECS) ${MSTAT}
+ 
++%.o: %.c
++	$(CC) $(MROUTED_CFLAGS) $(CFLAGS) -c -o $@ $<
++
+ install: $(EXECS)
+ 	$(Q)[ -n "$(DESTDIR)" -a ! -d $(DESTDIR) ] || install -d $(DESTDIR)
+ 	$(Q)install -d $(DESTDIR)$(prefix)/sbin
+@@ -111,7 +114,7 @@ mrouted: ${IGMP_OBJS} ${ROUTER_OBJS} ver
+ ifdef Q
+ 	@printf "  LINK    $(subst $(ROOTDIR),,$(shell pwd))/$@\n"
+ endif
+-	$(Q)${CC} ${CFLAGS} ${LDFLAGS} -Wl,-Map,$@.map -o $@ $^ $(LDLIBS$(LDLIBS-$(@)))
++	$(Q)$(CC) $(MROUTED_CFLAGS) $(CFLAGS) $(LDFLAGS) -Wl,-Map,$@.map -o $@ $^ $(LDLIBS$(LDLIBS-$(@)))
+ 
+ vers.c: Makefile
+ 	@echo $(VERSION) | sed -e 's/.*/char todaysversion[]="&";/' > vers.c
+@@ -120,25 +123,25 @@ map-mbone: ${IGMP_OBJS} ${MAPPER_OBJS}
+ ifdef Q
+ 	@printf "  LINK    $(subst $(ROOTDIR),,$(shell pwd))/$@\n"
+ endif
+-	$(Q)${CC} ${CFLAGS} ${LDFLAGS} -o $@ ${IGMP_OBJS} ${MAPPER_OBJS} ${LIB2}
++	$(Q)$(CC) $(MROUTED_CFLAGS) $(CFLAGS) $(LDFLAGS) -o $@ ${IGMP_OBJS} ${MAPPER_OBJS} ${LIB2}
+ 
+ mrinfo: ${IGMP_OBJS} ${MRINFO_OBJS}
+ ifdef Q
+ 	@printf "  LINK    $(subst $(ROOTDIR),,$(shell pwd))/$@\n"
+ endif
+-	$(Q)${CC} ${CFLAGS} ${LDFLAGS} -o $@ ${IGMP_OBJS} ${MRINFO_OBJS} ${LIB2}
++	$(Q)$(CC) $(MROUTED_CFLAGS) $(CFLAGS) $(LDFLAGS) -o $@ ${IGMP_OBJS} ${MRINFO_OBJS} ${LIB2}
+ 
+ mtrace: ${IGMP_OBJS} ${MTRACE_OBJS}
+ ifdef Q
+ 	@printf "  LINK    $(subst $(ROOTDIR),,$(shell pwd))/$@\n"
+ endif
+-	$(Q)${CC} ${CFLAGS} ${LDFLAGS} -o $@ ${IGMP_OBJS} ${MTRACE_OBJS} ${LIB2}
++	$(Q)$(CC) $(MROUTED_CFLAGS) $(CFLAGS) $(LDFLAGS) -o $@ ${IGMP_OBJS} ${MTRACE_OBJS} ${LIB2}
+ 
+ mstat: ${MSTAT_OBJS} snmplib/libsnmp.a
+ ifdef Q
+ 	@printf "  LINK    $(subst $(ROOTDIR),,$(shell pwd))/$@\n"
+ endif
+-	$(Q)${CC} ${CFLAGS} ${LDFLAGS} -o $@ ${MSTAT_OBJS} -Lsnmplib -lsnmp
++	$(Q)$(CC) $(MROUTED_CFLAGS) $(CFLAGS) $(LDFLAGS) -o $@ ${MSTAT_OBJS} -Lsnmplib -lsnmp
+ 
+ clean: ${SNMPCLEAN}
+ 	-$(Q)$(RM) $(OBJS) $(EXECS)
diff --git a/package/mrouted/mrouted-sys_errlist.patch b/package/mrouted/mrouted-sys_errlist.patch
deleted file mode 100644
index 8498dc7..0000000
--- a/package/mrouted/mrouted-sys_errlist.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-Patches from Kevin P. Fleming <kpfleming@backtobasicsmgmt.com>.
-
---- mrouted-3.9-beta3.orig/main.c~	2004-03-10 19:00:38.000000000 -0700
-+++ mrouted-3.9-beta3.orig/main.c	2004-03-10 19:02:33.000000000 -0700
-@@ -1001,10 +1001,8 @@
- 		    thyme->tm_min, thyme->tm_sec, now.tv_usec / 1000, msg);
- 	if (syserr == 0)
- 	    fprintf(stderr, "\n");
--	else if (syserr < sys_nerr)
--	    fprintf(stderr, ": %s\n", sys_errlist[syserr]);
- 	else
--	    fprintf(stderr, ": errno %d\n", syserr);
-+	    fprintf(stderr, ": %s\n", strerror(syserr));
-     }
- 
-     /*
---- mrouted-3.9-beta3.orig/mrinfo.c~	1998-02-28 20:05:20.000000000 -0700
-+++ mrouted-3.9-beta3.orig/mrinfo.c	2004-03-10 19:01:49.000000000 -0700
-@@ -159,10 +159,8 @@
- 		vfprintf(stderr, fmt, ap);
- 		if (syserr == 0)
- 			fprintf(stderr, "\n");
--		else if (syserr < sys_nerr)
--			fprintf(stderr, ": %s\n", sys_errlist[syserr]);
- 		else
--			fprintf(stderr, ": errno %d\n", syserr);
-+			fprintf(stderr, ": %s\n", strerror(syserr));
- 	}
- 
- 	if (severity <= LOG_ERR)
---- mrouted-3.9-beta3.orig/mapper.c~	1998-01-05 18:57:47.000000000 -0700
-+++ mrouted-3.9-beta3.orig/mapper.c	2004-03-10 19:02:04.000000000 -0700
-@@ -197,10 +197,8 @@
- 	    vfprintf(stderr, fmt, ap);
- 	    if (syserr == 0)
- 		fprintf(stderr, "\n");
--	    else if (syserr < sys_nerr)
--		fprintf(stderr, ": %s\n", sys_errlist[syserr]);
- 	    else
--		fprintf(stderr, ": errno %d\n", syserr);
-+	        fprintf(stderr, ": %s\n", strerror(syserr));
-     }
- 
-     if (severity <= LOG_ERR)
diff --git a/package/mrouted/mrouted.mk b/package/mrouted/mrouted.mk
index 4438c6d..00c8d28 100644
--- a/package/mrouted/mrouted.mk
+++ b/package/mrouted/mrouted.mk
@@ -4,52 +4,25 @@
 #
 #
 #############################################################
-MROUTED_VERSION:=3.9-beta3.orig
-MROUTED_SOURCE:=mrouted_$(MROUTED_VERSION).tar.gz
-MROUTED_SITE:=http://archive.debian.org/debian-archive/pool/non-free/m/mrouted/
-MROUTED_DIR:=$(BUILD_DIR)/mrouted-$(MROUTED_VERSION)
-MROUTED_CAT:=$(ZCAT)
-MROUTED_PATCH:=mrouted_3.9-beta3-1.1.diff.gz
-MROUTED_BINARY:=mrouted
-MROUTED_TARGET_BINARY:=usr/sbin/mrouted
+MROUTED_VERSION = 3.9.2
+MROUTED_SOURCE = troglobit-mrouted-$(MROUTED_VERSION)-*.tar.gz
+MROUTED_SITE = http://github.com/troglobit/mrouted/tarball/3.9.2
 
-$(DL_DIR)/$(MROUTED_SOURCE):
-	 $(call DOWNLOAD,$(MROUTED_SITE),$(MROUTED_SOURCE))
-
-$(DL_DIR)/$(MROUTED_PATCH):
-	 $(call DOWNLOAD,$(MROUTED_SITE),$(MROUTED_PATCH))
-
-$(MROUTED_DIR)/.unpacked: $(DL_DIR)/$(MROUTED_SOURCE) $(DL_DIR)/$(MROUTED_PATCH)
-	$(MROUTED_CAT) $(DL_DIR)/$(MROUTED_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	$(MROUTED_CAT) $(DL_DIR)/$(MROUTED_PATCH) | patch -p1 -d $(MROUTED_DIR)
-	toolchain/patch-kernel.sh $(MROUTED_DIR) package/mrouted/ mrouted\*.patch
-	touch $(MROUTED_DIR)/.unpacked
-
-$(MROUTED_DIR)/$(MROUTED_BINARY): $(MROUTED_DIR)/.unpacked
+define MROUTED_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) \
-	$(MAKE) CC="$(TARGET_CC)" -C $(MROUTED_DIR)
-
-$(TARGET_DIR)/$(MROUTED_TARGET_BINARY): $(MROUTED_DIR)/$(MROUTED_BINARY)
-	cp -a $(MROUTED_DIR)/$(MROUTED_BINARY) $(TARGET_DIR)/$(MROUTED_TARGET_BINARY)
-
-mrouted: $(TARGET_DIR)/$(MROUTED_TARGET_BINARY)
+	$(MAKE) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" LDFLAGS="$(TARGET_LDFLAGS)" -C $(@D)
+endef
 
-mrouted-source: $(DL_DIR)/$(MROUTED_SOURCE) $(DL_DIR)/$(MROUTED_PATCH)
+define MROUTED_INSTALL_TARGET_CMDS
+	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) install
+endef
 
-mrouted-unpacked: $(MROUTED_DIR)/.unpacked
+define MROUTED_UNINSTALL_TARGET_CMDS
+	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) uninstall
+endef
 
-mrouted-clean:
-	rm -f $(TARGET_DIR)/$(MROUTED_TARGET_BINARY)
-	-$(MAKE) -C $(MROUTED_DIR) clean
+define MROUTED_CLEAN_CMDS
+	$(MAKE) -C $(@D) clean
+endef
 
-mrouted-dirclean:
-	rm -rf $(MROUTED_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_MROUTED),y)
-TARGETS+=mrouted
-endif
+$(eval $(call GENTARGETS,package,mrouted))
-- 
1.7.3.1
