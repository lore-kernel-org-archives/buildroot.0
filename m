From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 25 Mar 2020 08:36:48 +0100
Subject: [Buildroot] [PATCH v2,
 1/1] package/libeXosip2: fix build without threads
Message-ID: <20200325073648.46890-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/ec262058cc0a4bf92c381857eaf3b44412942bba

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Gilles Talis)
 - Use upstream patch

 ...pilation-error-introduced-with-epoll.patch | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 package/libeXosip2/0001-fix-fix-OSIP_MONOTHREAD-compilation-error-introduced-with-epoll.patch

diff --git a/package/libeXosip2/0001-fix-fix-OSIP_MONOTHREAD-compilation-error-introduced-with-epoll.patch b/package/libeXosip2/0001-fix-fix-OSIP_MONOTHREAD-compilation-error-introduced-with-epoll.patch
new file mode 100644
index 0000000000..b69455bd7a
--- /dev/null
+++ b/package/libeXosip2/0001-fix-fix-OSIP_MONOTHREAD-compilation-error-introduced-with-epoll.patch
@@ -0,0 +1,44 @@
+From 0e0e95dbc380c5eede3a2fc1631294a98078e30f Mon Sep 17 00:00:00 2001
+From: Aymeric Moizard <amoizard@gmail.com>
+Date: Fri, 13 Mar 2020 16:34:41 +0100
+Subject: fix: fix OSIP_MONOTHREAD compilation error introduced with epoll
+ implementation
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+http://git.savannah.nongnu.org/cgit/exosip.git/patch/?id=0e0e95dbc380c5eede3a2fc1631294a98078e30f]
+---
+ src/eXconf.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/eXconf.c b/src/eXconf.c
+index baf90be..6165eb3 100644
+--- a/src/eXconf.c
++++ b/src/eXconf.c
+@@ -801,12 +801,15 @@ eXosip_init (struct eXosip_t *excontext)
+   }
+ 
+   if (excontext->poll_method == EXOSIP_USE_EPOLL_LT) {
++#ifndef OSIP_MONOTHREAD
+     struct epoll_event ev;
++#endif
+     excontext->epfdctl = epoll_create (1);
+     if (excontext->epfdctl < 0) {
+       return OSIP_UNDEFINED_ERROR;
+     }
+     
++#ifndef OSIP_MONOTHREAD
+     memset(&ev, 0, sizeof(struct epoll_event));
+     ev.events = EPOLLIN;
+     ev.data.fd = jpipe_get_read_descr (excontext->j_socketctl_event);
+@@ -815,6 +818,7 @@ eXosip_init (struct eXosip_t *excontext)
+       _eXosip_closesocket (excontext->epfdctl);
+       return OSIP_UNDEFINED_ERROR;
+     }
++#endif
+   }
+ #endif
+   
+-- 
+cgit v1.2.1
+
-- 
2.25.1
