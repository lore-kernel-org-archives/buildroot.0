From: Kees van Unen <keesvanunen@hotmail.com>
Date: Fri, 15 Dec 2017 23:27:57 +0000
Subject: [Buildroot] FW: [PATCH 1/1] gcc: Support configure option
 --with-linker-hash-style
In-Reply-To: <20171215232530.9388-1-stefan.froberg@petroprogram.com>
References: <20171215232530.9388-1-stefan.froberg@petroprogram.com>
Message-ID: <8789d1d65c4a4931939f1b23e5727063@AM5PR0801MB1394.eurprd08.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net




________________________________________
Van: buildrootNamensStefan Fr?berg
Verzonden: zaterdag 16 december 2017 00:25:30 (UTC+01:00) Amsterdam, Berlijn, Bern, Rome, Stockholm, Wenen
Aan: buildroot at buildroot.org
CC: thomas.petazzoni at free-electrons.com; Stefan Fr?berg
Onderwerp: [Buildroot] [PATCH 1/1] gcc: Support configure option --with-linker-hash-style

This will set the default hash style that GCC will
always use during linking.

Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
---
 package/gcc/Config.in.host | 27 +++++++++++++++++++++++++++
 package/gcc/gcc.mk         | 12 ++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 70cce0a5c5..b9391392e1 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -152,3 +152,30 @@ config BR2_GCC_ENABLE_GRAPHITE

 comment "graphite support needs gcc >= 5.x"
        depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_5
+
+choice
+       prompt "Hash style used during linking"
+       default BR2_GCC_HASH_STYLE_GNU
+       help
+         This tells GCC to pass --hash-style=choice option to the
+         linker for all final links where choice can be one of
+         "gnu", "sysv" or "both".
+         Using "gnu" should give best application startup time.
+
+config BR2_GCC_HASH_STYLE_GNU
+       bool "gnu"
+       help
+         For new style GNU ".gnu.hash" section.
+
+config BR2_GCC_HASH_STYLE_SYSV
+       bool "sysv"
+       help
+         For classic ELF ".hash" section.
+
+config BR2_GCC_HASH_STYLE_BOTH
+       bool "both"
+       help
+         For both the classic ELF ".hash" and
+         new style GNU ".gnu.hash".
+
+endchoice
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 27fc1e987c..51bb22d0e9 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -183,6 +183,18 @@ else
 HOST_GCC_COMMON_CONF_OPTS += --without-isl --without-cloog
 endif

+ifeq ((BR2_GCC_HASH_STYLE_GNU),y)
+HOST_GCC_COMMON_CONF_OPTS += --with-linker-hash-style=gnu
+endif
+
+ifeq ((BR2_GCC_HASH_STYLE_SYSV),y)
+HOST_GCC_COMMON_CONF_OPTS += --with-linker-hash-style=sysv
+endif
+
+ifeq ((BR2_GCC_HASH_STYLE_BOTH),y)
+HOST_GCC_COMMON_CONF_OPTS += --with-linker-hash-style=both
+endif
+
 ifeq ($(BR2_arc)$(BR2_or1k),y)
 HOST_GCC_COMMON_DEPENDENCIES += host-flex host-bison
 endif
--
2.13.6

_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
