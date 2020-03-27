From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 27 Mar 2020 10:06:08 +0100
Subject: [Buildroot] [git commit] package/libeXosip2: fix build without
 threads
Message-ID: <20200327085250.3ED948345A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=86cd05b675881db9aeea3ca4b83ff232e90e69dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/ec262058cc0a4bf92c381857eaf3b44412942bba

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...D-compilation-error-introduced-with-epoll.patch | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)

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
