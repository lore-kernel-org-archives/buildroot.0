Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA80BD637A1
	for <buildroot@archiver.kernel.org>; Tue, 16 Dec 2025 19:44:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C234461037;
	Tue, 16 Dec 2025 19:44:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EOkhcqySn9KV; Tue, 16 Dec 2025 19:44:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0AE06104F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765914291;
	bh=j8C9yC4yxen6iO9XuEoTek8/z51ZmItv6uwBFDgv638=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=dizMJ2zIBWMw+3FmgbBIx8t5zwh2FprnojSInP5OcubDMfVAiF3Rg+kgcZMGh1MJn
	 j/8nAjuf3A2xdXsxcD3mPcmCYneETf6V2lN3e/1AaeIj8/mYV+ux+joAcT9dJi8o2r
	 B/I5gWJFPfzJA2M1CTFwL8owCC03ajNCmV/VAIeKeOJBgAWMSXae6eIkklnCaJsJbh
	 Fb0gE0lb4ZqG83gYWhyHdsyOVJCsaAkC2ho1ll4rin8Xrm0OEW4pppNANvJ+O/8+eW
	 95f55n6/Ic/9JXwYLSItBAwxp1gVQ81jDcyoMTWOwdFgi1js50802kWBEDAL183fd0
	 O3ktfr3WolHIQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0AE06104F;
	Tue, 16 Dec 2025 19:44:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 81AD8372
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 19:44:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6840E40103
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 19:44:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 17yfPYIU084Y for <buildroot@buildroot.org>;
 Tue, 16 Dec 2025 19:44:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E452A40052
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E452A40052
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E452A40052
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 19:44:47 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1ba4b.dip0.t-ipconnect.de [84.161.186.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 57581A4C45D1;
 Tue, 16 Dec 2025 20:41:31 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47366)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vVavA-000000000Bj-0xDe;
 Tue, 16 Dec 2025 19:41:20 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 16 Dec 2025 20:41:11 +0100
Message-ID: <20251216194119.3020421-18-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251216194119.3020421-1-bernd@kuhls.net>
References: <20251216194119.3020421-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765914091;
 bh=gvJAzGb/90U34ZNXWIPPgDr0mB2edkFuKlES+FbbUMU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=iTAMa2AV5qBUvPu6ytBleiPDoZWlx9TvPCDJt+AMQEmJTrKNH4putGoupCTq0jJEN
 g7wH61YiF5Qbq5oWfx0Mpqo/VTTY9jhWN2tRU7MerFJjfLTUNr/aAitjT8dRlnxwPG
 /+XLeoJEs8tAaWi0G9Hm0SoUWVHFnDSZ+8cqMYKE3j26OBohBeKhukufnuvbRoKKGl
 TcIw1Y508UQy9vdlTK7pIxSGlCzOD+1fgOJUGbD3VyK/s68deHr12MJcukvjb8Jv8r
 B+ZQ9S6tQqOsXrvCv1UIEkzrvi3KAl3oEMB5SxNb/m1vpJ/MAD/uTabhymuP4IWvTD
 X9xltkTYJM2wQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=iTAMa2AV
Subject: [Buildroot] [PATCH 18/26] package/python-urwid: bump version to
 3.0.4
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

https://github.com/urwid/urwid/blob/3.0.4/docs/changelog.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-urwid/python-urwid.hash | 4 ++--
 package/python-urwid/python-urwid.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-urwid/python-urwid.hash b/package/python-urwid/python-urwid.hash
index 1612070c3f..dd9c208ad0 100644
--- a/package/python-urwid/python-urwid.hash
+++ b/package/python-urwid/python-urwid.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/urwid/json
-md5  0ed7f3cf33545912b9ad0d8f2200863b  urwid-3.0.3.tar.gz
-sha256  300804dd568cda5aa1c5b204227bd0cfe7a62cef2d00987c5eb2e4e64294ed9b  urwid-3.0.3.tar.gz
+md5  6cf95702b787fd7e5f90e74d9900f000  urwid-3.0.4.tar.gz
+sha256  c3d0d2f47602b21949ffb8669a7ef0a8ca5fa13ed5c1ee1d2d81edf05616187f  urwid-3.0.4.tar.gz
 # Locally computed sha256 checksums
 sha256  36b6d3fa47916943fd5fec313c584784946047ec1337a78b440e5992cb595f89  COPYING
diff --git a/package/python-urwid/python-urwid.mk b/package/python-urwid/python-urwid.mk
index 0ca1b79c55..b3069fdaff 100644
--- a/package/python-urwid/python-urwid.mk
+++ b/package/python-urwid/python-urwid.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_URWID_VERSION = 3.0.3
+PYTHON_URWID_VERSION = 3.0.4
 PYTHON_URWID_SOURCE = urwid-$(PYTHON_URWID_VERSION).tar.gz
-PYTHON_URWID_SITE = https://files.pythonhosted.org/packages/bb/d3/09683323e2290732a39dc92ca5031d5e5ddda56f8d236f885a400535b29a
+PYTHON_URWID_SITE = https://files.pythonhosted.org/packages/e0/4d/f0832a6bf0986bdd770d61f9cf9e9915741171502c0c399bf934c72a3e5e
 PYTHON_URWID_LICENSE = LGPL-2.1+
 PYTHON_URWID_LICENSE_FILES = COPYING
 PYTHON_URWID_SETUP_TYPE = setuptools
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
