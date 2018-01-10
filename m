From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue,  9 Jan 2018 22:15:37 -0600
Subject: [Buildroot] [PATCH v3 6/8] busybox: patch to remove -pie from
 LDFLAGS
In-Reply-To: <1515557739-6027-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1515557739-6027-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1515557739-6027-6-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch will remove '-pie' option from LDFLAGS if it was passed
from TARGET_LDFLAGS. Removing of -pie linker option is required
because it cannot be used with the -r option.
Busybox bydefault enables -r option.

Upstream: http://lists.busybox.net/pipermail/busybox/2017-November/085971.html

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 ...-busybox-patch-to-remove-pie-from-LDFLAGS.patch | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 package/busybox/0005-busybox-patch-to-remove-pie-from-LDFLAGS.patch

diff --git a/package/busybox/0005-busybox-patch-to-remove-pie-from-LDFLAGS.patch b/package/busybox/0005-busybox-patch-to-remove-pie-from-LDFLAGS.patch
new file mode 100644
index 0000000..e8223fc
--- /dev/null
+++ b/package/busybox/0005-busybox-patch-to-remove-pie-from-LDFLAGS.patch
@@ -0,0 +1,42 @@
+From 140c2a447a068ff0572dd2e5df53ee12fff0c547 Mon Sep 17 00:00:00 2001
+From: Yogesh Prasad <yogesh.prasad@rockwellcollins.com>
+Date: Tue, 3 Oct 2017 10:46:46 -0500
+Subject: [PATCH 1/1] busybox: patch to remove -pie from LDFLAGS
+
+Description
+This patch will remove '-pie' option from LDFLAGS if it was passed
+from TARGET_LDFLAGS. Removing of -pie linker option is required
+because it cannot be used with the -r option.
+Busybox bydefault enables -r option. if -r and -pie are used together
+below error is thrown by the linker.
+-------------------------------------------------------------------------
+/host/lib/gcc/powerpc-buildroot-linux-gnu/6.4.0/../../../../
+powerpc-buildroot-linux-gnu/bin/ld: -r and -pie may not be used together
+collect2: error: ld returned 1 exit status
+make[3]: *** [applets/built-in.o] Error 1
+make[2]: *** [applets_dir] Error 2
+make[1]: *** [/build/busybox-1.27.1/.stamp_built] Error 2
+make: *** [_all] Error 2
+-------------------------------------------------------------------------
+
+Signed-off-by: Yogesh Prasad <yogesh.prasad@rockwellcollins.com>
+---
+ scripts/Makefile.lib | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
+index 3e54ea7..acf5d33 100644
+--- a/scripts/Makefile.lib
++++ b/scripts/Makefile.lib
+@@ -121,7 +121,7 @@ cpp_flags      = -Wp,-MD,$(depfile) $(NOSTDINC_FLAGS) $(__cpp_flags)
+ # yet ld_flags is fed to ld.
+ #ld_flags       = $(LDFLAGS) $(EXTRA_LDFLAGS)
+ # Remove the -Wl, prefix from linker options normally passed through gcc
+-ld_flags       = $(filter-out -Wl$(comma)%,$(LDFLAGS) $(EXTRA_LDFLAGS))
++ld_flags       = $(filter-out -Wl$(comma)% -pie,$(LDFLAGS) $(EXTRA_LDFLAGS))
+ 
+ 
+ # Finds the multi-part object the current object will be linked into
+-- 
+1.9.1
+
-- 
1.9.1
