From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 21 Sep 2019 13:47:10 +0200
Subject: [Buildroot] [git commit] package/util-linux: revert logic regarding
 pam_selinux module
Message-ID: <20190921114556.7729C8EBEC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c3aed7b0cde43860b2c8805eabe52f17856a1a29
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Leave pam_selinux enabled by default in su.pam and remove it from the
/etc/pam.d/su and /etc/pam.d/su-l files if libselinux is not selected.

This cosmetic change prevents leaving a misleading commented-out line
that references a PAM module that does not exist.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/util-linux/su.pam        | 4 ++--
 package/util-linux/util-linux.mk | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/util-linux/su.pam b/package/util-linux/su.pam
index 84b18605ce..69b2a40c45 100644
--- a/package/util-linux/su.pam
+++ b/package/util-linux/su.pam
@@ -7,9 +7,9 @@ account		required	pam_unix.so
 
 password	required	pam_unix.so nullok
 
-# session	required	pam_selinux.so close
+session		required	pam_selinux.so close
 session		required	pam_limits.so
 session		required	pam_env.so
 session		required	pam_unix.so
 session		optional	pam_lastlog.so
-# session	required	pam_selinux.so open
+session		required	pam_selinux.so open
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 6daca6b5e6..ecc3ab62de 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -75,14 +75,14 @@ UTIL_LINUX_MAKE_OPTS += LIBS="$(UTIL_LINUX_LIBS)"
 ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
 UTIL_LINUX_DEPENDENCIES += libselinux
 UTIL_LINUX_CONF_OPTS += --with-selinux
+else
+UTIL_LINUX_CONF_OPTS += --without-selinux
 define UTIL_LINUX_SELINUX_PAMFILES_TWEAK
 	$(foreach f,su su-l,
-		$(SED) 's/^# \(.*pam_selinux.so.*\)$$/\1/' \
+		$(SED) '/^.*pam_selinux.so.*$$/d' \
 			$(TARGET_DIR)/etc/pam.d/$(f)
 	)
 endef
-else
-UTIL_LINUX_CONF_OPTS += --without-selinux
 endif
 
 # Used by cramfs utils
