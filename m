From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Mar 2014 23:09:51 +0100
Subject: [Buildroot] [git commit] luajit: refactor without shared-lib.patch
Message-ID: <20140303221045.445FA9BC6F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=87c28ee58af8f3fdabeda8ad3b71056104442d5d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

the variable BUILDMODE does the job

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/luajit/luajit-02-shared-lib.patch |   17 -----------------
 package/luajit/luajit.mk                  |    1 +
 2 files changed, 1 insertions(+), 17 deletions(-)

diff --git a/package/luajit/luajit-02-shared-lib.patch b/package/luajit/luajit-02-shared-lib.patch
deleted file mode 100644
index 361e5c2..0000000
--- a/package/luajit/luajit-02-shared-lib.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Compile the luajit binary dynamically against the luajit library
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/src/Makefile
-===================================================================
---- a/src/Makefile
-+++ b/src/Makefile
-@@ -669,7 +669,7 @@
- 
- $(LUAJIT_T): $(TARGET_O) $(LUAJIT_O) $(TARGET_DEP)
- 	$(E) "LINK      $@"
--	$(Q)$(TARGET_LD) $(TARGET_ALDFLAGS) -o $@ $(LUAJIT_O) $(TARGET_O) $(TARGET_ALIBS)
-+	$(Q)$(TARGET_LD) $(TARGET_ALDFLAGS) -o $@ $(LUAJIT_O) -lluajit -L. $(TARGET_ALIBS)
- 	$(Q)$(TARGET_STRIP) $@
- 	$(E) "OK        Successfully built LuaJIT"
- 
diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
index 72720d8..32596a1 100644
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -44,6 +44,7 @@ define LUAJIT_BUILD_CMDS
 		HOST_CFLAGS="$(HOST_CFLAGS)" \
 		HOST_LDFLAGS="$(HOST_LDFLAGS)" \
 		$(LUAJIT_NO_LARGEFILE) \
+		BUILDMODE=dynamic \
 		-C $(@D) amalg
 endef
 
