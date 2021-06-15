From: Hubert Lacote <hubert.lacote@gmail.com>
Date: Tue, 15 Jun 2021 16:03:02 +0200
Subject: [Buildroot] [PATCH] package/gawk: create awk symlink for host-gawk
Message-ID: <20210615140302.2485993-1-hubert.lacote@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Hubert Lacote <hubert.lacote@youview.com>

This is to make sure that host packages that depend on `host-gawk` and that use
`awk` end up using `gawk`, instead of the `awk` symlink installed on the host
system.

On recent Debian-based distributions, `awk` is still symlinked to `mawk` [1].

[1] https://bugs.launchpad.net/ubuntu/+source/mawk/+bug/1841654

Signed-off-by: Hubert Lacote <hubert.lacote@youview.com>
Co-authored-by: Hubert Lacote <hubert.lacote@youview.com>
Co-authored-by: Vicente Olivert Riera <vincent.olivert.riera@youview.com>
---
 package/gawk/gawk.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/gawk/gawk.mk b/package/gawk/gawk.mk
index 16906f6f93..ab7088e90e 100644
--- a/package/gawk/gawk.mk
+++ b/package/gawk/gawk.mk
@@ -33,6 +33,12 @@ endif
 
 HOST_GAWK_CONF_OPTS = --without-readline --without-mpfr
 
+define HOST_GAWK_CREATE_SYMLINK
+	ln -sf gawk $(HOST_DIR)/usr/bin/awk
+endef
+
+HOST_GAWK_POST_INSTALL_HOOKS += HOST_GAWK_CREATE_SYMLINK
+
 define GAWK_CREATE_SYMLINK
 	ln -sf gawk $(TARGET_DIR)/usr/bin/awk
 endef
-- 
2.25.1
