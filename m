Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2763C3ABCE
	for <buildroot@archiver.kernel.org>; Mon, 16 Sep 2024 15:12:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CC06240C08;
	Mon, 16 Sep 2024 15:12:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y8C9cVBNj5-j; Mon, 16 Sep 2024 15:12:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 34EA640BDE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 34EA640BDE;
	Mon, 16 Sep 2024 15:12:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B47C71BF41D
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 15:12:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B0AF360AB4
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 15:12:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bbWL2JJUKr5r for <buildroot@lists.busybox.net>;
 Mon, 16 Sep 2024 15:12:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::544; helo=mail-ed1-x544.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7655060AB2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7655060AB2
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7655060AB2
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 15:12:12 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id
 4fb4d7f45d1cf-5c26fd60b7bso324929a12.1
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 08:12:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726499530; x=1727104330;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eQwVHfG62ZGb8WriUBcUaQUFH+SZabDSVdYhppA3WzU=;
 b=qeWYefSbdzZAg2+VFHKjkhlusxoB9PhfpEJMkJSqRySv+P+YFPV7Tl+Gp240S8TUzM
 fQ+K4sfLf9aNxM/t1C48fFx/7TW5KbwkvKnNrsO9awh6HrEqw0ndo7h34jO8DcgetfAF
 VcUjbqgpQpK9kzWGYfBInlC5/QLXVGYecJk/l2pwHbce44LTc4I/cPBNpRj4lUj1LxsJ
 WwiT3lUCE+Ii5axRQH9DNzyf1QUDRHC1CaPQ+ijv8FxHFf7P2Ai0XvMLWBSPGE2oQvVG
 IX5hJ29EoTqHq/ss4kU+dZAjh9fFrNB0tAJDgMMUSWHXD0ZjwAQ53zl+3FCMcd92tFhr
 Jg1A==
X-Gm-Message-State: AOJu0Yw767bMENFdTct/drgUVJL7Ey9tlO8nJXJ7B57WHOLbljsudV9D
 y83vMDmh8+EmAClXgvgzdFOcJLkYuxaNMqhbnoB0SsVJ3iDntf0VkUGqukuFFuf+mFTOfPIx8+T
 9jBvhKwYD
X-Google-Smtp-Source: AGHT+IG7z+JcF05p154VKaETYR0sWM23ChtPN8UgJWK7h/ywgQs02UxweMmsMwg+YM+okSwlDbqe5w==
X-Received: by 2002:a17:907:7d87:b0:a8a:93ce:d252 with SMTP id
 a640c23a62f3a-a9029453485mr657448466b.6.1726499529469; 
 Mon, 16 Sep 2024 08:12:09 -0700 (PDT)
Received: from adam-laptop.ipgroup.local (212-57-59-66.xdsl.deanconnect.nl.
 [212.57.59.66]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90610f440bsm330460166b.86.2024.09.16.08.12.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Sep 2024 08:12:09 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 16 Sep 2024 17:11:54 +0200
Message-ID: <20240916151206.947484-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240916151206.947484-1-adam.duskett@amarulasolutions.com>
References: <20240916151206.947484-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1726499530; x=1727104330;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eQwVHfG62ZGb8WriUBcUaQUFH+SZabDSVdYhppA3WzU=;
 b=ZCJ9ON7teBMc9rxcJAlICmTuALVWD0PSnQ9f1S+7I03IPUEB9bHwgc4PeLEzZbb1cL
 lXh6oorNsHj75Xq6xeVdchD5xMOiKmCXpapPMou0D8HOlYuy23ueohpu6x1Jd4joq/J4
 qMoojYB88GLq1qhWsB67TMJ8KDpB/0dB3F1Xs=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=ZCJ9ON7t
Subject: [Buildroot] [PATCH 01/13] package/libsepol: bump version to 3.7
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Adam Duskett <adam.duskett@amarulasolutions.com>,
 Antoine Tenart <atenart@kernel.org>,
 Marek Belisko <marek.belisko@open-nandra.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/libsepol/libsepol.hash | 2 +-
 package/libsepol/libsepol.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libsepol/libsepol.hash b/package/libsepol/libsepol.hash
index 1369d820e1..dcc67ac638 100644
--- a/package/libsepol/libsepol.hash
+++ b/package/libsepol/libsepol.hash
@@ -1,5 +1,5 @@
 # From: https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256  c9dc585ea94903d784d597c861cd5dce6459168f95e22b31a0eab1cdd800975a  libsepol-3.6.tar.gz
+sha256  cd741e25244e7ef6cd934d633614131a266c3eaeab33d8bfa45e8a93b45cc901  libsepol-3.7.tar.gz
 
 # Hash for license file
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  LICENSE
diff --git a/package/libsepol/libsepol.mk b/package/libsepol/libsepol.mk
index 6361cc66bc..af14778ead 100644
--- a/package/libsepol/libsepol.mk
+++ b/package/libsepol/libsepol.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSEPOL_VERSION = 3.6
+LIBSEPOL_VERSION = 3.7
 LIBSEPOL_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(LIBSEPOL_VERSION)
 LIBSEPOL_LICENSE = LGPL-2.1+
 LIBSEPOL_LICENSE_FILES = LICENSE
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
