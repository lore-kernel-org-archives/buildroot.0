Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E11BCEEB573
	for <buildroot@archiver.kernel.org>; Wed, 31 Dec 2025 23:24:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60E5F40697;
	Wed, 31 Dec 2025 23:24:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EvYsD3MMP_06; Wed, 31 Dec 2025 23:24:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3372D40695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767223488;
	bh=zHVxIPWB6eOksdTX2PCmlK/a3jMc25P3c/ohnXcycKE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=Y3QhXDnnOMMxK6NW5GJQa/+HfrLe7p/aBE4W5tXGEeqrcZwVlPvKQ9IAvfuC3N6ww
	 QEwvmujmQbqu31OXSWdRL83bZe6nYLT7X4Klz9Z5UtXEIxeOdlrbGuSfcPMQjbsqTK
	 cSAIuAT+Zv59uNvb836jXMv4XfY0erMcsDw78xXeq38i8gIaYGaqGZKowrnd/zfFM1
	 5D4UfwlRMQf/ZFqm567T3N/sK+rPt/WBr3TbLbM/kiYuWmYuYWtH1TdHshGa7/Aa6V
	 HRU1FouVxOlGUO0lCG3fBzoWswh0qOkxCCUhp7NpCqUhg615xPXkfqo7JErYQzxeQa
	 enqhuPsvB5xuQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3372D40695;
	Wed, 31 Dec 2025 23:24:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7E556218
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 23:24:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 63D9B80CB4
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 23:24:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kCXRpQCiJNUs for <buildroot@buildroot.org>;
 Wed, 31 Dec 2025 23:24:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::236; helo=mail-oi1-x236.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7730380B3F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7730380B3F
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7730380B3F
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 23:24:46 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id
 5614622812f47-4507605e19aso7480316b6e.2
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 15:24:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767223485; x=1767828285;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dbQKGSiqScfFTbh6wNIFmWxKPNteGMBWeXB0Uo66+0Y=;
 b=t9ecrk7HXJIO5wma7QPYz6jj0cMnghgGFXq+ZfBDO6AvxQiaW4EyhEVhuLSkmjRiyi
 3lMxwMIQG+9pJZ/o/xSZ+NNkwMG/VEg0/9EcOZUoEof36lGL0nI4PCUawMGR/RphpW8B
 hA+hTOp2F/rjue25QJCbBDMO+RKbxIAoQDBO967yJTB8Kb7EzKpp03GC6TdkKyQVB0ZW
 7i2PDW1uEqApPptexg7f3oHuwyox0fVfxR3y5B0Yxg1iEXG7F0mlUi0zVgJBYvHRqgmG
 et3y6RBgXWPiIMsJEjXgOqb0z32uzYmCSMnAMGVYnQbXfRhKh8BukPOnEguq2fCWpQef
 yw4A==
X-Gm-Message-State: AOJu0Yymu7PwWhzjxVKYUfy8/LD+uDOSyDVt4uaEa3KmMeLMDJrV5waZ
 kyLvnWbo24Q2N6+YGgP8EN00jqSrVEr6syikXqfDCO+UCvBySeG+hfKpI2phkQE0LYo=
X-Gm-Gg: AY/fxX4jp0kWKwfOPh/t6JT04qWByV5FXfXYbF8TKa9l9v1BOoijNtz3ZMFtQSNMuuQ
 XFNtZNSkePqNs5tRVbLKR0LdUTVHAIziFm+W14onoHPKAu6+1/cGblC4CtZT5f9MvpEhfPu5Le7
 OCRDy+UYSrcdkJfVBQ0Z3oCzBeHpgPs+4mJpL6j7o+zPNCPpZrUyak/yhJl51lP1zCaL9gASfF2
 Jpd0oUoUAARbMaP22sNnZnw/TFIA7SpKOl8BjHMSL40CAipMplmJM5P3yl7LEkHM5j15n25kjFV
 i3ex7nm4nkyNAF/rkHFviz6TpXilTxkNmtPU7NmpVbeLGXziVijbphhHNy7SMt1INzli05XwhoG
 WB8AL60ODolJ4G+f3P+p6H4XnMb0SHA+1jSj0V632Ee9cJ+/iwbk1Osqz7xWFm20Dw4MepBRxKo
 lp5+eNL9z9sXgGRpt1meguBp6AK1vbzGdGCxBKWQPUqhv8wLZpuyZUn1Cp1sVRzTXslh7OZ9NJn
 EogvWfZuKXOAprvAv8aXk656JkUfeZRuhNZeNCUPYt91Z+8dfQaeeo=
