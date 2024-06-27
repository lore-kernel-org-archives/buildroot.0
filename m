Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5E41C2BD09
	for <buildroot@archiver.kernel.org>; Thu, 27 Jun 2024 07:54:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 279BC41A6A;
	Thu, 27 Jun 2024 07:54:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id huT4xeoQjCj5; Thu, 27 Jun 2024 07:54:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E5DF341A5F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E5DF341A5F;
	Thu, 27 Jun 2024 07:54:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 28DEF1BF3D8
 for <buildroot@lists.busybox.net>; Thu, 27 Jun 2024 07:54:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 13D6680C9A
 for <buildroot@lists.busybox.net>; Thu, 27 Jun 2024 07:54:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TnAUEJQOa_2I for <buildroot@lists.busybox.net>;
 Thu, 27 Jun 2024 07:54:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0213F80C84
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0213F80C84
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0213F80C84
 for <buildroot@buildroot.org>; Thu, 27 Jun 2024 07:54:48 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-42561c16ffeso8966925e9.3
 for <buildroot@buildroot.org>; Thu, 27 Jun 2024 00:54:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719474887; x=1720079687;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IFLaI1p6ibwWHFZQ2tGES2Yciyo95byOzXbN8IMv+nA=;
 b=xR9TenVThRt2DipdjkGCNj1r9vSypnVWpMgFMZiyFvp8MX6cdHOY+480+TGe/axXVM
 XT4pAKn4dywMBAiivfx+vQzCtTc6c6801udEh+EpYbrJsJVAFjyJkMwZyyU/e4mvyzPb
 0BlnLSs7Azac0IPLwQ+3uDhv4lB9DaQRP9iQc/t7XWWpX5LOk77NAJmhXEL5qkahGY+e
 +QuZlVYJtZpcURMd/24nmIb1mSS/zsZ8NESOHJq296w5liZSmnKjA3Tsjli1rsYPV8KQ
 1dMVfBrvbdNxBOkT8eSuyktJnpHrcC9KQruBwfZUKQIXjsVPxiA2nmHK1XP2s49QKXiK
 XOfg==
X-Gm-Message-State: AOJu0Yy3S9rujkJTAeb6mI/I/FR2OYnc6Od9DLG0Pns3MWURwOWsDZNv
 DgQD9gp6l/QcZf33l8mZoqnZQfVQmAVNFeDjyR4fbpp3g1XaoXHRP7FNOrg8f/zAjLKRUJ0AuGj
 y
X-Google-Smtp-Source: AGHT+IHg27JfiXF+WnnLfj5DId9f3BOs41QCIOR8lJY9Sa+7jpdfvrdQaktXzDcJh1WvMQIDGf6MVA==
X-Received: by 2002:a5d:538f:0:b0:365:ebb6:35df with SMTP id
 ffacd0b85a97d-366e962df3bmr7685129f8f.58.1719474886865; 
 Thu, 27 Jun 2024 00:54:46 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3674369ee67sm991923f8f.110.2024.06.27.00.54.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jun 2024 00:54:46 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 27 Jun 2024 09:54:39 +0200
Message-ID: <20240627075441.4116645-5-romain.naour@smile.fr>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240627075441.4116645-1-romain.naour@smile.fr>
References: <20240627075441.4116645-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1719474887; x=1720079687; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IFLaI1p6ibwWHFZQ2tGES2Yciyo95byOzXbN8IMv+nA=;
 b=Cxrfzkc9RAJ040tjWHxEbn3cD5/uRAyno7i8s3m4qdrKUk1lFOgp1FQgTfT1PzHD+z
 iSrE/p75iNdGbajaQA/6M23JQSSY3yOBu5/RpjglroQ2zBDUEl0M2wTonvDQjH7lTYo7
 xkJ4CpVb1wDMnHPD1fhWYFIlg21cMv0RD0U9A=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=Cxrfzkc9
Subject: [Buildroot] [PATCH 4/6] package/python-pkgconfig: new host package
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Required to build python-tpm2-pytss.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 DEVELOPERS                                     |  1 +
 package/python-pkgconfig/python-pkgconfig.hash |  5 +++++
 package/python-pkgconfig/python-pkgconfig.mk   | 16 ++++++++++++++++
 3 files changed, 22 insertions(+)
 create mode 100644 package/python-pkgconfig/python-pkgconfig.hash
 create mode 100644 package/python-pkgconfig/python-pkgconfig.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 423fb2dd64..91aed11860 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2773,6 +2773,7 @@ F:	package/openpowerlink/
 F:	package/physfs/
 F:	package/piglit/
 F:	package/python-libevdev/
+F:	package/python-pkgconfig/
 F:	package/qemu/
 F:	package/solarus/
 F:	package/stress-ng/
diff --git a/package/python-pkgconfig/python-pkgconfig.hash b/package/python-pkgconfig/python-pkgconfig.hash
new file mode 100644
index 0000000000..2fa57a7be5
--- /dev/null
+++ b/package/python-pkgconfig/python-pkgconfig.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/pkgconfig/json
+md5  12523e11b91b050ca49975cc033689a4  pkgconfig-1.5.5.tar.gz
+sha256  deb4163ef11f75b520d822d9505c1f462761b4309b1bb713d08689759ea8b899  pkgconfig-1.5.5.tar.gz
+# Locally computed sha256 checksums
+sha256  cdfc7f89d8c93b15d447c9ed71d5a533b4e44b82ec86daaefb10f6db37b9e13a  LICENSE
diff --git a/package/python-pkgconfig/python-pkgconfig.mk b/package/python-pkgconfig/python-pkgconfig.mk
new file mode 100644
index 0000000000..239dd90a5d
--- /dev/null
+++ b/package/python-pkgconfig/python-pkgconfig.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# python-pkgconfig
+#
+################################################################################
+
+PYTHON_PKGCONFIG_VERSION = 1.5.5
+PYTHON_PKGCONFIG_SOURCE = pkgconfig-$(PYTHON_PKGCONFIG_VERSION).tar.gz
+PYTHON_PKGCONFIG_SITE = https://files.pythonhosted.org/packages/c4/e0/e05fee8b5425db6f83237128742e7e5ef26219b687ab8f0d41ed0422125e
+PYTHON_PKGCONFIG_SETUP_TYPE = setuptools
+PYTHON_PKGCONFIG_LICENSE = MIT
+PYTHON_PKGCONFIG_LICENSE_FILES = LICENSE
+
+HOST_PYTHON_PKGCONFIG_DEPENDENCIES = host-python-poetry-core
+
+$(eval $(host-python-package))
-- 
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
