From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 1 Oct 2009 22:36:14 +0200
Subject: [Buildroot] [git commit master] mdnsresponder: remove package
Message-ID: <20091001203742.D02967775C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=8a19a7956552715003a5063b3d66be7f831b6e9e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The source target was broken until very recently, and it doesn't build
as it tries to use the host compiler for the client stuff, so there
cannot be many users of it.

People should use avahi instead nowadays, so so just remove it instead
of hacking it to work.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                            |    2 +
 package/Config.in                                  |    1 -
 package/mdnsresponder/Config.in                    |   15 --
 .../mdnsresponder/mDNSResponder-107.6-bcopy.patch  |  174 --------------------
 package/mdnsresponder/mDNSResponderPosix.conf      |   23 ---
 package/mdnsresponder/mdnsresponder.mk             |   96 -----------
 package/mdnsresponder/rc.mdnsresponder             |   67 --------
 7 files changed, 2 insertions(+), 376 deletions(-)
 delete mode 100644 package/mdnsresponder/Config.in
 delete mode 100644 package/mdnsresponder/mDNSResponder-107.6-bcopy.patch
 delete mode 100644 package/mdnsresponder/mDNSResponderPosix.conf
 delete mode 100644 package/mdnsresponder/mdnsresponder.mk
 delete mode 100644 package/mdnsresponder/rc.mdnsresponder

diff --git a/CHANGES b/CHANGES
index f51d83f..a6e0cba 100644
--- a/CHANGES
+++ b/CHANGES
@@ -8,6 +8,8 @@
 	openssl, python, radvd, samba, squashfs, syslinux, u-boot,
 	xdata_xcursor-themes,
 
