From: Romain Naour <romain.naour@gmail.com>
Date: Fri, 31 Mar 2017 22:26:04 +0200
Subject: [Buildroot] [PATCH 2/2] package/xenomai: disable obstack support
In-Reply-To: <20170331202604.18153-1-romain.naour@gmail.com>
References: <20170331202604.18153-1-romain.naour@gmail.com>
Message-ID: <20170331202604.18153-2-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Obstack support in Xenomai is broken when the libc doesn't support
obstack support itself. Make sure we disable obstack support for all
libc since it was removed in uClibc-ng since 1.0.21 release and it's
always disabled with Glibc.

Fixes:
http://autobuild.buildroot.net/results/555/555d9cb9cb59fad6353516bed206e1117974e8cd/build-end.log

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Pawel Sikora <sikor6@gmail.com>
---
 package/xenomai/xenomai.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
index fc240f9..77889f0 100644
--- a/package/xenomai/xenomai.mk
+++ b/package/xenomai/xenomai.mk
@@ -23,6 +23,12 @@ XENOMAI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) install-user
 
 XENOMAI_CONF_OPTS += --includedir=/usr/include/xenomai/ --disable-doc-install
 
+# Obstack support in Xenomai is broken when the libc doesn't support
+# obstack support itself. Make sure we disable obstack support for all
+# libc since it was removed in uClibc-ng since 1.0.21 release and it's
+# always disabled with Glibc.
+XENOMAI_CONF_OPTS += CFLAGS="$(TARGET_CFLAGS) -DELIDE_CODE"
+
 define XENOMAI_REMOVE_DEVFILES
 	for i in xeno-config xeno-info wrap-link.sh ; do \
 		rm -f $(TARGET_DIR)/usr/bin/$$i ; \
-- 
2.9.3
