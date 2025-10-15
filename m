Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90935CCD194
	for <buildroot@archiver.kernel.org>; Wed, 15 Oct 2025 17:15:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E33860905;
	Wed, 15 Oct 2025 17:15:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qUq0BnV_6aeE; Wed, 15 Oct 2025 17:15:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8722960A9E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8722960A9E;
	Wed, 15 Oct 2025 17:15:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E5A0262
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 17:15:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 148E682437
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 17:15:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cCHLlImWhju3 for <buildroot@buildroot.org>;
 Wed, 15 Oct 2025 17:15:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EA25F823AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA25F823AA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EA25F823AA
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 17:15:12 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a02db.dip0.t-ipconnect.de [91.58.2.219])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E6F2FA4C6E6F;
 Wed, 15 Oct 2025 19:15:10 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48416)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v955i-000000002dL-11mQ;
 Wed, 15 Oct 2025 17:15:10 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 15 Oct 2025 19:15:10 +0200
Message-ID: <20251015171510.1890988-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760548510;
 bh=bj1Zh1zUiuqyucsGp/Fadk/LhgzhctTJ7Bp6hR60tqA=;
 h=From:To:Cc:Subject:Date:From;
 b=N9/SXSyHAaEro14QVyTJaVWxwRydBwcgcIby3kz63c6cTk17PLqINi5lUDayxPkDS
 hZPo7wfvR3Ub/yUOJovbtNcqEt3TEf6DOArIjj289Fv56HOry8Vy4cc/ivBgbHp52G
 tgKuTR5+Zvdh5yj2e2SsQjwGZOYN2axNC537Z0mvNU8nb0Oe6QuVrU6UlLTDT98+pR
 n3kiOhR2Wx61EQ4e/T5CPlxvNSllg89pXVp9laUjpRvwFSF6ktaX5vbTHQ/m/fMDA+
 sPy6C+ILQyEvgphBdman198Oe2CYybVcLrqF+982dlKEFw3bxzNJC8cPIzY75pBSYz
 gfHGdwCSxxqLA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=N9/SXSyH
Subject: [Buildroot] [PATCH v2 1/1] package/python-pyudev: bump version to
 0.24.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rebased patch 0001 due to upstream commit:
https://github.com/pyudev/pyudev/commit/6d760e7eefb8ad1df55e69067ccd7d023a1e9be5

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: rebased patch 0001 (Julien)

 ...around-finding-libudev-on-systems-without-ldconf.patch | 8 +++++---
 package/python-pyudev/python-pyudev.hash                  | 4 ++--
 package/python-pyudev/python-pyudev.mk                    | 4 ++--
 3 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/package/python-pyudev/0001-Workaround-finding-libudev-on-systems-without-ldconf.patch b/package/python-pyudev/0001-Workaround-finding-libudev-on-systems-without-ldconf.patch
index 26f1ef6390..f8c9497de3 100644
--- a/package/python-pyudev/0001-Workaround-finding-libudev-on-systems-without-ldconf.patch
+++ b/package/python-pyudev/0001-Workaround-finding-libudev-on-systems-without-ldconf.patch
@@ -15,6 +15,8 @@ Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
 Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
 [Fabrice: Use %-formatting instead of f-string for python 2]
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Bernd: rebased for version 0.24.4]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  src/pyudev/_ctypeslib/utils.py | 8 ++++----
  1 file changed, 4 insertions(+), 4 deletions(-)
@@ -23,7 +25,7 @@ diff --git a/src/pyudev/_ctypeslib/utils.py b/src/pyudev/_ctypeslib/utils.py
 index 9dffb3c..aa9942f 100644
 --- a/src/pyudev/_ctypeslib/utils.py
 +++ b/src/pyudev/_ctypeslib/utils.py
-@@ -28,7 +28,7 @@
+@@ -24,7 +24,7 @@
  """
  
  # isort: STDLIB
@@ -32,7 +34,7 @@ index 9dffb3c..aa9942f 100644
  from ctypes.util import find_library
  
  
-@@ -50,10 +50,10 @@ def load_ctypes_library(name, signatures, error_checkers):
+@@ -46,10 +46,10 @@ def load_ctypes_library(name, signatures, error_checkers):
      :rtype: ctypes.CDLL
      :raises ImportError: if the library is not found
      """
@@ -41,7 +43,7 @@ index 9dffb3c..aa9942f 100644
 +    try:
 +        lib = cdll.LoadLibrary('lib%s.so' % name)
 +    except OSError:
-         raise ImportError("No library named %s" % name)
+         raise ImportError(f"No library named {name}")
 -    lib = CDLL(library_name, use_errno=True)
      # Add function signatures
      for funcname, signature in signatures.items():
diff --git a/package/python-pyudev/python-pyudev.hash b/package/python-pyudev/python-pyudev.hash
index e9596b7b43..799499a2ac 100644
--- a/package/python-pyudev/python-pyudev.hash
+++ b/package/python-pyudev/python-pyudev.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyudev/json
-md5  07bbe9111308d2509645705b8321c416  pyudev-0.24.3.tar.gz
-sha256  2e945427a21674893bb97632401db62139d91cea1ee96137cc7b07ad22198fc7  pyudev-0.24.3.tar.gz
+md5  2d2e6f68b60c3bf3ffc2b7c8df8d18ac  pyudev-0.24.4.tar.gz
+sha256  e788bb983700b1a84efc2e88862b0a51af2a995d5b86bc9997546505cf7b36bc  pyudev-0.24.4.tar.gz
 # Locally computed sha256 checksums
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING
diff --git a/package/python-pyudev/python-pyudev.mk b/package/python-pyudev/python-pyudev.mk
index fa11ce5040..a83fe70a48 100644
--- a/package/python-pyudev/python-pyudev.mk
+++ b/package/python-pyudev/python-pyudev.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYUDEV_VERSION = 0.24.3
+PYTHON_PYUDEV_VERSION = 0.24.4
 PYTHON_PYUDEV_SOURCE = pyudev-$(PYTHON_PYUDEV_VERSION).tar.gz
-PYTHON_PYUDEV_SITE = https://files.pythonhosted.org/packages/c4/5c/6cc034da13830e3da123ccf9a30910bc868fa16670362f004e4b788d0df1
+PYTHON_PYUDEV_SITE = https://files.pythonhosted.org/packages/5e/1d/8bdbf651de1002e8b58fbe817bee22b1e8bfcdd24341d42c3238ce9a75f4
 PYTHON_PYUDEV_LICENSE = LGPL-2.1+
 PYTHON_PYUDEV_LICENSE_FILES = COPYING
 PYTHON_PYUDEV_SETUP_TYPE = setuptools
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
