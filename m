Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A1DAC43334
	for <buildroot@archiver.kernel.org>; Thu, 21 Jul 2022 15:20:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C84C14119D;
	Thu, 21 Jul 2022 15:20:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C84C14119D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 46va9BPHdT0Y; Thu, 21 Jul 2022 15:20:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C64CE41198;
	Thu, 21 Jul 2022 15:19:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C64CE41198
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1C3661BF404
 for <buildroot@lists.busybox.net>; Thu, 21 Jul 2022 15:19:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8E3FB60E33
 for <buildroot@lists.busybox.net>; Thu, 21 Jul 2022 15:19:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E3FB60E33
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 17_JhkF7bgkQ for <buildroot@lists.busybox.net>;
 Thu, 21 Jul 2022 15:19:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9673E60EB3
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9673E60EB3
 for <buildroot@buildroot.org>; Thu, 21 Jul 2022 15:19:29 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id m17so2458285wrw.7
 for <buildroot@buildroot.org>; Thu, 21 Jul 2022 08:19:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pNU+4CFefv06m5Omgp2t1hcYWvI3Q/wUK3y4jL2iUB4=;
 b=I8dbLRS1xuVVfs5lfN3vNlxLcrryuRpn82hUuPfQ7TQxsBuYkY8DAFGdSdm4bZjs8n
 7BEQwSjwvf0e+6x2iAG+kJwb2QOTTrLPDojNKjGixsPq9vz4BROUON1+rRiN38JFN5ro
 YTvdNDczHmvo/0xkBKCKHao68RBsThDyQuzVNZejc3SMJ7utuSPPkIqxUeMNLL+zD+sU
 rv08j5kh0DcDJhKMqmyk9k/pSxEjkRiXBfi3XMk5NWJtxmjLlAB8YtvpYz+/7zV54P/L
 S7HButgAfnjfqhJR/JAt73Df/wXatEhnnO7T8/xpWou47PgOq7tRJ2dV3FeRms8Pg2hg
 cD2A==
X-Gm-Message-State: AJIora8Xo9CwGnBoxnbl8ldBPi+wTn1yrqINjT49utGWp/Y4qeJ4VzW0
 /u788fyI7NtejT40NZk+eBaA2NG+Dfk=
X-Google-Smtp-Source: AGRyM1uh4qaVUCa2mdJVHXiiUcVXbZWf+M0AmW4hjJgdO6G+Wn8LryzIL0hnx5X+zREb0Ssl5cdugg==
X-Received: by 2002:a5d:588b:0:b0:21d:a918:65a5 with SMTP id
 n11-20020a5d588b000000b0021da91865a5mr35784307wrf.210.1658416767428; 
 Thu, 21 Jul 2022 08:19:27 -0700 (PDT)
Received: from lano-work.. ([80.120.136.76]) by smtp.gmail.com with ESMTPSA id
 h6-20020a5d4fc6000000b0021d76a1b0e3sm2183059wrw.6.2022.07.21.08.19.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jul 2022 08:19:27 -0700 (PDT)
From: Norbert Lange <nolange79@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 21 Jul 2022 17:19:05 +0200
Message-Id: <20220721151907.212216-2-nolange79@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220721151907.212216-1-nolange79@gmail.com>
References: <20220721151907.212216-1-nolange79@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pNU+4CFefv06m5Omgp2t1hcYWvI3Q/wUK3y4jL2iUB4=;
 b=Gazun5DJ/RxAOS908WwQEg5hR0Basn9FuWfoFjMXwXiePPoSTa1ux5I9A5+MTjqGwy
 fltpL6zHXCp5oQmP3DIRZafDVBsqvEpeYDMSI58RKLqDCji4rI0v4WKA83bbbRKdjqED
 lLNfvxc8yqqYpTHbliWmLSJppnj/WgcQjFDBSKic2o0R3KL+8h6fcx6v+S8PgGleaiBn
 gfJBLVcw2ZTE098fSwmqZMEpigolcBp6Al0krtqGoGjzgI+H5BQopi3LBL+zyFVILjoA
 2cJ5v46fEOGZ1mT2/eDrIydHLlS7LurfDgAVw7pl91L6etXXl+CEYwtFklgZANTJmNQF
 g8zA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Gazun5DJ
Subject: [Buildroot] [PATCH v3 2/3] package/systemd: allow empty systemd
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
---
 package/systemd/systemd.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index afee1cfc79..15eb4f4d3b 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -578,17 +578,20 @@ ifneq ($(SYSTEMD_FALLBACK_HOSTNAME),)
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
