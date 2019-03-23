From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 24 Mar 2019 00:34:41 +0100
Subject: [Buildroot] [PATCH] package/dropbear: bump version to 2019.77
Message-ID: <20190323233441.21610-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop patches as they are now upstream.  Add a hash for the license file.

Verified that runtime test still works:

./support/testing/run-tests -o tests.package.test_dropbear
20:42:44 TestDropbear                             Starting
20:42:45 TestDropbear                             Building
20:44:18 TestDropbear                             Building done
20:44:24 TestDropbear                             Cleaning up
.
----------------------------------------------------------------------
Ran 1 test in 100.727s

OK

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...se-single-server-ecdsa-key-when-R-is-used.patch | 113 ----------
 .../0002-Wait-to-fail-invalid-usernames.patch      | 236 ---------------------
 package/dropbear/dropbear.hash                     |   5 +-
 package/dropbear/dropbear.mk                       |   2 +-
 4 files changed, 5 insertions(+), 351 deletions(-)
 delete mode 100644 package/dropbear/0001-only-advertise-single-server-ecdsa-key-when-R-is-used.patch
 delete mode 100644 package/dropbear/0002-Wait-to-fail-invalid-usernames.patch

diff --git a/package/dropbear/0001-only-advertise-single-server-ecdsa-key-when-R-is-used.patch b/package/dropbear/0001-only-advertise-single-server-ecdsa-key-when-R-is-used.patch
deleted file mode 100644
index 1467e3bc2d..0000000000
--- a/package/dropbear/0001-only-advertise-single-server-ecdsa-key-when-R-is-used.patch
+++ /dev/null
@@ -1,113 +0,0 @@
-# HG changeset patch
-# User Matt Johnston <matt@ucc.asn.au>
-# Date 1520519133 -28800
-# Node ID 0dc3103a5900971d1d06d9101e062ddbd1112436
-# Parent  0f149d63068d90705db7fb52c8dea15ff32eedd7
-Only advertise a single server ecdsa key when -R (generate as required) is
-specified. Fixes -R now that default ecdsa key size has changed.
-
-Upstream-URL: https://secure.ucc.asn.au/hg/dropbear/rev/0dc3103a5900
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
-diff -r 0f149d63068d -r 0dc3103a5900 svr-runopts.c
---- a/svr-runopts.c	Thu Mar 08 22:22:11 2018 +0800
-+++ b/svr-runopts.c	Thu Mar 08 22:25:33 2018 +0800
-@@ -526,8 +526,10 @@
- 
- void load_all_hostkeys() {
- 	int i;
--	int disable_unset_keys = 1;
- 	int any_keys = 0;
-+#ifdef DROPBEAR_ECDSA
-+	int loaded_any_ecdsa = 0;
-+#endif
- 
- 	svr_opts.hostkey = new_sign_key();
- 
-@@ -552,14 +554,8 @@
- #endif
- 	}
- 
--#if DROPBEAR_DELAY_HOSTKEY
--	if (svr_opts.delay_hostkey) {
--		disable_unset_keys = 0;
--	}
--#endif
--
- #if DROPBEAR_RSA
--	if (disable_unset_keys && !svr_opts.hostkey->rsakey) {
-+	if (!svr_opts.delay_hostkey && !svr_opts.hostkey->rsakey) {
- 		disablekey(DROPBEAR_SIGNKEY_RSA);
- 	} else {
- 		any_keys = 1;
-@@ -567,39 +563,54 @@
- #endif
- 
- #if DROPBEAR_DSS
--	if (disable_unset_keys && !svr_opts.hostkey->dsskey) {
-+	if (!svr_opts.delay_hostkey && !svr_opts.hostkey->dsskey) {
- 		disablekey(DROPBEAR_SIGNKEY_DSS);
- 	} else {
- 		any_keys = 1;
- 	}
- #endif
- 
-+#if DROPBEAR_ECDSA
-+	/* We want to advertise a single ecdsa algorithm size.
-+	- If there is a ecdsa hostkey at startup we choose that that size.
-+	- If we generate at runtime we choose the default ecdsa size.
-+	- Otherwise no ecdsa keys will be advertised */
- 
--#if DROPBEAR_ECDSA
-+	/* check if any keys were loaded at startup */
-+	loaded_any_ecdsa = 
-+		0
- #if DROPBEAR_ECC_256
--	if ((disable_unset_keys || ECDSA_DEFAULT_SIZE != 256)
--		&& !svr_opts.hostkey->ecckey256) {
-+		|| svr_opts.hostkey->ecckey256
-+#endif
-+#if DROPBEAR_ECC_384
-+		|| svr_opts.hostkey->ecckey384
-+#endif
-+#if DROPBEAR_ECC_521
-+		|| svr_opts.hostkey->ecckey521
-+#endif
-+		;
-+	any_keys |= loaded_any_ecdsa;
-+
-+	/* Or an ecdsa key could be generated at runtime */
-+	any_keys |= svr_opts.delay_hostkey;
-+
-+	/* At most one ecdsa key size will be left enabled */
-+#if DROPBEAR_ECC_256
-+	if (!svr_opts.hostkey->ecckey256
-+		&& (!svr_opts.delay_hostkey || loaded_any_ecdsa || ECDSA_DEFAULT_SIZE != 256 )) {
- 		disablekey(DROPBEAR_SIGNKEY_ECDSA_NISTP256);
--	} else {
--		any_keys = 1;
- 	}
- #endif
--
- #if DROPBEAR_ECC_384
--	if ((disable_unset_keys || ECDSA_DEFAULT_SIZE != 384)
--		&& !svr_opts.hostkey->ecckey384) {
-+	if (!svr_opts.hostkey->ecckey384
-+		&& (!svr_opts.delay_hostkey || loaded_any_ecdsa || ECDSA_DEFAULT_SIZE != 384 )) {
- 		disablekey(DROPBEAR_SIGNKEY_ECDSA_NISTP384);
--	} else {
--		any_keys = 1;
- 	}
- #endif
--
- #if DROPBEAR_ECC_521
--	if ((disable_unset_keys || ECDSA_DEFAULT_SIZE != 521)
--		&& !svr_opts.hostkey->ecckey521) {
-+	if (!svr_opts.hostkey->ecckey521
-+		&& (!svr_opts.delay_hostkey || loaded_any_ecdsa || ECDSA_DEFAULT_SIZE != 521 )) {
- 		disablekey(DROPBEAR_SIGNKEY_ECDSA_NISTP521);
--	} else {
--		any_keys = 1;
- 	}
- #endif
- #endif /* DROPBEAR_ECDSA */
-
diff --git a/package/dropbear/0002-Wait-to-fail-invalid-usernames.patch b/package/dropbear/0002-Wait-to-fail-invalid-usernames.patch
deleted file mode 100644
index 958ac9921e..0000000000
--- a/package/dropbear/0002-Wait-to-fail-invalid-usernames.patch
+++ /dev/null
@@ -1,236 +0,0 @@
-From 52adbb34c32d3e2e1bcdb941e20a6f81138b8248 Mon Sep 17 00:00:00 2001
-From: Matt Johnston <matt@ucc.asn.au>
-Date: Thu, 23 Aug 2018 23:43:12 +0800
-Subject: [PATCH] Wait to fail invalid usernames
-
-[hg: https://secure.ucc.asn.au/hg/dropbear/rev/5d2d1021ca00]
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- auth.h           |  6 +++---
- svr-auth.c       | 19 +++++--------------
- svr-authpam.c    | 26 ++++++++++++++++++++++----
- svr-authpasswd.c | 27 ++++++++++++++-------------
- svr-authpubkey.c | 11 ++++++++++-
- 5 files changed, 54 insertions(+), 35 deletions(-)
-
-diff --git a/auth.h b/auth.h
-index da498f5..98f5468 100644
---- a/auth.h
-+++ b/auth.h
-@@ -37,9 +37,9 @@ void recv_msg_userauth_request(void);
- void send_msg_userauth_failure(int partial, int incrfail);
- void send_msg_userauth_success(void);
- void send_msg_userauth_banner(const buffer *msg);
--void svr_auth_password(void);
--void svr_auth_pubkey(void);
--void svr_auth_pam(void);
-+void svr_auth_password(int valid_user);
-+void svr_auth_pubkey(int valid_user);
-+void svr_auth_pam(int valid_user);
- 
- #if DROPBEAR_SVR_PUBKEY_OPTIONS_BUILT
- int svr_pubkey_allows_agentfwd(void);
-diff --git a/svr-auth.c b/svr-auth.c
-index c19c090..edde86b 100644
---- a/svr-auth.c
-+++ b/svr-auth.c
-@@ -149,10 +149,8 @@ void recv_msg_userauth_request() {
- 		if (methodlen == AUTH_METHOD_PASSWORD_LEN &&
- 				strncmp(methodname, AUTH_METHOD_PASSWORD,
- 					AUTH_METHOD_PASSWORD_LEN) == 0) {
--			if (valid_user) {
--				svr_auth_password();
--				goto out;
--			}
-+			svr_auth_password(valid_user);
-+			goto out;
- 		}
- 	}
- #endif
-@@ -164,10 +162,8 @@ void recv_msg_userauth_request() {
- 		if (methodlen == AUTH_METHOD_PASSWORD_LEN &&
- 				strncmp(methodname, AUTH_METHOD_PASSWORD,
- 					AUTH_METHOD_PASSWORD_LEN) == 0) {
--			if (valid_user) {
--				svr_auth_pam();
--				goto out;
--			}
-+			svr_auth_pam(valid_user);
-+			goto out;
- 		}
- 	}
- #endif
-@@ -177,12 +173,7 @@ void recv_msg_userauth_request() {
- 	if (methodlen == AUTH_METHOD_PUBKEY_LEN &&
- 			strncmp(methodname, AUTH_METHOD_PUBKEY,
- 				AUTH_METHOD_PUBKEY_LEN) == 0) {
--		if (valid_user) {
--			svr_auth_pubkey();
--		} else {
--			/* pubkey has no failure delay */
--			send_msg_userauth_failure(0, 0);
--		}
-+		svr_auth_pubkey(valid_user);
- 		goto out;
- 	}
- #endif
-diff --git a/svr-authpam.c b/svr-authpam.c
-index 05e4f3e..d201bc9 100644
---- a/svr-authpam.c
-+++ b/svr-authpam.c
-@@ -178,13 +178,14 @@ pamConvFunc(int num_msg,
-  * Keyboard interactive would be a lot nicer, but since PAM is synchronous, it
-  * gets very messy trying to send the interactive challenges, and read the
-  * interactive responses, over the network. */
--void svr_auth_pam() {
-+void svr_auth_pam(int valid_user) {
- 
- 	struct UserDataS userData = {NULL, NULL};
- 	struct pam_conv pamConv = {
- 		pamConvFunc,
- 		&userData /* submitted to pamvConvFunc as appdata_ptr */ 
- 	};
-+	const char* printable_user = NULL;
- 
- 	pam_handle_t* pamHandlep = NULL;
- 
-@@ -204,12 +205,23 @@ void svr_auth_pam() {
- 
- 	password = buf_getstring(ses.payload, &passwordlen);
- 
-+	/* We run the PAM conversation regardless of whether the username is valid
-+	in case the conversation function has an inherent delay.
-+	Use ses.authstate.username rather than ses.authstate.pw_name.
-+	After PAM succeeds we then check the valid_user flag too */
-+
- 	/* used to pass data to the PAM conversation function - don't bother with
- 	 * strdup() etc since these are touched only by our own conversation
- 	 * function (above) which takes care of it */
--	userData.user = ses.authstate.pw_name;
-+	userData.user = ses.authstate.username;
- 	userData.passwd = password;
- 
-+	if (ses.authstate.pw_name) {
-+		printable_user = ses.authstate.pw_name;
-+	} else {
-+		printable_user = "<invalid username>";
-+	}
-+
- 	/* Init pam */
- 	if ((rc = pam_start("sshd", NULL, &pamConv, &pamHandlep)) != PAM_SUCCESS) {
- 		dropbear_log(LOG_WARNING, "pam_start() failed, rc=%d, %s", 
-@@ -242,7 +254,7 @@ void svr_auth_pam() {
- 				rc, pam_strerror(pamHandlep, rc));
- 		dropbear_log(LOG_WARNING,
- 				"Bad PAM password attempt for '%s' from %s",
--				ses.authstate.pw_name,
-+				printable_user,
- 				svr_ses.addrstring);
- 		send_msg_userauth_failure(0, 1);
- 		goto cleanup;
-@@ -253,12 +265,18 @@ void svr_auth_pam() {
- 				rc, pam_strerror(pamHandlep, rc));
- 		dropbear_log(LOG_WARNING,
- 				"Bad PAM password attempt for '%s' from %s",
--				ses.authstate.pw_name,
-+				printable_user,
- 				svr_ses.addrstring);
- 		send_msg_userauth_failure(0, 1);
- 		goto cleanup;
- 	}
- 
-+	if (!valid_user) {
-+		/* PAM auth succeeded but the username isn't allowed in for another reason
-+		(checkusername() failed) */
-+		send_msg_userauth_failure(0, 1);
-+	}
-+
- 	/* successful authentication */
- 	dropbear_log(LOG_NOTICE, "PAM password auth succeeded for '%s' from %s",
- 			ses.authstate.pw_name,
-diff --git a/svr-authpasswd.c b/svr-authpasswd.c
-index bdee2aa..69c7d8a 100644
---- a/svr-authpasswd.c
-+++ b/svr-authpasswd.c
-@@ -48,22 +48,14 @@ static int constant_time_strcmp(const char* a, const char* b) {
- 
- /* Process a password auth request, sending success or failure messages as
-  * appropriate */
--void svr_auth_password() {
-+void svr_auth_password(int valid_user) {
- 	
- 	char * passwdcrypt = NULL; /* the crypt from /etc/passwd or /etc/shadow */
- 	char * testcrypt = NULL; /* crypt generated from the user's password sent */
--	char * password;
-+	char * password = NULL;
- 	unsigned int passwordlen;
--
- 	unsigned int changepw;
- 
--	passwdcrypt = ses.authstate.pw_passwd;
--
--#ifdef DEBUG_HACKCRYPT
--	/* debugging crypt for non-root testing with shadows */
--	passwdcrypt = DEBUG_HACKCRYPT;
--#endif
--
- 	/* check if client wants to change password */
- 	changepw = buf_getbool(ses.payload);
- 	if (changepw) {
-@@ -73,12 +65,21 @@ void svr_auth_password() {
- 	}
- 
- 	password = buf_getstring(ses.payload, &passwordlen);
--
--	/* the first bytes of passwdcrypt are the salt */
--	testcrypt = crypt(password, passwdcrypt);
-+	if (valid_user) {
-+		/* the first bytes of passwdcrypt are the salt */
-+		passwdcrypt = ses.authstate.pw_passwd;
-+		testcrypt = crypt(password, passwdcrypt);
-+	}
- 	m_burn(password, passwordlen);
- 	m_free(password);
- 
-+	/* After we have got the payload contents we can exit if the username
-+	is invalid. Invalid users have already been logged. */
-+	if (!valid_user) {
-+		send_msg_userauth_failure(0, 1);
-+		return;
-+	}
-+
- 	if (testcrypt == NULL) {
- 		/* crypt() with an invalid salt like "!!" */
- 		dropbear_log(LOG_WARNING, "User account '%s' is locked",
-diff --git a/svr-authpubkey.c b/svr-authpubkey.c
-index aa6087c..ff481c8 100644
---- a/svr-authpubkey.c
-+++ b/svr-authpubkey.c
-@@ -79,7 +79,7 @@ static int checkfileperm(char * filename);
- 
- /* process a pubkey auth request, sending success or failure message as
-  * appropriate */
--void svr_auth_pubkey() {
-+void svr_auth_pubkey(int valid_user) {
- 
- 	unsigned char testkey; /* whether we're just checking if a key is usable */
- 	char* algo = NULL; /* pubkey algo */
-@@ -102,6 +102,15 @@ void svr_auth_pubkey() {
- 	keybloblen = buf_getint(ses.payload);
- 	keyblob = buf_getptr(ses.payload, keybloblen);
- 
-+	if (!valid_user) {
-+		/* Return failure once we have read the contents of the packet
-+		required to validate a public key. 
-+		Avoids blind user enumeration though it isn't possible to prevent
-+		testing for user existence if the public key is known */
-+		send_msg_userauth_failure(0, 0);
-+		goto out;
-+	}
-+
- 	/* check if the key is valid */
- 	if (checkpubkey(algo, algolen, keyblob, keybloblen) == DROPBEAR_FAILURE) {
- 		send_msg_userauth_failure(0, 0);
--- 
-2.11.0
-
diff --git a/package/dropbear/dropbear.hash b/package/dropbear/dropbear.hash
index ef2011d907..dcd85aa532 100644
--- a/package/dropbear/dropbear.hash
+++ b/package/dropbear/dropbear.hash
@@ -1,2 +1,5 @@
 # From https://matt.ucc.asn.au/dropbear/releases/SHA256SUM.asc
-sha256 f2fb9167eca8cf93456a5fc1d4faf709902a3ab70dd44e352f3acbc3ffdaea65 dropbear-2018.76.tar.bz2
+sha256 d91f78ebe633be1d071fd1b7e5535b9693794048b019e9f4bea257e1992b458d dropbear-2019.77.tar.bz2
+
+# License file, locally computed
+sha256 cfa32d49e9022265375e533a4a5ef9e37d4aaa604119d612c46816aa1e59fe52 LICENSE
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index a5a8243bd4..ea3fe4c983 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DROPBEAR_VERSION = 2018.76
+DROPBEAR_VERSION = 2019.77
 DROPBEAR_SITE = https://matt.ucc.asn.au/dropbear/releases
 DROPBEAR_SOURCE = dropbear-$(DROPBEAR_VERSION).tar.bz2
 DROPBEAR_LICENSE = MIT, BSD-2-Clause-like, BSD-2-Clause
-- 
2.11.0
