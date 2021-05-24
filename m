From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 24 May 2021 14:17:28 +0200
Subject: [Buildroot] [git commit branch/next] package/pifmrds: use pkg-config
Message-ID: <20210524115418.A121780424@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1c833604aef36d381353c9b5541e22e9eaa277aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Use pkg-config to retrieve libsndfile dependencies

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 888546e5273d77d49bec564a515e85d7acee6bdd)
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pifmrds/0003-Makefile-fix-static-link.patch | 6 ++++--
 package/pifmrds/pifmrds.mk                          | 3 ++-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/pifmrds/0003-Makefile-fix-static-link.patch b/package/pifmrds/0003-Makefile-fix-static-link.patch
index ecd7c4fc4c..3bd91c981f 100644
--- a/package/pifmrds/0003-Makefile-fix-static-link.patch
+++ b/package/pifmrds/0003-Makefile-fix-static-link.patch
@@ -4,6 +4,8 @@ Since libsndfile uses funtions from libm, the -lm should be specified
 after libsndfile for static linking.
 
 Signed-off-by: "Eric Limpens" <Limpens@gmail.com>
+[Fabrice: add $(SNDFILE_LIBS) to pass all dependencies from pkg-config]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 
 diff -purN pifmrds-0bf57f9ce0d954365a38d8af8e7be6f28521c3f2.orig/src/Makefile pifmrds-0bf57f9ce0d954365a38d8af8e7be6f28521c3f2/src/Makefile
 --- pifmrds-0bf57f9ce0d954365a38d8af8e7be6f28521c3f2.orig/src/Makefile	2016-02-26 08:06:43.102962592 +0100
@@ -13,11 +15,11 @@ diff -purN pifmrds-0bf57f9ce0d954365a38d8af8e7be6f28521c3f2.orig/src/Makefile pi
  
  app: rds.o waveforms.o pi_fm_rds.o fm_mpx.o control_pipe.o
 -	$(CC) $(LDFLAGS) -o pi_fm_rds rds.o waveforms.o pi_fm_rds.o fm_mpx.o control_pipe.o -lm -lsndfile
-+	$(CC) $(LDFLAGS) -o pi_fm_rds rds.o waveforms.o pi_fm_rds.o fm_mpx.o control_pipe.o -lsndfile -lm
++	$(CC) $(LDFLAGS) -o pi_fm_rds rds.o waveforms.o pi_fm_rds.o fm_mpx.o control_pipe.o $(SNDFILE_LIBS)
  
  rds_wav: rds.o waveforms.o rds_wav.o fm_mpx.o
 -	$(CC) $(LDFLAGS) -o rds_wav rds_wav.o rds.o waveforms.o fm_mpx.o -lm -lsndfile
-+	$(CC) $(LDFLAGS) -o rds_wav rds_wav.o rds.o waveforms.o fm_mpx.o -lsndfile -lm
++	$(CC) $(LDFLAGS) -o rds_wav rds_wav.o rds.o waveforms.o fm_mpx.o $(SNDFILE_LIBS)
  
  rds.o: rds.c waveforms.h
  	$(CC) $(CFLAGS) rds.c
diff --git a/package/pifmrds/pifmrds.mk b/package/pifmrds/pifmrds.mk
index 509ec80876..33c13bae33 100644
--- a/package/pifmrds/pifmrds.mk
+++ b/package/pifmrds/pifmrds.mk
@@ -6,13 +6,14 @@
 
 PIFMRDS_VERSION = 0bf57f9ce0d954365a38d8af8e7be6f28521c3f2
 PIFMRDS_SITE = $(call github,ChristopheJacquet,PiFmRds,$(PIFMRDS_VERSION))
-PIFMRDS_DEPENDENCIES = libsndfile
+PIFMRDS_DEPENDENCIES = host-pkgconf libsndfile
 PIFMRDS_LICENSE = GPL-3.0+
 PIFMRDS_LICENSE_FILES = LICENSE
 
 define PIFMRDS_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src CC="$(TARGET_CC)" LDFLAGS="$(TARGET_LDFLAGS)" \
 		CFLAGS="$(TARGET_CFLAGS) -std=gnu99 -ffast-math -c" \
+		SNDFILE_LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs sndfile`" \
 		app rds_wav
 endef
 
