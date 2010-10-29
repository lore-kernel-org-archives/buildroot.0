From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 29 Oct 2010 21:00:26 +0200
Subject: [Buildroot] [git commit master 1/1] Optimize (-O2) host binaries by
	default
Message-ID: <20101029190607.D0E6D8D56B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=3be496834375256f15cb98812d92f9b3d6fcb3a7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Default HOST_CFLAGS to -O2, so host tools (like the cross compiler) are
built with optimization by default.

Based on a patch by Will Newton <will.newton@gmail.com>.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile                   |    9 ---------
 package/Makefile.in        |    1 +
 toolchain/sstrip/sstrip.mk |    2 +-
 3 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/Makefile b/Makefile
index 22c3801..efc42ff 100644
--- a/Makefile
+++ b/Makefile
@@ -148,15 +148,6 @@ HOSTLD:=$(shell which $(HOSTLD) || type -p $(HOSTLD) || echo ld)
 HOSTLN:=$(shell which $(HOSTLN) || type -p $(HOSTLN) || echo ln)
 HOSTNM:=$(shell which $(HOSTNM) || type -p $(HOSTNM) || echo nm)
 
-ifndef CFLAGS_FOR_BUILD
-CFLAGS_FOR_BUILD:=-g -O2
-endif
-ifndef CXXFLAGS_FOR_BUILD
-CXXFLAGS_FOR_BUILD:=-g -O2
-endif
-ifndef FCFLAGS_FOR_BUILD
-FCFLAGS_FOR_BUILD:=-g -O2
-endif
 export HOSTAR HOSTAS HOSTCC HOSTCXX HOSTFC HOSTLD
 
 # bash prints the name of the directory on 'cd <dir>' if CDPATH is
diff --git a/package/Makefile.in b/package/Makefile.in
index fb09083..971a7ed 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -169,6 +169,7 @@ FLEX:=$(shell which flex || type -p flex)
 BISON:=$(shell which bison || type -p bison)
 SED:=$(shell which sed || type -p sed) -i -e
 
+HOST_CFLAGS   ?= -O2
 HOST_CFLAGS   += -I$(HOST_DIR)/include -I$(HOST_DIR)/usr/include
 HOST_CXXFLAGS += -I$(HOST_DIR)/include -I$(HOST_DIR)/usr/include
 HOST_LDFLAGS  += -L$(HOST_DIR)/lib -L$(HOST_DIR)/usr/lib -Wl,-rpath,$(HOST_DIR)/usr/lib
diff --git a/toolchain/sstrip/sstrip.mk b/toolchain/sstrip/sstrip.mk
index 48abbaa..f387e2d 100644
--- a/toolchain/sstrip/sstrip.mk
+++ b/toolchain/sstrip/sstrip.mk
@@ -16,7 +16,7 @@ SSTRIP_HOST:=$(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-sstrip
 
 $(SSTRIP_HOST): $(SSTRIP_SOURCE_FILE)
 	mkdir -p $(@D) $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/bin
-	$(HOSTCC) $(CFLAGS_FOR_BUILD) $(SSTRIP_SOURCE_FILE) -o $(SSTRIP_HOST)
+	$(HOSTCC) $(HOST_CFLAGS) $(SSTRIP_SOURCE_FILE) -o $(SSTRIP_HOST)
 	ln -snf ../../bin/$(REAL_GNU_TARGET_NAME)-sstrip \
 		$(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/bin/sstrip
 	ln -snf $(REAL_GNU_TARGET_NAME)-sstrip \
-- 
1.7.1
