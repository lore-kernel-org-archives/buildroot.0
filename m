Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 711C1CAC5BB
	for <buildroot@archiver.kernel.org>; Sat,  4 Oct 2025 09:41:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2EBEB40AF3;
	Sat,  4 Oct 2025 09:41:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H_HRd34k7j-F; Sat,  4 Oct 2025 09:41:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B2AC40B45
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B2AC40B45;
	Sat,  4 Oct 2025 09:41:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7510C118
 for <buildroot@buildroot.org>; Sat,  4 Oct 2025 09:41:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6767A834EF
 for <buildroot@buildroot.org>; Sat,  4 Oct 2025 09:41:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VcxQTzmMv0f5 for <buildroot@buildroot.org>;
 Sat,  4 Oct 2025 09:41:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4409982FF9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4409982FF9
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4409982FF9
 for <buildroot@buildroot.org>; Sat,  4 Oct 2025 09:41:38 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-62fca216e4aso7439819a12.0
 for <buildroot@buildroot.org>; Sat, 04 Oct 2025 02:41:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759570897; x=1760175697;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bbrF2tkWpt/iBzjl64arYCD/+F78TMTDCgCHwoAXSGk=;
 b=ieSzUMCNWUWlJPs9nulho0iA6nye3YoAbRzj/Ir/aBK61RzpJ3wM/RMGpPqMX+8oTp
 ljafKpZ+lyfFRyL9GwW1XOg6RIZhNZLLN+IH+xDUMRR5IcDQnM6/iuQL84chPS9gRSBU
 gz3hSoVTHbR/vs91s6KlJeIr3nHz2b6Su9DylfbCmAFVYZwlghpnwdmyKyFh49Yww+Iz
 37HhU+2VDHouUrBIB9RxxQP2PTrIp1BMaO5/y6Pb1x6W6MqBYEZ6TIUrlfZatKpFkfyA
 9VPl1NE3+NU4OfKQAy0xJGVtbXWstEh9pZbSsxECSRl7h6cd3Z45lVeQmXv2nvOyhLMJ
 8sdA==
X-Gm-Message-State: AOJu0Yx8d4HBgu3JACNs1q90ZUSEJ5aYGfj9bnWunRs6R0WShDNhdgbs
 3I0DOsKZ8dASWC1MthEpe7VSSinquDE0DRf8ALpCXZBC6b21lhH9o9iKu5oHu7oKn3drCsV1uCa
 Is22L
X-Gm-Gg: ASbGncvcajUAchn0poCSBv5gPqs0F9SsekRD3EIGUtgQ+F8eC/clyw/P71Ff2YYqcVE
 cmrLt5gk48971IXqG0fuhUFFJjRscW5jgnPiVIcCIKeUt9b9DC86Tt3vS6scQngNDqAl3qC7nSe
 nwsL9an/4HSLsFyIhm+clGfQKgLD55pimZJ9TUcG1mFkDDpVlFLJE+KLOMbd/OGyEPkmHRmRrQ9
 NY/hmyZylkgU1l+BQd2smtm3UPCzwlME4b+j06x6ZZ4FSPY0Jfd/4VCPxcVnoEE2th73Trs+2BR
 RmYixl+l8ibrgF7IGhAo/Jtig3pWmPqW5/ZbNoKj3eISdbog0sG89XS+A0NlOdMe21T10Y3RHe0
 fxdhFFyfQdIHZudrwciYQyd9juJuGz1txxbGtUx2rryThn8i294ZsqbAO8wpIvEU6bKoL+WgI/y
 YMGf2wpQ==
X-Google-Smtp-Source: AGHT+IFGkwjaSAz2h4rGj3KcCVHCY6cYCertiEAYsdx/FPigmt6WzMEDjoyc2AnRTBKxuI5kx+sZBw==
X-Received: by 2002:a05:6402:1493:b0:633:14bb:dcb1 with SMTP id
 4fb4d7f45d1cf-637745aab90mr7889103a12.11.1759570896992; 
 Sat, 04 Oct 2025 02:41:36 -0700 (PDT)
