Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B16DFE784BE
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 18:18:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 82014608EC;
	Sun, 28 Dec 2025 18:18:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mcJXYq4x-um0; Sun, 28 Dec 2025 18:18:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7272F608D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766945928;
	bh=8xYGUt2umB2RfvpTpgTSsgQn2yeGmJgaPyg6TjmiKk4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=kuqtdX3SRNE0ASGQmzWwp3yUS3VaR8JmoldcJCh7D3WusTV1ppzXihXHMTNfavQAh
	 3IM13aNOWjJ04c99BxXH6j4ErS5G21Hm+BC7fXgmLSVvQyNxHaUV8YGkQOcpGTW+I7
	 Kx3H9KGNK63Rn1qPCAxshVL89eUc+PqujF8T8L3gGo14aoH0lABXCh4aYQ5BqdH3bI
	 EeJGPMEdRQU2C+p5K9xRm3P88xmdrGIyf8RfLki6pTc/ZJV8mX2hiKpJIlZAdhxrhq
	 P9aCopN9e0VY7PYUJ7X/MVQJLgBzSk9qCqmG5d2ZWMUdlBXl5zGicsSrdVWdPiflhS
	 tQJNrw2yn0jjQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7272F608D0;
	Sun, 28 Dec 2025 18:18:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C6488B9
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 18:18:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD6B84058A
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 18:18:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W7lclNOAjtjc for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 18:18:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0CFE440585
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0CFE440585
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0CFE440585
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 18:18:44 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4775ae77516so83316035e9.1
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 10:18:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766945922; x=1767550722;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ilEr4LMK8TjKO0vhJcKrWjl3hMdG1c4bqpHUk7zUf5o=;
 b=Zck0NT0bcZllPc9KZVfcqpJqrDMakn2bQsBjRgWEEiztb+LLbrQ4quyGk6nV12yChe
 JYoa5roF1kcTiWRQPOHDCNTO/tUMtjXC98j9jxZDGR5UenP7pW+iKCjvGxJ1efq3a6OF
 vZDptex+b9eXBRMXTwR4szmU3BySE5LySdDVyGP5KTk1FRRu0IoJus2DbaV2tkJPONFr
 UbVCMM9wUOLop8S2AIcuos8rS3mFe2HGePqXLE+6NCgKjX+VkuGZCH/jnwoQ6LK9c0//
 54F7h6LfNECn0UeyDaPm4TaNruWuTAZ5nDdXew7ZatKadLWJDiTIvbwqgEB08wj39ZwK
 y8dA==
X-Gm-Message-State: AOJu0YzD4bkp2EX1MFJA1jzhU1cSctUPP4CMxZ1jL4LfxySJVSZa/f5m
 CW7ofrWWWUjPo2sG862Xga4vWZUj7la+coCEMsE0vE4UZxdAPOydSH0H9VCR1SGhhkYyhrzI82t
 SkEVMepo=
X-Gm-Gg: AY/fxX4og15kqW4NajkwvoAYEvgnSWUNRHcCsjCdVE7D5EQe7gU92Yv/G4PtC5oa6ZG
 413vYfW3qhGWn2WEPMH2Pu3JyzrYssO2yweegTAFBn2r2CEQKcZP0I8afGDU+AVyhFxQC//Ly1k
 CgWPWrlg6AfmLcHMnL/NBLin1jU8z/KKWbDv8yePiTShVJu1xcDxzZQNPGWrUAA15BUtXt+c0YB
 1HbEjV+oAt5DZrreOI3t+pissNJe7QggekZsojmelDLENK4QJSp+tLUQCd8iDvt9GXpxry+4Hla
 FAhTvCZdZhZjLcGWlKLnrnJYS10p+JBxTiQbUD3M7tWbH2GSkimxdYYO4IqnasjqLUFeRv8WlLf
 3x2FX7tigv0y42J0Ok51xMhUKnbE5pl2Fz0b4prFJBybF3qgR3LxocXuJdMjH4PsUO/obD9j5IK
 9wm8kzyQwoqXB/+flv6vWAG6XUr06c2DL6hJpzTXJZxUyRyBYWGc9ottQ/x6Z2nx9MmKmCKLMu
