From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Thu,  3 Nov 2016 21:29:31 -0400
Subject: [Buildroot] [PATCH 2/2] python3: improve reproducability
In-Reply-To: <1478222971-2250-1-git-send-email-danomimanchego123@gmail.com>
References: <1478222971-2250-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <1478222971-2250-2-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The readline, ssl, bzip2, xz, and zlip options work simply by adding
dependencies; there is no specific configure switch for them.  Therefore,
if those external dependencies are selected independent of python3, then
they can affect its compilation.  So if those packages are selected outside
of python3, make them go first.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/python3/python3.mk | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index b3f31c0..93c0962 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -53,7 +53,7 @@ HOST_PYTHON3_DEPENDENCIES = host-expat host-zlib
 
 PYTHON3_INSTALL_STAGING = YES
 
-ifeq ($(BR2_PACKAGE_PYTHON3_READLINE),y)
+ifneq ($(BR2_PACKAGE_PYTHON3_READLINE)$(BR2_PACKAGE_READLINE),)
 PYTHON3_DEPENDENCIES += readline
 endif
 
@@ -87,7 +87,7 @@ else
 PYTHON3_CONF_OPTS += --disable-sqlite3
 endif
 
-ifeq ($(BR2_PACKAGE_PYTHON3_SSL),y)
+ifneq ($(BR2_PACKAGE_PYTHON3_SSL)$(BR2_PACKAGE_OPENSSL),)
 PYTHON3_DEPENDENCIES += openssl
 endif
 
@@ -99,15 +99,15 @@ ifneq ($(BR2_PACKAGE_PYTHON3_UNICODEDATA),y)
 PYTHON3_CONF_OPTS += --disable-unicodedata
 endif
 
-ifeq ($(BR2_PACKAGE_PYTHON3_BZIP2),y)
+ifneq ($(BR2_PACKAGE_PYTHON3_BZIP2)$(BR2_PACKAGE_BZIP2),)
 PYTHON3_DEPENDENCIES += bzip2
 endif
 
-ifeq ($(BR2_PACKAGE_PYTHON3_XZ),y)
+ifneq ($(BR2_PACKAGE_PYTHON3_XZ)$(BR2_PACKAGE_XZ),)
 PYTHON3_DEPENDENCIES += xz
 endif
 
-ifeq ($(BR2_PACKAGE_PYTHON3_ZLIB),y)
+ifneq ($(BR2_PACKAGE_PYTHON3_ZLIB)$(BR2_PACKAGE_ZLIB),)
 PYTHON3_DEPENDENCIES += zlib
 endif
 
-- 
1.9.1
