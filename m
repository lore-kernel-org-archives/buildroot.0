From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 10 Oct 2020 22:59:54 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/fail2ban: fix
 fail2ban-python symlink
Message-ID: <20201010205005.84D5B88061@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=20878bc9ce518e7e174cbee4d4c0336912986c72
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Fixes (reproducible):
http://autobuild.buildroot.net/results/50f/50f199bfe06d054cc6770760e73ac0de594a0670/diffoscope-results.txt

Fail2ban installs the fail2ban-python symlink pointing to the host python
intepreter used to run setup.py, which is naturally not valid at runtime and
breaks the reproducible tests as shown in the diffoscope results:

??? -lrwxrwxrwx   0        0        0        0 2020-10-04 10:50:38.000000 ./usr/bin/fail2ban-python -> /home/naourr/work/instance-0/output-1/host/bin/python
??? +lrwxrwxrwx   0        0        0        0 2020-10-04 10:50:38.000000 ./usr/bin/fail2ban-python -> /home/naourr/work/instance-0/output-2/host/bin/python

As a workaround, update the symlink after installation to point to the
correct target python.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 084ffc69be6836fef071782943102fe1bbe4956d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fail2ban/fail2ban.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/fail2ban/fail2ban.mk b/package/fail2ban/fail2ban.mk
index a0a2dc704b..a4ee0852cc 100644
--- a/package/fail2ban/fail2ban.mk
+++ b/package/fail2ban/fail2ban.mk
@@ -27,6 +27,13 @@ define FAIL2BAN_FIX_DEFAULT_CONFIG
 endef
 FAIL2BAN_POST_INSTALL_TARGET_HOOKS += FAIL2BAN_FIX_DEFAULT_CONFIG
 
+# fail2ban-python points to host python
+define FAIL2BAN_FIX_FAIL2BAN_PYTHON_SYMLINK
+	ln -snf $(if $(BR2_PACKAGE_PYTHON),python,python3) \
+		$(TARGET_DIR)/usr/bin/fail2ban-python
+endef
+FAIL2BAN_POST_INSTALL_TARGET_HOOKS += FAIL2BAN_FIX_FAIL2BAN_PYTHON_SYMLINK
+
 define FAIL2BAN_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 755 package/fail2ban/S60fail2ban \
 		$(TARGET_DIR)/etc/init.d/S60fail2ban
