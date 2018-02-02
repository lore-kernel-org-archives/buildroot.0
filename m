From: Carlos Santos <casantos@datacom.ind.br>
Date: Fri,  2 Feb 2018 13:56:11 -0200
Subject: [Buildroot] [PATCH 1/4] tpm2-tss: new package
In-Reply-To: <20180202155614.26938-1-casantos@datacom.ind.br>
References: <20180202155614.26938-1-casantos@datacom.ind.br>
Message-ID: <20180202155614.26938-2-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

OSS implementation of the TCG TPM2 Software Stack (TSS2). This stack
consists of the following layers from top to bottom:

* System API (SAPI) as described in the system level API and TPM command
  transmission interface specification. This API is a 1-to-1 mapping of
  the TPM2 commands documented in Part 3 of the TPM2 specification.
  Additionally there are asynchronous versions of each command. These
  asynchronous variants may be useful for integration into event-driven
  programming environments. Both the synchronous and asynchronous API
  are exposed through a single library: libsapi.

* TPM Command Transmission Interface (TCTI) that is described in the
  same specification. This API provides a standard interface to transmit
  / receive TPM command / response buffers. It is expected that any
  number of libraries implementing the TCTI API will be implemented as a
  way to abstract various platform specific IPC mechanisms. Currently
  this repository provides two TCTI implementations: libtcti-device and
  libtcti-socket. The prior should be used for direct access to the TPM
  through the Linux kernel driver. The later implements the protocol
  exposed by the Microsoft software TPM2 simulator.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 package/Config.in              |  1 +
 package/tpm2-tss/Config.in     | 32 ++++++++++++++++++++++++++++++++
 package/tpm2-tss/tpm2-tss.hash |  3 +++
 package/tpm2-tss/tpm2-tss.mk   | 14 ++++++++++++++
 4 files changed, 50 insertions(+)
 create mode 100644 package/tpm2-tss/Config.in
 create mode 100644 package/tpm2-tss/tpm2-tss.hash
 create mode 100644 package/tpm2-tss/tpm2-tss.mk

diff --git a/package/Config.in b/package/Config.in
index f398c20cab..2e1a78efa2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1056,6 +1056,7 @@ menu "Crypto"
 	source "package/openssl/Config.in"
 	source "package/rhash/Config.in"
 	source "package/tinydtls/Config.in"
+	source "package/tpm2-tss/Config.in"
 	source "package/trousers/Config.in"
 	source "package/ustream-ssl/Config.in"
 	source "package/wolfssl/Config.in"
diff --git a/package/tpm2-tss/Config.in b/package/tpm2-tss/Config.in
new file mode 100644
index 0000000000..1eb69d3e93
--- /dev/null
+++ b/package/tpm2-tss/Config.in
@@ -0,0 +1,32 @@
+config BR2_PACKAGE_TPM2_TSS
+	bool "tpm2-tss"
+	depends on BR2_i386 || BR2_x86_64
+	select BR2_PACKAGE_LIBURIPARSER
+	help
+	  OSS implementation of the Trusted Computing Group's (TCG) TPM2
+	  Software Stack (TSS). This stack consists of the following
+	  layers from top to bottom:
+
+	  * System API (SAPI) as described in the system level API and
+	    TPM command transmission interface specification. This API
+	    is a 1-to-1 mapping of the TPM2 commands documented in Part
+	    3 of the TPM2 specification. Additionally there are
+	    asynchronous versions of each command. These asynchronous
+	    variants may be useful for integration into event-driven
+	    programming environments. Both the synchronous and
+	    asynchronous API are exposed through a single library:
+	    libsapi.
+
+	  * TPM Command Transmission Interface (TCTI) that is described
+	    in the same specification. This API provides a standard
+	    interface to transmit / receive TPM command / response
+	    buffers. It is expected that any number of libraries
+	    implementing the TCTI API will be implemented as a way to
+	    abstract various platform specific IPC mechanisms. Currently
+	    this repository provides two TCTI implementations:
+	    libtcti-device and libtcti-socket.  The prior should be used
+	    for direct access to the TPM through the Linux kernel
+	    driver. The later implements the protocol exposed by the
+	    Microsoft software TPM2 simulator.
+
+	  https://github.com/tpm2-software/tpm2-tss
diff --git a/package/tpm2-tss/tpm2-tss.hash b/package/tpm2-tss/tpm2-tss.hash
new file mode 100644
index 0000000000..df1c6d8b58
--- /dev/null
+++ b/package/tpm2-tss/tpm2-tss.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256 c7d627de50394e9a02593edb1ce74e1bbac17831be726c54f689507f0c41a78a  tpm2-tss-1.3.0.tar.gz
+sha256 18c1bf4b1ba1fb2c4ffa7398c234d83c0d55475298e470ae1e5e3a8a8bd2e448  LICENSE
diff --git a/package/tpm2-tss/tpm2-tss.mk b/package/tpm2-tss/tpm2-tss.mk
new file mode 100644
index 0000000000..709602860f
--- /dev/null
+++ b/package/tpm2-tss/tpm2-tss.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# tpm2-tss
+#
+################################################################################
+
+TPM2_TSS_VERSION = 1.3.0
+TPM2_TSS_SITE = https://github.com/tpm2-software/tpm2-tss/releases/download/$(TPM2_TSS_VERSION)
+TPM2_TSS_LICENSE = BSD-2-Clause
+TPM2_TSS_LICENSE_FILES = LICENSE
+TPM2_TSS_INSTALL_STAGING = YES
+TPM2_TSS_DEPENDENCIES = liburiparser host-pkgconf
+
+$(eval $(autotools-package))
-- 
2.14.3
