From: Steve James <ste@junkomatic.net>
Date: Mon, 15 Dec 2014 13:44:14 +0000
Subject: [Buildroot] [PATCH] snappy: add dependency on host-pkgconf
Message-ID: <201412151344.14441.ste@junkomatic.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Steve James <ste@junkomatic.net>

---
Hello all. First Buildroot patch :-)

(This was discovered when adding leveldb which requires snappy. This missing
dependency is exposed when selection of this package is the only non-default
configuration choice ie you're not getting host-pkgconf via some other non-
default choice.)

Snappy doesn't configure without host pkg-config. The diagnostic from autoconf
is totally unhelpful, so for the benefit of others who might need this
prerequisite, when autoconf says this...

  configure.ac:42: error: possibly undefined macro: AC_DEFINE
        If this token and others are legitimate, please use m4_pattern_allow.
        See the Autoconf documentation.
  configure.ac:44: error: possibly undefined macro: AC_MSG_FAILURE

The solution is (probably) to add host-pkgconf to the packages's DEPENDENCIES
list.


 package/snappy/snappy.mk |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/snappy/snappy.mk b/package/snappy/snappy.mk
index fd89325..6bda7ce 100644
--- a/package/snappy/snappy.mk
+++ b/package/snappy/snappy.mk
@@ -10,6 +10,7 @@ SNAPPY_LICENSE = BSD-3c
 SNAPPY_LICENSE_FILES = COPYING
 # from git
 SNAPPY_AUTORECONF = YES
+SNAPPY_DEPENDENCIES = host-pkgconf
 SNAPPY_INSTALL_STAGING = YES
 
 $(eval $(autotools-package))
-- 
1.7.10.4
