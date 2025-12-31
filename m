Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B070EE645A
	for <buildroot@archiver.kernel.org>; Wed, 31 Dec 2025 18:42:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56C0E80EE5;
	Wed, 31 Dec 2025 18:42:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dHGmKvl1hX6G; Wed, 31 Dec 2025 18:42:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 750C080F0D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767206549;
	bh=KaKErRRxi3nthX9D3x8iBgWRdJ+H889iD4tIr1ot1oM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=bT2Pzc164EzkdIL+oNvehIuNEIrqQQAOwsCUa9oEBE0MZzbJnZflP+JPr8Q2axiAQ
	 tHMtX6l29xOoKWS4/iJdEMmN+SSKa6DDBUUzFvgo0iyrQ/5dUbez5zTht1vO9N3BGg
	 REFFAa5pPe0iG55pvod5Fmc5i0WGwmidAFAr5eSJFVFaImYajJU7G9NAJZE8dovAw7
	 HLhVg2PZbs1JcLRur1m2mXPrByCwDnqDaL1vSJpUyP/u6629ShkI5kyGuqTbuhoaA0
	 9shfXsd8SsNqJSvKF8OewVE5seybfAKCslXpIi684CAGmqWWAGevJgYlUEwqrfGcrJ
	 Su/5ZXcDbmqxQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 750C080F0D;
	Wed, 31 Dec 2025 18:42:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id CC55FD8
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 18:42:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B331D4069A
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 18:42:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xuxx--O_F-qT for <buildroot@buildroot.org>;
 Wed, 31 Dec 2025 18:42:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::36; helo=mail-oa1-x36.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CE45C40699
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE45C40699
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CE45C40699
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 18:42:26 +0000 (UTC)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-3f551ad50d1so3917887fac.0
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 10:42:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767206545; x=1767811345;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Tq4kqvOFu9J7XgEhd/rZqRl+97q2AoXAeMOXXV1WbpQ=;
 b=Syd1cKF4cj2WxTW3iODOqjSVRgHkO0j+j/jTV+EgzQqClw22THPd0weretqvUWS8Gi
 Xq3Wf3TMg/HG2P8YVBsDiD7KXwoHSfNp2tYQWzwtu9RNGXuj0LWGVdKGBNxRTOx4SAar
 VDmKfZMdCrXD17pak1jfnpV5wNnJbuh5P1Mnr+AtpAxvKk7QmhACOD/Kwzs9mrj+atPd
 yUvKR8Zkj7IvNYTkdshF/dlQcFDV8FWMXn0nXfMQfCbDKJ/UAblIrTzgecPc2HWJtvzf
 wd51o8dXStmf/TNgbFFhitIX6qsBmVmh9Xlygfk1NnVWnGg6w3EQfw1eJAMcvXSrSBY5
 scrA==
X-Gm-Message-State: AOJu0YyS8FfCZOMVU0mdoTs90L2MAUjOUS6h3RWbW3u51UCksqgL8Gzh
 4VAFxy2koUSSfrBuyFmkGnMSTHnNHwBWbq/NCFTKef4a/tbBxlxipX/P88MC1dIwKkc=
X-Gm-Gg: AY/fxX4a7f9+562T+G70AUzlPqkJAWeheRT+5SomPr9DUzfTF5S3+SA9l8T+ZgvrnsW
 HY+P7+YD88rZsBV2xQyunYfda6g280CGtIl2bxuWGHS3A1H1YRfgVwaF2HAT6kT+gbFfRKhToS5
 Ek+420YXrXST7T7CligfJDrpU/TqHNtTQjINvH1Ob3VSvrWE3IErQrIVPKx0YQBvnXPfcDrOc76
 +l8emljo5i2ZfrFl2AVkp4deMb7pZtcZKjLlwzOePO0cWBvxmf4EGa5fwVlnOIZP47kFpDJzVRH
 nbmi69VIn9gf9j8p/p2w7jxaQgmqesTGdI67dIfNwSPdIyNBUNjp6CLVx6jcFt2/2EstUYvxbs3
 f6+9cENvNBnD1KNkFE9Aer+IY3Ii5iskhFV4X0aa/SFNJf2IqbyoWHbFZ5l2GIntxJw0c5lT4NC
 FuLJa4VrlMw6UEP6gnVeGZXFQiIusaRZRXWVnWn5N5mAz5UjteT6M8zRigSgTmoMX8vbxlslC9p
 r0KYsS0LaYlU/SiYRy8+GuPccAotz8jUVwjsSQHXofbHxmpOhZPp5g=
