Return-Path: <SRS0=IJqM=OO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7399C433F5
	for <buildroot@archiver.kernel.org>; Fri, 24 Sep 2021 21:40:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D4A9611C8
	for <buildroot@archiver.kernel.org>; Fri, 24 Sep 2021 21:40:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3D4A9611C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF69642351;
	Fri, 24 Sep 2021 21:40:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E8Z0GK18OmNr; Fri, 24 Sep 2021 21:40:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E44140679;
	Fri, 24 Sep 2021 21:40:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2A86F1BF3B5
 for <buildroot@lists.busybox.net>; Fri, 24 Sep 2021 21:40:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 16E0683E9D
 for <buildroot@lists.busybox.net>; Fri, 24 Sep 2021 21:40:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FSN_KDeinzzB for <buildroot@lists.busybox.net>;
 Fri, 24 Sep 2021 21:40:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6717F83E84
 for <buildroot@buildroot.org>; Fri, 24 Sep 2021 21:40:22 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id d6so31230639wrc.11
 for <buildroot@buildroot.org>; Fri, 24 Sep 2021 14:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7OsNJiH8jH5gv9qjZ0J2QRzDAsHEG6CN5WlGsUDuZK0=;
 b=p3d5ozyFVIjyMQ3iXglCIus1RX0GO88XF6GttOv598GNqxB44yIgqD6Gc7FsNpPMXT
 b5aVaviv+8RphEgaW1bsJC57sU7q1YgbaQcaH1HtU77zpmKcbZqEd8XIJ/7Z1RMLwAnj
 Eqe/mTenwaKi3BlTh8d3WqDXTfkga8l4468qvSdIvioiqjFUVbXBLOZSkrUOpyWvPRqm
 1Nlq5NTrKDoFWZOBiRVeA8cJlZEwOKDqZm3R47QVP6EAr1E/Hh2uDH1oqiy8sVFtvr2L
 fXzjjFBr0orambimuzyRs78KWWNbqtdEWv2FucjsOxP5E6FucnxdCA9oxNF5tekza/Hk
 4iBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7OsNJiH8jH5gv9qjZ0J2QRzDAsHEG6CN5WlGsUDuZK0=;
 b=VHLC8+JB2d0AaPBZPbxN+Ai7JDmS/7qz74thQj0xUUt8IUvgYFOXU3nSVpfUZSGXik
 d8jNTSUFxGFS0GuTytQh3xFTSSGCBw3LryOyHowFVjG82ERL5d0BlufQimSZLFrtaTDR
 1iqf+I7s1CX4YjbmSFs2wmceUZQOkrqA+b064TUgkW7nZunAxJBOyaZZ1kUTuphk5/7P
 SQF781xCsJViZl6p8CyGuZ+upLcOZm6nAIC/iEn2Fd4kGM59dt9RgNJRGqMEDo3cXycO
 E946n33rbLGGwrC36nlG309Ufmt/Bip3ylBO4VmJhuAcPnDV4JG+uZ6PZ2LXu0+xJd/F
 UT7w==
X-Gm-Message-State: AOAM530cIn/7eEjY0QodnTo3O5vcRi5NKhMjLhPB5OjdvJY6ZvLca5fM
 BWTO91sHp1puZZKQgSMeBp/Y4oj8XRk=
X-Google-Smtp-Source: ABdhPJzyL9wb7v2FtEmJCjd/KgP1oZ2BgtEfSTgTJPKNCl9cvzj11C5pwPM4aOk4LnrkS4LM2v1QSw==
X-Received: by 2002:a7b:c1c5:: with SMTP id a5mr4365214wmj.144.1632519620437; 
 Fri, 24 Sep 2021 14:40:20 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id y197sm15641526wmc.18.2021.09.24.14.40.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 14:40:20 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 24 Sep 2021 23:39:45 +0200
Message-Id: <20210924213946.2888625-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/lvm2: make a standard install for
 host
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Jared Bents <jared.bents@rockwellcollins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Make a standard install (i.e. with pvcreate) for host as it is needed
for libvirt

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lvm2/lvm2.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 3a94aebfd4..d918b5f5b6 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -72,8 +72,7 @@ HOST_LVM2_CONF_OPTS = \
 	--disable-fsadm \
 	--disable-readline \
 	--disable-selinux
-HOST_LVM2_MAKE_OPTS = device-mapper
-HOST_LVM2_INSTALL_OPTS = install_device-mapper
+HOST_LVM2_INSTALL_OPTS = DESTDIR=$(HOST_DIR) install
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