+	Removed package: mdnsresponder
+
 	Issues resolved (http://bugs.uclibc.org):
 
 	#301: allow to install libsmbclient
diff --git a/package/Config.in b/package/Config.in
index 784ce35..77de7d2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -169,7 +169,6 @@ source "package/lighttpd/Config.in"
 endif
 source "package/links/Config.in"
 source "package/lrzsz/Config.in"
-source "package/mdnsresponder/Config.in"
 if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/microcom/Config.in"
 endif
diff --git a/package/mdnsresponder/Config.in b/package/mdnsresponder/Config.in
deleted file mode 100644
index 2082955..0000000
--- a/package/mdnsresponder/Config.in
+++ /dev/null
@@ -1,15 +0,0 @@
-config BR2_PACKAGE_MDNSRESPONDER
-	bool "mDNSResponder"
-	help
-	  The mDNSResponder project is a component of Bonjour,
-	  Apple's initiative for zero-configuration networking.
-
-	  http://developer.apple.com/networking/bonjour/index.html
-
-config BR2_PACKAGE_MDNSRESPONDER_UTILS
-	bool "client and utils"
-	depends on BR2_PACKAGE_MDNSRESPONDER
-	help
-	  Install the client applications and debug utils
-
-
diff --git a/package/mdnsresponder/mDNSResponder-107.6-bcopy.patch b/package/mdnsresponder/mDNSResponder-107.6-bcopy.patch
deleted file mode 100644
index dc9f5b5..0000000
--- a/package/mdnsresponder/mDNSResponder-107.6-bcopy.patch
+++ /dev/null
@@ -1,174 +0,0 @@
-diff -urN mDNSResponder-107.6-0rig/mDNSPosix/NetMonitor.c mDNSResponder-107.6/mDNSPosix/NetMonitor.c
---- mDNSResponder-107.6-0rig/mDNSPosix/NetMonitor.c	2006-08-15 01:24:46.000000000 +0200
-+++ mDNSResponder-107.6/mDNSPosix/NetMonitor.c	2007-09-26 11:56:22.000000000 +0200
-@@ -30,6 +30,9 @@
-     Change History (most recent first):
- 
- $Log: NetMonitor.c,v $
-+Revision 1.82-buildroot  2007/09/26 ulfs
-+Replace deprecated bcopy with memmove
-+
- Revision 1.82  2006/08/14 23:24:46  cheshire
- Re-licensed mDNSResponder daemon source code under Apache License, Version 2.0
- 
-@@ -308,7 +311,7 @@
- 
- #include <stdio.h>			// For printf()
- #include <stdlib.h>			// For malloc()
--#include <string.h>			// For bcopy()
-+#include <string.h>			// For memmove()
- #include <time.h>			// For "struct tm" etc.
- #include <signal.h>			// For SIGINT, SIGTERM
- #include <netdb.h>			// For gethostbyname()
-@@ -1155,7 +1158,7 @@
- 			else if (inet_pton(AF_INET6, argv[i], &s6) == 1)
- 				{
- 				a.type = mDNSAddrType_IPv6;
--				bcopy(&s6, &a.ip.v6, sizeof(a.ip.v6));
-+				memmove(&a.ip.v6, &s6, sizeof(a.ip.v6));
- 				}
- 			else
- 				{
-diff -urN mDNSResponder-107.6-0rig/mDNSPosix/PosixDaemon.c mDNSResponder-107.6/mDNSPosix/PosixDaemon.c
---- mDNSResponder-107.6-0rig/mDNSPosix/PosixDaemon.c	2006-08-29 08:24:34.000000000 +0200
-+++ mDNSResponder-107.6/mDNSPosix/PosixDaemon.c	2007-09-26 12:02:01.000000000 +0200
-@@ -231,8 +231,8 @@
- 	mDNS_PlatformSupport	platformStorage;
- 	mStatus					err;
- 
--	bzero(&mDNSRecord, sizeof mDNSRecord);
--	bzero(&platformStorage, sizeof platformStorage);
-+	memset(&mDNSRecord, '\0', sizeof mDNSRecord);
-+	memset(&platformStorage, '\0', sizeof platformStorage);
- 
- 	ParseCmdLinArgs(argc, argv);
- 
-@@ -317,7 +317,6 @@
- 		LogMalloc("malloc( %s : %lu ) = %p", msg, size, &mem[2]);
- 		mem[0] = 0xDEAD1234;
- 		mem[1] = size;
--		//bzero(&mem[2], size);
- 		memset(&mem[2], 0xFF, size);
- //		validatelists(&mDNSStorage);
- 		return(&mem[2]);
-@@ -336,7 +335,6 @@
- 		if (mem[1] > 8000)
- 			{ LogMsg("free( %s : %ld @ %p) too big!", msg, mem[1], &mem[2]); return; }
- 		LogMalloc("free( %s : %ld @ %p)", msg, mem[1], &mem[2]);
--		//bzero(mem, mem[1]+8);
- 		memset(mem, 0xDD, mem[1]+8);
- //		validatelists(&mDNSStorage);
- 		free(mem);
-diff -urN mDNSResponder-107.6-0rig/mDNSShared/dnssd_clientstub.c mDNSResponder-107.6/mDNSShared/dnssd_clientstub.c
---- mDNSResponder-107.6-0rig/mDNSShared/dnssd_clientstub.c	2006-09-07 06:43:12.000000000 +0200
-+++ mDNSResponder-107.6/mDNSShared/dnssd_clientstub.c	2007-09-26 12:05:10.000000000 +0200
-@@ -325,7 +325,7 @@
-     msg = malloc(*len);
-     if (!msg) return NULL;
- 
--    bzero(msg, *len);
-+    memset(msg, '\0', *len);
-     hdr = (void *)msg;
-     hdr->datalen = datalen;
-     hdr->version = VERSION;
-@@ -425,7 +425,7 @@
-         // setup temporary error socket
-         if ((listenfd = socket(AF_DNSSD, SOCK_STREAM, 0)) < 0)
-             goto cleanup;
--        bzero(&caddr, sizeof(caddr));
-+        memset(&caddr, '\0', sizeof(caddr));
- 
- #if defined(USE_TCP_LOOPBACK)
- 			{
-diff -urN mDNSResponder-107.6-0rig/mDNSShared/uds_daemon.c mDNSResponder-107.6/mDNSShared/uds_daemon.c
---- mDNSResponder-107.6-0rig/mDNSShared/uds_daemon.c	2006-08-29 08:24:36.000000000 +0200
-+++ mDNSResponder-107.6/mDNSShared/uds_daemon.c	2007-09-26 12:04:21.000000000 +0200
-@@ -990,7 +990,7 @@
- 		goto error;
- 		}
- 
--    bzero(&laddr, sizeof(laddr));
-+    memset(&laddr,'\0', sizeof(laddr));
- 
- 	#if defined(USE_TCP_LOOPBACK)
- 		{
-@@ -1291,7 +1291,7 @@
- 	// allocate a request_state struct that will live with the socket
-     rstate = mallocL("connect_callback", sizeof(request_state));
-     if (!rstate) FatalError("ERROR: malloc");
--    bzero(rstate, sizeof(request_state));
-+    memset(rstate, '\0', sizeof(request_state));
-     rstate->ts = t_morecoming;
-     rstate->sd = sd;
-     
-@@ -1389,7 +1389,7 @@
- 			{
- 			char ctrl_path[MAX_CTLPATH];
- 			get_string(&rstate->msgdata, ctrl_path, 256);	// path is first element in message buffer
--			bzero(&cliaddr, sizeof(cliaddr));
-+			memset(&cliaddr, '\0', sizeof(cliaddr));
- 			cliaddr.sun_family = AF_LOCAL;
- 			strcpy(cliaddr.sun_path, ctrl_path);
- 			}
-@@ -1495,7 +1495,7 @@
- 
-     q = mallocL("DNSQuestion", sizeof(DNSQuestion));
-     if (!q) FatalError("ERROR: handle_query - malloc");
--    bzero(q, sizeof(DNSQuestion));
-+    memset(q, '\0', sizeof(DNSQuestion));
- 
-     q->InterfaceID      = InterfaceID;
-     q->Target           = zeroAddr;
-@@ -1576,7 +1576,7 @@
- 
-     // set up termination info
-     term = mallocL("handle_resolve_request", sizeof(resolve_termination_t));
--    bzero(term, sizeof(*term));
-+    memset(term, '\0', sizeof(*term));
-     if (!term) FatalError("ERROR: malloc");
- 
-     // format questions
-@@ -2635,7 +2635,7 @@
- 		return mStatus_NoMemoryErr;
-         }
-         
--    bzero(extra, sizeof(ExtraResourceRecord));  // OK if oversized rdata not zero'd
-+    memset(extra, '\0', sizeof(ExtraResourceRecord));  // OK if oversized rdata not zero'd
-     extra->r.resrec.rrtype = rrtype;
-     extra->r.rdatastorage.MaxRDLength = (mDNSu16) size;
-     extra->r.resrec.rdlength = rdlen;
-@@ -3208,7 +3208,7 @@
-     
-     rr = mallocL("read_rr_from_ipc_msg", sizeof(AuthRecord) - sizeof(RDataBody) + storage_size);
-     if (!rr) FatalError("ERROR: malloc");
--    bzero(rr, sizeof(AuthRecord));  // ok if oversized rdata not zero'd
-+    memset(rr, '\0', sizeof(AuthRecord));  // ok if oversized rdata not zero'd
-     
-     mDNS_SetupResourceRecord(rr, mDNSNULL, mDNSPlatformInterfaceIDfromInterfaceIndex(gmDNS, interfaceIndex),
- 		type, 0, (mDNSu8) ((flags & kDNSServiceFlagsShared) ? kDNSRecordTypeShared : kDNSRecordTypeUnique), mDNSNULL, mDNSNULL);
-@@ -3337,7 +3337,7 @@
-                 return t_error;
-             	}
-             rs->msgdata = rs->msgbuf;
--            bzero(rs->msgbuf, rs->hdr.datalen + MSG_PAD_BYTES);
-+            memset(rs->msgbuf, '\0', rs->hdr.datalen + MSG_PAD_BYTES);
-             }
-         nleft = rs->hdr.datalen - rs->data_bytes;
-         nread = recv(rs->sd, rs->msgbuf + rs->data_bytes, nleft, 0);
-@@ -3431,14 +3431,14 @@
-     totallen = (int) (datalen + sizeof(ipc_msg_hdr));
-     reply = mallocL("create_reply", sizeof(reply_state));
-     if (!reply) FatalError("ERROR: malloc");
--    bzero(reply, sizeof(reply_state));
-+    memset(reply, '\0', sizeof(reply_state));
-     reply->ts = t_morecoming;
-     reply->sd = request->sd;
-     reply->request = request;
-     reply->len = totallen;
-     reply->msgbuf = mallocL("create_reply", totallen);
-     if (!reply->msgbuf) FatalError("ERROR: malloc");
--    bzero(reply->msgbuf, totallen);
-+    memset(reply->msgbuf, '\0', totallen);
-     reply->mhdr = (ipc_msg_hdr *)reply->msgbuf;
-     reply->rhdr = (reply_hdr *)(reply->msgbuf + sizeof(ipc_msg_hdr));
-     reply->sdata = reply->msgbuf + sizeof(ipc_msg_hdr) + sizeof(reply_hdr);
diff --git a/package/mdnsresponder/mDNSResponderPosix.conf b/package/mdnsresponder/mDNSResponderPosix.conf
deleted file mode 100644
index 639e7be..0000000
--- a/package/mdnsresponder/mDNSResponderPosix.conf
+++ /dev/null
@@ -1,23 +0,0 @@
-# See http://www.dns-sd.org/ServiceTypes.html for service types and parameters.
-# Format is:
-#	name
-#	service type
-#	port
-#	[params, name=value, one per line]
-# NOTE: At least as of 107.1 there is a bug where you cannot have a blank line
-# NOTE: before the first entry if there are any leading comments.
-#yourhost
-#_ssh._tcp.
-#22
-
-#yourhost
-#_http._tcp.
-#80
-#path=/
-
-#yourhost
-#_ftp._tcp.
-#21
-#u=yourusername
-#p=password
-#path=/somepath
diff --git a/package/mdnsresponder/mdnsresponder.mk b/package/mdnsresponder/mdnsresponder.mk
deleted file mode 100644
index 514cd8a..0000000
--- a/package/mdnsresponder/mdnsresponder.mk
+++ /dev/null
@@ -1,96 +0,0 @@
-#############################################################
-#
-# mDNSResponder
-#
-#############################################################
-MDNSRESPONDER_VERSION:=107.6
-MDNSRESPONDER_SOURCE:=mDNSResponder-$(MDNSRESPONDER_VERSION).tar.gz
-MDNSRESPONDER_SITE:=http://www.opensource.apple.com/darwinsource/tarballs/other/$(MDNSRESPONDER_SOURCE)
-MDNSRESPONDER_DIR:=$(BUILD_DIR)/mDNSResponder-$(MDNSRESPONDER_VERSION)
-MDNSRESPONDER_CAT:=$(ZCAT)
-MDNSRESPONDER_INSTDEPS:=
-
-ifeq ($(BR2_PACKAGE_MDNSRESPONDER_UTILS),y)
-	MDNSRESPONDER_INSTDEPS+=$(TARGET_DIR)/usr/bin/mDNSClientPosix
-endif
-
-$(DL_DIR)/$(MDNSRESPONDER_SOURCE):
-	$(call DOWNLOAD,$(MDNSRESPONDER_SITE),$(MDNSRESPONDER_SOURCE))
-
-$(MDNSRESPONDER_DIR)/.unpacked: $(DL_DIR)/$(MDNSRESPONDER_SOURCE)
-	$(MDNSRESPONDER_CAT) $(DL_DIR)/$(MDNSRESPONDER_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(MDNSRESPONDER_DIR) package/mdnsresponder/ \
-		mDNSResponder-$(MDNSRESPONDER_VERSION)\*.patch
-	touch $@
-
-$(MDNSRESPONDER_DIR)/.configured: $(MDNSRESPONDER_DIR)/.unpacked
-	$(SED) 's:OPTIONALTARG = nss_mdns::' $(MDNSRESPONDER_DIR)/mDNSPosix/Makefile
-	touch $@
-
-$(MDNSRESPONDER_DIR)/.built: $(MDNSRESPONDER_DIR)/.configured
-	$(MAKE1) CC=$(TARGET_CC) os="linux" LD="$(TARGET_CC) -shared" LOCALBASE="/usr" -C $(MDNSRESPONDER_DIR)/mDNSPosix
-	touch $@
-
-$(STAGING_DIR)/usr/lib/libdns_sd.so: $(MDNSRESPONDER_DIR)/.built
-	# lib
-	$(INSTALL) -m 644 -D $(MDNSRESPONDER_DIR)/mDNSPosix/build/prod/libdns_sd.so $(STAGING_DIR)/usr/lib/
-	ln -sf $(STAGING_DIR)/usr/lib/libdns_sd.so $(STAGING_DIR)/usr/lib/libdns_sd.so.1
-	# include
-	$(INSTALL) -m 644 -D $(MDNSRESPONDER_DIR)/mDNSShared/dns_sd.h $(STAGING_DIR)/usr/include/
-
-$(TARGET_DIR)/usr/sbin/mdnsd: $(STAGING_DIR)/usr/lib/libdns_sd.so
-	# sbin
-	$(INSTALL) -m 755 -D $(MDNSRESPONDER_DIR)/mDNSPosix/build/prod/dnsextd $(TARGET_DIR)/usr/sbin/
-	$(INSTALL) -m 755 -D $(MDNSRESPONDER_DIR)/mDNSPosix/build/prod/mDNSResponderPosix $(TARGET_DIR)/usr/sbin/
-	$(INSTALL) -m 755 -D $(MDNSRESPONDER_DIR)/mDNSPosix/build/prod/mdnsd $(TARGET_DIR)/usr/sbin/
-	# lib
-	$(INSTALL) -m 644 -D $(MDNSRESPONDER_DIR)/mDNSPosix/build/prod/libdns_sd.so $(TARGET_DIR)/usr/lib/
-	ln -sf $(TARGET_DIR)/usr/lib/libdns_sd.so $(TARGET_DIR)/usr/lib/libdns_sd.so.1
-	# etc
-	$(INSTALL) -m 0644 -D package/mdnsresponder/mDNSResponderPosix.conf $(TARGET_DIR)/etc/
-	# init
-	$(INSTALL) -m 0755 -D package/mdnsresponder/rc.mdnsresponder $(TARGET_DIR)/etc/init.d/S80mdnsresponder
-
-$(TARGET_DIR)/usr/bin/mDNSClientPosix: $(STAGING_DIR)/usr/lib/libdns_sd.so
-	$(INSTALL) -m 755 -D $(MDNSRESPONDER_DIR)/mDNSPosix/build/prod/mDNSNetMonitor $(TARGET_DIR)/usr/sbin/
-	# bin
-	$(INSTALL) -m 755 -D $(MDNSRESPONDER_DIR)/Clients/build/dns-sd $(TARGET_DIR)/usr/bin/
-	$(INSTALL) -m 755 -D $(MDNSRESPONDER_DIR)/mDNSPosix/build/prod/mDNSProxyResponderPosix $(TARGET_DIR)/usr/bin/
-	$(INSTALL) -m 755 -D $(MDNSRESPONDER_DIR)/mDNSPosix/build/prod/mDNSIdentify $(TARGET_DIR)/usr/bin/
-	$(INSTALL) -m 755 -D $(MDNSRESPONDER_DIR)/mDNSPosix/build/prod/mDNSClientPosix $(TARGET_DIR)/usr/bin/
-
-
-mdnsresponder: $(TARGET_DIR)/usr/sbin/mdnsd $(MDNSRESPONDER_INSTDEPS)
-
-mdnsresponder-source: $(DL_DIR)/$(MDNSRESPONDER_SOURCE)
-
-mdnsresponder-unpacked: $(MDNSRESPONDER_DIR)/.unpacked
-
-mdnsresponder-clean:
-	rm -f $(MDNSRESPONDER_DIR)/.configured $(MDNSRESPONDER_DIR)/.built $(MDNSRESPONDER_DIR)/.staged
-	-$(MAKE1) os=linux -C $(MDNSRESPONDER_DIR)/mDNSPosix clean
-	rm -f $(TARGET_DIR)/usr/sbin/dnsextd \
-		$(TARGET_DIR)/usr/sbin/mDNSResponderPosix \
-		$(TARGET_DIR)/usr/sbin/mDNSNetMonitor \
-		$(TARGET_DIR)/usr/sbin/mdnsd \
-		$(TARGET_DIR)/usr/bin/dns-sd \
-		$(TARGET_DIR)/usr/bin/mDNSProxyResponderPosix \
-		$(TARGET_DIR)/usr/bin/mDNSIdentify \
-		$(TARGET_DIR)/usr/bin/mDNSClientPosix \
-		$(TARGET_DIR)/usr/lib/libdns_sd.so* \
-		$(STAGING_DIR)/usr/lib/libdns_sd.so* \
-		$(STAGING_DIR)/usr/include/dns_sd.h \
-		$(TARGET_DIR)/etc/mDNSResponderPosix.conf \
-		$(TARGET_DIR)/etc/init.d/S80mdnsresponder
-
-mdnsresponder-dirclean:
-	rm -rf $(MDNSRESPONDER_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_MDNSRESPONDER),y)
-TARGETS+=mdnsresponder
-endif
diff --git a/package/mdnsresponder/rc.mdnsresponder b/package/mdnsresponder/rc.mdnsresponder
deleted file mode 100644
index 4b3c312..0000000
--- a/package/mdnsresponder/rc.mdnsresponder
+++ /dev/null
@@ -1,67 +0,0 @@
-#!/bin/sh
-#
-# Starts mDNSResponderPosix and mdnsd
-#
-
-umask 077
-
-start() {
- 	echo -n "Starting mdnsd: "
-	start-stop-daemon -S -q -p /var/run/mdnsd.pid \
-                -x /usr/sbin/mdnsd
-	if [ "$?" != "0" ] ; then
-		echo "FAIL"
-		return 1
-	fi
-	echo "OK"
-
-	echo -n "Starting mDNSResponderPosix: "
-	start-stop-daemon -S -q -p /var/run/mDNSResponderPosix.pid \
-                -x /usr/sbin/mDNSResponderPosix \
-                -- -b -f /etc/mDNSResponderPosix.conf -P /var/run/mDNSResponderPosix.pid
-	if [ "$?" != "0" ] ; then
-		echo "FAIL"
-		return 1
-	fi
-	echo "OK"
-}
-stop() {
-	echo -n "Stopping mDNSResponderPosix: "
-	start-stop-daemon -K -q -p /var/run/mDNSResponderPosix.pid
-	if [ "$?" != "0" ] ; then
-		echo "FAIL"
-		return 1
-	fi
-	echo "OK"
-
-	echo -n "Stopping mdnsd: "
-	start-stop-daemon -K -q -p /var/run/mdnsd.pid
-	if [ "$?" != "0" ] ; then
-		echo "FAIL"
-		return 1
-	fi
-	echo "OK"
-}
-
-restart() {
-	stop
-	start
-}
-
-case "$1" in
-  start)
-  	start
-	;;
-  stop)
-  	stop
-	;;
-  restart|reload)
-  	restart
-	;;
-  *)
-	echo "Usage: $0 {start|stop|restart}"
-	exit 1
-esac
-
-exit $?
-
-- 
1.6.3.3
