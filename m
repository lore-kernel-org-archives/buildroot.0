Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A719E81A32
	for <buildroot@archiver.kernel.org>; Mon, 16 Feb 2026 17:12:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C9E4B83BD9;
	Mon, 16 Feb 2026 17:12:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BXcjfZ5NuBeT; Mon, 16 Feb 2026 17:12:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FC84834FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771261960;
	bh=azKdiXkPycqfi73g8zh4DF53qXjNSyWf3p18sOnKRjk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=gVjvaxgNSiFdWSzafaGp1VjWsEkMhSPxs2P1ZHdOmfs/yGnQtR2HIa2SFrL690wWy
	 16uiFV7I3SIvcPA4st3J57EWHpfTWveuEdHImwS91/tSlz/hfOzS2neSf9pwuYW7zV
	 Bqt6vkxwdnSUMgIRAWAcoDtIu829M3qqtTOKMhTry+GkSwp2ydJ9Loq3wyuGf3ua0y
	 egqPr0FVrG4Wc4aL5C5cRONPz0gncpfh7wr99dSvtf4YQ0rFa3nusQoRxbR84R3Y16
	 +zk/hPMb8EKNYj+MWZoKTd9vomZ/k/a+R8qQMC9XswhVAgGcs4RfLOCrPlUJYZVgpP
	 5FvJNxBVN8miw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6FC84834FC;
	Mon, 16 Feb 2026 17:12:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C04235B
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 17:12:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7D77A834FC
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 17:12:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pdNseSR27iFS for <buildroot@buildroot.org>;
 Mon, 16 Feb 2026 17:12:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 49A058305C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 49A058305C
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 49A058305C
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 17:12:36 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-43767807da6so2380871f8f.2
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 09:12:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771261955; x=1771866755;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MGdzy22aqwmxgwBRCq6hyAdy52iykc2TEAsK8rgY20s=;
 b=mej3k9mighr7NwrFV7tOSQEWH2R5vvnWWSo8WfMrlNXd/4d6V0XSGianHocMqjOqUL
 kID0Wfdviw/M/9h3bCl7UsQvIgVfPhxAxwnX8g6bB3H101J7ihUHd2pEC7n88CplWjD0
 ZKqdKhsWVfyIFHakTys/cPOqlfu/9FyTzQQY57H60ZVA9xBuR/wJ/8WQFnRZYqklvWDl
 sY3LX73Hk+ZXoBrNqpHk/MaJ5AALdr2/eQa3u0DsYX5rBoMwSAfZf+gboGrf0yVsRCJI
 nUKc3E1nI4XLk5NWLTuQxF0JlPwz3FScBfz5TCCYVY7+ys06ib/Oor3R572CDmvXdbcI
 Tl6w==
X-Gm-Message-State: AOJu0YxG4/F7j4HS7OP3C52NXSHTVrxWUb2ExZlHczRFNmgjsCPxYDKv
 BYadrkKi6MrlatDTXaxT25AyVS4jhIG01oQuXM4O8/ssAb7JleMaicOqGJkoPd6lNLtEfDN+iw2
 s7pMDvF8=
X-Gm-Gg: AZuq6aLqsOTm+vvazh4LkUzyjNOBHPAIxs3r305QTdiZorU3GdhIWElTu7wkdeR6qYS
 CqySgDpvKDnFCbLLsck+tsGx4+yLv/G1RMrahgdF9lfPcafDESYWvaJ4P0oTdneDN0QFbW5ioNf
 A44+0nJqVnxZMDot0NIL6McSLVAj/PWkEuTaNeX44a1eEovDkMKvlUrm0c8CsUq2Eh0dKB+kmpf
 Kpqm27eoCtHWLhvyQ6Qe25jiO5I3HVMD0kk/xIGBBwfHzS16s5bvrLnBX3ygfj4X6v4uRKEuHze
 Oi0hAwYI4mh6zLD//tPxJpt/qSl2yi8LMrg0znAkcAjx9P+X/k+zWmrFVVyOT//UnsWphSslf64
 uYdTstr965hLU3SHUfStMbztDo0b5YMJy0voOOE6GN4Pa0UrTRIJzsUvM5+RmVEY2lHbx+5nibh
 S75CXTKJ1xsZtgvdm3d0bd8cMXk1S04iSDovtlq9A8O5PlBGjavjUiKQQIRA==
X-Received: by 2002:a05:600c:8486:b0:47e:e076:c7a5 with SMTP id
 5b1f17b1804b1-48373a1c41emr167871055e9.11.1771261954539; 
 Mon, 16 Feb 2026 09:12:34 -0800 (PST)
Received: from dragon (ptr-94-109-131-55.dyn.orange.be. [94.109.131.55])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48387ab1974sm84350625e9.3.2026.02.16.09.12.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Feb 2026 09:12:34 -0800 (PST)
To: buildroot@buildroot.org
Date: Mon, 16 Feb 2026 18:12:20 +0100
Message-ID: <20260216171220.370985-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771261955; x=1771866755; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MGdzy22aqwmxgwBRCq6hyAdy52iykc2TEAsK8rgY20s=;
 b=JfbefhVY1tcPVBcURuwB5hpj07JSmQoFYgQk4c2lom6sNbi72kJQMaQH9UBoj4vrmN
 pR+gKq6qgJNnwYeNCbS7VObKAt8EDFXrGLPzI2ReO5vGIq1iuohQ6AqSHfqBGuSBoIgs
 CkPrg5E2eg1/Mnau7rseRegKFs/GLIBzO6jhimrNplwxDCtkh9/jgGua6jgEL3kv8VJ2
 iqFmEzh9SK7seJMy3u0tnXOvNI+ZeR0tZK0aiLVnc2Bf2bZrNUbrT+sEUH98irqoRzm7
 RX5Bw0tkBONmgxmSr0i9c4TdGS7mK38s03NfXLjkQkENbiorPNgX+qwtNabiSN9FjwHK
 Lbng==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=JfbefhVY
