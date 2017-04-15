From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Apr 2017 12:00:09 +0200
Subject: [Buildroot] [git commit] package/xenomai: disable obstack support
Message-ID: <20170415100029.80138825CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e87644cb2abb78c5bf3bd0c3c6955c202e798ef2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Obstack support in Xenomai is broken when the libc doesn't support
obstack support itself. Make sure we disable obstack support for all
libc since it was removed in uClibc-ng since 1.0.21 release and it's
always disabled with Glibc.

Fixes:
http://autobuild.buildroot.net/results/555/555d9cb9cb59fad6353516bed206e1117974e8cd/build-end.log

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Pawel Sikora <sikor6@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xenomai/xenomai.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
index bd147a9..4ae045a 100644
--- a/package/xenomai/xenomai.mk
+++ b/package/xenomai/xenomai.mk
@@ -35,6 +35,12 @@ else
 XENOMAI_CONF_OPTS += --disable-smp
 endif
 
+# Obstack support in Xenomai is broken when the libc doesn't support
+# obstack support itself. Make sure we disable obstack support for all
+# libc since it was removed in uClibc-ng since 1.0.21 release and it's
+# always disabled with Glibc.
+XENOMAI_CONF_OPTS += CFLAGS="$(TARGET_CFLAGS) -DELIDE_CODE"
+
 define XENOMAI_REMOVE_DEVFILES
 	for i in xeno-config xeno-info wrap-link.sh ; do \
 		rm -f $(TARGET_DIR)/usr/bin/$$i ; \
