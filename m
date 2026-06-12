Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32197CD8CA8
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 09:08:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F40AB60EFC;
	Fri, 12 Jun 2026 09:08:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id suT5j3m2y6So; Fri, 12 Jun 2026 09:08:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 46DAA60D8D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781255309;
	bh=895lvkt4YCnV5GIxLYuOaUYCmGG31bm1mtw/relo5T8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=Mpg0HtY8zDfuRL/xcS8uHb9Adv5G2Kiwh5fp5kEaZlObhgaIKUY9zrd3rR0IkNh3W
	 lxfpx8QQHyE9p/dZDsY4oVxG7FDonmY1NZ0UG64MBLc2HL4TeIW8YV76jUygnnGvrZ
	 deJ5DmWpoKmHWKWr+Gu0I/Dcrl//m6hVcsVGv0gkrf+HHXNfXE2+D01z9aFz1UcOq+
	 Qn9YGqtndnsMRM3NGZ02DjWdw+5YqOdulk/grMKmEQk24fRqYkN8GJNo1Zwus8w19k
	 SD98WDTRvC74Il6W2cci/Sr5RH8t0GCt6vYD2b3JBHeUEZOrfgkUkrE9B2pngTJB2S
	 T1unz6IeV0DCA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46DAA60D8D;
	Fri, 12 Jun 2026 09:08:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9BBB1237
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 09:08:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8DCFD60D8D
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 09:08:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zjBpSTxc09vA for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 09:08:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A9B1960D61
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9B1960D61
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A9B1960D61
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 09:08:26 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-490cf322ed0so4817095e9.1
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 02:08:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781255305; x=1781860105;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E7vrRwjFVri6oW4lQLIRLtjnmv8BV3kxadEHGcqnPmo=;
 b=SVFYJ0n4E+PElCIMCSm0EUVfVi5MivboVP9ONFmhNu8y7YwAKTxwO6n2Fmhh75g8n5
 iu7PSpLXjfhrEHjKYZwz8zPQ5el41SciDeKdrZu+XnRRvyvwrcGahY5bVld8MfQCq5yC
 KoPPAtPnHBeXMr+4DFz2VLSqFDWIikijW//WvRJ3RLR++3D4Ul6gjAI3ka+4FD4GGPMJ
 XWNMW1Lok+y/8Zy4s4EC1h7tDPCLxYaRuQKhh8HEewyUklFxwYJSRTYlRK4rjM6MCYBN
 yuGnJaet9SBGfDLriLrz4W07EI9Sjpb31WjyX+5GJCqxhdFJJ8zUpnQxLhZlZlkH5a3F
 Nc7A==
X-Gm-Message-State: AOJu0YyN20jGD5NblRvgM4wYvMOrIfn2rCniN1Aa5cUYsfulGXSOy6iY
 52uOUmHGrG0/wkEI7zI5oC3F22ETAQ7nf8/eQiKRBI7SryK2yI2O1WR9EIl1I+Dj0p1o73pjEhY
 /54yK
X-Gm-Gg: Acq92OGunY0hJO7gdg2Uur63zVvbmlryEYamBL+rnHsBf8FACnuNQkTMjYeuwYB/ZGQ
 lkNm1CKg4AJi9Rl/qsE0hoZSjx9aZhwewVCiaLr8DyqGOjzdzbLpX1GKvVJqxqKscdFB4eq++EG
 eXTkXrGMeyP2Dx0S/Gxs676quppSQIorCnlD0FSPaneBCQ9iYIksn7r9+avOoGa8dW+vr4qrUip
 BhDhuXmg/GvY/dtoKeZ1JzGO1cGWW6hMwjKBya5yhoAuz5eDXUgJ8so7nStkdM+RQYYNN+z1b0+
 8iMUlltqVhU0mLMCSxlBvQGW7BJItyqCzAT7dTr3pIrdzZyZChvqKIX6pDZZe7BgPf7w9moQn6j
 PZ7JvvLdgjMZsPJjN5ULZyujpOLh141zxJtHM8vgMLCVsX9GJCaMEqp7Nu5twjZoB/BeBQGfozv
 v5GYZ9EcMoqA/gl0CLSn84kfWxaAdGii+c6k9zCfbrl1yw+xP1/+lMSpFEDefDTUlFPnrfASh8p
 pQ8
