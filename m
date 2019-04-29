From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 29 Apr 2019 10:33:15 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/bind: fix python
 build
Message-ID: <20190429082817.78CBB83B74@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b301c953c2fda4112b41a0ca1683c9de1e80ff63
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

A check for python-ply has been added as this is a dependency of the
dnssec-keymgr script so install host-python-ply to avoid a build failure
if python-ply is not installed on host

Fixes:
 - http://autobuild.buildroot.org/results/96815b1300547c976443bf74b762febdfcc8d3ba

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 89e70a7077f772cafcc602d8b560e3c954419a06)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bind/bind.mk | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index c3149394b0..42c240a747 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -74,8 +74,11 @@ else
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
 
