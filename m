From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Sat, 12 Sep 2020 13:56:21 +0200
Subject: [Buildroot] [PATCH 1/2] package/python3: do not install MS Windows
 installers on the target
Message-ID: <20200912115622.134543-1-titouan.christophe@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Buildroot generates Linux systems, so there is no need to have
MS Windows executables in there.

This reduces the target filesystem size by about 2MB:
$ du -hcs usr/lib/python3.8/distutils/command/wininst-*.exe
60K usr/lib/python3.8/distutils/command/wininst-6.0.exe
64K usr/lib/python3.8/distutils/command/wininst-7.1.exe
60K usr/lib/python3.8/distutils/command/wininst-8.0.exe
192K    usr/lib/python3.8/distutils/command/wininst-9.0.exe
220K    usr/lib/python3.8/distutils/command/wininst-9.0-amd64.exe
188K    usr/lib/python3.8/distutils/command/wininst-10.0.exe
220K    usr/lib/python3.8/distutils/command/wininst-10.0-amd64.exe
448K    usr/lib/python3.8/distutils/command/wininst-14.0.exe
576K    usr/lib/python3.8/distutils/command/wininst-14.0-amd64.exe
2,0M    total

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
---
 package/python3/python3.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 31e7ca3d3a..3c2f71e448 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -212,6 +212,7 @@ define PYTHON3_REMOVE_USELESS_FILES
 	rm -f $(TARGET_DIR)/usr/bin/python$(PYTHON3_VERSION_MAJOR)m-config
 	rm -f $(TARGET_DIR)/usr/bin/python3-config
 	rm -f $(TARGET_DIR)/usr/bin/smtpd.py.3
+	rm -f $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/distutils/command/wininst*.exe
 	for i in `find $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/config-$(PYTHON3_VERSION_MAJOR)m-*/ \
 		-type f -not -name Makefile` ; do \
 		rm -f $$i ; \
-- 
2.25.3
