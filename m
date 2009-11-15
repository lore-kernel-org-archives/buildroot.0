From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 15 Nov 2009 20:43:42 +0100
Subject: [Buildroot] [git commit master] lighttpd: bump package to 1.4.24
Message-ID: <20091115194420.25CB3777AC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=4e27686c63a50e276cb9602886e3063f60f58835
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #709

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                         |   11 +-
 package/lighttpd/lighttpd-changeset-r2683.patch |  233 +++++++++++++++++++++++
 package/lighttpd/lighttpd.mk                    |    2 +-
 3 files changed, 241 insertions(+), 5 deletions(-)
 create mode 100644 package/lighttpd/lighttpd-changeset-r2683.patch

diff --git a/CHANGES b/CHANGES
index 2f9f81b..21e1c20 100644
--- a/CHANGES
+++ b/CHANGES
@@ -7,10 +7,12 @@
 	e2fsprogs, festival, gstreamer, gst-plugins-bad, gst-plugins-base,
 	gst-plugins-good, imagemagick, iptables, kernel-headers, kismet,
 	libelf, libevent, libglib2, liblockfile, libmad, libpcap, libupnp,
-	libuuid, ltrace, lua, lzma, mdadm, ncftp, ncurses, netkittelnet,
-	netsnmp, ntfs-3g, openssl, php, python, quagga, radvd, rsync, samba,
-	sawman, shared-mime-info, speech-tools, sqlite, squashfs, synergy,
-	syslinux, tcpdump, u-boot, util-linux, valgrind, vsftpd, wipe,
+	libuuid, lighttpd, ltrace, lua, lzma, mdadm, ncftp, ncurses,
+	netkittelnet, netsnmp, ntfs-3g, openssl, php, python, quagga, radvd,
+	rsync, samba, sawman, shared-mime-info, speech-tools, sqlite,
+	squashfs, synergy, syslinux, tcpdump, u-boot, util-linux, valgrind,
+	vsftpd, wipe
+
 	wpa-supplicant, xdata_xcursor-themes, zlib
 
 	Removed package: mdnsresponder, mpatrol, gcc 3.4.6 + 4.0.4
@@ -35,6 +37,7 @@
 	#657: Bug in imagemagick-clean target
 	#665: [PATCH] Samba package
 	#667: [PATCH] e2fsprogs
+	#709: Bump lighttpd package to 1.4.24
 
 2009.08, Released August 31th, 2009:
 
