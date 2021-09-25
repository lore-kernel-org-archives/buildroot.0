Return-Path: <SRS0=vewd=OP=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DBDBC433F5
	for <buildroot@archiver.kernel.org>; Sat, 25 Sep 2021 07:50:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B48D61151
	for <buildroot@archiver.kernel.org>; Sat, 25 Sep 2021 07:50:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8B48D61151
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2A77A40200;
	Sat, 25 Sep 2021 07:50:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OzOo8-f2TCx1; Sat, 25 Sep 2021 07:50:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1209440147;
	Sat, 25 Sep 2021 07:50:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 039491BF2AA
 for <buildroot@lists.busybox.net>; Sat, 25 Sep 2021 07:50:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F30A240147
 for <buildroot@lists.busybox.net>; Sat, 25 Sep 2021 07:50:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AjwXRbMU2AHG for <buildroot@lists.busybox.net>;
 Sat, 25 Sep 2021 07:50:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AF2AB400DE
 for <buildroot@buildroot.org>; Sat, 25 Sep 2021 07:50:10 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id t18so34372591wrb.0
 for <buildroot@buildroot.org>; Sat, 25 Sep 2021 00:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GmzMKLpRLjEMtc9454qsRiJ7Qx/INml57gz5YpKTUKI=;
 b=O1Ri3TA7pXcnBSpJoSrdV/k9KaGMiw+HA06PIBOkyi6bvLDIAh+HMnDxG1HqtZ/dS7
 5i+BPK6W3oBGc355/ZSN8BNfoOU8zPW+Yk+BNpnZmCX5gnJGlOznFVJn++P1hZmuZbas
 SMDPk6hZWXOxQNfISIzPpAqJ/S9XnKaSFiEcg4Vd62Wq/+ycB+mFJ5OzO500BY0qjd/x
 9ds6AANuHTuN31mgNk1WLFR1qmP9taFnUrdUYc7CjROWDKmSnSMWfNvN9TYK9VpKbWA1
 dOeTDsRoHsf80OvBKo12cda6jmMzlHY4e1wJa6onSFyJPGNJF37urhflT5bMJg+HL8nW
 5RDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GmzMKLpRLjEMtc9454qsRiJ7Qx/INml57gz5YpKTUKI=;
 b=HJoIY90pex0Aq8jcbzDtirICDWZxIaN8jDiR/fWH1lJm/3sbky9gCj5enESuGYTKKa
 j72TiWNk16GW5nV4UV+8npMHp69zNUbk12fXjdGxSPE77dwdIBX0xQ+lbm1hmMh2pdgY
 dxsgJt2KRU7Aq8gEdBXgRPPIVJUb7Jh0VfMyDdl8EijETjWr02J5+PUs5XY7DKxyZXiw
 kDGpXSg2G2PCuPFOqnzrem0PX6f5TxC1E14zewl09bgLBwZJ1/UCWLCJglflqBR6Mn2y
 qogalnft/LxJwOLaJUZgLZVFSDb8jfpXyPwyzxSmroJ44hK7CQcdCqEeDLX2dDjSmq0G
 Q0+w==
X-Gm-Message-State: AOAM530TgDpnyJFPEYhXPBy1sw1lO+ABvScU1bIPrWN6l7Tc+5aBekyw
 /aU2RBKvfecf01l7f8RbdDCI8fJxbgo=
X-Google-Smtp-Source: ABdhPJxWvxXqY0OiKzrgLKYYfYJvCHWKkxfSJqT8OE0HniF2AQ7KkBQTyMeTXJqb4302HTTEB8ZwhQ==
X-Received: by 2002:adf:e0cc:: with SMTP id m12mr15805258wri.62.1632556208489; 
 Sat, 25 Sep 2021 00:50:08 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id q7sm10965006wrc.55.2021.09.25.00.50.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Sep 2021 00:50:08 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 25 Sep 2021 09:49:39 +0200
Message-Id: <20210925074940.3212124-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2,
 1/2] package/lvm2: make a standard install for host
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
Changes v1 -> v2 (after review of Yann E. Morin):
 - Use --with-confdir instead of DESTDIR

 package/lvm2/lvm2.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 3a94aebfd4..5ca0dc565f 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -71,9 +71,9 @@ HOST_LVM2_CONF_OPTS = \
 	--disable-dmeventd \
 	--disable-fsadm \
 	--disable-readline \
-	--disable-selinux
-HOST_LVM2_MAKE_OPTS = device-mapper
-HOST_LVM2_INSTALL_OPTS = install_device-mapper
+	--disable-selinux \
+	--with-confdir=$(HOST_DIR)/etc
+HOST_LVM2_INSTALL_OPTS = install
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
