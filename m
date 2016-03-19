From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Mar 2016 14:38:06 +0100
Subject: [Buildroot] [git commit] linux/perf: forcefully disable the
	features with missing dependencies
Message-ID: <20160319134759.E9D6E7FAF0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2b1d5df1f2a352eac48cd054dc4b4c1344467b81
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Forcefully disable the features that have optional dependencies that are
not enabled in Buildroot.

Disable support for bionic since, well, we're not Android.

Slightly re-order the variables to have semantically-related variables
together, with features last.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
