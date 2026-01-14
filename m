Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 647EFD37E51
	for <buildroot@archiver.kernel.org>; Wed, 14 Jan 2026 16:00:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 070E76002E;
	Wed, 14 Jan 2026 16:00:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4MilSfYCrA1r; Wed, 14 Jan 2026 16:00:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 212CE600CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768406424;
	bh=i2poIGGB/A6XrsYCk4rryeXjW8ianDtrHRPgHQtCPPo=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jER6CX7tIf5G1CEcAEXvKfWN/NItSjHZTEG1fi8ZveNSwdh9dYjDw9/0CA5nsZJKh
	 JT6NqZh1BXdUWjte6OdgyYGhD1Z4CD/knMxbHs7JMPt4I8D96vyfVvu3e6FlEpjpt7
	 0T408HarDMvLC4BA72TpFoBbAnKfesCCg/KgUqA3KUtWJf3d6/xuDyOOkqUad8o0/W
	 UjGpG6f6R0CiiPYloIcjj6Gbp38PblPfYEQWDJtoUdZ3kdZt8B4rwiOEae5d/cI75S
	 jqd2MHVA7KLZRwsH656NtIlzzlzNIQvcSZhkLGGpJ/N0W+bpLSKrqnyWOUH64544+P
	 jJmttZGkpJrnA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 212CE600CD;
	Wed, 14 Jan 2026 16:00:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1254F232
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 16:00:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EB33960067
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 16:00:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hIqkqbBywwtr for <buildroot@buildroot.org>;
 Wed, 14 Jan 2026 16:00:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::e31; helo=mail-vs1-xe31.google.com;
 envelope-from=gilles.talis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0EB8A600C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0EB8A600C9
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com
 [IPv6:2607:f8b0:4864:20::e31])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0EB8A600C9
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 16:00:19 +0000 (UTC)
Received: by mail-vs1-xe31.google.com with SMTP id
 ada2fe7eead31-5ee99dec212so2324305137.0
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 08:00:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768406418; x=1769011218;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wI6L+1JHLk5Q0fqNng32FbzZ3YUSnKT6j4i2v07yJv4=;
 b=pnbSsClbAEcfAReSiAqtLEEmTo9OfGpFNtu+lEkcwyfu3DMz0MWMQccAorn1PXvBSg
 c4AniulpuJYVcinLALWwCkOta9bvxTo9u7TWSievNw2qOfV8kvls8vd8XePMRCU2KEyb
 Gw8rHRNUhYC0lRm2kSppw5kF/aLoI9109bEIcMYoFZPB/2wE5Nv9C/152g78/LnJQNQ7
 yubuiqYwjEynSjy1n35oyEEM/3vPSTBYAmAHX6SisWt8AQ/tMbrHXElyXAe/hQ2PZlXK
 MHcP9UmXxmsm1FxcaAiIRiArKv+tYZuYR9rWJObkXipShXS0Qpx6RlyUZGRTmVwEXBg8
 sbVA==
X-Gm-Message-State: AOJu0YyFMisYIwnt63eyx9ghqSxk0qEaD8drm+4R4N8f2bI12u+r6Ye/
 FIAFICSpmj0LTyPAH7Too5+ksnWPyaP9F5yNWeLRE+1k1sXXIGl0COr2+j/Ldqn8
X-Gm-Gg: AY/fxX5YCErCJdIlWU73QuiliU7t0e/iWSwiA913onRHpOLgHqMQFqTO7uBXxv22zh2
 EuN+LlGJ4uw5MfoNKS1yW7RD1DYDcW8dKZ12MtQj+tOazICw2mVOc5MPFKL9h0n1Dg+aUJR/RGV
 iA5JyvVqbdkD8VdAvOmWnpbYL6K87yPio3nF2LyjoTuk9lBCKriW7usU4toRUVpcoSCWbFZqpQu
 WhtVlnk0im+UPwFeAId291XXgVlFb9ORdX/aOI04fzjT0EkwVh4yQjUx0M/e4Lzp6JSeJrVo5Cl
 y40+UDpMnnmPcVg6+flOtwEMTaZ0GXoraIysY1/hJMEv3ZzS01dF7RwUBmxdsSChjLx4cU3oTt5
 VQv0VOxZx9cOyhOxuXps0Z7FKMiRw/M7wPY9bgcIXxrNJTrBMO+DUIerfIUNb+MYx5FwF1f9V8s
 BnAAd2UQwOdiDvlw/2xHSqUY7cFhi/hqr7xReRG1wQDA==
