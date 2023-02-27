Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A159BC64ED8
	for <buildroot@archiver.kernel.org>; Mon, 27 Feb 2023 14:59:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40F0B6108D;
	Mon, 27 Feb 2023 14:59:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40F0B6108D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CkQ-9AEbAeGA; Mon, 27 Feb 2023 14:59:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FFC561098;
	Mon, 27 Feb 2023 14:59:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2FFC561098
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B931F1BF2A2
 for <buildroot@lists.busybox.net>; Mon, 27 Feb 2023 14:58:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 706FC402F4
 for <buildroot@lists.busybox.net>; Mon, 27 Feb 2023 14:58:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 706FC402F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ddaz4TMFJlmm for <buildroot@lists.busybox.net>;
 Mon, 27 Feb 2023 14:58:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C7A4B4013D
 for <buildroot@buildroot.org>; Mon, 27 Feb 2023 14:58:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C7A4B4013D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B740F86BF1; Mon, 27 Feb 2023 14:58:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 27 Feb 2023 15:41:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7abc9a0554cc1c1bbc1ad4273622024020fa2c7e
X-Git-Newrev: a86d44a3eb009d3deb5b558f7ccb0870eb877c6a
X-Patchwork-Hint: ignore
Message-Id: <20230227145800.B740F86BF1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-m2crypto: fix CVE-2020-25657
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a86d44a3eb009d3deb5b558f7ccb0870eb877c6a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A flaw was found in all released versions of m2crypto, where they are
vulnerable to Bleichenbacher timing attacks in the RSA decryption API
via the timed processing of valid PKCS#1 v1.5 Ciphertext. The highest
threat from this vulnerability is to confidentiality.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-in-the-RSA-decryption-API-CVE-2020-25657.patch | 174 +++++++++++++++++++++
 package/python-m2crypto/python-m2crypto.mk         |   3 +
 2 files changed, 177 insertions(+)

