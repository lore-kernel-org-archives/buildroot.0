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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58A93C4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 20:01:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D36761040
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 20:01:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0D36761040
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5A7440469;
	Sun,  1 Aug 2021 20:01:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sWm1ahd2hjxk; Sun,  1 Aug 2021 20:01:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2BE7440466;
	Sun,  1 Aug 2021 20:01:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 320011BF424
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 20:01:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2177D40466
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 20:01:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YMoWXQwcTjLf for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 20:01:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7D4DD403A2
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 20:01:45 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id h13so5423375wrp.1
 for <buildroot@buildroot.org>; Sun, 01 Aug 2021 13:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=V/qXh9gcPwESUs9WvbllxNYhk3gSe3fPEa4Id7xIcLc=;
 b=pJ1e3fqVyCFS8EAvZduRINSaqKff7/PElik5gCutRMJTvrFyAwSsCuaCigSwAxmn8h
 j+vhWA/tp318aG9H+9dIamWb5Ogg0NWQ0W89qgoAyXayA+nX3F5VgvYR5dTkMDCdxCNV
 zbbisTEywnM0Vb1MlZ154sWIA1OK2d1QP9oPMW5PPsIPkz8x9d4MNqhTfADCUwWdsez6
 AjiXKlhA5KZESTIBB4W3swMyfutUqgEC94ynj9ye/jwSuuiEHKJvGY3ty9w0llfA4GdI
 /83FGoRXH4JBRtTbgldd+N2er9bRN/Iffx8Qh5/upgqbaufkj0C2P1tSp8PpCRZXw/EI
 /NtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=V/qXh9gcPwESUs9WvbllxNYhk3gSe3fPEa4Id7xIcLc=;
 b=shCj1s1ZWDqI0tIubQYSZK3LIg8b2COmhX9e0J6FbILFBbDd1o9iewyr2hLzKhgd/R
 Vaczcek6w1xTNblr8oTX3fuB3AWS1eTlYbW9hK5MGA3KBtVkhMi0uBwBv1XMq/LAj7vp
 jH9FZ8r7RALs8GOfL6qVkEWoNnqi1Mi+n898pqGC9StLxlDMYiMJAixbWrcMIiWb/wTX
 uCT7UWWJIqR49seQ2wAoR2bthyugHXwRLCUc6QEsnuU4IWTnpbni5jKHTPYQn0VFfDvo
 Czc+Wa/JTj2iILBCBbYaCziolyJKFb2hZhI2+07MO2y79Vpzg3iqG26dFUm7qxNbR+Ey
 Q2nw==
X-Gm-Message-State: AOAM5336iUBASGfMfIpAZeqJnt7yRyL0jwkToUoUYBvU5GgyXpf65CJ7
 mTSfKnvlC/0OSWse28ejV4ahFJ1VN5ZPyQ==
X-Google-Smtp-Source: ABdhPJw+vw6DsK0HX/vwQDvANXsthuaOEh51j5psGY/bjaNUsyl88EtINIpblHyGzIJtdydohN4MMQ==
X-Received: by 2002:adf:dfcb:: with SMTP id q11mr14238777wrn.16.1627848103286; 
 Sun, 01 Aug 2021 13:01:43 -0700 (PDT)
Received: from kali.home (pop.92-184-106-251.mobile.abo.orange.fr.
 [92.184.106.251])
 by smtp.gmail.com with ESMTPSA id p8sm8868855wrn.79.2021.08.01.13.01.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Aug 2021 13:01:42 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Aug 2021 22:01:37 +0200
Message-Id: <20210801200138.3969620-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/proftpd: add SELinux module
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Support for proftpd is added by the services/ftp module in the SELinux
refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/proftpd/proftpd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
index 21fcc767b5..f06094735f 100644
--- a/package/proftpd/proftpd.mk
+++ b/package/proftpd/proftpd.mk
@@ -9,6 +9,7 @@ PROFTPD_SITE = $(call github,proftpd,proftpd,v$(PROFTPD_VERSION))
 PROFTPD_LICENSE = GPL-2.0+
 PROFTPD_LICENSE_FILES = COPYING
 PROFTPD_CPE_ID_VENDOR = proftpd
+PROFTPD_SELINUX_MODULES = ftp
 
 PROFTPD_CONF_ENV = \
 	ac_cv_func_setpgrp_void=yes \
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
