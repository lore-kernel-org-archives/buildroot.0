Return-Path: <SRS0=AA6u=N6=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94E93C433F5
	for <buildroot@archiver.kernel.org>; Wed,  8 Sep 2021 20:28:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2EC1661164
	for <buildroot@archiver.kernel.org>; Wed,  8 Sep 2021 20:28:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2EC1661164
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E61DA40386;
	Wed,  8 Sep 2021 20:28:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wx8hpZiT2Vc9; Wed,  8 Sep 2021 20:28:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4453540354;
	Wed,  8 Sep 2021 20:27:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ACC071BF870
 for <buildroot@lists.busybox.net>; Wed,  8 Sep 2021 20:27:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9C5BF40354
 for <buildroot@lists.busybox.net>; Wed,  8 Sep 2021 20:27:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oOriJHRFg0bn for <buildroot@lists.busybox.net>;
 Wed,  8 Sep 2021 20:27:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A2E6940351
 for <buildroot@buildroot.org>; Wed,  8 Sep 2021 20:27:56 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id z4so5092833wrr.6
 for <buildroot@buildroot.org>; Wed, 08 Sep 2021 13:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0iu0oK4jAURsgOoceqaS57LfPTHF8OB1rPlbipZIRks=;
 b=DbXaGL6Pn+8VtxaqovPbeVZTjnx2/5M5JkRTlweuiwvI2moysgbCAUOWIoLXR1WwTy
 3dKXOjaGeNjIPg8QJdv9wlS/qoz0TE8Lb8GeW5sra16DdHbNezhsq4Q8nykCzLUv/rHz
 7EnuT/NLfSgcb2cOykL4PSyR7r0fy1iAvWvE0b8GrKOLizyxQmrodlHz+QSFlaQEIXw0
 Xb0QpUOSQunl0h/lwm3YhO7qRYVRIK7kSAdAyCn/aKKI+9wPoP4aHuEq52N08TQmOB4q
 wsBEGjlo+mbvK/PSsM9NkQWByQNnAo4bu988DKAKwoHGsq0z1thuDL/xRyNnWdefoQ7u
 /f9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0iu0oK4jAURsgOoceqaS57LfPTHF8OB1rPlbipZIRks=;
 b=SQ137Xi4lbDd6F/QMP0cu2iMc8n3XlFWBb0UJkIjcjGLM5V2FpYhH8Z2z5eW733hAK
 nsGyTDtotftzSQFCqNfk3zHfPy4J90T9ujiBk808WV7Hdkymf82BKBSqmQIKFaDkxn2T
 d3iAybYOfVOkFWCDS4YSuWp99e3bKM1FcgaDcEtyWK90nEIXN7VJh4KfjRsZemJV64pr
 s7uWLNCXt1ucxdkrCtWg4macqT7O2HRhN4OZOO8OJeIqDg0RC4OFB7qoAJ3bPhrtitLh
 zUIUWenri0waV35Z4U1ZJrXJP/svSi+fzN3RtFJ68hITjPYGDFnClWipicyUD1HMy7im
 9bCw==
X-Gm-Message-State: AOAM531nPKeqem2KVy0M88BbwZitpK9uykvBnSRTohVHKOXjyh3V1SEM
 spM00dKW7VvHCRp5fL3oKstpyLrmW6E=
X-Google-Smtp-Source: ABdhPJylYryfwQUrlZenI+pPP1ZFpEqARqoEYXbG4EakpMmV4R7q1a7/dUOmlqfVcZUrw6/BH991Mw==
X-Received: by 2002:a05:6000:1627:: with SMTP id
 v7mr179600wrb.54.1631132874769; 
 Wed, 08 Sep 2021 13:27:54 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id r25sm175156wrc.26.2021.09.08.13.27.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 13:27:54 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  8 Sep 2021 22:27:52 +0200
Message-Id: <20210908202752.925823-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/gupnp: bump to version 1.3.1
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Rahul Bedarkar <rahulbedarkar89@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

https://gitlab.gnome.org/GNOME/gupnp/-/blob/gupnp-1.3.1/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gupnp/gupnp.hash | 4 ++--
 package/gupnp/gupnp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gupnp/gupnp.hash b/package/gupnp/gupnp.hash
index d7868b99b9..9eb1eb467b 100644
--- a/package/gupnp/gupnp.hash
+++ b/package/gupnp/gupnp.hash
@@ -1,5 +1,5 @@
-# Hash from: http://ftp.gnome.org/pub/gnome/sources/gupnp/1.3/gupnp-1.3.0.sha256sum:
-sha256  df8279293aae45ea6bb6de1b13bf1988285c8f2f4f25569fb0d79325a8471666  gupnp-1.3.0.tar.xz
+# Hash from: http://ftp.gnome.org/pub/gnome/sources/gupnp/1.3/gupnp-1.3.1.sha256sum:
+sha256  df70fe8321bfc53cadb6860edcff2e0dc456ec81899b463f41723684803d1408  gupnp-1.3.1.tar.xz
 
 # Hash for license file:
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/gupnp/gupnp.mk b/package/gupnp/gupnp.mk
index 421d12d3d2..bbba9ecf32 100644
--- a/package/gupnp/gupnp.mk
+++ b/package/gupnp/gupnp.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GUPNP_VERSION_MAJOR = 1.3
-GUPNP_VERSION = $(GUPNP_VERSION_MAJOR).0
+GUPNP_VERSION = $(GUPNP_VERSION_MAJOR).1
 GUPNP_SOURCE = gupnp-$(GUPNP_VERSION).tar.xz
 GUPNP_SITE = http://ftp.gnome.org/pub/gnome/sources/gupnp/$(GUPNP_VERSION_MAJOR)
 GUPNP_LICENSE = LGPL-2.1+
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
