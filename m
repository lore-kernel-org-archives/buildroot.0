Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55B9ED43341
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 19:56:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F37C814EA;
	Thu, 11 Dec 2025 19:56:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gS3zUOm3YGlM; Thu, 11 Dec 2025 19:56:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4FE8981509
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765483018;
	bh=pQK8ddJ/8gYlR4wa4I9n9BaXcG2pEsA8uElPTnGzWv8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=R9SrZk4ylzSRb4nfZBX88NcWxd7nEMnx1krdJ5xuxHvaHjiEoqacNRY3ufQ8ETv0V
	 33bvkGHs4QjTGNenMSQ59TPgqkfy3MQykIP74S4k/w/hUohRcrbHZXfRrOdRM42lGB
	 mKXntyNopjCh7dXu23s26R3d9y45Wi+rnlQP97B3fiEENqhSODQBOLCIJEvXOcXP/A
	 8DNzyPHZX4uXJxxFsjf9fV7cNNYw1n1GPh+MRRq9gjN+P7EjXo7Ka4npATxPdeLXVV
	 bgVBAxQVhfZYBI7oxNrNY09joUiGE7pX0hEDiP2cBwU9nOxL8cseYiC/FuBYNFeSaW
	 0UedLzTT7pKSw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4FE8981509;
	Thu, 11 Dec 2025 19:56:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 43A142C1
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:56:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 35A5D606B6
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:56:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xM2xgV1PO0Za for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 19:56:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1B93E60657
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B93E60657
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1B93E60657
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:56:55 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b151.dip0.t-ipconnect.de [84.161.177.81])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B93ACA4C3835;
 Thu, 11 Dec 2025 20:55:35 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39350)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vTml6-000000008Hh-1DJG;
 Thu, 11 Dec 2025 19:55:28 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 11 Dec 2025 20:55:10 +0100
Message-ID: <20251211195527.3276900-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251211195527.3276900-1-bernd@kuhls.net>
References: <20251211195527.3276900-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765482935;
 bh=qsRntZ2j0orur5y4VS0wfFnO/ZFd1wxwwSHNkdbjdUw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=P0pX5VqCPQVNGWLBdVQoWdy/kRXl/7hB0aYOs/JxJf59h5oYkcmxjglij6E4OPSax
 SJ7FVOWpKtVNQ6JIHeoFjrccSrt9COWE6z2gbfBr9YTj24mlSQI5u6J8ziVN7EI3Ny
 gfU1JW+6lUT6ZgV1X0tCbF/O4P3vG9WavGB803DmO+iRqGlxRfztqQJIfisMyUKs70
 Asakrg1AdIbs44cYDipj34JSAC4En7KKYc86wbRkh8gFlGRdjpykY8Ns3ulzRN74oe
 f9bnc4IMIoAhg4w+B82xqP3iO4f96AUPTvBHAEwldN5FxUBmoYIovEIX+ATAyMPDuR
 0xewE49SoRGog==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=P0pX5VqC
Subject: [Buildroot] [PATCH/next 04/21] package/python-dbus-fast: bump
 version to 3.1.2
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
Cc: Louis Aussedat <aussedat.louis@gmail.com>,
 =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 Grzegorz Blach <grzegorz@blach.pl>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Lionel Flandrin <lionel@svkt.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/Bluetooth-Devices/dbus-fast/releases

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-dbus-fast/python-dbus-fast.hash | 4 ++--
 package/python-dbus-fast/python-dbus-fast.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-dbus-fast/python-dbus-fast.hash b/package/python-dbus-fast/python-dbus-fast.hash
index 7ff243ebda..1fac0c0396 100644
--- a/package/python-dbus-fast/python-dbus-fast.hash
+++ b/package/python-dbus-fast/python-dbus-fast.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/dbus-fast/json
-md5  ea8420ccd0c90ea8f3dda3df5b0a7a01  dbus_fast-2.44.3.tar.gz
-sha256  962b36abbe885159e31135c57a7d9659997c61a13d55ecb070a61dc502dbd87e  dbus_fast-2.44.3.tar.gz
+md5  605c7ca53ec797a9513c742d705f8494  dbus_fast-3.1.2.tar.gz
+sha256  6c9e1b45e4b5e7df0c021bf1bf3f27649374e47c3de1afdba6d00a7d7bba4b3a  dbus_fast-3.1.2.tar.gz
 # Locally computed sha256 checksums
 sha256  c37e9c75110e01d1f0c5360dc7d7776a30ac5f70d2440db214423e4b7a77a6af  LICENSE
diff --git a/package/python-dbus-fast/python-dbus-fast.mk b/package/python-dbus-fast/python-dbus-fast.mk
index 6f629c0cc6..7d98581eeb 100644
--- a/package/python-dbus-fast/python-dbus-fast.mk
+++ b/package/python-dbus-fast/python-dbus-fast.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DBUS_FAST_VERSION = 2.44.3
+PYTHON_DBUS_FAST_VERSION = 3.1.2
 PYTHON_DBUS_FAST_SOURCE = dbus_fast-$(PYTHON_DBUS_FAST_VERSION).tar.gz
-PYTHON_DBUS_FAST_SITE = https://files.pythonhosted.org/packages/00/f2/8a3f2345452f4aa8e9899544ba6dfdf699cef39ecfb04238fdad381451c8
+PYTHON_DBUS_FAST_SITE = https://files.pythonhosted.org/packages/16/a4/e54607cf8b0a696beba591f1a543cff5b6a9e4b4f842fd55f7ba741d678d
 PYTHON_DBUS_FAST_SETUP_TYPE = poetry
 PYTHON_DBUS_FAST_LICENSE = MIT
 PYTHON_DBUS_FAST_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
