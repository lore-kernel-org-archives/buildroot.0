From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 5 May 2018 09:13:15 +0200
Subject: [Buildroot] [git commit] dropbear: Fix host key loading with 521
 bit ecdsa keys
Message-ID: <20180505071440.E37BF8B4AC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8a38d7cc9a0b934997c5b7f3de924aae01c0741f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Dropbear 2018.76 changed the default ecdsa host key size form 521 to 256
bits, but this breaks systems with an existing 521 bit key, blocking ssh
logins.

Apply the upstream fix from https://secure.ucc.asn.au/hg/dropbear/rev/0dc3103a5900 :

  Only advertise a single server ecdsa key when -R (generate as required) is
  specified. Fixes -R now that default ecdsa key size has changed.

[Peter: apply-patches.sh does not like suffix-less filename, so include
	patch in Buildroot]
Signed-off-by: Stefan S??rensen <stefan.sorensen@spectralink.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...se-single-server-ecdsa-key-when-R-is-used.patch | 113 +++++++++++++++++++++
 1 file changed, 113 insertions(+)

diff --git a/package/dropbear/0001-only-advertise-single-server-ecdsa-key-when-R-is-used.patch b/package/dropbear/0001-only-advertise-single-server-ecdsa-key-when-R-is-used.patch
new file mode 100644
index 0000000000..1467e3bc2d
--- /dev/null
+++ b/package/dropbear/0001-only-advertise-single-server-ecdsa-key-when-R-is-used.patch
@@ -0,0 +1,113 @@
+# HG changeset patch
+# User Matt Johnston <matt@ucc.asn.au>
+# Date 1520519133 -28800
+# Node ID 0dc3103a5900971d1d06d9101e062ddbd1112436
+# Parent  0f149d63068d90705db7fb52c8dea15ff32eedd7
+Only advertise a single server ecdsa key when -R (generate as required) is
+specified. Fixes -R now that default ecdsa key size has changed.
+
+Upstream-URL: https://secure.ucc.asn.au/hg/dropbear/rev/0dc3103a5900
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+diff -r 0f149d63068d -r 0dc3103a5900 svr-runopts.c
+--- a/svr-runopts.c	Thu Mar 08 22:22:11 2018 +0800
++++ b/svr-runopts.c	Thu Mar 08 22:25:33 2018 +0800
+@@ -526,8 +526,10 @@
+ 
+ void load_all_hostkeys() {
+ 	int i;
+-	int disable_unset_keys = 1;
+ 	int any_keys = 0;
++#ifdef DROPBEAR_ECDSA
++	int loaded_any_ecdsa = 0;
++#endif
+ 
+ 	svr_opts.hostkey = new_sign_key();
+ 
+@@ -552,14 +554,8 @@
+ #endif
+ 	}
+ 
+-#if DROPBEAR_DELAY_HOSTKEY
+-	if (svr_opts.delay_hostkey) {
+-		disable_unset_keys = 0;
+-	}
+-#endif
+-
+ #if DROPBEAR_RSA
+-	if (disable_unset_keys && !svr_opts.hostkey->rsakey) {
++	if (!svr_opts.delay_hostkey && !svr_opts.hostkey->rsakey) {
+ 		disablekey(DROPBEAR_SIGNKEY_RSA);
+ 	} else {
+ 		any_keys = 1;
+@@ -567,39 +563,54 @@
+ #endif
+ 
+ #if DROPBEAR_DSS
+-	if (disable_unset_keys && !svr_opts.hostkey->dsskey) {
++	if (!svr_opts.delay_hostkey && !svr_opts.hostkey->dsskey) {
+ 		disablekey(DROPBEAR_SIGNKEY_DSS);
+ 	} else {
+ 		any_keys = 1;
+ 	}
+ #endif
+ 
++#if DROPBEAR_ECDSA
++	/* We want to advertise a single ecdsa algorithm size.
++	- If there is a ecdsa hostkey at startup we choose that that size.
++	- If we generate at runtime we choose the default ecdsa size.
++	- Otherwise no ecdsa keys will be advertised */
+ 
+-#if DROPBEAR_ECDSA
++	/* check if any keys were loaded at startup */
++	loaded_any_ecdsa = 
++		0
+ #if DROPBEAR_ECC_256
+-	if ((disable_unset_keys || ECDSA_DEFAULT_SIZE != 256)
+-		&& !svr_opts.hostkey->ecckey256) {
++		|| svr_opts.hostkey->ecckey256
++#endif
++#if DROPBEAR_ECC_384
++		|| svr_opts.hostkey->ecckey384
++#endif
++#if DROPBEAR_ECC_521
++		|| svr_opts.hostkey->ecckey521
++#endif
++		;
++	any_keys |= loaded_any_ecdsa;
++
++	/* Or an ecdsa key could be generated at runtime */
++	any_keys |= svr_opts.delay_hostkey;
++
++	/* At most one ecdsa key size will be left enabled */
++#if DROPBEAR_ECC_256
++	if (!svr_opts.hostkey->ecckey256
++		&& (!svr_opts.delay_hostkey || loaded_any_ecdsa || ECDSA_DEFAULT_SIZE != 256 )) {
+ 		disablekey(DROPBEAR_SIGNKEY_ECDSA_NISTP256);
+-	} else {
+-		any_keys = 1;
+ 	}
+ #endif
+-
+ #if DROPBEAR_ECC_384
+-	if ((disable_unset_keys || ECDSA_DEFAULT_SIZE != 384)
+-		&& !svr_opts.hostkey->ecckey384) {
++	if (!svr_opts.hostkey->ecckey384
++		&& (!svr_opts.delay_hostkey || loaded_any_ecdsa || ECDSA_DEFAULT_SIZE != 384 )) {
+ 		disablekey(DROPBEAR_SIGNKEY_ECDSA_NISTP384);
+-	} else {
+-		any_keys = 1;
+ 	}
+ #endif
+-
+ #if DROPBEAR_ECC_521
+-	if ((disable_unset_keys || ECDSA_DEFAULT_SIZE != 521)
+-		&& !svr_opts.hostkey->ecckey521) {
++	if (!svr_opts.hostkey->ecckey521
++		&& (!svr_opts.delay_hostkey || loaded_any_ecdsa || ECDSA_DEFAULT_SIZE != 521 )) {
+ 		disablekey(DROPBEAR_SIGNKEY_ECDSA_NISTP521);
+-	} else {
+-		any_keys = 1;
+ 	}
+ #endif
+ #endif /* DROPBEAR_ECDSA */
+
