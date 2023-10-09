Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF7C7E95A91
	for <buildroot@archiver.kernel.org>; Mon,  9 Oct 2023 14:31:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7DA51611A2;
	Mon,  9 Oct 2023 14:31:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7DA51611A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e_p5_fF2r0FY; Mon,  9 Oct 2023 14:31:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A741A61142;
	Mon,  9 Oct 2023 14:31:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A741A61142
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 827801BF314
 for <buildroot@lists.busybox.net>; Mon,  9 Oct 2023 14:31:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6907261142
 for <buildroot@lists.busybox.net>; Mon,  9 Oct 2023 14:31:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6907261142
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i59Jdls3Fg0m for <buildroot@lists.busybox.net>;
 Mon,  9 Oct 2023 14:31:35 +0000 (UTC)
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 713846104D
 for <buildroot@buildroot.org>; Mon,  9 Oct 2023 14:31:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 713846104D
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-9b2cee40de8so1001262466b.1
 for <buildroot@buildroot.org>; Mon, 09 Oct 2023 07:31:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696861893; x=1697466693;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F9zGdD+e6UzKwR6PW2n4iSwvkOzC+fk7uhGycTorE3Q=;
 b=o01vA7blpjrbZcGdFfgWzZoymvaoDP/+2lgIZ8TH1WT8BNrQ4EXVRN/cswchD7HUA5
 d4U8aWfqpiZDPhNzOl5R02VjFX9T5piGTjuHwTXXoDRIkvqbMi2geeEGRkfAiK8C234z
 sDaS9RuRB3N8qu8rJXnhi1YYh9no9hLzQaS1Vt+C30A6hdCnYHjDbo1m87KzfhGj3Wk3
 P+ZtFfRRraUTXCb3yAs0AHFaAdFaV5evTPR2HLxkSLCIq8J1AGD41uawhm0PEERm/fK7
 iRsg3tGWHMmvozPNXjrsdL0tHxpjpH3+DydVb/4t2gvF3TnJyowEguQW2/a7xZQn4H0V
 0Qcg==
X-Gm-Message-State: AOJu0YyT1LeirD151GnrenKN/be//j+YJzEPx2GQIma6aerlE5CR4iyZ
 f/ODHR7scm4z2aoCmZcSD6AIXaPppgRlyCFIJtaKyw==
X-Google-Smtp-Source: AGHT+IF7iMOdQbV9S3xZOxBxpkgKqLfxI9nHUa5E13PZ0MddPriAhoah/gPIuD+LwyPVkNk1Xg+oTA==
X-Received: by 2002:a17:907:7204:b0:98e:4f1:f987 with SMTP id
 dr4-20020a170907720400b0098e04f1f987mr9427457ejc.3.1696861893236; 
 Mon, 09 Oct 2023 07:31:33 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6467:4426:3fb7:fc38:9be:dc4c])
 by smtp.gmail.com with ESMTPSA id
 x19-20020aa7d393000000b005330b2d1904sm6220388edq.71.2023.10.09.07.31.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 07:31:32 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon,  9 Oct 2023 16:31:22 +0200
Message-ID: <20231009143122.1775787-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231009143122.1775787-1-adam.duskett@amarulasolutions.com>
References: <20231009143122.1775787-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1696861893; x=1697466693;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F9zGdD+e6UzKwR6PW2n4iSwvkOzC+fk7uhGycTorE3Q=;
 b=S4C6SuiharagDCTjFPH0kCZIYDv+riJg1k32PRBT6HGZV+27qOG5OzhzSrW/X6TCOH
 C43V5YvwF70UkkB9ef2AFiVnh+e3lXQvH8iemTL/gc/uo8gProCvZeyhRvzmK5eigH8Q
 oF7v5CFhNzO4FvXszxX/RUgqKsvl0qRSZXUEU=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=S4C6Suih
Subject: [Buildroot] [PATCH 2/2] package/firewalld: enable firewalld selinux
 module
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/firewalld/firewalld.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/firewalld/firewalld.mk b/package/firewalld/firewalld.mk
index 6b2813e54d..188550d449 100644
--- a/package/firewalld/firewalld.mk
+++ b/package/firewalld/firewalld.mk
@@ -23,6 +23,8 @@ FIREWALLD_DEPENDENCIES = \
 	python3 \
 	python-gobject
 
+FIREWALLD_SELINUX_MODULES = firewalld
+
 # Firewalld hard codes the python shebangs to the full path of the
 # python-interpreter. IE: #!/home/buildroot/output/host/bin/python.
 # Force the proper python path.
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
