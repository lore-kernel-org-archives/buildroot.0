From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Sat, 12 Sep 2020 13:56:22 +0200
Subject: [Buildroot] [PATCH 2/2] package/python: do not install MS Windows
 installers on the target
In-Reply-To: <20200912115622.134543-1-titouan.christophe@railnova.eu>
References: <20200912115622.134543-1-titouan.christophe@railnova.eu>
Message-ID: <20200912115622.134543-2-titouan.christophe@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Buildroot generates Linux systems, so there is no need to have
MS Windows executables in there.

This reduces the target filesystem size by about 600kB:
$ du -hcs usr/lib/python2.7/distutils/command/wininst-*.exe
60K usr/lib/python2.7/distutils/command/wininst-6.0.exe
64K usr/lib/python2.7/distutils/command/wininst-7.1.exe
60K usr/lib/python2.7/distutils/command/wininst-8.0.exe
192K    usr/lib/python2.7/distutils/command/wininst-9.0.exe
220K    usr/lib/python2.7/distutils/command/wininst-9.0-amd64.exe
596K    total

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
---
 package/python/python.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python/python.mk b/package/python/python.mk
index ccaaadd012..a08732cb22 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -199,6 +199,7 @@ define PYTHON_REMOVE_USELESS_FILES
 	rm -f $(TARGET_DIR)/usr/bin/python2-config
 	rm -f $(TARGET_DIR)/usr/bin/python-config
 	rm -f $(TARGET_DIR)/usr/bin/smtpd.py
+	rm -f $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/distutils/command/wininst*.exe
 	for i in `find $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/config/ \
 		-type f -not -name pyconfig.h -a -not -name Makefile` ; do \
 		rm -f $$i ; \
-- 
2.25.3
