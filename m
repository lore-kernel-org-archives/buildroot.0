From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Nov 2020 11:31:11 +0100
Subject: [Buildroot] [PATCH] package/go: security bump to 1.15.5
Message-ID: <20201113103112.12954-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes the following security issues:

- math/big: panic during recursive division of very large numbers

  A number of math/big.Int methods (Div, Exp, DivMod, Quo, Rem, QuoRem, Mod,
  ModInverse, ModSqrt, Jacobi, and GCD) can panic when provided crafted
  large inputs.  For the panic to happen, the divisor or modulo argument
  must be larger than 3168 bits (on 32-bit architectures) or 6336 bits (on
  64-bit architectures).  Multiple math/big.Rat methods are similarly affected.

  crypto/rsa.VerifyPSS, crypto/rsa.VerifyPKCS1v15, and crypto/dsa.Verify may
  panic when provided crafted public keys and signatures.  crypto/ecdsa and
  crypto/elliptic operations may only be affected if custom CurveParams with
  unusually large field sizes (several times larger than the largest
  supported curve, P-521) are in use.  Using crypto/x509.Verify on a crafted
  X.509 certificate chain can lead to a panic, even if the certificates
  don?t chain to a trusted root.  The chain can be delivered via a
  crypto/tls connection to a client, or to a server that accepts and
  verifies client certificates.  net/http clients can be made to crash by an
  HTTPS server, while net/http servers that accept client certificates will
  recover the panic and are unaffected.

  Moreover, an application might crash invoking
  crypto/x509.(*CertificateRequest).CheckSignature on an X.509 certificate
  request or during a golang.org/x/crypto/otr conversation.  Parsing a
  golang.org/x/crypto/openpgp Entity or verifying a signature may crash.
  Finally, a golang.org/x/crypto/ssh client can panic due to a malformed
  host key, while a server could panic if either PublicKeyCallback accepts a
  malformed public key, or if IsUserAuthority accepts a certificate with a
  malformed public key.

  Thanks to the Go Ethereum team and the OSS-Fuzz project for reporting
  this.  Thanks to R?my Oudompheng and Robert Griesemer for their help
  developing and validating the fix.

  This issue is CVE-2020-28362 and Go issue golang.org/issue/42552.

- cmd/go: arbitrary code execution at build time through cgo

  The go command may execute arbitrary code at build time when cgo is in
  use.  This may occur when running go get on a malicious package, or any
  other command that builds untrusted code.

  This can be caused by malicious gcc flags specified via a #cgo directive,
  or by a malicious symbol name in a linked object file.

  Thanks to Imre Rad and to Chris Brown and Tempus Ex respectively for
  reporting these issues.

  These issues are CVE-2020-28367 and CVE-2020-28366, and Go issues
  golang.org/issue/42556 and golang.org/issue/42559 respectively.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index eb6fe6c85a..79d6abe8df 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://golang.org/dl/
-sha256  063da6a9a4186b8118a0e584532c8c94e65582e2cd951ed078bfd595d27d2367  go1.15.4.src.tar.gz
+sha256  c1076b90cf94b73ebed62a81d802cd84d43d02dea8c07abdc922c57a071c84f1  go1.15.5.src.tar.gz
 sha256	2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index ccfddd8001..d2ab9b81dd 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.15.4
+GO_VERSION = 1.15.5
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
-- 
2.20.1
