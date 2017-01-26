From: Adam Duskett <aduskett@gmail.com>
Date: Thu, 26 Jan 2017 16:39:30 -0500
Subject: [Buildroot] [V2 1/2] sngrep: fix dependency error.
Message-ID: <20170126213931.9987-1-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

sngrep will complain if libgcrypt isn't compiled. I am not sure
how or why I didn't notice this issue to begin with, but
I added it as a dependency and select it in the Config.in file now.
I also added 'depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS' as per
baruch's suggestion.

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
v1 -> v2:
  - Added 'depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS' to Config.in
  - Split changes into two patches.
  
 package/sngrep/Config.in | 2 ++
 package/sngrep/sngrep.mk | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/sngrep/Config.in b/package/sngrep/Config.in
index 4d0d80c..fc27413 100644
--- a/package/sngrep/Config.in
+++ b/package/sngrep/Config.in
@@ -3,9 +3,11 @@ comment "sngrep needs a toolchain w/ threads"
 
 config BR2_PACKAGE_SNGREP
 	bool "sngrep"
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_LIBPCAP
+	select BR2_PACKAGE_LIBGCRYPT
 	help
 	  sngrep is a tool for displaying SIP calls message flows from
 	  terminal.  It supports live capture to display realtime SIP
diff --git a/package/sngrep/sngrep.mk b/package/sngrep/sngrep.mk
index f504771..5b51762 100644
--- a/package/sngrep/sngrep.mk
+++ b/package/sngrep/sngrep.mk
@@ -9,7 +9,7 @@ SNGREP_SITE = $(call github,irontec,sngrep,$(SNGREP_VERSION))
 SNGREP_LICENSE = GPLv3+
 SNGREP_LICENSE_FILES = LICENSE
 SNGREP_AUTORECONF = YES
-SNGREP_DEPENDENCIES = libpcap ncurses
+SNGREP_DEPENDENCIES = libpcap ncurses libgcrypt
 
 # our ncurses wchar support is not properly detected
 SNGREP_CONF_OPTS += --disable-unicode
-- 
2.9.3