diff --git a/package/lighttpd/lighttpd-changeset-r2683.patch b/package/lighttpd/lighttpd-changeset-r2683.patch
new file mode 100644
index 0000000..aacabad
--- /dev/null
+++ b/package/lighttpd/lighttpd-changeset-r2683.patch
@@ -0,0 +1,233 @@
+diff -Nura lighttpd-1.4.24/src/mod_rewrite.c lighttpd-1.4.24-changeset-r2683/src/mod_rewrite.c
+--- lighttpd-1.4.24/src/mod_rewrite.c	2009-10-12 18:48:47.000000000 -0300
++++ lighttpd-1.4.24-changeset-r2683/src/mod_rewrite.c	2009-11-10 13:56:22.000000000 -0300
+@@ -9,10 +9,9 @@
+ #include <stdlib.h>
+ #include <string.h>
+ 
+-typedef struct {
+ #ifdef HAVE_PCRE_H
++typedef struct {
+ 	pcre *key;
+-#endif
+ 
+ 	buffer *value;
+ 
+@@ -70,7 +69,6 @@
+ }
+ 
+ static int rewrite_rule_buffer_append(rewrite_rule_buffer *kvb, buffer *key, buffer *value, int once) {
+-#ifdef HAVE_PCRE_H
+ 	size_t i;
+ 	const char *errptr;
+ 	int erroff;
+@@ -109,18 +107,9 @@
+ 	kvb->used++;
+ 
+ 	return 0;
+-#else
+-	UNUSED(kvb);
+-	UNUSED(value);
+-	UNUSED(once);
+-	UNUSED(key);
+-
+-	return -1;
+-#endif
+ }
+ 
+ static void rewrite_rule_buffer_free(rewrite_rule_buffer *kvb) {
+-#ifdef HAVE_PCRE_H
+ 	size_t i;
+ 
+ 	for (i = 0; i < kvb->size; i++) {
+@@ -130,7 +119,6 @@
+ 	}
+ 
+ 	if (kvb->ptr) free(kvb->ptr);
+-#endif
+ 
+ 	free(kvb);
+ }
+@@ -201,24 +189,29 @@
+ 							    ((data_string *)(da->value->data[j]))->key,
+ 							    ((data_string *)(da->value->data[j]))->value,
+ 							    once)) {
+-#ifdef HAVE_PCRE_H
+ 				log_error_write(srv, __FILE__, __LINE__, "sb",
+ 						"pcre-compile failed for", da->value->data[j]->key);
+-#else
+-				log_error_write(srv, __FILE__, __LINE__, "s",
+-						"pcre support is missing, please install libpcre and the headers");
+-#endif
+ 			}
+ 		}
+ 	}
+ 
+ 	return 0;
+ }
++#else
++static int parse_config_entry(server *srv, array *ca, const char *option) {
++	static int logged_message = 0;
++	if (logged_message) return 0;
++	if (NULL != array_get_element(ca, option)) {
++		logged_message = 1;
++		log_error_write(srv, __FILE__, __LINE__, "s",
++			"pcre support is missing, please install libpcre and the headers");
++	}
++	return 0;
++}
++#endif
+ 
+ SETDEFAULTS_FUNC(mod_rewrite_set_defaults) {
+-	plugin_data *p = p_d;
+ 	size_t i = 0;
+-
+ 	config_values_t cv[] = {
+ 		{ "url.rewrite-repeat",        NULL, T_CONFIG_LOCAL, T_CONFIG_SCOPE_CONNECTION }, /* 0 */
+ 		{ "url.rewrite-once",          NULL, T_CONFIG_LOCAL, T_CONFIG_SCOPE_CONNECTION }, /* 1 */
+@@ -243,33 +236,37 @@
+ 		{ NULL,                        NULL, T_CONFIG_UNSET, T_CONFIG_SCOPE_UNSET }
+ 	};
+ 
++#ifdef HAVE_PCRE_H
++	plugin_data *p = p_d;
++
+ 	if (!p) return HANDLER_ERROR;
+ 
+ 	/* 0 */
+ 	p->config_storage = calloc(1, srv->config_context->used * sizeof(specific_config *));
++#else
++	UNUSED(p_d);
++#endif
+ 
+ 	for (i = 0; i < srv->config_context->used; i++) {
+-		plugin_config *s;
+ 		array *ca;
++#ifdef HAVE_PCRE_H
++		plugin_config *s;
+ 
+ 		s = calloc(1, sizeof(plugin_config));
+ 		s->rewrite = rewrite_rule_buffer_init();
+ 		s->rewrite_NF = rewrite_rule_buffer_init();
+-
+-		cv[0].destination = s->rewrite;
+-		cv[1].destination = s->rewrite;
+-		cv[2].destination = s->rewrite_NF;
+-		cv[3].destination = s->rewrite_NF;
+-		cv[4].destination = s->rewrite;
+-		cv[5].destination = s->rewrite;
+-
+ 		p->config_storage[i] = s;
++#endif
++
+ 		ca = ((data_config *)srv->config_context->data[i])->value;
+ 
+ 		if (0 != config_insert_values_global(srv, ca, cv)) {
+ 			return HANDLER_ERROR;
+ 		}
+ 
++#ifndef HAVE_PCRE_H
++# define parse_config_entry(srv, ca, x, option, y) parse_config_entry(srv, ca, option)
++#endif
+ 		parse_config_entry(srv, ca, s->rewrite, "url.rewrite-once",      1);
+ 		parse_config_entry(srv, ca, s->rewrite, "url.rewrite-final",     1);
+ 		parse_config_entry(srv, ca, s->rewrite_NF, "url.rewrite-if-not-file",   1);
+@@ -280,7 +277,9 @@
+ 
+ 	return HANDLER_GO_ON;
+ }
++
+ #ifdef HAVE_PCRE_H
++
+ #define PATCH(x) \
+ 	p->conf.x = s->x;
+ static int mod_rewrite_patch_connection(server *srv, connection *con, plugin_data *p) {
+@@ -330,7 +329,7 @@
+ 
+ 	return 0;
+ }
+-#endif
++
+ URIHANDLER_FUNC(mod_rewrite_con_reset) {
+ 	plugin_data *p = p_d;
+ 
+@@ -345,7 +344,6 @@
+ }
+ 
+ static int process_rewrite_rules(server *srv, connection *con, plugin_data *p, rewrite_rule_buffer *kvb) {
+-#ifdef HAVE_PCRE_H
+ 	size_t i;
+ 	handler_ctx *hctx;
+ 
+@@ -444,19 +442,11 @@
+ 		}
+ #undef N
+ 	}
+-#else
+-	UNUSED(srv);
+-	UNUSED(con);
+-	UNUSED(p);
+-	UNUSED(hctx);
+-	UNUSED(kvb);
+-#endif
+ 
+ 	return HANDLER_GO_ON;
+ }
+ 
+ URIHANDLER_FUNC(mod_rewrite_physical) {
+-#ifdef HAVE_PCRE_H
+ 	plugin_data *p = p_d;
+ 	handler_t r;
+ 	stat_cache_entry *sce;
+@@ -480,17 +470,11 @@
+ 	default:
+ 		return r;
+ 	}
+-#else
+-	UNUSED(srv);
+-	UNUSED(con);
+-	UNUSED(p_d);
+-#endif
+ 
+ 	return HANDLER_GO_ON;
+ }
+ 
+ URIHANDLER_FUNC(mod_rewrite_uri_handler) {
+-#ifdef HAVE_PCRE_H
+ 	plugin_data *p = p_d;
+ 
+ 	mod_rewrite_patch_connection(srv, con, p);
+@@ -498,29 +482,27 @@
+ 	if (!p->conf.rewrite) return HANDLER_GO_ON;
+ 
+ 	return process_rewrite_rules(srv, con, p, p->conf.rewrite);
+-#else
+-	UNUSED(srv);
+-	UNUSED(con);
+-	UNUSED(p_d);
+-#endif
+ 
+ 	return HANDLER_GO_ON;
+ }
++#endif
+ 
+ int mod_rewrite_plugin_init(plugin *p);
+ int mod_rewrite_plugin_init(plugin *p) {
+ 	p->version     = LIGHTTPD_VERSION_ID;
+ 	p->name        = buffer_init_string("rewrite");
+ 
++#ifdef HAVE_PCRE_H
+ 	p->init        = mod_rewrite_init;
+ 	/* it has to stay _raw as we are matching on uri + querystring
+ 	 */
+ 
+ 	p->handle_uri_raw = mod_rewrite_uri_handler;
+ 	p->handle_physical = mod_rewrite_physical;
+-	p->set_defaults = mod_rewrite_set_defaults;
+ 	p->cleanup     = mod_rewrite_free;
+ 	p->connection_reset = mod_rewrite_con_reset;
++#endif
++	p->set_defaults = mod_rewrite_set_defaults;
+ 
+ 	p->data        = NULL;
+ 
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index 4ec7403..2af19cf 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LIGHTTPD_VERSION = 1.4.23
+LIGHTTPD_VERSION = 1.4.24
 LIGHTTPD_SOURCE = lighttpd-$(LIGHTTPD_VERSION).tar.bz2
 LIGHTTPD_SITE = http://www.lighttpd.net/download
 LIGHTTPD_LIBTOOL_PATCH = NO
-- 
1.6.3.3
