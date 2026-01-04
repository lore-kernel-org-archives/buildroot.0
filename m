Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46F46C2A06C
	for <buildroot@archiver.kernel.org>; Sun,  4 Jan 2026 17:47:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0530640317;
	Sun,  4 Jan 2026 17:47:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9gyUdODJT8aL; Sun,  4 Jan 2026 17:47:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B5404032B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767548836;
	bh=vd+58C99GBuJ+F2B138mjnD5T5CxrQlxbBYkXubpDao=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=FesTUiijH8BJRHiu3joAefgwDFTQQjcFhIogC7tNjO+Io8pgRvAl0Dr+afd/FA6ww
	 DGR2NjsW+dYk0FESv/PITviuhgMq+RrETY0eBe0j4I93nGvgBl5jauxIjsXfxySDAk
	 kLYToFf9XGYjAeo8Tf/AJpaGMSm6Y25FnsGlkSnOQD1QgGJrJYdEmoEjZc3cJgKale
	 ukuxRlvQhAI5IEx/Jfyk6DWiSQHBCo7evy4Vz4dAOl6AXgYBSC065M/KwwBAxVQAGB
	 m3uf7SCN+13qma+eBXcUvewpNVwu2R58bJuqge+yztbGyPQwcKTnlxnN5Z2EZ7igqJ
	 C2ujP2XicG2rQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B5404032B;
	Sun,  4 Jan 2026 17:47:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 713BBE7
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 17:47:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 583B040317
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 17:47:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t01mpDr4CVsm for <buildroot@buildroot.org>;
 Sun,  4 Jan 2026 17:47:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::332; helo=mail-ot1-x332.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 466F5402F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 466F5402F8
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 466F5402F8
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 17:47:13 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 46e09a7af769-7c75b829eb6so8559531a34.1
 for <buildroot@buildroot.org>; Sun, 04 Jan 2026 09:47:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767548832; x=1768153632;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=C6lYCIzAi5OYqghKI1iOY6r67YgQASkZzQNY8LfGoZE=;
 b=NnPyMfKeeUFo0Y5pqjAsXS+WFYu6ZbqzM2H/3sNE41sDII/by/UluVP9gGJOX8kWci
 bYRde63p2iIglh4G9jsrz5jvvNDAjNKZGoGmCIuZ475S3aPYXZ/gsjLlRp27LwK5lL6u
 0/pThWzsNwAPWVRC+oB1Xh3SBmkkodx0sbcfcT+rsD3ZsKFU1tZW2u74OCYutsdJBpnH
 xTnMy9I53A3EMw377v0Cweyle3psG9/gultWvLphUyCTXSFCfWe86K1w6SOtG80DIs6T
 q95I97hvTwcbqEtJ6i1SCnk0ppjwOkz9r+1vxeclv4wci+wdoIgY8Rn0FRIBJHhlF3O7
 /64Q==
X-Gm-Message-State: AOJu0Ywd5C6ZkLnvCEtm9+mj6fj6IvTS9tucPUkD7iugWx69FfRLBQbw
 NTLDz3tARwpCdtrB+YymLjgG1jV2O8uWVxmDvaDfois3WzA5QFIfxEcgaY3RxXiuvUmRHw==
X-Gm-Gg: AY/fxX7SecbQpQCynW7lmDmLVwsFEHklL0dxo6AR5fDVjNB6DhJglg5+1pzfG3o46Lv
 zs0oIAmOeGCo0JW7rMraVrggUi1fCfHLqDaRWSQiHLit9xWniJD5rqp99ntwP17qZe/870aZETM
 GAAnO8nhpXvzY4JLqXTeJllHRQx7vkGcg/xN9dkuZc9fb3ZWQ1MYaUUCxR2jtwo4c6g5hrSvZmM
 n7Qp2TKbD9l2yOaT1jIgRHLPdHY8/HUkxmuzq0JnsSVULPTs9VjXzvzgmThXoIBgOoaB8IgM5O5
 encajMY6qlJFGiTuh8/0j4Wzmq4v20SSU80c4yZKO257Q6BgU4q2jvQ58rDI0TDIHVBZr+caCD5
 RgmRDS/b3oL0aehQcttJtQ8qY78CsGRlx2AlBMKw1zl5kSX4uWOsqhJjST71NoH/Mkrzt6LsheD
 bTEvrksWEi63DXlM8WDZZJbSI5MOplU7hkeze95eRVZpu+W+4Zv+iCVpn7gDvNOPkVFnR9HNYT4
 sdi9WjGnodMK53b4oTskr1keyTjhDfQkKAWjPcTL7QXAcuryP20KjU=
X-Google-Smtp-Source: AGHT+IHvtzU5SZelBGytfAqDzTJ8MYgtE/wJZ90rIrtjfjm0iUhHrWJY1SgbfoWGt43uOj8iDdfF1A==
X-Received: by 2002:a05:6830:6586:b0:7c6:8bfe:f5e with SMTP id
 46e09a7af769-7cc66a18443mr27239411a34.32.1767548831975; 
 Sun, 04 Jan 2026 09:47:11 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7cc6673bdb6sm32090486a34.11.2026.01.04.09.47.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jan 2026 09:47:11 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  4 Jan 2026 10:47:07 -0700
