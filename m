Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 767F1C433F5
	for <buildroot@archiver.kernel.org>; Mon, 16 May 2022 13:15:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36C5541843;
	Mon, 16 May 2022 13:15:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7XZp6l9AajDk; Mon, 16 May 2022 13:15:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0FC54183E;
	Mon, 16 May 2022 13:15:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BBF701BF37E
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 13:14:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A973982C8E
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 13:14:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KSm2ZopGqAcY for <buildroot@lists.busybox.net>;
 Mon, 16 May 2022 13:14:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E7F7082C9C
 for <buildroot@buildroot.org>; Mon, 16 May 2022 13:14:01 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id a5so16679304wrp.7
 for <buildroot@buildroot.org>; Mon, 16 May 2022 06:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d8X1YRBI7bQB+5/eXJ2w2e5SAArY0LcKHo8CKRhALpA=;
 b=Obs9SL+PxvRePZztE8lJ5fzblznOWEHSOPLMTC5Ujl5biCnTo3Ohe34PAtfvrQljzK
 yEQzV/OGALxshVnU4WBfF6SczNgBDnGS+BCEXsqyiWf6hKpQxMDGLxBVzvSZ1FIAMfAn
 8O7Q29qPLitYdsG0JkviTrq8Ufe76zZt72rXFKcuK1CnnYJSs6DiViJr6x+KPfsbtQHe
 o8tzORQFYbIXr6OhXpkVmE9atH1w2Cp3elC8wB2SdyxjlUs+XSiO8CP7ompyaavkipUg
 GxnemOV/ZDCWq0rhdH23bzCa2qIFM4VoUt0YQpFORTnKFmxferdVrjwz5qvfggLVPKpM
 zzPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d8X1YRBI7bQB+5/eXJ2w2e5SAArY0LcKHo8CKRhALpA=;
 b=xGTy1noaQIbqCIRsslTKKiq0cAOw6oE+slqht01hggqpHjcVjMz3POkfxr/F6Eu+fp
 T/XHi5zsfNZyvWhDkP5dMgbwvLozOHqYpuijkGmzI1OIdAN+Gu2oiPx/mJRTt2p7gkjE
 WaczF2Vt07leIkyxoqeu3B+3x8qmQpadqFsw0ktp8tVIJbcgf9v+6MoK60vbloyA82oJ
 XnWV04ptcrUuhn5d8HSkVOco7Rt9yWlmiUAM7to4UBYJHhRDl7L0gKIqnK9abQxV7PLz
 473m0jRUIJKE0i7huXH7IE+DZaYkqtAUlse/blJ1toUdEHpVnjllmdasqvY86YdMtAj+
 phVA==
X-Gm-Message-State: AOAM533MpFiOGOTgt3Q/q06nTAV6CCyzmNzEtBE7QvsXhvvbgoDI5xnd
 4R1bPfgbF/MK3v9rDEutKSG/CpEUr7w=
X-Google-Smtp-Source: ABdhPJxPgpNWbTpNuJG134HQ/iixcYFM5vCjpuJ2S25GG+iLoshFJToQChDGx0k3AcN7Smod9tQPdg==
X-Received: by 2002:a5d:6990:0:b0:20c:67c4:9f6a with SMTP id
 g16-20020a5d6990000000b0020c67c49f6amr14370316wru.46.1652706839765; 
 Mon, 16 May 2022 06:13:59 -0700 (PDT)
Received: from shrek2.. (lmontsouris-659-1-42-116.w92-154.abo.wanadoo.fr.
 [92.154.77.116]) by smtp.gmail.com with ESMTPSA id
 ay41-20020a05600c1e2900b003942a244f51sm13023789wmb.42.2022.05.16.06.13.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 06:13:59 -0700 (PDT)
From: Johan Oudinet <johan.oudinet@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 16 May 2022 15:13:22 +0200
Message-Id: <20220516131334.1910858-9-johan.oudinet@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220516131334.1910858-1-johan.oudinet@gmail.com>
References: <20220516131334.1910858-1-johan.oudinet@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 08/20] package/erlang-p1-xmpp: bump version to
 1.5.6
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
Cc: Johan Oudinet <johan.oudinet@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/erlang-p1-xmpp/Config.in           | 1 +
 package/erlang-p1-xmpp/erlang-p1-xmpp.hash | 2 +-
 package/erlang-p1-xmpp/erlang-p1-xmpp.mk   | 2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/erlang-p1-xmpp/Config.in b/package/erlang-p1-xmpp/Config.in
index 6e40fed10a..c67dc832b7 100644
--- a/package/erlang-p1-xmpp/Config.in
+++ b/package/erlang-p1-xmpp/Config.in
@@ -4,6 +4,7 @@ comment "erlang-p1-xmpp needs a toolchain w/ C++"
 config BR2_PACKAGE_ERLANG_P1_XMPP
 	bool "erlang-p1-xmpp"
 	depends on BR2_INSTALL_LIBSTDCPP # erlang-p1-stringprep
+	select BR2_PACKAGE_ERLANG_IDNA
 	select BR2_PACKAGE_ERLANG_P1_XML
 	select BR2_PACKAGE_ERLANG_P1_STRINGPREP
 	select BR2_PACKAGE_ERLANG_P1_TLS
diff --git a/package/erlang-p1-xmpp/erlang-p1-xmpp.hash b/package/erlang-p1-xmpp/erlang-p1-xmpp.hash
index d0a761fcac..fce23c09c6 100644
--- a/package/erlang-p1-xmpp/erlang-p1-xmpp.hash
+++ b/package/erlang-p1-xmpp/erlang-p1-xmpp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  65c73ffaf8faab5d6fc7d42ada0b5a380f20f3e46056ad98614d81922322d9a2  erlang-p1-xmpp-1.4.10.tar.gz
+sha256  bde03ad371aad3e171ebe94a5b3b84daa4b8dd7ee37e9979ff373cd65370e725  erlang-p1-xmpp-1.5.6.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/erlang-p1-xmpp/erlang-p1-xmpp.mk b/package/erlang-p1-xmpp/erlang-p1-xmpp.mk
index f903cb945d..fc63b5ffc2 100644
--- a/package/erlang-p1-xmpp/erlang-p1-xmpp.mk
+++ b/package/erlang-p1-xmpp/erlang-p1-xmpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_XMPP_VERSION = 1.4.10
+ERLANG_P1_XMPP_VERSION = 1.5.6
 ERLANG_P1_XMPP_SITE = $(call github,processone,xmpp,$(ERLANG_P1_XMPP_VERSION))
 ERLANG_P1_XMPP_LICENSE = Apache-2.0
 ERLANG_P1_XMPP_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
