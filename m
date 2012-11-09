From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri,  9 Nov 2012 20:34:06 +0100
Subject: [Buildroot] [PATCH 4/4] cpanminus: requires host-qemu
In-Reply-To: <1352489646-30635-1-git-send-email-arnout@mind.be>
References: <1352489646-30635-1-git-send-email-arnout@mind.be>
Message-ID: <1352489646-30635-4-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Must also disable all non-supported architectures, including x86
(which doesn't have a working fork()).

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
It still only works half the time.  For instance, in one arm configuration
I have qemu sitting there consuming 100% CPU without any output, system
calls, or nothing...
---
 package/cpanminus/Config.in    |   11 +++++++++++
 package/cpanminus/cpanminus.mk |    2 +-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/package/cpanminus/Config.in b/package/cpanminus/Config.in
index b8b39dc..cf93a7e 100644
--- a/package/cpanminus/Config.in
+++ b/package/cpanminus/Config.in
@@ -1,5 +1,16 @@
 config BR2_PACKAGE_CPANMINUS
 	bool "cpanminus"
+	# host-qemu doesn't work for the following platforms
+	depends on !BR2_avr32
+	depends on !BR2_bfin
+	depends on !BR2_sh2
+	depends on !BR2_sh2a
+	depends on !BR2_sh3
+	depends on !BR2_sh3eb
+	depends on !BR2_sh64
+	# host-qemu doesn't support system() on the following platforms
+	depends on !BR2_i386
+	depends on !BR2_x86_64
 	help
 	  cpanminus is a script to get, unpack, build and install Perl modules
 	  from CPAN.
diff --git a/package/cpanminus/cpanminus.mk b/package/cpanminus/cpanminus.mk
index d3a338b..af35e93 100644
--- a/package/cpanminus/cpanminus.mk
+++ b/package/cpanminus/cpanminus.mk
@@ -7,7 +7,7 @@
 CPANMINUS_VERSION = 1.5018
 CPANMINUS_SOURCE = miyagawa-cpanminus-$(CPANMINUS_VERSION)-0-gee6cd30.tar.gz
 CPANMINUS_SITE = https://github.com/miyagawa/cpanminus/tarball/$(CPANMINUS_VERSION)
-CPANMINUS_DEPENDENCIES = perl $(call qstrip,$(BR2_PACKAGE_CPANMINUS_NATIVE_DEPENDENCIES))
+CPANMINUS_DEPENDENCIES = host-qemu perl $(call qstrip,$(BR2_PACKAGE_CPANMINUS_NATIVE_DEPENDENCIES))
 
 CPANMINUS_RUN_PERL = $(QEMU_USER) $(STAGING_DIR)/usr/bin/perl
 CPANMINUS_ARCHNAME = $(shell $(CPANMINUS_RUN_PERL) -MConfig -e "print Config->{archname}")
-- 
1.7.10.4
