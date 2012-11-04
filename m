From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun,  4 Nov 2012 08:35:12 -0300
Subject: [Buildroot] [PATCH] ulogd: fix build failure
Message-ID: <1352028912-23845-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix Peter's reported build failure:
http://autobuild.buildroot.net/results/1dcf63799937f2216e3c712af8880ad431dbd47c/build-end.log
This is because the configure script uses absolute paths to detect dbi,
mysql and pgsql, so forcibly disable them.
Also add the optional sqlite dependency when it's selected.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ulogd/ulogd.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/ulogd/ulogd.mk b/package/ulogd/ulogd.mk
index 7d31b73..4620bbd 100644
--- a/package/ulogd/ulogd.mk
+++ b/package/ulogd/ulogd.mk
@@ -7,10 +7,11 @@
 ULOGD_VERSION = 2.0.1
 ULOGD_SOURCE = ulogd-$(ULOGD_VERSION).tar.bz2
 ULOGD_SITE = http://www.netfilter.org/projects/ulogd/files
+ULOGD_CONF_OPT = --with-dbi=no --with-mysql=no --with-pgsql=no
 ULOGD_AUTORECONF = YES
 ULOGD_DEPENDENCIES = host-pkgconf \
 	libmnl libnetfilter_acct libnetfilter_conntrack libnetfilter_log \
-	libnfnetlink
+	libnfnetlink $(if $(BR2_PACKAGE_SQLITE),sqlite)
 ULOGD_LICENSE = GPLv2
 ULOGD_LICENSE_FILES = COPYING
 
-- 
1.7.8.6
