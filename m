From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 20 Jun 2021 11:02:08 +0200
Subject: [Buildroot] [PATCH v2 2/2] package/tor: bump version to 0.4.6.5
In-Reply-To: <20210620090208.205080-1-bernd.kuhls@t-online.de>
References: <20210620090208.205080-1-bernd.kuhls@t-online.de>
Message-ID: <20210620090208.205080-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes: https://blog.torproject.org/node/2041

Added upstream patch to fix compilation with older compilers.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: Added upstream patch to fix compilation with older compilers.

 ...0002-Fix-compilation-on-systems-with.patch | 47 +++++++++++++++++++
 package/tor/tor.hash                          |  2 +-
 package/tor/tor.mk                            |  2 +-
 3 files changed, 49 insertions(+), 2 deletions(-)
 create mode 100644 package/tor/0002-Fix-compilation-on-systems-with.patch

diff --git a/package/tor/0002-Fix-compilation-on-systems-with.patch b/package/tor/0002-Fix-compilation-on-systems-with.patch
new file mode 100644
index 0000000000..3598a16588
--- /dev/null
+++ b/package/tor/0002-Fix-compilation-on-systems-with.patch
@@ -0,0 +1,47 @@
+From 2c00ad36cd6808423821fc32a072a7f16e8509e5 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Alexander=20F=C3=A6r=C3=B8y?= <ahf@torproject.org>
+Date: Thu, 10 Jun 2021 20:04:13 +0000
+Subject: [PATCH] Fix compilation on systems with older compilers.
+
+This patch fixes a build error with GCC 7.x which doesn't seem to accept
+const int's as constants in macro initialization.
+
+See: tpo/core/tor#40410
+
+Downloaded from upstream commit
+https://gitlab.torproject.org/tpo/core/tor/-/commit/2c00ad36cd6808423821fc32a072a7f16e8509e5
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ changes/ticket40410               | 4 ++++
+ src/feature/dirclient/dirclient.c | 3 +--
+ 2 files changed, 5 insertions(+), 2 deletions(-)
+ create mode 100644 changes/ticket40410
+
+diff --git a/changes/ticket40410 b/changes/ticket40410
+new file mode 100644
+index 0000000000..90d6f4be63
+--- /dev/null
++++ b/changes/ticket40410
+@@ -0,0 +1,4 @@
++  o Minor bugfixes (compilation):
++    - Fix a compilation error when trying to build Tor with a compiler that
++      does not support expanding statitically initialized const values in
++      macro's. Fixes bug 40410; bugfix on 0.4.6.5.
+diff --git a/src/feature/dirclient/dirclient.c b/src/feature/dirclient/dirclient.c
+index 79ec518c25..fd677d33fe 100644
+--- a/src/feature/dirclient/dirclient.c
++++ b/src/feature/dirclient/dirclient.c
+@@ -1873,8 +1873,7 @@ dir_client_decompress_response_body(char **bodyp, size_t *bodylenp,
+   /* If we're pretty sure that we have a compressed directory, and
+    * we didn't manage to uncompress it, then warn and bail. */
+   if (!plausible && !new_body) {
+-    const int LOG_INTERVAL = 3600;
+-    static ratelim_t warning_limit = RATELIM_INIT(LOG_INTERVAL);
++    static ratelim_t warning_limit = RATELIM_INIT(60 * 60);
+     log_fn_ratelim(&warning_limit, LOG_WARN, LD_HTTP,
+            "Unable to decompress HTTP body (tried %s%s%s, on %s).",
+            description1,
+-- 
+GitLab
+
diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index 8622281c2c..800acee2f5 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f304e456102ed26c39e5f16ece2115585398cdb4e67455139c86ea43cdf70856  tor-0.4.5.9.tar.gz
+sha256  7b6d354e0d9791eace4b51e92211909308297b7aa257993937163d7ee0694cf9  tor-0.4.6.5.tar.gz
 sha256  47b54ed17e8fdcab3c44729a1789a09b208f9a63a845a7e50def9df729eebad0  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index e7e791a10a..e0db278fb9 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.4.5.9
+TOR_VERSION = 0.4.6.5
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
-- 
2.30.2
