Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71278FF8868
	for <buildroot@archiver.kernel.org>; Tue, 28 Apr 2026 15:11:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CCAA410A7;
	Tue, 28 Apr 2026 15:11:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C20lRnaDfXUP; Tue, 28 Apr 2026 15:11:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2350B410AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777389113;
	bh=sTwQDAN5vbnPegOE+2RwdyovSC3Prj7UK4E5+coTBIc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=U4LMHGcbCyCheyx/ACrnjQXA2VrdRmvBYyc+AO6kynl5DdLNYMU1Caxz3oAGmwr7y
	 L3OBGrrAcPhnLTgAcKeEM18fmFYX1IFzs8L/PxV3KfkLjFuKGEmYkLHPPjHUm8acer
	 vMZ85crt+7PwAqHVMkUKOsYwbW4M9qJDlo8VkFzV+opRSzt8SHedKyQw7q+sj3aKys
	 nVH8ibVYBo+avl6+tRo9ReXIw4hf0XM8kdYAAXOOR/DYm047xTXQrpbzhgURnV7QEn
	 FaDJfaEdG9bo04rLOMh/sIoFL3BNebDDFfz9zk0dwKaidB3kq7KTNUUEPHoEpFOmIO
	 fLxxoUV12nIlw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2350B410AB;
	Tue, 28 Apr 2026 15:11:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 59B501B8
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 15:11:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4B479817FD
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 15:11:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OXU9ZR5O5bmp for <buildroot@buildroot.org>;
 Tue, 28 Apr 2026 15:11:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D217E817EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D217E817EB
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D217E817EB
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 15:11:49 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-488e1a8ac40so142455875e9.2
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 08:11:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777389107; x=1777993907;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X1fB4hDkT+k4yBrwHwQ+3eEBxA6pYrM516a87OTLa8E=;
 b=hpD+NWh8kvXpI0cFQifb49Vrdt256J2ONiEkiQCiuf3VyMCe8M2dy4PlnYEfug/dKa
 lz439CePc7Jb7m+w1a/AN9/DcsWm7KPWcrwEDv02p2Sf7NfoGoyBXSCgAxYAd2QutQ4l
 vcRQKc5K33W62Lv8b1jbn6E0ohKiVAB/OjlfQ2QekOo7o06QnhI9BKwHtuNMHHi/o4tG
 X8GqVeOZVVyPcoIvMNne16479WQcIWkZuLhYM3w83TBTrbcfRbyQYFIrNgxJ38QC1D9m
 9fJidfBhsqdx7l6r9ynYctgHXFuuzHpvW+ae0j4eyHx2pVsCc1On4L5xP53F30HbZbhC
 V9Uw==
X-Gm-Message-State: AOJu0Yx/KZhiiwdAJwIJ6kPyelF7RQCw+2nlTi8lrETw2uZCwdFguFYG
 tvB87+cBVjtcz4Qa+3H78zH/sGbK4eVuVsA62GB9HCLSqgVc2J1/JRMMFgGZwz2h7p8dkWDDCpF
 ja3kCNeM=
X-Gm-Gg: AeBDieubM9JcN2IRfw+E/Czh8lUw45oFHmBx9aDWYg0tpEHRVHXsNAGLFrly7Y+b5La
 +7bcVs6k/uPVQBlGn/ltA+JaMdbyOcwP5SHjGZKRJDK3hrNnaQwnoJcajJ0bYAZyc6G3mduoq1P
 YknSzRQwRvo5KY6ppazQ0oc6q6Fml1NU9FFPXvwf0D4iiTJXhEdcqzdGZvpS/kxG0qasu7UROEf
 mr66d8GDJqPZ0YtKKVHl7O/1kSmFZAh53oHXvBi3bPy8YLqz3Ab2AlENmqhVO3I1qSqaLWwB8SF
 KnwKnA5f1zFdhTWYVnnPyJfMuc9ES7Vf396OdQmdND+PCMa2FsdDfXqsvW9T+nfK7UBKrk8Brbt
 DkmYE4wMfC2Aq4giau2dsvo43q7Y+kSR2I/FYHmcxT3dELgfdteXuWzsIbIQDjMKConu1baSax8
 7HCjJKVaTgmfZQYcdR6Bg+emE4d8E9FkFrgjlUj55RM7VcK9Y=
