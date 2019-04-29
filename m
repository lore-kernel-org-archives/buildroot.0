From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 29 Apr 2019 09:28:29 +0200
Subject: [Buildroot] [git commit] package/bind: fix python build
Message-ID: <20190429072427.F271D813FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=89e70a7077f772cafcc602d8b560e3c954419a06
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A check for python-ply has been added as this is a dependency of the
dnssec-keymgr script so install host-python-ply to avoid a build failure
if python-ply is not installed on host

Fixes:
 - http://autobuild.buildroot.org/results/96815b1300547c976443bf74b762febdfcc8d3ba

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
 
