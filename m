From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 31 Jul 2015 22:32:12 +0200
Subject: [Buildroot] [PATCH 1/1] package/libldns: new package
Message-ID: <1438374732-21603-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Needed by freeswitch.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/Config.in                                  |  1 +
 ...-double-free-for-answers-bigger-than-4096.patch | 25 ++++++++++++
 ...0002-fix-whitespace-bug-in-ldns-read-zone.patch | 45 ++++++++++++++++++++++
 package/libldns/Config.in                          |  9 +++++
 package/libldns/libldns.hash                       |  2 +
 package/libldns/libldns.mk                         | 26 +++++++++++++
 6 files changed, 108 insertions(+)
 create mode 100644 package/libldns/0001-fix-double-free-for-answers-bigger-than-4096.patch
 create mode 100644 package/libldns/0002-fix-whitespace-bug-in-ldns-read-zone.patch
 create mode 100644 package/libldns/Config.in
 create mode 100644 package/libldns/libldns.hash
 create mode 100644 package/libldns/libldns.mk

diff --git a/package/Config.in b/package/Config.in
index 43c58ca..d658c84 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -979,6 +979,7 @@ menu "Networking"
 	source "package/libgsasl/Config.in"
 	source "package/libidn/Config.in"
 	source "package/libiscsi/Config.in"
+	source "package/libldns/Config.in"
 	source "package/libmbus/Config.in"
 	source "package/libmemcached/Config.in"
 	source "package/libmicrohttpd/Config.in"
