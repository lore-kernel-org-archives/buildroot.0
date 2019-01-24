From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Jan 2019 12:30:16 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] tcpreplay: security bump
 to version 4.3.1
Message-ID: <20190124112928.E3AE08E2C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2e9e8a55ded0568999d17966f7baaa98dd7399c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Upstream CHANGELOG entry for 4.3.0 lists these fixes:

    - CVE-2018-18408 use-after-free in post_args (#489)
    - CVE-2018-18407 heap-buffer-overflow csum_replace4 (#488)
    - CVE-2018-17974 heap-buffer-overflow dlt_en10mb_encode (#486)
    - CVE-2018-17580 heap-buffer-overflow fast_edit_packet (#485)
    - CVE-2018-17582 heap-buffer-overflow in get_next_packet (#484)
    - CVE-2018-13112 heap-buffer-overflow in get_l2len (#477 dup #408)

Drop tr_cv_libpcap_version and ac_cv_have_bpf; unused in current
configure script.

Make configure script use pcap-config to list library dependencies.
Unfortunately, pcap-config is not entirely correct, so we still need to
set the LIBS variable for static linking.

Use the smaller tar.xz archive.

Add license file hash.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit f5961ff56a8db95d0f34c640e0b7d7e7b07e540e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tcpreplay/tcpreplay.hash |  5 ++++-
 package/tcpreplay/tcpreplay.mk   | 16 ++++++----------
 2 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/package/tcpreplay/tcpreplay.hash b/package/tcpreplay/tcpreplay.hash
index b033d3c3f1..31b3d3eb28 100644
--- a/package/tcpreplay/tcpreplay.hash
+++ b/package/tcpreplay/tcpreplay.hash
@@ -1,2 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256 043756c532dab93e2be33a517ef46b1341f7239278a1045ae670041dd8a4531d  tcpreplay-4.2.6.tar.gz
+# https://github.com/appneta/tcpreplay/releases/download/v4.3.1/tcpreplay-4.3.1.tar.xz.asc
+# using key 84E4FA215C934A7D97DC76D5E9E2149793BDE17E
+sha256 108924a25e616e3465139410c49cae629c338df73443dfc8fc155ea9f099c659  tcpreplay-4.3.1.tar.xz
+sha256 5971b0c544622f4b210a9cc56436a970685d3b0666e373c09e3cf9304db15d05  docs/LICENSE
diff --git a/package/tcpreplay/tcpreplay.mk b/package/tcpreplay/tcpreplay.mk
index adccde0eb0..71e57d5bd9 100644
--- a/package/tcpreplay/tcpreplay.mk
+++ b/package/tcpreplay/tcpreplay.mk
@@ -4,24 +4,20 @@
 #
 ################################################################################
 
-TCPREPLAY_VERSION = 4.2.6
+TCPREPLAY_VERSION = 4.3.1
 TCPREPLAY_SITE = https://github.com/appneta/tcpreplay/releases/download/v$(TCPREPLAY_VERSION)
+TCPREPLAY_SOURCE = tcpreplay-4.3.1.tar.xz
 TCPREPLAY_LICENSE = GPL-3.0
 TCPREPLAY_LICENSE_FILES = docs/LICENSE
 TCPREPLAY_CONF_ENV = \
-	tr_cv_libpcap_version=">= 0.7.0" \
-	ac_cv_have_bpf=no \
-	$(call AUTOCONF_AC_CHECK_FILE_VAL,$(STAGING_DIR)/usr/include/pcap-netmap.c)=no
-TCPREPLAY_CONF_OPTS = --with-libpcap=$(STAGING_DIR)/usr
+	ac_cv_path_ac_pt_PCAP_CONFIG="$(STAGING_DIR)/usr/bin/pcap-config"
+TCPREPLAY_CONF_OPTS = --with-libpcap=$(STAGING_DIR)/usr \
+	--enable-pcapconfig
 TCPREPLAY_DEPENDENCIES = libpcap
 
-# libpcap may depend on symbols in other libs
-TCPREPLAY_LIBS = $(STAGING_DIR)/usr/bin/pcap-config --static --libs
-TCPREPLAY_CONF_ENV += ac_cv_search_pcap_close="`$(TCPREPLAY_LIBS)`" \
-	LIBS="`$(TCPREPLAY_LIBS)`"
-
 ifeq ($(BR2_STATIC_LIBS),y)
 TCPREPLAY_CONF_OPTS += --enable-dynamic-link=no
+TCPREPLAY_CONF_ENV += LIBS="`$(STAGING_DIR)/usr/bin/pcap-config --static --libs`"
 endif
 
 ifeq ($(BR2_PACKAGE_TCPDUMP),y)
