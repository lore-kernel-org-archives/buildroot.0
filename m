Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF7C3C4332F
	for <buildroot@archiver.kernel.org>; Wed,  8 Nov 2023 23:12:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 914F540114;
	Wed,  8 Nov 2023 23:12:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 914F540114
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G6uYbU9TAy_5; Wed,  8 Nov 2023 23:12:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 69E3A40296;
	Wed,  8 Nov 2023 23:12:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 69E3A40296
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BB5F31BF3BA
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 23:11:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9114560B6F
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 23:11:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9114560B6F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZFKsj2x6SEbf for <buildroot@lists.busybox.net>;
 Wed,  8 Nov 2023 23:11:58 +0000 (UTC)
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 23C3760A8B
 for <buildroot@buildroot.org>; Wed,  8 Nov 2023 23:11:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 23C3760A8B
Received: by mail-io1-xd2a.google.com with SMTP id
 ca18e2360f4ac-7a694a365d9so10223339f.0
 for <buildroot@buildroot.org>; Wed, 08 Nov 2023 15:11:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699485117; x=1700089917;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rwLfQtZw9w3K+Tppbl0hyZdmLaR5zBzZ9wqebakNzU0=;
 b=wUvVAK0dhjZ6NluxC0wiPaxQqtcxisfGMwTFFoPzugNwKYqGWNJDqMGjk28RgnK2R8
 IwDYlINckKRpDz10hnRmTU0Sa9XJQVKfRFl5rIbDzsj015nNLbkKtoArzoyyz1FF34TI
 E2Ly71xyQF0ba+Pd5QX4espdYoMMInq6AeTMhLGkZNRFkLfgRalBNIZJ2tBUfYYauiIA
 BcxiDinX+uH1AL4UTV7RxwdzujBDGuUPyfuV29on8vK+1jYcSmL/LS7vxq/pFlLNjc4D
 hI1Se3eUB0iQ/lbpWTX3pSSlvphqSfCM1/sd/1sqU6w557gNNBI0qqPOwovL/LDqlwbP
 6I2Q==
X-Gm-Message-State: AOJu0YwNnmwj9emQqx8cA5NXAg8cUmMlLXmVRYBvc2CcL/SI0YOzXRwj
 P45F7m740SXH/732VJnTSXPgE+Te5Jc=
X-Google-Smtp-Source: AGHT+IEl2O3qVbbxTQeZrTcMpfLrsTn+RiWMcu2q/wCmNiX9T4kXkTxZ48eFtJpJXgQ4fbIGGMHZwQ==
X-Received: by 2002:a5e:cb01:0:b0:79f:ca2f:9198 with SMTP id
 p1-20020a5ecb01000000b0079fca2f9198mr43978iom.2.1699485116733; 
 Wed, 08 Nov 2023 15:11:56 -0800 (PST)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 fo7-20020a056638648700b0043a180a7a94sm3641527jab.121.2023.11.08.15.11.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Nov 2023 15:11:56 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  8 Nov 2023 16:11:53 -0700
Message-Id: <20231108231153.3645917-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699485117; x=1700089917; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rwLfQtZw9w3K+Tppbl0hyZdmLaR5zBzZ9wqebakNzU0=;
 b=jDvUuWT59I3MiblD7fR0dj08iTHTMomvQQVcw+MA1e8Xpgef/fd3VuE80d4uLoej9b
 hrGODkp3Q43AQkye+WtDYoRZbBYKWopgXHp7aTxpiPhnuvl8QC6s1VPPFpQnNQ08HVLf
 QlPnPYepqZFhMVx1BPUW3Rszal6k5Rm+rrGfh7IHfok3jP0u5f3YGyAUHDQRK/l9FXJf
 JzqPrhM+3TZdqmk4/OCpcHyEG1+d02sJNR6CNYB2D6Qo3AKHiOLHusZOMxB+zmzZFyGw
 LpsblsD2mqmSptIy8mFn072RFnOKUFVcloBWkJEqOp3Z0gqJm6ArCT/vegwasDkfoHJb
 Yk0w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jDvUuWT5
