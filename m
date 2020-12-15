From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 15 Dec 2020 21:17:49 +0100
Subject: [Buildroot] [git commit] package/libeXosip2: bump to version 5.2.0
Message-ID: <20201215200349.913CA7FFE0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d409f8b4187bd0092daae61de95ba94d1463fa8f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop patch (already in version)
- Update indentation in hash file (two spaces)

https://git.savannah.nongnu.org/cgit/exosip.git/tree/ChangeLog?h=5.2.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Acked-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...D-compilation-error-introduced-with-epoll.patch | 44 ----------------------
 package/libeXosip2/libeXosip2.hash                 |  4 +-
 package/libeXosip2/libeXosip2.mk                   |  2 +-
 3 files changed, 3 insertions(+), 47 deletions(-)

diff --git a/package/libeXosip2/0001-fix-fix-OSIP_MONOTHREAD-compilation-error-introduced-with-epoll.patch b/package/libeXosip2/0001-fix-fix-OSIP_MONOTHREAD-compilation-error-introduced-with-epoll.patch
deleted file mode 100644
index b69455bd7a..0000000000
--- a/package/libeXosip2/0001-fix-fix-OSIP_MONOTHREAD-compilation-error-introduced-with-epoll.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 0e0e95dbc380c5eede3a2fc1631294a98078e30f Mon Sep 17 00:00:00 2001
-From: Aymeric Moizard <amoizard@gmail.com>
-Date: Fri, 13 Mar 2020 16:34:41 +0100
-Subject: fix: fix OSIP_MONOTHREAD compilation error introduced with epoll
- implementation
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-http://git.savannah.nongnu.org/cgit/exosip.git/patch/?id=0e0e95dbc380c5eede3a2fc1631294a98078e30f]
----
- src/eXconf.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/src/eXconf.c b/src/eXconf.c
-index baf90be..6165eb3 100644
---- a/src/eXconf.c
-+++ b/src/eXconf.c
-@@ -801,12 +801,15 @@ eXosip_init (struct eXosip_t *excontext)
-   }
- 
-   if (excontext->poll_method == EXOSIP_USE_EPOLL_LT) {
-+#ifndef OSIP_MONOTHREAD
-     struct epoll_event ev;
-+#endif
-     excontext->epfdctl = epoll_create (1);
-     if (excontext->epfdctl < 0) {
-       return OSIP_UNDEFINED_ERROR;
-     }
-     
-+#ifndef OSIP_MONOTHREAD
-     memset(&ev, 0, sizeof(struct epoll_event));
-     ev.events = EPOLLIN;
-     ev.data.fd = jpipe_get_read_descr (excontext->j_socketctl_event);
-@@ -815,6 +818,7 @@ eXosip_init (struct eXosip_t *excontext)
-       _eXosip_closesocket (excontext->epfdctl);
-       return OSIP_UNDEFINED_ERROR;
-     }
-+#endif
-   }
- #endif
-   
--- 
-cgit v1.2.1
-
diff --git a/package/libeXosip2/libeXosip2.hash b/package/libeXosip2/libeXosip2.hash
index a7d3c56d00..53e27e929c 100644
--- a/package/libeXosip2/libeXosip2.hash
+++ b/package/libeXosip2/libeXosip2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 21420c00bf8e0895ff36161766beec12b7e6f1d371030c389dba845e271272e2 libexosip2-5.1.1.tar.gz
-sha256 32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670 COPYING
+sha256  e3ae88df8573c9e08dbc24fe6195a118845e845109a8e291c91ecd6a2a3b7225  libexosip2-5.2.0.tar.gz
+sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/libeXosip2/libeXosip2.mk b/package/libeXosip2/libeXosip2.mk
index 4bd8922b41..dba2b63a02 100644
--- a/package/libeXosip2/libeXosip2.mk
+++ b/package/libeXosip2/libeXosip2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEXOSIP2_VERSION = 5.1.1
+LIBEXOSIP2_VERSION = 5.2.0
 # Since version 5.0, letter 'X' in library's name is in lower case
 LIBEXOSIP2_SOURCE = libexosip2-$(LIBEXOSIP2_VERSION).tar.gz
 LIBEXOSIP2_SITE = http://download.savannah.gnu.org/releases/exosip
