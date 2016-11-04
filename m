From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Thu,  3 Nov 2016 21:29:30 -0400
Subject: [Buildroot] [PATCH 1/2] python: improve reproducability
Message-ID: <1478222971-2250-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The readline and hashlib options work simply by adding dependencies;
there is no specific configure switch for them.  Therefore, if those
external dependencies are selected independent of python, then they
can affect its compilation.  So if those packages are selected outside
of python, make them go first.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/python/python.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python/python.mk b/package/python/python.mk
index cc65376..8c51d23 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -60,7 +60,7 @@ HOST_PYTHON_DEPENDENCIES = host-expat host-zlib
 
 PYTHON_INSTALL_STAGING = YES
 
-ifeq ($(BR2_PACKAGE_PYTHON_READLINE),y)
+ifneq ($(BR2_PACKAGE_PYTHON_READLINE)$(BR2_PACKAGE_READLINE),)
 PYTHON_DEPENDENCIES += readline
 endif
 
@@ -120,7 +120,7 @@ else
 PYTHON_CONF_OPTS += --disable-zlib
 endif
 
-ifeq ($(BR2_PACKAGE_PYTHON_HASHLIB),y)
+ifneq ($(BR2_PACKAGE_PYTHON_HASHLIB)$(BR2_PACKAGE_OPENSSL),)
 PYTHON_DEPENDENCIES += openssl
 endif
 
-- 
1.9.1
