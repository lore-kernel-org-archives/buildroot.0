Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C82FF532D4
	for <buildroot@archiver.kernel.org>; Tue, 24 Mar 2026 07:11:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF41C40FC3;
	Tue, 24 Mar 2026 07:11:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0HZtXE1UY7kW; Tue, 24 Mar 2026 07:11:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2B7240FC7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774336302;
	bh=a8NefMh9lT++n3SbSiGsdQzOcs15ZCOZNJSd+uiweCc=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=WvhDULRYWfxDU8oSh+nZP7ws8cgO+xDgtrigmxd4M5CoTsPu+kqAw9D1dffA8DAoq
	 irsaQk9deZA+hDE8TAZXCorEnK+Dbelp7O+Q+fPId0SlXu5qbvDcOnACrAkjvGkLAv
	 V6ACqXQtLrly5O+8w1+WoL8HZiFj66atf2HvN4HTv8Z3TEAgcn59xZlX0TdSHAcp9w
	 ZB7NIMfhWENcAGPXU4YNvoBYJBpFNjuyapSGw7n8k9mitiki8N5mKTvL/a/KAlL5c2
	 mQOvPBNCPBgMcxHWQNhtKartifJ4LMAijnOT6g8qDNuTxb795wbiVXDWM4eO7qqhCb
	 No70H5VyTO5Bw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2B7240FC7;
	Tue, 24 Mar 2026 07:11:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9472C353
 for <buildroot@buildroot.org>; Tue, 24 Mar 2026 07:11:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 91D4080890
 for <buildroot@buildroot.org>; Tue, 24 Mar 2026 07:11:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FU2hjJyUmk5Q for <buildroot@buildroot.org>;
 Tue, 24 Mar 2026 07:11:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.10.208.51;
 helo=mout-b-206.mailbox.org; envelope-from=manuel.diener@oss.othermo.de;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 89736802EE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 89736802EE
Received: from mout-b-206.mailbox.org (mout-b-206.mailbox.org [195.10.208.51])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 89736802EE
 for <buildroot@buildroot.org>; Tue, 24 Mar 2026 07:11:39 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-b-206.mailbox.org (Postfix) with ESMTPS id 4fg1Rn2mq8z9xJf;
 Tue, 24 Mar 2026 08:11:33 +0100 (CET)
From: Manuel Diener <manuel.diener@oss.othermo.de>
To: buildroot@buildroot.org
Date: Tue, 24 Mar 2026 08:10:26 +0100
Message-ID: <20260324071027.885476-1-manuel.diener@oss.othermo.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.othermo.de; s=MBO0001; t=1774336293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=quDxl0E4CNN2lZ2CIINLXhNdddXTK3F91e8xjSmYBu4=;
 b=X386bw2LvqiPDuW7XsoH/mHitazq8dvYc+kBQ3fPWy7ae0xOX8y1o05Q37+cxs81susJqs
 0EFMys68rhed+EVcaQznkjQPw5HQwaJ/ULQIC4wCN9HouVHlV8QuD9mlXNJq7GNoxW7QHl
 cgfRJDM5nHgoWPyICd2i4MRrzgvjVQCoC8QHdxb/EGUdV1iSqGbAGBLxSbiSNS0eNnImX4
 FCGmpl8i5+kwG/gDP7V/6v43Rb+lm6ooPEpGH0M5Nk32CjfIWNSfMegVfG4SgQXB7EaiKF
 QwVIVRVuo2rVfq2DovwcezEtoNn2KAiej4oN708sg+OxSDSNMAahw+lAxx0UKQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=oss.othermo.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=oss.othermo.de header.i=@oss.othermo.de
 header.a=rsa-sha256 header.s=MBO0001 header.b=X386bw2L
Subject: [Buildroot] [PATCH] package/python-django: security bump to 6.0.3
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Manuel Diener <manuel.diener@oss.othermo.de>,
 Oli Vogt <oli.vogt.pub01@gmail.com>, Marcus Hoffmann <bubu@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following security issues:
CVE-2026-25673 (moderate): Potential denial-of-service vulnerability in URLField via Unicode normalization on Windows
CVE-2026-25674 (low): Potential incorrect permissions on newly created file system objects

See the release notes here:
https://docs.djangoproject.com/en/6.0/releases/6.0.3/

Signed-off-by: Manuel Diener <manuel.diener@oss.othermo.de>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index f1ddcc7128..2722dd45f9 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  0836ceb8f1f4694f87f0a698c64bd00e  django-6.0.2.tar.gz
-sha256  3046a53b0e40d4b676c3b774c73411d7184ae2745fe8ce5e45c0f33d3ddb71a7  django-6.0.2.tar.gz
+md5  0bb395b518e2f2f17e1a936deb7ba74c  django-6.0.3.tar.gz
+sha256  90be765ee756af8a6cbd6693e56452404b5ad15294f4d5e40c0a55a0f4870fe1  django-6.0.3.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
 sha256  de642dff9b1019c2c7209032fb94ea92060084efb0bc4238d81a2219e21c7382  django/contrib/gis/measure.py
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index 18871163d6..0cc68129ee 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 6.0.2
+PYTHON_DJANGO_VERSION = 6.0.3
 PYTHON_DJANGO_SOURCE = django-$(PYTHON_DJANGO_VERSION).tar.gz
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/26/3e/a1c4207c5dea4697b7a3387e26584919ba987d8f9320f59dc0b5c557a4eb
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/80/e1/894115c6bd70e2c8b66b0c40a3c367d83a5a48c034a4d904d31b62f7c53a
 PYTHON_DJANGO_LICENSE = BSD-3-Clause, MIT (jquery, utils/archive.py), BSD-2-Clause (inlines.js), CC-BY-4.0 (admin svg files)
 PYTHON_DJANGO_LICENSE_FILES = LICENSE \
 	django/contrib/gis/measure.py \
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
