From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 11 Nov 2013 17:47:26 +0100
Subject: [Buildroot] [PATCH 02/15] package: add objcopy and ranlib to
	HOST_CONFIGURE_OPTS
In-Reply-To: <1384188459-1332-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1384188459-1332-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1384188459-1332-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit adds the OBJCOPY and RANLIB variables to
HOST_CONFIGURE_OPTS, since grub legacy will need these defined in
order to build properly.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile            | 8 ++++++++
 package/Makefile.in | 2 ++
 2 files changed, 10 insertions(+)

diff --git a/Makefile b/Makefile
index 2f7db59..64ae8f5 100644
--- a/Makefile
+++ b/Makefile
@@ -185,6 +185,12 @@ endif
 ifndef HOSTNM
 HOSTNM:=nm
 endif
+ifndef HOSTOBJCOPY
+HOSTOBJCOPY:=objcopy
+endif
+ifndef HOSTRANLIB
+HOSTRANLIB:=ranlib
+endif
 HOSTAR:=$(shell which $(HOSTAR) || type -p $(HOSTAR) || echo ar)
 HOSTAS:=$(shell which $(HOSTAS) || type -p $(HOSTAS) || echo as)
 HOSTFC:=$(shell which $(HOSTLD) || type -p $(HOSTLD) || echo || which g77 || type -p g77 || echo gfortran)
@@ -192,6 +198,8 @@ HOSTCPP:=$(shell which $(HOSTCPP) || type -p $(HOSTCPP) || echo cpp)
 HOSTLD:=$(shell which $(HOSTLD) || type -p $(HOSTLD) || echo ld)
 HOSTLN:=$(shell which $(HOSTLN) || type -p $(HOSTLN) || echo ln)
 HOSTNM:=$(shell which $(HOSTNM) || type -p $(HOSTNM) || echo nm)
+HOSTOBJCOPY:=$(shell which $(HOSTOBJCOPY) || type -p $(HOSTOBJCOPY) || echo objcopy)
+HOSTRANLIB:=$(shell which $(HOSTRANLIB) || type -p $(HOSTRANLIB) || echo ranlib)
 
 export HOSTAR HOSTAS HOSTCC HOSTCXX HOSTFC HOSTLD
 export HOSTCC_NOCCACHE HOSTCXX_NOCCACHE
diff --git a/package/Makefile.in b/package/Makefile.in
index 612f3c7..2499086 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -256,6 +256,8 @@ HOST_CONFIGURE_OPTS=PATH=$(HOST_PATH) \
 		GCC="$(HOSTCC)" \
 		CXX="$(HOSTCXX)" \
 		CPP="$(HOSTCPP)" \
+		OBJCOPY="$(HOSTOBJCOPY)" \
+		RANLIB="$(HOSTRANLIB)" \
 		CPPFLAGS="$(HOST_CPPFLAGS)" \
 		CFLAGS="$(HOST_CFLAGS)" \
 		CXXFLAGS="$(HOST_CXXFLAGS)" \
-- 
1.8.1.2
