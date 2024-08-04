Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85837C3DA7F
	for <buildroot@archiver.kernel.org>; Sun,  4 Aug 2024 03:12:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1393B403C3;
	Sun,  4 Aug 2024 03:12:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V34XSw3Lof12; Sun,  4 Aug 2024 03:12:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BEF25403C0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BEF25403C0;
	Sun,  4 Aug 2024 03:12:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9B6881BF3AD
 for <buildroot@lists.busybox.net>; Sun,  4 Aug 2024 03:12:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 88DB8403E2
 for <buildroot@lists.busybox.net>; Sun,  4 Aug 2024 03:12:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7iUk89sCH04D for <buildroot@lists.busybox.net>;
 Sun,  4 Aug 2024 03:12:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32e; helo=mail-ot1-x32e.google.com;
 envelope-from=myd.xia@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5FBB840223
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5FBB840223
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5FBB840223
 for <buildroot@buildroot.org>; Sun,  4 Aug 2024 03:12:41 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 46e09a7af769-7093f3a1af9so5664820a34.1
 for <buildroot@buildroot.org>; Sat, 03 Aug 2024 20:12:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722741160; x=1723345960;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HVRjT4vgoGe600hrSlpleCTlRvIey0P16KA9wR7wbnk=;
 b=EiNO4ep3ahkKwICUkNExwAPZtGNOe+8OIcGrUPZQcVshanvDLpswLpZZsXh8bVvnDh
 hQLE/FFfc+fEdFVmguHSupyUwcHSaSldb1CzCkxS1zGtVaxGDNDqwVpcY3lzWo+L8lN7
 eEzHtV1z8Ze4RspBt7FSYeGbOkSvmZHkPRw6i5MU/nagdI+8TunGqbvHOdTxE3gJiBDk
 TZH1+gbUHoMU9Mk9LSiWys7MMBXUK+nVjztKshsqsBN8pxRWLa9fFgZ/c9NxHl/8cJN6
 f/KPEgTqe+giB/K++8Tex2+Pjy1gQue5lS+9M54eUzlvpKjinwnkWFq1Q7ALmb+VQiX+
 OhwA==
X-Gm-Message-State: AOJu0YwKfJ9QIg1sjYBNcd11eQ+LsR7tj5yfoeNBn+tyk6N3uWnveFSY
 WkiprS5onOuYfJL4DW2pUcTVIXd+3UcKHN7uCJctN7pNRvDgm0DDjzRXJK/p
X-Google-Smtp-Source: AGHT+IHqJTWP9hmnTqFV89R7y2QO8k+1p/bLQ/VGwuibCy1HN3m0uIDH475Hw9ukLd1ZulYtCGOIDQ==
X-Received: by 2002:a05:6830:d07:b0:709:449c:61d8 with SMTP id
 46e09a7af769-709b31fc56bmr11608223a34.6.1722741159872; 
 Sat, 03 Aug 2024 20:12:39 -0700 (PDT)
Received: from makeio.. ([122.226.102.126]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2cffaf96996sm4304814a91.16.2024.08.03.20.12.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Aug 2024 20:12:39 -0700 (PDT)
From: Xiang Lin <myd.xia@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  4 Aug 2024 11:12:32 +0800
Message-ID: <20240804031232.5020-1-myd.xia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722741160; x=1723345960; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HVRjT4vgoGe600hrSlpleCTlRvIey0P16KA9wR7wbnk=;
 b=X7FsGlMKjeEFkSWPAj/rmIvwLtR14usZ8x4hOD2XHGdtE/UoCHuuTcNutknsxFggf8
 QhGk8XEuG9RWDBtV6AVvRa9HUwdMLm+VLWWlfsKvMCpT7nPCYMoox8Y81/JhV+QdqpRg
 dMr6uBvGYedIoTfhL2/0YFPLZOUiqfiTnm31Rx+buG78LObgFso5DJ2GzpTVbTZoJFCg
 TRf7r2NT2snSTFYUDT52x+M7B9FEtGZBTpwWCC3FO97+dqmd5GaedypXBv6SgMufrzKH
 X07Bf4KK1t/al1Hz/Sje4LRXZhkj/zjxd0bobaH8ME44+nZPvMP+8k80JG0TDNWivlBH
 04+w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=X7FsGlMK
Subject: [Buildroot] [PATCH 1/1] procps-ng: option to original top layout
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
Cc: Xiang Lin <myd.xia@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

New procps-ng use modern top layout by default which
without detail cpu usage info, give a option for nostalgic
one to return to original.

Signed-off-by: Xiang Lin <myd.xia@gmail.com>
---
 package/procps-ng/Config.in    | 10 ++++++++++
 package/procps-ng/procps-ng.mk |  4 ++++
 2 files changed, 14 insertions(+)

diff --git a/package/procps-ng/Config.in b/package/procps-ng/Config.in
index 6ff8983202..4afd01699b 100644
--- a/package/procps-ng/Config.in
+++ b/package/procps-ng/Config.in
@@ -8,3 +8,13 @@ config BR2_PACKAGE_PROCPS_NG
 	  Provides things like kill, ps, uptime, free, top, etc...
 
 	  http://sourceforge.net/projects/procps-ng/
+
+if BR2_PACKAGE_PROCPS_NG
+
+config BR2_PACKAGE_PROCPS_NS_ORIGINAL_TOP
+	bool "Use original top layout"
+	help
+	  Disable modern top layout, return to original top with
+	  detail cpu usage.
+
+endif
diff --git a/package/procps-ng/procps-ng.mk b/package/procps-ng/procps-ng.mk
index ba8958d146..3f6136b08f 100644
--- a/package/procps-ng/procps-ng.mk
+++ b/package/procps-ng/procps-ng.mk
@@ -54,6 +54,10 @@ else
 PROCPS_NG_CONF_OPTS += --enable-w
 endif
 
+ifeq ($(BR2_PACKAGE_PROCPS_NS_ORIGINAL_TOP),y)
+PROCPS_NG_CONF_OPTS += --disable-modern-top
+endif
+
 # Avoid installing S02sysctl, since openrc provides /etc/init.d/sysctl.
 define PROCPS_NG_INSTALL_INIT_OPENRC
 	@:
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
