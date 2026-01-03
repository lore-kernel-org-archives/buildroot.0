Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEC0AFC6182
	for <buildroot@archiver.kernel.org>; Sat,  3 Jan 2026 19:47:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7967F405F0;
	Sat,  3 Jan 2026 19:47:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xY5R-xc47yFS; Sat,  3 Jan 2026 19:47:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50F1F4057D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767469633;
	bh=69U5mDxh8I4lvZt51WlxaOoUOfbTuJB2DUoJQyXEktM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=pWZ+uvKG1dI9oIO3w3MkXPsYY8iA/7viV6QBL/6iNk/VtCoYDN14Kjope5AMxzi7r
	 xH0M0iqCrGLtrxJUCJJ3tAh9hUHnZwd6/75ra1jP2ubmuhg/w0LMpJGegYVVlhJGrP
	 ZXcfa8iZo/DvmlgTveb8ixLC11x/sCfOPIYUm6kXIQA3IwDY8QvWFO0i8VJ4WQr09m
	 VCqxcE4njs9DxXya+tXlNM/2gbBtG3D0gVxkAbX4o1T0dFArje88Y0puGn6hImbeL5
	 GqWdN6nkfutBBjva31EYXX9PijeXrt+2Yf0d5L5rxrg3OHQNQs1HbJEdS4nJlOsPzc
	 I1O4yiN9y4CTw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50F1F4057D;
	Sat,  3 Jan 2026 19:47:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 794AA351
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 19:47:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F02440167
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 19:47:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RlnkC0q8UhDy for <buildroot@buildroot.org>;
 Sat,  3 Jan 2026 19:47:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32e; helo=mail-ot1-x32e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6CF2E40098
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6CF2E40098
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6CF2E40098
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 19:47:11 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 46e09a7af769-7c701097a75so7276699a34.3
 for <buildroot@buildroot.org>; Sat, 03 Jan 2026 11:47:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767469630; x=1768074430;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gH1PyFO0k+bz4tXKBDpkCBTIiBjc/e/P26ypYKniBRo=;
 b=jNQdjHWkUmsP4a0b3rs5USl00wT7KD21sAebXncts2OshyBfHiDEhYeB5GaRkKCTTB
 I0/FZmZxGkd9d8h8PtD5gA4CyJEzooTetq94tUhMaDcTXqhKILil9hQAk11ZWecrspPR
 r4doc3JjyfSg5oq5XCgKwRqXydF36EJlUi4YtfqI4ocPb9fiwRPk86CYr9na6xfI4Tt1
 tMURmUtYOz3Bk39Cx7GFVV0m8TOlaB5D9w1WatJd6VTT4hYl2CGzRfsyD4Q2uTIGOowl
 04vnaYCGo8GMIDbKooJoToFGvsXRkQMAJtMUV1N8dbbWSwqXDLvjxSqQAxlQYtjuX0ed
 dPeQ==
X-Gm-Message-State: AOJu0YzAlEZY0akypWI7KLgIV8sL8E2izaxzbgHfEnMiqXFnJbUijy7I
 L4pskVcAbcXHcXD0t4Sv7R3dYJ20TUTmo6B7F4klm2TE+wPOVZGh6QQHGo35HOQk
X-Gm-Gg: AY/fxX5kYEelDz/v+BSjUlG6dSG8RxoFma1sMzB+NPnKhgh7Ilcj+rDimqSsifAVWGR
 7u6jVbQ1fN/44/9FgQinm/s0ihOhYpXFUXVqYuqlUn8Zib1dy9o99JJ6069UyoaIsJot0Rpm4F8
 oZnJitj9b9dF9C51nwj/hoO74RQnVan/EJLpw8qtsZT9c710dT5RC0j3k2h29J+0XD3TnVeViSA
 SagwYtDmMK2+S/78no7ZWBKCgHYuzgn5CAg2Bd4Q9prPh1pTd6SWLxxDOZHRfFnfObfSPJmaMJF
 3DwoZSP8vMPXLjt9LRoNYNJxNCkMQgw6jAa8jr+vkApmWd/H5MzH5s4FzE/Q+JBIKRrYf846fP0
 9dBDLAU0vu/Va2IS+PSUr4Nf+YoBuPPBhS5dyO+hA32s8JSM66fW8AUpujZC5KamDXvHfnS1UiP
 qa84Aa5M63c8TPODahGr+W5cv6SRUUKkX3fZbLpqIDz3M4iDJ8RYokgXoHgbPSiGD5UlOCe4/XO
 MUnF+jjHH7DcoywmJQW0nqXo3hQXOPm6bQGA7w4flzEdNdss3Y8I/0=
