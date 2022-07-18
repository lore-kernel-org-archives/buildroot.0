Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 426DDC43334
	for <buildroot@archiver.kernel.org>; Mon, 18 Jul 2022 22:14:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DA50B40B2C;
	Mon, 18 Jul 2022 22:14:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA50B40B2C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YvaJh2lJLgSj; Mon, 18 Jul 2022 22:14:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF65B4035D;
	Mon, 18 Jul 2022 22:14:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF65B4035D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BEEF71BF39D
 for <buildroot@lists.busybox.net>; Mon, 18 Jul 2022 22:14:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 98D7283DB7
 for <buildroot@lists.busybox.net>; Mon, 18 Jul 2022 22:14:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 98D7283DB7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gGbh2HRzOkVS for <buildroot@lists.busybox.net>;
 Mon, 18 Jul 2022 22:14:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C634837C9
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9C634837C9
 for <buildroot@buildroot.org>; Mon, 18 Jul 2022 22:14:17 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id o8so7934415wms.2
 for <buildroot@buildroot.org>; Mon, 18 Jul 2022 15:14:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9bCWfzBsQLhUe0starhR9/BqSpStue83lUuYC20aMk8=;
 b=115WfcJsnFFnvqDBYPQNcZZApYJYvCHQYQFLdeEcSx35qT1+eBDZfM2AEOK/oa03Qy
 OMqrG5/kzI/SBSDAdAzPuSMW0ZdP3PEwBGe3pgYJoHU/Aub7LKbM0ZKuweFTb7mJpT7P
 qzVwP8QdAZ3vbCeKq8kJrMwttVvUFhHaIsJNDAyisajMXhhpKURmC9ty2XngOSdtYGFN
 nswGGAfUuncja+WA/W239MHB5fwHlGpo4EacpGZpeSEVIzB0Lx06CxpUVvzrNgUQIONq
 IlzVGRjaT6QDkRpxYXzk/j+gBxbbfnbG19mwM/5iK9GIZ9iqV3sylxz4AG+kjKjg34I0
 XAng==
X-Gm-Message-State: AJIora/6Y0Qw5fzQvUbWhgrSClymkObG1Nad64vq69Z3N/AT7qzilPXJ
 RXRJ5su8qqBfM3vNA7Awo1x8mZMbiCw=
X-Google-Smtp-Source: AGRyM1s2Z+38PhUtnBTEHXfPrs09gWJ0GKAKRmmfErfem7hHx1uwWEn4MtrQiiB0DC++eoNAU2zWUA==
X-Received: by 2002:a05:600c:4e49:b0:3a3:117b:f785 with SMTP id
 e9-20020a05600c4e4900b003a3117bf785mr13282562wmq.138.1658182455561; 
 Mon, 18 Jul 2022 15:14:15 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 i10-20020a05600c354a00b003a31d4f6a1bsm3800182wmq.44.2022.07.18.15.14.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 15:14:14 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 19 Jul 2022 00:11:02 +0200
Message-Id: <20220718221102.3034495-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9bCWfzBsQLhUe0starhR9/BqSpStue83lUuYC20aMk8=;
 b=c8392x8BSUsgOEyTuYV6OnHaB/BV79A9IP8krhaAdWPAKBS1o84cFtIK65OCnfqNIF
 QAdYNa4RAlhYV6PB1IyCV+XWdoAEUgcNOfP+LpZBBSa5OcJYv7gluOPGBvSeftBD/rxY
 SrJhZLk9tdVLrWDWRLrIyVaRCBDhC3dmN30Fzh/UzhlJPqBmazT+xSoPRh7gUKZYpg4p
 kBBr2p3AW8qumIWJGY0+1DWAzKo52vCVH+ZpW5yB0Bb7grWZgixMNLwo6xcQgMX7hJAt
 Q9LrI/YvbknsGcskhHXmNMsYmRuEjyUgWkgBuVRRJNwsp7/PWZVt+RS8g0XD+RpdLbvF
 pFJw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=c8392x8B
Subject: [Buildroot] [PATCH 1/1] package/python-django: security bump to
 version 4.0.6
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Oli Vogt <oli.vogt.pub01@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix CVE-2022-34265: An issue was discovered in Django 3.2 before 3.2.14
and 4.0 before 4.0.6. The Trunc() and Extract() database functions are
subject to SQL injection if untrusted data is used as a kind/lookup_name
value. Applications that constrain the lookup name and kind choice to a
known safe list are unaffected.

https://www.djangoproject.com/weblog/2022/jul/04/security-releases

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index 8d9f0aafdb..bfc9219c7e 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  153fcb5dd7360b7ad219d65cb53e2d57  Django-4.0.4.tar.gz
-sha256  4e8177858524417563cc0430f29ea249946d831eacb0068a1455686587df40b5  Django-4.0.4.tar.gz
+md5  ad4e850c7110a45a6c7778d5bd01b85e  Django-4.0.6.tar.gz
+sha256  a67a793ff6827fd373555537dca0da293a63a316fe34cb7f367f898ccca3c3ae  Django-4.0.6.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index b4d6ec21c9..d49c845d54 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 4.0.4
+PYTHON_DJANGO_VERSION = 4.0.6
 PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/d2/95/93d1f75da95624bf89e373d079fa72debf77f9b10acc31998cc52a5ff3f9
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/a4/17/b10aa26d7a566a3c19e9d29fac39c8643cbceb6cd7649a378d676839b5db
 
 PYTHON_DJANGO_LICENSE = BSD-3-Clause
 PYTHON_DJANGO_LICENSE_FILES = LICENSE
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