X-Received: by 2002:a05:600c:4745:b0:488:9bf8:7f17 with SMTP id
 5b1f17b1804b1-48a77b054d8mr50329745e9.14.1777389107225; 
 Tue, 28 Apr 2026 08:11:47 -0700 (PDT)
Received: from dragon.home ([2a02:a03f:73a7:c001:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a774d7be0sm34046475e9.5.2026.04.28.08.11.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2026 08:11:46 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 28 Apr 2026 17:11:36 +0200
Message-ID: <20260428151136.78922-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1777389107; x=1777993907; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=X1fB4hDkT+k4yBrwHwQ+3eEBxA6pYrM516a87OTLa8E=;
 b=CsRBFvnlLUOKIpwKhxzOcFN96db1KjKQIfL1a/ga5doMuovDWG05eZ1AUQKoXJUlsg
 PJV3ClUbYi03LonaU7ZSGHKqZNqcSxFlBFTBfrlKZnZgD77BGcNjYGMmK86BvZ4mUSIN
 k6OEUAz1vP57AHEY03cz22PSn2l72wtIrFWHLhBR1F+dQQoOPniGeEin8+hnx92ZkjLe
 aE96jN5Ch4+YvBNY1aHwb2xnd5QaB69AkO+nE6dl4nZ4QTmpR8hEgPBrOvJ4rWXDknOF
 7I0s0Z0hYSJqXSb0cBXs6ha0VdwPpwX/eAQ8YOq0D430OJWbdldMSlYJIvJQHxLMzoiW
 PMJA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=CsRBFvnl
Subject: [Buildroot] [PATCH for 2025.02.x] package/python-django: security
 bump to v5.2.13
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
Cc: Manuel Diener <manuel.diener@oss.othermo.de>,
 Oli Vogt <oli.vogt.pub01@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, thomas.perale@mind.be,
 Marcus Hoffmann <bubu@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See the release notes:
https://docs.djangoproject.com/en/5.2/releases/5.2.13/

In addition, update the pypi url to a stable one, which shouldn't change
in each and every release (similar to the url change in commit
https://gitlab.com/buildroot.org/buildroot/-/commit/60ce218196281d76606849037986b275c4619ae9)

Finally, one hash file has changed because of upstream commit
https://github.com/django/django/commit/0ee44c674cf61efbca2056c40f3e4f2335aaeee6

Django 5.2.13 fixes one security issue with severity "moderate",
and four security issues with severity "low":
- CVE-2026-3902:
    An issue was discovered in 6.0 before 6.0.4, 5.2 before 5.2.13, and
    4.2 before 4.2.30. `ASGIRequest` allows a remote attacker to spoof
    headers by exploiting an ambiguous mapping of two header variants
    (with hyphens or with underscores) to a single version with
    underscores. Earlier, unsupported Django series (such as 5.0.x, 4.1.x,
    and 3.2.x) were not evaluated and may also be affected. Django would
    like to thank Tarek Nakkouch for reporting this issue.
    https://www.cve.org/CVERecord?id=CVE-2026-3902

- CVE-2026-4277:
    An issue was discovered in 6.0 before 6.0.4, 5.2 before 5.2.13, and
    4.2 before 4.2.30. Add permissions on inline model instances were not
    validated on submission of  forged `POST` data in
    `GenericInlineModelAdmin`. Earlier, unsupported Django series (such as
    5.0.x, 4.1.x, and 3.2.x) were not evaluated and may also be affected.
    Django would like to thank N05ec@LZU-DSLab for reporting this issue.
    https://www.cve.org/CVERecord?id=CVE-2026-4277

- CVE-2026-4292:
    An issue was discovered in 6.0 before 6.0.4, 5.2 before 5.2.13, and
    4.2 before 4.2.30. Admin changelist forms using
    `ModelAdmin.list_editable` incorrectly allowed new  instances to be
    created via forged `POST` data. Earlier, unsupported Django series
    (such as 5.0.x, 4.1.x, and 3.2.x) were not evaluated and may also be
    affected. Django would like to thank Cantina for reporting this issue.
    https://www.cve.org/CVERecord?id=CVE-2026-4292

- CVE-2026-33033:
    An issue was discovered in 6.0 before 6.0.4, 5.2 before 5.2.13, and
    4.2 before 4.2.30. `MultiPartParser` allows remote attackers to
    degrade performance by submitting multipart uploads with `Content-
    Transfer-Encoding: base64` including excessive whitespace. Earlier,
    unsupported Django series (such as 5.0.x, 4.1.x, and 3.2.x) were not
    evaluated and may also be affected. Django would like to thank
    Seokchan Yoon for reporting this issue.
    https://www.cve.org/CVERecord?id=CVE-2026-33033

- CVE-2026-33034:
    An issue was discovered in 6.0 before 6.0.4, 5.2 before 5.2.13, and
    4.2 before 4.2.30. ASGI requests with a missing or understated
    `Content-Length` header could  bypass the
    `DATA_UPLOAD_MAX_MEMORY_SIZE` limit when reading  `HttpRequest.body`,
    allowing remote attackers to load an unbounded request body into
    memory. Earlier, unsupported Django series (such as 5.0.x, 4.1.x, and
    3.2.x) were not evaluated and may also be affected. Django would like
    to thank Superior for reporting this issue.
    https://www.cve.org/CVERecord?id=CVE-2026-33034

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/python-django/python-django.hash | 6 +++---
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index b1859b0647..a7bf2aed8b 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,9 +1,9 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  9b60bb1145abcc97d276694f3f82a3b8  django-5.2.12.tar.gz
-sha256  6b809af7165c73eff5ce1c87fdae75d4da6520d6667f86401ecf55b681eb1eeb  django-5.2.12.tar.gz
+md5  4af55cc09a3d1a828259ad0c05330e6b  django-5.2.13.tar.gz
+sha256  a31589db5188d074c63f0945c3888fad104627dfcc236fb2b97f71f89da33bc4  django-5.2.13.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
-sha256  dcac1c86cb7ab491702bdb4c41be680fafde51536748cc8aaee3840eec53ed17  django/contrib/gis/measure.py
+sha256  a6fa72074c31928128aaa18162204507938b7a9a8b819bd833fa82467441800d  django/contrib/gis/measure.py
 sha256  570a045a8372b6cd6a00e30ebafe8e3e8dfc0a7fe3d4ef2cc5f16d419eb63aeb  django/contrib/gis/gdal/LICENSE
 sha256  08bf24b7551238ae325295245425b1caeb9ad0f42f9e2d303c7b353502632045  django/contrib/gis/geos/LICENSE
 sha256  d48633adb736dac091477ec2206feebeee88e3e6e486aedb21c584e4b49be0ec  django/contrib/admin/static/admin/js/inlines.js
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index 52d0a2b740..a478c95f95 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 5.2.12
+PYTHON_DJANGO_VERSION = 5.2.13
 PYTHON_DJANGO_SOURCE = django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/bd/55/b9445fc0695b03746f355c05b2eecc54c34e05198c686f4fc4406b722b52
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/source/d/django
 PYTHON_DJANGO_LICENSE = BSD-3-Clause, MIT (jquery, utils/archive.py), BSD-2-Clause (inlines.js)
 PYTHON_DJANGO_LICENSE_FILES = LICENSE \
 	django/contrib/gis/measure.py \
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
