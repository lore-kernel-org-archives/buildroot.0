From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 20 Dec 2019 21:27:28 +0100
Subject: [Buildroot] [PATCH 1/1] package/jq: bump to git version
 a97638713ad3 (still 1.6-based)
Message-ID: <20191220202728.14001-1-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

jq 1.6 has a severe performance regression compared to 1.5. The problem is
reported [1] and fixed [2] upstream, but there are different commits and
later subsequent fixes on top of them that make it cumbersome to patch
specifically.

Instead, bump to a recent git version.

[1] https://github.com/stedolan/jq/issues/1826
[2] https://github.com/stedolan/jq/pull/1834

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 package/jq/jq.hash | 2 +-
 package/jq/jq.mk   | 7 +++++--
 2 files changed, 6 insertions(+), 3 deletions(-)


Note: when I wrote the patch initially, I chose latest master.
Now when I'm preparing it for upstreaming, there are a few more commits on
master. I'm _not_ including them now as we did not test with it.


diff --git a/package/jq/jq.hash b/package/jq/jq.hash
index 449619b024..2cddda32c6 100644
--- a/package/jq/jq.hash
+++ b/package/jq/jq.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  5de8c8e29aaa3fb9cc6b47bb27299f271354ebb72514e3accadc7d38b5bbaa72  jq-1.6.tar.gz
+sha256  3002cf80d871728562989b4a47d90a7301fe049a4e1d69836b99108f198dac06  jq-a97638713ad30653d424f136018098c4b0e5c71b.tar.gz
 sha256  111136aebcbfa68b6b0084e582b30e981da76adcff84eab6f9be32a1f38c5bf1  COPYING
diff --git a/package/jq/jq.mk b/package/jq/jq.mk
index bf96f0cecb..3d22306537 100644
--- a/package/jq/jq.mk
+++ b/package/jq/jq.mk
@@ -4,12 +4,15 @@
 #
 ################################################################################
 
-JQ_VERSION = 1.6
-JQ_SITE = https://github.com/stedolan/jq/releases/download/jq-$(JQ_VERSION)
+JQ_VERSION = a97638713ad30653d424f136018098c4b0e5c71b
+JQ_SITE = $(call github,stedolan,jq,$(JQ_VERSION))
 JQ_LICENSE = MIT (code), CC-BY-3.0 (documentation)
 JQ_LICENSE_FILES = COPYING
 JQ_INSTALL_STAGING = YES
 
+# currently using git version directly
+JQ_AUTORECONF = YES
+
 # uses c99 specific features
 # _GNU_SOURCE added to fix gcc6+ host compilation
 # (https://github.com/stedolan/jq/issues/1598)
-- 
2.23.0
