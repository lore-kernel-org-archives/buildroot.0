Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21CB0CD6102
	for <buildroot@archiver.kernel.org>; Mon,  9 Oct 2023 16:18:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA9AA61249;
	Mon,  9 Oct 2023 16:18:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA9AA61249
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jdUARrwvezrf; Mon,  9 Oct 2023 16:18:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F097A6126D;
	Mon,  9 Oct 2023 16:18:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F097A6126D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5224E1BF328
 for <buildroot@lists.busybox.net>; Mon,  9 Oct 2023 16:18:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3691441937
 for <buildroot@lists.busybox.net>; Mon,  9 Oct 2023 16:18:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3691441937
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O9aNFeaAVwZM for <buildroot@lists.busybox.net>;
 Mon,  9 Oct 2023 16:18:28 +0000 (UTC)
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A39EE4191C
 for <buildroot@buildroot.org>; Mon,  9 Oct 2023 16:18:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A39EE4191C
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-9b29186e20aso808992466b.2
 for <buildroot@buildroot.org>; Mon, 09 Oct 2023 09:18:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696868305; x=1697473105;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tHj9kzxoiOt23ZTj96eLovWUaZVxwiWYKu3gW8GnPzI=;
 b=w2Gf8jTVXm29PGinOjXddsCXdKaOdgsuwL9blWXVdbKjyP29r8f8wJjC0bafLxyKbn
 Gb9FqCyV3VPUVcwSKb1Sou3EG7Mb+kJJW9CE10Q+V0fxZisbFm0aVZhm80ysN16rdk/9
 drhrVYoc6iBg3gKo2amMJExmKgkSckhb7ky6ryMu3mqM2eafpQbsP4LPEvXUo89f9KFE
 goxmUkTUIukFbiCqBV8liVBvdrFpofBbXMdgqgowLJ6uwGWqWwM3Q7OJYMHVZgNbMcsP
 ql5hS013O+PJN9ElHQ8y9rWbjteb6nJt5egbESUxRF5sfqPyWTHcR49LzDjyiBQJwQP4
 leCA==
X-Gm-Message-State: AOJu0YzrVuG82MiJGd2fPQA+eC5iND+B+cmc/41+/ZCsiRBhEZQ+WNON
 tefjD3vOB+oZDTV5G5OlOYFCpjWUCPVeC6oApDvcAg==
X-Google-Smtp-Source: AGHT+IFy1P7h39oWqdHqZ5LOBL+IFxc0eH/OwE1qzMG/psPP+8qOa61uGysrAs3zx3M5M8zozpRkOA==
X-Received: by 2002:a17:906:31c7:b0:9ae:673a:88c8 with SMTP id
 f7-20020a17090631c700b009ae673a88c8mr14543671ejf.21.1696868305412; 
 Mon, 09 Oct 2023 09:18:25 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6467:4426:3fb7:fc38:9be:dc4c])
 by smtp.gmail.com with ESMTPSA id
 n17-20020a170906379100b009b957d5237asm6859583ejc.80.2023.10.09.09.18.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 09:18:25 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon,  9 Oct 2023 18:18:17 +0200
Message-ID: <20231009161817.2832969-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1696868305; x=1697473105;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tHj9kzxoiOt23ZTj96eLovWUaZVxwiWYKu3gW8GnPzI=;
 b=GB8sconPn7x9IEOXhC3UIQuC0fXSUEsrd4r/Yv9BBTiv9ZoDEQm2Sz61kWq0zaJoEw
 4HrTAOX7WiJsKR1ZwL+V4N/CROLff7AI/ZA87qMzI8sWGjyl22Mk7begjUBmk2VfJxM2
 RhIzhNzfxfja4luDr6tYo5leCZ+YbwaMSzBkk=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=GB8sconP
Subject: [Buildroot] [PATCH 1/1] package/pkg-generic: Auto-install selinux
 modules only for upstream refpolicy
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The description of REFPOLICY_CUSTOM_GIT states:

The custom refpolicy must define the full policy explicitly,
and must be a fork of the original refpolicy, to have the
same build system.  When this is selected, only the custom
policy definition are taken into account and all the modules
of the policy are built into the binary policy.

Currently, if a user definess their own policy, a package containing a selinux
directory would add to their custom policy, which is not what they would want.
Disable applying selinux policies in selinux/ directories for custom git
refpolicies.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/pkg-generic.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 6e944dd6b7..28595a105c 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -1237,8 +1237,11 @@ KEEP_PYTHON_PY_FILES += $$($(2)_KEEP_PY_FILES)
 ifneq ($$($(2)_SELINUX_MODULES),)
 PACKAGES_SELINUX_MODULES += $$($(2)_SELINUX_MODULES)
 endif
+
+ifeq ($(BR2_PACKAGE_REFPOLICY_UPSTREAM_VERSION),y)
 PACKAGES_SELINUX_EXTRA_MODULES_DIRS += \
 	$$(if $$(wildcard $$($(2)_PKGDIR)/selinux),$$($(2)_PKGDIR)/selinux)
+endif
 
 ifeq ($$($(2)_SITE_METHOD),svn)
 DL_TOOLS_DEPENDENCIES += svn
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
