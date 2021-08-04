Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8D97C43216
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 10:18:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70B9F60243
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 10:18:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 70B9F60243
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35AA283BEF;
	Wed,  4 Aug 2021 10:18:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id opZkoIkTnRVD; Wed,  4 Aug 2021 10:18:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D93583B9C;
	Wed,  4 Aug 2021 10:18:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 76A471BF418
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 10:18:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 65A896061D
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 10:18:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vlx3tJT3YGbE for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 10:18:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AEF0D6009C
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 10:18:00 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 l4-20020a05600c1d04b02902506f89ad2dso3383025wms.1
 for <buildroot@buildroot.org>; Wed, 04 Aug 2021 03:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E6VSqsjuab3H6i3L23RqCCRtAMSLz5lChbk1FeXkU7M=;
 b=IxCrTyByroM8xy6b6O+lgqFxuHAOOs5pN8obhkws7rNgMJq86HgzgIIBdgh4da04Gr
 V8JAe/bu1WJinTdDI2tZlQUDb29UWGTwB9HGGYzusOewMNN4uwKaZfzYuaHWR9kCFnSl
 w643S8BaIAAohzxGhOX7XImoGm5DWK4KEA1wmwwkH5J1XCHLT0C45Omcs873wlZt3dae
 4bUsBOKr/CQKuS6aShx36dzjFhjKgX7nHBkORngpX8PLphI2+p4RVLOAzxTQfcjcoRX1
 K0WgulXt68/JXDSJFY59oRiWDF9DatWcdCvtbdkNKLr8nVHIjKU6OkcXs1E0ev7rGU7X
 6YXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E6VSqsjuab3H6i3L23RqCCRtAMSLz5lChbk1FeXkU7M=;
 b=TRuynRyRQK5eZHz7R5sPnXtsqMI7dMSjelBuHkYRfIQA2maaMuwD8zyQC2n53BplZ1
 pnq6/B2N+UCZ5lSHvahbLVoZRG6uNDyEP0Jg80tKRVHd53RXbyUipgsiJwehWCpYQ+u1
 juvnWadLlbAUfVk7kkGFTYNAA6O8fr3/L9Gl2tDBi/gFwxMcBfPwiptk8SXLWGDbSFaA
 5SXYegIzkmSnyKKnY8juE8L+UIDD6xyjxvnkQIO0nH7CeWd4IQ1j92x2bjzPJunmaksx
 sVhrAc9wBXAVnKdoUWs6zRzbtJsWLedOdab62AQuxfdMAKfK51xGBTRsWgP9TJ/9e2MK
 3vfw==
X-Gm-Message-State: AOAM532QlnEF6kcDMfkF0JQhxlFEPCkHrpddguEBsy3SDs5uykQDFFR3
 0mKFWTQM63yWZs3Em2kElAB84MpRG6o5og==
X-Google-Smtp-Source: ABdhPJwv1VCBdF0sbqIn+VCKK9G9Oc4tBtBw4mNPAJlTCYzLTGxiIDB7CK8MSfN77sVAP6dhLu5kmw==
X-Received: by 2002:a1c:1bcd:: with SMTP id
 b196mr26339155wmb.160.1628072278564; 
 Wed, 04 Aug 2021 03:17:58 -0700 (PDT)
Received: from kali.home (pop.92-184-97-247.mobile.abo.orange.fr.
 [92.184.97.247])
 by smtp.gmail.com with ESMTPSA id m14sm1939877wrs.56.2021.08.04.03.17.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 03:17:57 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  4 Aug 2021 12:17:50 +0200
Message-Id: <20210804101750.933300-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/rpm: add SELinux module
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
 James Knight <james.knight@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Support for rpm is added by the admin/rpm module in the SELinux
refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/rpm/rpm.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
index 0d8c14a09e..ae324fbeef 100644
--- a/package/rpm/rpm.mk
+++ b/package/rpm/rpm.mk
@@ -20,6 +20,7 @@ RPM_DEPENDENCIES = \
 RPM_LICENSE = GPL-2.0 or LGPL-2.0 (library only)
 RPM_LICENSE_FILES = COPYING
 RPM_CPE_ID_VENDOR = rpm
+RPM_SELINUX_MODULES = rpm
 
 # Don't set --{dis,en}-openmp as upstream wants to abort the build if
 # --enable-openmp is provided and OpenMP is < 4.5:
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