diff --git a/package/libldns/0001-fix-double-free-for-answers-bigger-than-4096.patch b/package/libldns/0001-fix-double-free-for-answers-bigger-than-4096.patch
new file mode 100644
index 0000000..36bc875
--- /dev/null
+++ b/package/libldns/0001-fix-double-free-for-answers-bigger-than-4096.patch
@@ -0,0 +1,25 @@
+Downloaded from
+http://anonscm.debian.org/cgit/pkg-nlnetlabs/ldns.git/plain/debian/patches/fix-double-free-for-answers-bigger-than-4096.patch
+
+which is a backport from upstream
+http://git.nlnetlabs.nl/ldns/commit/?h=develop&id=2853eb352b4461e98f2926ace4ea3810cedf4167
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+From 2853eb352b4461e98f2926ace4ea3810cedf4167 Mon Sep 17 00:00:00 2001
+From: Willem Toorop <willem@nlnetlabs.nl>
+Date: Tue, 28 Jan 2014 11:06:38 +0100
+Subject: bugfix #548: Double free for answers > 4096
+
+in ldns_resolver_send_pkt.  Thank you sunthought at gmail.com
+---
+--- ldns.orig/resolver.c
++++ ldns/resolver.c
+@@ -1117,6 +1117,7 @@ ldns_resolver_send_pkt(ldns_pkt **answer
+ 					ldns_pkt_set_edns_udp_size(query_pkt
+ 							, 4096);
+ 					ldns_pkt_free(answer_pkt);
++					answer_pkt = NULL;
+ 					/* Nameservers should not become 
+ 					 * unreachable because fragments are
+ 					 * dropped (network error). We might
diff --git a/package/libldns/0002-fix-whitespace-bug-in-ldns-read-zone.patch b/package/libldns/0002-fix-whitespace-bug-in-ldns-read-zone.patch
new file mode 100644
index 0000000..4d8908e
--- /dev/null
+++ b/package/libldns/0002-fix-whitespace-bug-in-ldns-read-zone.patch
@@ -0,0 +1,45 @@
+Dwonloaded from
+http://anonscm.debian.org/cgit/pkg-nlnetlabs/ldns.git/tree/debian/patches/fix-whitespace-bug-in-ldns-read-zone.patch
+
+which is a backport from
+http://git.nlnetlabs.nl/ldns/commit/?h=develop&id=d6037a22fbedb8ef3a22de4107e4eaa36840865b
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+From d6037a22fbedb8ef3a22de4107e4eaa36840865b Mon Sep 17 00:00:00 2001
+From: Matthijs Mekking <matthijs@nlnetlabs.nl>
+Date: Wed, 18 Jun 2014 09:55:17 +0200
+Subject: whitespace bug in ldns-read-zone
+
+---
+--- ldns.orig/rr.c
++++ ldns/rr.c
+@@ -670,6 +670,18 @@ ldns_rr_new_question_frm_str(ldns_rr **n
+ 	                                    true);
+ }
+ 
++static int
++ldns_rr_is_whitespace_line(char* line, int line_len)
++{
++	int i;
++	for (i = 0; i < line_len; i++) {
++		if (!isspace((int)line[i])) {
++			return 0;
++		}
++	}
++	return 1;
++}
++
+ ldns_status
+ ldns_rr_new_frm_fp(ldns_rr **newrr, FILE *fp, uint32_t *ttl, ldns_rdf **origin, ldns_rdf **prev)
+ {
+@@ -745,6 +757,9 @@ ldns_rr_new_frm_fp_l(ldns_rr **newrr, FI
+ 		s = LDNS_STATUS_SYNTAX_TTL;
+ 	} else if (strncmp(line, "$INCLUDE", 8) == 0) {
+ 		s = LDNS_STATUS_SYNTAX_INCLUDE;
++	} else if (ldns_rr_is_whitespace_line(line, size)) {
++		LDNS_FREE(line);
++		return LDNS_STATUS_SYNTAX_EMPTY;
+ 	} else {
+ 		if (origin && *origin) {
+ 			s = ldns_rr_new_frm_str(&rr, (const char*) line, ttl, *origin, prev);
diff --git a/package/libldns/Config.in b/package/libldns/Config.in
new file mode 100644
index 0000000..12065ae
--- /dev/null
+++ b/package/libldns/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_LIBLDNS
+	bool "libldns"
+	help
+	  The goal of ldns is to simplify DNS programming, it supports
+	  recent RFCs like the DNSSEC documents, and allows developers
+	  to easily create software conforming to current RFCs, and
+	  experimental software for current Internet Drafts.
+
+	  http://www.nlnetlabs.nl/projects/ldns
diff --git a/package/libldns/libldns.hash b/package/libldns/libldns.hash
new file mode 100644
index 0000000..7cc3d43
--- /dev/null
+++ b/package/libldns/libldns.hash
@@ -0,0 +1,2 @@
+# From http://www.nlnetlabs.nl/downloads/ldns/ldns-1.6.17.tar.gz.sha1
+sha1	4218897b3c002aadfc7280b3f40cda829e05c9a4	ldns-1.6.17.tar.gz
diff --git a/package/libldns/libldns.mk b/package/libldns/libldns.mk
new file mode 100644
index 0000000..e087207
--- /dev/null
+++ b/package/libldns/libldns.mk
@@ -0,0 +1,26 @@
+################################################################################
+#
+# libldns
+#
+################################################################################
+
+LIBLDNS_VERSION = 1.6.17
+LIBLDNS_SOURCE = ldns-$(LIBLDNS_VERSION).tar.gz
+LIBLDNS_SITE = http://www.nlnetlabs.nl/downloads/ldns
+LIBLDNS_LICENSE = BSD-2c
+LIBLDNS_LICENSE_FILES = LICENSE
+LIBLDNS_INSTALL_STAGING = YES
+LIBLDNS_CONF_OPTS = \
+	--without-examples \
+	--without-p5-dns-ldns \
+	--without-pyldns \
+	--without-pyldnsx
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+LIBLDNS_DEPENDENCIES += host-pkgconf openssl
+LIBLDNS_CONF_OPTS += --with-ssl=$(STAGING_DIR)/usr
+else
+LIBLDNS_CONF_OPTS += --without-ssl
+endif
+
+$(eval $(autotools-package))
-- 
2.1.4
