Return-Path: <SRS0=hSOo=MZ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18D8CC4338F
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 16:23:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD3D560F9E
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 16:23:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AD3D560F9E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 762AB60841;
	Mon,  2 Aug 2021 16:23:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s0gyhBirBvwI; Mon,  2 Aug 2021 16:23:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C849D60838;
	Mon,  2 Aug 2021 16:23:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4FB621BF34B
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 16:22:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3EA8660838
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 16:22:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vZtHZldhcLXv for <buildroot@lists.busybox.net>;
 Mon,  2 Aug 2021 16:22:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F13F66063C
 for <buildroot@buildroot.org>; Mon,  2 Aug 2021 16:22:55 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id y7so23011873eda.5
 for <buildroot@buildroot.org>; Mon, 02 Aug 2021 09:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o8zBHik4P4nKEZQoMllyLLXJO4AFczR8GmjaaSAQ9B4=;
 b=HXizXi58iWVPz4z6AE/9YAHEZlC6Jwhlz+hZjppbhPf4lhL3m4FromegL7amEmwhVV
 MiZOFqqT2+Vyz14Uch3vmLfCOpNQgwUc8GqnXgO+K19kllhRbUzj67BRPKaN+BWzSO+e
 Lkh9FCdDwKwEZA0S/2iJa/fChIVOruqyElfM79vKoEKZteVxORmdOMs4CDBw3AAm7Oa2
 wFghdHJNbeixp3YThASNadeqliSQ2GUQHMdvO5Bvm0WguKxjIaEBMTqm893zLztGDZta
 04BFLgOrou2ZmrXBWPp6v85AM9U0KhZY35oxfk3iDtI+nPEpwBRVK5tNptqcdbQUf8Vo
 ZFPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o8zBHik4P4nKEZQoMllyLLXJO4AFczR8GmjaaSAQ9B4=;
 b=s+bI6HcDmO4auA5GyuvZA0McILbccNYVXPpfPEjzJJMpE1/MCQCmm4C4Kuxn2O/Wum
 TpFMQe8KDjnObQyp+cBqjQlMga2fcav8IjX/pzirXMNyY1LxzTX73md8S3jIhimnKZ7H
 mCGAWcvJ74k5kFdcvO2sNCFco08zQf2UcqUUfbqRhg+mQQtbpOhTTzcs3EwkSLkOe0Ii
 UjZzHECw08IVX0/PGfFjMMopguG9VkUn12kx3NGxQoyJMpR4B80vdgvurBDlX+1XlhPS
 vREwJevPOQrkbcJ5eXkZY+rCelcAeYXqJNOWjGyEs8Am3ExDFn9s+7IjKHN7NVh/47MG
 yE6A==
X-Gm-Message-State: AOAM5303tP81eBu/7TVXkNHJq06NymBNQWfZoGS0GaawXyN/m92aVU+u
 1KmSoI8ZJAM3TECf4PEMVjtAilhGloFpKjorvkA=
X-Google-Smtp-Source: ABdhPJzd3g71nGtsZ46upTd3XI7PyU/oSzC3pN3nLhQVGeoKGL5oT7k3ljdZS1vyYYQfbdmoudBztw==
X-Received: by 2002:a50:cdcb:: with SMTP id h11mr20644634edj.366.1627921374184; 
 Mon, 02 Aug 2021 09:22:54 -0700 (PDT)
Received: from localhost.localdomain
 (2001-1c01-3101-8300-5100-9bb9-68ea-c9f3.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:3101:8300:5100:9bb9:68ea:c9f3])
 by smtp.gmail.com with ESMTPSA id b25sm6485928edv.9.2021.08.02.09.22.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 09:22:53 -0700 (PDT)
From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon,  2 Aug 2021 18:22:44 +0200
Message-Id: <20210802162244.620782-2-arnout@mind.be>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210802162244.620782-1-arnout@mind.be>
References: <20210802162244.620782-1-arnout@mind.be>
MIME-Version: 1.0
Subject: [Buildroot] [RFC 2/2] docs/manual/migrating.txt: add "individual
 packages" section
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Michael Nosthoff <buildroot@heine.tech>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Add a section to the migrating documentation to explain what changed in
individual packages and how it may affect your build.

This section is organised per package, not per Buildroot release,
because in general it's easier to check package per package if anything
changed than to check release per release for all your packages.

The idea is that every time a package is changed in a way that is not
immediately obvious (mainly: affects runtime but not build time), it is
mentioned in this section. This may include:

- a new version of the package got a new name due to API
  incompatibilities;
- the default behaviour or config optoins of the package changed;
- the Buildroot integration (e.g. configuration file, init script) of
  the package changed;
- what is installed by the package is changed (e.g. executable is
  renamed or removed).

To start with, add the recent changes of the installation defaults of
bluez5_utils.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 docs/manual/migrating.txt | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/docs/manual/migrating.txt b/docs/manual/migrating.txt
index 9fd7d7e676..36e4aa4724 100644
--- a/docs/manual/migrating.txt
+++ b/docs/manual/migrating.txt
@@ -22,8 +22,8 @@ To migrate from an older Buildroot version, take the following steps.
   the existing +.config+.
 . If anything is enabled in the Legacy menu, check its help text,
   unselect it, and save the configuration.
-. Review the CHANGES file to see if any of your packages and features
-  are affected by the changes.
+. Review the individual packages section below to see if any of your
+  packages are affected by the changes.
 . Build in the new Buildroot environment.
 . Fix build issues in external packages (usually due to updated
   dependencies).
@@ -36,6 +36,17 @@ To migrate from an older Buildroot version, take the following steps.
 . Run +make savedefconfig+ and verify that what is selected really is
   what you intended to enable.
 
+[[migrating-packages]]
+=== Individual packages
+
+This section describes changes to individual packages. For all packages
+that are built in your configuration, check below if changes are needed.
+
+==== bluez5_utils
+
+Since 2021.08, the tools and all plugins are optional and default off.
+Make sure to enable the plugins you require.
+
 [[br2-external-converting]]
 === Migrating to 2016.11
 
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
