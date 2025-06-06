Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7D7BC5B549
	for <buildroot@archiver.kernel.org>; Fri,  6 Jun 2025 08:01:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FF89407DE;
	Fri,  6 Jun 2025 08:01:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y5o2MKZoy67R; Fri,  6 Jun 2025 08:01:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E06040702
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E06040702;
	Fri,  6 Jun 2025 08:01:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7DD38D3
 for <buildroot@buildroot.org>; Fri,  6 Jun 2025 08:01:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6F83F60809
 for <buildroot@buildroot.org>; Fri,  6 Jun 2025 08:01:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tl1VhWs8G59y for <buildroot@buildroot.org>;
 Fri,  6 Jun 2025 08:01:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4AFDF6065D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4AFDF6065D
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4AFDF6065D
 for <buildroot@buildroot.org>; Fri,  6 Jun 2025 08:01:17 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-450cea01b9cso5605345e9.0
 for <buildroot@buildroot.org>; Fri, 06 Jun 2025 01:01:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749196875; x=1749801675;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NCqtLym7cLPsMnQV/+EUAIgPA4CHqDa0QMDMlm3obOo=;
 b=wWi7UOw/z9qjg8JW2JIqzVQlZCiMBTnjs9y2p6MdeYGezBe+HeXUUmA2PV1QlVc2G9
 uwGgdb13duxz4jx44oknFa7rNKIwO/Gj2CyYI7PEYYCtmA/HvotXdTHM4ga0+ePMR6aX
 pZzZT+xRtwo5XXhQO2/TmHkK1j2ofvet/lS87xQo4ijBHIAzuKsrx7qll9ueQ3V+BAuY
 Q4AiISoTjfv9NVJ0NvNKh/xk4liso1zjSwDYsjgcfsbK6ejM2/qsayrwhheYA3PKMlbO
 jTyNfmDt5PbQbbiSRR3WQMPhpB8u8ZB+tDOoGZsi/K7OC6FnQMvVDtinChV9l6/bOHo7
 Mj1Q==
X-Gm-Message-State: AOJu0YzIkk5OywGydxLD36woSWhwhMLJ+Xk9QY1E+a0QPK6OlEekJ1Cy
 N5INc3EjUPihEDqn3J8Okhjf/pmjWPT0Vn2Yyn3IMYToS18ktRSkp1hs0BWkTD2BiOQAvGra9UD
 EYlzA
X-Gm-Gg: ASbGncvKCQcfgO7Sh2SLKZGxB4Wmwjhw917Gx8ZdxdDbTCNX4DmFhc8aucSvdjLGlAA
 vQLoGkELGvXdCBwaE90f0LHYEnl1mBwzML8/R7OHnEA+TDX3qrDL6qXnXKjK1lm1bln0e1LYlRs
 CLXHAdFYFBn1EBsCX5O11UfN40Wr8uWWc+OLWXheQCZu69yzVixgFqnI2FAATnNCVlqz9k93OYA
 oIpqlNl7M9z2A30+UZaRCQb/iT36fvA1I2Cz7fUQBdw1uJouUv7c0j6G2EJoqRbE6022Avq8V9c
 UK9siZ9i3mERLFa9l7Ke75NAUwwgmXv6B/RFoeV9RpNl3T28d4oOXPSkPYbtLGXwkFnVIZa5UXB
 oAev2OnOZ4P/d/4eitlCx2hq4YxwF3TNpxGpbdUTrCV8vBg4LFo5pGw==
X-Google-Smtp-Source: AGHT+IEo6iLvzP7pe7u/B7PWxy38kiSKVVcq+HMRCadwOax9mMSxKpKxiX1ZXi0bNYGVxfWmoI7kOQ==
X-Received: by 2002:a05:6000:288c:b0:3a4:cf40:ff37 with SMTP id
 ffacd0b85a97d-3a531882247mr2068114f8f.6.1749196875532; 
 Fri, 06 Jun 2025 01:01:15 -0700 (PDT)
Received: from dragon.local.ess-mail.com
 (ip-94-140-185-241.reverse.destiny.be. [94.140.185.241])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a5323b67ccsm1141455f8f.40.2025.06.06.01.01.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jun 2025 01:01:15 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri,  6 Jun 2025 10:00:51 +0200
Message-ID: <20250606080051.976890-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1749196875; x=1749801675; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NCqtLym7cLPsMnQV/+EUAIgPA4CHqDa0QMDMlm3obOo=;
 b=AWozQ45bcoq8QSWoiRQV9d7GXDlRmYqUcOWRR8W5l0SR9N9ZcpwZ2ljELvBSNhQaN8
 NTe60/l+usKYUIizEClLqdAhstL7k93VqSohudBn4OUs89/2tMR8Oww0rQDdo2voqFqI
 mkooJGWfnNWQVmDNzKtkhpvnR16GifxpV5uJgXX8yx5u1lw4uihSOR24PnmQOvIY+aJt
 P/Jaw9QWBMlHWkn6q7g8g7Q50W5g32v9zD4iDV7ExkaSmgyW4xi21YGjOSlLzrFvOcTo
 C/cjdUvjDJfvl1czVEzzdEX0JSaVG1IfwZMnNY2upJjRpocM9XcR5qs1Cz5uESwvkcaq
 M6YA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=AWozQ45b
Subject: [Buildroot] [PATCH for 2025.02.x] package/python-django: security
 bump to v5.1.10
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
Cc: James Hilliard <james.hilliard1@gmail.com>, thomas.perale@mind.be,
 Oli Vogt <oli.vogt.pub01@gmail.com>, Marcus Hoffmann <bubu@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This fixes the following CVE:

- CVE-2025-48432: An issue was discovered in Django 5.2 before 5.2.2,
                  5.1 before 5.1.10, and 4.2 before 4.2.22.
                  Internal HTTP response logging does not escape request.path,
                  which allows remote attackers to potentially manipulate log
                  output via crafted URLs.
                  This may lead to log injection or forgery when logs are
                  viewed in terminals or processed by external systems.

See https://www.cve.org/CVERecord?id=CVE-2025-48432

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index 57b9e9fb0e..330fdf8238 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  da93c81fcaf2e0b4dab3cf44e7564c7c  django-5.1.9.tar.gz
-sha256  565881bdd0eb67da36442e9ac788bda90275386b549070d70aee86327781a4fc  django-5.1.9.tar.gz
+md5  d3b7a04b581dec5d74769df44e0ddbd1  django-5.1.10.tar.gz
+sha256  73e5d191421d177803dbd5495d94bc7d06d156df9561f4eea9e11b4994c07137  django-5.1.10.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index fd8a4eb9e8..1b769af62a 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 5.1.9
+PYTHON_DJANGO_VERSION = 5.1.10
 PYTHON_DJANGO_SOURCE = django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/10/08/2e6f05494b3fc0a3c53736846034f882b82ee6351791a7815bbb45715d79
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/73/ca/1c724be89e603eb8b5587ea24c63a8c30094c8ff4d990780b5033ee15c40
 PYTHON_DJANGO_LICENSE = BSD-3-Clause
 PYTHON_DJANGO_LICENSE_FILES = LICENSE
 PYTHON_DJANGO_CPE_ID_VENDOR = djangoproject
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
