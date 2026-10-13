Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56CADCC6B1A
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 20:57:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B00A80C50;
	Tue, 13 Oct 2026 20:57:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aPerf1tcJSjs; Tue, 13 Oct 2026 20:57:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1621680C72
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791925067;
	b=O+fXCW4HgucWH3MuE7VIkrlk+F625bmOumbxLe3NnpROnIlO5BKf2k9Sb2a9hgktg9Ci
	 Z1yLRoiSc1VaOqOhsV/zW7KjTX8sMacfizivFTm878rkqHx6FHBWyxC6Ehjc45nymdrW3
	 orY0wsNkXQrPiABov+rDdATCrAn1C0lkeWQG13YyKSFG6OPNJWR21gXAuVRXDSwEDgxNd
	 /Ezc9xx8Ai1SVAlDpj1w42Iuzx95M24vX4DKI+1qg78R1FH/Zj70mEIpryigCtpE1b1hQ
	 N4YsE1QeQe+LsVen15pLi7eWAte9sV5B5jYyYG+qn7xDm5BXo7vGsbtABDNF3nMsG4Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791925067;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=jxZjb6w5dSaVdjLLgpbIFrx79aM2k7DxcfdLHokoS8c=;
	b=kGLe9yhmSEQUFJT2PCG7vJyRjBpxcNjrPZ2vnZSqbtWpBWoP1eLH6Zo4jxztY6NRTEfQ
	 Th1nbAYYhou6Pcpd7XZ01F+97f4+bv9H8V0ba2Ljae18vb5ztGCS/ckMcTsRWZ4DwCG5/
	 tCNPQTPJz0roA8eos8zAoPcDmshS4vgFS/zePNngNlJk61wgV78ZpqrLgr2A40+yIko62
	 3hMm3MQeWLVYJINAq4yOLz3N5bQXQuaxP0pjU8ReiyRas66FuN7NCTgaC5DAbl1ezK1OY
	 7AGrYY7JOX84zADmA+VQsxlQ4tgO5uxrues+b4N8u1g9hrvoAj2lPaRqmbywTXxYCWQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791925067;
	bh=jxZjb6w5dSaVdjLLgpbIFrx79aM2k7DxcfdLHokoS8c=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hjx6L4cdyM/xxD6BCEcD5hdaBtpxQhnYyr1NGFYDAjmc6UYxqYSd/FmihaWAX70bA
	 dkDKafuDPrkna9O5mNm3fb7G+qfXDG3g3l+rMVTpTndrZPYklEcZZufv1c14ZtLONM
	 00VlSngsdSlEXBjG2lF3S741EdTSVIHsfSTzxyC4huXVQD2AT9sfnFjFBNy/dza/y8
	 8wUTE+Xunhvmha2Y2LjQVYB3yRJ2siIthVynZUwlhX5OWywKbHqdRBwCWOR4mIEdYw
	 kma73DbH9RelOvdsfyTTd1wXqA+im/9Q8RHbuPKnTdKQXMEVIAIJXJ/mcTI7WAciUA
	 Jeuhxn/YaYIwg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1621680C72;
	Tue, 13 Oct 2026 20:57:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D7AA9788
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:57:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BD6AC80C23
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:57:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cki-nfA6J47g for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 20:57:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0128880ADE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791925055;
 b=Td47Khf/pSWkWv1clpCHb2bmHJ186vHkfskWOCx1eCRWKsUfWyKmYiVS4mUcCqHHs1Aj
 SmQbYRjGqCCDbDbLFT5GIZKE9Q47IeVa8nrJ8SzhFNIWiV+b1UozhMQmwEm0I8Y0nYciM
 ZXrLi/cwyIBTdgIcUeTRWwWMX4fme5tMypb9F9V+6tppJ99jquMlJgElIQk5yJ48d90kh
 hF+5tT0pD2jcZE8R5Ps1HfcG++vJC9z9//DwIVh/1cVXgpyjEVsvX203Aotp+LYOw5ouk
 IkeH0DHPByWll12UCuW7YeucaAgzQGDeijGO5NrSuUUkqYLFsPsxATMjVWGnQZ1KV+g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791925055;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=h+2TjMUVq4QJjwP/BCUfD5KjKuNe9+oSGL8lG+qFQXg=;
 b=FFk7xJl8y+zyTBezelvJshreIM87XkhLqdQGPUPKRAExQvAwyojSs+ajWlQhABUQTD6D
 b+VXh3m7oaEP+OnSq0jd4nwi5+SwNd5xFN9bszJqrygEOFJwiZ9oI2hL0jFvzGZqVlsWC
 dKXCkLqnN4+9cCAMhxeB3NLjYAfcrFx9dDhoPe6Bx7jNK04fcvFJH6Z0sQ9mpg1klulvb
 +ikdd/9Ep7J6ZIbefzUJsb94bBQG9UK3Lfm5ENXbbmDsUm9ctankbvlrUwMlr60boWA29
 BMoTfeTHhHHAFoyvT6tRKqdNiOobx+lteUN8UVH0pyvQxOimu8Cc1yAgRyYEENVYJMQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0128880ADE
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:57:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 27C1E95B63; Tue, 13 Oct 2026 20:56:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 22:55:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 39093c7ee42f0b97b33ae7a350567491a26af9c8
X-Git-Newrev: dec44147586a55867131723080768dd57b181ca3
X-Patchwork-Hint: ignore
Message-Id: <20261013205615.27C1E95B63@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyudev: bump to version
 0.24.5
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/dec44147586a55867131723080768dd57b181ca3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Refresh the libudev loading workaround for the removal of an upstream
import-sorting comment.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                              | 1 -
 ...01-Workaround-finding-libudev-on-systems-without-ldconf.patch | 9 +++++----
 package/python-pyudev/python-pyudev.hash                         | 4 ++--
 package/python-pyudev/python-pyudev.mk                           | 4 ++--
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index edd5ddb3f2..6c026da328 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -742,7 +742,6 @@ package/python-pybind/0001-pybind11-commands.py-support-STAGING_DIR.patch lib_pa
 package/python-pylibftdi/0001-do-not-use-find-library.patch lib_patch.Upstream
 package/python-pyqt5/0001-configure-skip-qtdetail.patch lib_patch.Upstream
 package/python-pyqt5/0002-fix-QtCoremod.sip-syntax-error.patch lib_patch.Upstream
