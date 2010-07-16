From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 16 Jul 2010 11:18:07 +0200
Subject: [Buildroot] [PATCH 1/5] Bump dhcp to 4.1.1-P1 and convert to
	autotools
In-Reply-To: <cover.1279271862.git.thomas.petazzoni@free-electrons.com>
References: <cover.1279271862.git.thomas.petazzoni@free-electrons.com>
Message-ID: <abd4f641a3e0302e99c3fa62b62b1d3c80d82003.1279271863.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

dhcp 3.0.5 was causing build issues due to its build system not based
on the autotools. Instead of work-arounding dhcp 3.0.5 issues, this
commit bumps to 4.1.1 which uses the autotools as the build
system. The package is therefore converted to the autotools
infrastructure.

The dhcp_xecute patch is no longer needed, this feature seems to have
been merged into the upstream dhcp (according to the manpage).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dhcp/Config.in         |    8 +-
 package/dhcp/dhcp.mk           |  126 ++++--------
 package/dhcp/dhcp_xecute.patch |  452 ----------------------------------------
 3 files changed, 41 insertions(+), 545 deletions(-)
 delete mode 100644 package/dhcp/dhcp_xecute.patch

diff --git a/package/dhcp/Config.in b/package/dhcp/Config.in
index caf273f..eeb237c 100644
--- a/package/dhcp/Config.in
+++ b/package/dhcp/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_ISC_DHCP
+config BR2_PACKAGE_DHCP
 	bool "DHCP support"
 	help
 	  DHCP relay agent from the ISC DHCP distribution.
@@ -7,21 +7,21 @@ config BR2_PACKAGE_ISC_DHCP
 
 config BR2_PACKAGE_DHCP_SERVER
 	bool "dhcp server"
-	depends on BR2_PACKAGE_ISC_DHCP
+	depends on BR2_PACKAGE_DHCP
 	help
 	  DHCP server from the ISC DHCP distribution.
 
 
 config BR2_PACKAGE_DHCP_RELAY
 	bool "dhcp relay"
-	depends on BR2_PACKAGE_ISC_DHCP
+	depends on BR2_PACKAGE_DHCP
 	help
 	  DHCP relay agent from the ISC DHCP distribution.
 
 
 config BR2_PACKAGE_DHCP_CLIENT
 	bool "dhcp client"
-	depends on BR2_PACKAGE_ISC_DHCP
+	depends on BR2_PACKAGE_DHCP
 	help
 	  DHCP client from the ISC DHCP distribution.
 
diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index 57e0a5d..bf3f775 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -3,108 +3,56 @@
 # dhcp
 #
 #############################################################
-DHCP_VERSION:=3.0.5
-DHCP_SOURCE:=dhcp-$(DHCP_VERSION).tar.gz
-DHCP_SITE:=ftp://ftp.isc.org/isc/dhcp/dhcp-3.0-history
-DHCP_CAT:=$(ZCAT)
-DHCP_DIR:=$(BUILD_DIR)/dhcp-$(DHCP_VERSION)
-DHCP_SERVER_BINARY:=work.linux-2.2/server/dhcpd
-DHCP_RELAY_BINARY:=work.linux-2.2/relay/dhcrelay
-DHCP_CLIENT_BINARY:=work.linux-2.2/client/dhclient
-DHCP_SERVER_TARGET_BINARY:=usr/sbin/dhcpd
-DHCP_RELAY_TARGET_BINARY:=usr/sbin/dhcrelay
-DHCP_CLIENT_TARGET_BINARY:=usr/sbin/dhclient
-BVARS=PREDEFINES='-D_PATH_DHCPD_DB=\"/var/lib/dhcp/dhcpd.leases\" \
-	-D_PATH_DHCLIENT_DB=\"/var/lib/dhcp/dhclient.leases\"' \
-	VARDB=/var/lib/dhcp
+DHCP_VERSION  = 4.1.1-P1
+DHCP_SOURCE   = dhcp-$(DHCP_VERSION).tar.gz
+DHCP_SITE     = http://ftp.isc.org/isc/dhcp/
+DHCP_CONF_ENV = ac_cv_file__dev_random=yes
+DHCP_CONF_OPT = \
+	--localstatedir=/var/lib/dhcp \
+	--with-srv-lease-file=/var/lib/dhcp/dhcpd.leases \
+	--with-cli-lease-file=/var/lib/dhcp/dhclient.leases \
+	--with-srv-pid-file=/var/run/dhcpd.pid \
+	--with-cli-pid-file=/var/run/dhclient.pid \
+	--with-relay-pid-file=/var/run/dhcrelay.pid \
+	--disable-dhcpv6
 
