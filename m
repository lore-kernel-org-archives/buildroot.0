Return-Path: <SRS0=q2PD=MN=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79DF6C12002
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 17:11:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3AFAA61244
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 17:11:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3AFAA61244
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1160782433;
	Wed, 21 Jul 2021 17:11:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6phxtEdgxXN2; Wed, 21 Jul 2021 17:11:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6FE39823F9;
	Wed, 21 Jul 2021 17:11:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E8EEE1C1135
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 17:11:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D869E40119
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 17:11:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id euHm07j0wXWx for <buildroot@lists.busybox.net>;
 Wed, 21 Jul 2021 17:11:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ACC63400F1
 for <buildroot@buildroot.org>; Wed, 21 Jul 2021 17:11:08 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id f9so2953873wrq.11
 for <buildroot@buildroot.org>; Wed, 21 Jul 2021 10:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=U5uNcAqfq9y8j39zfN7I6GTvE2bv3FRryxC7Y0EiaJ4=;
 b=FRLkJmSJvmPs2CjfFN4di2O2ogjQ3kkRfgn4lUGiwGdKuOL9Wbn9WlVgYC6GOESE6o
 QEvJ4eOX+l78IJgIEw0IujkS/35qa9mfFk4/5CIokCCnWMsw2GSSaQVBhMUFMRoxHsAP
 aDPLY0JwHGiFfNKGw8xZpYlZaI+G0YIfbWZhNzHr86F9cdvpI9FMMDe/u7ExpiGKK0Rd
 qGH3KfqDlxIwvWjx3x+dgv6HwWwGbax5i5DSomHzF1h2bPXuQPY5fcTCk95DoMrK3p3y
 I6camDDEbBniL8qcRkmDKBeU/ZNerLuKBygoty2sjhTsF3PRkD3nTmyP9xfFwvbWX9Cw
 hUVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=U5uNcAqfq9y8j39zfN7I6GTvE2bv3FRryxC7Y0EiaJ4=;
 b=YXkMuBLAsFgMhgZ00Is+R3GhRlfgd1GxzhP3xziqDSoKzkRCK3EdOesp2D+z39brCx
 k92SGRuU2iAbhhZ3QJTZnwd2CMS4gPMuT0MF6OTikcdT0sNuHXP6HuVgUiWAjVdtzfW2
 g2Hehmobla+d8M+tzvgEeEZzzTG/+7r8MNl4DkbnOsFqtPsTSyfvErCqhZWw20d+IFlF
 Qi9WXUMmfOK4w05Mbqv453OVlGDknBTFS0CLhdBcHtbVeK44DKq4VfuiCANnQFScPHib
 KTUAqlXuSJR7MpjYtjy62CeiU3pn44Xmv2ks/ZcHyh4UDWmtS10RRVSq0qiCqxqnk5Wj
 bodg==
X-Gm-Message-State: AOAM530djC9lu66DSb2a10xbQHLk19sz12JJIlpqpT5J/9XDsJ4e11Dk
 Jk/A7vPa0YrHCqOSd/COVPs6OpXzNeXuvg==
X-Google-Smtp-Source: ABdhPJwhiH2nXhWr0UBK4iziy417t1myipX/ctU5u5oiFakRcl5NKAsuE0r0WANie7aD1aHGZ0h26g==
X-Received: by 2002:a05:6000:180b:: with SMTP id
 m11mr44265027wrh.6.1626887466668; 
 Wed, 21 Jul 2021 10:11:06 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id w8sm16147227wrk.10.2021.07.21.10.11.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 10:11:06 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 21 Jul 2021 19:10:59 +0200
Message-Id: <20210721171059.489242-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/bind: add SELinux module
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

Support for bind is added by the services/bind module in the SELinux
refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/bind/bind.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 6c8d5d093b..1e18c32a66 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -13,6 +13,7 @@ BIND_CONFIG_SCRIPTS = bind9-config isc-config.sh
 BIND_LICENSE = MPL-2.0
 BIND_LICENSE_FILES = COPYRIGHT
 BIND_CPE_ID_VENDOR = isc
+BIND_SELINUX_MODULES = bind
 # Only applies to RHEL6.x with DNSSEC validation on
 BIND_IGNORE_CVES = CVE-2017-3139
 # Library CVE and not used by bind but used by ISC DHCP
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
