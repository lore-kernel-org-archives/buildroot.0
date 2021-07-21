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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B185CC12002
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 17:10:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7822861244
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 17:10:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7822861244
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3ACC5608AD;
	Wed, 21 Jul 2021 17:10:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4gs5553enAwW; Wed, 21 Jul 2021 17:10:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 866FE60798;
	Wed, 21 Jul 2021 17:10:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DEE5F1C1135
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 17:09:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CD4A540173
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 17:09:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iL05dJbUPjPZ for <buildroot@lists.busybox.net>;
 Wed, 21 Jul 2021 17:09:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DD50840170
 for <buildroot@buildroot.org>; Wed, 21 Jul 2021 17:09:58 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 f10-20020a05600c4e8ab029023e8d74d693so1388626wmq.3
 for <buildroot@buildroot.org>; Wed, 21 Jul 2021 10:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BidVjcmzPXzbpOn7YLd1M/dH0jM9M5qD+TQvv6h0tiw=;
 b=Nzw0UD9zeOEG5tXVRm7xylQAQJbN4OUntdviOzwvZj55wm5MZ5L9GsfuhsuaJE11nd
 IyXlbDCf4Fmv4NZKyUdiJdaRK0Elf8k0+Gl8aDUe5qgCb2uS4dkIdk+8b+A7Yi7QZml0
 9XktxwNUmFObfRNu5jm6RvE7fjnEIghdHJzqPfUsxm0Olxy4ww8as4enH+rn65g0kFPJ
 lPVEfRf8kUuA8yL6f4oRqjZhgp+KWU70FbdbcQDumVvXImlFkex1zLNdJdJqdW9fz+Vu
 JtWeFNXVFTxpBAZMztbZPnNkyKiLkmqgg9E8e+sZK7EdVw8+s5qcZFR55HHQqiw/Ivxc
 6Cmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BidVjcmzPXzbpOn7YLd1M/dH0jM9M5qD+TQvv6h0tiw=;
 b=SUvBTiOeabTGiK++S1NAqaUwp2psRvnakoMano7V+U2WSdz50ohmPOG4yXiibYlkzp
 dF8cBc6TKTiVSY1xLhNdrluZtYqcXlP/dRHtnP+YD6NxQeJwof5+KGMoEaGOgBnXhC7j
 auv3UM9j8w56aZ+br3OCWKyeQRCYCiDtmvIzTjTci1JyW+fjMftjBeShBX5ho5V7hrOq
 UqRvdY1OlGLIttNA8cAQCup14V6sAhQdYLhR36+OpWxz+AVaYU/ssG80/HFJiyi09uOb
 9BNoIW5tZvPXit7sik8R/Udu4/MO0W3iIe/06rNhNJRMTeqENpSauwHHJXjNqn/jkLjW
 tIpw==
X-Gm-Message-State: AOAM532BTjz89rX5iCAhbB4HNDMRVLPls1qlR2waNgsT90DGutLq0Bk6
 ogveGkjaaTkLKNt6qXFMsxaLldg0ASbgoA==
X-Google-Smtp-Source: ABdhPJyobi5aFwhsBAk6EajGzj+Gs3ovsZu1ygjG+0iupEh9nTQpkyL83Wfdh8jyuKLGFR1H/W7o2g==
X-Received: by 2002:a1c:4e10:: with SMTP id g16mr2650950wmh.66.1626887396847; 
 Wed, 21 Jul 2021 10:09:56 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id t1sm13555284wrm.42.2021.07.21.10.09.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 10:09:56 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 21 Jul 2021 19:09:52 +0200
Message-Id: <20210721170952.488953-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/tor: add SELinux module
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Support for tor is added by the services/tor module in the SELinux
refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/tor/tor.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 74845e05f3..30ad34115f 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -9,6 +9,7 @@ TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
 TOR_CPE_ID_VENDOR = torproject
+TOR_SELINUX_MODULES = tor
 TOR_DEPENDENCIES = libevent openssl zlib
 TOR_AUTORECONF = YES
 
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