Subject: [Buildroot] [PATCH for 2025.02.x] package/python-django: security
 bump to v5.2.11
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

See the release notes:
https://docs.djangoproject.com/en/5.2/releases/5.2.11/

This is a security release on Django's LTS branch,
fixing the following vulnerabilties:

- CVE-2025-13473:
    An issue was discovered in 6.0 before 6.0.2, 5.2 before 5.2.11, and
    4.2 before 4.2.28. The
    `django.contrib.auth.handlers.modwsgi.check_password()` function for
    authentication via `mod_wsgi` allows remote attackers to enumerate
    users via a timing attack. Earlier, unsupported Django series (such as
    5.0.x, 4.1.x, and 3.2.x) were not evaluated and may also be affected.
    Django would like to thank Stackered for reporting this issue.
    https://www.cve.org/CVERecord?id=CVE-2025-13473

- CVE-2025-14550:
    An issue was discovered in 6.0 before 6.0.2, 5.2 before 5.2.11, and
    4.2 before 4.2.28. `ASGIRequest` allows a remote attacker to cause a
    potential denial-of-service via a crafted request with multiple
    duplicate headers. Earlier, unsupported Django series (such as 5.0.x,
    4.1.x, and 3.2.x) were not evaluated and may also be affected. Django
    would like to thank Jiyong Yang for reporting this issue.
    https://www.cve.org/CVERecord?id=CVE-2025-14550

- CVE-2026-1207:
    An issue was discovered in 6.0 before 6.0.2, 5.2 before 5.2.11, and
    4.2 before 4.2.28. Raster lookups on ``RasterField`` (only implemented
    on PostGIS) allows remote attackers to inject SQL via the band index
    parameter. Earlier, unsupported Django series (such as 5.0.x, 4.1.x,
    and 3.2.x) were not evaluated and may also be affected. Django would
    like to thank Tarek Nakkouch for reporting this issue.
    https://www.cve.org/CVERecord?id=CVE-2026-1207

- CVE-2026-1285:
    An issue was discovered in 6.0 before 6.0.2, 5.2 before 5.2.11, and
    4.2 before 4.2.28. `django.utils.text.Truncator.chars()` and
    `Truncator.words()` methods (with `html=True`) and the
    `truncatechars_html` and `truncatewords_html` template filters allow a
    remote attacker to cause a potential denial-of-service via crafted
    inputs containing a large number of unmatched HTML end tags. Earlier,
    unsupported Django series (such as 5.0.x, 4.1.x, and 3.2.x) were not
    evaluated and may also be affected. Django would like to thank
    Seokchan Yoon for reporting this issue.
    https://www.cve.org/CVERecord?id=CVE-2026-1285

- CVE-2026-1287:
    An issue was discovered in 6.0 before 6.0.2, 5.2 before 5.2.11, and
    4.2 before 4.2.28. `FilteredRelation` is subject to SQL injection in
    column aliases via control characters, using a suitably crafted
    dictionary, with dictionary expansion, as the `**kwargs` passed to
    `QuerySet` methods `annotate()`, `aggregate()`, `extra()`, `values()`,
    `values_list()`, and `alias()`. Earlier, unsupported Django series
    (such as 5.0.x, 4.1.x, and 3.2.x) were not evaluated and may also be
    affected. Django would like to thank Solomon Kebede for reporting this
    issue.
    https://www.cve.org/CVERecord?id=CVE-2026-1287

- CVE-2026-1312:
    An issue was discovered in 6.0 before 6.0.2, 5.2 before 5.2.11, and
    4.2 before 4.2.28. `.QuerySet.order_by()` is subject to SQL injection
    in column aliases containing periods when the same alias is, using a
    suitably crafted dictionary, with dictionary expansion, used in
    `FilteredRelation`. Earlier, unsupported Django series (such as 5.0.x,
    4.1.x, and 3.2.x) were not evaluated and may also be affected. Django
    would like to thank Solomon Kebede for reporting this issue.
    https://www.cve.org/CVERecord?id=CVE-2026-1312

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index 1c2b9bcd29..b39b8c54cc 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  98e667c17123f7bbd2d7d1db32f9ccdd  django-5.2.10.tar.gz
-sha256  74df100784c288c50a2b5cad59631d71214f40f72051d5af3fdf220c20bdbbbe  django-5.2.10.tar.gz
+md5  051357d45eb71a115a64e6d2a79c7c51  django-5.2.11.tar.gz
+sha256  7f2d292ad8b9ee35e405d965fbbad293758b858c34bbf7f3df551aeeac6f02d3  django-5.2.11.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
 sha256  dcac1c86cb7ab491702bdb4c41be680fafde51536748cc8aaee3840eec53ed17  django/contrib/gis/measure.py
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index 184f91bfa1..4b840701f4 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 5.2.10
+PYTHON_DJANGO_VERSION = 5.2.11
 PYTHON_DJANGO_SOURCE = django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/e6/e5/2671df24bf0ded831768ef79532e5a7922485411a5696f6d979568591a37
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/17/f2/3e57ef696b95067e05ae206171e47a8e53b9c84eec56198671ef9eaa51a6
 PYTHON_DJANGO_LICENSE = BSD-3-Clause, MIT (jquery, utils/archive.py), BSD-2-Clause (inlines.js)
 PYTHON_DJANGO_LICENSE_FILES = LICENSE \
 	django/contrib/gis/measure.py \
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
