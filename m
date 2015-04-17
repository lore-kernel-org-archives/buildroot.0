From: Ivo Slanina <ivo.slanina@gmail.com>
Date: Fri, 17 Apr 2015 14:08:57 +0200
Subject: [Buildroot] [PATCH 1/1] package/systemd: fix
	/usr/lib/tmpfiles.d/etc.conf
Message-ID: <1429272537-20122-1-git-send-email-ivo.slanina@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Current systemd version (219) has bug in tmpfiles.d/etc.conf.m4 file.
Bug causes adding line

    C /etc/pam.d - - - -

into /usr/lib/tmpfiles.d/etc.conf, regardless of wheter systemd is configured
with --disable-pam option or not. Since systemd is always compiled with this
option, that line causes fauilure in systemd systemd-tmpfiles-setup.service
unit during boot.

Failure is caused becase systemd is trying to copy directory /usr/share/factory/etc/pam.d/
into /etc, which doesn't exist.

This patch adds 0004-only-copy-etc-pam.d-if-pam-is-present.patch file into
systemd package directory to fix downloaded source tree.

This issue is also solved in systemd source, but isn't released yet. After
release and appropriate package upgrade, this patch will be no more relevant
and should be removed.
(http://lists.freedesktop.org/archives/systemd-devel/2015-March/028937.html)

Signed-off-by: Ivo Slanina <ivo.slanina@gmail.com>
---
 .../0004-only-copy-etc-pam.d-if-pam-is-present.patch   | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 package/systemd/0004-only-copy-etc-pam.d-if-pam-is-present.patch

diff --git a/package/systemd/0004-only-copy-etc-pam.d-if-pam-is-present.patch b/package/systemd/0004-only-copy-etc-pam.d-if-pam-is-present.patch
new file mode 100644
index 0000000..983b931
--- /dev/null
+++ b/package/systemd/0004-only-copy-etc-pam.d-if-pam-is-present.patch
@@ -0,0 +1,18 @@
+only copy /etc/pam.d if PAM is present
+
+This patch is taken from systemd source.
+See http://lists.freedesktop.org/archives/systemd-devel/2015-March/028937.html
+
+Current systemd release doesn? contain patched tmpfiles.d/etc.conf.m4
+file. After releasing new systemd version and bumbing to it, this patch
+should be no longer needed.
+
+--- systemd-219.orig/tmpfiles.d/etc.conf.m4	2015-04-17 11:37:41.451001621 +0200
++++ systemd-219/tmpfiles.d/etc.conf.m4	2015-04-17 11:38:43.738749756 +0200
+@@ -14,4 +14,6 @@
+ L /etc/resolv.conf - - - - ../run/systemd/resolve/resolv.conf
+ )m4_dnl
+ C /etc/nsswitch.conf - - - -
++m4_ifdef(`HAVE_PAM',
+ C /etc/pam.d - - - -
++)m4_dnl
-- 
2.1.4
