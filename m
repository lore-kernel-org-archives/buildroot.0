From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 10 Apr 2015 23:42:07 +0200
Subject: [Buildroot] [PATCHv5] system: allow/disallow root login,
	accept encoded passwords
Message-ID: <1428702127-17152-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lorenzo Catucci <lorenzo@sancho.ccd.uniroma2.it>

Currently, there is only two possibilities regarding the root account:
  - it is enabled with no password (the default)
  - it is enabled, using a clear-text, user-provided password

This is deemed insufficient in many cases, especially when the .config
file has to be published (e.g. for the GPL compliance, or any other
reason.).

Fix that in two ways:

  - add a bolean option that allows/disallows root login altogether,
    which defaults to 'y' to keep backward compatibility;

  - accept already-encoded passwords, which we recognise as starting
    with either of $1$, $5$ or $6$ (resp. for md5, sha256 or sha512).

Signed-off-by: Lorenzo M. Catucci <lorenzo@sancho.ccd.uniroma2.it>
[yann.morin.1998 at free.fr:
  - don't add a choice to select between clear-text/encoded password,
    use a single prompt;
  - differentiate in the password hook itself;
  - rewrite parts of the help entry;
  - rewrite and expand the commit log
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

---
Changes v4 -> v5:
  - use makefile syntax instead of shell  (Thomas)
  - typoes  (Thomas)
  - fix up the commit log (it never was possible to disable root login)
---
 system/Config.in | 28 +++++++++++++++++++---------
 system/system.mk | 22 ++++++++++++++++------
 2 files changed, 35 insertions(+), 15 deletions(-)

diff --git a/system/Config.in b/system/Config.in
index 431524d..6ba34ba 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -177,26 +177,36 @@ endif
 
 if BR2_ROOTFS_SKELETON_DEFAULT
 
+config BR2_TARGET_ENABLE_ROOT_LOGIN
+	bool "Enable root login"
+	default "y"
+	help
+	  Enable root login password
+
 config BR2_TARGET_GENERIC_ROOT_PASSWD
 	string "Root password"
 	default ""
+	depends on BR2_TARGET_ENABLE_ROOT_LOGIN
 	help
-	  Set the initial root password (in clear). It will be md5-encrypted.
+	  Set the initial root password.
 
 	  If set to empty (the default), then no root password will be set,
 	  and root will need no password to log in.
 
-	  WARNING! WARNING!
-	  Although pretty strong, MD5 is now an old hash function, and
-	  suffers from some weaknesses, which makes it susceptible to attacks.
-	  It is showing its age, so this root password should not be trusted
-	  to properly secure any product that can be shipped to the wide,
-	  hostile world.
+	  If the password starts with any of $1$, $5$ or $6$, it is considered
+	  to be already crypt-encoded with respectively md5, sha256 or sha512.
+	  Any other value is taken to be a clear-text value, and is crypt-encoded
+	  as per the "Passwords encoding" scheme, above.
+
+	  Note: "$" signs in the hashed password must be doubled. For example,
+	  if the hashed password is "$1$longsalt$v35DIIeMo4yUfI23yditq0", then
+	  you must enter it as "$$1$$longsalt$$v35DIIeMo4yUfI23yditq0".
 
 	  WARNING! WARNING!
-	  The password appears in clear in the .config file, and may appear
+	  The password appears as-is in the .config file, and may appear
 	  in the build log! Avoid using a valuable password if either the
-	  .config file or the build log may be distributed!
+	  .config file or the build log may be distributed, or at the
+	  very least use a strong cryptographic hash for your password!
 
 choice
 	bool "/bin/sh"
diff --git a/system/system.mk b/system/system.mk
index 4a1eb4a..b500a01 100644
--- a/system/system.mk
+++ b/system/system.mk
@@ -34,7 +34,7 @@ endef
 TARGET_FINALIZE_HOOKS += SYSTEM_ISSUE
 endif
 
-ifneq ($(TARGET_GENERIC_ROOT_PASSWD),)
+ifeq ($(BR2_TARGET_ENABLE_ROOT_LOGIN),y)
 TARGETS += host-mkpasswd
 endif
 
@@ -69,12 +69,22 @@ TARGET_FINALIZE_HOOKS += SET_NETWORK
 
 ifeq ($(BR2_ROOTFS_SKELETON_DEFAULT),y)
 
-define SYSTEM_ROOT_PASSWD
-	[ -n "$(TARGET_GENERIC_ROOT_PASSWD)" ] && \
-		TARGET_GENERIC_ROOT_PASSWD_HASH=$$($(MKPASSWD) -m "$(TARGET_GENERIC_PASSWD_METHOD)" "$(TARGET_GENERIC_ROOT_PASSWD)"); \
-	$(SED) "s,^root:[^:]*:,root:$$TARGET_GENERIC_ROOT_PASSWD_HASH:," $(TARGET_DIR)/etc/shadow
+ifeq ($(BR2_TARGET_ENABLE_ROOT_LOGIN),y)
+ifeq ($(TARGET_GENERIC_ROOT_PASSWD),)
+SYSTEM_ROOT_PASSWORD =
+else ifneq ($(or $(filter $$1$$%,$(TARGET_GENERIC_ROOT_PASSWD)),$(filter $$5$$%,$(TARGET_GENERIC_ROOT_PASSWD)),$(filter $$6$$%,$(TARGET_GENERIC_ROOT_PASSWD))),)
+SYSTEM_ROOT_PASSWORD = $(TARGET_GENERIC_ROOT_PASSWD)
+else
+SYSTEM_ROOT_PASSWORD = $(shell $(MKPASSWD) -m "$(TARGET_GENERIC_PASSWD_METHOD)" "$(TARGET_GENERIC_ROOT_PASSWD)")
+endif
+else # !BR2_TARGET_ENABLE_ROOT_LOGIN
+SYSTEM_ROOT_PASSWORD = *
+endif
+
+define SYSTEM_SET_ROOT_PASSWD
+	$(SED) 's,^root:[^:]*:,root:$(SYSTEM_ROOT_PASSWORD):,' $(TARGET_DIR)/etc/shadow
 endef
-TARGET_FINALIZE_HOOKS += SYSTEM_ROOT_PASSWD
+TARGET_FINALIZE_HOOKS += SYSTEM_SET_ROOT_PASSWD
 
 ifeq ($(BR2_SYSTEM_BIN_SH_NONE),y)
 define SYSTEM_BIN_SH
-- 
1.9.1
