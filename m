From: Adam Duskett <aduskett@gmail.com>
Date: Thu, 23 Jun 2016 22:43:19 -0400
Subject: [Buildroot] [PATCH 4/6] libsepol: bump to version 2.5
In-Reply-To: <1466736201-17310-1-git-send-email-Aduskett@gmail.com>
References: <1466736201-17310-1-git-send-email-Aduskett@gmail.com>
Message-ID: <1466736201-17310-4-git-send-email-Aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/libsepol/0001-support-static-only.patch    | 17 +++++++++--------
 .../libsepol/0002-workaround-blackfin-issue.patch  | 22 ++++++----------------
 package/libsepol/libsepol.hash                     |  2 +-
 package/libsepol/libsepol.mk                       |  4 ++--
 4 files changed, 18 insertions(+), 27 deletions(-)

diff --git a/package/libsepol/0001-support-static-only.patch b/package/libsepol/0001-support-static-only.patch
index b974680..6d30454 100644
--- a/package/libsepol/0001-support-static-only.patch
+++ b/package/libsepol/0001-support-static-only.patch
@@ -6,15 +6,16 @@ when defined to some non-empty value, will disable the build of shared
 libraries. It allows to support cases where the target architecture
 does not have support for shared libraries.
 
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
 Index: b/src/Makefile
 ===================================================================
+
+diff --git a/src/Makefile b/src/Makefile
+index db6c2ba..0006285 100644
 --- a/src/Makefile
 +++ b/src/Makefile
-@@ -17,7 +17,12 @@
- CFLAGS ?= -Werror -Wall -W -Wundef -Wshadow -Wmissing-noreturn -Wmissing-format-attribute
- override CFLAGS += -I. -I../include -D_GNU_SOURCE
+@@ -31,7 +31,12 @@ override CFLAGS += -I$(CILDIR)/include
+ endif
+
  
 -all: $(LIBA) $(LIBSO) $(LIBPC)
 +ALL_TARGETS = $(LIBA) $(LIBPC)
@@ -24,9 +25,9 @@ Index: b/src/Makefile
 +
 +all: $(ALL_TARGETS)
  
+
  $(LIBA):  $(OBJS)
- 	$(AR) rcs $@ $^
-@@ -39,11 +44,13 @@
+@@ -66,11 +71,13 @@ endif
  install: all
  	test -d $(LIBDIR) || install -m 755 -d $(LIBDIR)
  	install -m 644 $(LIBA) $(LIBDIR)
@@ -37,7 +38,7 @@ Index: b/src/Makefile
 +ifeq ($(STATIC),)
 +	test -d $(SHLIBDIR) || install -m 755 -d $(SHLIBDIR)
 +	install -m 755 $(LIBSO) $(SHLIBDIR)
- 	cd $(LIBDIR) && ln -sf ../../`basename $(SHLIBDIR)`/$(LIBSO) $(TARGET)
+ 	ln -sf --relative $(SHLIBDIR)/$(LIBSO) $(LIBDIR)/$(TARGET)
 +endif
  
  relabel:
diff --git a/package/libsepol/0002-workaround-blackfin-issue.patch b/package/libsepol/0002-workaround-blackfin-issue.patch
index 5d00c69..237c06a 100644
--- a/package/libsepol/0002-workaround-blackfin-issue.patch
+++ b/package/libsepol/0002-workaround-blackfin-issue.patch
@@ -1,24 +1,14 @@
-Do not make symbols hidden on Blackfin
-
-The libselinux logic to hide internal symbols from the DSO doesn't
-work properly on Blackfin due to the USER_LABEL_PREFIX not being
-handled properly. A real fix is not that simple, so this patch simply
-disables the internal symbol hiding mechanism. This means that those
-symbols are visible in the final DSO, which is not a problem for
-proper execution, it just isn't as clean.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/src/dso.h
-===================================================================
+diff --git a/src/dso.h b/src/dso.h
+index a06e349..e04758d 100644
 --- a/src/dso.h
 +++ b/src/dso.h
-@@ -1,7 +1,7 @@
- #ifndef _SELINUX_DSO_H
- #define _SELINUX_DSO_H	1
+@@ -5,7 +5,7 @@
+     #define DISABLE_SYMVER 1
+ #endif
  
 -#ifdef SHARED
 +#if defined(SHARED) && !defined(__bfin__)
  # define hidden __attribute__ ((visibility ("hidden")))
  # define hidden_proto(fct) __hidden_proto (fct, fct##_internal)
  # define __hidden_proto(fct, internal)	\
+
diff --git a/package/libsepol/libsepol.hash b/package/libsepol/libsepol.hash
index df5dabd..266ce43 100644
--- a/package/libsepol/libsepol.hash
+++ b/package/libsepol/libsepol.hash
@@ -1,2 +1,2 @@
 # From https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256	290d17f583635a4a5d8a2141511272adf0571c4205cdea38b5a68df20d58a70b  libsepol-2.1.9.tar.gz
+sha256 2bdeec56d0a08b082b93b40703b4b3329cc5562152f7254d8f6ef6b56afe850a  libsepol-2.5.tar.gz
diff --git a/package/libsepol/libsepol.mk b/package/libsepol/libsepol.mk
index 1e709c6..93896cf 100644
--- a/package/libsepol/libsepol.mk
+++ b/package/libsepol/libsepol.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBSEPOL_VERSION = 2.1.9
-LIBSEPOL_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20130423
+LIBSEPOL_VERSION = 2.5
+LIBSEPOL_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20160223
 LIBSEPOL_LICENSE = LGPLv2.1+
 LIBSEPOL_LICENSE_FILES = COPYING
 
-- 
2.7.4
