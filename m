Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC33FC4332F
	for <buildroot@archiver.kernel.org>; Fri,  3 Nov 2023 18:28:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 581DD408F5;
	Fri,  3 Nov 2023 18:28:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 581DD408F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F553sIpFrGVI; Fri,  3 Nov 2023 18:28:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DAAC141B49;
	Fri,  3 Nov 2023 18:28:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DAAC141B49
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F30901BF57C
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 18:27:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C0B6940124
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 18:27:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C0B6940124
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4X1kjeIlQRp2 for <buildroot@lists.busybox.net>;
 Fri,  3 Nov 2023 18:27:52 +0000 (UTC)
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 445BB401F3
 for <buildroot@buildroot.org>; Fri,  3 Nov 2023 18:27:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 445BB401F3
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-577fff1cae6so1816504a12.1
 for <buildroot@buildroot.org>; Fri, 03 Nov 2023 11:27:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699036071; x=1699640871;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uozEdwdnEOX3MZfLGwqqgeD8z/5yLC02GwOFv3ohlhM=;
 b=qkKwtanXjvVs//nHOXFGrzDRkY38f072fTEPFMs7uzcO6/DdKMGcXyo+GBlrU9AYpb
 J5xLFxvd6qvRL5tpHJqe8KOu7+aKmfbliVIWiVrXSG2xfMcM8pIum8YwvLRwT9wXxc/M
 9zMBuhamfNVRGuyAPISRQfBXIb5KPw5g392q3hXGLFdRQ+T2nsPk8OlHlK1Smv/JtUfb
 kIvxO6lC7vMdjMAZ7IqxGCQLB9Xe+dVNlJZvcnWlQTxwMHaMmv2lvRntv2Hg3oDqAfe+
 PvI57SQPeC5W3an+YozVCoa5Oxk51VJCnd+xXUb5GuSIxT/Gsn05I1WAzZXH8fSx4c0/
 PXbg==
X-Gm-Message-State: AOJu0YwX4CmUdwuU9X6Sx5M8I68TJnjmQicJ3hcDEKBiWE2Ez/9D2lR2
 +YbFqWysfLm/TLapyRAP1A74uJkUcbCC2sz5EU1O5Bey
X-Google-Smtp-Source: AGHT+IHF81qUv2cuqcZfN9fYS7r4+a/uo73cVVNc339SDeIGCJjWKMzPbqsCbi1DGSiLhaveo1zoHg==
X-Received: by 2002:a05:6a20:6a24:b0:181:63e5:d500 with SMTP id
 p36-20020a056a206a2400b0018163e5d500mr4555459pzk.6.1699036070691; 
 Fri, 03 Nov 2023 11:27:50 -0700 (PDT)
Received: from DESKTOP-OI0KN2B.lan ([172.56.201.196])
 by smtp.gmail.com with ESMTPSA id
 z5-20020a636505000000b005b7e3eddb87sm1602164pgb.61.2023.11.03.11.27.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Nov 2023 11:27:50 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri,  3 Nov 2023 12:27:44 -0600
Message-ID: <20231103182745.903344-3-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231103182745.903344-1-adam.duskett@amarulasolutions.com>
References: <20231103182745.903344-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1699036071; x=1699640871;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uozEdwdnEOX3MZfLGwqqgeD8z/5yLC02GwOFv3ohlhM=;
 b=GObl4eWY4ofrRL5Pkt/2/+iqmn2S0BKvpGBgFXUMD3Q7cdXiFHu80p+0eG0DcJ2KUC
 d/rihq32Isi5YTMynH6JOj/Y4HQpAEBpA5tN6aS6J9u030ZNdJYLwtzhKtc8I1QlJsO+
 uNaxILMIJeOBKWCco1ParW3pcyN6YNZQSQO70=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=GObl4eWY
Subject: [Buildroot] [PATCH 2/3] docs/manual: add information about tainting
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add documentation about the usage of LIBFOO_TAINTS and what the make target
"check-tainted" does. Also, add documentation about turning off taint
checking and a few scenarios of why a user would want to do so.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 docs/manual/adding-packages-generic.adoc |  9 +++++++++
 docs/manual/legal-notice.adoc            | 24 ++++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/docs/manual/adding-packages-generic.adoc b/docs/manual/adding-packages-generic.adoc
index 76b037f436..12083b07d5 100644
--- a/docs/manual/adding-packages-generic.adoc
+++ b/docs/manual/adding-packages-generic.adoc
@@ -460,6 +460,15 @@ not and can not work as people would expect it should:
   to let you know, and +not saved+ will appear in the +license files+ field
   of the manifest file for this package.
 
+* +LIBFOO_TAINTS+ should be set to YES if a package taints a Buildroot
+  configuration. A Buildroot configuration is tainted when a package uses
+  external dependencies for which Buildroot cannot recover licensing
+  information, such as using a package manager (e.g., NPM) during the build.
+  If a configuration is tainted, the licensing information produced by
+  +make legal-info+ may not be accurate. If you wish to turn off taint
+  checking, it is possible to do so by enabling the BR2_DISABLE_TAINT_CHECKING
+  option.
+
 * +LIBFOO_ACTUAL_SOURCE_TARBALL+ only applies to packages whose
   +LIBFOO_SITE+ / +LIBFOO_SOURCE+ pair points to an archive that does
   not actually contain source code, but binary code. This a very
diff --git a/docs/manual/legal-notice.adoc b/docs/manual/legal-notice.adoc
index 179aa6b179..55a2120f8e 100644
--- a/docs/manual/legal-notice.adoc
+++ b/docs/manual/legal-notice.adoc
@@ -72,6 +72,30 @@ some of the external toolchains and the Buildroot source code itself.
 When you run +make legal-info+, Buildroot produces warnings in the +README+
 file to inform you of relevant material that could not be saved.
 
+Furthermore, if a package uses custom external dependencies from the Buildroot
+tree, the configuration may be tainted. An example could be a package manager
+for a software stack that downloads the required dependencies while building a
+package, such as NPM. In such cases, Buildroot cannot check the licensing of
+the downloaded software and, thus, give accurate licensing information.
+However, it is possible to turn off taint checking by enabling the
+BR2_DISABLE_TAINT_CHECKING option. This option is helpful in cases where you
+can guarantee the reproducibility of the build. Here are three examples:
+
+BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL="http://myserver/node-mods/VERSION/foo"
+  - The user manages the repository and guarantees that it is reproducible.
+
+BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL="$(BR2_EXTERANL_MY_TREE_PATH)/mods/foo"
+  - Reproducible by way of being in a git-versioned br2-external tree.
+
+BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL="foo@1.2.3"
+  - Reproducible because the version is specified.
+
+To check if your configuration is tainted, run:
+
+--------------------
+make check-tainted
+--------------------
+
 Finally, keep in mind that the output of +make legal-info+ is based on
 declarative statements in each of the packages recipes. The Buildroot
 developers try to do their best to keep those declarative statements as
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
