From: Carlos Santos <casantos@datacom.ind.br>
Date: Tue, 28 Nov 2017 08:48:17 -0200
Subject: [Buildroot] [PATCH] mtools: do not link to libbsd
Message-ID: <20171128104817.15073-1-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mtools is unneccessarily linked to libbsd if this library is found by
the configuration script. The same may happen to host-mtools if some
libbsd-devel package is installed on the host machine. Prevent this by
forcing configure to ignore the existence o libbsd.

I stumbled on this when I built host-mtools and removed libbsd-devel to
upgrade to Fedora 27, due to Bug 1504831*. The previously built
host/bin/mtools started to fail due to the missing libbsd.x.y.so

* https://bugzilla.redhat.com/show_bug.cgi?id=1504831

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 package/mtools/mtools.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/mtools/mtools.mk b/package/mtools/mtools.mk
index 5db548fad9..1a6218831e 100644
--- a/package/mtools/mtools.mk
+++ b/package/mtools/mtools.mk
@@ -13,9 +13,13 @@ MTOOLS_CONF_OPTS = --without-x
 # info documentation not needed
 MTOOLS_CONF_ENV = \
 	ac_cv_func_setpgrp_void=yes \
+	ac_cv_lib_bsd_gethostbyname=no \
+	ac_cv_lib_bsd_main=no \
 	ac_cv_path_INSTALL_INFO=
 
 HOST_MTOOLS_CONF_ENV = \
+	ac_cv_lib_bsd_gethostbyname=no \
+	ac_cv_lib_bsd_main=no \
 	ac_cv_path_INSTALL_INFO=
 
 # link with iconv if enabled
-- 
2.14.3
