From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 11 Feb 2021 21:58:18 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] packago/go: security bump
 to version 1.15.7
Message-ID: <20210211203802.84D0280070@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d6f0a981f96073a9ef2d893183ae48350993d438
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

Fixes the following security issues:

- cmd/go: packages using cgo can cause arbitrary code execution at build time

  The go command may execute arbitrary code at build time when cgo is in use
  on Windows.  This may occur when running ???go get???, or any other command
  that builds code.  Only users who build untrusted code (and don???t execute
  it) are affected.

  In addition to Windows users, this can also affect Unix users who have ???.???
  listed explicitly in their PATH and are running ???go get??? or build commands
  outside of a module or with module mode disabled.

  Thanks to RyotaK (https://twitter.com/ryotkak) for reporting this issue.

  This issue is CVE-2021-3115 and Go issue golang.org/issue/43783.

- crypto/elliptic: incorrect operations on the P-224 curve

  The P224() Curve implementation can in rare circumstances generate
  incorrect outputs, including returning invalid points from ScalarMult.

  The crypto/x509 and golang.org/x/crypto/ocsp (but not crypto/tls) packages
  support P-224 ECDSA keys, but they are not supported by publicly trusted
  certificate authorities.  No other standard library or golang.org/x/crypto
  package supports or uses the P-224 curve.

  The incorrect output was found by the elliptic-curve-differential-fuzzer
  project running on OSS-Fuzz and reported by Philippe Antoine (Catena cyber).

  This issue is CVE-2021-3114 and Go issue golang.org/issue/43786.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 0e1b5aa57273465ea10b9c99808282b017a4f05d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index de2cf74cbb..1bd7ab7ca9 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://golang.org/dl/
-sha256  890bba73c5e2b19ffb1180e385ea225059eb008eb91b694875dd86ea48675817  go1.15.6.src.tar.gz
+sha256  8631b3aafd8ecb9244ec2ffb8a2a8b4983cf4ad15572b9801f7c5b167c1a2abc  go1.15.7.src.tar.gz
 sha256	2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index e9f8be7783..3928c8b708 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.15.6
+GO_VERSION = 1.15.7
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
