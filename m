From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Apr 2015 19:10:32 +0200
Subject: [Buildroot] [git commit] python-sip: fix installation of sip.h
	header
Message-ID: <20150419171955.09BD6807AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=32574fe118377511c51bfea20a7bf3e2a9c0bfb2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With the current python-sip package, the sip.h header is installed in
$(STAGING_DIR)/usr/include/python3.4/, while Python headers are
expected to be installed in $(STAGING_DIR)/usr/include/python3.4m/
(notice the 'm' at the end).

Since with this, the directory name for the headers and libraries is
not the same, this patch introduces separate PYTHON_SIP_LIB_DIR and
PYTHON_SIP_INCLUDE_DIR variables, and use them for the --destdir and
--incdir options.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-sip/python-sip.mk |   10 ++++++----
 1 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/python-sip/python-sip.mk b/package/python-sip/python-sip.mk
index 59cd1fc..4651186 100644
--- a/package/python-sip/python-sip.mk
+++ b/package/python-sip/python-sip.mk
@@ -15,11 +15,13 @@ PYTHON_SIP_DEPENDENCIES = qt
 ifeq ($(BR2_PACKAGE_PYTHON),y)
 PYTHON_SIP_DEPENDENCIES += python
 HOST_PYTHON_SIP_DEPENDENCIES += host-python
-PYTHON_SIP_PYTHON_DIR = python$(PYTHON_VERSION_MAJOR)
+PYTHON_SIP_LIB_DIR = usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages
+PYTHON_SIP_INCLUDE_DIR = usr/include/python$(PYTHON_VERSION_MAJOR)
 else ifeq ($(BR2_PACKAGE_PYTHON3),y)
 PYTHON_SIP_DEPENDENCIES += python3
 HOST_PYTHON_SIP_DEPENDENCIES += host-python3
-PYTHON_SIP_PYTHON_DIR = python$(PYTHON3_VERSION_MAJOR)
+PYTHON_SIP_LIB_DIR = usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages
+PYTHON_SIP_INCLUDE_DIR = usr/include/python$(PYTHON3_VERSION_MAJOR)m
 endif
 
 define HOST_PYTHON_SIP_CONFIGURE_CMDS
@@ -39,8 +41,8 @@ define PYTHON_SIP_CONFIGURE_CMDS
 	(cd $(@D); \
 		$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(HOST_DIR)/usr/bin/python configure.py \
 			--bindir $(TARGET_DIR)/usr/bin \
-			--destdir $(TARGET_DIR)/usr/lib/$(PYTHON_SIP_PYTHON_DIR)/site-packages \
-			--incdir $(STAGING_DIR)/usr/include/$(PYTHON_SIP_PYTHON_DIR)  \
+			--destdir $(TARGET_DIR)/$(PYTHON_SIP_LIB_DIR) \
+			--incdir $(STAGING_DIR)/$(PYTHON_SIP_INCLUDE_DIR)  \
 			--sipdir $(TARGET_DIR)/usr/share/sip \
 			--sysroot $(STAGING_DIR)/usr \
 			--use-qmake && \
