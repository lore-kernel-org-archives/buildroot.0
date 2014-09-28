From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 28 Sep 2014 21:54:48 +0200
Subject: [Buildroot] [git commit] package/libcurl: Backport patch to fix
	xbmc-related timeout bug
Message-ID: <20140928195515.496FB9D535@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e15cb988e739bc73383687800afef9e057da1da8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For details see
https://github.com/OpenELEC/OpenELEC.tv/commit/82d923895a311e514f6a916ce4d7e06edd2caabb#commitcomment-7952726

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcurl/libcurl-0001-fixtimeout.patch |   37 +++++++++++++++++++++++++
 1 files changed, 37 insertions(+), 0 deletions(-)

diff --git a/package/libcurl/libcurl-0001-fixtimeout.patch b/package/libcurl/libcurl-0001-fixtimeout.patch
new file mode 100644
index 0000000..f897ca4
--- /dev/null
+++ b/package/libcurl/libcurl-0001-fixtimeout.patch
@@ -0,0 +1,37 @@
+This fixes a timeout problem with xbmc.
+
+Backported from upstream:
+https://github.com/bagder/curl/commit/d9762a7cdb35e70f8cb0bf1c2f8019e8391616e1
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+
+From d9762a7cdb35e70f8cb0bf1c2f8019e8391616e1 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Tue, 23 Sep 2014 11:44:03 +0200
+Subject: [PATCH] threaded-resolver: revert Curl_expire_latest() switch
+
+The switch to using Curl_expire_latest() in commit cacdc27f52b was a
+mistake and was against the advice even mentioned in that commit. The
+comparison in asyn-thread.c:Curl_resolver_is_resolved() makes
+Curl_expire() the suitable function to use.
+
+Bug: http://curl.haxx.se/bug/view.cgi?id=1426
+Reported-By: graysky
+---
+ lib/asyn-thread.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/asyn-thread.c b/lib/asyn-thread.c
+index e4ad32b..6cdc9ad 100644
+--- a/lib/asyn-thread.c
++++ b/lib/asyn-thread.c
+@@ -541,7 +541,7 @@ CURLcode Curl_resolver_is_resolved(struct connectdata *conn,
+       td->poll_interval = 250;
+ 
+     td->interval_end = elapsed + td->poll_interval;
+-    Curl_expire_latest(conn->data, td->poll_interval);
++    Curl_expire(conn->data, td->poll_interval);
+   }
+ 
+   return CURLE_OK;
