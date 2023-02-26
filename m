Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD1CEC6FA8E
	for <buildroot@archiver.kernel.org>; Sun, 26 Feb 2023 13:28:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 687AB81212;
	Sun, 26 Feb 2023 13:28:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 687AB81212
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mCQKKEfc32Zm; Sun, 26 Feb 2023 13:28:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 745FD81213;
	Sun, 26 Feb 2023 13:28:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 745FD81213
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DD2231BF361
 for <buildroot@lists.busybox.net>; Sun, 26 Feb 2023 13:28:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C3BEA404EE
 for <buildroot@lists.busybox.net>; Sun, 26 Feb 2023 13:28:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C3BEA404EE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YnQh0xKMAlv3 for <buildroot@lists.busybox.net>;
 Sun, 26 Feb 2023 13:28:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13F2F404BF
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 13F2F404BF
 for <buildroot@buildroot.org>; Sun, 26 Feb 2023 13:28:40 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id bt28so3609234wrb.8
 for <buildroot@buildroot.org>; Sun, 26 Feb 2023 05:28:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zX7pOQmilxkpm2jYjrnCkz59E/8Oi03M2p/4Ck36i8s=;
 b=i7AL//t33aLklxvvRm2DjYpIP2phh+N34ppuipQ9jgqfmqON1eklcygL4+iBhssvEz
 DXlbSXxzNegHxJTnsW/6xMn7573RDzX0JzAij2xGfb4GtiD6oddJIZR/BhFO+re2eWmF
 yUpe644F5j4+1qMPuA8XXzzebrF9UU6fUvFIANGtsyRPsp6uz/8xr4mPD69pN3dVvB8k
 elG2uWtgFkM2K9tAAXogDao745MBShLEu+TeUEDLHf4eUhbm0NKL9v5OjYLvvckNzI3W
 T2lM22Srt7scX5wXciNghc48XD+ntE6q8Nw/d6e46e5ZE4VORYu0K6YveDLZciBPIXJJ
 FwdQ==
X-Gm-Message-State: AO0yUKVm03t6ARQk0fhcwKNY6uKGczPXxxCZlmMA/naS5IAWzwN4bTN7
 6Auf5RFK7AkALGTEX8metoUq5yXD/Ho=
X-Google-Smtp-Source: AK7set9TdtyUu4brENd78xZbIOiLIn6f/k9TWSpmYcKBN5UOdHFmibZbmnb+A3PRqNTXNL+3kdHWOg==
X-Received: by 2002:a5d:408b:0:b0:2c8:88c0:1187 with SMTP id
 o11-20020a5d408b000000b002c888c01187mr4992695wrp.67.1677418117524; 
 Sun, 26 Feb 2023 05:28:37 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 s8-20020a5d4ec8000000b002c704271b05sm4416998wrv.66.2023.02.26.05.28.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 05:28:37 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 26 Feb 2023 14:27:47 +0100
Message-Id: <20230226132747.86908-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zX7pOQmilxkpm2jYjrnCkz59E/8Oi03M2p/4Ck36i8s=;
 b=bGRvMYMpUkW7yNDGJhmfYbB8H1jPYExrB02OF7X4ElF+kDnwTTwqqcB14l58H97nWJ
 7ehrUU9lS+YEu/lmEp+0eyIKFCuc7YEVKDN3JgVcFw+fKkUDMk/Ux/scThXy715znllY
 OwVYOmIvcMFhsxzzy3w/2qGho6wmqZAdgXjZZofxSXRHNLfqGtgwZ3X9mnYGpQ/kEh2c
 9zgBMGMdE/2yFp2z3AEnoCQpKZHqFCVwX4WKeIgKhu+WwbK/t5venW0aTMkYwxqILcQD
 DHcOMwwwYFVxNrTKdYvJ4lqv+cq65bT7fDIVpivq4yhrhbN4ROdxciwSB8zREcBuaGGM
 UVNw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=bGRvMYMp
Subject: [Buildroot] [PATCH 1/1] package/python-m2crypto: fix CVE-2020-25657
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
Cc: Gustavo Heinz <gustavo@gsthnz.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

A flaw was found in all released versions of m2crypto, where they are
vulnerable to Bleichenbacher timing attacks in the RSA decryption API
via the timed processing of valid PKCS#1 v1.5 Ciphertext. The highest
threat from this vulnerability is to confidentiality.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...he-RSA-decryption-API-CVE-2020-25657.patch | 174 ++++++++++++++++++
 package/python-m2crypto/python-m2crypto.mk    |   3 +
 2 files changed, 177 insertions(+)
 create mode 100644 package/python-m2crypto/0001-Mitigate-the-Bleichenbacher-timing-attacks-in-the-RSA-decryption-API-CVE-2020-25657.patch

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
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
