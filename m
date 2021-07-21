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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C523C6377A
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 22:27:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D338861244
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 22:27:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D338861244
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B009481BA9;
	Wed, 21 Jul 2021 22:27:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gA7THxwgng4n; Wed, 21 Jul 2021 22:27:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1683981B01;
	Wed, 21 Jul 2021 22:27:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BA20B1BF3D4
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 22:27:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A9AE24012B
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 22:27:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fVCXQ2uPYiOF for <buildroot@lists.busybox.net>;
 Wed, 21 Jul 2021 22:27:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6E8274010D
 for <buildroot@buildroot.org>; Wed, 21 Jul 2021 22:27:37 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 u8-20020a7bcb080000b02901e44e9caa2aso1822131wmj.4
 for <buildroot@buildroot.org>; Wed, 21 Jul 2021 15:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kVWIcfMfi88s2k2Z8An38HJ+GaKzmXQjUg2oGDnAoYg=;
 b=ZWDwUkhK4TDM/7MWtcYJ395hdHLyn+5Cm61rTVurEm3u2y31Ii+ig1zt5cK8kiA+GE
 HK1q6nFyIWvOYZBzRb57+OFn/EU+HMgxyozfQLPy66Z4jbT4WVLrvEOiZgJOD5ChllRf
 W7nqquBrnSVhvelZv6OPkb+AqsjcQT/gPiF3G03Oyfn91OvRW6nY77BaQuuxo+ndR7vU
 1zN9s+zQPxl56e1TfB7q3LOxaaFpwxLPegCFopDZUDahg3Cg1duq/flI02qqe2uOf8q3
 LCJlPX/wJIsCOpxINonevNSq9HEUJOslCRv3moQ5KTAg6djwFafqgXU7F1syC4BfjjFW
 /zAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kVWIcfMfi88s2k2Z8An38HJ+GaKzmXQjUg2oGDnAoYg=;
 b=XrcYUEwG/Z0wYo5gSBO61vNIct3+wmWEiHI54Nczm9rmPLoygnhPLpG1W2U7Fy+GrG
 pmEni4T6kTyzEO0jIoJ+cyNQ+RMvq+exf0FmHELUkyFSb5lc4Q9fAlcVZu/H2G3r9Ae2
 bGFwNEu5lvX1mjf9LgfcKxdHSo987wOehZEaQObx0dEYE7Sm3YZinrRwOzOg1MNlZLRu
 39U2DRBttNlR/Y9UMznUB8yMeiSs74j1Z51g1ErJmpvv/pDF1532Z45zGFDg3qUNJWtt
 UJa3sin75X8P/xPYTIOjNbw9Hxpa+m79FM3H6qXINbwRjdm/9hRin0nvv3/pajxkeriw
 qRRA==
X-Gm-Message-State: AOAM532IqLOmIblQdgO5S6kAwctS4MgorG6JCzCNGS0fSr+VmvY94Ro0
 hCbLHanH+bRE+W/AYCsytyg51fFZLvwg1A==
X-Google-Smtp-Source: ABdhPJzDSdxrhhSKyFG5wRTb41tGfCLdevh0fAeKTgyxPtsS7OUjE3Dz/9fGks0YaI0XVmzifumIAw==
X-Received: by 2002:a05:600c:2211:: with SMTP id
 z17mr39653084wml.17.1626906455412; 
 Wed, 21 Jul 2021 15:27:35 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id u12sm28807183wrt.50.2021.07.21.15.27.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 15:27:35 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 22 Jul 2021 00:27:31 +0200
Message-Id: <20210721222731.1168996-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/openvpn: add SELinux refpolicy
 module
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

SELinux support for openvpn is added by the services/openvpn refpolicy
module.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/openvpn/openvpn.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index c07f8b4ff5..749a567e16 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -11,6 +11,7 @@ OPENVPN_DEPENDENCIES = host-pkgconf
 OPENVPN_LICENSE = GPL-2.0
 OPENVPN_LICENSE_FILES = COPYRIGHT.GPL
 OPENVPN_CPE_ID_VENDOR = openvpn
+OPENVPN_SELINUX_MODULES = openvpn
 OPENVPN_CONF_OPTS = \
 	--disable-unit-tests \
 	$(if $(BR2_STATIC_LIBS),--disable-plugins)
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