X-Google-Smtp-Source: AGHT+IHLzHBOneMd85XiwVqx8Ik1m8bHtpuawyEXzsTjvq7R89tTj868AyzArULB321es4/psF42PA==
X-Received: by 2002:a05:6830:268f:b0:748:8b42:77ab with SMTP id
 46e09a7af769-7cc6680b8c9mr22890194a34.0.1767469630012; 
 Sat, 03 Jan 2026 11:47:10 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7cc667d6b04sm30699734a34.16.2026.01.03.11.47.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Jan 2026 11:47:09 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Jan 2026 12:47:05 -0700
Message-ID: <20260103194705.2273905-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767469630; x=1768074430; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gH1PyFO0k+bz4tXKBDpkCBTIiBjc/e/P26ypYKniBRo=;
 b=d4VJ1iTVbHajukHGiES/B8ceMQD99e0xgUDKgGdzf5uaCeGV+BBpkvMKAYBw5dfYre
 W4N/Cs2OyQPVRxyK+qaf0XfP403zTG01J950ZLszsV5zHNZZJiRrWvHK/Ul83CffOuL2
 jG/3UbYX8BrunvCl0qqP50n6ReGSBvipG+LaDiaKv01nso3JdjO6kllqNcniV/sVC+oM
 LQdp3eBKP2SKRzagtymEUk3obW3orYL9weYHl2IIzkZAlmmuh25vqpO4cOos63exF0dA
 0RUfPWa9c17jXTEiSFl5QOJVTqWEhVkE7Rg8iQlev/hdkvKL6naxwF6U6DHTAVEOnL4M
 4sLA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=d4VJ1iTV
Subject: [Buildroot] [PATCH 1/1] package/python-markdown-it-py: bump to
 version 4.0.0
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
 Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-markdown-it-py/python-markdown-it-py.hash | 4 ++--
 package/python-markdown-it-py/python-markdown-it-py.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-markdown-it-py/python-markdown-it-py.hash b/package/python-markdown-it-py/python-markdown-it-py.hash
index bc28feea7d..c1c6881ee1 100644
--- a/package/python-markdown-it-py/python-markdown-it-py.hash
+++ b/package/python-markdown-it-py/python-markdown-it-py.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/markdown-it-py/json
-md5  a00d59ed2704f6590fdde0e9bad04c7c  markdown-it-py-3.0.0.tar.gz
-sha256  e3f60a94fa066dc52ec76661e37c851cb232d92f9886b15cb560aaada2df8feb  markdown-it-py-3.0.0.tar.gz
+md5  175fe39a7fbec21878606db1947bc9ea  markdown_it_py-4.0.0.tar.gz
+sha256  cb0a2b4aa34f932c007117b194e945bd74e0ec24133ceb5bac59009cda1cb9f3  markdown_it_py-4.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4a2260d6e2cd0f5a151a1e86dbfe7d3ed552b1e2beabf9941c1ba5c49cbce484  LICENSE
 sha256  792c48c5a849a15fdf9e37e8bcf9e6d1dd13b32b46c642a748a0a46a9919d473  LICENSE.markdown-it
diff --git a/package/python-markdown-it-py/python-markdown-it-py.mk b/package/python-markdown-it-py/python-markdown-it-py.mk
index aac0845185..0b2666cc03 100644
--- a/package/python-markdown-it-py/python-markdown-it-py.mk
+++ b/package/python-markdown-it-py/python-markdown-it-py.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MARKDOWN_IT_PY_VERSION = 3.0.0
-PYTHON_MARKDOWN_IT_PY_SOURCE = markdown-it-py-$(PYTHON_MARKDOWN_IT_PY_VERSION).tar.gz
-PYTHON_MARKDOWN_IT_PY_SITE = https://files.pythonhosted.org/packages/38/71/3b932df36c1a044d397a1f92d1cf91ee0a503d91e470cbd670aa66b07ed0
+PYTHON_MARKDOWN_IT_PY_VERSION = 4.0.0
+PYTHON_MARKDOWN_IT_PY_SOURCE = markdown_it_py-$(PYTHON_MARKDOWN_IT_PY_VERSION).tar.gz
+PYTHON_MARKDOWN_IT_PY_SITE = https://files.pythonhosted.org/packages/5b/f5/4ec618ed16cc4f8fb3b701563655a69816155e79e24a17b651541804721d
 PYTHON_MARKDOWN_IT_PY_SETUP_TYPE = flit
 PYTHON_MARKDOWN_IT_PY_LICENSE = MIT
 PYTHON_MARKDOWN_IT_PY_LICENSE_FILES = LICENSE LICENSE.markdown-it
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
