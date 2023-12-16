Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1D9DC46CCD
	for <buildroot@archiver.kernel.org>; Sat, 16 Dec 2023 16:11:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DCC760F5F;
	Sat, 16 Dec 2023 16:11:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9DCC760F5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mpyNT_SVna_B; Sat, 16 Dec 2023 16:11:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 967B860BC8;
	Sat, 16 Dec 2023 16:11:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 967B860BC8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 240911BF28A
 for <buildroot@lists.busybox.net>; Sat, 16 Dec 2023 16:10:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F022881F39
 for <buildroot@lists.busybox.net>; Sat, 16 Dec 2023 16:10:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F022881F39
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I5LgEYVt2dqC for <buildroot@lists.busybox.net>;
 Sat, 16 Dec 2023 16:10:08 +0000 (UTC)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E88CC81ED7
 for <buildroot@buildroot.org>; Sat, 16 Dec 2023 16:10:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E88CC81ED7
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40c48d7a7a7so16252465e9.3
 for <buildroot@buildroot.org>; Sat, 16 Dec 2023 08:10:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702743006; x=1703347806;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=p1mE0tVQ7Tu70XpInl+swni2s6TGtEyUDYXsiGXnhXI=;
 b=qSUQD3xV1DdGjKDzDVpX7hlc6NCZ64LmxeKGwtexdlGgFQH9dKKsLWvUlzRxO6wOQE
 0rILElwlTfSBE3XlFAbyjR+GDFop7oJyVhhOAcAQYOuuZaT60jLqv7lxd1zC2rP5/TL9
 Mlmr9WbnwlJ4Cve+V3Bo9TaKeE9lEbHTI8F5nJgeH3zQ9wWxQbVBf7+djAv57lCVoisg
 xt4bb+O7yjGKpCjqfiDQ7hw7SYdxkWNUQOQKpSvmjlqX5hn6izjtBMWXx+MDvIylcDr2
 9FWii8HpYxgGi+7pA+JDF2j9ly+/lbjVM/Yxs7g0E/3FJTnOP8wgOMdHpLEKAZ4maNQq
 9J3A==
X-Gm-Message-State: AOJu0Yxb5ETpBRn3BvtGIC82t86oh6bL2v/HybbwRD7pjzDDETVT2KdU
 6/H9xwg37wqhuqhDm5du0K6Jg3kj/uk=
X-Google-Smtp-Source: AGHT+IHfKUgj1L75tY2RDd67tHQ7uXk5ayAicGzFslS90Lpv7y1St6hcFh5P2qs+62hqh0zyFB4NYQ==
X-Received: by 2002:a7b:c84e:0:b0:40c:25e8:70bf with SMTP id
 c14-20020a7bc84e000000b0040c25e870bfmr8001248wml.110.1702743006049; 
 Sat, 16 Dec 2023 08:10:06 -0800 (PST)
Received: from landeda.home ([2a01:cb19:8290:3800:4f89:5708:1633:580e])
 by smtp.gmail.com with ESMTPSA id
 k40-20020a05600c1ca800b0040b45356b72sm36319926wms.33.2023.12.16.08.10.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Dec 2023 08:10:05 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 16 Dec 2023 17:10:01 +0100
Message-ID: <7d90c305cd781885c4161e630f34ef8417fe2b7a.1702742998.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1702742998.git.yann.morin.1998@free.fr>
References: <cover.1702742998.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702743006; x=1703347806; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p1mE0tVQ7Tu70XpInl+swni2s6TGtEyUDYXsiGXnhXI=;
 b=nU/okhXTF9GF2mTGFodHA+qtYGCVFQIAxA3jEDBCx0uVkhlbnp7jXzSkND7oxkSrTE
 t7nmUW24Z/rBMUNoMfSpJuL9oSxgNaUZWNhaPb8y4VcA6pofTNaBWqeVOBWIZ1iwPfAZ
 bNfVCVGu27e4Y4L4E5p/Kf6D/VuaV+GlQl0H9myRAyj7Qw+/LpOkkt8B/XUAzuzu0ibU
 O66MYxbA/O+n9q7mxgju9drDou5pQ7epXF8kh4SRwy9K6PkCyzMXULnlKTRHPYxBn2Fe
 SbcctvN8b3UXySWFtyhzzNPBqeLXXPeXoDlItFfM174txjJyz1imF32KUeQAbQdWrvt4
 mYqQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=nU/okhXT
Subject: [Buildroot] [PATCH 8/9] docs/manual: add section about docker images
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 docs/manual/prerequisite.adoc | 43 +++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/docs/manual/prerequisite.adoc b/docs/manual/prerequisite.adoc
index 6f07cba551..d15f0a972a 100644
--- a/docs/manual/prerequisite.adoc
+++ b/docs/manual/prerequisite.adoc
@@ -96,3 +96,46 @@ corresponding tool on the host system:
 * Graph generation tools:
 ** +graphviz+ to use 'graph-depends' and '<pkg>-graph-depends'
 ** +python-matplotlib+ to use 'graph-build'
+
+
+=== Docker images
+
+The Buildroot project also provides a set of Docker images descriptions,
+in the directory `support/docker/`, which provide ready to use systems
+for using Buildroot. Those images are available on the
+https://gitlab.com/buildroot.org/buildroot/container_registry[docker
+registry of the Buildroot project].
+
+For a given distribution, and a given version of that distribution,
+there are up to three variants: 'base', 'ci', and 'user':
+
+* the 'base' variant is a minimalist system, which contains only the
+  minimal set of packages required for running Buildroot (i.e. the
+  packages listed as mandatory in the manual). The 'base' image shall
+  be used to verify that a package has all its dependencies defined,
+  for example by using:
+
+** `utils/test-pkg`
+
+* the 'ci' image inherits from the 'base' one, and adds the few packages
+  that are needed to run the CI jobs. The 'ci' image shall be used to
+  run the various tests and tooling in Buildroot:
+
+** `make check-package`
+** `support/testing/run-tests`
+** `utils/check-symbols`
+
+* the 'user' image inherits from the 'ci' image, and adds a few more
+  packages and setup that are useful for interactive use (e.g. the
+  `br-user` is sudoer without any password, but can just run a login
+  shell, using _exactly_ `sudo su -`).
+
+The Buildroot developers by no mean enforce or recommend using those
+images, or even suggest that Buildroot only works when using one of
+those images; instead, they are known-working environments that can be
+used where the distribution on the build machine can't be configured
+to match Buildroot's needs (e.g. on a shared server), or to provide a
+quick and easy way to test on various ditributions.
+
+Finally, those images can serve as the basis for further customisation:
+one can use them in the `FROM` directive in their own +Dockerfile+.
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
