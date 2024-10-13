Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A792FCF258E
	for <buildroot@archiver.kernel.org>; Sun, 13 Oct 2024 20:21:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52288400B4;
	Sun, 13 Oct 2024 20:21:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ag1yiKkknobO; Sun, 13 Oct 2024 20:21:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0888F40102
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0888F40102;
	Sun, 13 Oct 2024 20:21:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 679FD1BF3EF
 for <buildroot@lists.busybox.net>; Sun, 13 Oct 2024 20:21:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 62C3860656
 for <buildroot@lists.busybox.net>; Sun, 13 Oct 2024 20:21:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oDQh0apSZ7Ix for <buildroot@lists.busybox.net>;
 Sun, 13 Oct 2024 20:21:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d29; helo=mail-io1-xd29.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5C7A76062C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C7A76062C
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5C7A76062C
 for <buildroot@buildroot.org>; Sun, 13 Oct 2024 20:21:20 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id
 ca18e2360f4ac-836d2437852so129203639f.1
 for <buildroot@buildroot.org>; Sun, 13 Oct 2024 13:21:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728850880; x=1729455680;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1eVDGF6DGMbMh1yFd+I0bLrsj0Kz4wL2VXblXldo9tU=;
 b=YEWfkJ7SlNASsdYlaymFo9L7N4+dJELDG/4ntCdO3JMWnbxeY4y69wSUSVA/lK4jC3
 HBscvXu9qosSaq58E/BavFTkerbdsgKXbC4EoNOCcr5al2EtsBMvLH5SwL72AfENciBG
 NykUDVT0ismGNb40riOQ8SoQSejpO9h6ZiMFwGTvFzcCIQHBVHRn/hhfXIeZVLKTwiOj
 JrXIDmiW1jwHugbduYlLfjxYzLEXkXwt3bqTtUEssbvMkJ1gXeA0ij3n9dCYKChZ1VJW
 hrwUHZmHTnjE2K7vRG1ALjjBd29CRY4uNGoGk2pC8xWs7RQ0B0bmvSkhJTTSemZqn/Fg
 GNHA==
X-Gm-Message-State: AOJu0YxEmO24Fl5Rx7VURVJTD2Ql9eMuNY2Ac9ZG4afpeuhcKRz8LxH6
 CQWpXAGXRlHhpXpvbF5b9i05iQe/cr9z+i+M4lV/nCAcEEC5hpAzvoDEJg==
X-Google-Smtp-Source: AGHT+IHmAgnabCG+hcnFTzBPuFiEZLBpFS07gthweI66nxhdR9mhsXbE+hQAn+Z+e3qCB9aftyMB2Q==
X-Received: by 2002:a05:6e02:1caf:b0:3a3:778e:45cd with SMTP id
 e9e14a558f8ab-3a3b5fbc20cmr73513825ab.21.1728850879838; 
 Sun, 13 Oct 2024 13:21:19 -0700 (PDT)
Received: from james-x399.localdomain (71-33-159-223.hlrn.qwest.net.
 [71.33.159.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4dbada84a26sm1612983173.107.2024.10.13.13.21.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Oct 2024 13:21:19 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 13 Oct 2024 14:21:18 -0600
Message-Id: <20241013202118.2828758-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728850880; x=1729455680; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1eVDGF6DGMbMh1yFd+I0bLrsj0Kz4wL2VXblXldo9tU=;
 b=HnewMN+SIgddXLWFgBn5M2tn7nXfEnvtxF4JBIGHJowXe1BOfANdBqGbrnat0mPXEi
 UpKEAjmVGHsp53wB0xRq1AT8kbvdphXqBEM8KDP0JbxdSDDXOC8+17kt8GwaR4PP4tct
 8Rk1QXAPmw+rMaV7ALbKfMtu1TuQAbnN2iGMh0gQm1CYinbOXvhTQFOG6V3Zm9dyuB8F
 mhzy8Um0g/gBslmlGC4g0k4xlYTSokVjIHWMNXcWctKB3j4+mUIb/o0QPXt1v5ToEYKH
 BWawnMqlTCvp27T/ng/rQU4AwwuwCsmL+3IFDttbnTJ2kwNnhkg2J99D+Iuj2vmAXHZ+
 rP1g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=HnewMN+S
Subject: [Buildroot] [PATCH 1/1] package/python-pydantic-core: bump to
 version 2.24.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pydantic-core/python-pydantic-core.hash | 2 +-
 package/python-pydantic-core/python-pydantic-core.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-pydantic-core/python-pydantic-core.hash b/package/python-pydantic-core/python-pydantic-core.hash
index 88f978a98f..14d5a748ac 100644
--- a/package/python-pydantic-core/python-pydantic-core.hash
+++ b/package/python-pydantic-core/python-pydantic-core.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  9b049dd3b038da0711d06273da0a191d249fc321b0b6b25cf0d56f8925364597  python-pydantic-core-2.24.0-cargo2.tar.gz
+sha256  0f8ba0c69bf7a2939dce9219b40187920ef8ab36c822b441a9ba3ab460cb2e4e  python-pydantic-core-2.24.1-cargo2.tar.gz
 # Locally computed sha256 checksums
 sha256  2afdd30d54b4d62b6f488a6bcc1546e84ec5061f13f4209c03d012348783795a  LICENSE
diff --git a/package/python-pydantic-core/python-pydantic-core.mk b/package/python-pydantic-core/python-pydantic-core.mk
index acc06a9c79..727632dd52 100644
--- a/package/python-pydantic-core/python-pydantic-core.mk
+++ b/package/python-pydantic-core/python-pydantic-core.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDANTIC_CORE_VERSION = 2.24.0
+PYTHON_PYDANTIC_CORE_VERSION = 2.24.1
 PYTHON_PYDANTIC_CORE_SOURCE_PYPI = pydantic_core-$(PYTHON_PYDANTIC_CORE_VERSION).tar.gz
-PYTHON_PYDANTIC_CORE_SITE_PYPI = https://files.pythonhosted.org/packages/a0/de/104764c6eac40b580a1c4d52c7befbd24c16d409c670257ce354df6ddc1e
+PYTHON_PYDANTIC_CORE_SITE_PYPI = https://files.pythonhosted.org/packages/12/75/85049f16024330b2cb7318530e26ab0da24f3aa17f07191b6851aafdd5d1
 PYTHON_PYDANTIC_CORE_SITE = $(PYTHON_PYDANTIC_CORE_SITE_PYPI)/$(PYTHON_PYDANTIC_CORE_SOURCE_PYPI)?buildroot-path=filename
 PYTHON_PYDANTIC_CORE_SETUP_TYPE = maturin
 PYTHON_PYDANTIC_CORE_LICENSE = MIT
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
