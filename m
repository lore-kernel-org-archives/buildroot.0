From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 24 Mar 2015 19:54:16 +0100
Subject: [Buildroot] [PATCH 2/2 v4] system: allow/disallow root login,
	accept encoded passwords
In-Reply-To: <cover.1427223149.git.yann.morin.1998@free.fr>
References: <cover.1427223149.git.yann.morin.1998@free.fr>
Message-ID: <a13aae8e9670b5cb069379dee94735deb3663f21.1427223149.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lorenzo Catucci <lorenzo@sancho.ccd.uniroma2.it>

Currently, there is only three possibilities regarding the root account:
  - it is enabled with no password (the default)
  - it is enabled, using a clear-text, user-provided password
  - it is disabled if the user sets the clear-text password to '*'

This is deemed insufficient in many cases, especially when the .config
file has to be published (e.g. for the GPL compliance, or any other
reason.).

Fix that in two ways:

  - add a bolean option that allows/diesaloows root login altogether,
    which defaults to 'y' to keep backward compatibility;

  - accept already-encoded passwords, which we recognise as starting
    with either of $1$, $5$ or $6$ (resp. for md5, sha256 or sha512).
    For backward-compatibility, we stil accept '*' to disable the
    account.

Signed-off-by: Lorenzo M. Catucci <lorenzo@sancho.ccd.uniroma2.it>
[yann.morin.1998 at free.fr:
  - don't add a choice to select between clear-text/encoded password,
    use a single prompt;
  - differentiate in the password hook itself;
  - rewrite parts of the help entry;
  - rewrite and expand the commit log
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

---
Note: this can only go in if DES encoded is ditched, because its
character-space is the same as for clear-text passwords.
---
 system/Config.in | 28 +++++++++++++++++++---------
 system/system.mk | 24 ++++++++++++++++++++----
 2 files changed, 39 insertions(+), 13 deletions(-)

diff --git a/system/Config.in b/system/Config.in
index 8621def..17a626b 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -179,26 +179,36 @@ endif
 
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
index 4a1eb4a..2ac5d08 100644
--- a/system/system.mk
+++ b/system/system.mk
@@ -34,7 +34,7 @@ endef
 TARGET_FINALIZE_HOOKS += SYSTEM_ISSUE
 endif
 
-ifneq ($(TARGET_GENERIC_ROOT_PASSWD),)
+ifneq ($(BR2_TARGET_ENABLE_ROOT_LOGIN),)
 TARGETS += host-mkpasswd
 endif
 
@@ -70,9 +70,25 @@ TARGET_FINALIZE_HOOKS += SET_NETWORK
 ifeq ($(BR2_ROOTFS_SKELETON_DEFAULT),y)
 
 define SYSTEM_ROOT_PASSWD
-	[ -n "$(TARGET_GENERIC_ROOT_PASSWD)" ] && \
-		TARGET_GENERIC_ROOT_PASSWD_HASH=$$($(MKPASSWD) -m "$(TARGET_GENERIC_PASSWD_METHOD)" "$(TARGET_GENERIC_ROOT_PASSWD)"); \
-	$(SED) "s,^root:[^:]*:,root:$$TARGET_GENERIC_ROOT_PASSWD_HASH:," $(TARGET_DIR)/etc/shadow
+	if [ "$(BR2_TARGET_ENABLE_ROOT_LOGIN)" = "y" ]; then \
+		case '$(TARGET_GENERIC_ROOT_PASSWD)' in \
+		("") \
+			ROOT_PASSWD=""; \
+		;; \
+		("$$1$$"*|"$$5$$"*|"$$6$$"*) \
+			ROOT_PASSWD='$(TARGET_GENERIC_ROOT_PASSWD)'; \
+		;; \
+		('*') \
+			ROOT_PASSWD='*'; \
+		;; \
+		(*) \
+			ROOT_PASSWD=$$($(MKPASSWD) -m "$(TARGET_GENERIC_PASSWD_METHOD)" "$(TARGET_GENERIC_ROOT_PASSWD)"); \
+		;; \
+		esac; \
+	else \
+		ROOT_PASSWD='*'; \
+	fi; \
+	$(SED) "s,^root:[^:]*:,root:$${ROOT_PASSWD}:," $(TARGET_DIR)/etc/shadow
 endef
 TARGET_FINALIZE_HOOKS += SYSTEM_ROOT_PASSWD
 
-- 
1.9.1
