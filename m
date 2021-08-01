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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 146C6C4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 11:44:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6132610CC
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 11:44:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B6132610CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90683607C2;
	Sun,  1 Aug 2021 11:44:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DEcGFtgBcWfl; Sun,  1 Aug 2021 11:44:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A1FB6075A;
	Sun,  1 Aug 2021 11:44:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5DF291BF303
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 11:44:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5AFA2403BD
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 11:44:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k5x7h4Br2GFy for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 11:44:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9C5CA40390
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 11:44:47 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id d8so17913425wrm.4
 for <buildroot@buildroot.org>; Sun, 01 Aug 2021 04:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9DUhVLAhfP025JyVA2Cm+0FtW1HQfRDAMuAVKZAEnGs=;
 b=eDEyd65lEIrerZT8dnmnAcOuAQXVbo9OCEGyy4s2xn+snxmdt7jnE/lP+oKwCWmNBF
 gDgFXp/v8IZX38ybWpu9G0mrlShUErCvC1/1OzEgPvYpRQA1UFLgR+a1KpjLDxSbLwax
 gFo8ScjqXLPwCQnefARhyAmPgEiDaunve66MFeU+g7RN4VmaSNCP673Ke3Fjy+8IfPCo
 3N2nZyjboY59udi8pj154ZwKnvAtu/c/CMNHmMVmUCkrlONPsKjMYaq66Qijz55aR/ps
 w66EAAh/r6/V1R+v3Sjy0+5I556xKtpVsORADdDQ0qcniLedA7WgjUMxS5o5qkJj/CT8
 W80A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9DUhVLAhfP025JyVA2Cm+0FtW1HQfRDAMuAVKZAEnGs=;
 b=WLCx/Ibpnr+kB8we8tU1NJ/jEZEaMECFb0hkAW+YxT5Lz+YUBGJSwL/+jLqBx9nqQs
 Zz6YLh9G9RCdgcfj1YaedHnYbCD1R7C24DUML6b9PLnT2rwK8Nn6lau/8ua1jaU59gxw
 h53xtgOLjThFJoAd6iIpo2BQIBKV+GeOPXse2QusplLN3COhewQI4kdgmpniJxn6MxXA
 X+s7kSx23hvo3HerkQS3KlqNXmkZSZj1JXDIbfnmiMZmTvE/exYlPnNHetHLBSSoy57Z
 CuUOQncRwqD8f+j39KcLuL8Ud1hvcT6KujpgIzUa6tefmqeKGyH6uixMHNNnKsm0YDpQ
 hzAw==
X-Gm-Message-State: AOAM5303zCeaoprdyTdpg/eHHmJgzA/obd8KiQz1+oao437efKWtlR6A
 CCqqZ3T3dfJXrnu850c3t3fGS+78lZlrzg==
X-Google-Smtp-Source: ABdhPJxH+EZExWbw0DsvorkE2loyy1rpypMDIRY04Wj4L6HSfFKONVas93aYGKVMCgkX2zBP37BrEg==
X-Received: by 2002:adf:fa11:: with SMTP id m17mr12429003wrr.150.1627818285645; 
 Sun, 01 Aug 2021 04:44:45 -0700 (PDT)
Received: from kali.home (pop.92-184-116-62.mobile.abo.orange.fr.
 [92.184.116.62])
 by smtp.gmail.com with ESMTPSA id a12sm3564712wmj.22.2021.08.01.04.44.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Aug 2021 04:44:45 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Aug 2021 13:44:39 +0200
Message-Id: <20210801114439.2763436-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/ulogd: add SELinux module
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

Support for ulogd is added by the services/ulogd module in the SELinux
refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ulogd/ulogd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ulogd/ulogd.mk b/package/ulogd/ulogd.mk
index 1b86c12773..c00a53f3d5 100644
--- a/package/ulogd/ulogd.mk
+++ b/package/ulogd/ulogd.mk
@@ -13,6 +13,7 @@ ULOGD_DEPENDENCIES = host-pkgconf \
 	libnfnetlink
 ULOGD_LICENSE = GPL-2.0
 ULOGD_LICENSE_FILES = COPYING
+ULOGD_SELINUX_MODULES = ulogd
 
 # DB backends need threads
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
