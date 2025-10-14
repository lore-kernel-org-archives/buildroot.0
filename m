Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24A71CCD184
	for <buildroot@archiver.kernel.org>; Tue, 14 Oct 2025 18:53:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EEF3183E12;
	Tue, 14 Oct 2025 18:53:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aTvQss-VxI5C; Tue, 14 Oct 2025 18:52:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 45F2983E10
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45F2983E10;
	Tue, 14 Oct 2025 18:52:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D867BC
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 18:52:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5443783E10
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 18:52:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B_3Pp4nnI2x1 for <buildroot@buildroot.org>;
 Tue, 14 Oct 2025 18:52:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5406583E05
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5406583E05
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5406583E05
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 18:52:56 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a02db.dip0.t-ipconnect.de [91.58.2.219])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9E88EA4C6C3A;
 Tue, 14 Oct 2025 20:51:14 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49012)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v8k77-000000003qG-27o0;
 Tue, 14 Oct 2025 18:51:13 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 14 Oct 2025 20:51:08 +0200
Message-ID: <20251014185113.3583315-9-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251014185113.3583315-1-bernd@kuhls.net>
References: <20251014185113.3583315-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760467874;
 bh=48MTFwxNwbvJaNiOo0KjKWA4FGSHQ8xeuVj1hVEgWjs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=uPDUYOWbDDLIYEcKKdYA60UP4w/1ArKJpT7vgnh38g9JSWIh/3FBoDkT2hjKYyqtD
 AyuZy66Qnv+7t4NUyjqWQOMfnU0/8cb96yojpcAIiFb9ma/yMHij0pDXUryb7UCqJ3
 9HuwcCMRyGOBg7Mp3PPLosd2ND9tyu/bFtGGWGAjk6kR4gLNmRVTid6cdOAe1aCS1L
 z1JBoY1gNahX1zt8q6/R4+dxl3ACG2wz500BoHqwzMTNvEmvy1zXdnPthZy2WeOsPj
 eSL1hNUb3JJgPGMLPPe5iBBtF7+Y0OCRwm1kAD2x5aQpK8d5ZDSFe2aYC2ymORy9dI
 R8b+6hK4QrivQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=uPDUYOWb
Subject: [Buildroot] [PATCH 09/14] package/python-xlsxwriter: bump version
 to 3.2.9
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
 Christophe Vu-Brugier <cvubrugier@fastmail.fm>,
 James Hilliard <james.hilliard1@gmail.com>,
 Vinicius Tinti <viniciustinti@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Updated license hash due to copyright year bump:
https://github.com/jmcnamara/XlsxWriter/commit/35240021021faafa1b70835876560ecde32d3591

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-xlsxwriter/python-xlsxwriter.hash | 6 +++---
 package/python-xlsxwriter/python-xlsxwriter.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-xlsxwriter/python-xlsxwriter.hash b/package/python-xlsxwriter/python-xlsxwriter.hash
index 009ebe9c36..92c3dee1d3 100644
--- a/package/python-xlsxwriter/python-xlsxwriter.hash
+++ b/package/python-xlsxwriter/python-xlsxwriter.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/xlsxwriter/json
-md5  881932c4645db35b39b1da684af42a01  XlsxWriter-3.2.1.tar.gz
-sha256  97618759cb264fb6a93397f660cca156ffa9561743b1823dafb60dc4474e1902  XlsxWriter-3.2.1.tar.gz
+md5  9b577c64f83dec8e357dab62be575e5a  xlsxwriter-3.2.9.tar.gz
+sha256  254b1c37a368c444eac6e2f867405cc9e461b0ed97a3233b2ac1e574efb4140c  xlsxwriter-3.2.9.tar.gz
 # Locally computed sha256 checksums
-sha256  272e8fbd91096feeea0a250775ed83dfed17143ee4acd5d9567a1e42104c038f  LICENSE.txt
+sha256  cf08b60a4ded986b58a617cb8304373bda5c4eff42fb4e30d7597b616e116e87  LICENSE.txt
diff --git a/package/python-xlsxwriter/python-xlsxwriter.mk b/package/python-xlsxwriter/python-xlsxwriter.mk
index be2bd342ca..e6a8fe4adf 100644
--- a/package/python-xlsxwriter/python-xlsxwriter.mk
+++ b/package/python-xlsxwriter/python-xlsxwriter.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_XLSXWRITER_VERSION = 3.2.1
-PYTHON_XLSXWRITER_SOURCE = XlsxWriter-$(PYTHON_XLSXWRITER_VERSION).tar.gz
-PYTHON_XLSXWRITER_SITE = https://files.pythonhosted.org/packages/48/4f/108b0bada5cfcc47c24ea6181f4c563fbafef50bcc0054089c256b2ae578
+PYTHON_XLSXWRITER_VERSION = 3.2.9
+PYTHON_XLSXWRITER_SOURCE = xlsxwriter-$(PYTHON_XLSXWRITER_VERSION).tar.gz
+PYTHON_XLSXWRITER_SITE = https://files.pythonhosted.org/packages/46/2c/c06ef49dc36e7954e55b802a8b231770d286a9758b3d936bd1e04ce5ba88
 PYTHON_XLSXWRITER_SETUP_TYPE = setuptools
 PYTHON_XLSXWRITER_LICENSE = BSD-2-Clause
 PYTHON_XLSXWRITER_LICENSE_FILES = LICENSE.txt
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
