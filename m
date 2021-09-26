Return-Path: <SRS0=Tewt=OQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 648BFC433F5
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 20:35:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA99060EE7
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 20:35:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EA99060EE7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4808402E2;
	Sun, 26 Sep 2021 20:35:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3BvCocj8KtTZ; Sun, 26 Sep 2021 20:35:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0FDFB40246;
	Sun, 26 Sep 2021 20:35:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4D34E1BF3DB
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 20:35:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4899E40198
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 20:35:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1rNJY9l09ZqO for <buildroot@lists.busybox.net>;
 Sun, 26 Sep 2021 20:35:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5713B40109
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 20:35:20 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id x20so1220555wrg.10
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 13:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CNwWq4YimGhhdOm7/a0f3zqqHehb1sUu6jIW3zqPM9c=;
 b=XoYNnBd2/H5KYHFrtc3U4QGGN/2wrDydfE5/9ynOvHp5JaGKsaAYTyYAgyrnwY21Sv
 PdQgFCAdIRKrj/3WfaY4cLNhlLnwjI5VCfs8hNyQkTTvUhUDx0RgkckDo2d8e6GeO/Iw
 Rtc2P6safEM1ICaeyA7pY9TMbwpiFwmdlXIAuUwcm+NQ3o89UyhyiqaKlcskOu0m+LJY
 9mIQ9TTC/4LvX/WGCnqdrb+M4YB1xzQlyekuCkdAF4uPJLRnfyrgkQYDmQRlKcUUcF2z
 s7MjBgAP1DGNRIggLM180hwE7OrsjRPbSgmcK8XpkgQN7VskxpMUPzblUnSCtI9nFfDd
 76qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CNwWq4YimGhhdOm7/a0f3zqqHehb1sUu6jIW3zqPM9c=;
 b=EYjAY4odeMJtO7N06SznHirmDM3o6RCnFa3nhWy8116jhOb0QlKSXgVOD/tSqCx7PV
 9zCj/KYTEwenhBlNfXUq849Xdz/16hz7W5WOnUiiO+nw9gitGv/tpFKGr3DSy+5Ol3aR
 mNXjv4BZuussuFY8ECIzxRzbWtbI1BwzsZ8czBVM2HHOIW5a/+fzTE/xykB5xTNzmJOC
 /ijnrgjknYe8Z2Rd8Bc+YpbvLEliuwwt1ji+1dpCedyusjbty/N0+qk+MkMbmMtqgBXM
 7oGXKx63M6ozjcJzZZRCiM0RzLCZf+08gmr8aAvipTQoePgFusWk5Ov2qxoOgGkxEH9a
 eQWQ==
X-Gm-Message-State: AOAM530dEX6dJWXoETTe2uFNmWrx/AfXxHyonjwjJYsXXQAvg6mbyv8d
 BzF0cTZv3T074cX2UEZZCv7z95MNXp0=
X-Google-Smtp-Source: ABdhPJwImYfU+F4NPxP25tPwYnQWLxN6z7Bbb+IU0dQyDnFwdQ0FIaa4wxNjiFG2/i1M8b1YSRsJbQ==
X-Received: by 2002:a1c:a512:: with SMTP id o18mr12601794wme.162.1632688518876; 
 Sun, 26 Sep 2021 13:35:18 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-421-88.w2-10.abo.wanadoo.fr.
 [2.10.246.88])
 by smtp.gmail.com with ESMTPSA id d1sm16340074wrr.72.2021.09.26.13.35.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 13:35:18 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 26 Sep 2021 22:34:28 +0200
Message-Id: <20210926203429.261419-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3,
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

Use the standard install for the host, so e.g. pvcreate is installed as
well. pvcreate is needed for libvirt.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v2 -> v3 (after review of Arnout Vandecappelle):
 - Update commit message and drop HOST_LVM2_INSTALL_OPTS
Changes v1 -> v2 (after review of Yann E. Morin):
 - Use --with-confdir instead of DESTDIR

 package/lvm2/lvm2.mk | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 3a94aebfd4..70da10696c 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -71,9 +71,8 @@ HOST_LVM2_CONF_OPTS = \
 	--disable-dmeventd \
 	--disable-fsadm \
 	--disable-readline \
-	--disable-selinux
-HOST_LVM2_MAKE_OPTS = device-mapper
-HOST_LVM2_INSTALL_OPTS = install_device-mapper
+	--disable-selinux \
+	--with-confdir=$(HOST_DIR)/etc
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
