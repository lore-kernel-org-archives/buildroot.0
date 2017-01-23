From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 Jan 2017 23:01:27 +0100
Subject: [Buildroot] [git commit] go: security bump to version 1.7.4
Message-ID: <20170123220845.46621805F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5c9db62171cefb125193a6f814a0046536fc76a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

On Darwin, user's trust preferences for root certificates were not honored.
If the user had a root certificate loaded in their Keychain that was
explicitly not trusted, a Go program would still verify a connection using
that root certificate.  This is addressed by https://golang.org/cl/33721,
tracked in https://golang.org/issue/18141.  Thanks to Xy Ziemba for
identifying and reporting this issue.

The net/http package's Request.ParseMultipartForm method starts writing to
temporary files once the request body size surpasses the given "maxMemory"
limit.  It was possible for an attacker to generate a multipart request
crafted such that the server ran out of file descriptors.  This is addressed
by https://golang.org/cl/30410, tracked in https://golang.org/issue/17965.
Thanks to Simon Rawet for the report.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index ff0e8f7..e50f004 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256 ce4f331352313ad7ba9db5daf6f7f81581f3ca9c862d272ae02ee5a3cb294023  go1.7.2.src.tar.gz
+sha256 4c189111e9ba651a2bb3ee868aa881fab36b2f2da3409e80885ca758a6b614cc  go1.7.4.src.tar.gz
diff --git a/package/go/go.mk b/package/go/go.mk
index 057d9fd..bd30890 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.7.2
+GO_VERSION = 1.7.4
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
