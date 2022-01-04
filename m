Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E76CFC433EF
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 18:13:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9202140236;
	Tue,  4 Jan 2022 18:13:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BNxOxIy3QgyY; Tue,  4 Jan 2022 18:13:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AF10140558;
	Tue,  4 Jan 2022 18:13:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 22D151BF5DB
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 18:12:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 121DB80CE6
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 18:12:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j2KSncwl2a1y for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 18:12:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3301880C3E
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 18:12:29 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id t26so77815478wrb.4
 for <buildroot@buildroot.org>; Tue, 04 Jan 2022 10:12:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eI/nvY8dH3TuT3t8lk7lUtDUwI3JOAigvm0ynippg2s=;
 b=TR913H3XZxMaT4R3mO6Q5M064+oz2ZbxHidicLpl9GEy1dDNoRVoDBhMZJfucLsZ/W
 qzfH5jATXfgxQC5SJezU0gPOLSdXN0y2QTH0w/O8RQU6yezHj5MPxeZhtpB2ggdMMyyz
 2P4n2cUeHb2jkwYBgM6g9bgLpv+j6+bvF6YiGgp3gubjaATKwVMcTZfyVBJ1Q2076pdZ
 QUfOZ+YtEeH29huh/NeVuVv99m9Sa+nKjEai+y/iGkBXyyQLN9Mva6RP8fVz5klBOF6f
 yNAZJoaJ2kZiWnuHKBHqu9PNXp3z9+BiSxcLBi+sWftZiLuavbEs+7MBHziIRrgn68dh
 CmTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eI/nvY8dH3TuT3t8lk7lUtDUwI3JOAigvm0ynippg2s=;
 b=8MpIjJw3r37fs2byKDfkRlA79N991leidXv4RTzczuDdRkxSTG3AmGGUQymgDC8Xyz
 90bqlzru8XjEMya215k72FQlViERpT9InYMam4VT00eneVbiT/FpoBMEQz0R4TRWSc/G
 ydLDjgRRsklCXb/RUItexZYqUQsaO+AEhmSeivYWAPyIVPG+7W7Bz/ym41eObKDpXXWO
 zDxU9ZpoTXkBdr2+1A/A8ig/A2198S3fn9Z3ht0BOUigm+TW18FYmwLOfcxILDPY3wSY
 XdxUR977QVNP7sbV4dX/eMW3L5lRoGbj2EJ9OT0Ejays87O32YoQp/DcOdTYEBntp6Aj
 l0lA==
X-Gm-Message-State: AOAM530C6PCqYDH74xamfcnuVeYrLY/B6zpGKO1w462MaZzwr7pdoalF
 v6/AtA9nKgxJQuJSg+iOOHAJ4NXSNVo=
X-Google-Smtp-Source: ABdhPJyFvJpvcGhLiAhi+F0atN18GXSZOOR7OuWB8L/kA++T2FYsbyr8vRu4VveO2xLBmmauXhfyag==
X-Received: by 2002:a05:6000:50b:: with SMTP id
 a11mr12190012wrf.387.1641319947249; 
 Tue, 04 Jan 2022 10:12:27 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id r1sm44067491wrz.30.2022.01.04.10.12.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 10:12:27 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  4 Jan 2022 19:11:07 +0100
Message-Id: <20220104181107.3171973-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220104181107.3171973-1-fontaine.fabrice@gmail.com>
References: <20220104181107.3171973-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/lxc: add liburing optional
 dependency
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
Cc: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

liburing is an optional dependency (enabed by default) since version
4.0.11 and
https://github.com/lxc/lxc/commit/b1f9aee5c466b5a6d88582375ea15971d846d18b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lxc/lxc.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/lxc/lxc.mk b/package/lxc/lxc.mk
index 4d63fc14cb..08f64bcec7 100644
--- a/package/lxc/lxc.mk
+++ b/package/lxc/lxc.mk
@@ -44,6 +44,13 @@ else
 LXC_CONF_OPTS += --disable-selinux
 endif
 
+ifeq ($(BR2_PACKAGE_LIBURING),y)
+LXC_CONF_OPTS += --enable-liburing
+LXC_DEPENDENCIES += liburing
+else
+LXC_CONF_OPTS += --disable-liburing
+endif
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 LXC_CONF_OPTS += --enable-openssl
 LXC_DEPENDENCIES += openssl
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
