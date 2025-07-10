Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12AA1C83F20
	for <buildroot@archiver.kernel.org>; Thu, 10 Jul 2025 20:23:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9783613C4;
	Thu, 10 Jul 2025 20:23:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gc3TNQD-9hSh; Thu, 10 Jul 2025 20:23:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14B6E613E3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14B6E613E3;
	Thu, 10 Jul 2025 20:23:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E78D12E
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 20:23:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 175FC410A2;
 Thu, 10 Jul 2025 20:23:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t8k1-g3lsN23; Thu, 10 Jul 2025 20:23:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5A2D4410A8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A2D4410A8
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5A2D4410A8
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 20:23:10 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-453643020bdso11085825e9.1
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 13:23:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752178988; x=1752783788;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=XWrsfKjqbp+LcZ+kmXLWrPvjuR4plsuNd6cI1GNH5Dk=;
 b=Dd+9BGwfO/6Zm2TvzYtUpVfS7ntm56Vl/VTrU/gqRX092Ty0V4gxmcQdETJ+E7fo5b
 oCUfaXIFAGYXrIqFmXBZjzOlS9O/mdrO1LmjZz4WmAKGBb+x52DbBf4TqwWJS4ACYkCi
 ckHgpGCGwBB2Mh+IUkbJ3JR6wQSQ4ksEfKXU3h7mWr/DiPZLAvZ2/pzh2EehV2VPs3HG
 CjzRjY/6kLBCLNSEW56h0HEqaSyh5ekvNKuihb2Tx/Xc5u12+x75cOPIY/YIMWXubMiv
 2MG9g4YOJpf+M/XcA8pmdcm2vA3oSYgbqyEp8FoTymkWv81yxrxaHWq89ftW0OOZy/5e
 9bEg==
X-Gm-Message-State: AOJu0YyZZstKbZBtgxVgddP2/2YHFH2SRFBlKArhesHEb/097NXc0qR5
 vH7Ckpcq7+M014rywKXXUC9HLoPstZfMr/3ZlLjGly15IIJ96OB6yLbqpx8iow==
X-Gm-Gg: ASbGncv+nHj3o6c+mh1Ss3KU60GC/6hlekwRqboZD74D4rK9DPSfZWtJsVBqMYY6zAF
 Lc5fjRpLOpwGi2EjQ4Qd/w3Yb3MmKiOyGgCVMV8ileHb2MrQOSD0fT4vLayM7dKWKLe2g22MfYc
 UsJvhMUbA9S/UwpCq+ny4HxtJiIQHGgQJ6/Bb3SN7rfE3814j9jo0ON65p51PAM4mfuKg0Mdz1f
 bXYywkHGwA41Nmy2VxTxT6Y4HbLTipV00Dx4E6EnDgvmt8z7Vi6q0lbE94PQSuSJmcamR6c41/v
 v1SxXpbSmSbUb0Z2zdwtuzaKKfQ2Jpj3xaqDPV07VWkupBrFju9/6Tvg+S/X2ceD7f6YWSGx
X-Google-Smtp-Source: AGHT+IEuK4sfd2nDyQBiO8UOuYIx4aH3sjfSAjGMXCmGA7/zqWWeGkcFhKb7L8cb/0XyM9y+W6l3sQ==
X-Received: by 2002:a05:600c:6287:b0:441:d4e8:76c6 with SMTP id
 5b1f17b1804b1-454fe10f108mr1716755e9.30.1752178988408; 
 Thu, 10 Jul 2025 13:23:08 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8bd1997sm2742694f8f.10.2025.07.10.13.23.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 13:23:08 -0700 (PDT)
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Thu, 10 Jul 2025 22:22:57 +0200
Message-ID: <d3c14052aa92a2464c094046625d39e28106cebe.1752178975.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1752178975.git.yann.morin.1998@free.fr>
References: <cover.1752178975.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752178988; x=1752783788; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XWrsfKjqbp+LcZ+kmXLWrPvjuR4plsuNd6cI1GNH5Dk=;
 b=HGVoCB+4aWB58pBT5dBdxANuL4mElTdTWqBzELu1glHGqgi/8jamxgb9qvN1hUkMAs
 KuQhOd+JbxOTZapB/zeomRbcLo3uu1l9/v04++nYxLgrLYiS1Hfd7BjlQsGZN3A4nrnq
 rNh92sVFiTFshuJyvaz/k2en2pB6dJDwNXm319VelOebxX7LIlc+XIopjICUGAYwfNnH
 nfFtcWhH+BTVxgAq32mL87bp5YyNPncBG2huaxbRQXIWAgJOehWC/lFAUfDXDOIj/rJo
 q74ysYUxVUMagmaaf6tMk49LQwh1vWlYuPE+V5b7+sQzzU6+Cx48Pt7xWCOYq2gW12w0
 mP6g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=HGVoCB+4
Subject: [Buildroot] [PATCH 15/17 v2] package/util-linux: adjust paths for
 merged-bin
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: "Yann E. MORIN via buildroot" <buildroot@buildroot.org>
Reply-To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/util-linux/util-linux.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 3098a81a72..d1abdbdc9e 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -75,7 +75,13 @@ endif
 # ${usrlib_execdir} (/usr/lib) to ${libdir} (/lib), since both paths are
 # the same when merged usr is in use.
 ifeq ($(BR2_ROOTFS_MERGED_USR),y)
-UTIL_LINUX_CONF_OPTS += --bindir=/usr/bin --sbindir=/usr/sbin --libdir=/usr/lib
+UTIL_LINUX_CONF_OPTS += --bindir=/usr/bin --libdir=/usr/lib
+# Ditto for /usr/sbin and /usr/bin when merge sbin is in use
+ifeq ($(BR2_ROOTFS_MERGED_BIN),y)
+UTIL_LINUX_CONF_OPTS += --sbindir=/usr/bin
+else
+UTIL_LINUX_CONF_OPTS += --sbindir=/usr/sbin
+endif
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
