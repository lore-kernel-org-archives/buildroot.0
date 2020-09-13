From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 Sep 2020 16:20:52 +0200
Subject: [Buildroot] [git commit] package/python: do not install MS Windows
 installers on the target
Message-ID: <20200913141208.A3E0483A5C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a7e71716f5fed63e3634e40eb3f069d2baebfbf1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python/python.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python/python.mk b/package/python/python.mk
index 1a3a60bbac..10718f4358 100644
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
