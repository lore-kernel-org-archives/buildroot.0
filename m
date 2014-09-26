From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 26 Sep 2014 22:13:59 +0200
Subject: [Buildroot] [PATCH] ipackage/cdrkit: fix namespace of variables
Message-ID: <1411762440-17520-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Not all cdrkit variables are prefixed with CDRKIT_, so they leak.

Most importantly, they look like they belong to another package's
namespace, cmake, as they start with CMAKE_ (but fortunately, they
have no impact on cmake, as they are not used by our infras.)

Fix that by removing the intermediate variables, and directly set
the CDRKIT_CONF_OPT variable.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cdrkit/cdrkit.mk | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/cdrkit/cdrkit.mk b/package/cdrkit/cdrkit.mk
index ee98013..7474fff 100644
--- a/package/cdrkit/cdrkit.mk
+++ b/package/cdrkit/cdrkit.mk
@@ -11,13 +11,11 @@ CDRKIT_LICENSE = GPLv2
 CDRKIT_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_ENDIAN),"BIG")
-CMAKE_ENDIAN_OPT=-DBITFIELDS_HTOL=1
+CDRKIT_CONF_OPT += -DBITFIELDS_HTOL=1
 else
-CMAKE_ENDIAN_OPT=-DBITFIELDS_HTOL=0
+CDRKIT_CONF_OPT += -DBITFIELDS_HTOL=0
 endif
 
-CDRKIT_CONF_OPT += $(CMAKE_ENDIAN_OPT)
-
 ## cdrkit isn't completely re-rooted by CMAKE_FIND_ROOT_PATH, so add
 ## some extra flags so it finds needed libs and headers.
 CDRKIT_CONF_OPT += -DCMAKE_C_FLAGS="-I$(STAGING_DIR)/usr/include"
-- 
1.9.1
