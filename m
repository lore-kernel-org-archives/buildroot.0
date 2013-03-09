From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 9 Mar 2013 12:07:35 +0100
Subject: [Buildroot] [git commit] autoconf: don't try to build Emacs files
Message-ID: <20130309114337.4A19A9AF46@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d2be9be63d2b1120c4ec0c3c445075a7311ef523
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When building autoconf for the target, we already passed EMACS="no" to
prevent autoconf from building Emacs mode files. But we weren't doing
that when building autoconf for the host. This causes problems when
'emacs' is not really emacs, but a sort of clone like Jove. So we also
pass EMACS="no" when building host-autoconf to avoid autoconf
./configure script from detecting emacs and then use it to build .elc
files from .el source code.

Reported-by: Spielmann Werner <Werner.Spielmann@swarovski.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/autoconf/autoconf.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
