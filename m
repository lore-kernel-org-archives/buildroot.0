From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 28 Nov 2006 08:59:18 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  openswan
Message-ID: <20061128165918.1E6B448576@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-11-28 08:59:17 -0800 (Tue, 28 Nov 2006)
New Revision: 16707

Log:
- add openswan support. Compile tested only. Closes #200.


Added:
   trunk/buildroot/package/openswan/
   trunk/buildroot/package/openswan/Config.in
   trunk/buildroot/package/openswan/openswan-2.4.7-001-oswlog.patch
   trunk/buildroot/package/openswan/openswan-2.4.7-002-oswlog.patch
   trunk/buildroot/package/openswan/openswan-2.4.7-003-spi.patch
   trunk/buildroot/package/openswan/openswan-2.4.7-004-alloc.patch
   trunk/buildroot/package/openswan/openswan-2.4.7-005-pluto.patch
   trunk/buildroot/package/openswan/openswan-2.4.7-006-linux-include.patch
   trunk/buildroot/package/openswan/openswan.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2006-11-28 16:54:30 UTC (rev 16706)
+++ trunk/buildroot/package/Config.in	2006-11-28 16:59:17 UTC (rev 16707)
@@ -51,6 +51,8 @@
 source "package/file/Config.in"
 source "package/freetype/Config.in"
 source "package/gettext/Config.in"
+source "package/gmp/Config.in"
+source "package/mpfr/Config.in"
 source "package/gzip/Config.in"
 source "package/haserl/Config.in"
 source "package/hdparm/Config.in"
@@ -108,6 +110,7 @@
 source "package/openssh/Config.in"
 source "package/openssl/Config.in"
 source "package/openvpn/Config.in"
+source "package/openswan/Config.in"
 source "package/pciutils/Config.in"
 source "package/pcmcia/Config.in"
 source "package/pkgconfig/Config.in"

Added: trunk/buildroot/package/openswan/Config.in
===================================================================
--- trunk/buildroot/package/openswan/Config.in	2006-11-28 16:54:30 UTC (rev 16706)
+++ trunk/buildroot/package/openswan/Config.in	2006-11-28 16:59:17 UTC (rev 16707)
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_OPENSWAN
+        bool "openswan"
+        default n
+        select BR2_PACKAGE_LIBGMP
+        select BR2_PACKAGE_MICROPERL
+        help
+	  Openswan is an implementation of IPsec for Linux.
+          http://openswan.org/
+

