Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62115C4332F
	for <buildroot@archiver.kernel.org>; Sun,  1 Jan 2023 23:40:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 03087812CC;
	Sun,  1 Jan 2023 23:40:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03087812CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lDhIGk96D6Rj; Sun,  1 Jan 2023 23:40:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A8E581316;
	Sun,  1 Jan 2023 23:40:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A8E581316
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7D55A1BF38D
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 23:39:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 59543812BB
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 23:39:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59543812BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dmlHvSJES7D3 for <buildroot@lists.busybox.net>;
 Sun,  1 Jan 2023 23:39:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE1648129A
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AE1648129A
 for <buildroot@buildroot.org>; Sun,  1 Jan 2023 23:39:14 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id n8so17046277oih.0
 for <buildroot@buildroot.org>; Sun, 01 Jan 2023 15:39:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Nxh/q3RkAnZ2pCWQK5bkw4tgsDx9JcRFeJe4Z1nSYAw=;
 b=NkSAFt3/TikfRBiJkE4OFFy5jsQ9K6YF+e+aql3HYxwghzpeym9jeWXoBeC37TCwRj
 C/m+mhAyyaKFGoCVIGzmNuK043XAm57RzRmP646AkSFuHOsT0huTxJWwt2PONj/qGNUB
 XOWQxQVzA025ZvBxCufMgHvGuHRCCNqIYSVcb27eZIC0C3dVfFKKxHGbFl1dM0z7twMe
 z5RIujx9BJiJTwR5ShCHdFDge93+lP+B2x8YU5GhMUQOZpnJnyEaR9s/8W8DYKIGN8nO
 LGspPjVt1DAZLVqnz+nPgaY8VghS2xiI0CxPgVlLDfnG7j+SIAm0LhbMVCbtOcYOjiIN
 m01A==
X-Gm-Message-State: AFqh2kpcPWSHPoZBthlETC6nUszr7AG8JIi22917JwdOnf/hPWQBhg9i
 KyG//azWGbSLFm5uFmExk0apD4W7Fxw=
X-Google-Smtp-Source: AMrXdXsDkkt9ujQYdyrKkLWl2yz1cpFdHrFGzr6NKfqiQGXV4RYgeSZlGTrNVYGrMirRoQzuYQ6WFA==
X-Received: by 2002:aca:1918:0:b0:35c:560f:e2ee with SMTP id
 l24-20020aca1918000000b0035c560fe2eemr18023955oii.34.1672616353748; 
 Sun, 01 Jan 2023 15:39:13 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:7980:988a:6ae4:c2b1:7ea6:a195])
 by smtp.gmail.com with ESMTPSA id
 o189-20020aca41c6000000b00360e46a1edasm11372611oia.22.2023.01.01.15.39.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Jan 2023 15:39:12 -0800 (PST)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Jan 2023 20:36:29 -0300
Message-Id: <20230101233653.487175-6-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230101233653.487175-1-ricardo.martincoski@gmail.com>
References: <20230101233653.487175-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Nxh/q3RkAnZ2pCWQK5bkw4tgsDx9JcRFeJe4Z1nSYAw=;
 b=CsrcPmQY5yvg6XNwVDaRr8mAiMxpRcu3g5Jgw9Z0bvWqt7F8em1CUsCa8lOEY0gU0q
 MEDNZbM1aWJ+J/00PLy9lG5B2LNVFmV8zhCd2Df8l3XpU6BD2jTvbRrfOQOvecNYh4qm
 /WNy9KeJQtVlYahx1twWxIFZ0JmoX3GzaBLli3ZrH5WYGORIPhwRw/zEJAf22RQmzAVi
 EVd8EPydfGHrDfq0GwupwsX28+vw+HN9QxoPNs8tNP32dasAqTBOVbJp23DUKK3Ge9d6
 SCOXtIjBfMuTnbPEHuTEE62/yul6VoFvwi1is7gQhHj5DG+vA2KZ1yljX+Rwm8BzvZVC
 59yQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=CsrcPmQY
Subject: [Buildroot] [PATCH 05/29] package/gobject-introspection: really use
 host python for host variant
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
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit "abc110e362 package/gobject-introspection: bump to version
1.68.0" renamed the define that makes sure g-ir-tool-template uses the
host python, but forgot to update its call on pre-configure hooks.

Update it now.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
Tested using this minimal config:
 BR2_x86_i686=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_PACKAGE_PYTHON3=y
 BR2_PACKAGE_GOBJECT_INTROSPECTION=y
and these commands:
$ make host-gobject-introspection-configure
$ head -n 1 output/build/host-gobject-introspection-*/tools/g-ir-tool-template.in

Before this patch:
 #!@PYTHON_CMD@
After this patch:
 (the shebang points to the correct absolute path to output/host/bin/python3)
---
 package/gobject-introspection/gobject-introspection.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gobject-introspection/gobject-introspection.mk b/package/gobject-introspection/gobject-introspection.mk
index c8ad9b3c72..70f4addeab 100644
--- a/package/gobject-introspection/gobject-introspection.mk
+++ b/package/gobject-introspection/gobject-introspection.mk
@@ -67,7 +67,7 @@ HOST_GOBJECT_INTROSPECTION_CONF_ENV = \
 define GOBJECT_INTROSPECTION_FIX_TOOLS_PYTHON_PATH
 	$(SED) '1s%#!.*%#!$(HOST_DIR)/bin/python3%' $(@D)/tools/g-ir-tool-template.in
 endef
-HOST_GOBJECT_INTROSPECTION_PRE_CONFIGURE_HOOKS += GOBJECT_INTROSPECTION_FIX_TOOLTEMPLATE_PYTHON_PATH
+HOST_GOBJECT_INTROSPECTION_PRE_CONFIGURE_HOOKS += GOBJECT_INTROSPECTION_FIX_TOOLS_PYTHON_PATH
 
 # Perform the following:
 # - Just as above, Ensure that g-ir-tool-template.in uses the host python.
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
