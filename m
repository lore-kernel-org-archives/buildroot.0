From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Nov 2018 22:53:02 +0100
Subject: [Buildroot] [PATCH-2018.02.x] squid: security bump to version 3.5.28
Message-ID: <20181125215302.30100-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes SQUID-2018:3 / CVE-2018-1172: Crash in ESI Response processing

For more details, see the advisory:

http://www.squid-cache.org/Advisories/SQUID-2018_3.txt

Drop patch 0003 / 0004 as these (security) fixes are now upstream.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...e-sure-endofName-never-exceeds-tagEnd-130.patch | 35 ----------------------
 ...t-IP-logging-for-transactions-without-a-c.patch | 31 -------------------
 package/squid/squid.hash                           |  6 ++--
 package/squid/squid.mk                             |  2 +-
 4 files changed, 4 insertions(+), 70 deletions(-)
 delete mode 100644 package/squid/0003-ESI-make-sure-endofName-never-exceeds-tagEnd-130.patch
 delete mode 100644 package/squid/0004-Fix-indirect-IP-logging-for-transactions-without-a-c.patch

diff --git a/package/squid/0003-ESI-make-sure-endofName-never-exceeds-tagEnd-130.patch b/package/squid/0003-ESI-make-sure-endofName-never-exceeds-tagEnd-130.patch
deleted file mode 100644
index 6e71677a19..0000000000
--- a/package/squid/0003-ESI-make-sure-endofName-never-exceeds-tagEnd-130.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From eb2db98a676321b814fc4a51c4fb7928a8bb45d9 Mon Sep 17 00:00:00 2001
-From: Amos Jeffries <yadij@users.noreply.github.com>
-Date: Fri, 19 Jan 2018 13:54:14 +1300
-Subject: [PATCH] ESI: make sure endofName never exceeds tagEnd (#130)
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- src/esi/CustomParser.cc | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/esi/CustomParser.cc b/src/esi/CustomParser.cc
-index d86d2d309..db634d921 100644
---- a/src/esi/CustomParser.cc
-+++ b/src/esi/CustomParser.cc
-@@ -121,7 +121,7 @@ ESICustomParser::parse(char const *dataToParse, size_t const lengthOfData, bool
- 
-             char * endofName = strpbrk(const_cast<char *>(tag), w_space);
- 
--            if (endofName > tagEnd)
-+            if (!endofName || endofName > tagEnd)
-                 endofName = const_cast<char *>(tagEnd);
- 
-             *endofName = '\0';
-@@ -214,7 +214,7 @@ ESICustomParser::parse(char const *dataToParse, size_t const lengthOfData, bool
- 
-             char * endofName = strpbrk(const_cast<char *>(tag), w_space);
- 
--            if (endofName > tagEnd)
-+            if (!endofName || endofName > tagEnd)
-                 endofName = const_cast<char *>(tagEnd);
- 
-             *endofName = '\0';
--- 
-2.11.0
-
diff --git a/package/squid/0004-Fix-indirect-IP-logging-for-transactions-without-a-c.patch b/package/squid/0004-Fix-indirect-IP-logging-for-transactions-without-a-c.patch
deleted file mode 100644
index 51fff30034..0000000000
--- a/package/squid/0004-Fix-indirect-IP-logging-for-transactions-without-a-c.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 8232b83d3fa47a1399f155cb829db829369fbae9 Mon Sep 17 00:00:00 2001
-From: squidadm <squidadm@users.noreply.github.com>
-Date: Sun, 21 Jan 2018 08:07:08 +1300
-Subject: [PATCH] Fix indirect IP logging for transactions without a client
- connection (#129) (#136)
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- src/client_side_request.cc | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/src/client_side_request.cc b/src/client_side_request.cc
-index be124f355..203f89d46 100644
---- a/src/client_side_request.cc
-+++ b/src/client_side_request.cc
-@@ -488,9 +488,9 @@ clientFollowXForwardedForCheck(allow_t answer, void *data)
-         * Ensure that the access log shows the indirect client
-         * instead of the direct client.
-         */
--        ConnStateData *conn = http->getConn();
--        conn->log_addr = request->indirect_client_addr;
--        http->al->cache.caddr = conn->log_addr;
-+        http->al->cache.caddr = request->indirect_client_addr;
-+        if (ConnStateData *conn = http->getConn())
-+            conn->log_addr = request->indirect_client_addr;
-     }
-     request->x_forwarded_for_iterator.clean();
-     request->flags.done_follow_x_forwarded_for = true;
--- 
-2.11.0
-
diff --git a/package/squid/squid.hash b/package/squid/squid.hash
index 8787cb25ef..3c0a2734e5 100644
--- a/package/squid/squid.hash
+++ b/package/squid/squid.hash
@@ -1,5 +1,5 @@
-# From http://www.squid-cache.org/Versions/v3/3.5/squid-3.5.27.tar.xz.asc
-md5 39ef8199675d48a314b540f92c00c545 squid-3.5.27.tar.xz
-sha1 1e69c96d13cd49844da3bcf33a0b428fbe7b6f77 squid-3.5.27.tar.xz
+# From http://www.squid-cache.org/Versions/v3/3.5/squid-3.5.28.tar.xz.asc
+md5 9367e0375ea53ba0e99f77054d4402c5 squid-3.5.28.tar.xz
+sha1 721241a270ec27d629d65ae17a50be56510e8441 squid-3.5.28.tar.xz
 # Locally calculated
 sha256 58f5d05257af1fb964fde20e134d660fac9afa86b6fd8c70d63ead63068378fa COPYING
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 8ade55ee37..a921c634bd 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SQUID_VERSION_MAJOR = 3.5
-SQUID_VERSION = $(SQUID_VERSION_MAJOR).27
+SQUID_VERSION = $(SQUID_VERSION_MAJOR).28
 SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
 SQUID_SITE = http://www.squid-cache.org/Versions/v3/$(SQUID_VERSION_MAJOR)
 SQUID_LICENSE = GPL-2.0+
-- 
2.11.0
