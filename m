From: Carlos Santos <casantos@datacom.ind.br>
Date: Tue, 28 Nov 2017 14:06:51 -0200
Subject: [Buildroot] [PATCH v2] mtools: do not link to libbsd
In-Reply-To: <0171128125226.32n343bxgzhcrfvp@tarshish>
References: <0171128125226.32n343bxgzhcrfvp@tarshish>
Message-ID: <20171128160651.20880-1-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If libbsd is found by the configuration process, mtools unnecessarily
adds a NEEDED field with libbsd to its dynamic section, but it does not
actually use anything from libbsd under Linux. The same may happen to
host-mtools if some libbsd package is installed on the host machine.

Prevent this by forcing configure to bypass the checking for the
existence of a gethostbyname function in libbsd.

I stumbled on this problem when I built host-mtools and later removed
libbsd to upgrade to Fedora 27, due to Bug 1504831[1]. The previously
built host/bin/mtools started to fail due to the missing libbsd.so.0.

1. https://bugzilla.redhat.com/show_bug.cgi?id=1504831

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
Changes v1->v2
  - Improved the commit message, as requested by Baruch Siach.
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
