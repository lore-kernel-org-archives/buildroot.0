Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B884EC27C77
	for <buildroot@archiver.kernel.org>; Fri, 14 Jun 2024 16:22:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7FDEF415BB;
	Fri, 14 Jun 2024 16:22:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3L0FcvCO-EFN; Fri, 14 Jun 2024 16:22:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA66F415D9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DA66F415D9;
	Fri, 14 Jun 2024 16:22:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 72EB51BF326
 for <buildroot@lists.busybox.net>; Fri, 14 Jun 2024 16:22:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5FE9141674
 for <buildroot@lists.busybox.net>; Fri, 14 Jun 2024 16:22:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PdblETb8Lk-a for <buildroot@lists.busybox.net>;
 Fri, 14 Jun 2024 16:22:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C9C794167E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9C794167E
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C9C794167E
 for <buildroot@buildroot.org>; Fri, 14 Jun 2024 16:22:03 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-421820fc26dso19808135e9.2
 for <buildroot@buildroot.org>; Fri, 14 Jun 2024 09:22:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718382122; x=1718986922;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=VrMp2vnWuWwJAHz6gjUkmgz2OH2cEQDPaVKGf387Evs=;
 b=MxGMnyXv6cx2x8ZQbFCQrx/RSRtzyjxZRzNH72u58cSTRSN2NlV0wrxrlTsIxv+nOs
 78zSQJaOCHd6GUPW3bdR7u6+xzA0roe3mV4806hjg3KzJOzaQenGjkLXprafFMFZbK4R
 YJt0xAoTrtdgnuIvqf3Lx7Gd5KvInOcx+Rx53Jms0QQNZ9DQrXnqQWlJkVG1Ty6k52IX
 5KqmubEjitNVRNeVh1OVBCw++GqV3aBUcYVZnwVgQiHVUU8lKo+QzUSseMTk36S0TIgq
 Ebc7igb5f44N+Xa/5B2gEocj98q8aX4khbbt0wIgWA2siNpfXVQL/kYaTM2mX22iB4B+
 klmQ==
X-Gm-Message-State: AOJu0Yy8/jTssVSL1n+0NnG4grJFsG7gTEfLODRHGl17sliTM+nv9+iO
 RVA/QayH7qy/RErm3xqhOX5gcWnJ7K8FUtJeKHg1upnwDxKcfJWlAfPDJg==
X-Google-Smtp-Source: AGHT+IFFqwco7EeMhDhkxRAxxKJoaqmB0zokilTZZnVlpGcQbUWTi/OAcnR5sxMLxUtjACQy1Zsamw==
X-Received: by 2002:a05:600c:b43:b0:421:8e64:5f36 with SMTP id
 5b1f17b1804b1-42304820d7cmr25841695e9.14.1718382121531; 
 Fri, 14 Jun 2024 09:22:01 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-422f612800csm67133175e9.28.2024.06.14.09.22.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jun 2024 09:22:01 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 14 Jun 2024 18:21:57 +0200
Message-ID: <cea1e19d0c970055e04dbdbcfd7f1c74d2f4d694.1718382114.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <cover.1718382114.git.yann.morin.1998@free.fr>
References: <cover.1718382114.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718382122; x=1718986922; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VrMp2vnWuWwJAHz6gjUkmgz2OH2cEQDPaVKGf387Evs=;
 b=JhguNOpP3fnQm3feRayY/oYIvugrFdN5B50mlIvXDS8qYrZcyR1n+YypKD5LY62odH
 PSFZgv60mdrHDdsoSmeTFx0PqvXlg3QMzxyydSFQhm8jXcD8J/obUqJo6J19e0GxI3Fm
 S6OLSuMab04TSuaYbNmzz9v9NWkQU7K9w7FH04EXOLu0CL7J5diTL8X+OQ/91I0mPdd2
 Q+xvBubAhpvHfXWOQZCQAt5c4LF8jkCB72CEU7LiHkvbLcaVg89RIBZKarTJkyZ+Tq+E
 DsNSyrPdC0iAXJuK73FWEEpRjE6vt3J3Dz63QCNvf5BIKiAHqrIV62aCPM9C2qFbTkM2
 Za+g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=JhguNOpP
Subject: [Buildroot] [PATCH 5/6] package/python-pydantic-core: bump for
 fixes with python 3.12
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The package is not yet available on PyPI, so go fetch it at the source.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-pydantic-core/python-pydantic-core.hash | 2 +-
 package/python-pydantic-core/python-pydantic-core.mk   | 7 +++----
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/python-pydantic-core/python-pydantic-core.hash b/package/python-pydantic-core/python-pydantic-core.hash
index b5d975cb3b..d11b3bfbb4 100644
--- a/package/python-pydantic-core/python-pydantic-core.hash
+++ b/package/python-pydantic-core/python-pydantic-core.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  23f5e10872d9c3d49ebc1fcbd317612eb63d65a7afd88dbef8d23cb63d830cb4  python-pydantic-core-2.14.6-cargo2.tar.gz
+sha256  3359b437ca74c8f7e1b8ec477b1ff1e39f0fff08abb0eb171953f9bc3e8773c6  python-pydantic-core-v2.19.0-git4-cargo2.tar.gz
 # Locally computed sha256 checksums
 sha256  2afdd30d54b4d62b6f488a6bcc1546e84ec5061f13f4209c03d012348783795a  LICENSE
diff --git a/package/python-pydantic-core/python-pydantic-core.mk b/package/python-pydantic-core/python-pydantic-core.mk
index 38128ebe46..79d06deab2 100644
--- a/package/python-pydantic-core/python-pydantic-core.mk
+++ b/package/python-pydantic-core/python-pydantic-core.mk
@@ -4,10 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDANTIC_CORE_VERSION = 2.14.6
-PYTHON_PYDANTIC_CORE_SOURCE_PYPI = pydantic_core-$(PYTHON_PYDANTIC_CORE_VERSION).tar.gz
-PYTHON_PYDANTIC_CORE_SITE_PYPI = https://files.pythonhosted.org/packages/b2/7d/8304d8471cfe4288f95a3065ebda56f9790d087edc356ad5bd83c89e2d79
-PYTHON_PYDANTIC_CORE_SITE = $(PYTHON_PYDANTIC_CORE_SITE_PYPI)/$(PYTHON_PYDANTIC_CORE_SOURCE_PYPI)?buildroot-path=filename
+PYTHON_PYDANTIC_CORE_VERSION = v2.19.0
+PYTHON_PYDANTIC_CORE_SITE = https://github.com/pydantic/pydantic-core
+PYTHON_PYDANTIC_CORE_SITE_METHOD = git
 PYTHON_PYDANTIC_CORE_SETUP_TYPE = maturin
 PYTHON_PYDANTIC_CORE_LICENSE = MIT
 PYTHON_PYDANTIC_CORE_LICENSE_FILES = LICENSE
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
