Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A14EACCD187
	for <buildroot@archiver.kernel.org>; Sun, 12 Oct 2025 20:22:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 73DD9608F4;
	Sun, 12 Oct 2025 20:22:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fSYHWpKibKGu; Sun, 12 Oct 2025 20:22:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 958F2608F7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 958F2608F7;
	Sun, 12 Oct 2025 20:22:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 399BE12B
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 20:22:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2042B40B22
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 20:22:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tioe7ro_pL0s for <buildroot@buildroot.org>;
 Sun, 12 Oct 2025 20:22:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D3C9B406FD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3C9B406FD
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D3C9B406FD
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 20:22:20 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a02db.dip0.t-ipconnect.de [91.58.2.219])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 73E66A4C671D;
 Sun, 12 Oct 2025 22:20:04 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39868)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v82Xz-000000004zD-3ObR;
 Sun, 12 Oct 2025 20:20:04 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 12 Oct 2025 22:19:51 +0200
Message-ID: <20251012202002.178080-12-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251012202002.178080-1-bernd@kuhls.net>
References: <20251012202002.178080-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760300404;
 bh=tZNNujL3DPv2+hriBMVB2f21FDUYs+p7/L+M1UPWHKs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=c1eNeo72Rb+v/1ouDkcflJemA9Nr/qOG0RzX72TlhqgnxImT7kh7a+rkLXMY45Hav
 SQBLiAFLnYwppzqJitsBoUN9trUmHz6oGdbglY8IVerO3Gbzpc33b3DhG73vYG+pl5
 UtEL4o3qK2SEhENMA/5BZc9MnaLvhuAMaosehlfNIQHharQu8cn2lr6NMJNPhL31uy
 GbLKdCZcT0YGqK6GpybdD3lX1r1t/Kw1dSe+tqIiYwTQLKSLEBDXriCrivzQGKPlla
 H7KEaQ1Z3fe8BzFIj/gncvcHdJpQBv+nmnE8ahMLHIdzfZ8a3AoLt+OpVSe1omA7Me
 ASLIA1WycDRuA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=c1eNeo72
Subject: [Buildroot] [PATCH 12/23] package/python-hid: bump version to 1.0.8
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
Cc: Grzegorz Blach <grzegorz@blach.pl>,
 James Hilliard <james.hilliard1@gmail.com>,
 Romain Naour <romain.naour@gmail.com>, Mauro Condarelli <mc5686@mclink.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-hid/python-hid.hash | 4 ++--
 package/python-hid/python-hid.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-hid/python-hid.hash b/package/python-hid/python-hid.hash
index d03757771b..b990a2a9f8 100644
--- a/package/python-hid/python-hid.hash
+++ b/package/python-hid/python-hid.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/hid/json
-md5  1954df0dce4e15afd89197e898039e92  hid-1.0.6.tar.gz
-sha256  48d764d7ae9746ba123b96dbf457893ca80268b7791c4b1d2e051310eeb83860  hid-1.0.6.tar.gz
+md5  231df641df11d452dae6b579ba2ccf6a  hid-1.0.8.tar.gz
+sha256  5ca129a7b9434ace5e3e429c1092a16792feffaf067a46b666e9c586872cdcfe  hid-1.0.8.tar.gz
 # Locally computed sha256 checksums
 sha256  5524b425acacdfedeca3f959980f0cd38b00176ebbb292e4a96c520d6074353d  LICENSE
diff --git a/package/python-hid/python-hid.mk b/package/python-hid/python-hid.mk
index 2f65bd1412..1e422dc97b 100644
--- a/package/python-hid/python-hid.mk
+++ b/package/python-hid/python-hid.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HID_VERSION = 1.0.6
+PYTHON_HID_VERSION = 1.0.8
 PYTHON_HID_SOURCE = hid-$(PYTHON_HID_VERSION).tar.gz
-PYTHON_HID_SITE = https://files.pythonhosted.org/packages/50/b8/5f470948262b6cdda8e1b2382b19f67c57eacda1e07a14322807b911e0ce
+PYTHON_HID_SITE = https://files.pythonhosted.org/packages/29/42/9cd3eab530ffae5e0ff880c575fd18cfdfe292b71f1e9872c392329f35fd
 PYTHON_HID_SETUP_TYPE = setuptools
 PYTHON_HID_LICENSE = MIT
 PYTHON_HID_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
