From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 11 Mar 2020 20:52:55 +0100
Subject: [Buildroot] [PATCH 1/1] package/libeXosip2: fix build without
 threads
Message-ID: <20200311195255.115690-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/7b5f049fda390a7961b5a7fde42ea5aebe1f7564

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...c-eXconf.c-fix-build-without-threads.patch | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 package/libeXosip2/0001-src-eXconf.c-fix-build-without-threads.patch

diff --git a/package/libeXosip2/0001-src-eXconf.c-fix-build-without-threads.patch b/package/libeXosip2/0001-src-eXconf.c-fix-build-without-threads.patch
new file mode 100644
index 0000000000..faaec5b377
--- /dev/null
+++ b/package/libeXosip2/0001-src-eXconf.c-fix-build-without-threads.patch
@@ -0,0 +1,43 @@
+From 618bd5edee8b1a93fbdf9e4a838e3c9cefcce6a7 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 11 Mar 2020 20:43:48 +0100
+Subject: [PATCH] src/eXconf.c: fix build without threads
+
+Fix the following build failure without threads:
+
+eXconf.c:812:49: error: 'struct eXosip_t' has no member named 'j_socketctl_event'
+     ev.data.fd = jpipe_get_read_descr (excontext->j_socketctl_event);
+                                                 ^~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/7b5f049fda390a7961b5a7fde42ea5aebe1f7564
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://savannah.nongnu.org/bugs/index.php?57985]
+---
+ src/eXconf.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/eXconf.c b/src/eXconf.c
+index baf90be..cf8b4f7 100644
+--- a/src/eXconf.c
++++ b/src/eXconf.c
+@@ -807,6 +807,7 @@ eXosip_init (struct eXosip_t *excontext)
+       return OSIP_UNDEFINED_ERROR;
+     }
+     
++#ifndef OSIP_MONOTHREAD 
+     memset(&ev, 0, sizeof(struct epoll_event));
+     ev.events = EPOLLIN;
+     ev.data.fd = jpipe_get_read_descr (excontext->j_socketctl_event);
+@@ -815,6 +816,7 @@ eXosip_init (struct eXosip_t *excontext)
+       _eXosip_closesocket (excontext->epfdctl);
+       return OSIP_UNDEFINED_ERROR;
+     }
++#endif
+   }
+ #endif
+   
+-- 
+2.25.1
+
-- 
2.25.1