Added: trunk/buildroot/package/openswan/openswan-2.4.7-001-oswlog.patch
===================================================================
--- trunk/buildroot/package/openswan/openswan-2.4.7-001-oswlog.patch	2006-11-28 16:54:30 UTC (rev 16706)
+++ trunk/buildroot/package/openswan/openswan-2.4.7-001-oswlog.patch	2006-11-28 16:59:17 UTC (rev 16707)
@@ -0,0 +1,30 @@
+--- openswan-2.4.7.orig/lib/libopenswan/oswlog.c	2004-10-17 01:42:13.000000000 +0200
++++ openswan-2.4.7/lib/libopenswan/oswlog.c	2006-11-28 16:08:18.000000000 +0100
+@@ -41,9 +41,11 @@ bool
+ bool
+     logged_txt_warning = FALSE;  /* should we complain about finding KEY? */
+ 
++#if !defined(NO_DEBUG)
+ void openswanlib_passert_fail(const char *pred_str, const char *file_str,
+ 			      unsigned long line_no);
+ openswan_passert_fail_t openswan_passert_fail = openswanlib_passert_fail;
++#endif /* NO_DEBUG */
+ 
+ void
+ tool_init_log(void)
+@@ -104,6 +106,7 @@ openswan_log(const char *message, ...)
+ 	syslog(LOG_WARNING, "%s", m);
+ }
+ 
++#if !defined(NO_DEBUG)
+ void
+ openswan_loglog(int mess_no, const char *message, ...)
+ {
+@@ -119,6 +122,7 @@ openswan_loglog(int mess_no, const char 
+     if (log_to_syslog)
+ 	syslog(LOG_WARNING, "%s", m);
+ }
++#endif
+ 
+ void
+ openswan_log_errno_routine(int e, const char *message, ...)

Added: trunk/buildroot/package/openswan/openswan-2.4.7-002-oswlog.patch
===================================================================
--- trunk/buildroot/package/openswan/openswan-2.4.7-002-oswlog.patch	2006-11-28 16:54:30 UTC (rev 16706)
+++ trunk/buildroot/package/openswan/openswan-2.4.7-002-oswlog.patch	2006-11-28 16:59:17 UTC (rev 16707)
@@ -0,0 +1,34 @@
+diff -urp openswan-2.4.7.orig/include/oswlog.h openswan-2.4.7/include/oswlog.h
+--- openswan-2.4.7.orig/include/oswlog.h	2005-01-26 01:52:16.000000000 +0100
++++ openswan-2.4.7/include/oswlog.h	2006-11-28 17:56:59.000000000 +0100
+@@ -53,6 +53,16 @@ extern void tool_close_log(void);
+ #else /*!DEBUG*/
+ 
+ #define DBG(cond, action)	{ }	/* do nothing */
++#define DBGP(...) (0)
++#define exit_tool exit
++#define loglog(...) do { } while(0)
++#define openswan_loglog(...) do { } while(0)
++#define openswan_DBG_dump(...) do { } while(0)
++#define plog    openswan_log
++extern void openswan_log(const char *message, ...) PRINTF_LIKE(1);
++#define DBG_log(...) do { } while(0)
++extern void tool_init_log(void);
++extern void tool_close_log(void);
+ 
+ #endif /*!DEBUG*/
+ 
+diff -urp openswan-2.4.7.orig/include/pluto_constants.h openswan-2.4.7/include/pluto_constants.h
+--- openswan-2.4.7.orig/include/pluto_constants.h	2005-11-16 23:41:30.000000000 +0100
++++ openswan-2.4.7/include/pluto_constants.h	2006-11-28 17:34:20.000000000 +0100
+@@ -175,6 +175,10 @@ extern const char *const debug_bit_names
+ 
+ #define DBG_NONE	0	/* no options on, including impairments */
+ #define DBG_ALL		LRANGES(DBG_RAW, DBG_X509)  /* all logging options on EXCEPT DBG_PRIVATE */
++#else
++/* FIXME: better cleanup ac.c instead of this */
++#define DBG_RAW         LELEM(0)
++#define DBG_PRIVATE     LELEM(20)
+ #endif
+ 
+ /* State of exchanges

Added: trunk/buildroot/package/openswan/openswan-2.4.7-003-spi.patch
===================================================================
--- trunk/buildroot/package/openswan/openswan-2.4.7-003-spi.patch	2006-11-28 16:54:30 UTC (rev 16706)
+++ trunk/buildroot/package/openswan/openswan-2.4.7-003-spi.patch	2006-11-28 16:59:17 UTC (rev 16707)
@@ -0,0 +1,12 @@
+--- openswan-2.4.7.orig/programs/spi/spi.c	2006-02-15 05:36:36.000000000 +0100
++++ openswan-2.4.7/programs/spi/spi.c	2006-11-28 15:52:41.000000000 +0100
+@@ -538,7 +538,9 @@ main(int argc, char *argv[])
+ 		case 'g':
+ 			debug = 1;
+ 			pfkey_lib_debug = PF_KEY_DEBUG_PARSE_MAX;
++#if !defined(NO_DEBUG)
+ 			cur_debugging = 0xffffffff;
++#endif
+ 			argcount--;
+ 			break;
+ 

Added: trunk/buildroot/package/openswan/openswan-2.4.7-004-alloc.patch
===================================================================
--- trunk/buildroot/package/openswan/openswan-2.4.7-004-alloc.patch	2006-11-28 16:54:30 UTC (rev 16706)
+++ trunk/buildroot/package/openswan/openswan-2.4.7-004-alloc.patch	2006-11-28 16:59:17 UTC (rev 16707)
@@ -0,0 +1,12 @@
+--- openswan-2.4.7.orig/lib/libopenswan/alloc.c	2004-10-17 01:42:13.000000000 +0200
++++ openswan-2.4.7/lib/libopenswan/alloc.c	2006-11-28 16:06:27.000000000 +0100
+@@ -26,7 +26,9 @@
+ #include "constants.h"
+ #include "oswlog.h"
+ 
++#if !defined(NO_DEBUG)
+ #define LEAK_DETECTIVE
++#endif
+ #include "oswalloc.h"
+ 
+ const chunk_t empty_chunk = { NULL, 0 };

Added: trunk/buildroot/package/openswan/openswan-2.4.7-005-pluto.patch
===================================================================
--- trunk/buildroot/package/openswan/openswan-2.4.7-005-pluto.patch	2006-11-28 16:54:30 UTC (rev 16706)
+++ trunk/buildroot/package/openswan/openswan-2.4.7-005-pluto.patch	2006-11-28 16:59:17 UTC (rev 16707)
@@ -0,0 +1,207 @@
+diff -urp openswan-2.4.7.orig/programs/pluto/connections.c openswan-2.4.7/programs/pluto/connections.c
+--- openswan-2.4.7.orig/programs/pluto/connections.c	2006-09-04 19:00:01.000000000 +0200
++++ openswan-2.4.7/programs/pluto/connections.c	2006-11-28 16:53:33.000000000 +0100
+@@ -2084,10 +2084,10 @@ initiate_connection(const char *name, in
+     if (c != NULL)
+     {
+ 	set_cur_connection(c);
+-
++#ifdef DEBUG
+ 	/* turn on any extra debugging asked for */
+ 	c->extra_debugging |= moredebug;
+-
++#endif
+ 	if (!oriented(*c))
+ 	{
+ 	    loglog(RC_ORIENT, "We cannot identify ourselves with either end of this connection.");
+@@ -2577,6 +2577,7 @@ initiate_opportunistic_body(struct find_
+     ourport = ntohs(portof(&b->our_client));
+     hisport = ntohs(portof(&b->peer_client));
+ 
++#ifdef DEBUG
+     snprintf(demandbuf, 256, "initiate on demand from %s:%d to %s:%d proto=%d state: %s because: %s"
+ 	     , ours, ourport, his, hisport, b->transport_proto
+ 	     , oppo_step_name[b->step], b->want);
+@@ -2588,7 +2589,7 @@ initiate_opportunistic_body(struct find_
+ 	whack_log(RC_COMMENT, "%s", demandbuf);
+ 	loggedit = TRUE;
+     }
+-
++#endif
+     if (isanyaddr(&b->our_client) || isanyaddr(&b->peer_client))
+     {
+ 	cannot_oppo(NULL, b, "impossible IP address");
+@@ -3069,10 +3070,11 @@ initiate_opportunistic_body(struct find_
+ 		    }
+ #endif
+ 		    c->gw_info->key->last_tried_time = now();
++#ifdef DEBUG
+ 		    openswan_log("initiate on demand from %s:%d to %s:%d proto=%d state: %s because: %s"
+ 				 , ours, ourport, his, hisport, b->transport_proto
+ 				 , oppo_step_name[b->step], b->want);
+-
++#endif
+ 		    ipsecdoi_initiate(b->whackfd, c, c->policy, 1
+ 				      , SOS_NOBODY, pcim_local_crypto);
+ 		    b->whackfd = NULL_FD;	/* protect from close */
+@@ -4465,6 +4467,7 @@ show_connections_status(void)
+ 		      , c->dpd_delay, c->dpd_timeout);
+ 	}
+ 
++#ifdef DEBUG
+ 	if(c->extra_debugging) {
+ 	    whack_log(RC_COMMENT, "\"%s\"%s:   debug: %s"
+ 		      , c->name
+@@ -4472,6 +4475,7 @@ show_connections_status(void)
+ 		      , bitnamesof(debug_bit_names
+ 				   , c->extra_debugging));
+ 	}
++#endif
+ 
+ 	whack_log(RC_COMMENT
+ 	    , "\"%s\"%s:   newest ISAKMP SA: #%ld; newest IPsec SA: #%ld; "
+Only in openswan-2.4.7/programs/pluto/: connections.o
+Only in openswan-2.4.7/programs/pluto/: cookie.o
+Only in openswan-2.4.7/programs/pluto/: crypt_dh.o
+Only in openswan-2.4.7/programs/pluto/: crypt_ke.o
+Only in openswan-2.4.7/programs/pluto/: crypt_utils.o
+Only in openswan-2.4.7/programs/pluto/: crypto.o
+Only in openswan-2.4.7/programs/pluto/: db_ops.o
+Only in openswan-2.4.7/programs/pluto/: defs.o
+diff -urp openswan-2.4.7.orig/programs/pluto/demux.c openswan-2.4.7/programs/pluto/demux.c
+--- openswan-2.4.7.orig/programs/pluto/demux.c	2005-10-06 02:57:26.000000000 +0200
++++ openswan-2.4.7/programs/pluto/demux.c	2006-11-28 17:04:27.000000000 +0100
+@@ -1009,7 +1009,9 @@ send_packet(struct state *st, const char
+ 		      , len, 0
+ 		      , sockaddrof(&st->st_remoteaddr)
+ 		      , sockaddrlenof(&st->st_remoteaddr));
++#ifdef DEBUG
+     }
++#endif
+ 
+ 	
+ #endif
+Only in openswan-2.4.7/programs/pluto/: demux.o
+Only in openswan-2.4.7/programs/pluto/: dnskey.o
+Only in openswan-2.4.7/programs/pluto/: dpd.o
+Only in openswan-2.4.7/programs/pluto/: foodgroups.o
+Only in openswan-2.4.7/programs/pluto/: id.o
+Only in openswan-2.4.7/programs/pluto/: ike_alg.o
+Only in openswan-2.4.7/programs/pluto/: ike_alg_aes.o
+Only in openswan-2.4.7/programs/pluto/: ike_alginit.o
+Only in openswan-2.4.7/programs/pluto/: ikeping.o
+Only in openswan-2.4.7/programs/pluto/: ikev1_aggr.o
+Only in openswan-2.4.7/programs/pluto/: ikev1_quick.o
+Only in openswan-2.4.7/programs/pluto/: ipsec_doi.o
+Only in openswan-2.4.7/programs/pluto/: kernel.o
+Only in openswan-2.4.7/programs/pluto/: kernel_netlink.o
+Only in openswan-2.4.7/programs/pluto/: kernel_noklips.o
+Only in openswan-2.4.7/programs/pluto/: kernel_pfkey.o
+Only in openswan-2.4.7/programs/pluto/: keys.o
+Only in openswan-2.4.7/programs/pluto/: lex.o
+diff -urp openswan-2.4.7.orig/programs/pluto/log.c openswan-2.4.7/programs/pluto/log.c
+--- openswan-2.4.7.orig/programs/pluto/log.c	2005-07-18 21:40:15.000000000 +0200
++++ openswan-2.4.7/programs/pluto/log.c	2006-11-28 16:56:53.000000000 +0100
+@@ -424,6 +424,7 @@ openswan_log(const char *message, ...)
+     whack_log(RC_LOG, "~%s", m);
+ }
+ 
++#if !defined(NO_DEBUG)
+ void
+ loglog(int mess_no, const char *message, ...)
+ {
+@@ -443,6 +444,7 @@ loglog(int mess_no, const char *message,
+ 
+     whack_log(mess_no, "~%s", m);
+ }
++#endif
+ 
+ void
+ log_errno_routine(int e, const char *message, ...)
+diff -urp openswan-2.4.7.orig/programs/pluto/log.h openswan-2.4.7/programs/pluto/log.h
+--- openswan-2.4.7.orig/programs/pluto/log.h	2004-10-21 21:13:37.000000000 +0200
++++ openswan-2.4.7/programs/pluto/log.h	2006-11-28 16:13:26.000000000 +0100
+@@ -151,10 +151,12 @@ extern void exit_log_errno_routine(int e
+ 
+ extern void whack_log(int mess_no, const char *message, ...) PRINTF_LIKE(2);
+ 
++#if !defined(NO_DEBUG)
+ /* Log to both main log and whack log
+  * Much like log, actually, except for specifying mess_no.
+  */
+ extern void loglog(int mess_no, const char *message, ...) PRINTF_LIKE(2);
++#endif
+ 
+ /* show status, usually on whack log */
+ extern void show_status(void);
+Only in openswan-2.4.7/programs/pluto/: log.o
+Only in openswan-2.4.7/programs/pluto/: md5.o
+Only in openswan-2.4.7/programs/pluto/: nat_traversal.o
+Only in openswan-2.4.7/programs/pluto/: pending.o
+Only in openswan-2.4.7/programs/pluto/: pluto_constants.o
+diff -urp openswan-2.4.7.orig/programs/pluto/pluto_crypt.c openswan-2.4.7/programs/pluto/pluto_crypt.c
+--- openswan-2.4.7.orig/programs/pluto/pluto_crypt.c	2005-07-13 04:14:08.000000000 +0200
++++ openswan-2.4.7/programs/pluto/pluto_crypt.c	2006-11-28 17:25:43.000000000 +0100
+@@ -658,7 +658,9 @@ static void init_crypto_helper(struct pl
+ 	pluto_init_log();
+ 	init_rnd_pool();
+ 	free_preshared_secrets();
++#if !defined(NO_DEBUG)
+ 	openswan_passert_fail = helper_passert_fail;
++#endif
+ 	debug_prefix='!';
+ 
+ 	pluto_crypto_helper(fds[1], n);
+Only in openswan-2.4.7/programs/pluto/: pluto_crypt.o
+Only in openswan-2.4.7/programs/pluto/: plutoalg.o
+diff -urp openswan-2.4.7.orig/programs/pluto/plutomain.c openswan-2.4.7/programs/pluto/plutomain.c
+--- openswan-2.4.7.orig/programs/pluto/plutomain.c	2006-10-27 05:00:30.000000000 +0200
++++ openswan-2.4.7/programs/pluto/plutomain.c	2006-11-28 17:00:56.000000000 +0100
+@@ -85,9 +85,9 @@
+ 
+ const char *ipsec_dir = IPSECDIR;
+ const char *ctlbase = "/var/run/pluto";
+-
++#if !defined(NO_DEBUG)
+ openswan_passert_fail_t openswan_passert_fail = passert_fail;
+-
++#endif
+ /** usage - print help messages
+  *
+  * @param mess String - alternate message to print
+@@ -282,7 +282,9 @@ main(int argc, char **argv)
+ 
+     global_argv = argv;
+     global_argc = argc;
++#if !defined(NO_DEBUG)
+     openswan_passert_fail = passert_fail;
++#endif
+ 
+     /* see if there is an environment variable */
+     coredir = getenv("PLUTO_CORE_DIR");
+@@ -564,10 +566,12 @@ main(int argc, char **argv)
+ 	case '4':	/* --disable_port_floating */
+ 	    nat_t_spf = FALSE;
+ 	    continue;
++#ifdef DEBUG
+ 	case '5':	/* --debug-nat_t */
+ 	    base_debugging |= DBG_NATT;
+ 	    continue;
+ #endif
++#endif
+ #ifdef VIRTUAL_IP
+ 	case '6':	/* --virtual_private */
+ 	    virtual_private = optarg;
+Only in openswan-2.4.7/programs/pluto/: plutomain.o
+Only in openswan-2.4.7/programs/pluto/: rcv_whack.o
+Only in openswan-2.4.7/programs/pluto/: rnd.o
+Only in openswan-2.4.7/programs/pluto/: server.o
+Only in openswan-2.4.7/programs/pluto/: sha1.o
+Only in openswan-2.4.7/programs/pluto/: spdb.o
+Only in openswan-2.4.7/programs/pluto/: spdb_print.o
+Only in openswan-2.4.7/programs/pluto/: spdb_struct.o
+Only in openswan-2.4.7/programs/pluto/: state.o
+Only in openswan-2.4.7/programs/pluto/: timer.o
+Only in openswan-2.4.7/programs/pluto/: vendor.o
+Only in openswan-2.4.7/programs/pluto/: virtual.o
+Only in openswan-2.4.7/programs/pluto/: xauth.o

Added: trunk/buildroot/package/openswan/openswan-2.4.7-006-linux-include.patch
===================================================================
--- trunk/buildroot/package/openswan/openswan-2.4.7-006-linux-include.patch	2006-11-28 16:54:30 UTC (rev 16706)
+++ trunk/buildroot/package/openswan/openswan-2.4.7-006-linux-include.patch	2006-11-28 16:59:17 UTC (rev 16707)
@@ -0,0 +1,12 @@
+diff -urp openswan-2.4.7.orig/linux/include/openswan/passert.h openswan-2.4.7/linux/include/openswan/passert.h
+--- openswan-2.4.7.orig/linux/include/openswan/passert.h	2004-10-21 20:44:42.000000000 +0200
++++ openswan-2.4.7/linux/include/openswan/passert.h	2006-11-28 17:50:03.000000000 +0100
+@@ -69,7 +69,7 @@ extern void switch_fail(int n
+ # define bad_case(n) abort()
+ # define passert(pred)  { }	/* do nothing */
+ # define happy(x)  { (void) x; }	/* evaluate non-judgementally */
+-
++# define pexpect(x) do { } while(0)
+ #endif /*!DEBUG*/
+ 
+ #endif /* _OPENSWAN_PASSERT_H */

Added: trunk/buildroot/package/openswan/openswan.mk
===================================================================
--- trunk/buildroot/package/openswan/openswan.mk	2006-11-28 16:54:30 UTC (rev 16706)
+++ trunk/buildroot/package/openswan/openswan.mk	2006-11-28 16:59:17 UTC (rev 16707)
@@ -0,0 +1,61 @@
+#############################################################
+#
+# openswan
+#
+# NOTE: Uses start-stop-daemon in init script, so be sure
+# to enable that within busybox
+#
+#############################################################
+OPENSWAN_VERSION:=2.4.7
+OPENSWAN_SOURCE:=openswan-$(OPENSWAN_VERSION).tar.gz
+OPENSWAN_SITE:=http://www.openswan.org/download/
+OPENSWAN_DIR:=$(BUILD_DIR)/openswan-$(OPENSWAN_VERSION)
+OPENSWAN_CAT:=$(ZCAT)
+OPENSWAN_BINARY:=openswan
+OPENSWAN_TARGET_BINARY:=usr/sbin/openswan
+
+$(DL_DIR)/$(OPENSWAN_SOURCE):
+	 $(WGET) -P $(DL_DIR) $(OPENSWAN_SITE)/$(OPENSWAN_SOURCE)
+
+openswan-source: $(DL_DIR)/$(OPENSWAN_SOURCE)
+
+$(OPENSWAN_DIR)/.unpacked: $(DL_DIR)/$(OPENSWAN_SOURCE)
+	$(OPENSWAN_CAT) $(DL_DIR)/$(OPENSWAN_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(OPENSWAN_DIR) package/openswan/ openswan.patch
+	touch $(OPENSWAN_DIR)/.unpacked
+
+$(OPENSWAN_DIR)/.configured: $(OPENSWAN_DIR)/.unpacked
+	touch  $(OPENSWAN_DIR)/.configured
+
+$(OPENSWAN_DIR)/$(OPENSWAN_BINARY): $(OPENSWAN_DIR)/.configured
+	echo $(LINUX_KERNEL)
+	$(TARGET_CONFIGURE_OPTS) \
+	$(MAKE) -C $(OPENSWAN_DIR) \
+		KERNELSRC=$(LINUX_DIR) DESTDIR=$(TARGET_DIR) \
+		CC=$(TARGET_CC) USERCOMPILE="-UDEBUG -DNO_DEBUG -ULEAK_DETECTIVE $(TARGET_CFLAGS) -I$(TARGET_DIR)/usr/include" LD_LIBRARY_PATH=$(TARGET_DIR)/usr/lib programs
+
+$(TARGET_DIR)/$(OPENSWAN_TARGET_BINARY): $(OPENSWAN_DIR)/$(OPENSWAN_BINARY)
+	$(TARGET_CONFIGURE_OPTS) \
+	$(MAKE) -C $(OPENSWAN_DIR) \
+		KERNELSRC=$(LINUX_DIR) DESTDIR=$(TARGET_DIR) \
+		CC=$(TARGET_CC) USERCOMPILE="-UDEBUG -DNO_DEBUG -ULEAK_DETECTIVE $(TARGET_CFLAGS) -I$(TARGET_DIR)/usr/include" LD_LIBRARY_PATH=$(TARGET_DIR)/usr/lib install
+	rm -rf $(TARGET_DIR)/share/locale $(TARGET_DIR)/usr/info \
+		$(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/doc
+
+openswan: uclibc libgmp kernel-headers $(TARGET_DIR)/$(OPENSWAN_TARGET_BINARY)
+
+openswan-clean:
+	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(OPENSWAN_DIR) uninstall
+	-$(MAKE) -C $(OPENSWAN_DIR) clean
+
+openswan-dirclean:
+	rm -rf $(OPENSWAN_DIR)
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_OPENSWAN)),y)
+TARGETS+=openswan
+endif
