Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C8E9E9E310
	for <buildroot@archiver.kernel.org>; Wed, 11 Feb 2026 14:19:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6078480DE8;
	Wed, 11 Feb 2026 14:19:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hbMOj_3qQMf9; Wed, 11 Feb 2026 14:19:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9F7D80C27
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770819575;
	bh=QtsAEuczhPFyKgXx4eGw3KAEWQMyqzyFGtjcIZrZyzI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=k7rjQiHuPKdewyHo1tULouudSrJmJq7b8hlZRtfcbnEwcCWPg/MzPpJLyixbfOcgM
	 21StR56FA6wMxfVWEQa+/EDdXasyGeBEjGWaoloa14YeDkpvy/y5ron9LEFxfBy7HI
	 zOjNFz2ro0VPixUs70ImvMG7Ri+UgSgxc3AGLG4td2PYZTm3YP6gOhqpDV47FmHo2C
	 MUV1dY3VT5UE5hEFg0g3Y++KFkZJ4daxEjwpnbcO6JK5SmYtpZHWnZ27IwigSL3LsN
	 7y6GWWT87V7BhZ6CbaAMp1B8w0ihk081OYplyJtYqooZTfQY0euKonlmspaMOjDCUu
	 JOYmbHxlAG67Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9F7D80C27;
	Wed, 11 Feb 2026 14:19:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7366E1F6
 for <buildroot@buildroot.org>; Wed, 11 Feb 2026 14:19:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 585A9400D8
 for <buildroot@buildroot.org>; Wed, 11 Feb 2026 14:19:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ASKnWpaeUI9M for <buildroot@buildroot.org>;
 Wed, 11 Feb 2026 14:19:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6EF5E400CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6EF5E400CC
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6EF5E400CC
 for <buildroot@buildroot.org>; Wed, 11 Feb 2026 14:19:33 +0000 (UTC)
Received: from framework-OT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id D4D512C82930;
 Wed, 11 Feb 2026 15:19:30 +0100 (CET)
To: buildroot@buildroot.org
Date: Wed, 11 Feb 2026 15:19:43 +0100
Message-ID: <20260211141944.3610996-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1770819571; bh=7oAgPqbFCHRQg9h/rSloODvR7++qbTblsi/YqSD6n4c=;
 h=From:To:Cc:Subject:Date;
 b=S6w6oHCKzd6m/cXQEA/+I+aPC++cQGRtsXa0s8Z1xbnGETTh+YmzGmLruZukteHKu
 vYdenmE+U5liTRRLrikXcz3abC4ZUYo0m6DWv0eUaPT/I0ZJZ5TbSiEtfrRFcI9NWg
 IoTwTwpLmHOhLEKcd7dMUvUFam6LvO0lDUy4ypogYS80aw9pX0fC/uEMmpyovxwJrn
 aIbbYt0DIcRUIBqBhndO26QjzM8y4BkD0pOuneTnYyIOWPgM/o4YMEU9Cxs41Sra2e
 Sr9tBcqjMrC0hKwAoYko4KHmLZcJnk6JfUNmF1OUTWmBjylRzTo9YnXiFPLlj5+pwc
 j2Zc4yZFF13jA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=S6w6oHCK
Subject: [Buildroot] [PATCH] package/python-django: security bump to 6.0.2
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: James Hilliard <james.hilliard1@gmail.com>, Marcus Hoffmann <bubu@bubu1.eu>,
 "manuel.diener" <manuel.diener@othermo.de>,
 Oli Vogt <oli.vogt.pub01@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "manuel.diener" <manuel.diener@othermo.de>

Fixes the following security issues:
- CVE-2025-13473 (low): Username enumeration through timing difference in mod_wsgi authentication handler
- CVE-2025-14550 (moderate): Potential denial-of-service vulnerability via repeated headers when using ASGI
- CVE-2026-1207 (high): Potential SQL injection via raster lookups on PostGIS
- CVE-2026-1285 (moderate): Potential denial-of-service vulnerability in django.utils.text.Truncator HTML methods
- CVE-2026-1287 (high): Potential SQL injection in column aliases via control characters
- CVE-2026-1312 (high): Potential SQL injection via QuerySet.order_by and FilteredRelation

See the release notes here:
https://docs.djangoproject.com/en/dev/releases/6.0.2/
Also includes the bugfixes from version 6.0.1:
https://docs.djangoproject.com/en/dev/releases/6.0.1/

Signed-off-by: Manuel Diener <manuel.diener@othermo.de>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index 388b9df82c..f1ddcc7128 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  2f0e8520f6cf3cd6bbc81ec4226f11c7  django-6.0.tar.gz
-sha256  7b0c1f50c0759bbe6331c6a39c89ae022a84672674aeda908784617ef47d8e26  django-6.0.tar.gz
+md5  0836ceb8f1f4694f87f0a698c64bd00e  django-6.0.2.tar.gz
+sha256  3046a53b0e40d4b676c3b774c73411d7184ae2745fe8ce5e45c0f33d3ddb71a7  django-6.0.2.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
 sha256  de642dff9b1019c2c7209032fb94ea92060084efb0bc4238d81a2219e21c7382  django/contrib/gis/measure.py
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index d6d9bba0eb..18871163d6 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 6.0
+PYTHON_DJANGO_VERSION = 6.0.2
 PYTHON_DJANGO_SOURCE = django-$(PYTHON_DJANGO_VERSION).tar.gz
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/15/75/19762bfc4ea556c303d9af8e36f0cd910ab17dff6c8774644314427a2120
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/26/3e/a1c4207c5dea4697b7a3387e26584919ba987d8f9320f59dc0b5c557a4eb
 PYTHON_DJANGO_LICENSE = BSD-3-Clause, MIT (jquery, utils/archive.py), BSD-2-Clause (inlines.js), CC-BY-4.0 (admin svg files)
 PYTHON_DJANGO_LICENSE_FILES = LICENSE \
 	django/contrib/gis/measure.py \
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
