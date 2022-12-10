Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1F4EC4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 20:13:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 94128404AB;
	Sat, 10 Dec 2022 20:13:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 94128404AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nzUP7D8dG0dq; Sat, 10 Dec 2022 20:13:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B22B6404A0;
	Sat, 10 Dec 2022 20:13:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B22B6404A0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 235051BF3E9
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 20:12:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F2F0B817AB
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 20:12:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2F0B817AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UHPMqePTomhy for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 20:12:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C3687817AD
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C3687817AD
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 20:12:48 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id y2so1564708ily.5
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 12:12:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P2pbij6qoqXFEz74nLSXHsO2iXzA571+glduX5Xq9WA=;
 b=hgIBY0pFZDPxddTTLtG5ils1sSky2EaVcWHcRbo6Ur/1RZD5GvMsXvYqyELs+K9BEX
 Jhg1HuGZbRTC3QiU2h7nUA7q3Ke/TSWeVb3ijxA4m84hG2GCqy+aPSYTVhYwdT3NPW07
 gX3QX3Q2DxLvWllHhs5O6SG9saB1Ub9wAQRVjyrINF6qBd6i5VYRhN4hkV6JGvwXfbTw
 xsuHG3PfUikCvfe7/ha0PGLXp5bcIKqVKXSvzk8mUSCCEw7nMQSnI15fRbl6RLF8Fbce
 BbykTXKR6CvDF706qTLy/5zM7e8NT88q8K/X990Mlw0W6blr+nFELaZilH+HTmIcsa6M
 M0cg==
X-Gm-Message-State: ANoB5pnE0nZCXUQevvfSPumUglAiumzcOWV+Xg+4sfb8JdUkvg6kpDYO
 N2TPscZOIXvLW/BlA1GPaxa8kpoooub4I3Ws
X-Google-Smtp-Source: AA0mqf6hfTLyfWVIttXpYCH/ZmmQBSSYnO6BDZ+asnXlAtLdom+ex9XGvY50izXg0A2OlGHd1IwJTA==
X-Received: by 2002:a92:ced0:0:b0:303:898c:e02c with SMTP id
 z16-20020a92ced0000000b00303898ce02cmr6070476ilq.16.1670703167714; 
 Sat, 10 Dec 2022 12:12:47 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 q6-20020a05663810c600b00388660ca27dsm1652858jad.4.2022.12.10.12.12.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Dec 2022 12:12:47 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 13:12:40 -0700
Message-Id: <20221210201240.3504734-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221210201240.3504734-1-james.hilliard1@gmail.com>
References: <20221210201240.3504734-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P2pbij6qoqXFEz74nLSXHsO2iXzA571+glduX5Xq9WA=;
 b=cd9gpkttg/TVOZ4MiK0JBPkPAE5gveaGQSHbFIi1S/HFNv4VGrks+6icKFio6ON4VM
 5V1VxgzpQ04F/u1gRcKIC80B0hmIzf0uXHmUDeBijh0hwRZ7KYVGH6BClcdOSTf1vHEZ
 4rmzH1uH5XI3ebTmWxmBypF+oWLDCu+MEiqfqxTTBMMeDKoU0ZJ8usk0DSPcqyQz0Nnc
 /lH2em1KU1A4l5lr3vNr9ZV8n6JmYFDgsCFANQ4l13iRVtPFqbYqlE9eCX8BqPhbrmnM
 2irCwF0y8Tbod4HOQq77vQUZ/QcsKWguFAex5bh8WfXSdLK8A60Tg5lEFo8QO0ALR+Ns
 +0kw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=cd9gpktt
Subject: [Buildroot] [PATCH 2/2] package/python-pymupdf: bump to version
 1.21.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pymupdf/python-pymupdf.hash | 4 ++--
 package/python-pymupdf/python-pymupdf.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pymupdf/python-pymupdf.hash b/package/python-pymupdf/python-pymupdf.hash
index 21befb3b7c..d930d04335 100644
--- a/package/python-pymupdf/python-pymupdf.hash
+++ b/package/python-pymupdf/python-pymupdf.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pymupdf/json
-md5  450f0c613fec4b0d061299d3d935fafa  PyMuPDF-1.20.2.tar.gz
-sha256  02eedf01f57c6bafb5e8667cea0088a2d2522643c47100f1908bec3a68a84888  PyMuPDF-1.20.2.tar.gz
+md5  ae24d77d44369e46bbcd5457fe97d776  PyMuPDF-1.21.0.tar.gz
+sha256  a63dfc289e127a16ab60310ee6005fe83121c7a97f7c120db688f9281c9e5d0f  PyMuPDF-1.21.0.tar.gz
 # Locally computed sha256 checksums
 sha256  57c8ff33c9c0cfc3ef00e650a1cc910d7ee479a8bc509f6c9209a7c2a11399d6  COPYING
diff --git a/package/python-pymupdf/python-pymupdf.mk b/package/python-pymupdf/python-pymupdf.mk
index 238fc4dd47..38212dc44b 100644
--- a/package/python-pymupdf/python-pymupdf.mk
+++ b/package/python-pymupdf/python-pymupdf.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 # python-pymupdf's version must match mupdf's version
-PYTHON_PYMUPDF_VERSION = 1.20.2
+PYTHON_PYMUPDF_VERSION = 1.21.0
 PYTHON_PYMUPDF_SOURCE = PyMuPDF-$(PYTHON_PYMUPDF_VERSION).tar.gz
-PYTHON_PYMUPDF_SITE = https://files.pythonhosted.org/packages/4a/09/6afe87a8ea7acb6e4709223a704270ffe9929497add4d06b12305e229ba8
+PYTHON_PYMUPDF_SITE = https://files.pythonhosted.org/packages/61/14/632eefe5568ee7a4ec95aa7fc9c63996ff6a6d2464d4e3a9dc35da11a409
 PYTHON_PYMUPDF_SETUP_TYPE = setuptools
 PYTHON_PYMUPDF_LICENSE = AGPL-3.0+
 PYTHON_PYMUPDF_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
