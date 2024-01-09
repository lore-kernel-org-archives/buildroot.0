Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CBE1C46CD2
	for <buildroot@archiver.kernel.org>; Tue,  9 Jan 2024 07:06:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D0A041921;
	Tue,  9 Jan 2024 07:06:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D0A041921
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FEyaIPjz7byH; Tue,  9 Jan 2024 07:06:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97B5B4194E;
	Tue,  9 Jan 2024 07:06:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97B5B4194E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B53C11BF3EC
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 07:06:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B20682681
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 07:06:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B20682681
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1oVtIPOX_B7p for <buildroot@lists.busybox.net>;
 Tue,  9 Jan 2024 07:06:29 +0000 (UTC)
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9BFF68267F
 for <buildroot@buildroot.org>; Tue,  9 Jan 2024 07:06:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9BFF68267F
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-7bed9f0ea20so14229339f.2
 for <buildroot@buildroot.org>; Mon, 08 Jan 2024 23:06:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704783988; x=1705388788;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jxA18OnLldz7Gs2FbXqWBzvw3mtgbZJDiQMwXu3QxSE=;
 b=kAaYO21Ky5s1w1A2cyujaTbj9/1fO3sRYm+Bc31Ei2zdHyDCNTHGuj0Xm1FApLMFaA
 fepfDYlOIjKYbErKb7kGfDWiAIpXex3vXwvyEPkALz9kLHSUMTE+nVuCVOqFYEjHf11E
 9lRaYu9WnaeeEdQG3XTaLnYK9GCXSbJXN8oDImf0FM1185qWYlH+U7b8mYYxJY9dhqlZ
 NQ0lCjwCVjpGHQ37KYLf68EO2sdyOr89Yo2Sxktofa6o+cu3LSW4lyUPDOo3qTnh7yL+
 smgXCWdcwKxQsJzDQnuehrVYyr7ZdvtNmhhzdJLVVv53CU56sz+G3CEgGlMqqn8ZMoq/
 o/ig==
X-Gm-Message-State: AOJu0Yxtd0jV0kAJLu7ETddDW58elWzaz28IFiH/JbOc2F6RGEBhHDtE
 qLtcVfUxUCCNhNVUy2TS1Y9HE85wwemuwA==
X-Google-Smtp-Source: AGHT+IFW+vqcU1eOWzqWccrTek0oBY0DWZ6NZ35UhE7IVEbhYQugP5t9JPuBVfjXcR73JhFNaLm1gA==
X-Received: by 2002:a05:6602:275b:b0:7bb:1d7e:ce20 with SMTP id
 b27-20020a056602275b00b007bb1d7ece20mr6902316ioe.8.1704783988220; 
 Mon, 08 Jan 2024 23:06:28 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 h12-20020a02cd2c000000b0046da402ed29sm479183jaq.109.2024.01.08.23.06.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jan 2024 23:06:27 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Jan 2024 00:06:26 -0700
Message-Id: <20240109070626.4019996-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704783988; x=1705388788; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jxA18OnLldz7Gs2FbXqWBzvw3mtgbZJDiQMwXu3QxSE=;
 b=Vkiq8/NHiafrC3bl4qbwWtHSIyGf4fD7NwvqPeg8gkDdzApgBbhZarK995xQ1Te+J0
 xuIE3hmiE5JIlTGjSHByg2ijoszpGNS6jMifwyN5kyRMYKDL1Ym6Ob6xrmTeXWkhZPuY
 RO3V3Rc6PNaNvZfEA3g4uHJNmvvD+OnpuF+VmjMwDbYjhiWl1L7xY8LvtzuER/rzfdoy
 Vb/8+J4Sucn5977pKcYUAMCAd1weadkLwrJeneAU+ZqSp3rSjPds/M+PfCnXY1mE1gNz
 7vEFXAX6n0+8rKdeIJ3TZadATE7xTWZJG/lVJG8N2+l0wMHnst75VsWRPXVJniRBCOe4
 P5OQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Vkiq8/NH
Subject: [Buildroot] [PATCH 1/1] package/python-django: bump to version 5.0.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
 Oli Vogt <oli.vogt.pub01@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index 98c338f9d4..39fd9afdae 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  d7afe6a68b631725a1dac116a7832b10  Django-4.2.7.tar.gz
-sha256  8e0f1c2c2786b5c0e39fe1afce24c926040fad47c8ea8ad30aaf1188df29fc41  Django-4.2.7.tar.gz
+md5  5ff3c69d7e6b4f5ed378ec5713af8df7  Django-5.0.1.tar.gz
+sha256  8c8659665bc6e3a44fefe1ab0a291e5a3fb3979f9a8230be29de975e57e8f854  Django-5.0.1.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index 9b710412fa..ed4f4bcdf1 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 4.2.7
+PYTHON_DJANGO_VERSION = 5.0.1
 PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/5c/62/0c6ab2f3ac9a242b4562b6be1c418685fa7d1ccb8ca302cdb97e0b23cf4b
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/53/82/c8e8ed137da1c72fa110e3be9ab0f26bcfcf6f3d2994601d164dfac86269
 PYTHON_DJANGO_LICENSE = BSD-3-Clause
 PYTHON_DJANGO_LICENSE_FILES = LICENSE
 PYTHON_DJANGO_CPE_ID_VENDOR = djangoproject
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
