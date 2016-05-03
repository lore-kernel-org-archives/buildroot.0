From: Martin Bark <martin@barkynet.com>
Date: Tue,  3 May 2016 12:46:16 +0100
Subject: [Buildroot] [PATCH 1/1] package/ca-certificates: use host-python
Message-ID: <1462275976-31982-1-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The ca-certificates Makefile directly calls python and hence does not
pickup the buildroot host-python.

During the build all the Makefile does is execute mozilla/certdata2pem.py.
Simplify the build process by directly calling this script using
host-python.

This fixes:
 http://autobuild.buildroot.net/results/a2a4fed293c836b9cf63ff2aaa463b0704dec07e/
 http://autobuild.buildroot.net/results/bbed4afa8e30382b8892062f31ba64cbb0ea14e4/
 http://autobuild.buildroot.net/results/1af5562be3c0d233cea81834a898f7ac6ae48271/

Signed-off-by: Martin Bark <martin@barkynet.com>

---
Note: to reproduce the auto build errors you need to have python 2.6
installed on the host.
---
 package/ca-certificates/ca-certificates.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/ca-certificates/ca-certificates.mk b/package/ca-certificates/ca-certificates.mk
index da1b70d..8a3389f 100644
--- a/package/ca-certificates/ca-certificates.mk
+++ b/package/ca-certificates/ca-certificates.mk
@@ -12,7 +12,8 @@ CA_CERTIFICATES_LICENSE = GPLv2+ (script), MPLv2.0 (data)
 CA_CERTIFICATES_LICENSE_FILES = debian/copyright
 
 define CA_CERTIFICATES_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) all
+	cd $(@D)/mozilla ;\
+		$(HOST_DIR)/usr/bin/python2 ./certdata2pem.py
 endef
 
 define CA_CERTIFICATES_INSTALL_TARGET_CMDS
-- 
2.7.4
