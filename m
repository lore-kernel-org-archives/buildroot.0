From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 5 Mar 2018 21:18:44 +0100
Subject: [Buildroot] [git commit] cryptopp: bump to version 6.1.0
Message-ID: <20180305202144.37067813E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a5750692fee2c205d93af0fe7718eaa5479aa790
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove patch (applied upstream)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...sible-DoS-in-ASN.1-decoders-CVE-2016-9939.patch | 69 ----------------------
 package/cryptopp/cryptopp.hash                     |  7 ++-
 package/cryptopp/cryptopp.mk                       |  2 +-
 3 files changed, 6 insertions(+), 72 deletions(-)

diff --git a/package/cryptopp/0001-Fix-possible-DoS-in-ASN.1-decoders-CVE-2016-9939.patch b/package/cryptopp/0001-Fix-possible-DoS-in-ASN.1-decoders-CVE-2016-9939.patch
deleted file mode 100644
index 2d0f1d91da..0000000000
--- a/package/cryptopp/0001-Fix-possible-DoS-in-ASN.1-decoders-CVE-2016-9939.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From 3d9181d7bdd8e491f745dbc9e34bd20b6f6da069 Mon Sep 17 00:00:00 2001
-From: Gergely Nagy <ngg@tresorit.com>
-Date: Wed, 14 Dec 2016 13:19:01 +0100
-Subject: [PATCH] Fix possible DoS in ASN.1 decoders (CVE-2016-9939)
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- asn.cpp | 10 ++++++++++
- asn.h   |  2 ++
- 2 files changed, 12 insertions(+)
-
-diff --git a/asn.cpp b/asn.cpp
-index 297ff01..2e923ef 100644
---- a/asn.cpp
-+++ b/asn.cpp
-@@ -123,6 +123,8 @@ size_t BERDecodeOctetString(BufferedTransformation &bt, SecByteBlock &str)
- 	size_t bc;
- 	if (!BERLengthDecode(bt, bc))
- 		BERDecodeError();
-+	if (bc > bt.MaxRetrievable())
-+		BERDecodeError();
- 
- 	str.New(bc);
- 	if (bc != bt.Get(str, bc))
-@@ -139,6 +141,8 @@ size_t BERDecodeOctetString(BufferedTransformation &bt, BufferedTransformation &
- 	size_t bc;
- 	if (!BERLengthDecode(bt, bc))
- 		BERDecodeError();
-+	if (bc > bt.MaxRetrievable())
-+		BERDecodeError();
- 
- 	bt.TransferTo(str, bc);
- 	return bc;
-@@ -161,6 +165,8 @@ size_t BERDecodeTextString(BufferedTransformation &bt, std::string &str, byte as
- 	size_t bc;
- 	if (!BERLengthDecode(bt, bc))
- 		BERDecodeError();
-+	if (bc > bt.MaxRetrievable())
-+		BERDecodeError();
- 
- 	SecByteBlock temp(bc);
- 	if (bc != bt.Get(temp, bc))
-@@ -188,6 +194,10 @@ size_t BERDecodeBitString(BufferedTransformation &bt, SecByteBlock &str, unsigne
- 	size_t bc;
- 	if (!BERLengthDecode(bt, bc))
- 		BERDecodeError();
-+	if (bc == 0)
-+		BERDecodeError();
-+	if (bc > bt.MaxRetrievable())
-+		BERDecodeError();
- 
- 	byte unused;
- 	if (!bt.Get(unused))
-diff --git a/asn.h b/asn.h
-index ed9de52..33f0dd0 100644
---- a/asn.h
-+++ b/asn.h
-@@ -498,6 +498,8 @@ void BERDecodeUnsigned(BufferedTransformation &in, T &w, byte asnTag = INTEGER,
- 	bool definite = BERLengthDecode(in, bc);
- 	if (!definite)
- 		BERDecodeError();
-+	if (bc > in.MaxRetrievable())
-+		BERDecodeError();
- 
- 	SecByteBlock buf(bc);
- 
--- 
-2.10.2
-
diff --git a/package/cryptopp/cryptopp.hash b/package/cryptopp/cryptopp.hash
index 577638c1c9..d124e11a81 100644
--- a/package/cryptopp/cryptopp.hash
+++ b/package/cryptopp/cryptopp.hash
@@ -1,2 +1,5 @@
-# Locally computed
-sha256  a75ef486fe3128008bbb201efee3dcdcffbe791120952910883b26337ec32c34  cryptopp565.zip
+# Hash from: https://www.cryptopp.com/release610.html:
+sha256  21289d2511101a9350c87c8eb1f4982d4a266e8037b19dab79a32cc13ea108c7  cryptopp610.zip
+
+# Hash for license file:
+sha256  fe5f5f187e6e38ac2f833956fc5c4cab2df08797cff07f540e4ee74f12f7ee5b  License.txt
diff --git a/package/cryptopp/cryptopp.mk b/package/cryptopp/cryptopp.mk
index 4b121aef2d..d7aabf04b8 100644
--- a/package/cryptopp/cryptopp.mk
+++ b/package/cryptopp/cryptopp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CRYPTOPP_VERSION = 5.6.5
+CRYPTOPP_VERSION = 6.1.0
 CRYPTOPP_SOURCE = cryptopp$(subst .,,$(CRYPTOPP_VERSION)).zip
 CRYPTOPP_SITE = http://cryptopp.com/
 CRYPTOPP_LICENSE = BSL-1.0