-$(DL_DIR)/$(DHCP_SOURCE):
-	 $(call DOWNLOAD,$(DHCP_SITE),$(DHCP_SOURCE))
-
-dhcp-source: $(DL_DIR)/$(DHCP_SOURCE)
-
-dhcp_server-source: dhcp-source
-dhcp_relay-source: dhcp-source
-dhcp_client-source: dhcp-source
-
-$(DHCP_DIR)/.unpacked: $(DL_DIR)/$(DHCP_SOURCE)
-	$(DHCP_CAT) $(DL_DIR)/$(DHCP_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(DHCP_DIR) package/dhcp/ dhcp\*.patch
-	touch $@
-
-$(DHCP_DIR)/.configured: $(DHCP_DIR)/.unpacked
-	(cd $(DHCP_DIR); \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		./configure; \
-	)
-	touch $@
-
-$(DHCP_DIR)/$(DHCP_RELAY_BINARY): $(DHCP_DIR)/.configured
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) $(BVARS) -C $(DHCP_DIR)
-	$(STRIPCMD) $(DHCP_DIR)/$(DHCP_RELAY_BINARY)
-
-$(TARGET_DIR)/$(DHCP_SERVER_TARGET_BINARY): $(DHCP_DIR)/$(DHCP_RELAY_BINARY)
+ifeq ($(BR2_PACKAGE_DHCP_SERVER),y)
+define DHCP_INSTALL_SERVER
 	mkdir -p $(TARGET_DIR)/var/lib
-	(cd $(TARGET_DIR)/var/lib; \
-		ln -snf /tmp dhcp; \
-	)
-	$(INSTALL) -m 0755 -D $(DHCP_DIR)/$(DHCP_SERVER_BINARY) \
-		$(TARGET_DIR)/$(DHCP_SERVER_TARGET_BINARY)
-	mkdir -p $(TARGET_DIR)/etc/init.d
-	$(INSTALL) -m 0755 -D package/dhcp/S80dhcp-server \
-		$(TARGET_DIR)/etc/init.d
+	(cd $(TARGET_DIR)/var/lib; ln -snf /tmp dhcp)
+	$(INSTALL) -m 0755 -D $(@D)/server/dhcpd $(TARGET_DIR)/usr/sbin/dhcpd
+	$(INSTALL) -m 0755 -D package/dhcp/S80dhcp-server $(TARGET_DIR)/etc/init.d
 	mkdir -p $(TARGET_DIR)/etc/dhcp
-	$(INSTALL) -m 0644 -D package/dhcp/dhcpd.conf \
-		$(TARGET_DIR)/etc/dhcp/dhcpd.conf
-	rm -rf $(TARGET_DIR)/share/locale
+	$(INSTALL) -m 0644 -D package/dhcp/dhcpd.conf $(TARGET_DIR)/etc/dhcp/dhcpd.conf
+endef
+endif
 
-$(TARGET_DIR)/$(DHCP_RELAY_TARGET_BINARY): $(DHCP_DIR)/$(DHCP_RELAY_BINARY)
+ifeq ($(BR2_PACKAGE_DHCP_RELAY),y)
+define DHCP_INSTALL_RELAY
 	mkdir -p $(TARGET_DIR)/var/lib
 	(cd $(TARGET_DIR)/var/lib; ln -snf /tmp dhcp)
-	$(INSTALL) -m 0755 -D $(DHCP_DIR)/$(DHCP_RELAY_BINARY) \
-		$(TARGET_DIR)/$(DHCP_RELAY_TARGET_BINARY)
-	mkdir -p $(TARGET_DIR)/etc/init.d
-	$(INSTALL) -m 0755 -D package/dhcp/S80dhcp-relay \
-		$(TARGET_DIR)/etc/init.d
+	$(INSTALL) -m 0755 -D $(DHCP_DIR)/relay/dhcrelay $(TARGET_DIR)/usr/sbin/
+	$(INSTALL) -m 0755 -D package/dhcp/S80dhcp-relay $(TARGET_DIR)/etc/init.d
+endef
+endif
 
