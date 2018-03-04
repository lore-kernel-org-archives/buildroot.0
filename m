From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  4 Mar 2018 11:29:05 +0100
Subject: [Buildroot] [PATCH 3/4] package/systemd: needs any UTF-8 locale
In-Reply-To: <cover.1520159327.git.yann.morin.1998@free.fr>
References: <cover.1520159327.git.yann.morin.1998@free.fr>
Message-ID: <c442605e0677f8b55af90f71c23a039e3d87c92b.1520159327.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Not all distributions have the language-agnostic C.UTF-8 locale (Gentoo,
I'm frowning at you!).

Instead, use any UTF-8 locale provided by the system.

Reported-by: Christian Stewart <kidovate@gmail.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Julius Kriukas <julius@kriukas.lt>
Cc: Christian Stewart <kidovate@gmail.com>
Cc: Trent Piepho <tpiepho@impinj.com>
Cc: Adam Duskett <aduskett@gmail.com>
---
 package/systemd/Config.in  | 2 +-
 package/systemd/systemd.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 8978e3bac1..7b613df02c 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -27,7 +27,7 @@ menuconfig BR2_PACKAGE_SYSTEMD
 	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # kmod-tools
 	select BR2_PACKAGE_KMOD_TOOLS
 	select BR2_TARGET_TZ_INFO
-	select BR2_NEEDS_HOST_C_UTF8_LOCALE
+	select BR2_NEEDS_HOST_UTF8_LOCALE
 	help
 	  systemd is a system and service manager for Linux,
 	  compatible with SysV and LSB init scripts. systemd provides
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 793b966ff5..f47dfe7b1d 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -385,7 +385,7 @@ endef
 
 SYSTEMD_NINJA_OPTS = $(if $(VERBOSE),-v) -j$(PARALLEL_JOBS)
 
-SYSTEMD_ENV = $(TARGET_MAKE_ENV) LANG=C.UTF-8 LC_ALL=C.UTF-8
+SYSTEMD_ENV = $(TARGET_MAKE_ENV) $(HOST_UTF8_LOCALE_ENV)
 
 define SYSTEMD_CONFIGURE_CMDS
 	rm -rf $(@D)/build
-- 
2.14.1
