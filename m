Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 998F8C54791
	for <buildroot@archiver.kernel.org>; Wed, 13 Mar 2024 09:15:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 63FE3416F8;
	Wed, 13 Mar 2024 09:15:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5OZMUWN7_kiT; Wed, 13 Mar 2024 09:15:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 77ADD416EA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 77ADD416EA;
	Wed, 13 Mar 2024 09:15:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C75681BF3DF
 for <buildroot@lists.busybox.net>; Wed, 13 Mar 2024 09:14:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 34696813D5
 for <buildroot@lists.busybox.net>; Wed, 13 Mar 2024 09:14:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rkGuEAol0bwD for <buildroot@lists.busybox.net>;
 Wed, 13 Mar 2024 09:14:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com;
 envelope-from=fperrad@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8B7258137E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B7258137E
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8B7258137E
 for <buildroot@busybox.net>; Wed, 13 Mar 2024 09:14:37 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-513c8530daeso648730e87.2
 for <buildroot@busybox.net>; Wed, 13 Mar 2024 02:14:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710321275; x=1710926075;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ri8xg7GDHLNn82D2bIeLBHwnnXjLBqGm9+5VAGbyxZI=;
 b=GPesRMMDPDs+BW0U3b7qnYUHbJoYww3Pm3sITY0xZo9fgJxOKIekeM8qw2cVQHEkkg
 iMo2AR5cDj2r9S8DOIUrVWNMxSWUZtLrdPNu54+4etSviuEV4H5whzCcyc0wBCimPFI6
 523g7F53efUqNMYWGE9aYzldlOJMu0Q77TGwFfhqbpQ7kkLxVHirpz/HSHDHg8cbOuho
 SM7eKgyJjEvNDApN9m3n/y7BZ2WEPa1Lo5D1ShuhbayDf/uV7Yqoc1WI2nFjqatZrWa+
 kgq+0NNuSEE4/VLHeE+bQyf/zPO69fdTEwkFmZ80Qt5V0kS9oaGTcsdZlccB0hbZkHov
 y0zg==
X-Gm-Message-State: AOJu0Yz0D3b9mqLYtr8ersYnvF5/+B160l6OZL1OhjpteNcZT5oLtg2j
 YA9452yWYNRFF0WOysbfofvLiNVLiOjdkL4RjFikbXrOZ285nsLJjef1eq5Ah9o=
X-Google-Smtp-Source: AGHT+IFZE3zfEFBldCoSvgMwzRZPmCGH3WzurexazLLiXPc/99A0KExYKAD+Dy/nXr5Fea4i6T5zBQ==
X-Received: by 2002:a05:6512:3c87:b0:513:2bea:d0e0 with SMTP id
 h7-20020a0565123c8700b005132bead0e0mr11227014lfv.62.1710321275306; 
 Wed, 13 Mar 2024 02:14:35 -0700 (PDT)
Received: from xubuntu-23.. ([37.65.6.92]) by smtp.gmail.com with ESMTPSA id
 u1-20020a05600c138100b00412e5f32591sm1699799wmf.28.2024.03.13.02.14.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 02:14:34 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 13 Mar 2024 10:14:06 +0100
Message-Id: <20240313091412.20865-25-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240313091412.20865-1-francois.perrad@gadz.org>
References: <20240313091412.20865-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710321275; x=1710926075; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ri8xg7GDHLNn82D2bIeLBHwnnXjLBqGm9+5VAGbyxZI=;
 b=IfrAzkcQl8khbc3caSqk3JTl9lymgv/09/EDV+j84MtgyeCWXsOUuPitYO1UigFr1w
 H1eEVtbHXHuvqKjp4GEXsKxQmf9vxBHIlaAznw8tomXN/lK2kQGrkyqiBiyC+/Jq3RmI
 SgoaD8ZCvRRoOy+kRDu+QLXuzjtYlFBOdfN8jaXGoK20SI5J1TvE8v6Cgk+Ds1Fp7aUw
 t35+UJnYgZbcX/haeGI94Nad0s4Ts1tt4Bq0jnPyQYdgRzMRmFAktNxsbyCKmbPygLwg
 dCQhR5YjpPS8SRk8IwKUEsSgMktQ+Q3kiLLs3/r3ZVBoefz8xihoju9UbMAovBqOBHll
 J7AA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=IfrAzkcQ
Subject: [Buildroot] [PATCH 25/31] package/start-stop-daemon: disable
 busybox start-stop-daemon
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/start-stop-daemon/start-stop-daemon.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/start-stop-daemon/start-stop-daemon.mk b/package/start-stop-daemon/start-stop-daemon.mk
index 9db767dd1..fb5e84c90 100644
--- a/package/start-stop-daemon/start-stop-daemon.mk
+++ b/package/start-stop-daemon/start-stop-daemon.mk
@@ -35,4 +35,8 @@ define START_STOP_DAEMON_INSTALL_TARGET_CMDS
 		$(TARGET_DIR)/sbin/start-stop-daemon
 endef
 
+define START_STOP_DAEMON_BUSYBOX_CONFIG_FIXUPS
+	$(call KCONFIG_DISABLE_OPT,CONFIG_START_STOP_DAEMON)
+endef
+
 $(eval $(autotools-package))
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
