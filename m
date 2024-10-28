Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F11B5D1358B
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 01:14:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3B94605B0;
	Mon, 28 Oct 2024 01:14:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R2J6U2SgsP_g; Mon, 28 Oct 2024 01:14:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A823760768
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A823760768;
	Mon, 28 Oct 2024 01:14:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id F31111DAA
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 01:14:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CD4CE60768
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 01:14:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yv_tbhZ_iO7U for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 01:14:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12e; helo=mail-il1-x12e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E6831605B0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E6831605B0
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E6831605B0
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 01:14:28 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id
 e9e14a558f8ab-3a4e58e3f9bso8794685ab.1
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:14:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730078068; x=1730682868;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nE0CLf/RdhwiOr3xO9V2zqqF9ZHrCW64WezNMNbhEAo=;
 b=D/7H327IC4PNvXOWh3V6zJolck3srciJGp51QwwPuAUHcaSUP8dEjZJ779t7Y/6q4j
 f0EPxxIPK1BGzixcBJWHqHg3Hx5n1cXMrTIQBU+YtlIzPvH3tzTPsVnBg/xDNcA50a4m
 Vo5u0xv3npOvJWiQetrYuQvb8UUQcHOO+O1PDPJQwj6L/mEb5Vcybf58RH263D4BJvN4
 nY/vbmxk4WnfEZlW5jmP7XOC3pfjuSOoPqsai0c1vHBkKAB6OVqUmhRZKMiE0E9u5/Se
 jz1rqMZusYlkcecQ0EcHigcBqjuZbsH9fnjKH+T/hURXlINK8IeZkOE/qdC2PcaYOUSX
 4USQ==
X-Gm-Message-State: AOJu0Yxd+YEdiDAtxAdplidgC8G1EVYSyuJNPqw3njWayXYkczVc2PeB
 6KatCDhCarwpQbirWmUZPURUwBGUjlBVro2fsJrRK+j+NT8IDlWrnSD4Rg==
X-Google-Smtp-Source: AGHT+IFi9sQS6wQMKCFCEcAJUx71soBlzcCnclvEU2VIXxZ1zAg7/Z74MOPMohTEZPSHZGUpCsohDg==
X-Received: by 2002:a05:6e02:1a0a:b0:3a4:eca2:960b with SMTP id
 e9e14a558f8ab-3a4ed29d9f1mr54367925ab.9.1730078067675; 
 Sun, 27 Oct 2024 18:14:27 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a4e6dcff76sm14028225ab.10.2024.10.27.18.14.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Oct 2024 18:14:27 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 27 Oct 2024 19:14:25 -0600
Message-Id: <20241028011425.4130818-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730078068; x=1730682868; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nE0CLf/RdhwiOr3xO9V2zqqF9ZHrCW64WezNMNbhEAo=;
 b=U4AuxLgTANm2Zwyos5+pKozS/9g33admDjmwMTfeKo5YIYncP3brn1W8W1cRDlah+Y
 Sew01OAooYuSO2QXZI+7PsUk1WsIOGfvyLJ4Ii3jcObCI1d1IBfhsSRlMss8wOS0/76M
 +nVA8Kw4oW3vfpoPkZokZkuzwa3FFCNz3mkCkw5FqjHiTuoPcaMtv35RDjW1nhwGx9su
 p4iiDCcEM6tYgHAJ7bROhRGJ94KndZJNjrERkpLPAHEFPN1MIfrMQRhdFbcLp9DMBO/f
 34i1IlW/vX/gp2EAn1alPW6Q5uJYiPrC6aOvKNCL+IofS48HlLvavGqJ7zcTCAIUAxIf
 47Gw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=U4AuxLgT
Subject: [Buildroot] [PATCH 1/1] package/python-xmltodict: bump to version
 0.14.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-xmltodict/python-xmltodict.hash | 4 ++--
 package/python-xmltodict/python-xmltodict.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-xmltodict/python-xmltodict.hash b/package/python-xmltodict/python-xmltodict.hash
index 712f94a08b..9bd8ec6878 100644
--- a/package/python-xmltodict/python-xmltodict.hash
+++ b/package/python-xmltodict/python-xmltodict.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/xmltodict/json
-md5  9b98d656bb655aa7c7561a2ab811c83f  xmltodict-0.14.1.tar.gz
-sha256  338c8431e4fc554517651972d62f06958718f6262b04316917008e8fd677a6b0  xmltodict-0.14.1.tar.gz
+md5  6e0d94bf858b3c2ff3daeed487eedc2a  xmltodict-0.14.2.tar.gz
+sha256  201e7c28bb210e374999d1dde6382923ab0ed1a8a5faeece48ab525b7810a553  xmltodict-0.14.2.tar.gz
 # Locally computed sha256 checksums
 sha256  d66d5eb8f83a0ba21d3dd04318b8817588e8764daabea852d1035e3f07ffda55  LICENSE
diff --git a/package/python-xmltodict/python-xmltodict.mk b/package/python-xmltodict/python-xmltodict.mk
index b151f28823..1a041e05d4 100644
--- a/package/python-xmltodict/python-xmltodict.mk
+++ b/package/python-xmltodict/python-xmltodict.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_XMLTODICT_VERSION = 0.14.1
+PYTHON_XMLTODICT_VERSION = 0.14.2
 PYTHON_XMLTODICT_SOURCE = xmltodict-$(PYTHON_XMLTODICT_VERSION).tar.gz
-PYTHON_XMLTODICT_SITE = https://files.pythonhosted.org/packages/98/f7/d29b8cdc9d8d075673be0f800013c1161e2fd4234546a140855a1bcc9eb4
+PYTHON_XMLTODICT_SITE = https://files.pythonhosted.org/packages/50/05/51dcca9a9bf5e1bce52582683ce50980bcadbc4fa5143b9f2b19ab99958f
 PYTHON_XMLTODICT_SETUP_TYPE = setuptools
 PYTHON_XMLTODICT_LICENSE = MIT
 PYTHON_XMLTODICT_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
