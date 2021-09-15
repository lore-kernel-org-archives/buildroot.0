Return-Path: <SRS0=vgbW=OF=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A195AC433F5
	for <buildroot@archiver.kernel.org>; Wed, 15 Sep 2021 20:57:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 247E160E90
	for <buildroot@archiver.kernel.org>; Wed, 15 Sep 2021 20:57:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 247E160E90
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 02C8960B47;
	Wed, 15 Sep 2021 20:57:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AyRVgnOnyPJq; Wed, 15 Sep 2021 20:57:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C5CF60E9E;
	Wed, 15 Sep 2021 20:57:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 503431BF2AA
 for <buildroot@lists.busybox.net>; Wed, 15 Sep 2021 20:57:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4CC1B406A9
 for <buildroot@lists.busybox.net>; Wed, 15 Sep 2021 20:57:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WYCwL2nWZBoE for <buildroot@lists.busybox.net>;
 Wed, 15 Sep 2021 20:57:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0604E40646
 for <buildroot@buildroot.org>; Wed, 15 Sep 2021 20:57:00 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id u15so5923132wru.6
 for <buildroot@buildroot.org>; Wed, 15 Sep 2021 13:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5B/ayNXgYpI4/mekpeRU59AjQoSpsZPjheLt6zJ9viA=;
 b=cj6bDo2A3HiIIk0R9qXLDTcyrNfX4yWjSZZA7THo1+NBt8mAy2nvVmw6MVaa07I2ou
 4jPp12H5GM3TfXLedNanGR06EgWGXEt1Tq1XlHUt2iMp24gvyEPdxMnusiWq5ErHJXPD
 24KIpdzf7svwva0r5XlEA9FWVUqwwRG+V7gfrZp2LaSqsyQFcGOUDV9EjjHmzBqWMJmi
 WDjdheueBln+ETydYiKeCi5R0PvmfaEBoVI9O9gPac1RiXlZiMd2E/4MWxyF3BXZxHOB
 hDR+IEhQWzVkzsfe0DSlYRz61VuYD3oWp6cemIKH+yNZXy5LrWsexT6Shs4aB+Z0a8AF
 76tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5B/ayNXgYpI4/mekpeRU59AjQoSpsZPjheLt6zJ9viA=;
 b=1tu8CpnLcpvC2+h4Gq1qfU93yC5Dc4oc5UU2GgVXnHtiL7G8gb42yR85yR7zeqbjGM
 Dm2N/TZJTP7pvKHQDKUUJN5lL4sEfx1gNysZjeiRKgWjSvxIxGz1FyT1CM2DVessL7IH
 G+3B7n7CLiFV6hjSQfBnB6Os+i8qBwIIXKt2vaplHdIuISR1OFqHczHDkmLT47Bpc8WX
 o1FyhvXbPDaynNBVz19caUzR59l/Of89Co9jBPHmTCOMMBNQbNfMJvn+OPaeCuB01lL8
 u+ejMqw4zz5JLokK++1eRn951Xcyfug4sViPCxOu1cMoqiJa/Kmw2zlQ/mcU5IeTNsQu
 ylBA==
X-Gm-Message-State: AOAM5319ieODDrd9VeTnHLxVvrHRXzp23QE0MtiV2c/RqDL23WcWmLBM
 xsNdgNf0hMpu2MGeNQpz1uyJqiecggg=
X-Google-Smtp-Source: ABdhPJwmDVudG+yvsNVL1BXwXAEkiAUhsAhBzM6DO98QEQI5MY5KLzURZUCusGHoh7hHyHjH+h938Q==
X-Received: by 2002:adf:e6c5:: with SMTP id y5mr2148066wrm.198.1631739419048; 
 Wed, 15 Sep 2021 13:56:59 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id c135sm5358422wme.6.2021.09.15.13.56.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Sep 2021 13:56:58 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 15 Sep 2021 22:56:40 +0200
Message-Id: <20210915205640.1411368-3-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210915205640.1411368-1-fontaine.fabrice@gmail.com>
References: <20210915205640.1411368-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/3] package/libvirt: security bump to version
 7.7.0
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
 Jared Bents <jared.bents@rockwellcollins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

- storage: Unlock pool objects on ACL check failures in
  storagePoolLookupByTargetPath (CVE-2021-3667)

  A logic bug in storagePoolLookupByTargetPath where the storage pool
  object was left locked after a failure of the ACL check could
  potentially deprive legitimate users access to a storage pool object
  by users who don't have access.

- svirt: fix MCS label generation (CVE-2021-3631)

  A flaw in the way MCS labels were generated could result in a VM's
  resource not being fully protected from access by another VM were
  it to be compromised. https://gitlab.com/libvirt/libvirt/-/issues/153

- Disable Cloud-Hypervisor driver added by
  https://gitlab.com/libvirt/libvirt/-/commit/56fbabf1a1e272c6cc50adcb603996cf8e94ad08

- Update indentation in hash file (two spaces)

https://gitlab.com/libvirt/libvirt/-/blob/v7.7.0/NEWS.rst

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libvirt/libvirt.hash | 4 ++--
 package/libvirt/libvirt.mk   | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/libvirt/libvirt.hash b/package/libvirt/libvirt.hash
index ec96dfc62c..e8cbb34e2a 100644
--- a/package/libvirt/libvirt.hash
+++ b/package/libvirt/libvirt.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256 b366d73dee6ce77a226bedef592e0620ceb8e22e5998f60768017f79fc4ead26  libvirt-7.4.0.tar.xz
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256  1b616099c18d14b9424a622f2a0bd3e0cfa286414f3416bd1a8173621b2252b2  libvirt-7.7.0.tar.xz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/libvirt/libvirt.mk b/package/libvirt/libvirt.mk
index f30baaab71..0f6c7cef7f 100644
--- a/package/libvirt/libvirt.mk
+++ b/package/libvirt/libvirt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVIRT_VERSION = 7.4.0
+LIBVIRT_VERSION = 7.7.0
 LIBVIRT_SITE = https://libvirt.org/sources
 LIBVIRT_SOURCE = libvirt-$(LIBVIRT_VERSION).tar.xz
 LIBVIRT_LICENSE = LGPL-2.1+
@@ -35,6 +35,7 @@ LIBVIRT_CONF_OPTS = \
 	-Dapparmor=disabled \
 	-Ddocs=disabled \
 	-Ddriver_bhyve=disabled \
+	-Ddriver_ch=disabled \
 	-Ddriver_esx=disabled \
 	-Ddriver_hyperv=disabled \
 	-Ddriver_interface=enabled \
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
