From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 18 Jul 2019 20:37:12 +0200
Subject: [Buildroot] [git commit] package/botan: bump to version 2.11.0
Message-ID: <20190718183658.C0257814ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=290b036a7af3553d87b381cb28730a140aad7940
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Remove patches (already in version)
- Upstream does not provide tgz tarball anymore, switch to xz.
- Update hash for license file due to copyright year change.
- See full changelog https://botan.randombit.net/news.html

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../botan/0001-remove-mips64-explicit-mabi.patch   | 20 -------
 ...Fix-compat-issue-with-upcoming-Boost-1-70.patch | 67 ----------------------
 ...kefile.in-move-LDFLAGS-after-EXE_LINKS_TO.patch | 38 ------------
 package/botan/botan.hash                           |  4 +-
 package/botan/botan.mk                             |  4 +-
 5 files changed, 4 insertions(+), 129 deletions(-)

diff --git a/package/botan/0001-remove-mips64-explicit-mabi.patch b/package/botan/0001-remove-mips64-explicit-mabi.patch
deleted file mode 100644
index 9c9317755a..0000000000
--- a/package/botan/0001-remove-mips64-explicit-mabi.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Remove explicit mips64 -mabi parameter
-
-This breaks when building for n32 ABI on mips64.
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
-[Bernd: rebased for botan-2.7.0]
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
-
-diff -Nuar Botan-1.10.8-orig/src/build-data/cc/gcc.txt Botan-1.10.8/src/build-data/cc/gcc.txt
---- Botan-1.10.8-orig/src/build-data/cc/gcc.txt	2014-04-10 17:11:44.000000000 +0300
-+++ Botan-1.10.8/src/build-data/cc/gcc.txt	2014-10-23 09:20:34.506722323 +0300
-@@ -83,7 +83,6 @@
- 
- openmp  -> "-fopenmp"
- 
--mips64  -> "-mabi=64"
- s390    -> "-m31"
- s390x   -> "-m64"
- sparc32 -> "-m32 -mno-app-regs"
diff --git a/package/botan/0002-Fix-compat-issue-with-upcoming-Boost-1-70.patch b/package/botan/0002-Fix-compat-issue-with-upcoming-Boost-1-70.patch
deleted file mode 100644
index bf89e6cfea..0000000000
--- a/package/botan/0002-Fix-compat-issue-with-upcoming-Boost-1-70.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-From 86df247e4f090f984e050962ed5a4a536ec63b33 Mon Sep 17 00:00:00 2001
-From: Ralf van der Enden <Ralf.vanderEnden@deltares.nl>
-Date: Fri, 5 Apr 2019 14:58:14 +0200
-Subject: [PATCH] boost 1.70 compatibility
-
-Fixes issue #82
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/randombit/botan/commit/f7148998ace97f2ad3a583685e6ed3c1f3b74c09]
----
- src/cli/tls_http_server.cpp | 8 +++++++-
- src/cli/tls_proxy.cpp       | 8 +++++++-
- 2 files changed, 14 insertions(+), 2 deletions(-)
-
-diff --git a/src/cli/tls_http_server.cpp b/src/cli/tls_http_server.cpp
-index cc59a71c33..0a6428cd65 100644
---- a/src/cli/tls_http_server.cpp
-+++ b/src/cli/tls_http_server.cpp
-@@ -41,6 +41,12 @@
- 
- #include "credentials.h"
- 
-+#if BOOST_VERSION >= 107000
-+#define GET_IO_SERVICE(s) ((boost::asio::io_context&)(s).get_executor().context())
-+#else
-+#define GET_IO_SERVICE(s) ((s).get_io_service())
-+#endif
-+
- namespace Botan_CLI {
- 
- namespace {
-@@ -435,7 +441,7 @@ class TLS_Asio_HTTP_Server final
-       session::pointer make_session()
-          {
-          return session::create(
--                   m_acceptor.get_io_service(),
-+                   GET_IO_SERVICE(m_acceptor),
-                    m_session_manager,
-                    m_creds,
-                    m_policy);
-diff --git a/src/cli/tls_proxy.cpp b/src/cli/tls_proxy.cpp
-index 49ffbe3766..42ce156b12 100644
---- a/src/cli/tls_proxy.cpp
-+++ b/src/cli/tls_proxy.cpp
-@@ -33,6 +33,12 @@
- 
- #include "credentials.h"
- 
-+#if BOOST_VERSION >= 107000
-+#define GET_IO_SERVICE(s) ((boost::asio::io_context&)(s).get_executor().context())
-+#else
-+#define GET_IO_SERVICE(s) ((s).get_io_service())
-+#endif
-+
- namespace Botan_CLI {
- 
- namespace {
-@@ -370,7 +376,7 @@ class tls_proxy_server final
-       session::pointer make_session()
-          {
-          return session::create(
--                   m_acceptor.get_io_service(),
-+                   GET_IO_SERVICE(m_acceptor),
-                    m_session_manager,
-                    m_creds,
-                    m_policy,
diff --git a/package/botan/0003-makefile.in-move-LDFLAGS-after-EXE_LINKS_TO.patch b/package/botan/0003-makefile.in-move-LDFLAGS-after-EXE_LINKS_TO.patch
deleted file mode 100644
index 82186419d5..0000000000
--- a/package/botan/0003-makefile.in-move-LDFLAGS-after-EXE_LINKS_TO.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From a837dd63f3ac5a9c206863c82b57c679cb72b8b7 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 28 Apr 2019 10:21:06 +0200
-Subject: [PATCH] makefile.in: move LDFLAGS after EXE_LINKS_TO
-
-Move LDFLAGS after EXE_LINKS_TO to allow the user to give additional
-libraries such as -latomic otherwise static build will fail:
-
-cli/tls_server.o build/obj/cli/tls_utils.o build/obj/cli/utils.o build/obj/cli/x509.o -L. -lbotan-2 -lboost_filesystem -lboost_system -lbz2 -lcrypto -llzma -lsqlite3 -lz -o botan
-/home/buildroot/autobuild/instance-1/output/host/bin/sparc-linux-g++ -Wl,-rpath=\$ORIGIN -pthread -static -latomic build/obj/test/main.o build/obj/test/test_aead.o build/obj/test/test_asn1.o build/obj/test/test_bigint.o build/obj/test/test_block.o build/obj/test/test_blowfish.o build/obj/test/test_c25519.o build/obj/test/test_certstor.o build/obj/test/test_compression.o build/obj/test/test_cryptobox.o build/obj/test/test_datastore.o build/obj/test/test_dh.o build/obj/test/test_dl_group.o build/obj/test/test_dlies.o build/obj/test/test_dsa.o build/obj/test/test_ecc_pointmul.o build/obj/test/test_ecdh.o build/obj/test/test_ecdsa.o build/obj/test/test_ecgdsa.o build/obj/test/test_ecies.o build/obj/test/test_eckcdsa.o build/obj/test/test_ed25519.o build/obj/test/test_elg.o build/obj/test/test_entropy.o build/obj/test/test_ffi.o build/obj/test/test_filters.o build/obj/test/test_fpe.o build/obj/test/test_gf2m.o build/obj/test/test_gost_3410.o build/obj/test/test_hash.o build/obj/test/test
 _hash_id.o build/obj/test/test_kdf.o build/obj/test/test_keywrap.o build/obj/test/test_mac.o build/obj/test/test_mceliece.o build/obj/test/test_modes.o build/obj/test/test_mp.o build/obj/test/test_name_constraint.o build/obj/test/test_newhope.o build/obj/test/test_ocb.o build/obj/test/test_ocsp.o build/obj/test/test_octetstring.o build/obj/test/test_oid.o build/obj/test/test_os_utils.o build/obj/test/test_otp.o build/obj/test/test_package_transform.o build/obj/test/test_pad.o build/obj/test/test_passhash.o build/obj/test/test_pbkdf.o build/obj/test/test_pem.o build/obj/test/test_pk_pad.o build/obj/test/test_pkcs11.o build/obj/test/test_pkcs11_high_level.o build/obj/test/test_pkcs11_low_level.o build/obj/test/test_psk_db.o build/obj/test/test_pubkey.o build/obj/test/test_rfc6979.o build/obj/test/test_rng.o build/obj/test/test_rng_kat.o build/obj/test/test_rsa.o build/obj/test/test_runner.o build/obj/test/test_simd.o build/obj/test/test_siv.o build/obj/test/test_sm2.o build/obj/test/t
 est_srp6.o build/obj/test/test_stream.o build/obj/test/test_tests.o build/obj/test/test_tls.o build/obj/test/test_tls_messages.o build/obj/test/test_tpm.o build/obj/test/test_tss.o build/obj/test/test_utils.o build/obj/test/test_workfactor.o build/obj/test/test_x509_dn.o build/obj/test/test_x509_path.o build/obj/test/test_xmss.o build/obj/test/tests.o build/obj/test/unit_ecc.o build/obj/test/unit_ecdh.o build/obj/test/unit_ecdsa.o build/obj/test/unit_tls.o build/obj/test/unit_tls_policy.o build/obj/test/unit_x509.o -L. -lbotan-2 -lboost_filesystem -lboost_system -lbz2 -lcrypto -llzma -lsqlite3 -lz -o botan-test
-./libbotan-2.a(utils_filesystem.o): In function `Botan::get_files_recursive(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&)':
-filesystem.cpp:(.text+0x758): undefined reference to `__atomic_fetch_sub_4'
-
-Fixes:
- - http://autobuild.buildroot.org/results/9db39b209a0f4be1e09b7e4ddb5e9a63da4fbbfa
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/randombit/botan/pull/1916]
----
- src/build-data/makefile.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/build-data/makefile.in b/src/build-data/makefile.in
-index 08c9c5421..7111c7b19 100644
---- a/src/build-data/makefile.in
-+++ b/src/build-data/makefile.in
-@@ -71,7 +71,7 @@ $(CLI): $(LIBRARIES) $(CLIOBJS)
- 	$(POST_LINK_CMD)
- 
- $(TEST): $(LIBRARIES) $(TESTOBJS)
--	$(EXE_LINK_CMD) $(ABI_FLAGS) $(LDFLAGS) $(TESTOBJS) $(EXE_LINKS_TO) %{output_to_exe}$@
-+	$(EXE_LINK_CMD) $(ABI_FLAGS) $(TESTOBJS) $(EXE_LINKS_TO) $(LDFLAGS) %{output_to_exe}$@
- 	$(POST_LINK_CMD)
- 
- %{if build_fuzzers}
--- 
-2.20.1
-
diff --git a/package/botan/botan.hash b/package/botan/botan.hash
index faa467ec25..a04825a758 100644
--- a/package/botan/botan.hash
+++ b/package/botan/botan.hash
@@ -1,4 +1,4 @@
 # From https://botan.randombit.net/releases/sha256sums.txt
-sha256 e7159b127e91e0c158245d61c638c50d443ec7b440b6b0161328c47b3aba3960  Botan-2.8.0.tgz
+sha256 f7874da2aeb8c018fd77df40b2137879bf90b66f5589490c991e83fb3e8094be  Botan-2.11.0.tar.xz
 # Locally computed
-sha256 40cfd35a9e34d18463806f57553c968fdbaf254a2e2a636d1d8e32ff6b698495  license.txt
+sha256 161011a9be56a6e825c06257005055a148056b5c756f75a0b99dae0883fcab7a  license.txt
diff --git a/package/botan/botan.mk b/package/botan/botan.mk
index a96a12178b..62027280d3 100644
--- a/package/botan/botan.mk
+++ b/package/botan/botan.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-BOTAN_VERSION = 2.8.0
-BOTAN_SOURCE = Botan-$(BOTAN_VERSION).tgz
+BOTAN_VERSION = 2.11.0
+BOTAN_SOURCE = Botan-$(BOTAN_VERSION).tar.xz
 BOTAN_SITE = http://botan.randombit.net/releases
 BOTAN_LICENSE = BSD-2-Clause
 BOTAN_LICENSE_FILES = license.txt
