Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A597C433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 20:47:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 063F360F43
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 20:47:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 063F360F43
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C48EC818E8;
	Sun, 12 Sep 2021 20:47:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2Wbu0oouFUNm; Sun, 12 Sep 2021 20:47:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3583D8188B;
	Sun, 12 Sep 2021 20:47:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5A2541BF2B4
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 20:47:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 44CB78188B
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 20:47:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Un_6lJFD5xlC for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 20:47:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ADD8481886
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 20:47:46 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id j18so9447812ioj.8
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 13:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Dx2HFG0W5N97yf/LMTBLPENiJZVyJ1Qw3vi9FAXgySg=;
 b=YXNpol3dug7naTbQIHtSBJZHOpojhdIkeXv/pADnuICtIN6dp/avgfpmq1C8U2gPC4
 V8StIPXYPArbecBJAVw+FGdAai/Mi6pulO9m4/zrqiOcSl4sUEWQpVy7V4uVaTP4JRwX
 SKOfq+HeXkf2t/TS0UxMGdwAW37Ng7XiZ/dXxqOWGjeTwbeHbkyYu5Zu0C+oeCbGEdoA
 QpLD3k/iXtoOYb2A4A6XXthI6onNxgldJBilBoQMUC7xewzWg9x3yyJxNoU1Jj8fHpBl
 4p8mYDCHHwdKOmYihWSPNpQUiuOYe5oINqzt7C7LV1wFsGBKz6jGO2eHWB12l1QIyWFj
 c9oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Dx2HFG0W5N97yf/LMTBLPENiJZVyJ1Qw3vi9FAXgySg=;
 b=QrkdqCVyhiUjgdltxDvkR2tyW8Qhgb/6ssNhEfKRpOUXXINUyJAtf96RdOxWTw+aPO
 i18P5WqGOEEiPL6V36CLd0Od3vSh2JAd2YYEVx4QTkHpCwIzhQCVxIMdRGH96Vog1b6t
 4+UBUsaYFXqwGQjrRaRJBD/Fg48/VWBSLIuKo2rEpnQVu8IiummcQlGneblLc3cmzTVu
 CnoX8eWtCBbc1CUCuIIiITG7zgeW90dnCopTaBexuEy6+44RlF7qor8Yn0+4NrrY7XnL
 xxo6EPcDLbCjTU0aSrGAWpm2HkG9rw9XAgjx0wTkQZ9MupE4nzkbriLQe+WuwCTPi5/5
 D8AA==
X-Gm-Message-State: AOAM533X1vBI0d1UA0ahO7vLZ/NxavJhxEhG1hfQEuD3XebsUTVuzhCJ
 jPbBEa/dk/CISoWkOgQX7Is7V6TjwBw=
X-Google-Smtp-Source: ABdhPJyPDqhK5vzVZ6H3KfvJXYvyQyZ+MZm6os4xhJmUIVx1V08WQtPo2/Mdb8yRq6s3qR4J6G71Bw==
X-Received: by 2002:a5d:9e0f:: with SMTP id h15mr6039078ioh.133.1631479665469; 
 Sun, 12 Sep 2021 13:47:45 -0700 (PDT)
Received: from james-x399.localdomain (97-118-233-80.hlrn.qwest.net.
 [97.118.233.80])
 by smtp.gmail.com with ESMTPSA id s18sm3452585iov.53.2021.09.12.13.47.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 13:47:45 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 12 Sep 2021 14:47:41 -0600
Message-Id: <20210912204741.995864-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/pipewire: add option to enable
 media-session support
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

The example media-session pipewire session manager requires
pipewire to be built with examples enabled, add support for
enabling this while depending on examples being enabled.

To simplify adding support for additional session managers in
the future such as wireplumber we pass a comma separated list
to the -Dsession-managers meson config option. This also will
ensure that systemd services that depend on media-session are
only installed if media-session support is enabled.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/pipewire/Config.in   | 6 ++++++
 package/pipewire/pipewire.mk | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/package/pipewire/Config.in b/package/pipewire/Config.in
index b15bbfa8d3..506b85e856 100644
--- a/package/pipewire/Config.in
+++ b/package/pipewire/Config.in
@@ -19,6 +19,12 @@ config BR2_PACKAGE_PIPEWIRE_EXAMPLES
 	help
 	  Build pipewire examples
 
+config BR2_PACKAGE_PIPEWIRE_MEDIA_SESSION
+	bool "pipewire media-session"
+	depends on BR2_PACKAGE_PIPEWIRE_EXAMPLES
+	help
+	  Build pipewire media-session support
+
 config BR2_PACKAGE_PIPEWIRE_GSTREAMER
 	bool "pipewire gstreamer plugins"
 	depends on BR2_USE_WCHAR # libglib2
diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
index e4ea60c39c..f4f7f487cb 100644
--- a/package/pipewire/pipewire.mk
+++ b/package/pipewire/pipewire.mk
@@ -150,4 +150,10 @@ else
 PIPEWIRE_CONF_OPTS += -Decho-cancel-webrtc=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_PIPEWIRE_MEDIA_SESSION),y)
+PIPEWIRE_SESSION_MANAGERS_LIST = media-session
+endif
+
+PIPEWIRE_CONF_OPTS += -Dsession-managers='$(subst $(space),$(comma),$(PIPEWIRE_SESSION_MANAGERS_LIST))'
+
 $(eval $(meson-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
