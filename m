Return-Path: <SRS0=nSxO=N7=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAEC9C433EF
	for <buildroot@archiver.kernel.org>; Thu,  9 Sep 2021 22:41:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58DE1611C1
	for <buildroot@archiver.kernel.org>; Thu,  9 Sep 2021 22:41:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 58DE1611C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E95A6401F6;
	Thu,  9 Sep 2021 22:41:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id atMtiLCB5SHA; Thu,  9 Sep 2021 22:41:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0FA11401E7;
	Thu,  9 Sep 2021 22:41:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A461E1BF27A
 for <buildroot@lists.busybox.net>; Thu,  9 Sep 2021 22:41:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8521E837C0
 for <buildroot@lists.busybox.net>; Thu,  9 Sep 2021 22:41:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yFquJaAq3tV2 for <buildroot@lists.busybox.net>;
 Thu,  9 Sep 2021 22:41:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F299F83563
 for <buildroot@buildroot.org>; Thu,  9 Sep 2021 22:41:24 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id a13so4439486iol.5
 for <buildroot@buildroot.org>; Thu, 09 Sep 2021 15:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=q+ia4rwiwTXjhSlHiGZQfVkkrwOlDW7fUhHAxa2+VGI=;
 b=EBwLKcqVFqPsmK2jGCzNDEU8+JkZ2Qr135bJ32PkXa02tEy9L72AyiZ84FtEsNttq9
 BNOu4yyvWUTxC61mRKGqX4uwXCFFxZRfwSNX90cSsHl6WepXmtMIpV0AOgzLOem7tNdA
 W45/ackNEKBDxqa57vzXpti3POncR3Fypn/5oUalsP7n6TNSqe5kVz6ARnOQ7SsGs8Pv
 sJly79YuSOizt8aMrBx2m+kqkWicmOrOj9LOgIivulZu6Hrz0OpXtvfZ1cSu+H8scr/2
 zNhHJbEKBLXzN/pOy+94rUUitghM2A2e5xyZd0McGhxMzlx0R4nKYzwLDcVzs3JICdvg
 feQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=q+ia4rwiwTXjhSlHiGZQfVkkrwOlDW7fUhHAxa2+VGI=;
 b=DHb5bWIgy5bOj/+JyFkVka25FpFeYOMxaEe8gN/yN4v2redgbU4R1iOR0Ehz5QnNAC
 8epxsXX5rQhSKT0Ih70jvs8WuEnNFbQNM7i+6PKsFvcc1J3dyAUifQ0rOzog8vGUJeNs
 nruhKBUhd4VJDq+2F9l3IRJRya+Gz0MhTbzk/bmQfVNdFBz9TyxpI1vspVAj6Ah/dx8W
 ugC2okrWD9ACsiifKKGorG2n1QG2XtMKac28G2OHRGmyDgzzzhxGD9y0JnNniHAj5Z5O
 cu4NdShy86oP6Rk8hWCg0nKlpi5oAOe2y7idN4F+JNORvs1kzo/NomB9SMdohrBzaSKm
 Pf1A==
X-Gm-Message-State: AOAM531RbK+CI4SeIY4m5uZVEd0Jugyp5sa2vFbFLpRJviMWkbCFde+W
 WhUtzvSWkepIOmHXoNqkW0a5B6JEs0g=
X-Google-Smtp-Source: ABdhPJy7HXenvjDZmwFv58zHHZfTRqEklxP1tt3ZN3oBJ8+X7x6AfEUaRxUUhRzJX2aqCqkYr+iCFQ==
X-Received: by 2002:a05:6638:399:: with SMTP id
 y25mr1851290jap.23.1631227283848; 
 Thu, 09 Sep 2021 15:41:23 -0700 (PDT)
Received: from james-x399.localdomain (97-118-233-80.hlrn.qwest.net.
 [97.118.233.80])
 by smtp.gmail.com with ESMTPSA id a21sm1492631iot.43.2021.09.09.15.41.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Sep 2021 15:41:23 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  9 Sep 2021 16:41:21 -0600
Message-Id: <20210909224121.2327470-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/1] package/pipewire: install systemd
 services when using systemd
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - Install user for service
---
 package/pipewire/pipewire.mk | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
index 2317398088..7ae9673cae 100644
--- a/package/pipewire/pipewire.mk
+++ b/package/pipewire/pipewire.mk
@@ -43,10 +43,16 @@ PIPEWIRE_CONF_OPTS += -Dgstreamer=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
-PIPEWIRE_CONF_OPTS += -Dsystemd=enabled
+PIPEWIRE_CONF_OPTS += \
+	-Dsystemd=enabled \
+	-Dsystemd-system-service=enabled \
+	-Dsystemd-user-service=enabled
 PIPEWIRE_DEPENDENCIES += systemd
 else
-PIPEWIRE_CONF_OPTS += -Dsystemd=disabled
+PIPEWIRE_CONF_OPTS += \
+	-Dsystemd=disabled \
+	-Dsystemd-system-service=disabled \
+	-Dsystemd-user-service=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
@@ -144,4 +150,8 @@ else
 PIPEWIRE_CONF_OPTS += -Decho-cancel-webrtc=disabled
 endif
 
+define PIPEWIRE_USERS
+	pipewire -1 pipewire -1 * - - - PipeWire System Daemon
+endef
+
 $(eval $(meson-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
