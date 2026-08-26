Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D11FC61DBD
	for <buildroot@archiver.kernel.org>; Wed, 26 Aug 2026 07:37:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35496402A6;
	Wed, 26 Aug 2026 07:37:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4XE-TWe1jwYo; Wed, 26 Aug 2026 07:37:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787729854;
	bh=q4hOZjkuZ+cwQ1tuY74HSOnm96lqAJOVPAaPNCFVjuc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=gZnN19vgckBJJhYe2EL2Kqkj11ZnGmTcebzJQVAiKikHx+16dZuygyBlmdNcfEHAQ
	 V48U2XOw89KueIum+CSkdAC2J15FCb47TmJqbNn0Kmp8RqGnMdj4hQSBVt6nL0d1Sq
	 PCtjDjiT6TNcljCQ8CtRm3LcIdcimZjT1hNPVFsHG6+drvFWEj9Qm5b2ij3vyrpvuJ
	 xkpCewQ/kAItaj9MVvoEDOGP/UMixmcFYDGV73pql0oTdDdC4dLUiVCFKkYkA3YcGL
	 KCG9NLySuY0afKxVtjV5eprUMu0nOuYmEKeE50Pfj9xATmdPZeDfup8BEm0keWXcBY
	 9cgr8yrrSlbyA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D1CE402AD;
	Wed, 26 Aug 2026 07:37:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A8FB1355
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 07:37:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8F76B402AD
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 07:37:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NQaZQLz0WrlK for <buildroot@buildroot.org>;
 Wed, 26 Aug 2026 07:37:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A33B7402A6
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 07:37:29 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-c252c7270faso14932966b.3
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 00:37:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787729847; x=1788334647;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=6ypv1I+lyLdSGFt/dmhzETM8aW8LT8RelQnQ+BbZ0Zg=;
 b=tA6snxCXpbiqC8bXHT3BRwiQNYfw95DNOEjjmARyyQtp1ch1vP7HP1nkS2cFfo6tQa
 +MI3hgrBVthWs6nWi0yHcn+EUOAQ/WG+zLe7jw7B2qco+Qhca/2U5EmhxwpjAH5r8Za8
 e2zY4kB0eZKb/BQalTd0T/gNwQWV2Z+VVcGoCz5RxfDY8MB4UTOHbXLTO37GPttKDXvy
 /fYgAq15zrUzWj90zLh9gx1I093VBPdVJXDjLkTyr7AYOcl/srer4/QT088/m0VmLWuW
 eo6PpJn/F1iv/nU5b5PlOF1Oy7a0aeqth/XFOUVUklkkyqa7mctCBMm5pjLgcSxRao9m
 SQIA==
X-Gm-Message-State: AFuF++kl4q3shQhnfbT9TeHVEXFW9TaaUvwJqzyrgczA4FgKqP/y87bx
 JOIRmYMy+6QfV1BOF9DdQ4aRwS+0t137qBjGj8u2E2R9aXgMfPkF2ylTkB44mbHQrsF0VYuLcP8
 IsUMYjWg=
X-Gm-Gg: AR+sD11rWw82fsCdUNVYNgPfDpPxrlD6As2smgsJr6RBJ5MJMbuLNDKLJULeJpTpVBL
 L2eU03WllNJNLl3DWXGCSthpp0NQsK6AwCAt3oirFUh2d2/4HSA8rc+5Q0ldyAoeJYXVCd0Oqog
 /EcvIB4D+xQDrhzWt/mA84JeHgSe1xpmZkh2pNIFWGix5fQVNmdknkFVX0DkYfTZz/VM+Jd1QMu
 TBI4MFA/scH7yJ1KwBEhiFZi1aeZWwivhopF0Na7kqk+hZAl1PLxyEhWIggsj/8XPrpl8WStyy5
 Uc5JeWFJ3XR8cQO4HbWzw678MwTeWXIRLxuOexmwsiBk7KT1cY+pHeEc97G6cuH2MvO2OPKGQqc
 TMMLrnK/bsd2/VSnEFJXCfq2D+obrM/0WXnYRiYfBezHRYQ7VlQIUBswjcrcc34wiFzhmbmJYlc
 TBDHEktk1ursf6HD2cXwp6a/R1pU69T6EqAlqCQ09jbkHLq0ME1RT4dnxirhDQOJBaNAUdN+r4O
 vaQ
X-Received: by 2002:a17:906:99ca:b0:c19:49ee:19b9 with SMTP id
 a640c23a62f3a-c250bbd421bmr488286666b.15.1787729847335; 
 Wed, 26 Aug 2026 00:37:27 -0700 (PDT)
