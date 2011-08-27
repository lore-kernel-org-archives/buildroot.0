From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Sat, 27 Aug 2011 23:07:42 +0200
Subject: [Buildroot] [PATCH 1/2] toolchain/crosstool-NG: fix bundled config
	files
In-Reply-To: <1314479263-8979-1-git-send-email-yann.morin.1998@anciens.enib.fr>
References: <1314479263-8979-1-git-send-email-yann.morin.1998@anciens.enib.fr>
Message-ID: <1314479263-8979-2-git-send-email-yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bundled config files have architecture-specific values in them,
which may break if buildroot is configured with another architecture
that does not forcibly set these option.

For example, the bundled config files are for x86_64, and define:
    CT_ARCH_TUNE="generic"

This comes from the BR2_GCC_TARGET_TUNE config option (in buildroot) that
is set accordingly to the selected (arch,sub-arch).

But if someone configures buildroot for, say, generic ARM, then the
BR2_GCC_TARGET_TUNE config option is not set, and the crosstool-NG backend
Makefile believes it should not be pushed down to the crosstool-NG config
file.

BUT...

The crosstool-NG backend Makefile can not forcibly push BR2_GCC_TARGET_TUNE
down to the CT-NG config file. If BR2_GCC_TARGET_TUNE is empty, the user can
still set CT_ARCH_TUNE by running ctng-menuconfig.

The backend Makefile already passes such values only if they are set.


In the end, we can't push options as-is to the crosstool-NG config, but we
MUST provide sane bundled config files, which this patch does.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
---
 .../crosstool-ng.config-eglibc                     |    2 +-
 .../crosstool-ng.config-glibc                      |    4 ++--
 .../crosstool-ng.config-uClibc                     |    2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.config-eglibc b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-eglibc
index 3b6a2e2..66744bc 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.config-eglibc
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-eglibc
@@ -97,7 +97,7 @@ CT_ARCH_SUPPORT_TUNE=y
 CT_ARCH_DEFAULT_32=y
 CT_ARCH_ARCH=""
 CT_ARCH_CPU=""
-CT_ARCH_TUNE="generic"
+CT_ARCH_TUNE=""
 # CT_ARCH_32 is not set
 CT_ARCH_64=y
 CT_ARCH_BITNESS=64
diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.config-glibc b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-glibc
index cadbb0b..9513432 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.config-glibc
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-glibc
@@ -97,7 +97,7 @@ CT_ARCH_SUPPORT_TUNE=y
 CT_ARCH_DEFAULT_32=y
 CT_ARCH_ARCH=""
 CT_ARCH_CPU=""
-CT_ARCH_TUNE="generic"
+CT_ARCH_TUNE=""
 # CT_ARCH_32 is not set
 CT_ARCH_64=y
 CT_ARCH_BITNESS=64
@@ -137,7 +137,7 @@ CT_TOOLCHAIN_BUGURL=""
 #
 CT_TARGET_VENDOR="unknown"
 CT_TARGET_ALIAS_SED_EXPR=""
-CT_TARGET_ALIAS="x86_64-linux"
+CT_TARGET_ALIAS=""
 
 #
 # Toolchain type
diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.config-uClibc b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-uClibc
index 7d90e40..5296923 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.config-uClibc
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-uClibc
@@ -97,7 +97,7 @@ CT_ARCH_SUPPORT_TUNE=y
 CT_ARCH_DEFAULT_32=y
 CT_ARCH_ARCH=""
 CT_ARCH_CPU=""
-CT_ARCH_TUNE="generic"
+CT_ARCH_TUNE=""
 # CT_ARCH_32 is not set
 CT_ARCH_64=y
 CT_ARCH_BITNESS=64
-- 
1.7.2.5
