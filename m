Return-Path: <SRS0=q2PD=MN=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55FC8C07E9B
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 06:45:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A49F61001
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 06:45:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A49F61001
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2BBF40299;
	Wed, 21 Jul 2021 06:45:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 50LJWgSW30s4; Wed, 21 Jul 2021 06:45:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9F184029B;
	Wed, 21 Jul 2021 06:45:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8E3B91BF5A5
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 06:45:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7CF0F4029B
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 06:45:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nsER4lfkQjnO for <buildroot@lists.busybox.net>;
 Wed, 21 Jul 2021 06:45:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8BDA140299
 for <buildroot@buildroot.org>; Wed, 21 Jul 2021 06:45:25 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 o30-20020a05600c511eb029022e0571d1a0so326504wms.5
 for <buildroot@buildroot.org>; Tue, 20 Jul 2021 23:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=49vaIRX0EQE7svjgP0hTIDZuZjNvuR09FK8dRLnZCF8=;
 b=JNYG5BPtUJZz4kDeB1GW9OAqI1LzsBZPjtwKMswGKkx+9aI34Qb7lMcsgOJ33Y4m8x
 7EnSw37XV27p/5dLrEGwCDX6vSyQgFkan5DJEbP/H6Ryy1eIWU2nhviT9jN5zNOQwnYp
 NgGjt8C52pLNpmA0vo3VQseuDisH1ZdG6yPp9AXsx1KJrxrJQBuuZUAWkvoaAl9hGCAO
 LcmGMV9uea3v8SSs8Yyp43pxIir3HcI0taAJLo1vkJePuSoV5j25jYEW+VH1/nuE6evy
 dbM9B7FzCzJKAAhS/gRCLa8DgL6AUTIiNEtH83Y6Bomb3glS0gJtvEVT+TYlWbQ+W7cr
 aiiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=49vaIRX0EQE7svjgP0hTIDZuZjNvuR09FK8dRLnZCF8=;
 b=TNM25NtzdRT/bTFrZ0sU+otG3W33rNwpzym7TPunty2IzXW1CVM7eleOxJZt1+gGUF
 hfpj7mRluqqANOAOXCEuvkcR2bejywCdQwfxiwpcCtgaLmMlK5C7e5rkDEEdrAvjr8Mr
 OjYE734EA8ZB5nsQm5ScPHzSwcj6xcRp+HOCazIJVPcsHjQvf+myf+C4ThvirpoBAzTE
 8e25T42l+CTRQPNYK2sM2h93wSXf1+6Kse8hiKPHwKdOqZ1TDhUk1t4KTvCYvIg/Zm3O
 apgNC9kbjtzgWCqZuLqsPSSsxWZjRlo6eD6Rxq2V8wZaY7fc5r+ZMRors16wxK2gB6XT
 GAFA==
X-Gm-Message-State: AOAM5329/AqmBqAju+6gB81Yivg/636u2LbMcR02GfB0ExlLtPAW58oE
 HaFDpzoJSZxzzXR1tbHQPlxdPUbWxHsQuQ==
X-Google-Smtp-Source: ABdhPJyLE9NbRlXVdO0m05soQVyZnAUg2lO52AIZpv2CY3GPa/DIao5czVVidK4+HQZZjNC8DDUfzw==
X-Received: by 2002:a1c:7407:: with SMTP id p7mr34592856wmc.111.1626849922974; 
 Tue, 20 Jul 2021 23:45:22 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id k24sm26938371wrh.30.2021.07.20.23.45.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 23:45:22 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 21 Jul 2021 08:45:13 +0200
Message-Id: <20210721064514.440851-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/bird: add rpki support
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
Cc: =?UTF-8?q?Adrien=20Gallou=C3=ABt?= <adrien@gallouet.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

rpki support optionally depends on libssh

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/bird/Config.in | 5 +++++
 package/bird/bird.mk   | 8 ++++++++
 2 files changed, 13 insertions(+)

diff --git a/package/bird/Config.in b/package/bird/Config.in
index e78dfdf90f..866fc65617 100644
--- a/package/bird/Config.in
+++ b/package/bird/Config.in
@@ -73,6 +73,11 @@ config BR2_PACKAGE_BIRD_RIP
 	help
 	  Enable RIP protocol.
 
+config BR2_PACKAGE_BIRD_RPKI
+	bool "rpki"
+	help
+	  Enable RPKI protocol.
+
 config BR2_PACKAGE_BIRD_STATIC
 	bool "static"
 	help
diff --git a/package/bird/bird.mk b/package/bird/bird.mk
index 4d4dfe1dca..4d6159b075 100644
--- a/package/bird/bird.mk
+++ b/package/bird/bird.mk
@@ -19,6 +19,13 @@ else
 BIRD_CONF_OPTS += --disable-client
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSSH),y)
+BIRD_CONF_OPTS += --enable-libssh
+BIRD_DEPENDENCIES += libssh
+else
+BIRD_CONF_OPTS += --disable-libssh
+endif
+
 BIRD_PROTOCOLS = \
 	$(if $(BR2_PACKAGE_BIRD_BFD),bfd) \
 	$(if $(BR2_PACKAGE_BIRD_BABEL),babel) \
@@ -29,6 +36,7 @@ BIRD_PROTOCOLS = \
 	$(if $(BR2_PACKAGE_BIRD_PIPE),pipe) \
 	$(if $(BR2_PACKAGE_BIRD_RADV),radv) \
 	$(if $(BR2_PACKAGE_BIRD_RIP),rip) \
+	$(if $(BR2_PACKAGE_BIRD_RPKI),rpki) \
 	$(if $(BR2_PACKAGE_BIRD_STATIC),static)
 
 BIRD_CONF_OPTS += --with-protocols=$(subst $(space),$(comma),$(strip $(BIRD_PROTOCOLS)))
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