X-Google-Smtp-Source: AGHT+IEEdjvFgyt9olHNmFqFo1NJm+X2AEF7eenC8D8e2VhhIuBnu/wxmygKJ/994ThBFSZgH3y+UQ==
X-Received: by 2002:a05:6808:1209:b0:450:bc28:c883 with SMTP id
 5614622812f47-457b21199a9mr18785783b6e.58.1767223485031; 
 Wed, 31 Dec 2025 15:24:45 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-457b3cc0928sm18102077b6e.10.2025.12.31.15.24.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Dec 2025 15:24:44 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 31 Dec 2025 16:24:42 -0700
Message-ID: <20251231232442.756169-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767223485; x=1767828285; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dbQKGSiqScfFTbh6wNIFmWxKPNteGMBWeXB0Uo66+0Y=;
 b=TwJVVP1+ZIkiW9sAFBA7O8TlomJJXUrKUWY86xA+AUhq9Yp4c49PJozO1HyshMNduB
 fOMPbbmrwib7N37qnmVzopSrEA4RncwzUc8WpjXTSSZV6JkhJHccItp2te4P1tgQDAD+
 8Io+VRElYgrxWmwpVSvjx6hdqipvhtW0OJBSWuKRKGL8LZCoHZNYAvcP9a+shS0rMU2D
 7Vh0/ul+P/8+LTuNMdBirxp35bS2Uk9I8qkBZHr7I5gtBszHBuhpo8RDTHPP3AxU9v/C
 03JupD78NIT9qGMwW+BaE+5eZNBilnk8y0fBO2BSnoCTxFsyI6pUzNcvDMn5PhPOqFen
 4prQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=TwJVVP1+
Subject: [Buildroot] [PATCH 1/1] package/python-pbr: bump to version 7.0.3
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
 package/python-pbr/python-pbr.hash | 4 ++--
 package/python-pbr/python-pbr.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pbr/python-pbr.hash b/package/python-pbr/python-pbr.hash
index 58503eaf11..797e4ce94f 100644
--- a/package/python-pbr/python-pbr.hash
+++ b/package/python-pbr/python-pbr.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pbr/json
-md5  64cd498740ec05994ef0592c73c351c5  pbr-7.0.1.tar.gz
-sha256  3ecbcb11d2b8551588ec816b3756b1eb4394186c3b689b17e04850dfc20f7e57  pbr-7.0.1.tar.gz
+md5  5e6b4341677c4d330637add000f59fdc  pbr-7.0.3.tar.gz
+sha256  b46004ec30a5324672683ec848aed9e8fc500b0d261d40a3229c2d2bbfcedc29  pbr-7.0.3.tar.gz
 # Locally computed sha256 checksums
 sha256  5df2a0d87d6c562f0ea11c688ac52532aa28d744cabc7994ff0537f64b3b3320  LICENSE
 sha256  eb4a8c8791f6caab1cf36df26db2b6f4e2ddda52657b060ff7f02abc63910aef  pbr/tests/testpackage/LICENSE.txt
diff --git a/package/python-pbr/python-pbr.mk b/package/python-pbr/python-pbr.mk
index ec530ded04..9b3d34c4e8 100644
--- a/package/python-pbr/python-pbr.mk
+++ b/package/python-pbr/python-pbr.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PBR_VERSION = 7.0.1
+PYTHON_PBR_VERSION = 7.0.3
 PYTHON_PBR_SOURCE = pbr-$(PYTHON_PBR_VERSION).tar.gz
-PYTHON_PBR_SITE = https://files.pythonhosted.org/packages/ad/8d/23253ab92d4731eb34383a69b39568ca63a1685bec1e9946e91a32fc87ad
+PYTHON_PBR_SITE = https://files.pythonhosted.org/packages/5e/ab/1de9a4f730edde1bdbbc2b8d19f8fa326f036b4f18b2f72cfbea7dc53c26
 PYTHON_PBR_SETUP_TYPE = setuptools
 PYTHON_PBR_LICENSE = Apache-2.0 (module), BSD-3-Clause (test package)
 PYTHON_PBR_LICENSE_FILES = LICENSE pbr/tests/testpackage/LICENSE.txt
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