diff --git a/package/python-m2crypto/0001-Mitigate-the-Bleichenbacher-timing-attacks-in-the-RSA-decryption-API-CVE-2020-25657.patch b/package/python-m2crypto/0001-Mitigate-the-Bleichenbacher-timing-attacks-in-the-RSA-decryption-API-CVE-2020-25657.patch
new file mode 100644
index 0000000000..68200b7d9b
--- /dev/null
+++ b/package/python-m2crypto/0001-Mitigate-the-Bleichenbacher-timing-attacks-in-the-RSA-decryption-API-CVE-2020-25657.patch
@@ -0,0 +1,174 @@
+From 84c53958def0f510e92119fca14d74f94215827a Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Mat=C4=9Bj=20Cepl?= <mcepl@cepl.eu>
+Date: Tue, 28 Jun 2022 21:17:01 +0200
+Subject: [PATCH] Mitigate the Bleichenbacher timing attacks in the RSA
+ decryption API (CVE-2020-25657)
+
+Fixes #282
+
+[Retrieved from:
+https://gitlab.com/m2crypto/m2crypto/-/commit/84c53958def0f510e92119fca14d74f94215827a]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/SWIG/_m2crypto_wrap.c | 20 ++++++++++++--------
+ src/SWIG/_rsa.i           | 20 ++++++++++++--------
+ tests/test_rsa.py         | 15 +++++++--------
+ 3 files changed, 31 insertions(+), 24 deletions(-)
+
+diff --git a/src/SWIG/_m2crypto_wrap.c b/src/SWIG/_m2crypto_wrap.c
+index aba9eb6d..a9f30da9 100644
+--- a/src/SWIG/_m2crypto_wrap.c
++++ b/src/SWIG/_m2crypto_wrap.c
+@@ -7040,9 +7040,10 @@ PyObject *rsa_private_encrypt(RSA *rsa, PyObject *from, int padding) {
+     tlen = RSA_private_encrypt(flen, (unsigned char *)fbuf,
+         (unsigned char *)tbuf, rsa, padding);
+     if (tlen == -1) {
+-        m2_PyErr_Msg(_rsa_err);
++        ERR_clear_error();
++        PyErr_Clear();
+         PyMem_Free(tbuf);
+-        return NULL;
++        Py_RETURN_NONE;
+     }
+ 
+     ret = PyBytes_FromStringAndSize((const char *)tbuf, tlen);
+@@ -7070,9 +7071,10 @@ PyObject *rsa_public_decrypt(RSA *rsa, PyObject *from, int padding) {
+     tlen = RSA_public_decrypt(flen, (unsigned char *)fbuf,
+         (unsigned char *)tbuf, rsa, padding);
+     if (tlen == -1) {
+-        m2_PyErr_Msg(_rsa_err);
++        ERR_clear_error();
++        PyErr_Clear();
+         PyMem_Free(tbuf);
+-        return NULL;
++        Py_RETURN_NONE;
+     }
+ 
+     ret = PyBytes_FromStringAndSize((const char *)tbuf, tlen);
+@@ -7097,9 +7099,10 @@ PyObject *rsa_public_encrypt(RSA *rsa, PyObject *from, int padding) {
+     tlen = RSA_public_encrypt(flen, (unsigned char *)fbuf,
+         (unsigned char *)tbuf, rsa, padding);
+     if (tlen == -1) {
+-        m2_PyErr_Msg(_rsa_err);
++        ERR_clear_error();
++        PyErr_Clear();
+         PyMem_Free(tbuf);
+-        return NULL;
++        Py_RETURN_NONE;
+     }
+ 
+     ret = PyBytes_FromStringAndSize((const char *)tbuf, tlen);
+@@ -7124,9 +7127,10 @@ PyObject *rsa_private_decrypt(RSA *rsa, PyObject *from, int padding) {
+     tlen = RSA_private_decrypt(flen, (unsigned char *)fbuf,
+         (unsigned char *)tbuf, rsa, padding);
+     if (tlen == -1) {
+-        m2_PyErr_Msg(_rsa_err);
++        ERR_clear_error();
++        PyErr_Clear();
+         PyMem_Free(tbuf);
+-        return NULL;
++        Py_RETURN_NONE;
+     }
+     ret = PyBytes_FromStringAndSize((const char *)tbuf, tlen);
+ 
+diff --git a/src/SWIG/_rsa.i b/src/SWIG/_rsa.i
+index bc714e01..1377b8be 100644
+--- a/src/SWIG/_rsa.i
++++ b/src/SWIG/_rsa.i
+@@ -239,9 +239,10 @@ PyObject *rsa_private_encrypt(RSA *rsa, PyObject *from, int padding) {
+     tlen = RSA_private_encrypt(flen, (unsigned char *)fbuf,
+         (unsigned char *)tbuf, rsa, padding);
+     if (tlen == -1) {
+-        m2_PyErr_Msg(_rsa_err);
++        ERR_clear_error();
++        PyErr_Clear();
+         PyMem_Free(tbuf);
+-        return NULL;
++        Py_RETURN_NONE;
+     }
+ 
+     ret = PyBytes_FromStringAndSize((const char *)tbuf, tlen);
+@@ -269,9 +270,10 @@ PyObject *rsa_public_decrypt(RSA *rsa, PyObject *from, int padding) {
+     tlen = RSA_public_decrypt(flen, (unsigned char *)fbuf,
+         (unsigned char *)tbuf, rsa, padding);
+     if (tlen == -1) {
+-        m2_PyErr_Msg(_rsa_err);
++        ERR_clear_error();
++        PyErr_Clear();
+         PyMem_Free(tbuf);
+-        return NULL;
++        Py_RETURN_NONE;
+     }
+ 
+     ret = PyBytes_FromStringAndSize((const char *)tbuf, tlen);
+@@ -296,9 +298,10 @@ PyObject *rsa_public_encrypt(RSA *rsa, PyObject *from, int padding) {
+     tlen = RSA_public_encrypt(flen, (unsigned char *)fbuf,
+         (unsigned char *)tbuf, rsa, padding);
+     if (tlen == -1) {
+-        m2_PyErr_Msg(_rsa_err);
++        ERR_clear_error();
++        PyErr_Clear();
+         PyMem_Free(tbuf);
+-        return NULL;
++        Py_RETURN_NONE;
+     }
+ 
+     ret = PyBytes_FromStringAndSize((const char *)tbuf, tlen);
+@@ -323,9 +326,10 @@ PyObject *rsa_private_decrypt(RSA *rsa, PyObject *from, int padding) {
+     tlen = RSA_private_decrypt(flen, (unsigned char *)fbuf,
+         (unsigned char *)tbuf, rsa, padding);
+     if (tlen == -1) {
+-        m2_PyErr_Msg(_rsa_err);
++        ERR_clear_error();
++        PyErr_Clear();
+         PyMem_Free(tbuf);
+-        return NULL;
++        Py_RETURN_NONE;
+     }
+     ret = PyBytes_FromStringAndSize((const char *)tbuf, tlen);
+ 
+diff --git a/tests/test_rsa.py b/tests/test_rsa.py
+index 7bb3af75..5e75d681 100644
+--- a/tests/test_rsa.py
++++ b/tests/test_rsa.py
+@@ -109,8 +109,9 @@ class RSATestCase(unittest.TestCase):
+         # The other paddings.
+         for padding in self.s_padding_nok:
+             p = getattr(RSA, padding)
+-            with self.assertRaises(RSA.RSAError):
+-                priv.private_encrypt(self.data, p)
++            # Exception disabled as a part of mitigation against CVE-2020-25657
++            # with self.assertRaises(RSA.RSAError):
++            priv.private_encrypt(self.data, p)
+         # Type-check the data to be encrypted.
+         with self.assertRaises(TypeError):
+             priv.private_encrypt(self.gen_callback, RSA.pkcs1_padding)
+@@ -127,10 +128,12 @@ class RSATestCase(unittest.TestCase):
+             self.assertEqual(ptxt, self.data)
+ 
+         # no_padding
+-        with six.assertRaisesRegex(self, RSA.RSAError, 'data too small'):
+-            priv.public_encrypt(self.data, RSA.no_padding)
++        # Exception disabled as a part of mitigation against CVE-2020-25657
++        # with six.assertRaisesRegex(self, RSA.RSAError, 'data too small'):
++        priv.public_encrypt(self.data, RSA.no_padding)
+ 
+         # Type-check the data to be encrypted.
++        # Exception disabled as a part of mitigation against CVE-2020-25657
+         with self.assertRaises(TypeError):
+             priv.public_encrypt(self.gen_callback, RSA.pkcs1_padding)
+ 
+@@ -146,10 +149,6 @@ class RSATestCase(unittest.TestCase):
+                          b'\000\000\000\003\001\000\001')  # aka 65537 aka 0xf4
+         with self.assertRaises(RSA.RSAError):
+             setattr(rsa, 'e', '\000\000\000\003\001\000\001')
+-        with self.assertRaises(RSA.RSAError):
+-            rsa.private_encrypt(1)
+-        with self.assertRaises(RSA.RSAError):
+-            rsa.private_decrypt(1)
+         assert rsa.check_key()
+ 
+     def test_loadpub_bad(self):
+-- 
+GitLab
+
diff --git a/package/python-m2crypto/python-m2crypto.mk b/package/python-m2crypto/python-m2crypto.mk
index 02ad76d3f4..3c28fa3b0d 100644
--- a/package/python-m2crypto/python-m2crypto.mk
+++ b/package/python-m2crypto/python-m2crypto.mk
@@ -15,4 +15,7 @@ PYTHON_M2CRYPTO_CPE_ID_PRODUCT = m2crypto
 PYTHON_M2CRYPTO_DEPENDENCIES = openssl host-swig
 PYTHON_M2CRYPTO_BUILD_OPTS = --openssl=$(STAGING_DIR)/usr
 
+# 0001-Mitigate-the-Bleichenbacher-timing-attacks-in-the-RSA-decryption-API-CVE-2020-25657.patch
+PYTHON_M2CRYPTO_IGNORE_CVES += CVE-2020-25657
+
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
