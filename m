Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB7CCC433EF
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 10:17:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 38E604013D;
	Fri, 22 Jul 2022 10:17:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 38E604013D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ugIxdRW47fEU; Fri, 22 Jul 2022 10:17:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 28285415EA;
	Fri, 22 Jul 2022 10:17:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 28285415EA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AD0B31BF32B
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 10:17:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 881C9846F7
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 10:17:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 881C9846F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HsA9E3ss7pPH for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 10:17:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21DFE83F4A
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 21DFE83F4A
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 10:17:41 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id ss3so7708878ejc.11
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 03:17:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ujODb7SIoMqqRrmrPtpJ3Qfb3s87nTu4TdcGe1LlTwM=;
 b=fxY6fO148QBBChQ+UnAhoEhrgWZqCGF8xlZ/d8FeAxsreqKSuZ9GKYGmdUuulg4oC3
 uN/FrTnS2rtR/RTomCpjr7iQeYVoRZStf4oVsM2kEDvhdPPHEZ43ADZ3CHBj1+4NrpcQ
 gl63oN7qrPqXagOSqw97UpYRILMlxI5KjtXw4CK+J+BCl3isBN50kUQvWi65PdAZxNS9
 vcu/MwGy5yfrfP26eL+BOyPFqIGbW2fw6b7B9Hczj/ob9LmFDrlwhohBuWzq6cG0W3jD
 Rd/otqHcx+/dmnZcu+OWRUsv+qtn7BfMQmcbAa+kMvMyEapVOJOu51mPU9gTW4ypchly
 85fA==
X-Gm-Message-State: AJIora8DZ4WuTBPeOxUxlbry5mhOkrazwTEX9RNVNsC48PKeTQ/1skd5
 Lv4ytlc+iTrlbP5hgXAjU5aRuguTvLIqXg==
X-Google-Smtp-Source: AGRyM1vbNkbKfkSY/vjgjOU/KBtHCDLdV6Em2g8Ul4rjAxCzsOFQVz5LWTw9b//h6jZYDdDTVgmuoQ==
X-Received: by 2002:a17:906:4598:b0:72f:643c:db45 with SMTP id
 qs24-20020a170906459800b0072f643cdb45mr2603242ejc.194.1658485059102; 
 Fri, 22 Jul 2022 03:17:39 -0700 (PDT)
Received: from debian-noppl.. (62-178-205-20.cable.dynamic.surfer.at.
 [62.178.205.20]) by smtp.gmail.com with ESMTPSA id
 p9-20020a056402074900b00431962fe5d4sm2300671edy.77.2022.07.22.03.17.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jul 2022 03:17:38 -0700 (PDT)
From: Norbert Lange <nolange79@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 22 Jul 2022 12:16:49 +0200
Message-Id: <20220722101653.7475-2-nolange79@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220722101653.7475-1-nolange79@gmail.com>
References: <20220722101653.7475-1-nolange79@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ujODb7SIoMqqRrmrPtpJ3Qfb3s87nTu4TdcGe1LlTwM=;
 b=oX67tR5s0G+AJrZ6jFS9Lxna42tuME3WDtmyVO987mrCF6ZNDaSkxZFng9gv52MmGK
 Y40r7IFbKU7afkxrG9ML5TCWtuUuvl1VWjNgF+Nt1vvckfgmuUpo7D0XvDMjhZ0PJU+g
 WLn0CfApfE4G1goMUHUqWntg6rhn9Ru7bBh+ofU/sr1cKOj6tNBJGoyHgeRJgYPcjv1r
 JLc3p0IaKHotbAeUPQWWJyIOde5d/Ze2OuquxJ5YrlWYhY+UTfgpPRSSpm0WFrzyoRBR
 3EBkCha4aBSyeHEmIstWeM1rAt9p7FRQvfYjHjT3xcdDvT2nNWZ2MwEzA8KlnXDR70lL
 d7Bg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=oX67tR5s
Subject: [Buildroot] [PATCH v4 2/4] package/systemd: allow empty systemd
 default target
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
Cc: Norbert Lange <nolange79@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Currently, we forcefully require that a default target be specified.
However, systemd does install a default target, but it's not
possible to just use that target.

Allow the user to blank-out the config setting to not override
whatever systemd installed and keep that.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
v1->v2:

*   completely remove the hook if var is empty
*   adjusted commit message

v2->v3:

*   v2 was broken, dint want to send it. now fixed/correct

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/systemd/systemd.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index b5628f5155..bacde5221b 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -583,17 +583,20 @@ ifneq ($(SYSTEMD_FALLBACK_HOSTNAME),)
 SYSTEMD_CONF_OPTS += -Dfallback-hostname=$(SYSTEMD_FALLBACK_HOSTNAME)
 endif
 
+ifneq ($(call qstrip,$(BR2_PACKAGE_SYSTEMD_DEFAULT_TARGET)),)
 define SYSTEMD_INSTALL_INIT_HOOK
 	ln -fs "$(call qstrip,$(BR2_PACKAGE_SYSTEMD_DEFAULT_TARGET))" \
 		$(TARGET_DIR)/usr/lib/systemd/system/default.target
 endef
 
+SYSTEMD_POST_INSTALL_TARGET_HOOKS += SYSTEMD_INSTALL_INIT_HOOK
+endif
+
 define SYSTEMD_INSTALL_MACHINEID_HOOK
 	touch $(TARGET_DIR)/etc/machine-id
 endef
 
 SYSTEMD_POST_INSTALL_TARGET_HOOKS += \
-	SYSTEMD_INSTALL_INIT_HOOK \
 	SYSTEMD_INSTALL_MACHINEID_HOOK
 
 define SYSTEMD_INSTALL_IMAGES_CMDS
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
