From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  7 Mar 2013 10:18:22 +0100
Subject: [Buildroot] [PATCH] autoconf: don't try to build Emacs files
Message-ID: <1362647902-13742-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When building autoconf for the target, we already passed EMACS="no" to
prevent autoconf from building Emacs mode files. But we weren't doing
that when building autoconf for the host. This causes problems when
'emacs' is not really emacs, but a sort of clone like Jove. So we also
pass EMACS="no" when building host-autoconf to avoid autoconf
./configure script from detecting emacs and then use it to build .elc
files from .el source code.

Reported-by: Spielmann Werner <Werner.Spielmann@swarovski.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/autoconf/autoconf.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/autoconf/autoconf.mk b/package/autoconf/autoconf.mk
index 0c36b66..daac1f2 100644
--- a/package/autoconf/autoconf.mk
+++ b/package/autoconf/autoconf.mk
@@ -15,7 +15,7 @@ AUTOCONF_CONF_ENV = EMACS="no" ac_cv_path_M4=$(HOST_DIR)/usr/bin/m4 \
 
 AUTOCONF_DEPENDENCIES = host-m4 perl
 
-HOST_AUTOCONF_CONF_ENV = ac_cv_path_M4=$(HOST_DIR)/usr/bin/m4 \
+HOST_AUTOCONF_CONF_ENV = EMACS="no" ac_cv_path_M4=$(HOST_DIR)/usr/bin/m4 \
 			ac_cv_prog_gnu_m4_gnu=no
 
 HOST_AUTOCONF_DEPENDENCIES = host-m4 host-libtool
-- 
1.7.9.5
