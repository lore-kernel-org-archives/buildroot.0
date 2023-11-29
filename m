Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1B66C07CB1
	for <buildroot@archiver.kernel.org>; Wed, 29 Nov 2023 17:27:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85A8B8229E;
	Wed, 29 Nov 2023 17:27:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85A8B8229E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cWXRN8Q_L_qV; Wed, 29 Nov 2023 17:27:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C71CC84395;
	Wed, 29 Nov 2023 17:27:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C71CC84395
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EE3FB1BF31E
 for <buildroot@lists.busybox.net>; Wed, 29 Nov 2023 17:26:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C5BB34026A
 for <buildroot@lists.busybox.net>; Wed, 29 Nov 2023 17:26:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C5BB34026A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dgzeWB3QaSI2 for <buildroot@lists.busybox.net>;
 Wed, 29 Nov 2023 17:26:43 +0000 (UTC)
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 488094011A
 for <buildroot@buildroot.org>; Wed, 29 Nov 2023 17:26:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 488094011A
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a132acb67b5so338968866b.3
 for <buildroot@buildroot.org>; Wed, 29 Nov 2023 09:26:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701278801; x=1701883601;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EIzn2oBu6AxNeBzZxqMhuHrEIrk01G8p6QJECAPAeVQ=;
 b=IEIzR0v8mvWqCF1OHAU6JXSKHu8IkeAbkp73pdoBfiTsCdi38koVCbZkAkwXUgKhF1
 9nioUcz8tnQ1MI3ffK51s5gLwkysQezH7KqsuZrqZvRdr5MdqbLmrxA3m0QPaDjcwjGY
 SGk4xhN9g3Sj0AohZcUIM0s9iymvSl5c+nDpIINSNENmkNt4KKbDLl40XfvP+FHgd59/
 zqdrveilYrYHa5dRqQw1zEW1gDkVE0dVEiZcO+WL4qM+WInbM95eKq8XvraXNUmez14V
 0NxlHCuwFwcZ2hfSRL/UqRqApPZVdupA91whHNRjHoJF132J1TeHC+BbjBBH2SAEAHeg
 inJA==
X-Gm-Message-State: AOJu0YwsPFMJQttBxBcR0kTkVy+bcQSfD86gW4NVSIHuR9qWsHU2nvMj
 R/OozFeSfVUSHBcukphP4xZ3BgktrJ+kH1UTI2EKSw==
X-Google-Smtp-Source: AGHT+IHj2q/pRCoRX2byR0zrCalkjJECcgvfIvLzbZzfHtU8GX+3f+tBbYDxPeJwR4sGHiQAx5GXMA==
X-Received: by 2002:a17:906:80c2:b0:a03:90a3:b775 with SMTP id
 a2-20020a17090680c200b00a0390a3b775mr13883175ejx.27.1701278801118; 
 Wed, 29 Nov 2023 09:26:41 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-95-244-100-54.retail.telecomitalia.it. [95.244.100.54])
 by smtp.gmail.com with ESMTPSA id
 dv19-20020a170906b81300b009a9fbeb15f2sm8104620ejb.62.2023.11.29.09.26.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Nov 2023 09:26:40 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 29 Nov 2023 18:26:08 +0100
Message-ID: <20231129172615.1683565-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129172615.1683565-1-dario.binacchi@amarulasolutions.com>
References: <20231129172615.1683565-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1701278801; x=1701883601;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EIzn2oBu6AxNeBzZxqMhuHrEIrk01G8p6QJECAPAeVQ=;
 b=rFmuieHy3accywZpXg6kO6FJ/ly1lZ0zID/1Szr95HSz2fifKMqkkRXDgv5x0fzcrp
 /JBfTNJiYyzueU6xYP0SkBBtEBMIPJRuz/eCDccp1Hft1Oc3RjEjhtKv4vQafFJpBgvH
 TQoumWB69v67tn8bjWG8SucHDsLXRjEcgiOaM=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=rFmuieHy
Subject: [Buildroot] [PATCH 04/11] package/python-attrs: add host variant
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
Cc: michael@amarulasolutions.com, Asaf Kahlon <asafka7@gmail.com>,
 Xuanhao Shi <X15000177@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Recent version of U-Boot use binman to provide a mechanism for building
images, from simple SPL + U-Boot combinations, to more complex
arrangements with many parts. This package is required by binman.

Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/Config.in.host               | 1 +
 package/python-attrs/Config.in.host  | 8 ++++++++
 package/python-attrs/python-attrs.mk | 6 ++++++
 3 files changed, 15 insertions(+)
 create mode 100644 package/python-attrs/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index 5d2121de02a4..5f9dbd3c71be 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -82,6 +82,7 @@ menu "Host utilities"
 	source "package/pkgconf/Config.in.host"
 	source "package/pru-software-support/Config.in.host"
 	source "package/pwgen/Config.in.host"
+	source "package/python-attrs/Config.in.host"
 	source "package/python-cython/Config.in.host"
 	source "package/python-greenlet/Config.in.host"
 	source "package/python-iniparse/Config.in.host"
diff --git a/package/python-attrs/Config.in.host b/package/python-attrs/Config.in.host
new file mode 100644
index 000000000000..d85f57915318
--- /dev/null
+++ b/package/python-attrs/Config.in.host
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_HOST_PYTHON_ATTRS
+	bool "host python-attrs"
+	help
+	  attrs is the Python package that will bring back the joy of
+	  writing classes by relieving you from the drudgery of
+	  implementing object protocols (aka dunder methods).
+
+	  https://attrs.readthedocs.io/
diff --git a/package/python-attrs/python-attrs.mk b/package/python-attrs/python-attrs.mk
index 0d704ea11195..96d6b8ad7923 100644
--- a/package/python-attrs/python-attrs.mk
+++ b/package/python-attrs/python-attrs.mk
@@ -15,4 +15,10 @@ PYTHON_ATTRS_DEPENDENCIES = \
 	host-python-hatch-fancy-pypi-readme \
 	host-python-hatch-vcs
 
+HOST_PYTHON_ATTRS_DEPENDENCIES = \
+	host-python-hatchling \
+	host-python-hatch-fancy-pypi-readme \
+	host-python-hatch-vcs
+
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