-package/python-pyudev/0001-Workaround-finding-libudev-on-systems-without-ldconf.patch lib_patch.Upstream
 package/python-pyzmq/0001-detect.py-fix-the-ZMQ-version-check-to-the-ZMQ-versi.patch lib_patch.Upstream
 package/python-scipy/0001-build-sh4-FE.patch lib_patch.Upstream
 package/python-setuptools/0001-add-executable.patch lib_patch.Upstream
diff --git a/package/python-pyudev/0001-Workaround-finding-libudev-on-systems-without-ldconf.patch b/package/python-pyudev/0001-Workaround-finding-libudev-on-systems-without-ldconf.patch
index f8c9497de3..343b1d486e 100644
--- a/package/python-pyudev/0001-Workaround-finding-libudev-on-systems-without-ldconf.patch
+++ b/package/python-pyudev/0001-Workaround-finding-libudev-on-systems-without-ldconf.patch
@@ -8,7 +8,7 @@ Python's find_library(). find_library() fails on systems
 without library cache mechanism.
 
 Taken from pyudev issue 117 discussion:
-https://github.com/pyudev/pyudev/pull/117
+Upstream: https://github.com/pyudev/pyudev/pull/117
 
 Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
 [Marcin: adjust to 0.22.0]
@@ -17,6 +17,8 @@ Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 [Bernd: rebased for version 0.24.4]
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+[James: rebased for version 0.24.5]
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
 ---
  src/pyudev/_ctypeslib/utils.py | 8 ++++----
  1 file changed, 4 insertions(+), 4 deletions(-)
@@ -25,10 +27,10 @@ diff --git a/src/pyudev/_ctypeslib/utils.py b/src/pyudev/_ctypeslib/utils.py
 index 9dffb3c..aa9942f 100644
 --- a/src/pyudev/_ctypeslib/utils.py
 +++ b/src/pyudev/_ctypeslib/utils.py
-@@ -24,7 +24,7 @@
+@@ -23,7 +23,7 @@
+ .. moduleauthor::  Anne Mulhern  <amulhern@redhat.com>
  """
  
- # isort: STDLIB
 -from ctypes import CDLL
 +from ctypes import cdll, CDLL
  from ctypes.util import find_library
@@ -50,4 +52,3 @@ index 9dffb3c..aa9942f 100644
          function = getattr(lib, funcname, None)
 -- 
 2.29.1
-
diff --git a/package/python-pyudev/python-pyudev.hash b/package/python-pyudev/python-pyudev.hash
index 799499a2ac..5d8392a888 100644
--- a/package/python-pyudev/python-pyudev.hash
+++ b/package/python-pyudev/python-pyudev.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyudev/json
-md5  2d2e6f68b60c3bf3ffc2b7c8df8d18ac  pyudev-0.24.4.tar.gz
-sha256  e788bb983700b1a84efc2e88862b0a51af2a995d5b86bc9997546505cf7b36bc  pyudev-0.24.4.tar.gz
+md5  f5d521b54002eb3b9abbd84adbd12da5  pyudev-0.24.5.tar.gz
+sha256  4e7faaec419b81a902d057568101819f448972c0cf448bb9c22203e4fc6a8eb9  pyudev-0.24.5.tar.gz
 # Locally computed sha256 checksums
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING
diff --git a/package/python-pyudev/python-pyudev.mk b/package/python-pyudev/python-pyudev.mk
index a83fe70a48..eeb12fa08c 100644
--- a/package/python-pyudev/python-pyudev.mk
+++ b/package/python-pyudev/python-pyudev.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYUDEV_VERSION = 0.24.4
+PYTHON_PYUDEV_VERSION = 0.24.5
 PYTHON_PYUDEV_SOURCE = pyudev-$(PYTHON_PYUDEV_VERSION).tar.gz
-PYTHON_PYUDEV_SITE = https://files.pythonhosted.org/packages/5e/1d/8bdbf651de1002e8b58fbe817bee22b1e8bfcdd24341d42c3238ce9a75f4
+PYTHON_PYUDEV_SITE = https://files.pythonhosted.org/packages/6a/45/770eda636216c62be4a06af01c7235923ca0580d72fd3e3178fb01b3ae01
 PYTHON_PYUDEV_LICENSE = LGPL-2.1+
 PYTHON_PYUDEV_LICENSE_FILES = COPYING
 PYTHON_PYUDEV_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