Received: from dragon.home ([2a02:a03f:73a7:c001:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6376b3aa9f1sm5780199a12.8.2025.10.04.02.41.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Oct 2025 02:41:36 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sat,  4 Oct 2025 11:41:28 +0200
Message-ID: <20251004094128.270821-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1759570897; x=1760175697; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bbrF2tkWpt/iBzjl64arYCD/+F78TMTDCgCHwoAXSGk=;
 b=TuvtW3WltqZFVguh4ksfVOLy6K/G8FLJ7RchBB5ZKHeL6OVi/wbVckhgQPwVBZgSRr
 I3KqMK+sY538KoqVOIox/xdOHaDgM6qsc6hhuvL6BcIZ2B9XGo9p44fm/oq+RaZCnVmq
 FrEjaAGOeH/YqAd2NBlWIl6gn4GcPMMHz42zpbEL3SITPkCdCQt8jdB8vHSBWIZiWQQt
 LLXWgQ+Re42tERrCH4y3PKUt/kjMH+zXgL28tVShyp5zRxOyhsrgeDFk4GB900CQK5b0
 4szdsieCEpwatyRhoIBZ88KV00kEUwPUi11N0BSRmkC7pcPjGh9C8Ne7QeDgLLCiE+Oz
 WHug==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=TuvtW3Wl
Subject: [Buildroot] [PATCH v2 for 2025.02.x] package/python-django:
 security bump to v5.1.13
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Oli Vogt <oli.vogt.pub01@gmail.com>, Marcus Hoffmann <bubu@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This fixes the following vulnerabilities:
- CVE-2025-59681:
    An issue was discovered in Django 4.2 before 4.2.25, 5.1 before
    5.1.13, and 5.2 before 5.2.7. QuerySet.annotate(), QuerySet.alias(),
    QuerySet.aggregate(), and QuerySet.extra() are subject to SQL
    injection in column aliases, when using a suitably crafted dictionary,
    with dictionary expansion, as the **kwargs passed to these methods (on
    MySQL and MariaDB).
    https://www.cve.org/CVERecord?id=CVE-2025-59681

- CVE-2025-59682:
    An issue was discovered in Django 4.2 before 4.2.25, 5.1 before
    5.1.13, and 5.2 before 5.2.7. The django.utils.archive.extract()
    function, used by the "startapp --template" and "startproject
    --template" commands, allows partial directory traversal via an
    archive with file paths sharing a common prefix with the target
    directory.
    https://www.cve.org/CVERecord?id=CVE-2025-59682

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
Changes v1->v2:
- Update hash for utils/archive.py, because this file was updated as part
  of the CVE fix
---
 package/python-django/python-django.hash | 6 +++---
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index 155e3af8ef..a525410582 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  7f7a03e4f19ad7813d96f9fbbad65a5c  django-5.1.12.tar.gz
-sha256  8a8991b1ec052ef6a44fefd1ef336ab8daa221287bcb91a4a17d5e1abec5bbcc  django-5.1.12.tar.gz
+md5  dad76d0dbdbc86402061182fc708a442  django-5.1.13.tar.gz
+sha256  543ff21679f15e80edfc01fe7ea35f8291b6d4ea589433882913626a7c1cf929  django-5.1.13.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
 sha256  dcac1c86cb7ab491702bdb4c41be680fafde51536748cc8aaee3840eec53ed17  django/contrib/gis/measure.py
@@ -12,4 +12,4 @@ sha256  4ee0cbc51370afde358652a0f977972053729ed578b6a42f5e2a037d114f0b39  django
 sha256  73af2949bff9296cb0f816c3be19a4da4e95adc94c1f924796e8bad3f03f2f29  django/contrib/admin/static/admin/js/vendor/xregexp/LICENSE.txt
 sha256  d114faff3488c16c319b3235dc41f90239d3d63d9853733033d8f7535f5c0004  django/contrib/admin/static/admin/img/LICENSE
 sha256  54004c4b606964ebc163af16d04607c16e428f8a78a026fecb53f70c09f4a94f  django/dispatch/license.txt
-sha256  1ce0483ad554cf135efec70ad2097e82ed72790194f17e1591821dc82c2416e0  django/utils/archive.py
+sha256  9f37277d682cf06369041e60fb6fda5a85dfcf118d9176489087a3d40293f015  django/utils/archive.py
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index 3026c304be..c2581f5f90 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 5.1.12
+PYTHON_DJANGO_VERSION = 5.1.13
 PYTHON_DJANGO_SOURCE = django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/f0/99/a951d93a27a5bc59fb96edbcdbc03fb9bfac51177f1bc0110888de85af3f
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/bb/57/ad9905d03a2ee39064ee7ba69f8e2790db4a7ffaef9c54f95e7a8f2cb0a1
 PYTHON_DJANGO_LICENSE = BSD-3-Clause, MIT (jquery, utils/archive.py), BSD-2-Clause (inlines.js)
 PYTHON_DJANGO_LICENSE_FILES = LICENSE \
 	django/contrib/gis/measure.py \
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