X-Received: by 2002:a05:6102:d8f:b0:5df:c069:be95 with SMTP id
 ada2fe7eead31-5f17f44f8e1mr1391660137.11.1768406416786; 
 Wed, 14 Jan 2026 08:00:16 -0800 (PST)
Received: from localhost.localdomain
 ([2605:59c0:1498:1d08:895e:f475:13ca:a6cc])
 by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-5ef15be79c6sm16622411137.12.2026.01.14.08.00.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jan 2026 08:00:16 -0800 (PST)
From: Gilles Talis <gilles.talis@gmail.com>
To: buildroot@buildroot.org
Cc: Gilles Talis <gilles.talis@gmail.com>
Date: Wed, 14 Jan 2026 11:59:46 -0400
Message-ID: <20260114155946.70930-3-gilles.talis@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260114155946.70930-1-gilles.talis@gmail.com>
References: <20260114155946.70930-1-gilles.talis@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768406418; x=1769011218; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wI6L+1JHLk5Q0fqNng32FbzZ3YUSnKT6j4i2v07yJv4=;
 b=NYbxyzBSBgIYCwAiyhix53Occnx+z9NaYKjr0wL5coB5kpvO/JI+sL9Wf7oGsZErzB
 xKPru8X4V0CnO0nww+PJyJoQ0wv/uTSp7K2X/OTUocO/FTkM5daFfzjX6wC1Rj/dtqfo
 nsSX4Fx6A5CgpIgZLTj9WxWUt2tQNv3+ZqpQloTA0qKwNwJbgqtn2kkDQH9KIX1Y4DRF
 erQTlglBN70Asq35RF2FnSfabt6ren797Uyrfp2cb8grWkErBAgyIPuvOowcSkTNLfqn
 VVBTfna/wptHUjSvDZAEmeqQuD9QUCjArOzxFRVxOl9mpPc7SftCEi3S6bZeuY0XAM7R
 D7pg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=NYbxyzBS
Subject: [Buildroot] [PATCH] package/xapian: bump to version 1.4.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ChangeLog:
https://xapian.org/docs/xapian-core-1.4.30/NEWS

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/xapian/xapian.hash | 4 ++--
 package/xapian/xapian.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/xapian/xapian.hash b/package/xapian/xapian.hash
index 898d2e4eff..845f5b78fc 100644
--- a/package/xapian/xapian.hash
+++ b/package/xapian/xapian.hash
@@ -1,5 +1,5 @@
-# From https://lists.xapian.org/pipermail/xapian-discuss/2024-December/010056.html
-sha256  bcbc99cfbf16080119c2571fc296794f539bd542ca3926f17c2999600830ab61  xapian-core-1.4.27.tar.xz
+# From https://lists.xapian.org/pipermail/xapian-discuss/2025-November/010103.html
+sha256  4edf9989499e8bc95085c9f7108ed41d69546c34c6eea81da0fa22d95043bf72  xapian-core-1.4.30.tar.xz
 
 # locally computed
 sha256  c38aee9e3c8c4d5d594ff548a1be05453023016d6286931f6512db215ec1fd42  COPYING
diff --git a/package/xapian/xapian.mk b/package/xapian/xapian.mk
index 187e366066..aef05ec532 100644
--- a/package/xapian/xapian.mk
+++ b/package/xapian/xapian.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPIAN_VERSION = 1.4.27
+XAPIAN_VERSION = 1.4.30
 XAPIAN_SOURCE = xapian-core-$(XAPIAN_VERSION).tar.xz
 XAPIAN_SITE = https://oligarchy.co.uk/xapian/$(XAPIAN_VERSION)
 XAPIAN_LICENSE = GPL-2.0+
-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
