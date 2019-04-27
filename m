From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 27 Apr 2019 15:49:25 +0200
Subject: [Buildroot] [PATCH 1/1] package/bind: fix python build
Message-ID: <20190427134925.1730-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A check for python-ply has been added as this is a dependency of the
dnssec-keymgr script so install host-python-ply to avoid a build failure
if python-ply is not installed on host

Fixes:
 - http://autobuild.buildroot.org/results/96815b1300547c976443bf74b762febdfcc8d3ba

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/bind/bind.mk | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 356bc259b2..087ce941b0 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -70,8 +70,11 @@ else
 BIND_CONF_OPTS += --with-openssl=no
 endif
 
-# Used by dnssec-checkds and dnssec-coverage
-ifeq ($(BR2_PACKAGE_PYTHON)$(BR2_PACKAGE_PYTHON3),)
+# Used by dnssec-keymgr
+ifeq ($(BR2_PACKAGE_PYTHON_PLY),y)
+BIND_DEPENDENCIES += host-python-ply
+BIND_CONF_OPTS += --with-python=$(HOST_DIR)/usr/bin/python
+else
 BIND_CONF_OPTS += --with-python=no
 endif
 
-- 
2.20.1
