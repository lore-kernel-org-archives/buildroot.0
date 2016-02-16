From: Niranjan Reddy <niranjan.reddy@rockwellcollins.com>
Date: Tue, 16 Feb 2016 11:48:18 +0530
Subject: [Buildroot] [Buildroot PATCH Selinux v10 03/11] linux-pam: selinux
	system auth
In-Reply-To: <1455603506-26138-1-git-send-email-niranjan.reddy@rockwellcollins.com>
References: <1455603506-26138-1-git-send-email-niranjan.reddy@rockwellcollins.com>
Message-ID: <1455603506-26138-3-git-send-email-niranjan.reddy@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Niranjan <niranjan.reddy@rockwellcollins.com>

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Niranjan <niranjan.reddy@rockwellcollins.com>

---
Changes v9 -> v10:
  - Dropped host linux-pam variant,optional selinux and audit dependencies and created seperate
    Patches (Suggedted by Thomas).

Changes v8 -> v9:
  - No changes

Changes v7 -> v8:
  - Removed sub-shell around the config file install block and
    refactored the block to use absolute paths for the copying
    (Suggested by Samuel)
  - Changed the enable-db=no configure option to disable-db to be
    consistent with the rest of the configure options (Suggested by
    Samuel)

Changes v6 -> v7:
  - Added missing host-pkgconf dependency and removed unneeded
    host-autoconf dependency(Clayton S.)

Changes v5 -> v6:
  - No changes

Changes v4 -> v5:
  - Dropping unneeded patch (Clayton S.)

Changes v1 -> v4:
  - Did not exist
---
 package/linux-pam/system-auth.pamd | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 package/linux-pam/system-auth.pamd

diff --git a/package/linux-pam/system-auth.pamd b/package/linux-pam/system-auth.pamd
new file mode 100644
index 0000000..2fa116a
--- /dev/null
+++ b/package/linux-pam/system-auth.pamd
@@ -0,0 +1,15 @@
+#%PAM-1.0
+auth        required      pam_env.so
+auth        sufficient    pam_unix.so
+auth        required      pam_deny.so
+
+account     required      pam_unix.so
+
+#password    required      pam_cracklib.so try_first_pass retry=3
+password    sufficient    pam_unix.so md5 shadow try_first_pass
+password    required      pam_deny.so
+
+session     optional      pam_keyinit.so revoke
+session     required      pam_limits.so
+session     [success=1 default=ignore] pam_succeed_if.so service in crond quiet use_uid
+session     required      pam_unix.so
-- 
2.5.0
