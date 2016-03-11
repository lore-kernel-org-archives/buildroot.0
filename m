From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 11 Mar 2016 19:19:56 +0100
Subject: [Buildroot] [PATCH 3/6] linux/perf: forcefully disable the features
	with missing dependencies
In-Reply-To: <cover.1457720152.git.yann.morin.1998@free.fr>
References: <cover.1457720152.git.yann.morin.1998@free.fr>
Message-ID: <ee3ec5d2b7e690082b875a552b3be2b14ed8d72b.1457720152.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Forcefully disable the features that have optional dependencies that are
not enabled in Buildroot.

Disable support for bionic since, well, we're not Android.

Slightly re-order the variables to have semantically-related variables
together, with features last.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
---
 linux/linux-tool-perf.mk | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/linux/linux-tool-perf.mk b/linux/linux-tool-perf.mk
index a5fbf21..d4b8f0e 100644
--- a/linux/linux-tool-perf.mk
+++ b/linux/linux-tool-perf.mk
@@ -18,14 +18,15 @@ PERF_MAKE_FLAGS = \
 	$(LINUX_MAKE_FLAGS) \
 	JOBS=$(PARALLEL_JOBS) \
 	ARCH=$(PERF_ARCH) \
+	DESTDIR=$(TARGET_DIR) \
+	prefix=/usr \
+	WERROR=0 \
 	NO_LIBAUDIT=1 \
 	NO_NEWT=1 \
 	NO_GTK2=1 \
 	NO_LIBPERL=1 \
 	NO_LIBPYTHON=1 \
-	DESTDIR=$(TARGET_DIR) \
-	prefix=/usr \
-	WERROR=0
+	NO_LIBBIONIC=1
 
 # We need to pass an argument to ld for setting the endianness when
 # building it for MIPS architecture, otherwise the default one will
@@ -52,14 +53,20 @@ endif
 
 ifeq ($(BR2_PACKAGE_SLANG),y)
 PERF_DEPENDENCIES += slang
+else
+PERF_MAKE_FLAGS += NO_SLANG=1
 endif
 
 ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
 PERF_DEPENDENCIES += libunwind
+else
+PERF_MAKE_FLAGS += NO_LIBUNWIND=1
 endif
 
 ifeq ($(BR2_PACKAGE_NUMACTL),y)
 PERF_DEPENDENCIES += numactl
+else
+PERF_MAKE_FLAGS += NO_LIBNUMA=1
 endif
 
 ifeq ($(BR2_PACKAGE_ELFUTILS),y)
-- 
1.9.1