X-Google-Smtp-Source: AGHT+IHKpWHe3GWGI3D8HH6L77nviUzY65dlw8j+kerDvWiNK1bdoN+oDD3ZSMThkxt6zyR9q8/+6Q==
X-Received: by 2002:a05:6820:8319:b0:659:9a49:8e82 with SMTP id
 006d021491bc7-65d0eb53f84mr9825821eaf.82.1767206545193; 
 Wed, 31 Dec 2025 10:42:25 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-65d0f69b9e9sm22075285eaf.12.2025.12.31.10.42.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Dec 2025 10:42:24 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 31 Dec 2025 11:42:22 -0700
Message-ID: <20251231184222.3941176-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767206545; x=1767811345; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Tq4kqvOFu9J7XgEhd/rZqRl+97q2AoXAeMOXXV1WbpQ=;
 b=MafPlJXDJo89kTcOiPq2bjUQfosPGoXrbtVDBMadSvcq1AMqr7JBbOz06B28YHM4Qj
 7PIHWer/dF6IjhLQOIfrOd5D8D4A9n/d3PHXwsQl8NwZbPYoc4xOF7S7uCHW3RMdbMHJ
 Ub2UXJ4KN/a4abHrPabK648RIEaQ+L+fPT1CIG4f7NLWSrAQ+dC8P9brLwtqDuHa86d8
 RgFmv1RSDJGguJotnMONEJ0rCt2r0AmaxUik67jSqChL+BQAtZ9wxSDkA4nnrnodZ8AM
 IrKpGSycaSbqzdhkYz4ISVbhKnVTomxfCzIHcFAFKWIvxBWlZcPApVsim09JU7JzcPmu
 suyA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=MafPlJXD
Subject: [Buildroot] [PATCH 1/1] package/python-types-setuptools: bump to
 version 80.9.0.20251223
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
 package/python-types-setuptools/python-types-setuptools.hash | 4 ++--
 package/python-types-setuptools/python-types-setuptools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-types-setuptools/python-types-setuptools.hash b/package/python-types-setuptools/python-types-setuptools.hash
index 45b229ece6..8283b8ec10 100644
--- a/package/python-types-setuptools/python-types-setuptools.hash
+++ b/package/python-types-setuptools/python-types-setuptools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/types-setuptools/json
-md5  c9a6190884fc8a12c93963333f205f72  types_setuptools-80.9.0.20250822.tar.gz
-sha256  070ea7716968ec67a84c7f7768d9952ff24d28b65b6594797a464f1b3066f965  types_setuptools-80.9.0.20250822.tar.gz
+md5  64117c464d8fbeca5851c08a5c22fd56  types_setuptools-80.9.0.20251223.tar.gz
+sha256  d3411059ae2f5f03985217d86ac6084efea2c9e9cacd5f0869ef950f308169b2  types_setuptools-80.9.0.20251223.tar.gz
 # Locally computed sha256 checksums
 sha256  295f8538c94ae5c3043301cf7cff1c852dab6a786a8ddee471e061b40d5ecabe  LICENSE
diff --git a/package/python-types-setuptools/python-types-setuptools.mk b/package/python-types-setuptools/python-types-setuptools.mk
index 463cc3b6b5..4ad09791d6 100644
--- a/package/python-types-setuptools/python-types-setuptools.mk
+++ b/package/python-types-setuptools/python-types-setuptools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TYPES_SETUPTOOLS_VERSION = 80.9.0.20250822
+PYTHON_TYPES_SETUPTOOLS_VERSION = 80.9.0.20251223
 PYTHON_TYPES_SETUPTOOLS_SOURCE = types_setuptools-$(PYTHON_TYPES_SETUPTOOLS_VERSION).tar.gz
-PYTHON_TYPES_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/19/bd/1e5f949b7cb740c9f0feaac430e301b8f1c5f11a81e26324299ea671a237
+PYTHON_TYPES_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/00/07/d1b605230730990de20477150191d6dccf6aecc037da94c9960a5d563bc8
 PYTHON_TYPES_SETUPTOOLS_SETUP_TYPE = setuptools
 PYTHON_TYPES_SETUPTOOLS_LICENSE = Apache-2.0
 PYTHON_TYPES_SETUPTOOLS_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
