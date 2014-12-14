From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 14 Dec 2014 23:47:24 +0100
Subject: [Buildroot] [PATCH 1/1]  package/gdb: fix shared-only build
Message-ID: <1418597244-31844-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 When --disable-static is given to the gdb's main configure script,
 it also disable the static build of bundled libraries like bfd, readline
 and opcodes, which must be build statically.

 Fixes:
 http://autobuild.buildroot.net/results/219/21979e730dca1fce5bdda9a4c7fad4485e788866/
 http://autobuild.buildroot.net/results/c10/c1096d0bd22de5c6feba848f743601ad0416a944/
 http://autobuild.buildroot.net/results/d8a/d8a5bcc7fa374fb0c916a9d0f33ef283109cb404/
 http://autobuild.buildroot.net/results/22a/22a86d0f1df0fc4698c0f734f3d659e6317404a4/
 http://autobuild.buildroot.net/results/404/404e61e5c30040ee5756f4b5839149dca38660d4/

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/gdb/0001-bfd-force-static-build.patch      | 79 +++++++++++++++++++++
 package/gdb/0002-readline-force-static-build.patch | 34 +++++++++
 .../gdb/0003-libopcodes-force-static-build.patch   | 80 ++++++++++++++++++++++
 3 files changed, 193 insertions(+)
 create mode 100644 package/gdb/0001-bfd-force-static-build.patch
 create mode 100644 package/gdb/0002-readline-force-static-build.patch
 create mode 100644 package/gdb/0003-libopcodes-force-static-build.patch

