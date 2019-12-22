From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Dec 2019 23:29:08 +0100
Subject: [Buildroot] [git commit] package/samba4: fix build without python3
Message-ID: <20191222222003.BD7A28DB1C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fe033bdf534a7892ced72c11635d863afa92d1d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

python3 is mandatory since version 4.11 and
https://gitlab.com/samba-team/samba/commit/63d20d7822ead1626f7cb41fdbae6c9300893314

The only way to build samba4 without python3 is to disable python
bindings through --disable-python option

Fixes:
 - http://autobuild.buildroot.org/results/c4bb3d41fa07e38f0360a563bdcb4a368740cfe5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/samba4/samba4.mk | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index bf9636f6e8..955de8f764 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -31,10 +31,9 @@ SAMBA4_PYTHON = \
 	PYTHON_CONFIG="$(STAGING_DIR)/usr/bin/python3-config"
 SAMBA4_DEPENDENCIES += host-python3 python3
 else
-SAMBA4_PYTHON = \
-	PYTHON="$(HOST_DIR)/bin/python2" \
-	PYTHON_CONFIG="$(STAGING_DIR)/usr/bin/python-config"
-SAMBA4_DEPENDENCIES += host-python python
+SAMBA4_PYTHON = PYTHON="$(HOST_DIR)/bin/python2" 
+SAMBA4_DEPENDENCIES += host-python
+SAMBA4_CONF_OPTS += --disable-python
 endif
 
 ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
