Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6206DC6FD19
	for <buildroot@archiver.kernel.org>; Thu, 16 Mar 2023 08:35:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 159CE813AC;
	Thu, 16 Mar 2023 08:35:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 159CE813AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gMGeBd8V4VzH; Thu, 16 Mar 2023 08:35:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3DA7C81EE7;
	Thu, 16 Mar 2023 08:35:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3DA7C81EE7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 02B2E1BF3D5
 for <buildroot@lists.busybox.net>; Thu, 16 Mar 2023 08:35:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 61FDA4088B
 for <buildroot@lists.busybox.net>; Thu, 16 Mar 2023 08:35:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61FDA4088B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ir2dETogiei7 for <buildroot@lists.busybox.net>;
 Thu, 16 Mar 2023 08:35:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E200408C2
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1E200408C2
 for <buildroot@buildroot.org>; Thu, 16 Mar 2023 08:35:03 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id m22so450226ioy.4
 for <buildroot@buildroot.org>; Thu, 16 Mar 2023 01:35:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678955702;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aKZH/8y47uFbVWwCrt4QI2iDNLDvm+qDfeCIvd7o6fI=;
 b=7GdNvE6yiYbs96nVIz/8x1Buut+76uAvgMNg9MsOYcUY5z24APL3TZ95+Pw04SsG2O
 Jn6GhYt63OOM06CS2LzM+ijU9mGjh4Jgsp3iW3sLetpl/fKNP5JnOxrKQ1h9BsOyBlIi
 fIa2iUeGdO0cpBAwxuzXbsGwehCc+21s/cS9vDC7WJC97Dy5NwTKaQRFBNj3aH71aOXn
 zs9JfGGzdNvHIHZBVT+A0Ln/oAWrTBvaR0XwOV8MZt3muA9CsSuJbv43fyp7aa1KUCdR
 cKx605fEYryiFfaXSM9hqvKRJ5IIMqLDaM97V//SNCt/xvL2jJohjoUvEjQvaG2cg0zq
 rzJw==
X-Gm-Message-State: AO0yUKXOblRDovtQuDU2+aIOT4q0q0WWBf4zfMRh/Ih76+BOrhTZzc8D
 Dh8VyG6BIBmyB3N5T3VaD+/pa3r9UjlzTQ==
X-Google-Smtp-Source: AK7set9wFFRA2u2gWxR+4KuHjsOTzAumvdi0zxWkdvqJ+LY9Dyg/fkg4w93CbU7/D28OSqnrLmsMVA==
X-Received: by 2002:a5d:84d1:0:b0:752:97db:538e with SMTP id
 z17-20020a5d84d1000000b0075297db538emr4224767ior.21.1678955702579; 
 Thu, 16 Mar 2023 01:35:02 -0700 (PDT)
Received: from james-x399.localdomain (97-118-149-35.hlrn.qwest.net.
 [97.118.149.35]) by smtp.gmail.com with ESMTPSA id
 y34-20020a029525000000b003b331f0bbdfsm534630jah.97.2023.03.16.01.35.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 01:35:02 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 16 Mar 2023 02:34:35 -0600
Message-Id: <20230316083440.3466725-5-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230316083440.3466725-1-james.hilliard1@gmail.com>
References: <20230316083440.3466725-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678955702;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aKZH/8y47uFbVWwCrt4QI2iDNLDvm+qDfeCIvd7o6fI=;
 b=jEIfMFEByq3EOpHU3NrT3rGUmfavsxdEnpAGEvC/aVGlv0xuKIoGUq9tcVioq8pdoX
 CFuMs1aut9FdoQBEpRp5kpLxTC1/wcKLcB9enng8j1U3X40lBBm0T8dVD+fP+8ZyJ0Ac
 4ih/br+y5/GyazvN9k/noNq+LwRS7ETk9feRs52iNeeFhfa6Yfi1R4mM4dEA0FTzAjHH
 Exh41/G7k02ClqkYzUPW1IamnFVlJXPkGCVVIsI3CZC6Z/fz7WTEUjbu2vj9FxUGu7Qo
 9U0DYaKn/wXKDSxZZWxqVgI0hCHrq6UxjgTWDsyyRoizP7rdZG7cyrpzeTGCmG8i1PP/
 uFFw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=jEIfMFEB
Subject: [Buildroot] [PATCH v6 05/10] package/psimd: new package
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
Cc: Stefan Hager <stefan.hager@ginzinger.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This package is required by tensorflow-lite.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v4 -> v5:
  - add comment indicating library is header only
---
 DEVELOPERS               |  1 +
 package/Config.in        |  1 +
 package/psimd/Config.in  |  6 ++++++
 package/psimd/psimd.hash |  4 ++++
 package/psimd/psimd.mk   | 15 +++++++++++++++
 5 files changed, 27 insertions(+)
 create mode 100644 package/psimd/Config.in
 create mode 100644 package/psimd/psimd.hash
 create mode 100644 package/psimd/psimd.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index b0cabbc4f4..24c571544d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2688,6 +2688,7 @@ F:	package/ti-gfx/
 N:	Stefan Hager <stefan.hager@ginzinger.com>
 F:	package/cpuinfo/
 F:	package/gemmlowp/
+F:	package/psimd/
 F:	package/pthreadpool/
 F:	package/ruy/
 
diff --git a/package/Config.in b/package/Config.in
index 6dafc7cb5c..ac9241f18b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2143,6 +2143,7 @@ endif
 	source "package/protobuf/Config.in"
 	source "package/protobuf-c/Config.in"
 	source "package/protozero/Config.in"
+	source "package/psimd/Config.in"
 	source "package/pthreadpool/Config.in"
 	source "package/qhull/Config.in"
 	source "package/qlibc/Config.in"
diff --git a/package/psimd/Config.in b/package/psimd/Config.in
new file mode 100644
index 0000000000..c5c51ca2ef
--- /dev/null
+++ b/package/psimd/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PSIMD
+	bool "psimd"
+	help
+	  Portable 128-bit SIMD intrinsics.
+
+	  https://github.com/Maratyszcza/psimd
diff --git a/package/psimd/psimd.hash b/package/psimd/psimd.hash
new file mode 100644
index 0000000000..5692e79bd6
--- /dev/null
+++ b/package/psimd/psimd.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256  f6c4dab91ae9a03b3019e7cab0572743afd0e1b6e75b97fcca50259c737c924e  psimd-072586a71b55b7f8c584153d223e95687148a900.tar.gz
+# License files, locally calculated
+sha256  984ce1e0b8ee89d234e28b960381f240e03a07a8031f35012f9c3256f56964e2  LICENSE
diff --git a/package/psimd/psimd.mk b/package/psimd/psimd.mk
new file mode 100644
index 0000000000..be0090a32f
--- /dev/null
+++ b/package/psimd/psimd.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# psimd
+#
+################################################################################
+
+PSIMD_VERSION = 072586a71b55b7f8c584153d223e95687148a900
+PSIMD_SITE = $(call github,Maratyszcza,psimd,$(PSIMD_VERSION))
+PSIMD_LICENSE = MIT
+PSIMD_LICENSE_FILES = LICENSE
+PSIMD_INSTALL_STAGING = YES
+# Only installs a header
+PSIMD_INSTALL_TARGET = NO
+
+$(eval $(cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
