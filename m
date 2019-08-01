From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Date: Thu,  1 Aug 2019 14:02:41 -0700
Subject: [Buildroot] Makefile: follow symlinks when excluding files from
 being stripped.
Message-ID: <20190801210241.40325-1-umesh.nerlige.ramappa@intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In BR2_STRIP_EXCLUDE_FILES="libfoo.so" libfoo.so is mostly a symlink
pointing to the actual library file. The actual library file is still
stripped. While specifying the actual library file as libfoo.so.x.x
will work just fine, a user of buildroot need not know what version
of the library is being picked.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 9cce934990..8f689401ba 100644
--- a/Makefile
+++ b/Makefile
@@ -624,7 +624,7 @@ STRIP_FIND_COMMON_CMD = \
 		-prune -o \
 	) \
 	$(if $(call qstrip,$(BR2_STRIP_EXCLUDE_FILES)), \
-		-not \( $(call findfileclauses,$(call qstrip,$(BR2_STRIP_EXCLUDE_FILES))) \) )
+		-not -follow \( $(call findfileclauses,$(call qstrip,$(BR2_STRIP_EXCLUDE_FILES))) \) )
 
 # Regular stripping for everything, except libpthread, ld-*.so and
 # kernel modules:
-- 
2.20.1
