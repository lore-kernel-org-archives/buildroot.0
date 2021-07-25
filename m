Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29193C4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 07:55:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC3FB60F13
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 07:55:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CC3FB60F13
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97933606E8;
	Sun, 25 Jul 2021 07:55:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I0UdFWE1fWM0; Sun, 25 Jul 2021 07:55:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05A9760623;
	Sun, 25 Jul 2021 07:55:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C1CBF1BF48C
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 07:55:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B0EF860623
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 07:55:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 96V7oRtuV1ke for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 07:55:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7E1DE605C7
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 07:55:10 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id n21so3311705wmq.5
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 00:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WiBdMOxyp6SY+ZY1Gic7yuqaPmA47UUWgRhWdk5K00A=;
 b=tBpXSNBZQ/TqNQg7HFBC0gRHC2qiTg+VS3ZeuJq/u3KtJMw0xdF97cvIpxwgK/Qezf
 VWCNI83ADvxP2yfvJD+1dXQ/zgzYE4vZi+i+mbHoZHswRFPzCITRbty0hl9m4w5K6qCn
 mqQMLusYWF59Oo1jvLxubdYKn/bjP41e8xETDQY6lY2tk2z045ukVTxXp27AnIJDVDNz
 HBuJ4FoVstBQOJBAKKCsSR/JXSaTMr86LlHNkORTHIMb9y7UhwKSlOAeCQeegF9Jg+Q6
 bZQb3gtXt9O45Wj4GPtL9MpkXAW5uqqUOC9Kojo3kL2oPRoo+PlKy1vXb+8eXB31IOqT
 rDZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WiBdMOxyp6SY+ZY1Gic7yuqaPmA47UUWgRhWdk5K00A=;
 b=CBVA8Q+fITgor9hqKCRF75DXWtTOtH824FXrAjJB5uaF1UTXPgQjvE84QzSacLyVK/
 ChEK+hBCivxl73xdnvBajQKwbdWvXfvXfnOsXR9yaABfgP1R4KYJi3zBGO0eaLC0aQ5Q
 SCxaWgpJkCFmPcJSQWanC//yWaYxAJ1MWsAUPexzvSEMQpJp0V6uXRFpEPKE5NCm4y4m
 BpenKMTFLPOvzuBlAC/79OaqNSB7yypy2GGuWm/SRTp/X4UfGzGm6lbvghZbJ867VjXj
 Ybrb1Mn75LQDXf0doANDSFoBOXYmVQHtTLDnOwPtulUFuEmdB5WJBk2QTpm71bFssBe3
 GXoQ==
X-Gm-Message-State: AOAM533l8UGKSt3Yfr7fkocqYxrjbQS5Nb4C8+S8gMkSZeMzJWoL5prB
 i9TUhqsVYOMi6+bWRvE+v9+wmYUPKWlPHg==
X-Google-Smtp-Source: ABdhPJy85y8vErAfpYXapIM9cdoEnTrISOUB8GQcTr2I9usCPbTpKrA7EhALCYlh0wFPMyE7HtGCfw==
X-Received: by 2002:a7b:c045:: with SMTP id u5mr10993200wmc.158.1627199708514; 
 Sun, 25 Jul 2021 00:55:08 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id l2sm2791076wmq.0.2021.07.25.00.55.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 00:55:08 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 25 Jul 2021 09:54:58 +0200
Message-Id: <20210725075458.855606-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/acpid: add SELinux module
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Support for acpid is added by the services/acpi module in the SELinux
refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/acpid/acpid.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/acpid/acpid.mk b/package/acpid/acpid.mk
index 3473e7b5f6..1214251dc3 100644
--- a/package/acpid/acpid.mk
+++ b/package/acpid/acpid.mk
@@ -11,6 +11,7 @@ ACPID_LICENSE = GPL-2.0+
 ACPID_LICENSE_FILES = COPYING
 ACPID_CPE_ID_VENDOR = tedfelix
 ACPID_CPE_ID_PRODUCT = acpid2
+ACPID_SELINUX_MODULES = acpi
 
 define ACPID_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 0644 package/acpid/acpid.service \
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
