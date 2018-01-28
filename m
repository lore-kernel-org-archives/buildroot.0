From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 28 Jan 2018 23:33:10 +0100
Subject: [Buildroot] [PATCH] dovecot: add upstream security fix for
 CVE-2017-15132
Message-ID: <20180128223310.30638-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A flaw was found in dovecot 2.0 up to 2.2.33 and 2.3.0.  An abort of SASL
authentication results in a memory leak in dovecot's auth client used by
login processes.  The leak has impact in high performance configuration
where same login processes are reused and can cause the process to crash due
to memory exhaustion.

For more details, see:
http://www.openwall.com/lists/oss-security/2018/01/25/4

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...x-memory-leak-in-auth_client_request_abor.patch | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 package/dovecot/0002-lib-auth-Fix-memory-leak-in-auth_client_request_abor.patch

diff --git a/package/dovecot/0002-lib-auth-Fix-memory-leak-in-auth_client_request_abor.patch b/package/dovecot/0002-lib-auth-Fix-memory-leak-in-auth_client_request_abor.patch
new file mode 100644
index 0000000000..babccd3acf
--- /dev/null
+++ b/package/dovecot/0002-lib-auth-Fix-memory-leak-in-auth_client_request_abor.patch
@@ -0,0 +1,33 @@
+From 1a29ed2f96da1be22fa5a4d96c7583aa81b8b060 Mon Sep 17 00:00:00 2001
+From: Timo Sirainen <timo.sirainen@dovecot.fi>
+Date: Mon, 18 Dec 2017 16:50:51 +0200
+Subject: [PATCH] lib-auth: Fix memory leak in auth_client_request_abort()
+
+This caused memory leaks when authentication was aborted. For example
+with IMAP:
+
+a AUTHENTICATE PLAIN
+*
+
+Broken by 9137c55411aa39d41c1e705ddc34d5bd26c65021
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ src/lib-auth/auth-client-request.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/lib-auth/auth-client-request.c b/src/lib-auth/auth-client-request.c
+index 480fb42b3..046f7c307 100644
+--- a/src/lib-auth/auth-client-request.c
++++ b/src/lib-auth/auth-client-request.c
+@@ -186,6 +186,7 @@ void auth_client_request_abort(struct auth_client_request **_request)
+ 
+ 	auth_client_send_cancel(request->conn->client, request->id);
+ 	call_callback(request, AUTH_REQUEST_STATUS_ABORT, NULL, NULL);
++	pool_unref(&request->pool);
+ }
+ 
+ unsigned int auth_client_request_get_id(struct auth_client_request *request)
+-- 
+2.11.0
+
-- 
2.11.0
