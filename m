Return-Path: <SRS0=+oVz=QB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2CCBC433F5
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 11:26:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4841D61167
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 11:26:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4841D61167
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0064C402BE;
	Sun, 14 Nov 2021 11:26:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e-Z0JRMTf1We; Sun, 14 Nov 2021 11:26:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6CA0F402B7;
	Sun, 14 Nov 2021 11:26:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 444081BF2A0
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 11:26:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3D9C140128
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 11:26:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wvcr1-n5Mhv8 for <buildroot@lists.busybox.net>;
 Sun, 14 Nov 2021 11:26:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 60C0740126
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 11:26:32 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id b12so24594412wrh.4
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 03:26:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/7o8fGVZSXeFlplqE9E0LTmZnJ8dYRFD2J+hKq7fjQA=;
 b=JeyPkikcZtvX/8k8DSnIR3AmunJI+K92yj/Yt6LjWdtZFcB8PACM6a+d8FWqWLs0BM
 61hSi0MFDbalpj5iAvqarVzb6iAWnM1oasMguEpPoiZldwFeU/zsozRVi6qHiSq/JuY1
 Nu5DyOz4i3OCYvsZ+p2I05BFSDH1CeKF8nMzVtC539C+ycnHlqWr7jrlHtfgl9bG8ZWe
 KSeuqpNJW0342w3KfbGYKA42HKW6iBa2/3NCaOkz42t2GNlSl7pnx6AImKpA38Qw0ePT
 NV5pX0SVeR6nYY7O4OyYIu5Wj8b1hx2A7Cog5qrzg2lPQTiCeUBi/hH3Dk04O5aapGDm
 3Pkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/7o8fGVZSXeFlplqE9E0LTmZnJ8dYRFD2J+hKq7fjQA=;
 b=fvgYty+NmhMKxNOLE6qIgYHCnFY0c/Jcg4NAAnLgLx9leFq24zE6mz/EbkrrziaD2h
 aFuVd+GbAMPeKc3GFL8SEWV/Uv0UEwlongvbCrGGETzyd9qqSqzz4PKSWi6OVAWJH34r
 yqZgletK7ot65Wo3VJ5I2EUsXJ8Z1jmItSNwLQx4iSxEzuS/N7rkFdhdl+jFbmRG2p3V
 hpgRbD0hT2DduxzIgFtPoY8WIlbZskYKo2Qj2V7Yc8RND+yztL0lEI41k8ccYPqRf2sR
 1hWqcioVdNaVyYXwMOClxxcdv7ZiTcqqheL23v5ITNK6cO86xgInR0wHkWq5ajc6mB98
 jW3w==
X-Gm-Message-State: AOAM532B1zJetAFad5m7fwF8HVN/buFTDvgSboUl/nEMcklPCfp+sUrB
 4qTrEAM1Ky3Z7HaO+8MleXhqvMXopro=
X-Google-Smtp-Source: ABdhPJz8lTTgqiBjxs270om4EhebV7qBnPo5zAyYvYvymZDDQfv/tnES9EensUUN8ZS7g3DVX0xB1Q==
X-Received: by 2002:adf:e7c2:: with SMTP id e2mr36128845wrn.349.1636889190368; 
 Sun, 14 Nov 2021 03:26:30 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id 8sm9078898wmg.24.2021.11.14.03.26.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Nov 2021 03:26:29 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 14 Nov 2021 12:24:14 +0100
Message-Id: <20211114112414.1303736-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH/next 1/1] package/bind: add gssapi support
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/bind/bind.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index ebe59bec6a..f2102ce205 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -35,7 +35,6 @@ BIND_CONF_OPTS = \
 	--with-libjson=no \
 	--with-randomdev=/dev/urandom \
 	--enable-epoll \
-	--with-gssapi=no \
 	--enable-filter-aaaa \
 	--disable-backtrace
 
@@ -60,6 +59,13 @@ else
 BIND_CONF_OPTS += --disable-linux-caps
 endif
 
+ifeq ($(BR2_PACKAGE_LIBKRB5),y)
+BIND_CONF_OPTS += --with-gssapi=$(STAGING_DIR)/usr/bin/krb5-config
+BIND_DEPENDENCIES += libkrb5
+else
+BIND_CONF_OPTS += --with-gssapi=no
+endif
+
 ifeq ($(BR2_PACKAGE_LIBXML2),y)
 BIND_CONF_OPTS += --with-libxml2=$(STAGING_DIR)/usr
 BIND_DEPENDENCIES += libxml2
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
