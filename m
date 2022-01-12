Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F213CC433F5
	for <buildroot@archiver.kernel.org>; Wed, 12 Jan 2022 10:10:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9B0E540986;
	Wed, 12 Jan 2022 10:10:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M0TFszOAjrbO; Wed, 12 Jan 2022 10:10:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 99CB94096E;
	Wed, 12 Jan 2022 10:10:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 00B221BF831
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 10:10:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F083D83F13
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 10:10:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id skRUiMhuPwsl for <buildroot@lists.busybox.net>;
 Wed, 12 Jan 2022 10:10:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 411DC83F10
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 10:10:45 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id r28so3260815wrc.3
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 02:10:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Sn5jGmi/Mxy3vJV4MFQoxshGL0W18/QEpOl+fVITF5U=;
 b=eW4xwNE8UW9kgHB93nSeoGTPjmRL+UiAOMh6C9R3cmhEdDFrbZPDqK6eqgF+4D7wAZ
 ArXpyJ8L5aM4wUwAXUfvIlrWh6XfPPrSn3jrbihn6bO+DqkAygflI9jqMJYtRwZlfkD1
 ps1/JD9fB5HPiNnb3PUUVts4IQ3ggr46vSrN3Fcgm/eWrmX7Fog3eEYCfya5llMd8VC7
 4ikEEaLDPH9oL9fXkCps1qbi5bRlAPSvjuMPYU4REwQSrWy+v0NJ6aNjYh3TsNRq1biA
 g+AICsfay9Ep2A8CqTMPsL3Ca3yhAIcoxfUx41P90PGtKUe57XGB79OXEbcE7rWuSw/z
 crXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Sn5jGmi/Mxy3vJV4MFQoxshGL0W18/QEpOl+fVITF5U=;
 b=xK5PnnBZqbSrFfzFB5Z6ezNjw4uqx8DpyizN7WCN3XNQQJK1BQ0pUzfjGKeNoTgEGD
 3nAOltcruD/pjfUcCgDc/qzr6gQFWsZIamFqJlPCsRYIAgT9j6ZgJqQPcop/dFXEyHGY
 H+rqze1ikXQfxqStISljBbAUETLiE+7be39GP05b++yaF63THITt01kdPEgLxFxLHWlu
 Vxgc1I7HqGX9nOh2N8qJfaEFahiMMoDEjHJhE6azNrYrJdf2F7LkSEsX2oAwvHOEDcEo
 14UumsVUemEmqpYSBAgvjUGnWYe6zM2nLQQAhSgBW8k4HbKdI9XEe4ykWvDkPz7FlvNz
 pdFw==
X-Gm-Message-State: AOAM530NmXMpWrXmlax7tQpkf3Fh6RqY7EthVyIc3ThZ+YYO8nOxanp3
 kdAchh17dKDM9ecWF4G9W8XOlczMN+QPDg==
X-Google-Smtp-Source: ABdhPJyMNQzXBnHIkuu67m7dTGRD99+0DqN8x9hfTFJXApHy84hTPdPBikc7zF5A9Eqd43/0tESYpw==
X-Received: by 2002:a5d:59a9:: with SMTP id p9mr7818732wrr.251.1641982243529; 
 Wed, 12 Jan 2022 02:10:43 -0800 (PST)
Received: from debian-noppl.. (62-178-205-20.cable.dynamic.surfer.at.
 [62.178.205.20])
 by smtp.gmail.com with ESMTPSA id m17sm4113669wmq.31.2022.01.12.02.10.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 02:10:43 -0800 (PST)
From: Norbert Lange <nolange79@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 12 Jan 2022 11:10:20 +0100
Message-Id: <20220112101021.456463-1-nolange79@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] system/skeleton: provide run/lock directory
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
Cc: Norbert Lange <nolange79@gmail.com>, thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

We changed the skeletons in bf01e51f3c, so that var/lock
points to run/lock. This resulted in build failures as
some packages want to work with these paths.

-   Create run/lock, the run directory will be purged
    later anyway (since 5e78e7e97d).
-   for init == systemd, create the var/lock symlink early
    to prevent packages creating this path as directory.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/skeleton-init-systemd/skeleton-init-systemd.mk | 2 ++
 system/skeleton/run/{ => lock}/.empty                  | 0
 2 files changed, 2 insertions(+)
 rename system/skeleton/run/{ => lock}/.empty (100%)

diff --git a/package/skeleton-init-systemd/skeleton-init-systemd.mk b/package/skeleton-init-systemd/skeleton-init-systemd.mk
index 1e212cc2f7..795a171809 100644
--- a/package/skeleton-init-systemd/skeleton-init-systemd.mk
+++ b/package/skeleton-init-systemd/skeleton-init-systemd.mk
@@ -62,6 +62,8 @@ define SKELETON_INIT_SYSTEMD_INSTALL_TARGET_CMDS
 	mkdir -p $(TARGET_DIR)/srv
 	mkdir -p $(TARGET_DIR)/var
 	ln -s ../run $(TARGET_DIR)/var/run
+	# prevent install scripts to create var/lock as directory
+	ln -s ../run/lock $(TARGET_DIR)/var/lock
 	install -D -m644 $(SKELETON_INIT_SYSTEMD_PKGDIR)/legacy.conf $(TARGET_DIR)/usr/lib/tmpfiles.d/legacy.conf
 	$(SKELETON_INIT_SYSTEMD_ROOT_RO_OR_RW)
 endef
diff --git a/system/skeleton/run/.empty b/system/skeleton/run/lock/.empty
similarity index 100%
rename from system/skeleton/run/.empty
rename to system/skeleton/run/lock/.empty
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
