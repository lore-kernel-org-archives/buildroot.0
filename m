Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E79A5D5B864
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 19:19:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C01ED40A79;
	Mon, 15 Dec 2025 19:19:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pYKb1zi-0CNL; Mon, 15 Dec 2025 19:19:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E513A40A7B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765826359;
	bh=8rJyEOqYUXjlPKPS5vFhZ14K3KZ+wfg+nmEdkG4KL68=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=L8iV10PfH1s6N2pnAw/nDfrIWc5wh+l1oGrxh5pSbPwziVoJFBcuFC1haqG5fZDeI
	 rX3rIbhecBX/klkqUinSB07CBMNXGvHLot1aN6chgLTQeSB11LrNF1f/qzXLW6ZEKv
	 eAhCz0yUinufVkFD0FoXm0SaF6e9zah90PsdDRmd3nJnCyAJrvdX8nt0e9pasjAym5
	 32iUsJBGK+xQ4ZacNG5ZENImk2ewB0WQw6GAaUd6NyyJTa873rduY16Rpkyiyoe7Yk
	 GeRcuP0r9i1+4WDUA7cof+5vH/9SX2qQjBi0h3k85e4CvrmCZ/FBsbaMGPjGvwU9hw
	 1IYuf1jYCdgFg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E513A40A7B;
	Mon, 15 Dec 2025 19:19:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id CC1DE255
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 19:19:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B372B40A7B
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 19:19:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yn1tm3UcTk6w for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 19:19:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A82E940A79
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A82E940A79
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A82E940A79
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 19:19:16 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1ba4b.dip0.t-ipconnect.de [84.161.186.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 42D63A4C436E;
 Mon, 15 Dec 2025 20:14:31 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40828)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vVE1S-000000005ED-0vyh;
 Mon, 15 Dec 2025 19:14:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 15 Dec 2025 20:14:14 +0100
Message-ID: <20251215191416.421755-25-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251215191416.421755-1-bernd@kuhls.net>
References: <20251215191416.421755-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765826071;
 bh=k1VJSrHy7dXsqVdcRZojurOOO+iNWk+Vu8s+sfpiEeg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=tNSRtn4zGtLdMF8WA2LuPW1EoRpnDiwO3jR1zameFeeR7R1XfulR9wLJ3dzsMz580
 TDYm1fZ5hRAgSMnGm4zGTygf8YnK9goRTpRj3gkEK3WX0PfV8eE9ty3TEOJn12tm2l
 qUMWDT3j5mdB0e7Qk8toblWtbNVl2IOVNw6QTrW21uUrh7cOW8MrTpEFc88dwnyFeM
 WTLZBksi1ADTDk5zKcFW48z61OswmETfyZC0SlG/avGl7NI9UAcL7gkDMZ68DQdATv
 xxoA7hf8H0ZcG26B4HeSVkQlhVmTZyHjnufA3j7C99nDMKX8GaFx4WM8Q6bwV2Ji8O
 dh+1y8gYbU+xA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=tNSRtn4z
Subject: [Buildroot] [PATCH 25/27] package/python-s3transfer: bump version
 to 0.16.0
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Grzegorz Blach <grzegorz@blach.pl>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Witold Lipieta <witold.lipieta@thaumatec.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Falco Hyfing <hyfinglists@gmail.com>, Mauro Condarelli <mc5686@mclink.it>,
 Steve Calfee <stevecalfee@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/boto/s3transfer/blob/0.16.0/CHANGELOG.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-s3transfer/python-s3transfer.hash | 4 ++--
 package/python-s3transfer/python-s3transfer.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-s3transfer/python-s3transfer.hash b/package/python-s3transfer/python-s3transfer.hash
index 0ebf07473a..8c9c9bb873 100644
--- a/package/python-s3transfer/python-s3transfer.hash
+++ b/package/python-s3transfer/python-s3transfer.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/s3transfer/json
-md5  7ae51a57b7d5703ecf9d348b6f8a20ed  s3transfer-0.14.0.tar.gz
-sha256  eff12264e7c8b4985074ccce27a3b38a485bb7f7422cc8046fee9be4983e4125  s3transfer-0.14.0.tar.gz
+md5  8be597569deb76004da45a021f05e0ea  s3transfer-0.16.0.tar.gz
+sha256  8e990f13268025792229cd52fa10cb7163744bf56e719e0b9cb925ab79abf920  s3transfer-0.16.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/python-s3transfer/python-s3transfer.mk b/package/python-s3transfer/python-s3transfer.mk
index 48590fdf0f..e9dbf4aa03 100644
--- a/package/python-s3transfer/python-s3transfer.mk
+++ b/package/python-s3transfer/python-s3transfer.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_S3TRANSFER_VERSION = 0.14.0
+PYTHON_S3TRANSFER_VERSION = 0.16.0
 PYTHON_S3TRANSFER_SOURCE = s3transfer-$(PYTHON_S3TRANSFER_VERSION).tar.gz
-PYTHON_S3TRANSFER_SITE = https://files.pythonhosted.org/packages/62/74/8d69dcb7a9efe8baa2046891735e5dfe433ad558ae23d9e3c14c633d1d58
+PYTHON_S3TRANSFER_SITE = https://files.pythonhosted.org/packages/05/04/74127fc843314818edfa81b5540e26dd537353b123a4edc563109d8f17dd
 PYTHON_S3TRANSFER_SETUP_TYPE = setuptools
 PYTHON_S3TRANSFER_LICENSE = Apache-2.0
 PYTHON_S3TRANSFER_LICENSE_FILES = LICENSE.txt
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
