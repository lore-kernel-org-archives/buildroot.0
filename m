Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73ACEEA7943
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 20:01:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37B0B81E0F;
	Wed,  4 Feb 2026 20:01:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T-NmFgqL5_aE; Wed,  4 Feb 2026 20:01:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 245D381DEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770235283;
	bh=9s6nrHqILppLt6dj7fvQQQRJsNGBMF62jNPUtQsETYc=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=JU6W47b4uUbjWS+ONv5U5Ig4olSDjsLQqDUUrH+RA55RIFbUYRrIhBW5oYL84BcLw
	 XV5Ub3hAd2Hs51y+HAZF0CPk9r7Dgb/L3VLMUrqAe9U9x/HdfoYRYLgT0LCNJ4WS+B
	 OibSoP0yc0ITziM/KKiXiDkNPnNUuTqV7jIyOOmwJC/jxzquunIlfmOQlHycSMm14o
	 aKxD2Dd8uzWavkWzJIRdd8yJUcBjIPRz2ngroazzEDAH2c9467zQ+Y88X3fbdzhsri
	 ojkJNeYTO+2OJRKUOxy560y1gE9XDp59TRaUvgROpAH394XjbHxOEJEpTSMykTeEDN
	 EcGlxMmY3te1Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 245D381DEE;
	Wed,  4 Feb 2026 20:01:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8FBC317A
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 20:01:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A14A40308
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 20:01:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xmfZjrg1ItD8 for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 20:01:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=162.248.234.2;
 helo=mail.xes-mad.com; envelope-from=vfazio@xes-inc.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 64271402D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64271402D4
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 64271402D4
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 20:01:19 +0000 (UTC)
Received: from vfazio4.xes-mad.com (vfazio4.xes-mad.com [10.52.19.201])
 by mail.xes-mad.com (Postfix) with ESMTP id 0FF3C20260;
 Wed,  4 Feb 2026 11:11:06 -0600 (CST)
From: Vincent Fazio <vfazio@xes-inc.com>
To: buildroot@buildroot.org
Date: Wed,  4 Feb 2026 11:11:04 -0600
Message-ID: <20260204171104.4173368-1-vfazio@xes-inc.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=xes-inc.com; s=mail; 
 t=1770225066; bh=2HQPnD/dGuxB4KMwzaugdfGK3WSL4a/+AF9FXt+Qy8o=;
 h=From:To:Cc:Subject:Date:From;
 b=pT46sA/LJDYgt/gXf258RI8fu388oeT3AHGt+ZzVRaoo3HA54HulbsQz/DvYxxaGP
 s3/iHq0J0hOHLIaYOPQta5TVgI9Bs1Auaw2nPiYolrthbgfwST0uKnIFVm+TAY6hZm
 AlMz5HKkyo0yZJDc29udsjTA1YwL48uhW95m+om8=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=xes-inc.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=mail header.b=pT46sA/L
Subject: [Buildroot] [PATCH 1/1] package/python3: bump to version 3.14.3
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Vincent Fazio <vfazio@xes-inc.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://www.python.org/downloads/release/python-3143/
https://docs.python.org/release/3.14.3/whatsnew/changelog.html

Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
---
 ...gh-139275-Fix-compilation-of-Modules-_remote_debuggi.patch | 3 ++-
 package/python3/python3.hash                                  | 4 ++--
 package/python3/python3.mk                                    | 2 +-
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python3/0010-gh-139275-Fix-compilation-of-Modules-_remote_debuggi.patch b/package/python3/0010-gh-139275-Fix-compilation-of-Modules-_remote_debuggi.patch
index 7a72ebb16c..716d9d3e8a 100644
--- a/package/python3/0010-gh-139275-Fix-compilation-of-Modules-_remote_debuggi.patch
+++ b/package/python3/0010-gh-139275-Fix-compilation-of-Modules-_remote_debuggi.patch
@@ -8,6 +8,7 @@ Subject: [PATCH] gh-139275: Fix compilation of
 Upstream: https://github.com/python/cpython/commit/1963e701001839389cfb1b11d803b0743f4705d7
 
 [ Bernd Kuhls: ported to Python 3.14.2]
+[ Vincent Fazio: update to apply cleanly to 3.14.3 ]
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  .../2025-09-24-17-32-52.gh-issue-139275.novrqf.rst              | 2 ++
@@ -41,7 +42,7 @@ diff --git a/Python/remote_debug.h b/Python/remote_debug.h
 index 8f9b6cd4c49..b7d17a0f345 100644
 --- a/Python/remote_debug.h
 +++ b/Python/remote_debug.h
-@@ -881,7 +881,7 @@ _Py_RemoteDebug_GetPyRuntimeAddress(proc_handle_t* handle)
+@@ -886,7 +886,7 @@ _Py_RemoteDebug_GetPyRuntimeAddress(proc_handle_t* handle)
              handle->pid);
          _PyErr_ChainExceptions1(exc);
      }
diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index b71f6e7deb..dfe6b7959c 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,5 +1,5 @@
 # From https://www.python.org/downloads/release/python-3142/
-md5  19a31b2838db3b53f9f2db8782bf8773  Python-3.14.2.tar.xz
+md5  ef513dcb836d219ae0e2b16ac9c87d0f  Python-3.14.3.tar.xz
 # Locally computed
-sha256  ce543ab854bc256b61b71e9b27f831ffd1bfd60a479d639f8be7f9757cf573e9  Python-3.14.2.tar.xz
+sha256  a97d5549e9ad81fe17159ed02c68774ad5d266c72f8d9a0b5a9c371fe85d902b  Python-3.14.3.tar.xz
 sha256  b0e25a78cffb43f4d92de8b61ccfa1f1f98ecbc22330b54b5251e7b6ba010231  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 8195f4fd83..a240349d3e 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.14
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).2
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).3
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
