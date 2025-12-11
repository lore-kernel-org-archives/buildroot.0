Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C411AD43343
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 19:56:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96A0E402DD;
	Thu, 11 Dec 2025 19:56:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oTMh22UoRInB; Thu, 11 Dec 2025 19:56:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BFDCF402EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765482969;
	bh=va2yNC8oCpfjWMVe+6zuB3OMlEHraADjcVHAmYX2Ytc=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=dwaIU/jQyX3+DWMHfx7LxUhV1/ZauxorC9D2PYeeO2V5kxoPlrKbAzOF4SMYFqrFL
	 IqiGCivYcrMpNrvvOSNgmhZ+PkCKvPOA5S11smGzTpg+nAW4Nc0sVM3aGeKmAIbDVU
	 fceSTVl3XEzPAL8tZrVXhJ9NIlqKnBaLGKA+8WX3rDFNBgI5gnNV57b9gnl919koCb
	 1HQd5Qkp6vZLNVr7oFl2BSu6F2Rl9MQcttnQve9HwAxCY3b/BYq105JpxR8gAzqxu6
	 58vRdsJusdjbcefssyCj/YtPGCWp4tDrdO3/AL3g8xe09G9JQ25Tgq0gAPZ0qe0ELy
	 y7ISwGjxxh9jQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFDCF402EE;
	Thu, 11 Dec 2025 19:56:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 574B92C6
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:56:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3D514606B6
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:56:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R_ZBwlfoVkAt for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 19:56:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2FE7960657
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2FE7960657
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2FE7960657
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:56:07 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b151.dip0.t-ipconnect.de [84.161.177.81])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E691AA4C3596;
 Thu, 11 Dec 2025 20:55:34 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39350)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vTml7-000000008Hh-2JYe;
 Thu, 11 Dec 2025 19:55:29 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 11 Dec 2025 20:55:26 +0100
Message-ID: <20251211195527.3276900-20-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251211195527.3276900-1-bernd@kuhls.net>
References: <20251211195527.3276900-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765482934;
 bh=oS99O8KQpuVX+hd2QZebx/fC60bYF9P1rVs8IscaYqA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=VDqiBihKu0deIASzm3abmLsdIt6FqcgMV1cL0mD7zpR/tzO7jvVyp2AzFRZ0bRQRz
 w3o9JJwkUOORio1GKI2yOs2JplE93Et8vevPv/IKR7I0nIYSImMmd4PUxMojfkN8cv
 YG9a72XFCqe7UhjDOYL+/Ahi1YU4mnVcYDEfvaiM/B2/i2Ak9YmJ6JJTs1q9PQIwBO
 j2Mi0jD48nSk5OimQDUW8Udc9JAPdWVDQLlf8wao88lLChyyn7KMzxhV+AR1ZjVsps
 T5CgdhrtTx/PW4r3qq4gJ5OKcVLubw1iqINmQhczEUbGvGVpa3K3OBw2qn4Vs1mHtk
 IGLkqrYNGH7+Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=VDqiBihK
Subject: [Buildroot] [PATCH/next 20/21] package/python-humanize: bump
 version to 4.14.0
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

https://github.com/python-humanize/humanize/releases

Updated project URL according to https://pypi.org/project/humanize/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-humanize/Config.in            | 2 +-
 package/python-humanize/python-humanize.hash | 4 ++--
 package/python-humanize/python-humanize.mk   | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-humanize/Config.in b/package/python-humanize/Config.in
index f4f4e67b65..b47fec5027 100644
--- a/package/python-humanize/Config.in
+++ b/package/python-humanize/Config.in
@@ -6,4 +6,4 @@ config BR2_PACKAGE_PYTHON_HUMANIZE
 	  duration ('3 minutes ago') or into a human readable size or
 	  throughput.
 
-	  http://github.com/jmoiron/humanize
+	  https://github.com/python-humanize/humanize
diff --git a/package/python-humanize/python-humanize.hash b/package/python-humanize/python-humanize.hash
index ea30ca5c22..86dfd80b78 100644
--- a/package/python-humanize/python-humanize.hash
+++ b/package/python-humanize/python-humanize.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/humanize/json
-md5  c37298e6bc6604b54aeb0e158c7c0512  humanize-4.11.0.tar.gz
-sha256  e66f36020a2d5a974c504bd2555cf770621dbdbb6d82f94a6857c0b1ea2608be  humanize-4.11.0.tar.gz
+md5  acac6b2378dd0d9b1d9d1ffefb08e00b  humanize-4.14.0.tar.gz
+sha256  2fa092705ea640d605c435b1ca82b2866a1b601cdf96f076d70b79a855eba90d  humanize-4.14.0.tar.gz
 # Locally computed sha256 checksums
 sha256  8ba6c18112a431400ad3c743f70670079b302545d98884fc2f28a91c383a0380  LICENCE
diff --git a/package/python-humanize/python-humanize.mk b/package/python-humanize/python-humanize.mk
index 4915da2cef..df2e99043a 100644
--- a/package/python-humanize/python-humanize.mk
+++ b/package/python-humanize/python-humanize.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HUMANIZE_VERSION = 4.11.0
+PYTHON_HUMANIZE_VERSION = 4.14.0
 PYTHON_HUMANIZE_SOURCE = humanize-$(PYTHON_HUMANIZE_VERSION).tar.gz
-PYTHON_HUMANIZE_SITE = https://files.pythonhosted.org/packages/6a/40/64a912b9330786df25e58127194d4a5a7441f818b400b155e748a270f924
+PYTHON_HUMANIZE_SITE = https://files.pythonhosted.org/packages/b6/43/50033d25ad96a7f3845f40999b4778f753c3901a11808a584fed7c00d9f5
 PYTHON_HUMANIZE_SETUP_TYPE = hatch
 PYTHON_HUMANIZE_LICENSE = MIT
 PYTHON_HUMANIZE_LICENSE_FILES = LICENCE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
