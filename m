From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 4 Nov 2012 13:55:42 +0100
Subject: [Buildroot] [git commit] ulogd: fix build failure
Message-ID: <20121104130704.C813899BD2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3da67a081e55431f7b0cfae850a3f6851ff39409
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix Peter's reported build failure:
http://autobuild.buildroot.net/results/1dcf63799937f2216e3c712af8880ad431dbd47c/build-end.log
This is because the configure script uses absolute paths to detect dbi,
mysql and pgsql, so forcibly disable them.
Also add the optional sqlite dependency when it's selected.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
 
