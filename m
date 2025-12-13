Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75FB8D5AE41
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 14:07:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B6B540D55;
	Sat, 13 Dec 2025 14:07:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NCnstbjLRHoA; Sat, 13 Dec 2025 14:07:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0235940C9E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765634831;
	bh=g+/QhojMD6bA17zkLnLgV0zihnd43tkE5+VoN8h3rrg=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=KbIv8MEeH+mcGV2Wezqn8vD5t5eJzgAtTBL+XaDuMUZMsJSBgO64gegmvgL0wv13J
	 ycxe5bQGEdd9/tOQep5x/gym8M4I2pqusNgplZKbxx+RLfxwbjOcDjxYEgAwCMdPv/
	 zdL/6HM5To0RGddVfYYSklj6+3XiUp6bTIOFmFdDE7izD/H2k0iNfEo3QGKmeIIV7+
	 goriBj/ztYXfU9SkG8dC1KdJbKQoFm9giGZUXCx4cQi71MIloA19shxYJ8dDD6AOdD
	 qvlXwnz1r/vL9cApeDXb/PAAFEKoNr8E7QF6NJYRNMjF5OVslUlnKrJM3x8Npxmmqp
	 YK5IXmo1BHODg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0235940C9E;
	Sat, 13 Dec 2025 14:07:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2628C2C1
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 14:07:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2391160890
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 14:07:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Oyi43guTlL6T for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 14:07:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1114C6087E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1114C6087E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1114C6087E
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 14:07:09 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cc21.dip0.t-ipconnect.de [79.214.204.33])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4DFCCA4C406F;
 Sat, 13 Dec 2025 15:05:29 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49778)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vUQFP-000000004dt-0VDA;
 Sat, 13 Dec 2025 14:05:23 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 13 Dec 2025 15:05:20 +0100
Message-ID: <20251213140522.1322763-12-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251213140522.1322763-1-bernd@kuhls.net>
References: <20251213140522.1322763-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765634729;
 bh=1kQI43ykZ0eF+4AJjPZael3lxMa31M4/fL17vwnQ8uo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=BWY0U2SIOtTFDEMKPM+wVUKmvrkxJAhe0aED+6AcWOPd7vpbboKf2P2BuRwaSNczc
 XBpiInKCy9L3tCPqmUVEkqSaGt9qcge9gILHN8EmmcK3743b0U0kB42IxDgSQNgL7d
 t/P1h6t3+SEWw1eut6I0B/hBHeTQrIOQ7OD1isCNFi2x/FZ0Sn8fONmKwLB+cO6Nvh
 IVWqhbjj9tzL+sSegw5HRzBErVWz55SCv32ffqYLJjZhNU6yFcnoPOJlK6tz3D7Kul
 OtZpZ5qrnFEmuZ45jxpltXDg1cLokoX5Qt+AV9p7s93Tou8HiWcs6NHmSwAR0AO3E4
 QxUNVegXzq8Pw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=BWY0U2SI
Subject: [Buildroot] [PATCH 12/14] package/python-networkx: bump version to
 3.6.1
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
Cc: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Julien Olivain <ju.o@free.fr>, James Hilliard <james.hilliard1@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/networkx/networkx/blob/networkx-3.6.1/doc/release/release_3.6.rst
https://github.com/networkx/networkx/blob/networkx-3.6.1/doc/release/release_3.6.1.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-networkx/python-networkx.hash | 4 ++--
 package/python-networkx/python-networkx.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-networkx/python-networkx.hash b/package/python-networkx/python-networkx.hash
index bd8326f104..5c39a1ebbf 100644
--- a/package/python-networkx/python-networkx.hash
+++ b/package/python-networkx/python-networkx.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/networkx/json
-md5  9d5221bbc2eca0190663e887b91e75c6  networkx-3.5.tar.gz
-sha256  d4c6f9cf81f52d69230866796b82afbccdec3db7ae4fbd1b65ea750feed50037  networkx-3.5.tar.gz
+md5  eb7fada9285b28cc9d6327c19240a793  networkx-3.6.1.tar.gz
+sha256  26b7c357accc0c8cde558ad486283728b65b6a95d85ee1cd66bafab4c8168509  networkx-3.6.1.tar.gz
 # Locally computed sha256 checksums
 sha256  3cf7c3a179d817b23b8b8568211769fefdf93797d207d984b8b2fa24d0220b33  LICENSE.txt
diff --git a/package/python-networkx/python-networkx.mk b/package/python-networkx/python-networkx.mk
index 41d33f1560..d2495590be 100644
--- a/package/python-networkx/python-networkx.mk
+++ b/package/python-networkx/python-networkx.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_NETWORKX_VERSION = 3.5
+PYTHON_NETWORKX_VERSION = 3.6.1
 PYTHON_NETWORKX_SOURCE = networkx-$(PYTHON_NETWORKX_VERSION).tar.gz
-PYTHON_NETWORKX_SITE = https://files.pythonhosted.org/packages/6c/4f/ccdb8ad3a38e583f214547fd2f7ff1fc160c43a75af88e6aec213404b96a
+PYTHON_NETWORKX_SITE = https://files.pythonhosted.org/packages/6a/51/63fe664f3908c97be9d2e4f1158eb633317598cfa6e1fc14af5383f17512
 PYTHON_NETWORKX_LICENSE = BSD-3-Clause
 PYTHON_NETWORKX_LICENSE_FILES = LICENSE.txt
 PYTHON_NETWORKX_CPE_ID_VENDOR = python
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
