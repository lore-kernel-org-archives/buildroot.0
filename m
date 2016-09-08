From: Baruch Siach <baruch@tkos.co.il>
Date: Thu,  8 Sep 2016 15:26:17 +0300
Subject: [Buildroot] [PATCH 2/2] leveldb: fix staging and target installation
In-Reply-To: <6e8b8eed2c6651f1756e527ad6b73a6aaa5f5175.1473337577.git.baruch@tkos.co.il>
References: <6e8b8eed2c6651f1756e527ad6b73a6aaa5f5175.1473337577.git.baruch@tkos.co.il>
Message-ID: <00a6575cccce97c655f78b9f48046cc28f3a0265.1473337577.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The patch adding target/staging installation support needs variable names
update to account for upstream changes in version 1.19.

Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/leveldb/0002-Add-install-recipe.patch | 30 +++++++++++++--------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/package/leveldb/0002-Add-install-recipe.patch b/package/leveldb/0002-Add-install-recipe.patch
index 8645a6464c9c..f65916f1eb46 100644
--- a/package/leveldb/0002-Add-install-recipe.patch
+++ b/package/leveldb/0002-Add-install-recipe.patch
@@ -1,21 +1,23 @@
-From 818d59f093100d5f39db34d5686a9d983172d307 Mon Sep 17 00:00:00 2001
+From bf646b73391d3d2d0b9780a399dd24880c66b9ab Mon Sep 17 00:00:00 2001
 From: Steve James <ste@junkomatic.net>
 Date: Sun, 5 Apr 2015 16:30:46 +0200
 Subject: [PATCH 2/2] Add install recipe
 
-Upstream-Status: Submitted [https://github.com/google/leveldb/pull/276]
+Upstream-Status: Rejected [https://github.com/google/leveldb/pull/276]
 
 Signed-off-by: Steve James <ste@junkomatic.net>
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+[baruch: update for v1.19]
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 ---
- Makefile | 16 ++++++++++++++++
- 1 file changed, 16 insertions(+)
+ Makefile | 14 ++++++++++++++
+ 1 file changed, 14 insertions(+)
 
 diff --git a/Makefile b/Makefile
-index 2bd2cad..530f2c3 100644
+index 07a5a1ead6fd..c87023db527a 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -412,3 +412,19 @@ else
+@@ -412,3 +412,17 @@ $(SHARED_OUTDIR)/%.o: %.cc
  
  $(SHARED_OUTDIR)/%.o: %.c
  	$(CC) $(CFLAGS) $(PLATFORM_SHARED_CFLAGS) -c $< -o $@
@@ -23,18 +25,16 @@ index 2bd2cad..530f2c3 100644
 +INSTALL_ROOT = /
 +INSTALL_PREFIX= usr/local
 +
-+install: $(SHARED) $(LIBRARY)
++install: all
 +	install -d -m 0755 $(INSTALL_ROOT)$(INSTALL_PREFIX)/include/leveldb
 +	install -D -m 0644 include/leveldb/*.h $(INSTALL_ROOT)$(INSTALL_PREFIX)/include/leveldb
 +	install -d -m 0755 $(INSTALL_ROOT)$(INSTALL_PREFIX)/lib
-+  ifneq (,$(LIBRARY))
-+	install -m 0644 $(LIBRARY) $(INSTALL_ROOT)$(INSTALL_PREFIX)/lib
-+  endif
-+  ifneq (,$(SHARED))
-+	install -m 0755 $(SHARED3) $(INSTALL_ROOT)$(INSTALL_PREFIX)/lib
-+	ln -sf $(SHARED3) $(INSTALL_ROOT)$(INSTALL_PREFIX)/lib/$(SHARED1)
-+	ln -sf $(SHARED3) $(INSTALL_ROOT)$(INSTALL_PREFIX)/lib/$(SHARED2)
-+  endif
++	install -m 0644 $(STATIC_OUTDIR)/libleveldb.a $(INSTALL_ROOT)$(INSTALL_PREFIX)/lib
++ifneq (,$(SHARED_LIBS))
++	install -m 0755 $(SHARED_OUTDIR)/$(SHARED_LIB3) $(INSTALL_ROOT)$(INSTALL_PREFIX)/lib
++	ln -sf $(SHARED_LIB3) $(INSTALL_ROOT)$(INSTALL_PREFIX)/lib/$(SHARED_LIB1)
++	ln -sf $(SHARED_LIB3) $(INSTALL_ROOT)$(INSTALL_PREFIX)/lib/$(SHARED_LIB2)
++endif
 -- 
 2.1.0
 
-- 
2.9.3
