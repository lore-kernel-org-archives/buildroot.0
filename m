Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E0D8E7317E
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 13:55:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55D7440697;
	Mon,  2 Feb 2026 13:55:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P1Dh4-P8Zgww; Mon,  2 Feb 2026 13:55:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B52F4068B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770040505;
	bh=7+B8XRHvDYgSK+0MZDN9MYalM1bpKuMrOATr/mzu/QQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=lts+hi28op8ZyX/sOof61qTv5SIHNbQxSFovEFZa4PxE0bEfl8f6KWV4/BB8NLmLa
	 3/yOaL2iZLO64nzXzxLAK2+P7vnIyslY3XvWcl5sDzSMYqZxORvMUGKwuD3G7K5Tmo
	 4qXZZBeZ2W0yOsGyWKc2XjMwambMgfmzbU7xIKRxfZ8H4xADl4Qd9e8Dcy987vbNz+
	 9/jHM1gFetOmt99smRU/+UixuKy3qas4OmNHclTixrf1z8tzjbGe0rmw7dIgpig7EO
	 Ftwl0BMYgGesWWrK11WHKZbPebC7eL/jNFfrwUI+H/ivrThHOWuoh3GYCPtKTBEejR
	 85OvU0oegTq/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B52F4068B;
	Mon,  2 Feb 2026 13:55:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9A7BD149
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 13:55:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 88BEC40346
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 13:55:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FwFchlsX0yAD for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 13:55:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 77AB6403FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 77AB6403FC
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 77AB6403FC
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 13:55:02 +0000 (UTC)
Received: from framework-OT (host-109-89-232-55.dynamic.voo.be [109.89.232.55])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id E0FD22C829D6;
 Mon, 02 Feb 2026 14:54:59 +0100 (CET)
To: buildroot@buildroot.org
Date: Mon,  2 Feb 2026 14:55:11 +0100
Message-ID: <20260202135512.3833917-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1770040500; bh=g7S5uYxe7zWYf3lkFkQ9xREPMRstmUER6OIgTNSakco=;
 h=From:To:Cc:Subject:Date;
 b=knl9AZXNW46vJeeoZATrM/edx9f8JUiKvJf0YM2m4679FO+lK5797A1X+535IvtvQ
 ZEgFV6aNgmGxKV5zfo02sKf2A6WyfIC+laMtthcqfXuZZl8GEQALPfMHeI5NJfo1Cv
 EjYF27Zgh5tSkglQfWRjIZjPVzoQcRSf2q4hb7A97yu6Jb0Gs3GtudXxokDkdYOeks
 dfVfUxWp6hoyT3PrtrSKIXWmX7ewfurqkGfTV09VwELxVxg1gGextf0xaPVHp18ZEh
 dUoaL3UtTmj7qOMd32Ahv1B+LD6jz6E37fYMcZZnkjrniMO72g+T5sgnAKG8FTnQLe
 XeXbNHCF8hR1Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=knl9AZXN
Subject: [Buildroot] [2025.02.x] package/python-django: bump to 5.2.10
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Oli Vogt <oli.vogt.pub01@gmail.com>, Marcus Hoffmann <bubu@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Django 5.1 support ended December 3, 2025, bump to 5.2 LTS that's
supported until April 2028 [1].

[1] https://www.djangoproject.com/download/

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index 0c9b70959f..1c2b9bcd29 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  232748d1f2d6d1074f873dde91f7d75b  django-5.1.15.tar.gz
-sha256  46a356b5ff867bece73fc6365e081f21c569973403ee7e9b9a0316f27d0eb947  django-5.1.15.tar.gz
+md5  98e667c17123f7bbd2d7d1db32f9ccdd  django-5.2.10.tar.gz
+sha256  74df100784c288c50a2b5cad59631d71214f40f72051d5af3fdf220c20bdbbbe  django-5.2.10.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
 sha256  dcac1c86cb7ab491702bdb4c41be680fafde51536748cc8aaee3840eec53ed17  django/contrib/gis/measure.py
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index 32821e19a0..184f91bfa1 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 5.1.15
+PYTHON_DJANGO_VERSION = 5.2.10
 PYTHON_DJANGO_SOURCE = django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/10/45/1ac68964193cfcc0b0912a0f68025d5bdb54f71ba7b8716e85b959874bd0
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/e6/e5/2671df24bf0ded831768ef79532e5a7922485411a5696f6d979568591a37
 PYTHON_DJANGO_LICENSE = BSD-3-Clause, MIT (jquery, utils/archive.py), BSD-2-Clause (inlines.js)
 PYTHON_DJANGO_LICENSE_FILES = LICENSE \
 	django/contrib/gis/measure.py \
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
