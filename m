From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Tue,  8 May 2018 17:55:37 +0200
Subject: [Buildroot] [PATCH] package/go: fixing host go cross compilation
Message-ID: <1525794937-15437-1-git-send-email-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Actually if GOHOSTOS == GOOS || GOHOSTARCH == GOARCH the go build system assume
it's not cross compiling and uses the same toolchain for both the host and the
target. This commit adds a patch to enable the explicit
GO_ASSUME_CROSSCOMPILING in go build system and updates to go package
accordingly.

Fixes:
http://autobuild.buildroot.net/results/3636b1ac5756a782fd7578186508aaf9d105e3e9/
and many more.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
Patch was submitted upstream.


 ...d.go-explicit-option-for-crosscompilation.patch | 39 ++++++++++++++++++++++
 package/go/go.mk                                   |  3 +-
 2 files changed, 41 insertions(+), 1 deletion(-)
 create mode 100644 package/go/0001-build.go-explicit-option-for-crosscompilation.patch

diff --git a/package/go/0001-build.go-explicit-option-for-crosscompilation.patch b/package/go/0001-build.go-explicit-option-for-crosscompilation.patch
new file mode 100644
index 0000000..e2f680d
--- /dev/null
+++ b/package/go/0001-build.go-explicit-option-for-crosscompilation.patch
@@ -0,0 +1,39 @@
+From e1382a731a726293e30901038c6870fa77ef6095 Mon Sep 17 00:00:00 2001
+From: Angelo Compagnucci <angelo@amarulasolutions.com>
+Date: Tue, 8 May 2018 16:08:44 +0200
+Subject: [PATCH] build.go: explicit option for crosscompilation
+
+Actually if GOHOSTOS == GOOS || GOHOSTARCH == GOARCH the go build system
+assume it's not cross compiling and uses the same toolchain also for the
+bootstrap.  This is a problem in case the cross compilation mandates a
+different toolchain for bootstrap and target.  This patch adds
+GO_ASSUME_CROSSCOMPILING varible to assure that in case of cross
+compilation CC_FOR_TARGET can be different from CC.
+
+Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
+---
+ src/cmd/dist/build.go | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/cmd/dist/build.go b/src/cmd/dist/build.go
+index 99d1db5..eb4097f 100644
+--- a/src/cmd/dist/build.go
++++ b/src/cmd/dist/build.go
+@@ -252,12 +252,13 @@ func xinit() {
+ // $CC_FOR_goos_goarch, if set, applies only to goos/goarch.
+ func compilerEnv(envName, def string) map[string]string {
+ 	m := map[string]string{"": def}
++	crosscompiling := os.Getenv("GO_ASSUME_CROSSCOMPILING")
+ 
+ 	if env := os.Getenv(envName); env != "" {
+ 		m[""] = env
+ 	}
+ 	if env := os.Getenv(envName + "_FOR_TARGET"); env != "" {
+-		if gohostos != goos || gohostarch != goarch {
++		if gohostos != goos || gohostarch != goarch || crosscompiling == "1" {
+ 			m[gohostos+"/"+gohostarch] = m[""]
+ 		}
+ 		m[""] = env
+-- 
+2.7.4
+
diff --git a/package/go/go.mk b/package/go/go.mk
index 4d55e16..6af58f0 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -75,7 +75,8 @@ HOST_GO_MAKE_ENV = \
 	$(if $(GO_GOARM),GOARM=$(GO_GOARM)) \
 	GOOS=linux \
 	CC=$(HOSTCC_NOCCACHE) \
-	CXX=$(HOSTCXX_NOCCACHE)
+	CXX=$(HOSTCXX_NOCCACHE) \
+	GO_ASSUME_CROSSCOMPILING=1
 
 HOST_GO_TARGET_CC = \
 	CC_FOR_TARGET="$(TARGET_CC)" \
-- 
2.7.4
