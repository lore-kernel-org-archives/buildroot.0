From: qwendu <qwendu@gmail.com>
Date: Wed,  2 Jan 2019 17:32:51 +0800
Subject: [Buildroot] [PATCH] package/libwebsockets: bump to v3.1.0
In-Reply-To: <1546421571-18627-1-git-send-email-qwendu@gmail.com>
References: <1546421571-18627-1-git-send-email-qwendu@gmail.com>
Message-ID: <1546421571-18627-2-git-send-email-qwendu@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

this patch fixed the following error:
...
output/build/libwebsockets-v3.1.0/lib/event-libs/libuv/libuv.c: In function 'elops_destroy_context1_uv':
output/build/libwebsockets-v3.1.0/lib/event-libs/libuv/libuv.c:519:7: error: 'm' may be used uninitialized in this function [-Werror=maybe-uninitialized]
    if (m)
       ^

Signed-off-by: qwendu <qwendu@gmail.com>
---
 package/libwebsockets/libuv-uninitialized.patch | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 package/libwebsockets/libuv-uninitialized.patch

diff --git a/package/libwebsockets/libuv-uninitialized.patch b/package/libwebsockets/libuv-uninitialized.patch
new file mode 100644
index 0000000..319afee
--- /dev/null
+++ b/package/libwebsockets/libuv-uninitialized.patch
@@ -0,0 +1,13 @@
+diff --git a/lib/event-libs/libuv/libuv.c b/lib/event-libs/libuv/libuv.c
+index 39363f1..746d6ba 100644
+--- a/lib/event-libs/libuv/libuv.c
++++ b/lib/event-libs/libuv/libuv.c
+@@ -503,7 +503,7 @@ static int
+ elops_destroy_context1_uv(struct lws_context *context)
+ {
+ 	struct lws_context_per_thread *pt;
+-	int n, m;
++	int n, m=0;
+ 
+ 	for (n = 0; n < context->count_threads; n++) {
+ 		int budget = 10000;
-- 
2.7.4