Message-ID: <20260104174707.3909632-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260104174707.3909632-1-james.hilliard1@gmail.com>
References: <20260104174707.3909632-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767548832; x=1768153632; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C6lYCIzAi5OYqghKI1iOY6r67YgQASkZzQNY8LfGoZE=;
 b=JrNZSDRUtQPVvRXOlhSwdaHscItuCdhflrY3lVnoB3zP6nVr/LD2KtBfvco0OlNJO4
 7blz+cqs5/4OFq+UHROI2FStAdVGDOZHdas4U+OFBzrvMIelbfzgMV7W+W+i4lg0q7V0
 WhjPX4ScKRUF87scrHU/WETMpNgikc1Oy5o9aB5SyVCtOK/TASdMn7o9qyGWT00RcPoO
 hes4zNXoRxe9or45IfJg00hfMKaOwddAUGhyVdGgeL8BOXPcG39IOv1Vk4+vnTjZr1ac
 jN1G7es/P0jodTvoyxBwYo8O+YhitKUjFAXvOo2+yaq7Gs4G39uXMm+Iyw7CMEX97UfC
 GxHA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=JrNZSDRU
Subject: [Buildroot] [PATCH v2 3/3] package/python-mypy: bump to version
 1.19.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License hash changed due to addition of base64 license which
is BSD-2-Clause:
https://github.com/python/mypy/commit/8f922b3d879f31e4c52c1c643de70e27b5720654

Add new python-librt build/runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-mypy/Config.in        | 1 +
 package/python-mypy/python-mypy.hash | 6 +++---
 package/python-mypy/python-mypy.mk   | 8 +++++---
 3 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/package/python-mypy/Config.in b/package/python-mypy/Config.in
index 6c58bc4fc1..2ac5bd7c76 100644
--- a/package/python-mypy/Config.in
+++ b/package/python-mypy/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_MYPY
 	bool "python-mypy"
+	select BR2_PACKAGE_PYTHON_LIBRT # runtime
 	select BR2_PACKAGE_PYTHON_MYPY_EXTENSIONS # runtime
 	select BR2_PACKAGE_PYTHON_PATHSPEC # runtime
 	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
diff --git a/package/python-mypy/python-mypy.hash b/package/python-mypy/python-mypy.hash
index 9f1656ddce..a31cb5dba6 100644
--- a/package/python-mypy/python-mypy.hash
+++ b/package/python-mypy/python-mypy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/mypy/json
-md5  9ea329f0a99bb98554683680b988c5ea  mypy-1.18.2.tar.gz
-sha256  06a398102a5f203d7477b2923dda3634c36727fa5c237d8f859ef90c42a9924b  mypy-1.18.2.tar.gz
+md5  a23b930a86aa298a97b72da06ee84084  mypy-1.19.1.tar.gz
+sha256  19d88bb05303fe63f71dd2c6270daca27cb9401c4ca8255fe50d1d920e0eb9ba  mypy-1.19.1.tar.gz
 # Locally computed sha256 checksums
-sha256  de341f6e031d021aab9eb27bdf713cc6fb844dee832ef3bcd4688bff5517220b  LICENSE
+sha256  fdf1cd17f50e1305ed8cfd37467312d27a984648dba622cef70573b5512e4e1b  LICENSE
diff --git a/package/python-mypy/python-mypy.mk b/package/python-mypy/python-mypy.mk
index ba07ef5b9c..4b02753978 100644
--- a/package/python-mypy/python-mypy.mk
+++ b/package/python-mypy/python-mypy.mk
@@ -4,19 +4,21 @@
 #
 ################################################################################
 
-PYTHON_MYPY_VERSION = 1.18.2
+PYTHON_MYPY_VERSION = 1.19.1
 PYTHON_MYPY_SOURCE = mypy-$(PYTHON_MYPY_VERSION).tar.gz
-PYTHON_MYPY_SITE = https://files.pythonhosted.org/packages/c0/77/8f0d0001ffad290cef2f7f216f96c814866248a0b92a722365ed54648e7e
+PYTHON_MYPY_SITE = https://files.pythonhosted.org/packages/f5/db/4efed9504bc01309ab9c2da7e352cc223569f05478012b5d9ece38fd44d2
 PYTHON_MYPY_SETUP_TYPE = setuptools
-PYTHON_MYPY_LICENSE = Apache-2.0, Python-2.0.1
+PYTHON_MYPY_LICENSE = Apache-2.0, BSD-2-Clause, Python-2.0.1
 PYTHON_MYPY_LICENSE_FILES = LICENSE
 PYTHON_MYPY_DEPENDENCIES = \
+	host-python-librt \
 	host-python-mypy-extensions \
 	host-python-pathspec \
 	host-python-types-psutil \
 	host-python-types-setuptools \
 	host-python-typing-extensions
 HOST_PYTHON_MYPY_DEPENDENCIES = \
+	host-python-librt \
 	host-python-mypy-extensions \
 	host-python-pathspec \
 	host-python-types-psutil \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
