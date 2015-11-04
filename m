From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Nov 2015 21:48:42 +0100
Subject: [Buildroot] [git commit] package/python-web2py: fix permissions
Message-ID: <20151104204853.DE522818EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=db89b0b983735cacc2e417f2e40cad2b265b4543
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The PYTHON_WEB2PY_PERMISSIONS table was using the user and group names
instead of the uid and gid, causing makedevs to retrieve the uid and gid
from the host system.

Signed-off-by: No?? Rubinstein <nrubinstein@aldebaran.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-web2py/python-web2py.mk |   10 +++++++++-
 1 files changed, 9 insertions(+), 1 deletions(-)

diff --git a/package/python-web2py/python-web2py.mk b/package/python-web2py/python-web2py.mk
index 313114a..db9ed8d 100644
--- a/package/python-web2py/python-web2py.mk
+++ b/package/python-web2py/python-web2py.mk
@@ -32,8 +32,16 @@ define PYTHON_WEB2PY_INSTALL_INIT_SYSTEMD
 		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/web2py.service
 endef
 
+# www-data user and group are used for web2py. Because these user and group
+# are already set by buildroot, it is not necessary to redefine them.
+# See system/skeleton/etc/passwd
+#   username: www-data    uid: 33
+#   groupname: www-data   gid: 33
+#
+# So, we just need to create the directories used by web2py with the right
+# ownership.
 define PYTHON_WEB2PY_PERMISSIONS
-	/var/www/web2py  r  750  www-data  www-data  -  -  -  -  -
+	/var/www/web2py  r  750  33  33  -  -  -  -  -
 endef
 
 $(eval $(generic-package))
