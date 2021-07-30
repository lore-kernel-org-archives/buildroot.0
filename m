Return-Path: <SRS0=Uqjv=MW=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A6B0C4338F
	for <buildroot@archiver.kernel.org>; Fri, 30 Jul 2021 20:51:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFC0760F4A
	for <buildroot@archiver.kernel.org>; Fri, 30 Jul 2021 20:51:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BFC0760F4A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 78B964059C;
	Fri, 30 Jul 2021 20:51:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3QPnzAtQGaiz; Fri, 30 Jul 2021 20:51:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9CBE440597;
	Fri, 30 Jul 2021 20:51:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E0C581BF97E
 for <buildroot@lists.busybox.net>; Fri, 30 Jul 2021 20:51:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CECB340597
 for <buildroot@lists.busybox.net>; Fri, 30 Jul 2021 20:51:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id asLsPqqtcGW7 for <buildroot@lists.busybox.net>;
 Fri, 30 Jul 2021 20:51:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A017C40590
 for <buildroot@buildroot.org>; Fri, 30 Jul 2021 20:51:36 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 f14-20020a05600c154eb02902519e4abe10so9939947wmg.4
 for <buildroot@buildroot.org>; Fri, 30 Jul 2021 13:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VBbBuDqoe338F+zH48eahyKl5BGT3t2dblmyk8h40pk=;
 b=YR41CK9LFemNCYS/yffV6oUTO0D9wy4uHFwvDZFxsZk3ZHNRrXaaxcJNRHptp4ap1X
 O5l9QYWtcUFwpHxkhj9OBPlx0bS8HlG2DWwtVEKKjdj0FRZrwb+F7SYpJIzYzazY4dA/
 lu/maNFhnUQFCJfakfsJ2l+3Jec27TL868vpi/xGk0XcxA316gg5SG+14RBQJEL+KN7h
 dTkUA/kscXcVkmSrRUKo12cvdZwdPJNOLcjMxfaAa09ciPYfvS80Nn7f2u3V0jmFf8/0
 4JNERvgPew2n0xD9C80IVfSP/m04c5LddywIfe0frHKZZS8QZ2tpKhT6dfmRQixXl8sf
 F6WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VBbBuDqoe338F+zH48eahyKl5BGT3t2dblmyk8h40pk=;
 b=l3qVtU0lMy1aaGFLbHDcRAEfGReM0Na7Ns6GoPsIrYTPSpkaz53NpKhdcz/e8a1iZy
 dEamd3Nv5YEUfh4+6B6CzKVZb1WOCLjyH2f8vwMdrjhkdMO0DDzXHUVz+EG3rO/KuICe
 RwB9S2tNBv3Z9FFFxFslKWD1a1i3AMFFZJKcG91ZF3nuu9xOa30LFzSPANjDVjUskqSL
 Zo1dbbKGZj1UWjqhA/BzZKkEq/CCyyy3ifhjiyjB1rspi3OWXJ9Di3ccadJ5o3zU8vIs
 hWGzotAGX6LoINSbVdSmtYkXaYOMlCdegggNuxhDoCC5RdKrWPcnsvQe6CbNaWKfCMkn
 rX3Q==
X-Gm-Message-State: AOAM533G+0WW/EkShlm8OLxuP2+E7h7cZad2cVjRPZcu63e9WXRESJkh
 HMGfiSpmEV0CRPkLcUAwwH2rHrNVSQ7gww==
X-Google-Smtp-Source: ABdhPJwE1r8hL9e/GFdigEPMa+mjKYqGuy3SANfZD87sw5035SVq5PSHEmgJu1Wufd2s9y9qBSh8UA==
X-Received: by 2002:a1c:e90f:: with SMTP id q15mr4955627wmc.175.1627678294575; 
 Fri, 30 Jul 2021 13:51:34 -0700 (PDT)
Received: from kali.home (pop.92-184-116-175.mobile.abo.orange.fr.
 [92.184.116.175])
 by smtp.gmail.com with ESMTPSA id s1sm2797723wmj.8.2021.07.30.13.51.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 13:51:33 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 30 Jul 2021 22:51:22 +0200
Message-Id: <20210730205122.57267-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/fetchmail: fix SELinux
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

Build is broken since commit f043646044261578fd554c1f899b84e798ef9437
because services/mta module is mandatory with fetchmail

Fixes:
 - No autobuilder failures yet

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/fetchmail/fetchmail.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/fetchmail/fetchmail.mk b/package/fetchmail/fetchmail.mk
index c2e5e3e9c4..10a544413f 100644
--- a/package/fetchmail/fetchmail.mk
+++ b/package/fetchmail/fetchmail.mk
@@ -11,7 +11,7 @@ FETCHMAIL_SITE = http://downloads.sourceforge.net/project/fetchmail/branch_$(FET
 FETCHMAIL_LICENSE = GPL-2.0; some exceptions are mentioned in COPYING
 FETCHMAIL_LICENSE_FILES = COPYING
 FETCHMAIL_CPE_ID_VENDOR = fetchmail
-FETCHMAIL_SELINUX_MODULES = fetchmail
+FETCHMAIL_SELINUX_MODULES = fetchmail mta
 
 FETCHMAIL_CONF_OPTS = \
 	--with-ssl=$(STAGING_DIR)/usr
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