-$(TARGET_DIR)/$(DHCP_CLIENT_TARGET_BINARY): $(DHCP_DIR)/$(DHCP_RELAY_BINARY)
+ifeq ($(BR2_PACKAGE_DHCP_CLIENT),y)
+define DHCP_INSTALL_CLIENT
 	mkdir -p $(TARGET_DIR)/var/lib
 	(cd $(TARGET_DIR)/var/lib; ln -snf /tmp dhcp)
-	$(INSTALL) -m 0755 -D $(DHCP_DIR)/$(DHCP_CLIENT_BINARY) \
-		$(TARGET_DIR)/$(DHCP_CLIENT_TARGET_BINARY)
+	$(INSTALL) -m 0755 -D $(DHCP_DIR)/client/dhclient $(TARGET_DIR)/usr/sbin
 	mkdir -p $(TARGET_DIR)/etc/dhcp
 	$(INSTALL) -m 0644 -D package/dhcp/dhclient.conf \
 		$(TARGET_DIR)/etc/dhcp/dhclient.conf
 	$(INSTALL) -m 0755 -D package/dhcp/dhclient-script \
 		$(TARGET_DIR)/sbin/dhclient-script
+endef
+endif
 
-dhcp_server: $(TARGET_DIR)/$(DHCP_SERVER_TARGET_BINARY)
-
-dhcp_relay: $(TARGET_DIR)/$(DHCP_RELAY_TARGET_BINARY)
-
-dhcp_client: $(TARGET_DIR)/$(DHCP_CLIENT_TARGET_BINARY)
-
-dhcp-clean:
-	-$(MAKE) -C $(DHCP_DIR) clean
-
-dhcp-dirclean:
-	rm -rf $(DHCP_DIR)
+define DHCP_INSTALL_TARGET_CMDS
+	$(DHCP_INSTALL_RELAY)
+	$(DHCP_INSTALL_SERVER)
+	$(DHCP_INSTALL_CLIENT)
+endef
 
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-#ifeq ($(BR2_PACKAGE_ISC_DHCP),y)
-#TARGETS+=dhcp
-#endif
-ifeq ($(BR2_PACKAGE_DHCP_SERVER),y)
-TARGETS+=dhcp_server
-endif
-ifeq ($(BR2_PACKAGE_DHCP_RELAY),y)
-TARGETS+=dhcp_relay
-endif
-ifeq ($(BR2_PACKAGE_DHCP_CLIENT),y)
-TARGETS+=dhcp_client
-endif
+$(eval $(call AUTOTARGETS,package,dhcp))
diff --git a/package/dhcp/dhcp_xecute.patch b/package/dhcp/dhcp_xecute.patch
deleted file mode 100644
index 0daff10..0000000
--- a/package/dhcp/dhcp_xecute.patch
+++ /dev/null
@@ -1,452 +0,0 @@
-diff -urN dhcp-3.0.2.orig/common/conflex.c dhcp-3.0.2/common/conflex.c
---- dhcp-3.0.2.orig/common/conflex.c	2004-11-24 10:39:15.000000000 -0700
-+++ dhcp-3.0.2/common/conflex.c	2005-02-24 12:32:12.000000000 -0700
-@@ -676,6 +676,8 @@
- 			return EVAL;
- 		if (!strcasecmp (atom + 1, "ncapsulate"))
- 			return ENCAPSULATE;
-+  if (!strcasecmp (atom + 1, "xecute"))
-+          return EXECUTE;
- 		break;
- 	      case 'f':
- 		if (!strcasecmp (atom + 1, "atal"))
-diff -urN dhcp-3.0.2.orig/common/dhcp-eval.5 dhcp-3.0.2/common/dhcp-eval.5
---- dhcp-3.0.2.orig/common/dhcp-eval.5	2005-01-19 13:00:52.000000000 -0700
-+++ dhcp-3.0.2/common/dhcp-eval.5	2005-02-24 12:32:12.000000000 -0700
-@@ -409,7 +409,32 @@
- Rebind - DHCP client is in the REBINDING state - it has an IP address,
- and is trying to contact any server to renew it.   The next message to
- be sent will be a DHCPREQUEST, which will be broadcast.
--.RE
-+.PP
-+.B execute (\fIcommand-path\fB, \fIdata-expr1\fB ... \fIdata-exprN\fB)\fR
-+.PP
-+External command execution is possibly through execute expressions. Execute
-+takes a variable number of arguments, where the first is the command
-+name (full path or only the name of the executable) and following zero
-+or more are data-expressions which values will be passed as external
-+arguments. It returns the return code of the external command.
-+.PP
-+Execute is synchronous, and the program will block until the external
-+command being run has finished. Please note that lengthy program
-+execution (for example, in an "on commit" in the dhcpd) may result in
-+bad performance and timed out clients. Try keeping the execution times
-+short.
-+.PP
-+Passing user-supplied data might be dangerous. Check input buffers
-+and make sure the external command handles all kinds of "unusual"
-+characters (shell special characters in sh-scripts etc) correctly.
-+.PP
-+It is possible to use the execute expression in any context, not only
-+on events. If you put it in a regular scope in the configuration file
-+you will execute that command every time a scope is evaluated.
-+.PP
-+The execute expression is only available if you have defined ENABLE_EXECUTE
-+in site.h before compilation.
-+RE
- .SH REFERENCE: LOGGING
- Logging statements may be used to send information to the standard logging
- channels.  A logging statement includes an optional priority (\fBfatal\fR,
-diff -urN dhcp-3.0.2.orig/common/parse.c dhcp-3.0.2/common/parse.c
---- dhcp-3.0.2.orig/common/parse.c	2004-09-30 14:38:31.000000000 -0600
-+++ dhcp-3.0.2/common/parse.c	2005-02-24 12:32:12.000000000 -0700
-@@ -3639,7 +3639,56 @@
- 			return 0;
- 		}
- 		break;
--	
-+  #ifdef ENABLE_EXECUTE
-+  case EXECUTE:
-+   token = next_token (&val, (unsigned *)0, cfile);
-+   
-+   if (!expression_allocate (expr, MDL))
-+    log_fatal ("can't allocate expression.");
-+   
-+   token = next_token (&val, (unsigned *)0, cfile);
-+   if (token != LPAREN) {
-+    parse_warn (cfile, "left parenthesis expected.");
-+    skip_to_semi (cfile);
-+    *lose = 1;
-+    return 0;
-+   }
-+   token = next_token (&val, (unsigned *)0, cfile);
-+   (*expr) -> data.funcall.name =
-+   dmalloc (strlen (val) + 1, MDL);
-+   if (!(*expr)->data.funcall.name)
-+    log_fatal ("can't allocate command name");
-+   strcpy ((*expr) -> data.funcall.name, val);
-+   token = next_token (&val, (unsigned *)0, cfile);
-+   ep = &((*expr) -> data.funcall.arglist);
-+   while (token == COMMA) {
-+    if (!expression_allocate (ep, MDL))
-+     log_fatal ("can't allocate expression");
-+    if (!parse_data_expression (&(*ep) -> data.arg.val,
-+    cfile, lose)) {
-+     skip_to_semi (cfile);
-+     *lose = 1;
-+    return 0;
-+    }
-+    ep = &((*ep) -> data.arg.next);
-+    token = next_token (&val, (unsigned *)0, cfile);
-+    }
-+   (*expr) -> op = expr_execute;
-+   if (token != RPAREN) {
-+    parse_warn (cfile, "right parenthesis expected.");
-+    skip_to_semi (cfile);
-+    *lose = 1;
-+    return 0;
-+   }
-+  break;
-+  #else
-+  case EXECUTE:
-+   parse_warn (cfile, "define ENABLE_EXECUTE in site.h to enable execute expressions.");
-+   skip_to_semi (cfile);
-+   *lose = 1;
-+   return 0;
-+  break;
-+  #endif
- 	      case ENCODE_INT:
- 		token = next_token (&val, (unsigned *)0, cfile);	
- 		token = next_token (&val, (unsigned *)0, cfile);
-diff -urN dhcp-3.0.2.orig/common/print.c dhcp-3.0.2/common/print.c
---- dhcp-3.0.2.orig/common/print.c	2004-06-17 14:54:39.000000000 -0600
-+++ dhcp-3.0.2/common/print.c	2005-02-24 12:32:12.000000000 -0700
-@@ -459,6 +459,7 @@
- {
- 	unsigned rv, left;
- 	const char *s;
-+ struct expression* next_arg;
- 	
- 	switch (expr -> op) {
- 	      case expr_none:
-@@ -483,7 +484,8 @@
- 			return rv;
- 		}
- 		break;
--
-+		
-+		
- 	      case expr_equal:
- 		if (len > 6) {
- 			rv = 4;
-@@ -1024,6 +1026,29 @@
- 			buf [rv++] = 0;
- 			return rv;
- 		}
-+  #ifdef ENABLE_EXECUTE
-+  case expr_execute:
-+   rv = 11 + strlen (expr -> data.funcall.name);
-+   if (len > rv + 2) {
-+    sprintf (buf,
-+    "(execute \"%s\"",
-+    expr -> data.funcall.name);
-+    for(next_arg = expr -> data.funcall.arglist;
-+    next_arg;
-+    next_arg = next_arg -> data.arg.next) {
-+     if (len > rv + 3)
-+      buf [rv++] = ' ';
-+     rv += print_subexpression (next_arg ->
-+     data.arg.val,
-+     buf + rv,
-+     len - rv - 2);
-+    }
-+    buf [rv++] = ')';
-+    buf [rv] = 0;
-+    return rv;
-+   }
-+  break;
-+  #endif
- 	}
- 	return 0;
- }
-diff -urN dhcp-3.0.2.orig/common/tree.c dhcp-3.0.2/common/tree.c
---- dhcp-3.0.2.orig/common/tree.c	2004-11-24 10:39:16.000000000 -0700
-+++ dhcp-3.0.2/common/tree.c	2005-02-24 12:32:12.000000000 -0700
-@@ -50,6 +50,113 @@
- int resolver_inited = 0;
- #endif
- 
-+#ifdef ENABLE_EXECUTE
-+static unsigned long execute (char** args)
-+{
-+pid_t p = fork();
-+if (p > 0) {
-+int status;
-+waitpid (p, &status, 0);
-+return WEXITSTATUS(status);
-+}
-+else if(p == 0) {
-+execvp (args[0], args);
-+log_error ("Unable to execute %s: %s", args[0],
-+strerror(errno));
-+_exit(127);
-+} else {
-+log_fatal ("unable to fork");
-+}
-+return 1; /* never reached */
-+}
-+
-+#define CAPACITY_INCREMENT 8
-+static void append_to_ary (char*** ary_ptr, int* ary_size, int* ary_capacity,
-+char* new_element)
-+{
-+(*ary_size)++;
-+if (*ary_size > *ary_capacity) {
-+char** new_ary;
-+int new_ary_capacity = *ary_capacity + CAPACITY_INCREMENT;
-+new_ary = dmalloc(new_ary_capacity*sizeof(char *), MDL);
-+if (!new_ary)
-+log_fatal ("no memory for array.");
-+if (*ary_ptr != NULL) {
-+memcpy (new_ary, *ary_ptr,
-+(*ary_capacity)*sizeof(char *));
-+dfree (*ary_ptr, MDL);
-+}
-+*ary_ptr = new_ary;
-+*ary_capacity = new_ary_capacity;
-+}
-+(*ary_ptr)[*ary_size-1] = new_element;
-+}
-+
-+static char* data_string_to_char_string (struct data_string* d)
-+{
-+char* str = dmalloc (d->len+1, MDL);
-+if (!str)
-+log_fatal ("no memory for string.");
-+/* FIXME: should one use d -> buffer -> data or d -> data? are
-+they equivalent? */
-+strncpy (str, d -> data, d -> len);
-+str[d->len] = '\0';
-+return str;
-+}
-+
-+static int evaluate_execute (unsigned long* result, struct packet *packet,
-+struct lease *lease,
-+struct client_state *client_state,
-+struct option_state *in_options,
-+struct option_state *cfg_options,
-+struct binding_scope **scope,
-+struct expression* expr)
-+{
-+int status;
-+int cmd_status;
-+int i;
-+struct data_string ds;
-+struct expression* next_arg;
-+char** arg_ary = NULL;
-+int arg_ary_size = 0;
-+int arg_ary_capacity = 0;
-+append_to_ary (&arg_ary, &arg_ary_size, &arg_ary_capacity,
-+ expr -> data.funcall.name);
-+for(next_arg = expr -> data.funcall.arglist;
-+next_arg;
-+next_arg = next_arg -> data.arg.next) {
-+memset (&ds, 0, sizeof ds);
-+status = (evaluate_data_expression
-+(&ds, packet,
-+lease, client_state, in_options,
-+cfg_options, scope,
-+next_arg -> data.arg.val,
-+MDL));
-+if (!status) {
-+if (arg_ary) {
-+for (i=1; i<arg_ary_size; i++)
-+dfree (arg_ary[i], MDL);
-+dfree(arg_ary, MDL);
-+}
-+return 0;
-+}
-+append_to_ary (&arg_ary, &arg_ary_size, &arg_ary_capacity,
-+ data_string_to_char_string(&ds));
-+data_string_forget (&ds, MDL);
-+}
-+#if defined (DEBUG_EXPRESSIONS)
-+log_debug ("exec: execute");
-+#endif
-+append_to_ary (&arg_ary, &arg_ary_size, &arg_ary_capacity, NULL);
-+*result = execute (arg_ary);
-+for (i=1; i<arg_ary_size-1; i++)
-+dfree (arg_ary[i], MDL);
-+dfree(arg_ary, MDL);
-+return 1;
-+}
-+#endif
-+ 
-+
- pair cons (car, cdr)
- 	caddr_t car;
- 	pair cdr;
-@@ -861,6 +968,9 @@
- 	      case expr_extract_int8:
- 	      case expr_extract_int16:
- 	      case expr_extract_int32:
-+       #ifdef ENABLE_EXECUTE
-+       case expr_execute:
-+       #endif
- 	      case expr_const_int:
- 	      case expr_lease_time:
- 	      case expr_dns_transaction:
-@@ -1224,6 +1334,9 @@
- 	      case expr_extract_int8:
- 	      case expr_extract_int16:
- 	      case expr_extract_int32:
-+       #ifdef ENABLE_EXECUTE
-+       case expr_execute:
-+       #endif
- 	      case expr_const_int:
- 	      case expr_lease_time:
- 	      case expr_dns_transaction:
-@@ -2087,6 +2200,9 @@
- 	      case expr_extract_int8:
- 	      case expr_extract_int16:
- 	      case expr_extract_int32:
-+       #ifdef ENABLE_EXECUTE
-+       case expr_execute:
-+       #endif
- 	      case expr_const_int:
- 	      case expr_lease_time:
- 	      case expr_dns_transaction:
-@@ -2595,7 +2711,12 @@
- #endif
- 			return 0;
- 		}
--
-+#ifdef ENABLE_EXECUTE
-+      case expr_execute:
-+      return evaluate_execute (result, packet, lease,
-+       client_state, in_options,
-+       cfg_options, scope, expr);
-+#endif
- 	      case expr_ns_add:
- 	      case expr_ns_delete:
- 	      case expr_ns_exists:
-@@ -3008,6 +3129,9 @@
- 	return (expr -> op == expr_extract_int8 ||
- 		expr -> op == expr_extract_int16 ||
- 		expr -> op == expr_extract_int32 ||
-+  #ifdef ENABLE_EXECUTE
-+   expr -> op == expr_execute ||
-+  #endif
- 		expr -> op == expr_const_int ||
- 		expr -> op == expr_lease_time ||
- 		expr -> op == expr_dns_transaction ||
-@@ -3043,6 +3167,9 @@
- 		expr -> op == expr_extract_int8 ||
- 		expr -> op == expr_extract_int16 ||
- 		expr -> op == expr_extract_int32 ||
-+  #ifdef ENABLE_EXECUTE
-+  expr -> op == expr_execute ||
-+  #endif
- 		expr -> op == expr_dns_transaction);
- }
- 
-@@ -3069,6 +3196,9 @@
- 	      case expr_extract_int8:
- 	      case expr_extract_int16:
- 	      case expr_extract_int32:
-+       #ifdef ENABLE_EXECUTE
-+             case expr_execute:
-+       #endif
- 	      case expr_encode_int8:
- 	      case expr_encode_int16:
- 	      case expr_encode_int32:
-@@ -3165,6 +3295,9 @@
- 	      case expr_extract_int8:
- 	      case expr_extract_int16:
- 	      case expr_extract_int32:
-+       #ifdef ENABLE_EXECUTE
-+       case expr_execute:
-+       #endif
- 	      case expr_encode_int8:
- 	      case expr_encode_int16:
- 	      case expr_encode_int32:
-@@ -3225,6 +3358,8 @@
- 	int firstp;
- {
- 	struct expression *e;
-+ struct expression* next_arg;
-+ 
- 	const char *s;
- 	char obuf [65];
- 	int scol;
-@@ -3696,7 +3831,27 @@
- 					  expr -> data.variable);
- 		col = token_print_indent (file, col, indent, "", "", ")");
- 		break;
--
-+  #ifdef ENABLE_EXECUTE
-+  case expr_execute:
-+   col = token_print_indent (file, col, indent, "", "","execute");
-+   col = token_print_indent (file, col, indent, " ", "","(");
-+   scol = col;
-+   /* FIXME: use token_print_indent_concat() here? */
-+   col = token_print_indent (file, col, scol, "", "","\"");
-+   col = token_print_indent (file, col, scol, "", "",expr -> data.funcall.name);
-+   col = token_print_indent (file, col, scol, "", "","\"");
-+   for(next_arg = expr -> data.funcall.arglist;
-+   next_arg;
-+   next_arg = next_arg -> data.arg.next) {
-+    col = token_print_indent (file, col, scol, "", " ",",");
-+    col = write_expression (file,
-+    next_arg -> data.arg.val,
-+    col, scol, 0);
-+   }
-+   col = token_print_indent (file, col, indent, "", "",")");
-+   
-+  break;
-+#endif
- 	      default:
- 		log_fatal ("invalid expression type in print_expression: %d",
- 			   expr -> op);
-@@ -3915,6 +4070,9 @@
- 	      case expr_extract_int8:
- 	      case expr_extract_int16:
- 	      case expr_extract_int32:
-+       #ifdef ENABLE_EXECUTE
-+       case expr_execute:
-+       #endif
- 	      case expr_encode_int8:
- 	      case expr_encode_int16:
- 	      case expr_encode_int32:
-diff -urN dhcp-3.0.2.orig/includes/dhctoken.h dhcp-3.0.2/includes/dhctoken.h
---- dhcp-3.0.2.orig/includes/dhctoken.h	2004-09-21 13:25:38.000000000 -0600
-+++ dhcp-3.0.2/includes/dhctoken.h	2005-02-24 12:33:21.000000000 -0700
-@@ -308,7 +308,8 @@
- 	DOMAIN_NAME = 613,
- 	DO_FORWARD_UPDATE = 614,
- 	KNOWN_CLIENTS = 615,
--	ATSFP = 616
-+	ATSFP = 616,
-+	EXECUTE = 616
- };
- 
- #define is_identifier(x)	((x) >= FIRST_TOKEN &&	\
-diff -urN dhcp-3.0.2.orig/includes/site.h dhcp-3.0.2/includes/site.h
---- dhcp-3.0.2.orig/includes/site.h	2002-03-12 11:33:39.000000000 -0700
-+++ dhcp-3.0.2/includes/site.h	2005-02-24 12:32:12.000000000 -0700
-@@ -167,6 +167,12 @@
- 
- /* #define DHCPD_LOG_FACILITY LOG_DAEMON */
- 
-+/* Define this if you want to be able to execute external commands
-+   during conditional evaluation. */
-+
-+/* #define ENABLE_EXECUTE */
-+
-+
- /* Define this if you aren't debugging and you want to save memory
-    (potentially a _lot_ of memory) by allocating leases in chunks rather
-    than one at a time. */
-diff -urN dhcp-3.0.2.orig/includes/tree.h dhcp-3.0.2/includes/tree.h
---- dhcp-3.0.2.orig/includes/tree.h	2004-06-10 11:59:31.000000000 -0600
-+++ dhcp-3.0.2/includes/tree.h	2005-02-24 12:32:12.000000000 -0700
-@@ -150,6 +150,9 @@
- 	expr_hardware,
- 	expr_packet,
- 	expr_const_data,
-+ #ifdef ENABLE_EXECUTE
-+ expr_execute,
-+ #endif
- 	expr_extract_int8,
- 	expr_extract_int16,
- 	expr_extract_int32,
-- 
1.7.0.4
