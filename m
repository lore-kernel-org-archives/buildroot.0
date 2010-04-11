From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Apr 2010 06:05:20 +0200
Subject: [Buildroot] [PATCH 24/25] Get rid of useless OpenMP related code
In-Reply-To: <cover.1270958653.git.thomas.petazzoni@free-electrons.com>
References: <cover.1270958653.git.thomas.petazzoni@free-electrons.com>
Message-ID: <a954995a648481846e7858eabf338ce9a5e93855.1270958653.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It seems that there was an intention to add BR2_ENABLE_OPENMP someday,
but it was in June 2007 (commit
c81807a9d71fba9f35eeb7e3f3b56bda4b2e0edd) and since then, nothing
occured. Therefore, get rid of this code, and just pass
--disable-openmp to gettext to keep the current behaviour.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gettext/gettext.mk |    2 +-
 toolchain/Makefile.in      |    7 -------
 2 files changed, 1 insertions(+), 8 deletions(-)

diff --git a/package/gettext/gettext.mk b/package/gettext/gettext.mk
index 5b04560..8ec8bdf 100644
--- a/package/gettext/gettext.mk
+++ b/package/gettext/gettext.mk
@@ -93,7 +93,7 @@ $(GETTEXT_DIR)/.configured: $(GETTEXT_DIR)/.unpacked
 		--disable-libasprintf \
 		--enable-shared \
 		$(IGNORE_EXTERNAL_GETTEXT) \
-		$(OPENMP) \
+		--disable-openmp \
 	)
 	touch $@
 
diff --git a/toolchain/Makefile.in b/toolchain/Makefile.in
index 16451ee..91aa17a 100644
--- a/toolchain/Makefile.in
+++ b/toolchain/Makefile.in
@@ -10,13 +10,6 @@ else
 MULTILIB:=--disable-multilib
 endif
 
-ifeq ($(BR2_ENABLE_OPENMP),y)
-OPENMP:=--enable-openmp
-else
-OPENMP:=--disable-openmp
-endif
-
-
 ifeq ($(BR2_TOOLCHAIN_SYSROOT),y)
 BR2_SYSROOT_PREFIX=# nothing, straight into /usr
 BR2_SYSROOT_STAGING_DESTDIR=DESTDIR=$(STAGING_DIR)/
-- 
1.6.3.3
