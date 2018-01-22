From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 22 Jan 2018 20:54:17 +0100
Subject: [Buildroot] [PATCH v2 2/2] squid: add upstream post-3.5.27 security
 patches
In-Reply-To: <20180122195417.358-1-peter@korsgaard.com>
References: <20180122195417.358-1-peter@korsgaard.com>
Message-ID: <20180122195417.358-2-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes the following security issues:

SQUID-2018:1 Due to incorrect pointer handling Squid is vulnerable to denial
of service attack when processing ESI responses.

http://www.squid-cache.org/Advisories/SQUID-2018_1.txt

SQUID-2018:2  Due to incorrect pointer handling Squid is vulnerable to
denial of service attack when processing ESI responses or downloading
intermediate CA certificates.

http://www.squid-cache.org/Advisories/SQUID-2018_2.txt

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...e-sure-endofName-never-exceeds-tagEnd-130.patch | 35 ++++++++++++++++++++++
 ...t-IP-logging-for-transactions-without-a-c.patch | 31 +++++++++++++++++++
 2 files changed, 66 insertions(+)
 create mode 100644 package/squid/0003-ESI-make-sure-endofName-never-exceeds-tagEnd-130.patch
 create mode 100644 package/squid/0004-Fix-indirect-IP-logging-for-transactions-without-a-c.patch

diff --git a/package/squid/0003-ESI-make-sure-endofName-never-exceeds-tagEnd-130.patch b/package/squid/0003-ESI-make-sure-endofName-never-exceeds-tagEnd-130.patch
new file mode 100644
index 0000000000..6e71677a19
--- /dev/null
+++ b/package/squid/0003-ESI-make-sure-endofName-never-exceeds-tagEnd-130.patch
@@ -0,0 +1,35 @@
+From eb2db98a676321b814fc4a51c4fb7928a8bb45d9 Mon Sep 17 00:00:00 2001
+From: Amos Jeffries <yadij@users.noreply.github.com>
+Date: Fri, 19 Jan 2018 13:54:14 +1300
+Subject: [PATCH] ESI: make sure endofName never exceeds tagEnd (#130)
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ src/esi/CustomParser.cc | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/esi/CustomParser.cc b/src/esi/CustomParser.cc
+index d86d2d309..db634d921 100644
+--- a/src/esi/CustomParser.cc
++++ b/src/esi/CustomParser.cc
+@@ -121,7 +121,7 @@ ESICustomParser::parse(char const *dataToParse, size_t const lengthOfData, bool
+ 
+             char * endofName = strpbrk(const_cast<char *>(tag), w_space);
+ 
+-            if (endofName > tagEnd)
++            if (!endofName || endofName > tagEnd)
+                 endofName = const_cast<char *>(tagEnd);
+ 
+             *endofName = '\0';
+@@ -214,7 +214,7 @@ ESICustomParser::parse(char const *dataToParse, size_t const lengthOfData, bool
+ 
+             char * endofName = strpbrk(const_cast<char *>(tag), w_space);
+ 
+-            if (endofName > tagEnd)
++            if (!endofName || endofName > tagEnd)
+                 endofName = const_cast<char *>(tagEnd);
+ 
+             *endofName = '\0';
+-- 
+2.11.0
+
diff --git a/package/squid/0004-Fix-indirect-IP-logging-for-transactions-without-a-c.patch b/package/squid/0004-Fix-indirect-IP-logging-for-transactions-without-a-c.patch
new file mode 100644
index 0000000000..51fff30034
--- /dev/null
+++ b/package/squid/0004-Fix-indirect-IP-logging-for-transactions-without-a-c.patch
@@ -0,0 +1,31 @@
+From 8232b83d3fa47a1399f155cb829db829369fbae9 Mon Sep 17 00:00:00 2001
+From: squidadm <squidadm@users.noreply.github.com>
+Date: Sun, 21 Jan 2018 08:07:08 +1300
+Subject: [PATCH] Fix indirect IP logging for transactions without a client
+ connection (#129) (#136)
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ src/client_side_request.cc | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/client_side_request.cc b/src/client_side_request.cc
+index be124f355..203f89d46 100644
+--- a/src/client_side_request.cc
++++ b/src/client_side_request.cc
+@@ -488,9 +488,9 @@ clientFollowXForwardedForCheck(allow_t answer, void *data)
+         * Ensure that the access log shows the indirect client
+         * instead of the direct client.
+         */
+-        ConnStateData *conn = http->getConn();
+-        conn->log_addr = request->indirect_client_addr;
+-        http->al->cache.caddr = conn->log_addr;
++        http->al->cache.caddr = request->indirect_client_addr;
++        if (ConnStateData *conn = http->getConn())
++            conn->log_addr = request->indirect_client_addr;
+     }
+     request->x_forwarded_for_iterator.clean();
+     request->flags.done_follow_x_forwarded_for = true;
+-- 
+2.11.0
+
-- 
2.11.0
