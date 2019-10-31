From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 31 Oct 2019 21:03:02 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/go: add Debian
 backport of upstream security fix
Message-ID: <20191031200032.DACFB8E2BC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=742eda356592796c822b918b5dbebac425d2290e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes the following security vulnerability:

- CVE-2019-17596: Invalid DSA public keys can cause a panic in dsa.Verify.
  In particular, using crypto/x509.Verify on a crafted X.509 certificate
  chain can lead to a panic, even if the certificates don???t chain to a
  trusted root.  The chain can be delivered via a crypto/tls connection to a
  client, or to a server that accepts and verifies client certificates.
  net/http clients can be made to crash by an HTTPS server, while net/http
  servers that accept client certificates will recover the panic and are
  unaffected.

Upstream has not provided a go 1.11.x release with a fix for this, so
instead include the Debian backport of the upstream security fix from:

https://sources.debian.org/src/golang-1.11/1.11.6-1+deb10u3/debian/patches/0008-Fix-CVE-2019-17596.patch/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/0003-Fix-CVE-2019-17596.patch | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/package/go/0003-Fix-CVE-2019-17596.patch b/package/go/0003-Fix-CVE-2019-17596.patch
new file mode 100644
index 0000000000..33a5baad5b
--- /dev/null
+++ b/package/go/0003-Fix-CVE-2019-17596.patch
@@ -0,0 +1,27 @@
+From: "Dr. Tobias Quathamer" <toddy@debian.org>
+Date: Sat, 19 Oct 2019 14:03:22 +0200
+Subject: Fix CVE-2019-17596
+
+Cherry-picked from upstream:
+https://github.com/golang/go/commit/2017d88dbc096381d4f348d2fb08bfb3c2b7ed73
+
+[Upstream: https://sources.debian.org/src/golang-1.11/1.11.6-1+deb10u3/debian/patches/0008-Fix-CVE-2019-17596.patch]
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ src/crypto/dsa/dsa.go | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/crypto/dsa/dsa.go b/src/crypto/dsa/dsa.go
+index 575314b..2fc4f1f 100644
+--- a/src/crypto/dsa/dsa.go
++++ b/src/crypto/dsa/dsa.go
+@@ -279,6 +279,9 @@ func Verify(pub *PublicKey, hash []byte, r, s *big.Int) bool {
+ 	}
+ 
+ 	w := new(big.Int).ModInverse(s, pub.Q)
++	if w == nil {
++		return false
++	}
+ 
+ 	n := pub.Q.BitLen()
+ 	if n&7 != 0 {
