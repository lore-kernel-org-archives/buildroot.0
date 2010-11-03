From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Thu, 4 Nov 2010 00:03:52 +0100
Subject: [Buildroot] [git commit master 1/1] Makefile: move version string
	from Config.in into Makefile
Message-ID: <20101103230449.9AA5F80E6A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e5e8fae892036360f399ed034463716f31bfd59f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This re-instates writing the version string in .config headers, and no
longer provides it as a kconfig symbol in .config (it is now a variable
in the Makefile, and in the environment).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Config.in                                          |    2 +-
 Makefile                                           |    8 +++++---
 package/config/confdata.c                          |    4 ++++
 .../patches/01-kconfig-kernel-to-buildroot.patch   |   12 ++++++------
 4 files changed, 16 insertions(+), 10 deletions(-)

diff --git a/Config.in b/Config.in
index 0f8ddf4..8107296 100644
--- a/Config.in
+++ b/Config.in
@@ -8,7 +8,7 @@ config BR2_HAVE_DOT_CONFIG
 
 config BR2_VERSION
 	string
-	default "2010.11-git"
+	option env="BR2_VERSION"
 
 source "target/Config.in.arch"
 source "target/device/Config.in"
diff --git a/Makefile b/Makefile
index 3780fe6..8d53778 100644
--- a/Makefile
+++ b/Makefile
@@ -23,6 +23,9 @@
 # You shouldn't need to mess with anything beyond this point...
 #--------------------------------------------------------------
 
+# Set and export the version string
+export BR2_VERSION:=2010.11-git
+
 # This top-level Makefile can *not* be executed in parallel
 .NOTPARALLEL:
 
@@ -631,9 +634,8 @@ help:
 	@echo 'See docs/README and docs/buildroot.html for further details'
 	@echo
 
-release:
-	OUT=buildroot-$$(grep -A2 BR2_VERSION $(CONFIG_CONFIG_IN)|grep default|cut -f2 -d\"); \
-	git archive --format=tar --prefix=$$OUT/ master|gzip -9 >$$OUT.tar.gz
+release: OUT=buildroot-$(BR2_VERSION)
+	git archive --format=tar --prefix=$(OUT)/ master|gzip -9 >$(OUT).tar.gz
 
 .PHONY: $(noconfig_targets)
 
diff --git a/package/config/confdata.c b/package/config/confdata.c
index ba1f8a7..5cfb6d2 100644
--- a/package/config/confdata.c
+++ b/package/config/confdata.c
@@ -586,8 +586,10 @@ int conf_write(const char *name)
 
 	fprintf(out, _("#\n"
 		       "# Automatically generated make config: don't edit\n"
+		       "# Buildroot version: %s\n"
 		       "%s%s"
 		       "#\n"),
+		     sym_get_string_value(sym),
 		     use_timestamp ? "# " : "",
 		     use_timestamp ? ctime(&now) : "");
 
@@ -831,8 +833,10 @@ int conf_write_autoconf(void)
 	time(&now);
 	fprintf(out, "#\n"
 		     "# Automatically generated make config: don't edit\n"
+		     "# Buildroot version: %s\n"
 		     "# %s"
 		     "#\n",
+		     sym_get_string_value(sym),
 		     ctime(&now));
 	fprintf(tristate, "#\n"
 			  "# Automatically generated - do not edit\n"
diff --git a/package/config/patches/01-kconfig-kernel-to-buildroot.patch b/package/config/patches/01-kconfig-kernel-to-buildroot.patch
index f77a54c..9df22d4 100644
--- a/package/config/patches/01-kconfig-kernel-to-buildroot.patch
+++ b/package/config/patches/01-kconfig-kernel-to-buildroot.patch
@@ -69,18 +69,16 @@ Index: config/confdata.c
  	sym_calc_value(sym);
  	time(&now);
  	env = getenv("KCONFIG_NOTIMESTAMP");
-@@ -588,10 +588,8 @@
+@@ -588,7 +588,7 @@
  
  	fprintf(out, _("#\n"
  		       "# Automatically generated make config: don't edit\n"
 -		       "# Linux kernel version: %s\n"
++		       "# Buildroot version: %s\n"
  		       "%s%s"
  		       "#\n"),
--		     sym_get_string_value(sym),
- 		     use_timestamp ? "# " : "",
- 		     use_timestamp ? ctime(&now) : "");
- 
-@@ -802,25 +800,23 @@
+ 		     sym_get_string_value(sym),
+@@ -802,25 +802,25 @@
  		return 1;
  	}
  
@@ -91,9 +89,11 @@ Index: config/confdata.c
  	fprintf(out, "#\n"
  		     "# Automatically generated make config: don't edit\n"
 -		     "# Linux kernel version: %s\n"
++		     "# Buildroot version: %s\n"
  		     "# %s"
  		     "#\n",
 -		     sym_get_string_value(sym), ctime(&now));
++		     sym_get_string_value(sym),
 +		     ctime(&now));
  	fprintf(tristate, "#\n"
  			  "# Automatically generated - do not edit\n"
-- 
1.7.1
