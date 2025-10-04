Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B643CAC5B0
	for <buildroot@archiver.kernel.org>; Sat,  4 Oct 2025 09:41:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29E0B612D7;
	Sat,  4 Oct 2025 09:41:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tzvmZqQbc4aJ; Sat,  4 Oct 2025 09:41:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2EAED60ACB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2EAED60ACB;
	Sat,  4 Oct 2025 09:41:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B8F14226
 for <buildroot@buildroot.org>; Sat,  4 Oct 2025 09:41:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9EC114042C
 for <buildroot@buildroot.org>; Sat,  4 Oct 2025 09:41:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gd1MIjo2MEBS for <buildroot@buildroot.org>;
 Sat,  4 Oct 2025 09:41:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 774664031F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 774664031F
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 774664031F
 for <buildroot@buildroot.org>; Sat,  4 Oct 2025 09:41:25 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-b3da3b34950so265409666b.3
 for <buildroot@buildroot.org>; Sat, 04 Oct 2025 02:41:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759570883; x=1760175683;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9kk5Mk66muRWvYjeu7YXRGAQ7HF/WnX6DGPtHJvUsKM=;
 b=xVI7FbBn7/HXYjUhXIndbyFZG67/F6xYqux0Aya8qUXzyn+5CQ0rnHqpc7h3GekTH1
 gPnghYGvA6qSM/W0aJOYhlaTEIbtE820irqQE6G1OAaipimZqjwMil2iZ2x+3xvyhj14
 yZ8LF7VDiDo/lbe8KQ0GiggYQmJNQlyTWxX931M4r54qsXzLpSRDoyswlMKG3YkhOhW6
 idw+zDAwYzqIWpSenZkt7OdXLUrcmQeh4LpyO/sTvBaq0WGtbNqcGcCD3NvqKg4E9Vam
 lW6opVWOsC4yDu5QiKMxYYlwO0TWSXt9WykcmpT2KCosJoA5a8+v4AoEpt5eJwU7nVZu
 SRyA==
X-Gm-Message-State: AOJu0YyCkYeBSMLleCJilB6+SNxaoZYmNEyshl8WfVdo4uNt4Pj7kY5N
 hCpQO/WA2evlSLk+8o+ZejB5QHs/KQ0vr3g2VFl4DY8LbsQAV7MG7DW4cFjXX3i1rLjoZidl6zK
 X82MS
X-Gm-Gg: ASbGncshTepe3LqViLyA88qrFTZZgnQziCVvQMjIAXuKGtwaRkyXWE6pMw+ha0/xW2k
 A/uyR/S6Cr2rx/flJ7MmxaRekHTvuej86JDrgslQbNP1gFKpKTTuqBygNL/539qgQ112NZjv5Tb
 Za6AdpMMjmfNhTJ7f2tdLkGnweLjvqNy8reusIvBJ4C/7uwZUxtlz11RTo4pLgWKJ9hrDpbVtl3
 rKlXZgD0bQhpHLopG6+eOWJlbcnWOG6TleEWnrUSDltv29WqQ/w2SqdWo8v8Dp+zlrltwOx4TtG
 4Sw0BpAO+eOyY3cQYX7mDvV2TIv+2vvuL1sXvYSTPnSvEaJ0JJdC4JqXzjQp2Ev8peIEQUngWB2
 5ntknobzHy6CYAU3qlh5c/EROudujK6AI3hWLKzCDriMGFlJwTBKJN+6gZd1F5Kr0lK0=
X-Google-Smtp-Source: AGHT+IHHBX4RoJNQLuAXmJRyvs3oF1AVT5nxdwjhrYiUhM97FpD0NNTYJyWAgIEuTjAqAB5jal1Y1Q==
X-Received: by 2002:a17:906:6a16:b0:b2b:a56f:5434 with SMTP id
 a640c23a62f3a-b49c038f68dmr757870566b.13.1759570882919; 
 Sat, 04 Oct 2025 02:41:22 -0700 (PDT)
Received: from dragon.home ([109.136.97.112]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b4865e77427sm645760666b.36.2025.10.04.02.41.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Oct 2025 02:41:22 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sat,  4 Oct 2025 11:33:48 +0200
Message-ID: <20251004093348.269213-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1759570883; x=1760175683; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9kk5Mk66muRWvYjeu7YXRGAQ7HF/WnX6DGPtHJvUsKM=;
 b=hB3EToPdviGsKdR33NayGYXQ3RL+jSKgXN9BfF2i//cDjEBwwrhLQ0isc7Sk7JxVU1
 x2rK+1xEDJts2h6g/r3gj+RdCpjIzE0sB7sVTgcWFDUj5QJod/If5eNHZV/diu524e7D
 PJp4xHNNi/dI8w7UtJcThGdGFcDHU94CbTWkeD/QglOkF7OqA7F0u0ZZUxv+eX9NNPNC
 H4M7e7GQ8VP/UVej1VFT8xXdDWgKAOMx1TaS3vxUYifcnmIDU9bN8+xI+WzoKtzTfcrZ
 C00U3Z36KQVpthdXRSHAG9n5UNN4MoHEQL88hgnCGMbmIapE9ayTstJmWTKgainWCOIG
 jjkw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=hB3EToPd
Subject: [Buildroot] [PATCH v2] package/python-django: security bump to
 v5.2.7
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
index 3ff4eb4e36..1ec80dc1c2 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  1f0327293cc3768903ce8cd390ec3f47  django-5.2.6.tar.gz
-sha256  da5e00372763193d73cecbf71084a3848458cecf4cee36b9a1e8d318d114a87b  django-5.2.6.tar.gz
+md5  699a77ac347ca3484939762483dc4b08  django-5.2.7.tar.gz
+sha256  e0f6f12e2551b1716a95a63a1366ca91bbcd7be059862c1b18f989b1da356cdd  django-5.2.7.tar.gz
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
index e3959f4192..139a15b13a 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 5.2.6
+PYTHON_DJANGO_VERSION = 5.2.7
 PYTHON_DJANGO_SOURCE = django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/4c/8c/2a21594337250a171d45dda926caa96309d5136becd1f48017247f9cdea0
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/b1/96/bd84e2bb997994de8bcda47ae4560991084e86536541d7214393880f01a8
 PYTHON_DJANGO_LICENSE = BSD-3-Clause, MIT (jquery, utils/archive.py), BSD-2-Clause (inlines.js)
 PYTHON_DJANGO_LICENSE_FILES = LICENSE \
 	django/contrib/gis/measure.py \
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