diff --git a/package/gdb/0001-bfd-force-static-build.patch b/package/gdb/0001-bfd-force-static-build.patch
new file mode 100644
index 0000000..eb20aa6
--- /dev/null
+++ b/package/gdb/0001-bfd-force-static-build.patch
@@ -0,0 +1,79 @@
+From 458f8381d47deea7312963b098efca13bfcf1ae0 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@openwide.fr>
+Date: Sun, 14 Dec 2014 17:03:49 +0100
+Subject: [PATCH 1/3] bfd: force static build
+
+When --disable-static is given to the main configure script,
+it also disable the static build of bundled libraries like bfd.
+
+Fixes:
+http://autobuild.buildroot.net/results/22a/22a86d0f1df0fc4698c0f734f3d659e6317404a4/build-end.log
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ Makefile.in | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/Makefile.in b/Makefile.in
+index bf06dce..492bdbf 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -3004,6 +3004,7 @@ configure-bfd:
+ 	$(SHELL) $${libsrcdir}/configure \
+ 	  $(HOST_CONFIGARGS) --build=${build_alias} --host=${host_alias} \
+ 	  --target=${target_alias} $${srcdiroption}  \
++	  --enable-static --disable-shared \
+ 	  || exit 1
+ @endif bfd
+ 
+@@ -3037,6 +3038,7 @@ configure-stage1-bfd:
+ 	$(SHELL) $${libsrcdir}/configure \
+ 	  $(HOST_CONFIGARGS) --build=${build_alias} --host=${host_alias} \
+ 	  --target=${target_alias} $${srcdiroption} \
++	  --enable-static --disable-shared \
+ 	  $(STAGE1_CONFIGURE_FLAGS)
+ @endif bfd-bootstrap
+ 
+@@ -3069,6 +3071,7 @@ configure-stage2-bfd:
+ 	$(SHELL) $${libsrcdir}/configure \
+ 	  $(HOST_CONFIGARGS) --build=${build_alias} --host=${host_alias} \
+ 	  --target=${target_alias} $${srcdiroption} \
++	  --enable-static --disable-shared \
+ 	  --with-build-libsubdir=$(HOST_SUBDIR) \
+ 	  $(STAGE2_CONFIGURE_FLAGS)
+ @endif bfd-bootstrap
+@@ -3102,6 +3105,7 @@ configure-stage3-bfd:
+ 	$(SHELL) $${libsrcdir}/configure \
+ 	  $(HOST_CONFIGARGS) --build=${build_alias} --host=${host_alias} \
+ 	  --target=${target_alias} $${srcdiroption} \
++	  --enable-static --disable-shared \
+ 	  --with-build-libsubdir=$(HOST_SUBDIR) \
+ 	  $(STAGE3_CONFIGURE_FLAGS)
+ @endif bfd-bootstrap
+@@ -3135,6 +3139,7 @@ configure-stage4-bfd:
+ 	$(SHELL) $${libsrcdir}/configure \
+ 	  $(HOST_CONFIGARGS) --build=${build_alias} --host=${host_alias} \
+ 	  --target=${target_alias} $${srcdiroption} \
++	  --enable-static --disable-shared \
+ 	  --with-build-libsubdir=$(HOST_SUBDIR) \
+ 	  $(STAGE4_CONFIGURE_FLAGS)
+ @endif bfd-bootstrap
+@@ -3168,6 +3173,7 @@ configure-stageprofile-bfd:
+ 	$(SHELL) $${libsrcdir}/configure \
+ 	  $(HOST_CONFIGARGS) --build=${build_alias} --host=${host_alias} \
+ 	  --target=${target_alias} $${srcdiroption} \
++	  --enable-static --disable-shared \
+ 	  --with-build-libsubdir=$(HOST_SUBDIR) \
+ 	  $(STAGEprofile_CONFIGURE_FLAGS)
+ @endif bfd-bootstrap
+@@ -3201,6 +3207,7 @@ configure-stagefeedback-bfd:
+ 	$(SHELL) $${libsrcdir}/configure \
+ 	  $(HOST_CONFIGARGS) --build=${build_alias} --host=${host_alias} \
+ 	  --target=${target_alias} $${srcdiroption} \
++	  --enable-static --disable-shared \
+ 	  --with-build-libsubdir=$(HOST_SUBDIR) \
+ 	  $(STAGEfeedback_CONFIGURE_FLAGS)
+ @endif bfd-bootstrap
+-- 
+1.9.3
+
diff --git a/package/gdb/0002-readline-force-static-build.patch b/package/gdb/0002-readline-force-static-build.patch
new file mode 100644
index 0000000..381006f
--- /dev/null
+++ b/package/gdb/0002-readline-force-static-build.patch
@@ -0,0 +1,34 @@
+From ec9db3cc518fb0dbaa5982573c2203a8618bf994 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@openwide.fr>
+Date: Sun, 14 Dec 2014 17:25:09 +0100
+Subject: [PATCH 2/3] readline: force static build
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+When --disable-static is given to the main configure script,
+it also disable the static build of bundled libraries like readline
+
+Fixes:
+No rule to make target ?? ../readline/libreadline.a ??, needed by ?? gdb ??.
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ Makefile.in | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Makefile.in b/Makefile.in
+index 492bdbf..5378995 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -24746,6 +24746,7 @@ configure-readline:
+ 	$(SHELL) $${libsrcdir}/configure \
+ 	  $(HOST_CONFIGARGS) --build=${build_alias} --host=${host_alias} \
+ 	  --target=${target_alias} $${srcdiroption}  \
++	  --enable-static --disable-shared \
+ 	  || exit 1
+ @endif readline
+ 
+-- 
+1.9.3
+
diff --git a/package/gdb/0003-libopcodes-force-static-build.patch b/package/gdb/0003-libopcodes-force-static-build.patch
new file mode 100644
index 0000000..1f1bd09
--- /dev/null
+++ b/package/gdb/0003-libopcodes-force-static-build.patch
@@ -0,0 +1,80 @@
+From b82d3918cc7dd4c758848ba596f6577c5486ba48 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@openwide.fr>
+Date: Sun, 14 Dec 2014 17:42:15 +0100
+Subject: [PATCH 3/3] libopcodes: force static build
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+When --disable-static is given to the main configure script,
+it also disable the static build of bundled libraries like opcodes.
+
+Fixes:
+No rule to make target ?? ../opcodes/libopcodes.a ??, needed by ?? gdb ??.
+---
+ Makefile.in | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/Makefile.in b/Makefile.in
+index 5378995..ecea16c 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -3883,6 +3883,7 @@ configure-opcodes:
+ 	$(SHELL) $${libsrcdir}/configure \
+ 	  $(HOST_CONFIGARGS) --build=${build_alias} --host=${host_alias} \
+ 	  --target=${target_alias} $${srcdiroption}  \
++	  --enable-static --disable-shared \
+ 	  || exit 1
+ @endif opcodes
+ 
+@@ -3916,6 +3917,7 @@ configure-stage1-opcodes:
+ 	$(SHELL) $${libsrcdir}/configure \
+ 	  $(HOST_CONFIGARGS) --build=${build_alias} --host=${host_alias} \
+ 	  --target=${target_alias} $${srcdiroption} \
++	  --enable-static --disable-shared \
+ 	  $(STAGE1_CONFIGURE_FLAGS)
+ @endif opcodes-bootstrap
+ 
+@@ -3948,6 +3950,7 @@ configure-stage2-opcodes:
+ 	$(SHELL) $${libsrcdir}/configure \
+ 	  $(HOST_CONFIGARGS) --build=${build_alias} --host=${host_alias} \
+ 	  --target=${target_alias} $${srcdiroption} \
++	  --enable-static --disable-shared \
+ 	  --with-build-libsubdir=$(HOST_SUBDIR) \
+ 	  $(STAGE2_CONFIGURE_FLAGS)
+ @endif opcodes-bootstrap
+@@ -3981,6 +3984,7 @@ configure-stage3-opcodes:
+ 	$(SHELL) $${libsrcdir}/configure \
+ 	  $(HOST_CONFIGARGS) --build=${build_alias} --host=${host_alias} \
+ 	  --target=${target_alias} $${srcdiroption} \
++	  --enable-static --disable-shared \
+ 	  --with-build-libsubdir=$(HOST_SUBDIR) \
+ 	  $(STAGE3_CONFIGURE_FLAGS)
+ @endif opcodes-bootstrap
+@@ -4014,6 +4018,7 @@ configure-stage4-opcodes:
+ 	$(SHELL) $${libsrcdir}/configure \
+ 	  $(HOST_CONFIGARGS) --build=${build_alias} --host=${host_alias} \
+ 	  --target=${target_alias} $${srcdiroption} \
++	  --enable-static --disable-shared \
+ 	  --with-build-libsubdir=$(HOST_SUBDIR) \
+ 	  $(STAGE4_CONFIGURE_FLAGS)
+ @endif opcodes-bootstrap
+@@ -4047,6 +4052,7 @@ configure-stageprofile-opcodes:
+ 	$(SHELL) $${libsrcdir}/configure \
+ 	  $(HOST_CONFIGARGS) --build=${build_alias} --host=${host_alias} \
+ 	  --target=${target_alias} $${srcdiroption} \
++	  --enable-static --disable-shared \
+ 	  --with-build-libsubdir=$(HOST_SUBDIR) \
+ 	  $(STAGEprofile_CONFIGURE_FLAGS)
+ @endif opcodes-bootstrap
+@@ -4080,6 +4086,7 @@ configure-stagefeedback-opcodes:
+ 	$(SHELL) $${libsrcdir}/configure \
+ 	  $(HOST_CONFIGARGS) --build=${build_alias} --host=${host_alias} \
+ 	  --target=${target_alias} $${srcdiroption} \
++	  --enable-static --disable-shared \
+ 	  --with-build-libsubdir=$(HOST_SUBDIR) \
+ 	  $(STAGEfeedback_CONFIGURE_FLAGS)
+ @endif opcodes-bootstrap
+-- 
+1.9.3
+
-- 
1.9.3
