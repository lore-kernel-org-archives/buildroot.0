Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CA42C61DA4
	for <buildroot@archiver.kernel.org>; Thu,  9 Feb 2023 23:15:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E20B418A7;
	Thu,  9 Feb 2023 23:15:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E20B418A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tJqw0CBdrN9X; Thu,  9 Feb 2023 23:15:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 278754180D;
	Thu,  9 Feb 2023 23:15:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 278754180D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EC77B1BF842
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 23:15:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C61E94180D
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 23:15:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C61E94180D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EdproeTnB_AE for <buildroot@lists.busybox.net>;
 Thu,  9 Feb 2023 23:15:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC8A5417A9
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EC8A5417A9
 for <buildroot@buildroot.org>; Thu,  9 Feb 2023 23:15:32 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id n2so2618656pgb.2
 for <buildroot@buildroot.org>; Thu, 09 Feb 2023 15:15:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7vABbMRfwqF9rp+uPeyv4Gtvn9PwUunBYUSjL30ctfQ=;
 b=QyxgR4R/T2/Zdoh2zDqv0aweimmWCtf9x+LRFZ7P1uuUtdnoS+XJqAqnvekahAs57y
 if0d021ziuHQJ5aP2EtWktSK9memzbWVKn/qzpj1DddVyYysFn1wXX4IXHUsl0GyBUA7
 yUwURBBZ8jkuNnXJGwOOZw9IqVnXekMwrCTbZfLrZ4t5JSKxkEGEyqmzOtpSw2uWENgF
 PYqgAgJjcA9FVIkLeSdUAJoOFiJDxUDU5AJPT35vFtM7fdR4hGRhmycNtf+/42D7yRIt
 Sab4qeVzfTDLFVpeHxQb0JB46DLI9Uoep3ijCmEZM6GW21dEGJYGE0Bh/T3sxM59FwDz
 wnBQ==
X-Gm-Message-State: AO0yUKVEyEyqf+EMGJ7qIoiVOblH9kJNzQlSMWhumVzgKb68Sq/ewaKA
 n6VzvOm9+Mm8C+ZjTPc/SDwZUfYst7E=
X-Google-Smtp-Source: AK7set/ibvnqEuz5r3RFxCb49ERaZf6SEJf4ke5c05r5CriQTGuUtT6BCQF71aQ6LwdUz/6rSYISFA==
X-Received: by 2002:aa7:9d07:0:b0:5a8:52d5:3bc8 with SMTP id
 k7-20020aa79d07000000b005a852d53bc8mr3519651pfp.4.1675984531839; 
 Thu, 09 Feb 2023 15:15:31 -0800 (PST)
Received: from localhost.localdomain ([12.125.190.90])
 by smtp.gmail.com with ESMTPSA id
 c4-20020aa781c4000000b005905d2fe760sm1970067pfn.155.2023.02.09.15.15.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 09 Feb 2023 15:15:31 -0800 (PST)
From: ckhardin@gmail.com
To: buildroot@buildroot.org
Date: Thu,  9 Feb 2023 15:15:16 -0800
Message-Id: <20230209231518.9458-2-ckhardin@gmail.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20230209231518.9458-1-ckhardin@gmail.com>
References: <20230209231518.9458-1-ckhardin@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7vABbMRfwqF9rp+uPeyv4Gtvn9PwUunBYUSjL30ctfQ=;
 b=jTkDz4uRf8ofiL2EV9w4+DzZ2zLEG8K+laCWSC+6h+nUOg4lyTgEO/SLPC5K6UnsBG
 MeYxpFQMCnk6W5BRmbV9hTFzdi3tNUbHh8q6A6hr2CEPVJ02CKNP0BwvYhcJaMAU3Ljz
 wBf/PoGO4ZCQTeSrfOdQNfZjJ8H0w24UUtVJ3LzZYh4pUeJp5zItDSPNZCz/ciV52BUC
 45RYfKtfbCtcuDKQSSLQ2zQCYYRitWWf+rxXrVBqxRgN9f1cfUvn7yRa0YaqRH3qmQJh
 XNHW4oafJyGkU6glRpGMujWnxj/avAwZbRajLiJ7/eodLDgwxx4no9Ue6LZKVw6YUL7V
 tUFw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=jTkDz4uR
Subject: [Buildroot] [PATCH 2/4] boot/uboot: create a scmversion file based
 on the custom repo variables
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
Cc: Charles Hardin <ckhardin@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Charles Hardin <ckhardin@gmail.com>

When using the custom repositories, the archive creation will
omit the source history to get reproducible hashes. This has
the side effect of making the setlocalversion scripts within the
builds to not create the tracking information as expected. So,
just generate a .scmversion so that kernels will be labelled
with where buildroot referenced them.

Example (line wrapped)

    #define PLAIN_VERSION "2018.03-repo-version-" \
                          "d72b9d0908364a64718b652b75e4cac9b85cf0c3"

Signed-off-by: Charles Hardin <ckhardin@gmail.com>
---
 boot/uboot/uboot.mk | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 4eae8e95c3..d735b47326 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -526,12 +526,25 @@ endif # BR2_TARGET_UBOOT_CUSTOM_TARBALL
 ifeq ($(BR2_TARGET_UBOOT_CUSTOM_GIT)$(BR2_TARGET_UBOOT_CUSTOM_HG),y)
 ifeq ($(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_REPO_URL)),)
 $(error No custom U-Boot repository URL specified. Check your BR2_TARGET_UBOOT_CUSTOM_REPO_URL setting)
-endif # qstrip BR2_TARGET_UBOOT_CUSTOM_CUSTOM_REPO_URL
+endif # qstrip BR2_TARGET_UBOOT_CUSTOM_REPO_URL
 ifeq ($(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION)),)
 $(error No custom U-Boot repository version specified. Check your BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION setting)
-endif # qstrip BR2_TARGET_UBOOT_CUSTOM_CUSTOM_REPO_VERSION
+endif # qstrip BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION
 endif # BR2_TARGET_UBOOT_CUSTOM_GIT || BR2_TARGET_UBOOT_CUSTOM_HG
 
+# Create a custom scm version file to reflect the source version since the
+# archive will omit source directories like .git to maintain reproducible
+# hashes for the archives
+UBOOT_CUSTOM_REPO_SCMVERSION = \
+	"-repo-version-$(call qstrip,$(BR2_UBOOT_TARGET_CUSTOM_REPO_VERSION))"
+define UBOOT_CUSTOM_REPO_SCMVERSION_HOOK
+	(cd $(@D); \
+		if [ ! -f .scmversion ]; then \
+			echo $(UBOOT_CUSTOM_REPO_SCMVERSION) > .scmversion; \
+		fi)
+endef
+
+UBOOT_POST_EXTRACT_HOOKS += UBOOT_CUSTOM_REPO_SCMVERSION_HOOK
 endif # BR2_TARGET_UBOOT && BR_BUILDING
 
 ifeq ($(BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY),y)
-- 
2.37.1 (Apple Git-137.1)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
