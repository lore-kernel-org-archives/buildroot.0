Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3127AC433EF
	for <buildroot@archiver.kernel.org>; Sat,  1 Jan 2022 19:31:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C30468140F;
	Sat,  1 Jan 2022 19:31:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nm6pbaa9MCLE; Sat,  1 Jan 2022 19:31:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B5C881409;
	Sat,  1 Jan 2022 19:31:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D81FF1BF389
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 19:30:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C5C1D40132
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 19:30:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GFNbb-Cn4wv0 for <buildroot@lists.busybox.net>;
 Sat,  1 Jan 2022 19:30:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B651140177
 for <buildroot@buildroot.org>; Sat,  1 Jan 2022 19:30:26 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id 9so6431945ill.9
 for <buildroot@buildroot.org>; Sat, 01 Jan 2022 11:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YWLLMqMj5Arp36NKE9QTsfqqlVtrC0cIbV31Sf6Sc+U=;
 b=b2lvuQZStwYhCw5hHB2lqw9KfF4Px9DegJTvQtryVmsPBVVRGNaMcPD6xlCn5WPC7E
 f1ycUfL3TtKnlAENG3wTjbKVMtj8Cr/HWhe0wpg3y8unYRz8xouPx1Ql40IQLLPXnii0
 iYDZjEBbX93K0HcILiPPym1LvN/z7z/RtgSXR9uXez6/4HsNHRERqkdzP3VtCdjC5PDf
 lGApgX9/Irihkqh+kg9RtZC4L5ig9m1Ksoin6eqIJUX024ZrqS+K1m7NIlJ+iZP6/9lx
 KMyJ+KCLDSi3FQvQF+KdUB+YXTSVodURpzwAsRAgFZSZ2vF1XLX9c/bBgchUU+iVymhG
 P9Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YWLLMqMj5Arp36NKE9QTsfqqlVtrC0cIbV31Sf6Sc+U=;
 b=gMeEWzbTXHK3FDahlnBk9LcmET4M87vxcRxgcRMRnPfqAb0lkyQY/mC4q9LhlOLeog
 buMygsV0+Ux9af9NIH6hMRvkY8mOg3ucodE8pa9GfDGNVeESU9FvGribeOojMedMw3vP
 0nWXj7X33+WJK3iZ7sMMn+3L4SxxV5+VZWTpuGRiqEu5ywiiWf6ai1xY1QDiHAqJ2OJK
 etQoaHVXchSeH9iB/XpVOyQz/M26SNZXFOYWmzj5OY8BsDeSheoyZ+cyjWeO0olR8qY5
 ird07y8hB4vJNXD4IZIULffntiR+hg2l9QhC2gOoTMlgrferwQgw0h1GpZtxmChuaRYS
 xNcw==
X-Gm-Message-State: AOAM530kL+lslZcNWI49wglwKkCIeJieAMkGKywGU2kjTdzisIYrRnn5
 ysfqGWSO/fv2qb9gVYHfGgBOQ1bgFdc=
X-Google-Smtp-Source: ABdhPJwCIzNvEXPy1ANYsCnUzmG0j91t6FpMl4fX6IjI1FjvYO5Vnaguf2alNsKnXjcGu4D7NC8mtQ==
X-Received: by 2002:a05:6e02:1d0b:: with SMTP id
 i11mr19225598ila.122.1641065425549; 
 Sat, 01 Jan 2022 11:30:25 -0800 (PST)
Received: from james-x399.localdomain (71-218-242-12.hlrn.qwest.net.
 [71.218.242.12])
 by smtp.gmail.com with ESMTPSA id n5sm18046974ilm.87.2022.01.01.11.30.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Jan 2022 11:30:25 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  1 Jan 2022 12:30:17 -0700
Message-Id: <20220101193018.404937-4-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220101193018.404937-1-james.hilliard1@gmail.com>
References: <20220101193018.404937-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 4/5] package/python-setuptools-scm: bump to
 version 6.3.2
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
Cc: Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add new host-python-packaging and host-python-tomli dependencies.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-setuptools-scm/python-setuptools-scm.hash | 4 ++--
 package/python-setuptools-scm/python-setuptools-scm.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-setuptools-scm/python-setuptools-scm.hash b/package/python-setuptools-scm/python-setuptools-scm.hash
index 79999fca0d..22b9afd2c2 100644
--- a/package/python-setuptools-scm/python-setuptools-scm.hash
+++ b/package/python-setuptools-scm/python-setuptools-scm.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/setuptools-scm/json
-md5  c11bf23d80224691a46ee5deb84c42db  setuptools_scm-5.0.1.tar.gz
-sha256  c85b6b46d0edd40d2301038cdea96bb6adc14d62ef943e75afb08b3e7bcf142a  setuptools_scm-5.0.1.tar.gz
+md5  32918d8ac566360c21411e0b3556c695  setuptools_scm-6.3.2.tar.gz
+sha256  a49aa8081eeb3514eb9728fa5040f2eaa962d6c6f4ec9c32f6c1fba88f88a0f2  setuptools_scm-6.3.2.tar.gz
 # sha256 locally computed
 sha256  89807acf2309bd285f033404ee78581602f3cd9b819a16ac2f0e5f60ff4a473e  LICENSE
diff --git a/package/python-setuptools-scm/python-setuptools-scm.mk b/package/python-setuptools-scm/python-setuptools-scm.mk
index caca6d4314..f7f4e3ef27 100644
--- a/package/python-setuptools-scm/python-setuptools-scm.mk
+++ b/package/python-setuptools-scm/python-setuptools-scm.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_SCM_VERSION = 5.0.1
+PYTHON_SETUPTOOLS_SCM_VERSION = 6.3.2
 PYTHON_SETUPTOOLS_SCM_SOURCE = setuptools_scm-$(PYTHON_SETUPTOOLS_SCM_VERSION).tar.gz
-PYTHON_SETUPTOOLS_SCM_SITE = https://files.pythonhosted.org/packages/af/df/f8aa8a78d4d29e0cffa4512e9bc223ed02f24893fe1837c6cee2749ebd67
+PYTHON_SETUPTOOLS_SCM_SITE = https://files.pythonhosted.org/packages/4b/0d/ecb9595fae02467edba5023eb8a23c688d2b438a6a8d1a9e2b8649faf23d
 PYTHON_SETUPTOOLS_SCM_LICENSE = MIT
 PYTHON_SETUPTOOLS_SCM_LICENSE_FILES = LICENSE
 PYTHON_SETUPTOOLS_SCM_SETUP_TYPE = setuptools
+HOST_PYTHON_SETUPTOOLS_SCM_DEPENDENCIES = host-python-packaging host-python-tomli
 
 $(eval $(host-python-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
