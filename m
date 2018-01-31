From: Julius Kriukas <julius@kriukas.lt>
Date: Wed, 31 Jan 2018 23:36:29 +0200
Subject: [Buildroot] [PATCH v2] Change host locale from C to en_US.UTF-8 for
 reproducable builds
In-Reply-To: <20180128112205.15275-1-julius@kriukas.lt>
References: <20180128112205.15275-1-julius@kriukas.lt>
Message-ID: <20180131213629.4385-1-julius@kriukas.lt>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When BR2_REPRODUCIBLE is enabled building systemd fails with error:

[1/1080] Generating systemd.bg.catalog with a meson_exe.py custom command.
FAILED: catalog/systemd.bg.catalog
/buildroot/output/host/bin/python3 /buildroot/output/host/bin/meson --internal exe /buildroot/output/build/systemd-236/build/meson-private/meson_exe_sed_232a0623cc7ce2cd67ec72ed784b76307102ed76.dat
Warning: You are using 'ANSI_X3.4-1968' which is not a Unicode-compatible locale.
You might see errors if you use UTF-8 strings as filenames, as strings, or as file contents.
Please switch to a UTF-8 locale for your platform.
...
UnicodeDecodeError: 'ascii' codec can't decode byte 0xd0 in position 1079: ordinal not in range(128)
package/pkg-generic.mk:247: recipe for target '/buildroot/output/build/systemd-236/.stamp_built' failed
make: *** [/buildroot/output/build/systemd-236/.stamp_built] Error 1

Other packages using meson build system might fail as well.

This patch changes default host system locale from C to en_US.UTF-8 to
fix this issue. It also introduces BR2_NEEDS_HOST_EN_US_UTF8_LOCALE
hidden flag that checks if this locale is available on the host system.
If locale is not available error message is show and build process is
stopped.

---
Changes v1 -> v2:
  - Added BR2_NEEDS_HOST_EN_US_UTF8_LOCALE flag that is selected by
    BR2_REPRODUCIBLE.
  - Extended support/dependencies/dependencies.sh to check for
    en_US.UTF-8 locale availability if BR2_NEEDS_HOST_EN_US_UTF8_LOCALE
    is set.

Signed-off-by: Julius Kriukas <julius@kriukas.lt>
---
 Config.in                            |  6 ++++++
 Makefile                             |  4 ++--
 support/dependencies/dependencies.sh | 13 +++++++++++++
 3 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/Config.in b/Config.in
index 62d67ce957..bd14226edc 100644
--- a/Config.in
+++ b/Config.in
@@ -94,6 +94,11 @@ config BR2_HOSTARCH_NEEDS_IA32_COMPILER
 config BR2_NEEDS_HOST_UTF8_LOCALE
 	bool
 
+# Hidden boolean selected by packages that explicitly need en_US.UTF-8 locale 
+# to be available on host system.
+config BR2_NEEDS_HOST_EN_US_UTF8_LOCALE
+	bool
+
 source "arch/Config.in"
 
 menu "Build options"
@@ -715,6 +720,7 @@ config BR2_REPRODUCIBLE
 	bool "Make the build reproducible (experimental)"
 	# SOURCE_DATE_EPOCH support in toolchain-wrapper requires GCC 4.4
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_4
+	select BR2_NEEDS_HOST_EN_US_UTF8_LOCALE
 	help
 	  This option will remove all sources of non-reproducibility
 	  from the build process. For a given Buildroot configuration,
diff --git a/Makefile b/Makefile
index 7d8ab51a8c..5991c6a221 100644
--- a/Makefile
+++ b/Makefile
@@ -250,8 +250,8 @@ endif
 # timezone and locale may affect build output
 ifeq ($(BR2_REPRODUCIBLE),y)
 export TZ = UTC
-export LANG = C
-export LC_ALL = C
+export LANG = en_US.UTF-8
+export LC_ALL = en_US.UTF-8
 export GZIP = -n
 BR2_VERSION_GIT_EPOCH = $(shell GIT_DIR=$(TOPDIR)/.git $(GIT) log -1 --format=%at)
 export SOURCE_DATE_EPOCH ?= $(if $(wildcard $(TOPDIR)/.git),$(BR2_VERSION_GIT_EPOCH),$(BR2_VERSION_EPOCH))
diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index a195c62c8c..4a5b55e9da 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -207,6 +207,19 @@ if grep ^BR2_NEEDS_HOST_UTF8_LOCALE=y $BR2_CONFIG > /dev/null; then
 	fi
 fi
 
+if grep ^BR2_NEEDS_HOST_EN_US_UTF8_LOCALE=y $BR2_CONFIG > /dev/null; then
+	if ! which locale > /dev/null ; then
+		echo
+		echo "You need locale support on your build machine"
+		exit 1 ;
+	fi
+	if ! LC_ALL=en_US.UTF-8 locale -c charmap | grep '^UTF-8$' > /dev/null; then
+		echo
+		echo "You need en_US.UTF-8 locale suppport on the host system"
+		exit 1 ;
+	fi
+fi
+
 if grep -q ^BR2_NEEDS_HOST_JAVA=y $BR2_CONFIG ; then
 	check_prog_host "java"
 	JAVA_GCJ=$(java -version 2>&1 | grep gcj)
-- 
2.15.1
