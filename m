Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAAECD609DE
	for <buildroot@archiver.kernel.org>; Tue, 16 Dec 2025 19:45:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A24CE610C2;
	Tue, 16 Dec 2025 19:45:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H9TyF67suDlA; Tue, 16 Dec 2025 19:45:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E404D61051
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765914303;
	bh=O/RToMyCzYZF6ucQZVCXql79LbJnU0IZ1zmr7HG7ie4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=tItGwDF6Wjg31vHoDuB9imEVhgJgHETMvrQYwbEGZQJAq9ToxfHjtO2VpqUDJtelv
	 oDTeoqp1IsoINO/XiimS+qtU+1VMR8yoBzHz9SBCn3NptU/jyYtFdd/YAFoh3d/DrO
	 1Q9qrUElFuFdbXBzIcTCqvrqVzjoCm50ZQh1asBw2QwjR5Ak6z7Ws7XV7yEUXUHZmD
	 HmS2eMS3PtrcdREq4JqA4CRX1DV6rJHNx3eR4Fc9N0odz9F+8teQqbg6BgO2vbSMdV
	 d5AuggkBqKsMTs5nGzQEqwKal0OBAW16TQ8X89npaYT029zq9pVHEMaBJlhjO4awBK
	 E4vxFQXLlVw4w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E404D61051;
	Tue, 16 Dec 2025 19:45:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9854C372
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 19:45:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7E68361065
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 19:45:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zzpJcDMqsbTn for <buildroot@buildroot.org>;
 Tue, 16 Dec 2025 19:45:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6238960DA1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6238960DA1
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6238960DA1
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 19:45:00 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1ba4b.dip0.t-ipconnect.de [84.161.186.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 83F2CA4C45D5;
 Tue, 16 Dec 2025 20:41:31 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47366)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vVavA-000000000Bj-1G4k;
 Tue, 16 Dec 2025 19:41:20 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 16 Dec 2025 20:41:12 +0100
Message-ID: <20251216194119.3020421-19-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251216194119.3020421-1-bernd@kuhls.net>
References: <20251216194119.3020421-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765914091;
 bh=zttMQy18jntm9FVgubCu5gavYKjVotD7f3+2c7qpl0s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=kW9lXoh9ZqMAY6u5r2S3neU81OQ6UX5qMSAW/IvekNQVfQJUnF6Eca994Jj98nVAr
 RDudYvm5fyR4On1ok+6gbk7+oG9RUPKSdYgvEj+QNfB++enQ1gXgV4Q/zy/0t+iths
 hHTrJ3Kao+bjDf3JkwK6GD6tA1ir2BVzhmLqW7iccGufB6uq3sE8O1kfZ0wj+bxg1E
 dzhpDR2ckMiXZ4c3oyt9+19e3+3Mrfi2AOk3UIK5zA3gkrzJIrF5MfogPyNVeKFJtT
 +nVl+NZA3RxHYPQMK5BauBH8ZfLqDE5ViFNgbBcGchQ6zJmmX4ylp7mMaBRonlf0lv
 fX/GnKBv2+/vw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=kW9lXoh9
Subject: [Buildroot] [PATCH 19/26] package/python-weasyprint: bump version
 to 67.0
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
 Christophe Vu-Brugier <cvubrugier@fastmail.fm>,
 James Hilliard <james.hilliard1@gmail.com>,
 Mauro Condarelli <mc5686@mclink.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/Kozea/WeasyPrint/blob/v67.0/docs/changelog.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-weasyprint/python-weasyprint.hash | 4 ++--
 package/python-weasyprint/python-weasyprint.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-weasyprint/python-weasyprint.hash b/package/python-weasyprint/python-weasyprint.hash
index 9c51ad95a3..d67415bcc6 100644
--- a/package/python-weasyprint/python-weasyprint.hash
+++ b/package/python-weasyprint/python-weasyprint.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/weasyprint/json
-md5  9e87ec00619aad446c51f679117be676  weasyprint-64.0.tar.gz
-sha256  1ceb3ea6306db4a3d06df0eafae3a5a6e879c35c40091aa8ceb5bcb143e80b29  weasyprint-64.0.tar.gz
+md5  55d8d8d72a1e7e6b209f7485fd5ad1f6  weasyprint-67.0.tar.gz
+sha256  fdfbccf700e8086c8fd1607ec42e25d4b584512c29af2d9913587a4e448dead4  weasyprint-67.0.tar.gz
 # Locally computed sha256 checksums
 sha256  bfd14eccfa6100575460e685556b183399d4bd335904e3c9521b0116d21c54da  LICENSE
diff --git a/package/python-weasyprint/python-weasyprint.mk b/package/python-weasyprint/python-weasyprint.mk
index 7edb9f28da..73bcb1b12a 100644
--- a/package/python-weasyprint/python-weasyprint.mk
+++ b/package/python-weasyprint/python-weasyprint.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WEASYPRINT_VERSION = 64.0
+PYTHON_WEASYPRINT_VERSION = 67.0
 PYTHON_WEASYPRINT_SOURCE = weasyprint-$(PYTHON_WEASYPRINT_VERSION).tar.gz
-PYTHON_WEASYPRINT_SITE = https://files.pythonhosted.org/packages/e3/04/c73f99531bce81d4ced5cd18a159855de261f83843a5633acd67ae327933
+PYTHON_WEASYPRINT_SITE = https://files.pythonhosted.org/packages/fd/bc/79a65b3a406cb62a1982fec8b49134b25a3b31abb094ca493c9fddff5492
 PYTHON_WEASYPRINT_SETUP_TYPE = flit
 PYTHON_WEASYPRINT_LICENSE = BSD-3-Clause
 PYTHON_WEASYPRINT_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
