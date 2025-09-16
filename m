Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00325CAC592
	for <buildroot@archiver.kernel.org>; Tue, 16 Sep 2025 00:11:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA97940A8B;
	Tue, 16 Sep 2025 00:11:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jMiudYM9ES8q; Tue, 16 Sep 2025 00:11:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CDF3340A80
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDF3340A80;
	Tue, 16 Sep 2025 00:11:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 79EA222F
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 00:10:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 60ACD8134C
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 00:10:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UclpSlVTRoiM for <buildroot@buildroot.org>;
 Tue, 16 Sep 2025 00:10:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d33; helo=mail-io1-xd33.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7646181349
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7646181349
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7646181349
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 00:10:58 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id
 ca18e2360f4ac-89365bbc079so44469539f.0
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 17:10:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757981457; x=1758586257;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=O3A7/NdWZfOgMtpnTyqXPmDljY6zDPO5zLLJ91aGrPc=;
 b=MZ8aEmBeDOrqjKqLQPsed6Uc2OS2JZdb5/rauKODRYElvLP4bdQyzpR5JqQLP5R7w/
 TCN1zVEB9kbrsww8IVfdDk7N/0o+CKqRbYSvVz1W2irCuEA07n2uQbTjcjc2C87ElvYp
 tXsJwSBInzpWj6JPJ4vFnw4wFxkt20YmRLuWbJQ+CHqq4nsSyl4q2r4IH+J/Ebuuyqn2
 o4yy63ou5XdLmtI5VegF6zjadO8sLD8z8Vr/V3Tkqukd5S+S5hKK9c9V9S5PeAC5S+Fd
 Ea5rNTRyplH74PefGivEcpenORK85SJ4pjyFiDVnr5pT+C4aCVksInDPSQage18zxQ24
 v7dQ==
X-Gm-Message-State: AOJu0YyxdP24xY3edkYdPOa54VOCnt0YyLfoRWPQy+rxzaxRxtvoj9/5
 FG93cz6rA6zZsV7IcpueTwI0BvpC1+UnVlE7RdZP/eKvySaH8uuMgmUjusoYiQ==
X-Gm-Gg: ASbGncsiMEJDpm3pFjMnersiqeUIPiCoWT5nvsFqbvlKtofwuqgF6Snj1eFfqdxKDd1
 H1xfBTDxk/3u/nCO2HUxfZj3nzoFremhoG99e5LKtmb2kb/3HQb2MQuuk06I2bJWvmogPJ6NngT
 tgPo083rpStGVgEn+y/VetJh/dXTf+ZbBNOdN7gIYfx+8lUDoqVDGLIqUfks9VBsTwOKzpq5z6X
 ro8o9tYc5W1McDVCZT2ySjLNA1uD1pPfWK0p2ab0KhGhE7H14IVCFM+LhyJUjKOy1FntHRRyKBT
 mlHggT5htOASb8JEXepXMsFFCeoK6gsWIxRwXxYgXOCtwdJl6PoSZg8JqiFvgFdExGbxxPT3P7T
 oagQRlZDMjGlNM8BW5L4XgU1S3YEJs4KjmmTAqOG4tH+++TLJ5m7TYWBlXWLbnDtgS1hQqx2x1k
 2J
X-Google-Smtp-Source: AGHT+IHsZ062JGVkMDnm4lnhKXNg5e3v4PArMvmEyLruUphMOsUhzpSZHFwWvTId/O++pr/6JGV3aQ==
X-Received: by 2002:a05:6602:6d86:b0:887:53ad:fe06 with SMTP id
 ca18e2360f4ac-8903280bd09mr1728257939f.4.1757981457099; 
 Mon, 15 Sep 2025 17:10:57 -0700 (PDT)
Received: from james-x399.localdomain (71-218-100-179.hlrn.qwest.net.
 [71.218.100.179]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-88f2d69e080sm470679239f.8.2025.09.15.17.10.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Sep 2025 17:10:56 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 15 Sep 2025 18:10:55 -0600
Message-ID: <20250916001055.2475846-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757981457; x=1758586257; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=O3A7/NdWZfOgMtpnTyqXPmDljY6zDPO5zLLJ91aGrPc=;
 b=E6Onb1vxJwXY+UIu2NdgKg61plckE0N0Ftx7NYmmc6X4IePDkfXCbkUoi6tCymYSoZ
 VpaxhZCEJoysc1gI7ZsZsbcHiD5jP11nt1jM2c9fHYhFlfqpIN7YjawvPBgu9XTv6dlV
 3x2EGodYshlFUpTmbaEelmuzDr0GdiXAhmGNC2cL+aPmGEfskZkp3+/Q46MxuJdaPFSi
 WMkrfnmjgGx9ZUDImCvFmUOh20EfN0zxuP9z0lymDZ7/odR14ASMYPp6Z5cbKVyuBvi4
 Pn7XfjlMUoai5QMOa/YGjwxeQ8zVckGJYn+knUftZKZHask02UZmWJ4LyKRhmKZBXz1o
 qtpw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=E6Onb1vx
Subject: [Buildroot] [PATCH 1/1] package/python-lxml: bump to version 6.0.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-lxml/python-lxml.hash | 7 ++++---
 package/python-lxml/python-lxml.mk   | 4 ++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-lxml/python-lxml.hash b/package/python-lxml/python-lxml.hash
index 059238ffab..27dd4ab979 100644
--- a/package/python-lxml/python-lxml.hash
+++ b/package/python-lxml/python-lxml.hash
@@ -1,6 +1,7 @@
-# From https://pypi.org/project/lxml/
-sha256  4e109ca30d1edec1ac60cdbe341905dc3b8f55b16855e03a54aaf59e51ec8c6f  lxml-5.3.0.tar.gz
-# Locally computed
+# md5, sha256 from https://pypi.org/pypi/lxml/json
+md5  2aab7842d05041c68f8a83547e034bfd  lxml-6.0.1.tar.gz
+sha256  2b3a882ebf27dd026df3801a87cf49ff791336e0f94b0fad195db77e01240690  lxml-6.0.1.tar.gz
+# Locally computed sha256 checksums
 sha256  41d49dd406aa0e1548a6d5f21a30d6bf638b3cd96eb7289dd348d83ed2e40392  LICENSES.txt
 sha256  69edb445c1335a8312d4c09271847e9956d84f0d9f724d125340cc3fad767b2a  doc/licenses/BSD.txt
 sha256  0497ae8138811ef4466ede653bab7a59feb3d3c14f9ed50fc33a00aeb5bec32e  doc/licenses/elementtree.txt
diff --git a/package/python-lxml/python-lxml.mk b/package/python-lxml/python-lxml.mk
index 8604b5783a..f09b5a5682 100644
--- a/package/python-lxml/python-lxml.mk
+++ b/package/python-lxml/python-lxml.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_LXML_VERSION = 5.3.0
-PYTHON_LXML_SITE = https://files.pythonhosted.org/packages/e7/6b/20c3a4b24751377aaa6307eb230b66701024012c29dd374999cc92983269
+PYTHON_LXML_VERSION = 6.0.1
+PYTHON_LXML_SITE = https://files.pythonhosted.org/packages/8f/bd/f9d01fd4132d81c6f43ab01983caea69ec9614b913c290a26738431a015d
 PYTHON_LXML_SOURCE = lxml-$(PYTHON_LXML_VERSION).tar.gz
 
 # Not including the GPL, because it is used only for the test scripts.
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
