Return-Path: <SRS0=yDzA=MT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34280C4338F
	for <buildroot@archiver.kernel.org>; Tue, 27 Jul 2021 11:25:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4E0961409
	for <buildroot@archiver.kernel.org>; Tue, 27 Jul 2021 11:25:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C4E0961409
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 932A5829A9;
	Tue, 27 Jul 2021 11:25:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yddt1bBDrJjU; Tue, 27 Jul 2021 11:25:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F2083828BA;
	Tue, 27 Jul 2021 11:25:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6D4FE1BF863
 for <buildroot@lists.busybox.net>; Tue, 27 Jul 2021 11:25:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5CD6B828BA
 for <buildroot@lists.busybox.net>; Tue, 27 Jul 2021 11:25:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 878tXZeQHnqI for <buildroot@lists.busybox.net>;
 Tue, 27 Jul 2021 11:25:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CA60D82779
 for <buildroot@buildroot.org>; Tue, 27 Jul 2021 11:25:50 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id c16so4928866wrp.13
 for <buildroot@buildroot.org>; Tue, 27 Jul 2021 04:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GU71n/L0yOjRHdvcNGF+hPkrMUTOjcNzzzI1/ExT9j0=;
 b=S04ur1pSFBYoDTwj856tKVb/Wa4o4h7S9Nl7xxczqVg2C8WEl+7Dk9tpa2lu7A3kpI
 MtjZ/YhaLY6PJNCvXyQc20AveAoxLEFkvtnzibL/R83NuQB+YhlGYzUNebAwPvVM7mtt
 drFlsnskBz0//AxWxFwZvBmX+cmANSBVcol5TO3KRFbMKrtHjX36zDPwzu7uKS4A9ZUX
 DtrbDDHNpOv+BEKhrZUnsLmawInLEaJZpaXHY1K1vIQ43cm/biZwKz42o5Nf4Qvov4S0
 ZcFc+uwUPtQJQPPPtE+EJw5xb1b5QOgYNx1xfR9dDXR+BHu/AyDVCcdwy7SiDQah8SjP
 qsgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GU71n/L0yOjRHdvcNGF+hPkrMUTOjcNzzzI1/ExT9j0=;
 b=lzNc2W/zumIlBRYdPS6UG0gHEeumVM4yPuoUJr4sBUFkOS5r5iznWfgaZd3bx23ZKL
 BOZAodMVvNb7SR7SVvk5WykBr6dCOokyNC2CddqZs4wO9J4+gT92FHt2voSQPKVrsWIu
 V8RSe76v42zT/ZeOEK95eEVG1UGDy+K1xWbcY4TFEC7a9BJWMauruTdtJaT9HsMpvvcg
 TlCFt0vWBpi96XiRsAVZXivVl6h5W8dvVS36RsfWQPyeRBZPTCCFJo8zZZKa9nghgf5o
 l/qTH9aD5JC5Pm/0EYGhK4uCV1nzYIhdlrAuE0bkpQiHxKycQsdkUbsa2LuNWdWTFg+A
 8+ug==
X-Gm-Message-State: AOAM5332LKtIKGRezFi/HQsuLPloZvgO0z/tVj0Iq+sqYlE8kRf5nbpH
 XMrw2smzKbAZ3YwfHxE3nHdhUXK9ecKeHw==
X-Google-Smtp-Source: ABdhPJzN/nEcqoKUEE63LKJPNpAfm0qdwxP8aQgX9F6JRJ2ypTtfXgwu97Ds7QDs/9wxdP8WdJ8+Pg==
X-Received: by 2002:a5d:5550:: with SMTP id g16mr20933792wrw.336.1627385148802; 
 Tue, 27 Jul 2021 04:25:48 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id t16sm2437855wmj.16.2021.07.27.04.25.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 04:25:48 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 27 Jul 2021 13:25:43 +0200
Message-Id: <20210727112543.2373631-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/vsftpd: bump to version 3.0.4
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

https://security.appspot.com/vsftpd/Changelog.txt

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/vsftpd/vsftpd.hash | 2 +-
 package/vsftpd/vsftpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vsftpd/vsftpd.hash b/package/vsftpd/vsftpd.hash
index 955cd30889..751faf61ca 100644
--- a/package/vsftpd/vsftpd.hash
+++ b/package/vsftpd/vsftpd.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  9d4d2bf6e6e2884852ba4e69e157a2cecd68c5a7635d66a3a8cf8d898c955ef7  vsftpd-3.0.3.tar.gz
+sha256  6b9421bd27e8a6cdeed5b31154f294a20b003a11a26c09500715a0a6b1b86a26  vsftpd-3.0.4.tar.gz
 # Locally computed
 sha256  c9cf119e2f9dbcf187fb805ba5aded105db26a693803636fb7228c98460ffbf2  COPYING
diff --git a/package/vsftpd/vsftpd.mk b/package/vsftpd/vsftpd.mk
index 49b9b1917f..181f82f397 100644
--- a/package/vsftpd/vsftpd.mk
+++ b/package/vsftpd/vsftpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VSFTPD_VERSION = 3.0.3
+VSFTPD_VERSION = 3.0.4
 VSFTPD_SITE = https://security.appspot.com/downloads
 VSFTPD_LIBS = -lcrypt
 VSFTPD_LICENSE = GPL-2.0
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
