Return-Path: <SRS0=tdpc=MY=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AD71C4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 08:05:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B94FA6108D
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 08:05:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B94FA6108D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FB2D8343B;
	Sun,  1 Aug 2021 08:05:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pb2lejHg4C3s; Sun,  1 Aug 2021 08:05:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 26B8583449;
	Sun,  1 Aug 2021 08:05:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F18E21BF42D
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 08:05:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E168D40395
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 08:05:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OU_CuzmDk_or for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 08:05:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B321240394
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 08:05:41 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 f14-20020a05600c154eb02902519e4abe10so11812567wmg.4
 for <buildroot@buildroot.org>; Sun, 01 Aug 2021 01:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jxC3B9BxYmAPGJWem8oEv1rjD1tyawoj712qq8ies78=;
 b=fwvOdB7k/fhVXL6ElkRPLzC2sNl9FT1hapaALMmFrFNAlu/nYYnPsZCE+B3cAe/1Dh
 MRNcXSlAHwWsfm4YE9/khcfA3frb9A0o5RFGrzjFL2KMWxf5xi2dUjp8hCkZKMBv2D8V
 JyyYszS9XOTInvZjdMz3fHHjVsdme+tX13jubsbh63qLdsDVB2di5mQptwR3dmmz3B2x
 5arQjA4FLK918MJMPgt+G8tIGLESzWAwVumyelj35ngYQ4Nor3wvS2Utx978F7Re0W+i
 EkZX4gZAVMYeM9hNx5sZ2ceIpl7MlHKpnsdaQcjzZ2ZG4IfF0r78RtxtZVdNQoc/6EE6
 ZTEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jxC3B9BxYmAPGJWem8oEv1rjD1tyawoj712qq8ies78=;
 b=HRKacOLpcYsNxp36NOb2rd3ym0qq9dUioeCI4GGfiryNSfAOsiU7+5dcixMG3KnpDL
 XGvupmqAnM5hFVXZsPuMJZ2KcpACqCtyk0ZQog1g2hxGSL594mWA8XDxTBuml+0tksAO
 goUY0rVt20kTbAd8AvTbXMs7b5wpSZoLokt7rHaUbKnQpxbTssvQsTXje3HbfwvU0w+l
 hwWnULxzjA5RBnmB2gAP2xBMfDQGSYK7XfHWtw2kJq6tF2WfevmxVBQWfjhcGYwa7stW
 Q5dnu5iUM5m6el2AvjUPZuHg1LqXOJs7eb73JZ7v5r4fzxgkJTUn/RNDcghV9ynZSUIS
 2OpA==
X-Gm-Message-State: AOAM531Nj5/fHhufwvP7jYpF6kYbP6IsvgGOe275FPP0RDXa1zvtNuxE
 JVyBTC821ifpr8DMYTJKxnB7aUOMZDZMng==
X-Google-Smtp-Source: ABdhPJxkgsq1VvnGisPlwSLKbFLwPA+v03UKvaat7865Q5Av0MqNZtCmUcj9qzznn+lgoiPMCYa/OQ==
X-Received: by 2002:a05:600c:3041:: with SMTP id
 n1mr11389076wmh.19.1627805139729; 
 Sun, 01 Aug 2021 01:05:39 -0700 (PDT)
Received: from kali.home (pop.92-184-116-243.mobile.abo.orange.fr.
 [92.184.116.243])
 by smtp.gmail.com with ESMTPSA id z137sm6718773wmc.14.2021.08.01.01.05.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Aug 2021 01:05:39 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Aug 2021 10:05:25 +0200
Message-Id: <20210801080525.2604491-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/pppd: add SELinux module
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

Support for pppd is added by the services/ppp module in the SELinux
refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pppd/pppd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pppd/pppd.mk b/package/pppd/pppd.mk
index caf93062a7..a6bacd787f 100644
--- a/package/pppd/pppd.mk
+++ b/package/pppd/pppd.mk
@@ -12,6 +12,7 @@ PPPD_LICENSE_FILES = \
 	pppdump/bsd-comp.c pppd/ccp.c pppd/plugins/passprompt.c
 PPPD_CPE_ID_VENDOR = samba
 PPPD_CPE_ID_PRODUCT = ppp
+PPPD_SELINUX_MODULES = ppp
 
 PPPD_MAKE_OPTS = HAVE_INET6=y
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
