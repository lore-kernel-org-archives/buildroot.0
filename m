Return-Path: <SRS0=AA6u=N6=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98677C433EF
	for <buildroot@archiver.kernel.org>; Wed,  8 Sep 2021 06:32:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 086E361176
	for <buildroot@archiver.kernel.org>; Wed,  8 Sep 2021 06:32:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 086E361176
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9499E60670;
	Wed,  8 Sep 2021 06:32:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AIfW6KVCe_aG; Wed,  8 Sep 2021 06:32:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F04E160657;
	Wed,  8 Sep 2021 06:31:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 49F9C1BF94D
 for <buildroot@lists.busybox.net>; Wed,  8 Sep 2021 06:31:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3486040250
 for <buildroot@lists.busybox.net>; Wed,  8 Sep 2021 06:31:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qsCjih7mIq3R for <buildroot@lists.busybox.net>;
 Wed,  8 Sep 2021 06:31:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2C1484021E
 for <buildroot@buildroot.org>; Wed,  8 Sep 2021 06:31:57 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id n5so1459805wro.12
 for <buildroot@buildroot.org>; Tue, 07 Sep 2021 23:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=esRQNu+FKTrDhPXROFZcQLnF2GCd1vL5vdlGF47Tkx0=;
 b=PqF5VP0AKFXyiSa6vNBNO+k78r6URW32wfGB7IGo8cpMv6r0Vn0axi6gqGPw68Afg6
 s44XkTxulLAKNZ5rbPRLcUlUQX4SKHcWF5/7d4y/9LX2T7a4hNH9mar1D/5ZuIg2FVNi
 iKlve0w5CTpvFdxlhLb9GupQHcg0ZTeRx5za4JCXelhE8vczE95h1m3OzgywGKq9xCUp
 vgtPumPfTryy3haSgDbj9QjJUiDv26djrOzBpScr4xozTJXa/Qc2lQah9588VKNXveWA
 gqAjDj8E1poYN8c7suQWhYENMUAw+T82yO1x6plpSq8zxXp3QIeeHBAJF6c7VwtagEPz
 92oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=esRQNu+FKTrDhPXROFZcQLnF2GCd1vL5vdlGF47Tkx0=;
 b=soSPgQ8+eLiUjZi5CSNKuTI5ticXFUcsgJahOYNF7fIm0bJSR/LcQVIvsy8D6hUDfb
 8W1lxPvzLbFEnkbmnHUbEhgFzwTY9srs+AjVIs7BnCa3SIcvOna7MocWs1CUnYZ5x5dG
 1xL602J3364XU/JPcaxcSjtfEe5FhD0VstYq6takQMkVEMcdbarU6QC3UjIPbsdPgcWw
 rNDqodCX5FvCAd0tsEPy/bA3xSL/eaY90StCbO+TSmAUA2oCIs4vL97q9RGRZQ7SC+4K
 +/YXpcRBkdVaAAEbBndoapb5V+IARK6QRx6PJbYFDy8nJZdC0A1de2vLcTNW2RDcPPnW
 iZNQ==
X-Gm-Message-State: AOAM531ZSLgngLPJpdRbMnPJOi+HzPzT2ommJDSxh+Es9MzZsNMxtCzb
 94mxnwbosnmAjwrpc9ig33e6raVF2L+kgA==
X-Google-Smtp-Source: ABdhPJxgF/vEIvtXX+GhQLCu1RstnWwdFRD6PGzSuf4D6q+4VQlYjr1emDeuVHMeWpl3d4JFaNP1ew==
X-Received: by 2002:a05:6000:1b8d:: with SMTP id
 r13mr2103423wru.230.1631082715125; 
 Tue, 07 Sep 2021 23:31:55 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id m8sm1148202wms.32.2021.09.07.23.31.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 23:31:54 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  8 Sep 2021 08:31:23 +0200
Message-Id: <20210908063123.463952-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/pipewire: alsa needs seq
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

alsa unconditionally uses seq since version 0.2.90 and
https://github.com/PipeWire/pipewire/commit/818fb9e904a3ea43ba313994e404f1b63833c548
which will result in the following build failure since commit
a6d88d3ba5e30e11f4d726f341bc56c1be7c71c9:

In file included from ../spa/plugins/alsa/alsa-seq-bridge.c:44:
../spa/plugins/alsa/alsa-seq.h:71:2: error: unknown type name 'snd_seq_addr_t'
   71 |  snd_seq_addr_t addr;
      |  ^~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/65e3a9185b3b84ad78cd05f788f741b8734d2bbc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pipewire/pipewire.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
index 2317398088..aee0191894 100644
--- a/package/pipewire/pipewire.mk
+++ b/package/pipewire/pipewire.mk
@@ -52,7 +52,7 @@ endif
 ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
 PIPEWIRE_CONF_OPTS += -Dpipewire-alsa=enabled
 PIPEWIRE_DEPENDENCIES += alsa-lib
-ifeq ($(BR2_PACKAGE_ALSA_LIB_UCM)$(BR2_PACKAGE_HAS_UDEV),yy)
+ifeq ($(BR2_PACKAGE_ALSA_LIB_SEQ)$(BR2_PACKAGE_ALSA_LIB_UCM)$(BR2_PACKAGE_HAS_UDEV),yyy)
 PIPEWIRE_CONF_OPTS += -Dalsa=enabled
 else
 PIPEWIRE_CONF_OPTS += -Dalsa=disabled
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
