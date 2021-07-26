Return-Path: <SRS0=wdlY=MS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9562EC4338F
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 08:55:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CFDA60F4C
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 08:55:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4CFDA60F4C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1E1F34029C;
	Mon, 26 Jul 2021 08:55:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 19aMCWTIPqtF; Mon, 26 Jul 2021 08:55:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5C40F401C0;
	Mon, 26 Jul 2021 08:55:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BA8E91BF293
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 08:55:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A75E3401C0
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 08:55:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r_9kDkMNQepY for <buildroot@lists.busybox.net>;
 Mon, 26 Jul 2021 08:55:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7A529400D7
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 08:55:44 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id p5so5008787wro.7
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 01:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6OcnawBDKOYRjH7Y7stftc8gME5MFun5ix/E1d3wpYM=;
 b=YV0VmNrS40nVh+qNsnBLOZRjCN+nMnt94AtnHWRL65b0ZaU2FJHywLQgrphxMpIO2W
 hxIe54+t2YMkGerc7oMlWmAnNtcvpj21iX7QYueOQOIv1FISbmSyg7sp1NYu4EbO62RL
 ZqYaIXDhJZXZDMasZgeO2dpV13w7PNOHRymtdLEXfbSEl0zjLTXChR5ffoQFlrqH3y/E
 St33K5ayOS4CsPPjWTGEpGr9ila0aDls0pq+mWdLQTYYwPGPQCZ0g+TR2BH1xXFci6HT
 itCBfhI0+u+Ciucy4UoX/qnKnuXBA0T6B1oD/MWUB5VUL+7BUgrE9AhUDxQoOk63cHqV
 AX/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6OcnawBDKOYRjH7Y7stftc8gME5MFun5ix/E1d3wpYM=;
 b=m50OwF8TlKTgXLoKL3pHSJk6W4nXO9Wikhrx/JgRbq0lGAWRwIWjTeH9k8Vc0hpyDb
 92hKlFeFNmIWJTQtmHhGxVK23+z7YzLUkQ/XDS8TwaABFtcpcwR7hvtIPBsjj0X/Oymh
 ILU9oZo0K5WaWA54jLZvw8pjjV5fOoqAg8TVzLM+GbPqWWPpNkTjZ54FAvx+C5E/0/gI
 nlcesHz1yQNVBAoJdUoqbaSCek9uB+uI3XvmMQ8nKLVqQhidcm6h8Ei6OhJu3XJtBtTt
 f//P0bPSmgR6PuCbSHoI19prmb0kOgLR8R0w1vx1D+F78IEGW8tkxZjRrbsqijXqUB7R
 Otbw==
X-Gm-Message-State: AOAM530UBg0IJxnW+7yfdtyqP6kz4WMtxQOppMPwNuf00Iqh3TKiGlEY
 muhaw/ZZGgnd71XxWe2bpxmZb8nfU0rBxg==
X-Google-Smtp-Source: ABdhPJwM95Ckq4FDjppeJB+XTE4h9lVEEHL+hqH/dEBi/1e1uCRDbV9uVOlIObwlAO0szSBdKwutNg==
X-Received: by 2002:a5d:4251:: with SMTP id s17mr2872838wrr.154.1627289742576; 
 Mon, 26 Jul 2021 01:55:42 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id p4sm972044wre.83.2021.07.26.01.55.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 01:55:42 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 26 Jul 2021 10:55:35 +0200
Message-Id: <20210726085535.1710190-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/openldap: add SELinux module
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
 David Bender <codehero@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Support for openldap is added by the services/ldap module in the SELinux
refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/openldap/openldap.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/openldap/openldap.mk b/package/openldap/openldap.mk
index 3b35b4daa3..daa409ae1d 100644
--- a/package/openldap/openldap.mk
+++ b/package/openldap/openldap.mk
@@ -10,6 +10,7 @@ OPENLDAP_SITE = https://www.openldap.org/software/download/OpenLDAP/openldap-rel
 OPENLDAP_LICENSE = OpenLDAP Public License
 OPENLDAP_LICENSE_FILES = LICENSE
 OPENLDAP_CPE_ID_VENDOR = openldap
+OPENLDAP_SELINUX_MODULES = ldap
 OPENLDAP_INSTALL_STAGING = YES
 OPENLDAP_DEPENDENCIES = host-pkgconf
 
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
