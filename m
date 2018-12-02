From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 02 Dec 2018 07:19:28 -0000
Subject: [Buildroot] [git commit] tpm2-abrmd: bump to version 2.0.3
Message-ID: <20181202071555.9ECB98843B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=08cd849bee8fb5c77db9d12de9f78e91d2002646
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop C++ requirement, which came from tpm2-tss.
- Drom musl restriction.
- Update daemon command-line options in init script.

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tpm2-abrmd/Config.in       | 7 ++-----
 package/tpm2-abrmd/S80tpm2-abrmd   | 2 +-
 package/tpm2-abrmd/tpm2-abrmd.hash | 2 +-
 package/tpm2-abrmd/tpm2-abrmd.mk   | 2 +-
 4 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/package/tpm2-abrmd/Config.in b/package/tpm2-abrmd/Config.in
index 0cac754b3c..31c5ae7d6b 100644
--- a/package/tpm2-abrmd/Config.in
+++ b/package/tpm2-abrmd/Config.in
@@ -1,10 +1,8 @@
 config BR2_PACKAGE_TPM2_ABRMD
 	bool "tpm2-abrmd"
-	depends on BR2_INSTALL_LIBSTDCPP # tpm2-tss
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
 	depends on BR2_USE_MMU # dbus, libglib2
-	depends on !BR2_TOOLCHAIN_USES_MUSL # TEMP_FAILURE_RETRY(), etc
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_TPM2_TSS
@@ -22,7 +20,6 @@ config BR2_PACKAGE_TPM2_ABRMD
 
 	  https://github.com/tpm2-software/tpm2-abrmd
 
-comment "tpm2-abrmd needs a uClibc or glibc toolchain w/ C++, wchar, threads"
+comment "tpm2-abrmd needs a toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR \
-		|| !BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_USES_MUSL
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/tpm2-abrmd/S80tpm2-abrmd b/package/tpm2-abrmd/S80tpm2-abrmd
index d54c220c04..cfa9d44771 100755
--- a/package/tpm2-abrmd/S80tpm2-abrmd
+++ b/package/tpm2-abrmd/S80tpm2-abrmd
@@ -49,7 +49,7 @@ stop() {
 check_required_files /etc/dbus-1/system.d/tpm2-abrmd.conf
 
 # defaults
-DAEMON_OPTS="--tcti=device --logger=syslog --max-connections=20 --max-transient-objects=20 --fail-on-loaded-trans"
+DAEMON_OPTS="--tcti=device --logger=syslog --max-connections=20"
 
 # Read configuration variable file if it is present
 [ -r /etc/default/tpm2-abrmd ] && . /etc/default/tpm2-abrmd
diff --git a/package/tpm2-abrmd/tpm2-abrmd.hash b/package/tpm2-abrmd/tpm2-abrmd.hash
index 6af991d469..61a75c0d1b 100644
--- a/package/tpm2-abrmd/tpm2-abrmd.hash
+++ b/package/tpm2-abrmd/tpm2-abrmd.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 e32e19de93b539374a485d9df7fe9415ce147ec03c8d9ba6593e50f7a67a7a51  tpm2-abrmd-1.3.0.tar.gz
+sha256 ff0ed283b0300cd784d6bf2b042e167020f8443602974e53b924e9fd98a4b515  tpm2-abrmd-2.0.3.tar.gz
 sha256 18c1bf4b1ba1fb2c4ffa7398c234d83c0d55475298e470ae1e5e3a8a8bd2e448  LICENSE
diff --git a/package/tpm2-abrmd/tpm2-abrmd.mk b/package/tpm2-abrmd/tpm2-abrmd.mk
index b918ceaa4b..a4d9cfb384 100644
--- a/package/tpm2-abrmd/tpm2-abrmd.mk
+++ b/package/tpm2-abrmd/tpm2-abrmd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TPM2_ABRMD_VERSION = 1.3.0
+TPM2_ABRMD_VERSION = 2.0.3
 TPM2_ABRMD_SITE = https://github.com/tpm2-software/tpm2-abrmd/releases/download/$(TPM2_ABRMD_VERSION)
 TPM2_ABRMD_LICENSE = BSD-2-Clause
 TPM2_ABRMD_LICENSE_FILES = LICENSE
