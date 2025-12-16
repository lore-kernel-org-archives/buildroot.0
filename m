Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8D2DD637A1
	for <buildroot@archiver.kernel.org>; Tue, 16 Dec 2025 19:44:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF21A61068;
	Tue, 16 Dec 2025 19:44:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DfId0DgqEa1R; Tue, 16 Dec 2025 19:44:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B1F966104C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765914254;
	bh=hJjaIBbX+si9KJluqP3R5s00lIrQ4Lp+XavsV2TZrdo=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=GbmPCIG64+Mf1cesCSz7nncT6HIKYFyOBxFAKBa/yxQYyUuxK0yHN+YHTS5V6b0OB
	 mdLNrQX2mr+NMEKjzhVELgiaQylYknRNy9hFk858WUlw8BlJFT1jnYmRhta79xc3Ha
	 eVfHI7Gn1xhqc6hvS9SpVxRBtRyU3TgN53xQcBAOBrWYJscY81ZrtislvCJIDC1bXq
	 /IXYCwnl8bdC/aPE+tFI3vm/oBgC87in1300zhChQBdspAupauQKZxQPfn0W+cH1DK
	 9DH02ZBXvvwf3gWeLCsBzlApm4NxTOkguTOr5IjK5kGG/3T3Jyq3KkYWrVFUTv5HRt
	 q6OC4nZH8l0rQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1F966104C;
	Tue, 16 Dec 2025 19:44:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 07E18364
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 19:44:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0535E813D8
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 19:44:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MWDPR7mLoDSF for <buildroot@buildroot.org>;
 Tue, 16 Dec 2025 19:44:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EFD4280AA0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFD4280AA0
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EFD4280AA0
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 19:44:11 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1ba4b.dip0.t-ipconnect.de [84.161.186.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D0DEFA4C45C4;
 Tue, 16 Dec 2025 20:41:30 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47366)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vVav9-000000000Bj-4AeF;
 Tue, 16 Dec 2025 19:41:20 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 16 Dec 2025 20:41:08 +0100
Message-ID: <20251216194119.3020421-15-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251216194119.3020421-1-bernd@kuhls.net>
References: <20251216194119.3020421-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765914090;
 bh=e6VS57IOLypvtxnpYL8xh8BEL2+KoDlhZuIkXqYa1ek=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=A2MrEXpY//ZitQBwxzWT3ru/Nc35IYk0pAg9xfAI0o+RoftA69swjR0rHdFxOqCw+
 YtNlnpd73HVBJ9hqe2Q57reTRUEqkgddIltxiRLwWcdDqCxWFKP/ALYbyU5CQaacZJ
 2zVI3tPxBhBT9TIO41sKcQOigrQR1Fvlkh8soHJwcLYwubvUuIbnbtXyZpvVHZyy7F
 q1N86S91GAy97wHVz2eVTiohEDNYrQLvVqCHeN1JbAQeuyds3pwM3yvV5TtqjD+kLt
 kSDpdMcK+UZIg0S09YOBQtO0pHMn2H1BUajLSuh7OBOznm6Kw2dUhVXf8RSl0lDzhh
 a1QvKFWziUmEw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=A2MrEXpY
Subject: [Buildroot] [PATCH 15/26] package/python-types-python-dateutil:
 bump version to 2.9.0.20251115
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

https://github.com/typeshed-internal/stub_uploader/blob/main/data/changelogs/python-dateutil.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../python-types-python-dateutil.hash                         | 4 ++--
 .../python-types-python-dateutil.mk                           | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-types-python-dateutil/python-types-python-dateutil.hash b/package/python-types-python-dateutil/python-types-python-dateutil.hash
index 321e7f56c5..29cd158640 100644
--- a/package/python-types-python-dateutil/python-types-python-dateutil.hash
+++ b/package/python-types-python-dateutil/python-types-python-dateutil.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/types-python-dateutil/json
-md5  75621f393711ce76bb7a7e46902384db  types_python_dateutil-2.9.0.20241206.tar.gz
-sha256  18f493414c26ffba692a72369fea7a154c502646301ebfe3d56a04b3767284cb  types_python_dateutil-2.9.0.20241206.tar.gz
+md5  e55e57c4c0fc636b20f1ac3b48b49469  types_python_dateutil-2.9.0.20251115.tar.gz
+sha256  8a47f2c3920f52a994056b8786309b43143faa5a64d4cbb2722d6addabdf1a58  types_python_dateutil-2.9.0.20251115.tar.gz
 # Locally computed sha256 checksums
 sha256  295f8538c94ae5c3043301cf7cff1c852dab6a786a8ddee471e061b40d5ecabe  LICENSE
diff --git a/package/python-types-python-dateutil/python-types-python-dateutil.mk b/package/python-types-python-dateutil/python-types-python-dateutil.mk
index f07e327b86..6a9c19185a 100644
--- a/package/python-types-python-dateutil/python-types-python-dateutil.mk
+++ b/package/python-types-python-dateutil/python-types-python-dateutil.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TYPES_PYTHON_DATEUTIL_VERSION = 2.9.0.20241206
+PYTHON_TYPES_PYTHON_DATEUTIL_VERSION = 2.9.0.20251115
 PYTHON_TYPES_PYTHON_DATEUTIL_SOURCE = types_python_dateutil-$(PYTHON_TYPES_PYTHON_DATEUTIL_VERSION).tar.gz
-PYTHON_TYPES_PYTHON_DATEUTIL_SITE = https://files.pythonhosted.org/packages/a9/60/47d92293d9bc521cd2301e423a358abfac0ad409b3a1606d8fbae1321961
+PYTHON_TYPES_PYTHON_DATEUTIL_SITE = https://files.pythonhosted.org/packages/6a/36/06d01fb52c0d57e9ad0c237654990920fa41195e4b3d640830dabf9eeb2f
 PYTHON_TYPES_PYTHON_DATEUTIL_SETUP_TYPE = setuptools
 PYTHON_TYPES_PYTHON_DATEUTIL_LICENSE = Apache-2.0
 PYTHON_TYPES_PYTHON_DATEUTIL_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
