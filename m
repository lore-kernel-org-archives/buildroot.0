From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 29 Oct 2020 23:38:48 +0100
Subject: [Buildroot] [git commit] package/libpam-tacplus: fix CVE-2020-27743
Message-ID: <20201029222624.DD0D282A4E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=70499767e510cf02e6b6771c51c8720defe99c54
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libtac in pam_tacplus through 1.5.1 lacks a check for a failure of
RAND_bytes()/RAND_pseudo_bytes(). This could lead to use of a
non-random/predictable session_id.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-for-failure-of-OpenSSL-RAND_pseudo_bytes.patch | 146 +++++++++++++++++++++
 package/libpam-tacplus/libpam-tacplus.mk           |   3 +
 2 files changed, 149 insertions(+)

diff --git a/package/libpam-tacplus/0005-Check-for-failure-of-OpenSSL-RAND_pseudo_bytes.patch b/package/libpam-tacplus/0005-Check-for-failure-of-OpenSSL-RAND_pseudo_bytes.patch
new file mode 100644
index 0000000000..ba87ca5a19
--- /dev/null
+++ b/package/libpam-tacplus/0005-Check-for-failure-of-OpenSSL-RAND_pseudo_bytes.patch
@@ -0,0 +1,146 @@
+From c9bed7496e81e550ee22746f23bbb11be2e046ed Mon Sep 17 00:00:00 2001
+From: Duncan Eastoe <duncan.eastoe@att.com>
+Date: Thu, 22 Oct 2020 19:18:27 +0100
+Subject: [PATCH] magic.c: check for failure of RAND_[pseudo_]bytes
+
+When magic() is implemented via libcrypto's RAND_bytes or
+RAND_pseudo_bytes we should check for a failure and abort to
+ensure we don't use a predictable session_id.
+
+This prevents (further) weakening* of the TACACS+ protocol
+"encryption" since session_id is an input to the algorithm.
+
+*by modern standards TACACS+ is deemed "obfuscated" - RFC 8907.
+
+[Retrieved from:
+https://github.com/kravietz/pam_tacplus/commit/468cc9d484364ecdc8bb245805f5c1fcb415fec9]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ libtac/lib/magic.c | 26 +++++++++++++++++++++-----
+ pam_tacplus.c      |  6 ++++++
+ 2 files changed, 27 insertions(+), 5 deletions(-)
+
+diff --git a/libtac/lib/magic.c b/libtac/lib/magic.c
+index e13a483..ae6b44f 100644
+--- a/libtac/lib/magic.c
++++ b/libtac/lib/magic.c
+@@ -81,26 +81,42 @@ magic()
+ 
+ #elif defined(HAVE_OPENSSL_RAND_H) && defined(HAVE_LIBCRYPTO)
+ 
++#include <openssl/err.h>
+ #include <openssl/rand.h>
+ 
+ /* RAND_bytes is OpenSSL's classic function to obtain cryptographic strength pseudo-random bytes
+-   however, since the magic() function is used to generate TACACS+ session id rather than crypto keys
+-   we can use RAND_pseudo_bytes() which doesn't deplete the system's entropy pool
++   however, we can use RAND_pseudo_bytes() which doesn't deplete the system's entropy pool, so long
++   as it returns a "cryptographically strong" result - since session_id is an input to the TACACS+
++   "encryption" ("obfuscation" by modern standards - RFC 8907) algorithm.
+    */
+ 
+ u_int32_t
+ magic()
+ {
+     u_int32_t num;
++    int ret;
+ 
+ #ifdef HAVE_RAND_BYTES
+-    RAND_bytes((unsigned char *)&num, sizeof(num));
++    ret = RAND_bytes((unsigned char *)&num, sizeof(num));
+ #elif HAVE_RAND_PSEUDO_BYTES
+-    RAND_pseudo_bytes((unsigned char *)&num, sizeof(num));
++    ret = RAND_pseudo_bytes((unsigned char *)&num, sizeof(num));
+ #else
+ 	#error Neither  RAND_bytes nor RAND_pseudo_bytes seems to be available
+ #endif
+-    return num;
++
++    /* RAND_bytes success / RAND_pseudo_bytes "cryptographically strong" result */
++    if (ret == 1)
++        return num;
++
++    TACSYSLOG(LOG_CRIT,"%s: "
++#ifdef HAVE_RAND_BYTES
++                       "RAND_bytes "
++#else
++                       "RAND_pseudo_bytes "
++#endif
++                       "failed; ret: %d err: %ld", __FUNCTION__, ret, ERR_get_error());
++
++    exit(1);
+ }
+ 
+ #else
+diff --git a/pam_tacplus.c b/pam_tacplus.c
+index a0cb83d..4999ca9 100644
+--- a/pam_tacplus.c
++++ b/pam_tacplus.c
+@@ -718,6 +718,12 @@ int pam_sm_acct_mgmt(pam_handle_t *pamh, int UNUSED(flags), int argc,
+ PAM_EXTERN
+ int pam_sm_open_session(pam_handle_t *pamh, int UNUSED(flags), int argc,
+                         const char **argv) {
++
++/* Task ID has no need to be cryptographically strong so we don't
++ * check for failures of the RAND functions. If they fail then we are
++ * as well sending the accounting request regardless of whether any value
++ * was written to task_id.
++ */
+ #if defined(HAVE_OPENSSL_RAND_H) && defined(HAVE_LIBCRYPTO)
+ # if defined(HAVE_RAND_BYTES)
+ 	RAND_bytes((unsigned char *) &task_id, sizeof(task_id));
+
+From bceaab0cd51a09b88f40f19da799ac7390264bf8 Mon Sep 17 00:00:00 2001
+From: Duncan Eastoe <duncan.eastoe@att.com>
+Date: Fri, 23 Oct 2020 11:23:07 +0100
+Subject: [PATCH 2/2] pam_tacplus.c: Fallback to using PID as task ID
+
+If there is a failure obtaining a random task ID for the session
+accounting request then fallback to using the PID, as this is unique
+for the lifetime of the PAM application and therefore session.
+---
+ pam_tacplus.c | 16 ++++++++++++----
+ 1 file changed, 12 insertions(+), 4 deletions(-)
+
+diff --git a/pam_tacplus.c b/pam_tacplus.c
+index 4999ca9..b69e3d0 100644
+--- a/pam_tacplus.c
++++ b/pam_tacplus.c
+@@ -100,8 +100,13 @@ int _pam_send_account(int tac_fd, int type, const char *user, char *tty,
+ 	} else if (type == TAC_PLUS_ACCT_FLAG_STOP) {
+ 		tac_add_attrib(&attr, "stop_time", buf);
+ 	}
+-	sprintf(buf, "%hu", task_id);
++
++	if (task_id == 0)
++		snprintf(buf, sizeof(buf), "%d", getpid());
++	else
++		snprintf(buf, sizeof(buf), "%hu", task_id);
+ 	tac_add_attrib(&attr, "task_id", buf);
++
+ 	tac_add_attrib(&attr, "service", tac_service);
+ 	if (tac_protocol[0] != '\0')
+ 		tac_add_attrib(&attr, "protocol", tac_protocol);
+@@ -720,9 +725,8 @@ int pam_sm_open_session(pam_handle_t *pamh, int UNUSED(flags), int argc,
+                         const char **argv) {
+ 
+ /* Task ID has no need to be cryptographically strong so we don't
+- * check for failures of the RAND functions. If they fail then we are
+- * as well sending the accounting request regardless of whether any value
+- * was written to task_id.
++ * check for failures of the RAND functions. If we fail to get an ID we
++ * fallback to using our PID (in _pam_send_account).
+  */
+ #if defined(HAVE_OPENSSL_RAND_H) && defined(HAVE_LIBCRYPTO)
+ # if defined(HAVE_RAND_BYTES)
+@@ -734,6 +738,10 @@ int pam_sm_open_session(pam_handle_t *pamh, int UNUSED(flags), int argc,
+ 	task_id=(short int) magic();
+ #endif
+ 
++	if (task_id == 0)
++		syslog(LOG_INFO, "%s: failed to generate random task ID, "
++				"falling back to PID", __FUNCTION__);
++
+ 	return _pam_account(pamh, argc, argv, TAC_PLUS_ACCT_FLAG_START, NULL);
+ } /* pam_sm_open_session */
+ 
diff --git a/package/libpam-tacplus/libpam-tacplus.mk b/package/libpam-tacplus/libpam-tacplus.mk
index fd2b4f9a30..86a5b1c461 100644
--- a/package/libpam-tacplus/libpam-tacplus.mk
+++ b/package/libpam-tacplus/libpam-tacplus.mk
@@ -17,4 +17,7 @@ LIBPAM_TACPLUS_INSTALL_STAGING = YES
 LIBPAM_TACPLUS_CONF_ENV = \
 	ax_cv_check_cflags___fstack_protector_all=$(if $(BR2_TOOLCHAIN_HAS_SSP),yes,no)
 
+# 0005-Check-for-failure-of-OpenSSL-RAND_pseudo_bytes.patch
+LIBPAM_TACPLUS_IGNORE_CVES += CVE-2020-27743
+
 $(eval $(autotools-package))