X-Google-Smtp-Source: AGHT+IFTn1p6jUg/rmvfB8jT3RHKviU4nLGlua00GPcZkDt2/M1KQ4WTYoy/RGIYMzFyYkRhGc4kuA==
X-Received: by 2002:a05:600c:c041:b0:45d:5c71:769a with SMTP id
 5b1f17b1804b1-47d1c0360b0mr208648895e9.26.1766945922203; 
 Sun, 28 Dec 2025 10:18:42 -0800 (PST)
Received: from mindpad (2a01cb0c0115730072a6ccfffe7dafc3.ipv6.abo.wanadoo.fr.
 [2a01:cb0c:115:7300:72a6:ccff:fe7d:afc3])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47be272e46fsm540350045e9.4.2025.12.28.10.18.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Dec 2025 10:18:41 -0800 (PST)
To: buildroot@buildroot.org
Date: Sun, 28 Dec 2025 19:18:40 +0100
Message-ID: <20251228181840.37501-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1766945922; x=1767550722; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ilEr4LMK8TjKO0vhJcKrWjl3hMdG1c4bqpHUk7zUf5o=;
 b=cXOsJTbB5Sg18ASdrArIiG7YAaVhJ1pzgKdDtgaf855CwpDKC22xhZ8xImRhlbJ4me
 Idcqz5qPV8XZNucZHfQhfFUO3H9K3wv1lj+aPMsv5Kk7S9XT1y3q37s4oxRn7XMT1hMy
 33YJeilvs/zZhb+Vwmk/T5QWDgdJQ6YCynu/H7ZuQUMNFZzvwr3Ygvw5rKMfw60TtfXs
 v93mdtoG2466XiexMNGJfRqMRJo+a7c/SQSqcAhPVevMDAHnrZmING100RbS4dejCWri
 mlFDornskZcUbU16doPzquc7tD2+X9ZkIUAVVzJd1iNHtN4fn62AolvJHPnmTD1OY+WN
 wMQA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=cXOsJTbB
Subject: [Buildroot] [PATCH 1/1] package/python-django: security bump to
 5.1.15
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Oli Vogt <oli.vogt.pub01@gmail.com>, Marcus Hoffmann <bubu@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For more details on the version bump, see the release note:
 - https://docs.djangoproject.com/en/dev/releases/5.1.15/

Fixes the following security issue:

- CVE-2025-13372:

Potential SQL injection in FilteredRelation column aliases on
PostgreSQL.

For more information, see:
  - https://nvd.nist.gov/vuln/detail/CVE-2025-13372

- CVE-2025-64460:

Potential denial-of-service vulnerability in XML Deserializer.

For more information, see:
  - https://nvd.nist.gov/vuln/detail/CVE-2025-64460

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index 97e568ea14..0c9b70959f 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  b0c6556282e4ef15209b34b09604b9a1  django-5.1.14.tar.gz
-sha256  b98409fb31fdd6e8c3a6ba2eef3415cc5c0020057b43b21ba7af6eff5f014831  django-5.1.14.tar.gz
+md5  232748d1f2d6d1074f873dde91f7d75b  django-5.1.15.tar.gz
+sha256  46a356b5ff867bece73fc6365e081f21c569973403ee7e9b9a0316f27d0eb947  django-5.1.15.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
 sha256  dcac1c86cb7ab491702bdb4c41be680fafde51536748cc8aaee3840eec53ed17  django/contrib/gis/measure.py
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index fc5494cd80..32821e19a0 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 5.1.14
+PYTHON_DJANGO_VERSION = 5.1.15
 PYTHON_DJANGO_SOURCE = django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/6e/f9/284077f0e61f633e5279518a9ac5924ade4bef12bc841174ca48c57f2438
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/10/45/1ac68964193cfcc0b0912a0f68025d5bdb54f71ba7b8716e85b959874bd0
 PYTHON_DJANGO_LICENSE = BSD-3-Clause, MIT (jquery, utils/archive.py), BSD-2-Clause (inlines.js)
 PYTHON_DJANGO_LICENSE_FILES = LICENSE \
 	django/contrib/gis/measure.py \
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
