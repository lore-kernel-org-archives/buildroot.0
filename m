Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95246E67483
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 21:45:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A768818CA;
	Sat, 20 Dec 2025 21:45:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hHtF6pylmL2Q; Sat, 20 Dec 2025 21:45:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2028819B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766267109;
	bh=PY+wBjC5t34p4hDC/VDXUAYdJw73YX8nopq2J6lnLZI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=rhWx+6PRligHblUp1wymrHIG9hsd2GDVXcxqJ7oDQulx5TjUy8UZMyNsVuEDkj9zm
	 LBC07uRB1MPoHsPYvkyCq/zB6c1o+xzwlu4FMXr+GHiN1SsB81tm7zvqGQ9WzKYnUl
	 njXp+uUvN1/KAOmhG5r4yhTWKe8Tv/1foHq/gxL6t4EmGwDSXGkYFmWTU9oYGzk8/c
	 7AgIMa7vqb7QW70B1P78U5tsOv718Zrz9QcMJvn4TNf4Lyuq/97G2X4Ubt604bQ3Ot
	 +5ui/Hm5X22W8Dl5xVlFTLPmU3qnsHCeMLiC2Kv8jweFtIG1i3EbuzB8ZzryLrMVt2
	 ifmomSPFUjv7w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F2028819B8;
	Sat, 20 Dec 2025 21:45:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id EA830119
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:45:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D042B40923
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:45:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5QmzQezv6Lgp for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 21:45:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C65D04091E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C65D04091E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C65D04091E
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:45:06 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c714.dip0.t-ipconnect.de [79.214.199.20])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2406CA4C4F60;
 Sat, 20 Dec 2025 22:42:11 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39116)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vX4iF-000000002DO-2TJL;
 Sat, 20 Dec 2025 21:42:07 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 20 Dec 2025 22:42:00 +0100
Message-ID: <20251220214206.1089100-12-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251220214206.1089100-1-bernd@kuhls.net>
References: <20251220214206.1089100-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766266931;
 bh=LqpFdMF6XBaN9DsAkTJsfyxFzKKMtakDXGvGK6rRzOw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=VCYyd/WuxROy5GhZPYsDVQ4ZlOQIMo9jG8izSKLrNiCUl67V7qYYIVF045h0ujI4v
 yg36bd+Wb+wtTTuwJL1pyJMLsdNCYl7aHNWT1NTdN1zVPxD48/48UvuK09S+829Oo6
 FDLnzq3hLkYftGMDdcySB742KGcyI03OaexO7C2EGCaS7+MkfXiovYlthi9VnkCfld
 sv1PidYNVnnEgf8/0DuVzamM1/Sy6tjN5tW7CmiSA6DK4gJTWBpvL8YBtRC0ND4qS/
 4vhSCUArc0ccrORlzG41Sy4wEhJIgMyrYAAhBpQsvUFk6LjpOn53bkMJjzMO18rQm7
 vX48OpQUkKTcA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=VCYyd/Wu
Subject: [Buildroot] [PATCH 12/18] package/python-incremental: bump version
 to 24.11.0
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
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Grzegorz Blach <grzegorz@blach.pl>, Joris Offouga <offougajoris@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/twisted/incremental/blob/incremental-24.11.0/NEWS.rst

Switched setup type to hatch:
https://github.com/twisted/incremental/commit/c7104f892616fa37f99c6620cc85016d2f86df88

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-incremental/python-incremental.hash | 4 ++--
 package/python-incremental/python-incremental.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-incremental/python-incremental.hash b/package/python-incremental/python-incremental.hash
index 7707495a0a..02f6690b90 100644
--- a/package/python-incremental/python-incremental.hash
+++ b/package/python-incremental/python-incremental.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/incremental/json
-md5  d946fb1a369c77693b4dab8ac9b13596  incremental-24.7.2.tar.gz
-sha256  fb4f1d47ee60efe87d4f6f0ebb5f70b9760db2b2574c59c8e8912be4ebd464c9  incremental-24.7.2.tar.gz
+md5  5d7524d053b182d713981ea20079ed76  incremental-24.11.0.tar.gz
+sha256  87d3480dbb083c1d736222511a8cf380012a8176c2456d01ef483242abbbcf8c  incremental-24.11.0.tar.gz
 # Locally computed sha256 checksums
 sha256  d043bc8899b4695de1f4511d8f507b927e11723b981ce600fa3ef7b73954afa5  LICENSE
diff --git a/package/python-incremental/python-incremental.mk b/package/python-incremental/python-incremental.mk
index 9a1432ebd2..e8717db294 100644
--- a/package/python-incremental/python-incremental.mk
+++ b/package/python-incremental/python-incremental.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_INCREMENTAL_VERSION = 24.7.2
+PYTHON_INCREMENTAL_VERSION = 24.11.0
 PYTHON_INCREMENTAL_SOURCE = incremental-$(PYTHON_INCREMENTAL_VERSION).tar.gz
-PYTHON_INCREMENTAL_SITE = https://files.pythonhosted.org/packages/27/87/156b374ff6578062965afe30cc57627d35234369b3336cf244b240c8d8e6
-PYTHON_INCREMENTAL_SETUP_TYPE = setuptools
+PYTHON_INCREMENTAL_SITE = https://files.pythonhosted.org/packages/ef/3c/82e84109e02c492f382c711c58a3dd91badda6d746def81a1465f74dc9f5
+PYTHON_INCREMENTAL_SETUP_TYPE = hatch
 PYTHON_INCREMENTAL_LICENSE = MIT
 PYTHON_INCREMENTAL_LICENSE_FILES = LICENSE
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
