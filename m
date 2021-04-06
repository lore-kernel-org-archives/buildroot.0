From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 6 Apr 2021 11:32:14 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/python3: security
 bump to version 3.9.4
Message-ID: <20210406090708.4602082A9C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=00a55bd206ccfb6695dc1e67642037bc30e5dcf8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Fixes the following security issues:

- bpo-42988: CVE-2021-3426: Remove the getfile feature of the pydoc module
  which could be abused to read arbitrary files on the disk (directory
  traversal vulnerability).  Moreover, even source code of Python modules
  can contain sensitive data like passwords.  Vulnerability reported by
  David Schw??rer.

- bpo-43285: ftplib no longer trusts the IP address value returned from the
  server in response to the PASV command by default.  This prevents a
  malicious FTP server from using the response to probe IPv4 address and
  port combinations on the client network.

  Code that requires the former vulnerable behavior may set a
  trust_server_pasv_ipv4_address attribute on their ftplib.FTP instances to
  True to re-enable it.

- bpo-43439: Add audit hooks for gc.get_objects(), gc.get_referrers() and
  gc.get_referents().  Patch by Pablo Galindo.

Note: 3.9.3 was recalled due to introducing unintentional ABI
incompatibility, and fixes re-released as 3.9.4:

https://www.python.org/downloads/release/python-394/

Add host-autoreconf-archive, as it is needed for autoreconf since:
https://github.com/python/cpython/commit/064bc07f241dceec2fc577cbf5c31fa6d63fe320

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit a14ce17ca69ca5ace1e017b2987330b70381c73c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python3/python3.hash | 6 +++---
 package/python3/python3.mk   | 5 +++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index 753973721b..2a0ba6ab4f 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,5 +1,5 @@
-# From https://www.python.org/downloads/release/python-392/
-md5  f0dc9000312abeb16de4eccce9a870ab  Python-3.9.2.tar.xz
+# From https://www.python.org/downloads/release/python-394/
+md5  2a3dba5fc75b695c45cf1806156e1a97  Python-3.9.4.tar.xz
 # Locally computed
-sha256  3c2034c54f811448f516668dce09d24008a0716c3a794dd8639b5388cbde247d  Python-3.9.2.tar.xz
+sha256  4b0e6644a76f8df864ae24ac500a51bbf68bd098f6a173e27d3b61cdca9aa134  Python-3.9.4.tar.xz
 sha256  599826df92bfdcd2702eac691072498bb096c55af04ee984cf90f70ed77b5a70  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index def34f46ad..345c6a8699 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.9
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).2
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).4
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
@@ -41,7 +41,7 @@ HOST_PYTHON3_CONF_ENV += \
 
 PYTHON3_DEPENDENCIES = host-python3 libffi
 
-HOST_PYTHON3_DEPENDENCIES = host-expat host-zlib host-libffi
+HOST_PYTHON3_DEPENDENCIES = host-autoconf-archive host-expat host-zlib host-libffi
 
 ifeq ($(BR2_PACKAGE_HOST_PYTHON3_SSL),y)
 HOST_PYTHON3_DEPENDENCIES += host-openssl
@@ -242,6 +242,7 @@ endef
 PYTHON3_POST_INSTALL_TARGET_HOOKS += PYTHON3_ENSURE_LIBPYTHON_STRIPPED
 
 PYTHON3_AUTORECONF = YES
+PYTHON3_AUTORECONF_OPTS = --include=$(HOST_DIR)/share/autoconf-archive
 
 define PYTHON3_INSTALL_SYMLINK
 	ln -fs python3 $(TARGET_DIR)/usr/bin/python
