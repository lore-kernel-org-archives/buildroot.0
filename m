Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E1DCCFA46B
	for <buildroot@archiver.kernel.org>; Sun, 23 Nov 2025 17:14:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 172F660DCD;
	Sun, 23 Nov 2025 17:14:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id InkFY7Oh8O0T; Sun, 23 Nov 2025 17:14:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B841608B8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B841608B8;
	Sun, 23 Nov 2025 17:14:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id EC34434E
 for <buildroot@buildroot.org>; Sun, 23 Nov 2025 17:14:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D649C40699
 for <buildroot@buildroot.org>; Sun, 23 Nov 2025 17:14:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Aq331ZzZCEwx for <buildroot@buildroot.org>;
 Sun, 23 Nov 2025 17:14:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E192A40635
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E192A40635
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E192A40635
 for <buildroot@buildroot.org>; Sun, 23 Nov 2025 17:14:03 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bcad.dip0.t-ipconnect.de [84.161.188.173])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 169A7A4C7544;
 Sun, 23 Nov 2025 18:14:02 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40652)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vNDez-000000002gW-2yU5;
 Sun, 23 Nov 2025 17:14:01 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 23 Nov 2025 18:13:59 +0100
Message-ID: <20251123171401.933757-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1763918042;
 bh=7kOX51nfwzfmhsuRNtdlFz9PXPVD7NBe2L7kHUEN+LE=;
 h=From:To:Cc:Subject:Date:From;
 b=Ch1yQgiiwmpvR4bqjd3cThZk5VYUHjbLh9zSXviKZrJFKNMJM1HRavdUTMTC2Ta7c
 gB0RfBrxfTyolkvHDd4Os9zVnez6WUDuSSSR2gE4+wY0H2czu8j87v2lj6fMaSvNKG
 xBwgxJSvzJIwLXjbm/W9PU1SzPo3PP4hL8vTIQn7TqOf+/CI08pFp9qdXNn+icn6G6
 BaFTponEUMVAiYPHihXavSFu7ab0yY6CDQxXOEu27ZhoS56WRSl1rwb4leQXREW5OH
 LogNJAOCVogL0ckvhk+SkJ2Azt0lsgeTKL7n26Kmkd3pERYpNWcjh/q1zyMspoNq5N
 DCPzZD+2fpWLQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=Ch1yQgii
Subject: [Buildroot] [PATCH/next 1/3] package/python-pyicu: bump version to
 2.16
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

Changelog:
https://gitlab.pyicu.org/main/pyicu/-/blob/v2.16/CHANGES?ref_type=tags

Needed for compatibility with ICU 78.1.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-pyicu/python-pyicu.hash | 4 ++--
 package/python-pyicu/python-pyicu.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyicu/python-pyicu.hash b/package/python-pyicu/python-pyicu.hash
index afd14437ce..81cdd4f459 100644
--- a/package/python-pyicu/python-pyicu.hash
+++ b/package/python-pyicu/python-pyicu.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyicu/json
-md5  6ae2145f2a98433f461b128c3ebef233  pyicu-2.15.3.tar.gz
-sha256  f32e78e1cb64d0aeb14f027e037a8944861d3114548818a6adf0081ef51aefc3  pyicu-2.15.3.tar.gz
+md5  00715b86c27c150f48554a863688e878  pyicu-2.16.tar.gz
+sha256  42b3a8062e3b23e927ca727e6b5e1730d86c70279834e4887152895d2eb012d9  pyicu-2.16.tar.gz
 # Locally computed sha256 checksums
 sha256  00da5bf22f2386c4f6f07c734490e9b818c4dcf70e6ca49f594e9cec636b9c40  LICENSE
diff --git a/package/python-pyicu/python-pyicu.mk b/package/python-pyicu/python-pyicu.mk
index 5025bd649b..9d3f5f6004 100644
--- a/package/python-pyicu/python-pyicu.mk
+++ b/package/python-pyicu/python-pyicu.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYICU_VERSION = 2.15.3
+PYTHON_PYICU_VERSION = 2.16
 PYTHON_PYICU_SOURCE = pyicu-$(PYTHON_PYICU_VERSION).tar.gz
-PYTHON_PYICU_SITE = https://files.pythonhosted.org/packages/88/b0/c8b61bac55424e2ff80e20d7251c3f002baff3c07c34cee3849e3505d8f5
+PYTHON_PYICU_SITE = https://files.pythonhosted.org/packages/11/c3/8d558b30deb33eb583c0bcae3e64d6db8316b69461a04bb9db5ff63d3f6e
 PYTHON_PYICU_LICENSE = MIT
 PYTHON_PYICU_LICENSE_FILES = LICENSE
 PYTHON_PYICU_DEPENDENCIES = icu
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
