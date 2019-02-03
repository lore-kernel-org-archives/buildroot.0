From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 3 Feb 2019 21:49:20 +0100
Subject: [Buildroot] [git commit] package/openssh: Set /var/empty permissions
Message-ID: <20190203205036.585908259E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f85665c58562a967e3dcb5f72fa8af0a606c9274
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The openssh privilege separation feature, enabled by default,
requires that the path /var/empty exists and has certain permissions
(not writable by the sshd user). Note that nothing ever gets writting
in this directory, so it works fine on a readonly rootfs.

See README.privsep included as part of the openssh distribution.

Signed-off-by: Chris Lesiak <chris.lesiak@licor.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/openssh/openssh.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 4ee7727fb9..4781cd3fbc 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -23,6 +23,10 @@ define OPENSSH_USERS
 	sshd -1 sshd -1 * - - - SSH drop priv user
 endef
 
+define OPENSSH_PERMISSIONS
+	/var/empty d 755 root root - - - - -
+endef
+
 ifeq ($(BR2_TOOLCHAIN_SUPPORTS_PIE),)
 OPENSSH_CONF_OPTS += --without-pie
 endif
