From: Carlos Santos <casantos@datacom.com.br>
Date: Mon, 19 Nov 2018 02:41:23 -0200
Subject: [Buildroot] [PATCH next] tpm2-tss: depend on shared libraries
Message-ID: <20181119044123.19463-1-casantos@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The code includes dlfcn.h even if --enable-static and --disable-shared
are passed to configure. There is an "#ifndef NO_DL ... #endif" wrapper
but NO_DL is never defined and adding "-DNO_DL" to CFLAGS causes other
compilation errors.

Fixes:
  http://autobuild.buildroot.net/results/cfc3bfef5e93329bf944a57947086d9ddc4fece3

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
---
 package/tpm2-tss/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/tpm2-tss/Config.in b/package/tpm2-tss/Config.in
index 4e299eccc1..26a120c46b 100644
--- a/package/tpm2-tss/Config.in
+++ b/package/tpm2-tss/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_TPM2_TSS
 	bool "tpm2-tss"
+	depends on !BR2_STATIC_LIBS # dlfcn.h
 	select BR2_PACKAGE_LIBURIPARSER
 	select BR2_PACKAGE_OPENSSL
 	help
@@ -30,3 +31,6 @@ config BR2_PACKAGE_TPM2_TSS
 	    Microsoft software TPM2 simulator.
 
 	  https://github.com/tpm2-software/tpm2-tss
+
+comment "tpm2-tss needs a toolchain w/ dynamic library"
+	depends BR2_STATIC_LIBS
-- 
2.19.1