Received: from chapelon.home ([2a02:a03f:63ab:dc01:ce15:1729:c989:3a9e])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c250a6fd00csm370055366b.15.2026.08.26.00.37.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2026 00:37:27 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 26 Aug 2026 09:37:16 +0200
Message-ID: <20260826073716.32029-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/{avro-c,
 python-avro}: security bump to v1.12.2
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
 Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This release includes a broad round of hardening against malformed and
adversarial input across the Python SDK (bounding allocations and enforcing
decompression limits before trusting size fields read from the input).

See the release notes https://avro.apache.org/blog/2026/08/12/avro-1.12.2/

Also update the download url, because www-eu.apache.org/dist/...
is a redirection to downloads.apache.org/...

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/avro-c/avro-c.hash           | 4 ++--
 package/avro-c/avro-c.mk             | 4 ++--
 package/python-avro/python-avro.hash | 4 ++--
 package/python-avro/python-avro.mk   | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/avro-c/avro-c.hash b/package/avro-c/avro-c.hash
index 9a53346cd1..4e34c27c23 100644
--- a/package/avro-c/avro-c.hash
+++ b/package/avro-c/avro-c.hash
@@ -1,3 +1,3 @@
-# Locally computed
-sha256  b64e31b94719499549622aa92f1d96d1742967ced261a0931b63be3bbe907f2c  avro-c-1.12.1.tar.gz
+# From https://downloads.apache.org/avro/avro-1.12.2/c/avro-c-1.12.2.tar.gz.sha512
+sha512  bed6a7e324e7cac52d2bdfe0a596ab90c32c0f99ffecb517a72e465dad5fcfddc49dbfde0efa33e4c8ad73f2e97ad2c90d52f31a51f55b05576a9b36b2c3546b  avro-c-1.12.2.tar.gz
 sha256  d62488d6ba17132e92c23c03c80bfedc848267f96ab36489fec860f76cf6819a  LICENSE
diff --git a/package/avro-c/avro-c.mk b/package/avro-c/avro-c.mk
index 3e41716836..8d18f78cdf 100644
--- a/package/avro-c/avro-c.mk
+++ b/package/avro-c/avro-c.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 # When updating the version, please also update python-avro
-AVRO_C_VERSION = 1.12.1
-AVRO_C_SITE = https://www-eu.apache.org/dist/avro/avro-$(AVRO_C_VERSION)/c
+AVRO_C_VERSION = 1.12.2
+AVRO_C_SITE = https://downloads.apache.org/avro/avro-$(AVRO_C_VERSION)/c
 AVRO_C_LICENSE = Apache-2.0
 AVRO_C_LICENSE_FILES = LICENSE
 AVRO_C_INSTALL_STAGING = YES
diff --git a/package/python-avro/python-avro.hash b/package/python-avro/python-avro.hash
index f7a241b14d..2941240053 100644
--- a/package/python-avro/python-avro.hash
+++ b/package/python-avro/python-avro.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/avro/json
-md5  e2debe491ace30e479944ac4e8e832d9  avro-1.12.1.tar.gz
-sha256  c5b8dd2dd4c10816f0dc127cc29cfd43b5e405cf7e6840e89460a024bf3d098d  avro-1.12.1.tar.gz
+md5  0ff774ab3e45a2d48e5b68cd688cba66  avro-1.12.2.tar.gz
+sha256  e900e7b59a4781f63d9e935e88f6ec50c4d60be3f4adf9c63b51ed39d578fe08  avro-1.12.2.tar.gz
 # Locally computed sha256 checksums
 sha256  c79a7fea0e3cac04cd43f20e7b648e5a0ff8fa5344e644b0ee09ca1162b62747  avro/LICENSE
diff --git a/package/python-avro/python-avro.mk b/package/python-avro/python-avro.mk
index f13ea9d2ca..37fcf76c90 100644
--- a/package/python-avro/python-avro.mk
+++ b/package/python-avro/python-avro.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 # When updating the version, please also update avro-c
-PYTHON_AVRO_VERSION = 1.12.1
+PYTHON_AVRO_VERSION = 1.12.2
 PYTHON_AVRO_SOURCE = avro-$(PYTHON_AVRO_VERSION).tar.gz
-PYTHON_AVRO_SITE = https://files.pythonhosted.org/packages/60/00/af1eec633637e12d0945a97f05a429eed83ac45865af60cb453db4689d95
+PYTHON_AVRO_SITE = https://files.pythonhosted.org/packages/5f/68/973b9c682aa2c3cf2b05fc4c961af11b9be1d9b46604f65aed23cd4fd1e6
 PYTHON_AVRO_LICENSE = Apache-2.0
 PYTHON_AVRO_LICENSE_FILES = avro/LICENSE
 PYTHON_AVRO_SETUP_TYPE = setuptools
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