X-Received: by 2002:a05:600c:46c4:b0:490:e60b:5fd6 with SMTP id
 5b1f17b1804b1-490ec4e7b61mr25055015e9.29.1781255304590; 
 Fri, 12 Jun 2026 02:08:24 -0700 (PDT)
Received: from dragon.home (154.186-200-80.adsl-dyn.isp.belgacom.be.
 [80.200.186.154]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f2637ccsm3765451f8f.6.2026.06.12.02.08.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2026 02:08:24 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 12 Jun 2026 11:08:19 +0200
Message-ID: <20260612090819.1195510-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1781255305; x=1781860105; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=E7vrRwjFVri6oW4lQLIRLtjnmv8BV3kxadEHGcqnPmo=;
 b=XxHQdBQPwyWueKPY0eodKrMZzfkk0DEXycYuQUQ0F5XtdESEuM1zBZZoFGcTt/84KR
 lwkNpC0u1w+5gEP2w8zr8QnFqwyecX+CYiyh4OZCKqDXjZCHBnfM+gFjCNlzs80LfXF2
 ud9xo63xIo0KV4NbAprzempAvnzjssMPyVZ6v7xb76Df8xVjNM5sZWHRILtEJ5G27Q27
 3VEEFSuk6SxsCU1LSDMzG11nH2Q8xfdbUQPn+gboLt5EXIskcGrFuNyp3ELgT+aZKeB2
 VtAh87HqthSm/zDP4nyeylARoL8FwggDnAtLMR5ygYsHODTccBtEI/1zIFc5ldAc07mI
 gIpg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=XxHQdBQP
Subject: [Buildroot] [PATCH] package/python-django: security bump to v6.0.6
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
 Manuel Diener <manuel.diener@oss.othermo.de>,
 Oli Vogt <oli.vogt.pub01@gmail.com>, Marcus Hoffmann <bubu@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See the release notes:
https://docs.djangoproject.com/en/6.0/releases/6.0.6/

This fixes the following vulnerabilities:
- CVE-2026-6873 : Signed cookie salt namespace collision
- CVE-2026-7666 : Potential unencrypted email transmission via STARTTLS
                  in the SMTP backend
- CVE-2026-8404 : Potential exposure of private data via case-sensitive
                  Cache-Control directives
- CVE-2026-35193: Potential exposure of private data via missing
                  Vary: Authorization
- CVE-2026-48587: Potential exposure of private data via whitespace padding
                  in Vary header

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index 5af043f2c2..993b7b0d68 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  44c18a8f264c1326e6fe4f1053fea5fc  django-6.0.5.tar.gz
-sha256  bc6d6872e98a2864c836e42edd644b362db311147dd5aa8d5b82ba7a032f5269  django-6.0.5.tar.gz
+md5  b45e074d29f85e1417fb2d2ea97c2df3  django-6.0.6.tar.gz
+sha256  ad03916ba59523d781ae5c3f631960c23d69a9d9c43cecda52fc23b47e953713  django-6.0.6.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
 sha256  be30dc0e3f7010af6c453d205feaece1f89494789b6e92f0c255ef597a1e6864  django/contrib/gis/measure.py
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index fe88128e24..764e72084c 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 6.0.5
+PYTHON_DJANGO_VERSION = 6.0.6
 PYTHON_DJANGO_SOURCE = django-$(PYTHON_DJANGO_VERSION).tar.gz
 PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/source/d/django
 PYTHON_DJANGO_LICENSE = BSD-3-Clause, MIT (jquery, utils/archive.py), BSD-2-Clause (inlines.js), CC-BY-4.0 (admin svg files)
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
