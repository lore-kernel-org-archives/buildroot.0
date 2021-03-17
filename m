From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 18 Mar 2021 07:28:49 +0900
Subject: [Buildroot] [PATCH 4/4] Rename custom kernel config fragment files
 to *.config
In-Reply-To: <20210317222849.1658538-1-masahiroy@kernel.org>
References: <20210317222849.1658538-1-masahiroy@kernel.org>
Message-ID: <20210317222849.1658538-4-masahiroy@kernel.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There is no consistency in file names for
BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES. Some are suffiex with ".config",
and some with ".config.fragment".

Rename *.config.fragment to *.config because this is the convention in the
upstream Linux kernel.

I used the following shell script for the conversion:

for f in $(find configs -name '*_defconfig')
do
	old_name=$(sed -n 's/BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="\(.*\.config.fragment\)"/\1/p' $f)
	if [ -n "$old_name" ]; then
		new_name=${old_name%.fragment}
		if [ -e "$old_name" ]; then
			git mv $old_name $new_name
		fi
		sed -i 's:="'$old_name'":="'$new_name'":' $f
	fi
done

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 .../csky/{linux-ck610.config.fragment => linux-ck610.config}    | 0
 .../csky/{linux-ck807.config.fragment => linux-ck807.config}    | 0
 .../csky/{linux-ck810.config.fragment => linux-ck810.config}    | 0
 .../csky/{linux-ck860.config.fragment => linux-ck860.config}    | 0
 .../hifive-unleashed/{linux.config.fragment => linux.config}    | 0
 configs/csky_gx6605s_defconfig                                  | 2 +-
 configs/hifive_unleashed_defconfig                              | 2 +-
 configs/qemu_csky610_virt_defconfig                             | 2 +-
 configs/qemu_csky807_virt_defconfig                             | 2 +-
 configs/qemu_csky810_virt_defconfig                             | 2 +-
 configs/qemu_csky860_virt_defconfig                             | 2 +-
 11 files changed, 6 insertions(+), 6 deletions(-)
 rename board/qemu/csky/{linux-ck610.config.fragment => linux-ck610.config} (100%)
 rename board/qemu/csky/{linux-ck807.config.fragment => linux-ck807.config} (100%)
 rename board/qemu/csky/{linux-ck810.config.fragment => linux-ck810.config} (100%)
 rename board/qemu/csky/{linux-ck860.config.fragment => linux-ck860.config} (100%)
 rename board/sifive/hifive-unleashed/{linux.config.fragment => linux.config} (100%)

diff --git a/board/qemu/csky/linux-ck610.config.fragment b/board/qemu/csky/linux-ck610.config
similarity index 100%
rename from board/qemu/csky/linux-ck610.config.fragment
rename to board/qemu/csky/linux-ck610.config
diff --git a/board/qemu/csky/linux-ck807.config.fragment b/board/qemu/csky/linux-ck807.config
similarity index 100%
rename from board/qemu/csky/linux-ck807.config.fragment
rename to board/qemu/csky/linux-ck807.config
diff --git a/board/qemu/csky/linux-ck810.config.fragment b/board/qemu/csky/linux-ck810.config
similarity index 100%
rename from board/qemu/csky/linux-ck810.config.fragment
rename to board/qemu/csky/linux-ck810.config
diff --git a/board/qemu/csky/linux-ck860.config.fragment b/board/qemu/csky/linux-ck860.config
similarity index 100%
rename from board/qemu/csky/linux-ck860.config.fragment
rename to board/qemu/csky/linux-ck860.config
diff --git a/board/sifive/hifive-unleashed/linux.config.fragment b/board/sifive/hifive-unleashed/linux.config
similarity index 100%
rename from board/sifive/hifive-unleashed/linux.config.fragment
rename to board/sifive/hifive-unleashed/linux.config
diff --git a/configs/csky_gx6605s_defconfig b/configs/csky_gx6605s_defconfig
index f1f9579dca..1f467f8934 100644
--- a/configs/csky_gx6605s_defconfig
+++ b/configs/csky_gx6605s_defconfig
@@ -14,6 +14,6 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.0.12"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
-BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/csky/linux-ck610.config.fragment"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/csky/linux-ck610.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/csky/gx6605s/gx6605s.dts"
diff --git a/configs/hifive_unleashed_defconfig b/configs/hifive_unleashed_defconfig
index 0b87f2588f..430746c4d3 100644
--- a/configs/hifive_unleashed_defconfig
+++ b/configs/hifive_unleashed_defconfig
@@ -29,7 +29,7 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
-BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/sifive/hifive-unleashed/linux.config.fragment"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/sifive/hifive-unleashed/linux.config"
 BR2_LINUX_KERNEL_IMAGE=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="sifive/hifive-unleashed-a00"
diff --git a/configs/qemu_csky610_virt_defconfig b/configs/qemu_csky610_virt_defconfig
index e7d75f5f49..e6df36a638 100644
--- a/configs/qemu_csky610_virt_defconfig
+++ b/configs/qemu_csky610_virt_defconfig
@@ -17,4 +17,4 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.0.12"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
-BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/csky/linux-ck610.config.fragment"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/csky/linux-ck610.config"
diff --git a/configs/qemu_csky807_virt_defconfig b/configs/qemu_csky807_virt_defconfig
index df12450a55..fb00fe5c5f 100644
--- a/configs/qemu_csky807_virt_defconfig
+++ b/configs/qemu_csky807_virt_defconfig
@@ -17,4 +17,4 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.0.12"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
-BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/csky/linux-ck807.config.fragment"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/csky/linux-ck807.config"
diff --git a/configs/qemu_csky810_virt_defconfig b/configs/qemu_csky810_virt_defconfig
index dd1fd329f5..e5d3a6d230 100644
--- a/configs/qemu_csky810_virt_defconfig
+++ b/configs/qemu_csky810_virt_defconfig
@@ -17,4 +17,4 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.0.12"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
-BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/csky/linux-ck810.config.fragment"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/csky/linux-ck810.config"
diff --git a/configs/qemu_csky860_virt_defconfig b/configs/qemu_csky860_virt_defconfig
index 6edfba4e8e..4324cc2166 100644
--- a/configs/qemu_csky860_virt_defconfig
+++ b/configs/qemu_csky860_virt_defconfig
@@ -17,4 +17,4 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.0.12"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
-BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/csky/linux-ck860.config.fragment"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/csky/linux-ck860.config"
-- 
2.27.0
