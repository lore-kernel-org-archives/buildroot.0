Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B46F5D0BB5B
	for <buildroot@archiver.kernel.org>; Thu, 24 Oct 2024 04:31:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 407D36086C;
	Thu, 24 Oct 2024 04:31:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qt1UM9_cw2jA; Thu, 24 Oct 2024 04:31:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F2B1608A7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F2B1608A7;
	Thu, 24 Oct 2024 04:31:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 93140972
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 04:31:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5F036400C4
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 04:31:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 38v3KR3G6Pk1 for <buildroot@buildroot.org>;
 Thu, 24 Oct 2024 04:31:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2d; helo=mail-io1-xd2d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 36AC5400CF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36AC5400CF
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 36AC5400CF
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 04:31:29 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id
 ca18e2360f4ac-83aac75fcceso18722639f.0
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 21:31:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729744288; x=1730349088;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6hFBowmt5RAEvxKgkPpDK8fan4c9uM2cPuR88coFdAI=;
 b=LY1CaW/Gq3CBrMpCga+U2mKeWD5CgKnN9xq/k7cgJeRTjcN8tkLRCplDlYmM399bv3
 MeA83+2TqOgPhnMcTejNdQD33OkwXQvfGJfNDqSnXSWzjN/6MuJwzDf8QuxzDM/oga4+
 oNRAZq+C+yZY9WmIXy51StCzatEJS/yguOh2PNUrWVIf3fZe8R4sN7dmFs1iCOZc5L3G
 5WBNDixBE8mBUhTFfrau2+w2r4CkD2BEOY5XOA7+84Naua5w9iw2gl0+HbAP2QMKc5oq
 eh6ak3P4DGAaDTVoJ0ZRdGoViofGCspCq0LZ5UrPistbPsDoF0UP3MIHTUiQz2dxM4wh
 iIGw==
X-Gm-Message-State: AOJu0YxMVL1Lqtc4F74PKPgyHJ3uTtqNSG+PuTkBVWbM301ylCF12+7x
 1HBpUOa086kPMvTTfEJkRH+gjzGn1brqI0YkQsxb5Yg+hGRrHjGA4VHGeA==
X-Google-Smtp-Source: AGHT+IE1Xvg7c77Vs/QB5iFf0odIKH6+fuBrA1Y9NGvx+MZ4jkdbXa0J2hynMmxrGMykmyVsIw/hXQ==
X-Received: by 2002:a05:6602:6b83:b0:837:7f1a:40af with SMTP id
 ca18e2360f4ac-83af63f7c5cmr478166939f.14.1729744287648; 
 Wed, 23 Oct 2024 21:31:27 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-83ad1df005esm264593439f.45.2024.10.23.21.31.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 21:31:27 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 23 Oct 2024 22:31:25 -0600
Message-Id: <20241024043125.3362939-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729744288; x=1730349088; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6hFBowmt5RAEvxKgkPpDK8fan4c9uM2cPuR88coFdAI=;
 b=SSLaebs5cBtkgMruThq+iWqt0Gnoe4n/wOQBMZxMIRqYX7OQ5nB2YKB67N2pDcaK86
 bRzY7baBiHKBW5aZ95VMRFusjyiktSVCFD/kVd30LGvp1sBQKuF61QxAK05b0rm0KqY4
 to11/7oz+EL7YjKxszk8kmx+Q/O5eDVLhwNbr/3A0QTRO7qVQYjOSrLbx8CAWscAVkM8
 aeVqAcquvjGeFJxe1ex8iXFyrlGVyZ4OowxAxycir4VSSk6RBtHlblEmEOjw3eR8BhWt
 X/lbG7KllfA7egiCoK1mOq3r3z8HTDoYL/vrwWbZ0m+tDZ7zGfg05FKqgBGsq7WfO34G
 M0dA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=SSLaebs5
Subject: [Buildroot] [PATCH 1/1] package/python-aiofiles: use hatch setup
 type
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
Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Use the new hatch setup type which automatically pulls in the
host-python-hatchling dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-aiofiles/python-aiofiles.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/python-aiofiles/python-aiofiles.mk b/package/python-aiofiles/python-aiofiles.mk
index 9eae73d3c1..79e4a2cacd 100644
--- a/package/python-aiofiles/python-aiofiles.mk
+++ b/package/python-aiofiles/python-aiofiles.mk
@@ -7,9 +7,8 @@
 PYTHON_AIOFILES_VERSION = 24.1.0
 PYTHON_AIOFILES_SOURCE = aiofiles-$(PYTHON_AIOFILES_VERSION).tar.gz
 PYTHON_AIOFILES_SITE = https://files.pythonhosted.org/packages/0b/03/a88171e277e8caa88a4c77808c20ebb04ba74cc4681bf1e9416c862de237
-PYTHON_AIOFILES_SETUP_TYPE = pep517
+PYTHON_AIOFILES_SETUP_TYPE = hatch
 PYTHON_AIOFILES_LICENSE = Apache-2.0
 PYTHON_AIOFILES_LICENSE_FILES = LICENSE
-PYTHON_AIOFILES_DEPENDENCIES = host-python-hatchling
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
