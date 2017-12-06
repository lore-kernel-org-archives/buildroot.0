From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Dec 2017 23:39:24 +0100
Subject: [Buildroot] [git commit] erlang: Add a patch for hosts without libz
Message-ID: <20171206223241.9630981032@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=572c3f59a9e42c79934484d964b72a1905106d83
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since commit 640c988fd4, erts/configure adds -lz to LIBS but
this variable is also used in some Dynamic Erlang drivers. Fix
Makefiles in such drivers to use the LDLIBS variable instead.

This patch has been reported upstream (see
https://bugs.erlang.org/browse/ERL-529) and should fix:

  http://autobuild.buildroot.net/results/3a3b9a4568c706bd6caad3c63d356680c8405ac5/

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...-Link-with-LDLIBS-instead-of-LIBS-for-DED.patch | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/package/erlang/0004-Link-with-LDLIBS-instead-of-LIBS-for-DED.patch b/package/erlang/0004-Link-with-LDLIBS-instead-of-LIBS-for-DED.patch
new file mode 100644
index 0000000..ad0bb6b
--- /dev/null
+++ b/package/erlang/0004-Link-with-LDLIBS-instead-of-LIBS-for-DED.patch
@@ -0,0 +1,42 @@
+From 011752ec7b31e3dde376270fc65c7ee70644f6e7 Mon Sep 17 00:00:00 2001
+From: Johan Oudinet <johan.oudinet@gmail.com>
+Date: Wed, 6 Dec 2017 15:01:17 +0100
+Subject: [PATCH] Link with LDLIBS instead of LIBS for DED
+
+Fix ERL-529 by avoiding to link with libz for no reason.
+
+Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
+---
+ lib/asn1/c_src/Makefile             | 2 +-
+ lib/runtime_tools/c_src/Makefile.in | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/lib/asn1/c_src/Makefile b/lib/asn1/c_src/Makefile
+index 1f714df357..f7c6b8b9bc 100644
+--- a/lib/asn1/c_src/Makefile
++++ b/lib/asn1/c_src/Makefile
+@@ -126,7 +126,7 @@ $(NIF_LIB_FILE): $(NIF_STATIC_OBJ_FILES)
+ 	$(V_RANLIB) $@
+ 
+ $(NIF_SHARED_OBJ_FILE): $(NIF_OBJ_FILES)
+-	$(V_LD) $(LDFLAGS) -o $(NIF_SHARED_OBJ_FILE) $(NIF_OBJ_FILES) $(CLIB_FLAGS) $(LIBS)
++	$(V_LD) $(LDFLAGS) -o $(NIF_SHARED_OBJ_FILE) $(NIF_OBJ_FILES) $(CLIB_FLAGS) $(LDLIBS)
+ 
+ # ----------------------------------------------------
+ # Release Target
+diff --git a/lib/runtime_tools/c_src/Makefile.in b/lib/runtime_tools/c_src/Makefile.in
+index 4530a83aee..4e13e0d789 100644
+--- a/lib/runtime_tools/c_src/Makefile.in
++++ b/lib/runtime_tools/c_src/Makefile.in
+@@ -95,7 +95,7 @@ $(OBJDIR)/%$(TYPEMARKER).o: %.c dyntrace_lttng.h
+ 	$(V_CC) -c -o $@ $(ALL_CFLAGS) $<
+ 
+ $(LIBDIR)/%$(TYPEMARKER).@DED_EXT@: $(OBJDIR)/%$(TYPEMARKER).o
+-	$(V_LD) $(LDFLAGS) -o $@ $^ $(LIBS)
++	$(V_LD) $(LDFLAGS) -o $@ $^ $(LDLIBS)
+ 
+ clean:
+ 	rm -f $(TRACE_LIBS)
+-- 
+2.14.1
+
