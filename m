From: Charles Hardin <ckhardin@exablox.com>
Date: Thu, 8 Sep 2016 13:54:00 -0700
Subject: [Buildroot] [FYI] jemalloc and valgrind
Message-ID: <D7C5A212-77BA-44BA-9FDE-35F0CA5FAA86@exablox.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

So, we hit an oddity on a ?debug? build which turned out to be that if we have
valgrind installed - jemalloc would race and if it got build before valgrind then
it would not detect it.

I?ll try to make this a format patch later - but this is off another tree and so simple
that if someone wants to add it - I would suggest you do.

diff --git a/package/jemalloc/jemalloc.mk b/package/jemalloc/jemalloc.mk
index 7086dfa..71d6200 100644
--- a/package/jemalloc/jemalloc.mk
+++ b/package/jemalloc/jemalloc.mk
@@ -11,5 +11,10 @@ JEMALLOC_LICENSE = BSD-2c
 JEMALLOC_LICENSE_FILES = COPYING
 JEMALLOC_INSTALL_STAGING = YES
 
+ifeq ($(BR2_PACKAGE_VALGRIND),y)
+JEMALLOC_DEPENDENCIES += valgrind
+JEMALLOC_CONF_OPTS += --enable-valgrind
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160908/a9a11d15/attachment.html>
