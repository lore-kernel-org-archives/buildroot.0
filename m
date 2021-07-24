Return-Path: <SRS0=+dJA=MQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A6F8C4338F
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 21:19:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C023360E92
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 21:19:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C023360E92
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C4238339C;
	Sat, 24 Jul 2021 21:19:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZZog9oK9O1ns; Sat, 24 Jul 2021 21:19:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC07683381;
	Sat, 24 Jul 2021 21:19:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5CA4A1BF2AA
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 21:19:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4BF3A401BB
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 21:19:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fYP9SCphh6cK for <buildroot@lists.busybox.net>;
 Sat, 24 Jul 2021 21:19:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 519C5401B3
 for <buildroot@buildroot.org>; Sat, 24 Jul 2021 21:19:27 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id n21so2875061wmq.5
 for <buildroot@buildroot.org>; Sat, 24 Jul 2021 14:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X3P0u3D9pFRqxq9ZvCO6RfxxT2OhaL4MSbiYpdc/tds=;
 b=n/huT8/hoxiLrBCP9Y4QEuJr4wq7Z+0OqV3qadXdliZBHHsGTLRJVMK65vF7xbGb3C
 Cu9ePomd8uftvAtQxeT3EY8y8R0cacizD6DOlzRJC+f4ThtM3rthseMLT5Yzc2bYkWcv
 zbA6qMA5OAB7VkxLzlAm6/he5SwTUiETAoTVJ4nSTipPqoteKkgejhpNrq4+he+MLFky
 mZmQG/7FriiieA40APDp/MdkV3cqTfxJeXGx5qm1dOyXyNvOTXR9yav1pBii0c1IoVJh
 pJY0EC1WwWdU7HheRO8mwRjcMt6hUlThimJ2s7/+PyNmqfRcC9e0dKDkWgvuiT9K2/Ps
 q4uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=X3P0u3D9pFRqxq9ZvCO6RfxxT2OhaL4MSbiYpdc/tds=;
 b=kwL3dD4Dyc3DNkYVi7At/Q/XtCA2x5EpQmNt2VfsBRJQOZ4Hsiztt/MQacNC/tQesv
 OW8olDeKccPbtA2Lw0l+C+hPKIGB70sFrRp94s1vSwPi4W7A27bPtqO+yQs7b9Xl/TM3
 eeVSH4L/pNS33uBBgnq7l7d1lYx6nWWV2GHefORK5uXnwld7pyhLJhu8LrQgudJMT3Wj
 BG8tRNFvYWb2YkHqGGrTaF4eoHHvolbAXMeTqseb3J5bh0z2gjZsLSiAZtOs7lUDTDOv
 KKh3Kw5YwHcLzvxlvBRbe/6oroi+CjdtfALWczJ9bu4A1wNGIx+HNyRXu6HW4R8Hp+1k
 L1mg==
X-Gm-Message-State: AOAM533HycNMTiBDDYmL7f0ART2LUK1hZDTuCxXzjb1xH+sPAQ+lDOFM
 AY9OnKjwIyMZhaX1wucQYeeVxSM3rgc=
X-Google-Smtp-Source: ABdhPJwgIlb7wRXwYkYHL5ZxWU0l/PJCb3lB5MvB8F/yu52pQyQVGBrHYfivv0vp41+nzJSQDfZOQw==
X-Received: by 2002:a7b:c5c7:: with SMTP id n7mr5943677wmk.5.1627161565531;
 Sat, 24 Jul 2021 14:19:25 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8b51:cb00:4802:7ee4:40b0:1519])
 by smtp.gmail.com with ESMTPSA id o5sm8469908wms.43.2021.07.24.14.19.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Jul 2021 14:19:25 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 24 Jul 2021 23:19:21 +0200
Message-Id: <44391e27e560d7d2de2a444577d867920d4c35a5.1627161553.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1627161553.git.yann.morin.1998@free.fr>
References: <cover.1627161553.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/4] package/pkg-kconfig: generate generic help
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
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Currently, as Thomas pointed out [0], the help for kconfig packages is
not consistently used and handled by the different packages.

This commit introduces a generic help text for kconfig packages, that is
based on what the package declares:

  - the list of kconfig editors it supports;

  - whether it is possible to save back the configuration (impossible if
    the package uses an in-tree defconfig file);

  - whether the package actually supports (loading and saving) defconfig
    files, by introducing a new variable a package can set if it does
    not (only busybox is known to be in that case).

That new help helper is only used if the package does not already define
its own help, to be consistent with what we do for other _CMDS.

[0] http://lists.busybox.net/pipermail/buildroot/2021-July/313570.html

Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
---
 docs/manual/adding-packages-kconfig.txt |  3 +++
 package/pkg-kconfig.mk                  | 24 ++++++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/docs/manual/adding-packages-kconfig.txt b/docs/manual/adding-packages-kconfig.txt
index 8f40ea6099..a35681775f 100644
--- a/docs/manual/adding-packages-kconfig.txt
+++ b/docs/manual/adding-packages-kconfig.txt
@@ -91,3 +91,6 @@ be set to suit the needs of the package under consideration:
 * +FOO_KCONFIG_DEPENDENCIES+: the list of packages (most probably, host
   packages) that need to be built before this package's kconfig is
   interpreted. Seldom used. By default, empty.
+
+* +FOO_KCONFIG_SUPPORTS_DEFCONFIG+: whether the package's kconfig system
+  supports using defconfig files; few packages do not. By default, 'YES'.
diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index 49074f9220..715c3e04ec 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -85,11 +85,35 @@ $(2)_KCONFIG_OPTS ?=
 $(2)_KCONFIG_FIXUP_CMDS ?=
 $(2)_KCONFIG_FRAGMENT_FILES ?=
 $(2)_KCONFIG_DOTCONFIG ?= .config
+$(2)_KCONFIG_SUPPORTS_DEFCONFIG ?= YES
 
 # Register the kconfig dependencies as regular dependencies, so that
 # they are also accounted for in the generated graphs.
 $(2)_DEPENDENCIES += $$($(2)_KCONFIG_DEPENDENCIES)
 
+# Generate the kconfig-related help: one entry for each editor.
+# Additionally, if the package is *not* using an in-tree defconfig
+# name, an entry for updating the package configuration file.
+ifndef $(2)_HELP_CMDS
+define $(2)_HELP_CMDS
+	$$(foreach editor, $$($(2)_KCONFIG_EDITORS), \
+		@printf '  %-22s - Run %s %s\n' $(1)-$$(editor) $(1) $$(editor)
+	)
+	$$(if $$($(2)_KCONFIG_DEFCONFIG),,\
+		$$(if $$(filter YES,$$($(2)_KCONFIG_SUPPORTS_DEFCONFIG)),\
+			@printf '  %-22s - Save the %s configuration as a defconfig file\n' \
+				$(1)-update-defconfig $(1)
+			@printf '  %-22s     to %s\n' '' $$($(2)_KCONFIG_FILE)
+			@printf '  %-22s     (or override with %s_KCONFIG_FILE)\n' '' $(2)
+		)
+		@printf '  %-22s - Save the %s configuration as a full .config file\n' \
+			$(1)-update-config $(1)
+		@printf '  %-22s     to %s\n' '' $$($(2)_KCONFIG_FILE)
+		@printf '  %-22s     (or override with %s_KCONFIG_FILE)\n' '' $(2)
+	)
+endef
+endif
+
 # Call the generic package infrastructure to generate the necessary
 # make targets.
 # Note: this must be done _before_ attempting to use $$($(2)_DIR) in a
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