Subject: [Buildroot] [PATCH 1/1] package/python-m2crypto: bump to version
 0.40.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Gustavo Heinz <gustavo@gsthnz.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patch and associated CVE ignore which is now upstream.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...he-RSA-decryption-API-CVE-2020-25657.patch | 174 ------------------
 package/python-m2crypto/python-m2crypto.hash  |   4 +-
 package/python-m2crypto/python-m2crypto.mk    |   7 +-
 3 files changed, 4 insertions(+), 181 deletions(-)
 delete mode 100644 package/python-m2crypto/0001-Mitigate-the-Bleichenbacher-timing-attacks-in-the-RSA-decryption-API-CVE-2020-25657.patch

diff --git a/package/python-m2crypto/0001-Mitigate-the-Bleichenbacher-timing-attacks-in-the-RSA-decryption-API-CVE-2020-25657.patch b/package/python-m2crypto/0001-Mitigate-the-Bleichenbacher-timing-attacks-in-the-RSA-decryption-API-CVE-2020-25657.patch
deleted file mode 100644
index 68200b7d9b..0000000000
--- a/package/python-m2crypto/0001-Mitigate-the-Bleichenbacher-timing-attacks-in-the-RSA-decryption-API-CVE-2020-25657.patch
+++ /dev/null
@@ -1,174 +0,0 @@
-From 84c53958def0f510e92119fca14d74f94215827a Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Mat=C4=9Bj=20Cepl?= <mcepl@cepl.eu>
-Date: Tue, 28 Jun 2022 21:17:01 +0200
-Subject: [PATCH] Mitigate the Bleichenbacher timing attacks in the RSA
- decryption API (CVE-2020-25657)
-
-Fixes #282
-
-[Retrieved from:
-https://gitlab.com/m2crypto/m2crypto/-/commit/84c53958def0f510e92119fca14d74f94215827a]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/SWIG/_m2crypto_wrap.c | 20 ++++++++++++--------
- src/SWIG/_rsa.i           | 20 ++++++++++++--------
- tests/test_rsa.py         | 15 +++++++--------
- 3 files changed, 31 insertions(+), 24 deletions(-)
-
-diff --git a/src/SWIG/_m2crypto_wrap.c b/src/SWIG/_m2crypto_wrap.c
-index aba9eb6d..a9f30da9 100644
---- a/src/SWIG/_m2crypto_wrap.c
-+++ b/src/SWIG/_m2crypto_wrap.c
-@@ -7040,9 +7040,10 @@ PyObject *rsa_private_encrypt(RSA *rsa, PyObject *from, int padding) {
-     tlen = RSA_private_encrypt(flen, (unsigned char *)fbuf,
-         (unsigned char *)tbuf, rsa, padding);
-     if (tlen == -1) {
--        m2_PyErr_Msg(_rsa_err);
-+        ERR_clear_error();
-+        PyErr_Clear();
-         PyMem_Free(tbuf);
--        return NULL;
-+        Py_RETURN_NONE;
-     }
- 
-     ret = PyBytes_FromStringAndSize((const char *)tbuf, tlen);
-@@ -7070,9 +7071,10 @@ PyObject *rsa_public_decrypt(RSA *rsa, PyObject *from, int padding) {
-     tlen = RSA_public_decrypt(flen, (unsigned char *)fbuf,
-         (unsigned char *)tbuf, rsa, padding);
-     if (tlen == -1) {
--        m2_PyErr_Msg(_rsa_err);
-+        ERR_clear_error();
-+        PyErr_Clear();
-         PyMem_Free(tbuf);
--        return NULL;
-+        Py_RETURN_NONE;
-     }
- 
-     ret = PyBytes_FromStringAndSize((const char *)tbuf, tlen);
-@@ -7097,9 +7099,10 @@ PyObject *rsa_public_encrypt(RSA *rsa, PyObject *from, int padding) {
-     tlen = RSA_public_encrypt(flen, (unsigned char *)fbuf,
-         (unsigned char *)tbuf, rsa, padding);
-     if (tlen == -1) {
--        m2_PyErr_Msg(_rsa_err);
-+        ERR_clear_error();
-+        PyErr_Clear();
-         PyMem_Free(tbuf);
--        return NULL;
-+        Py_RETURN_NONE;
-     }
- 
-     ret = PyBytes_FromStringAndSize((const char *)tbuf, tlen);
-@@ -7124,9 +7127,10 @@ PyObject *rsa_private_decrypt(RSA *rsa, PyObject *from, int padding) {
-     tlen = RSA_private_decrypt(flen, (unsigned char *)fbuf,
-         (unsigned char *)tbuf, rsa, padding);
-     if (tlen == -1) {
--        m2_PyErr_Msg(_rsa_err);
-+        ERR_clear_error();
-+        PyErr_Clear();
-         PyMem_Free(tbuf);
--        return NULL;
-+        Py_RETURN_NONE;
-     }
-     ret = PyBytes_FromStringAndSize((const char *)tbuf, tlen);
- 
-diff --git a/src/SWIG/_rsa.i b/src/SWIG/_rsa.i
-index bc714e01..1377b8be 100644
---- a/src/SWIG/_rsa.i
-+++ b/src/SWIG/_rsa.i
-@@ -239,9 +239,10 @@ PyObject *rsa_private_encrypt(RSA *rsa, PyObject *from, int padding) {
-     tlen = RSA_private_encrypt(flen, (unsigned char *)fbuf,
-         (unsigned char *)tbuf, rsa, padding);
-     if (tlen == -1) {
--        m2_PyErr_Msg(_rsa_err);
-+        ERR_clear_error();
-+        PyErr_Clear();
-         PyMem_Free(tbuf);
--        return NULL;
-+        Py_RETURN_NONE;
-     }
- 
-     ret = PyBytes_FromStringAndSize((const char *)tbuf, tlen);
-@@ -269,9 +270,10 @@ PyObject *rsa_public_decrypt(RSA *rsa, PyObject *from, int padding) {
-     tlen = RSA_public_decrypt(flen, (unsigned char *)fbuf,
-         (unsigned char *)tbuf, rsa, padding);
-     if (tlen == -1) {
--        m2_PyErr_Msg(_rsa_err);
-+        ERR_clear_error();
-+        PyErr_Clear();
-         PyMem_Free(tbuf);
--        return NULL;
-+        Py_RETURN_NONE;
-     }
- 
-     ret = PyBytes_FromStringAndSize((const char *)tbuf, tlen);
-@@ -296,9 +298,10 @@ PyObject *rsa_public_encrypt(RSA *rsa, PyObject *from, int padding) {
-     tlen = RSA_public_encrypt(flen, (unsigned char *)fbuf,
-         (unsigned char *)tbuf, rsa, padding);
-     if (tlen == -1) {
--        m2_PyErr_Msg(_rsa_err);
-+        ERR_clear_error();
-+        PyErr_Clear();
-         PyMem_Free(tbuf);
--        return NULL;
-+        Py_RETURN_NONE;
-     }
- 
-     ret = PyBytes_FromStringAndSize((const char *)tbuf, tlen);
-@@ -323,9 +326,10 @@ PyObject *rsa_private_decrypt(RSA *rsa, PyObject *from, int padding) {
-     tlen = RSA_private_decrypt(flen, (unsigned char *)fbuf,
-         (unsigned char *)tbuf, rsa, padding);
-     if (tlen == -1) {
--        m2_PyErr_Msg(_rsa_err);
-+        ERR_clear_error();
-+        PyErr_Clear();
-         PyMem_Free(tbuf);
--        return NULL;
-+        Py_RETURN_NONE;
-     }
-     ret = PyBytes_FromStringAndSize((const char *)tbuf, tlen);
- 
-diff --git a/tests/test_rsa.py b/tests/test_rsa.py
-index 7bb3af75..5e75d681 100644
---- a/tests/test_rsa.py
-+++ b/tests/test_rsa.py
-@@ -109,8 +109,9 @@ class RSATestCase(unittest.TestCase):
-         # The other paddings.
-         for padding in self.s_padding_nok:
-             p = getattr(RSA, padding)
--            with self.assertRaises(RSA.RSAError):
--                priv.private_encrypt(self.data, p)
-+            # Exception disabled as a part of mitigation against CVE-2020-25657
-+            # with self.assertRaises(RSA.RSAError):
-+            priv.private_encrypt(self.data, p)
-         # Type-check the data to be encrypted.
-         with self.assertRaises(TypeError):
-             priv.private_encrypt(self.gen_callback, RSA.pkcs1_padding)
-@@ -127,10 +128,12 @@ class RSATestCase(unittest.TestCase):
-             self.assertEqual(ptxt, self.data)
- 
-         # no_padding
--        with six.assertRaisesRegex(self, RSA.RSAError, 'data too small'):
--            priv.public_encrypt(self.data, RSA.no_padding)
-+        # Exception disabled as a part of mitigation against CVE-2020-25657
-+        # with six.assertRaisesRegex(self, RSA.RSAError, 'data too small'):
-+        priv.public_encrypt(self.data, RSA.no_padding)
- 
-         # Type-check the data to be encrypted.
-+        # Exception disabled as a part of mitigation against CVE-2020-25657
-         with self.assertRaises(TypeError):
-             priv.public_encrypt(self.gen_callback, RSA.pkcs1_padding)
- 
-@@ -146,10 +149,6 @@ class RSATestCase(unittest.TestCase):
-                          b'\000\000\000\003\001\000\001')  # aka 65537 aka 0xf4
-         with self.assertRaises(RSA.RSAError):
-             setattr(rsa, 'e', '\000\000\000\003\001\000\001')
--        with self.assertRaises(RSA.RSAError):
--            rsa.private_encrypt(1)
--        with self.assertRaises(RSA.RSAError):
--            rsa.private_decrypt(1)
-         assert rsa.check_key()
- 
-     def test_loadpub_bad(self):
--- 
-GitLab
-
diff --git a/package/python-m2crypto/python-m2crypto.hash b/package/python-m2crypto/python-m2crypto.hash
index 879f232565..782837081e 100644
--- a/package/python-m2crypto/python-m2crypto.hash
+++ b/package/python-m2crypto/python-m2crypto.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/m2crypto/json
-md5  8f39bfac730b6567e0c2179d15318c60  M2Crypto-0.38.0.tar.gz
-sha256  99f2260a30901c949a8dc6d5f82cd5312ffb8abc92e76633baf231bbbcb2decb  M2Crypto-0.38.0.tar.gz
+md5  280c20072afbe7010cf9e9620ea25c7b  M2Crypto-0.40.1.tar.gz
+sha256  bbfd113ec55708c05816252a4f09e4237df4f3bbfc8171cbbc33057d257bbb30  M2Crypto-0.40.1.tar.gz
 # Locally computed sha256 checksums
 sha256  4eca478396f4b2b020729a111fce3f096456d74500bfd8f2b0388c3c69f997c0  LICENCE
diff --git a/package/python-m2crypto/python-m2crypto.mk b/package/python-m2crypto/python-m2crypto.mk
index 3c28fa3b0d..69a0c28df5 100644
--- a/package/python-m2crypto/python-m2crypto.mk
+++ b/package/python-m2crypto/python-m2crypto.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_M2CRYPTO_VERSION = 0.38.0
+PYTHON_M2CRYPTO_VERSION = 0.40.1
 PYTHON_M2CRYPTO_SOURCE = M2Crypto-$(PYTHON_M2CRYPTO_VERSION).tar.gz
-PYTHON_M2CRYPTO_SITE = https://files.pythonhosted.org/packages/2c/52/c35ec79dd97a8ecf6b2bbd651df528abb47705def774a4a15b99977274e8
+PYTHON_M2CRYPTO_SITE = https://files.pythonhosted.org/packages/9e/a3/9433817493ea250db67a05de3361cb0a1d58531847d50406f2f28455e68c
 PYTHON_M2CRYPTO_SETUP_TYPE = setuptools
 PYTHON_M2CRYPTO_LICENSE = MIT
 PYTHON_M2CRYPTO_LICENSE_FILES = LICENCE
@@ -15,7 +15,4 @@ PYTHON_M2CRYPTO_CPE_ID_PRODUCT = m2crypto
 PYTHON_M2CRYPTO_DEPENDENCIES = openssl host-swig
 PYTHON_M2CRYPTO_BUILD_OPTS = --openssl=$(STAGING_DIR)/usr
 
-# 0001-Mitigate-the-Bleichenbacher-timing-attacks-in-the-RSA-decryption-API-CVE-2020-25657.patch
-PYTHON_M2CRYPTO_IGNORE_CVES += CVE-2020-25657
-
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
