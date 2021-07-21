Return-Path: <SRS0=q2PD=MN=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8039EC6377B
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 20:04:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 346E46121F
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 20:04:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 346E46121F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB3A8605F5;
	Wed, 21 Jul 2021 20:03:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6a-_Bk7ePaRN; Wed, 21 Jul 2021 20:03:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C4EB605CE;
	Wed, 21 Jul 2021 20:03:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 27BBD1BF337
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 20:03:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0FDD2402C8
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 20:03:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H-eELbT60Rxd for <buildroot@lists.busybox.net>;
 Wed, 21 Jul 2021 20:03:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4704D40155
 for <buildroot@buildroot.org>; Wed, 21 Jul 2021 20:03:56 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id c17so2005270wmb.5
 for <buildroot@buildroot.org>; Wed, 21 Jul 2021 13:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yfaPaMny+aG+Bynrqb6anNMDsOMBuiQLaWoF8sYGAww=;
 b=V/+ifCY2cxBXeKbBxE62tyHXkKMLPB9alFC+FGspOs+CDHTj5AcD5eqXYeI06J12Gq
 tE6dOpb9G4SJMqyyjJWRiMm2fvegbnvsfNODlOuw6OUmEdDFjSojVIqUvQk43ft//pvM
 1e3Bk9BVaGSCfspQNPgv0jg3TVY0KsVlsDeQ53HXp2brsa5eDd4MwiDYDdX9cQdJ+ivg
 SIlTJmOD9XpJMhIdnvbU36Lmv3zsKsnoZCMXkPcp4w2by1nS27s0uuItD3Z4wMeIqUoN
 hInPDvq03c1TR5PCNeQeE86bGgrTS29yZ8Vb61Q86J+0tmdoVhRID4LL/ReLpP2bfXxe
 Jsbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yfaPaMny+aG+Bynrqb6anNMDsOMBuiQLaWoF8sYGAww=;
 b=IQ445lt0kMtM+UFqZV72VlPP0ijQepcPO0t5EpgPBLi7M3OZYGcglwRxAW0Xqihkui
 pJHrcT03G9tL9ycEGI8ygAQHDA0MygAk0w1a6hIisHV4+AKS374oHQ49BXEO+8wJDeK+
 fdGPOfccysL8Y2uiTnGXRGdYMKad1Sm2d0Y/w7VOr63Dwd2untz0nCoU6mZ1hri0/JwD
 i+2AQ5RRW3Uk7/lNJ+3kS6eZeWchV8PktI9f5KcjRCum65CTt+cAmuhgpCVthSUy5NWQ
 OqErKAKgw5CI8KB3Is6jo0PyVcETZZScZFTu6/zvIll5MEv0RiEaK6+Y1P8IpJzMTnhx
 gDAQ==
X-Gm-Message-State: AOAM530EOfprTVYwtcX8nNWzQ1TzfoHqS3qs2eWuAdtLJfbuLB+Hqq3m
 Crr72I8cEl9RFr4re24TLxeyN/RxZihWvw==
X-Google-Smtp-Source: ABdhPJxko6jDPkG2a3U1TUgDS7bX5cWGiBbVE+BDg8w0LcTBdHbz+tszz0N+x4cD4CJ/Cq7g/u1vOw==
X-Received: by 2002:a05:600c:2f1a:: with SMTP id
 r26mr5650465wmn.41.1626897834135; 
 Wed, 21 Jul 2021 13:03:54 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id 140sm23602814wmb.43.2021.07.21.13.03.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 13:03:53 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 21 Jul 2021 22:03:49 +0200
Message-Id: <20210721200349.502574-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/collectd: add SELinux module
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Support for collectd is added by the services/collectd module in the
SELinux refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/collectd/collectd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 7db753b342..9901abfd16 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -13,6 +13,7 @@ COLLECTD_INSTALL_STAGING = YES
 COLLECTD_LICENSE = MIT (daemon, plugins), GPL-2.0 (plugins), LGPL-2.1 (plugins)
 COLLECTD_LICENSE_FILES = COPYING
 COLLECTD_CPE_ID_VENDOR = collectd
+COLLECTD_SELINUX_MODULES = collectd
 
 # These require unmet dependencies, are fringe, pointless or deprecated
 COLLECTD_PLUGINS_DISABLE = \
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
