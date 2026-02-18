Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C543E9A04B
	for <buildroot@archiver.kernel.org>; Wed, 18 Feb 2026 19:55:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BAEBF60AC6;
	Wed, 18 Feb 2026 19:55:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B43b0GKNgziI; Wed, 18 Feb 2026 19:55:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8471960AB9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771444504;
	bh=yRrOkPLg6KdKLEKlgA11BoFd6NWDip9jrT4iD1R08bI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=I7gd/rsnnRjFsL6YhOIj0Xjq5FUsZOTmPv+2huaeOdDERL+N2GgsKe3G+YLoUdJrc
	 DepEv1G/3PO9bjeEj4Wj5pu9QCZjl4ItWM2o3c7fQDftdloFuga8Q9sfuXIi8Qyivh
	 C1gWrh9tyz/nQ3Txh6JTqsZg2dXjQFN2eJ9W06E5aXp8ZbhZU8/VF60KTD972umkVW
	 fQtws8mrjgNt3mDLUfk91KnsD2EkNfWfJuKGXfBS1VzEw9VFBtHpEnzT8kmVuOOeg1
	 mCdP9zFoClifZ2Tbh6aWpPZh9dPBxiRKtzaG6bN+sd/NtgKHNrhIuAoNxCr2A1xWkQ
	 hTa5EkToSVEZQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8471960AB9;
	Wed, 18 Feb 2026 19:55:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 10F40183
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 19:55:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EAA3A4035F
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 19:55:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0THZdpd4A1sP for <buildroot@buildroot.org>;
 Wed, 18 Feb 2026 19:55:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F26F1402DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F26F1402DC
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F26F1402DC
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 19:55:02 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4836d4c26d3so1881295e9.2
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 11:55:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771444500; x=1772049300;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VZVCJO/f7cyP7ZDoUvFQWnSzwcM9NS/gGE+m1gj+wps=;
 b=X6oDYjjevSUxtPCwnSiBSU04YpVLV8b78jLRzeRNEkKatbihPJdMixtvlJyg44USDC
 mlE80mzESUYniLGN9Ym7xzXFwXkoUmAU27PmR69gDLYZL6s8qIV2p6LFi8lhq2NK6joo
 RFb6OQI3mWAh9NsywveFsKHFCLTIv3DYv53YnU85x0tzrIZ4HA//0eMtulfqHTRQIz50
 GCsZ0v4H3MutBZJ0LwtuphEq/6uIja21HznX14rqMlZ3uEBIlqhDUjYOOf0vMX+IZXJu
 6iOqL0Ft3IfvUEo2KFpjj7/uO6ZhFDHxE2mTe2rQ51ytwU1ivZF5Ue34UXMd52AU7NbA
 lBxg==
X-Gm-Message-State: AOJu0YxMFQxNsvkfTk3lkmOGx915lRx/GxzioNA4Ivki32YJBbNjieJV
 lWoYmGE9vwCxL2cTzNNWjuNpyjVlJlD0+YOYYjIJi8O/EWGSb8Hjef2fq4OIobuh+ogiGBNlA6d
 WqT4T
X-Gm-Gg: AZuq6aL+GybP1ozzjpfsoqtGK6kpHomU3LUQfuMIjs0VqeA7TOg9IKQ/SpnCNiJlUgp
 Iebg7ulOjRRQO4Ezrlo7pZfkki+lkR2EYFIbvW3RygHS/j1JYo5a7zdRwTT3HKXfqtsOoym7/d/
 vLW7is5OkBoUrZkvddn9dQ4SCy3X7Hm6Rkz8MY82lG+L9IIRI5v/gM5CBKLRxMUXQpsNhpydtEw
 qKPF8Wvxhp142wy9VwgBNZkPtXKPiNUPndDJZCNRl1WqLyNd+5YGds9YlwmSgPEr5pZMhNO0PJF
 pWvV1qOL52rPip+Iaxs6VFfdTgM8zwvxohQyIu7bMurivNSTDtU+Tu8yUA2HFDWHwrWbr83g7G6
 3QNvpljr72/ZEVY1twjY1ChZPTMAZMbtJEGvO25tUbB4d1X2G4dfdHcw3GYtzCMGiYfccY/teVB
 UBbIDexdZ/92DAVkI=
X-Received: by 2002:a05:600c:4f44:b0:480:4b59:932e with SMTP id
 5b1f17b1804b1-48373a0a0c2mr298721115e9.11.1771444499895; 
 Wed, 18 Feb 2026 11:54:59 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4839e7f9baasm1654415e9.0.2026.02.18.11.54.59
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Feb 2026 11:54:59 -0800 (PST)
To: buildroot@buildroot.org
Date: Wed, 18 Feb 2026 20:54:58 +0100
Message-ID: <20260218195458.221243-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771444500; x=1772049300; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=VZVCJO/f7cyP7ZDoUvFQWnSzwcM9NS/gGE+m1gj+wps=;
 b=ejeL9lkTuoxW9+umeTdEnTNjIFGJd0EMomAFKBc1PVUpPiyx2spoq9Q6KX295wIZlM
 AvM8j5UDpPPaeC43djriPZhEzXXHqlNkZBqafX3NMLRN7kwUEgXuHLVvr2o/lm8B1cS1
 HZev0Yvu71itNU0TJgq3N6g4H29HLqRLGQIznmmYwilpfKAywACIA4e8uOhDtjo4FW5v
 6PVv6Rvm8yYQHhlAJ3nup9BoBS7WRqyUHG0CTYgkU3d6FTyi4ifh5tjHpRGmay8MChj7
 asH7p5Kehlg8c4xgMAZV7Fjd60uficc6KIlrh6LwJ0zzET6T9iEe65QNci4fKGQly6+A
 Gm5w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ejeL9lkT
Subject: [Buildroot] [PATCH] package/libzlib: security bump to v1.3.2
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For more information about the release, see the release notes:

  - https://github.com/madler/zlib/releases/tag/v1.3.2

This update addresses security issues identified during a codebase
audit. See [1] for more information.

As a side note, this update removes the reference to CVE-2026-22184,
which does not affect zlib itself but only the reference program. See
[2] for details.

LICENSE year was updated in [3].

[1] https://7asecurity.com/blog/2026/02/zlib-7asecurity-audit/
[2] https://github.com/madler/zlib/issues/1142
[3] https://github.com/madler/zlib/commit/9e35567064baded660f61732b247ef5abc809014

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libzlib/libzlib.hash | 4 ++--
 package/libzlib/libzlib.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libzlib/libzlib.hash b/package/libzlib/libzlib.hash
index cbd9313870..bc8b046426 100644
--- a/package/libzlib/libzlib.hash
+++ b/package/libzlib/libzlib.hash
@@ -1,4 +1,4 @@
 # From http://www.zlib.net/
-sha256  38ef96b8dfe510d42707d9c781877914792541133e1870841463bfa73f883e32  zlib-1.3.1.tar.xz
+sha256  d7a0654783a4da529d1bb793b7ad9c3318020af77667bcae35f95d0e42a792f3  zlib-1.3.2.tar.xz
 # License files, locally calculated
-sha256  845efc77857d485d91fb3e0b884aaa929368c717ae8186b66fe1ed2495753243  LICENSE
+sha256  e32ff4e00d9d94930537635291da39e7e612703334bf6fde8c7f1686fe8a45a2  LICENSE
diff --git a/package/libzlib/libzlib.mk b/package/libzlib/libzlib.mk
index bc5092d9a9..c73328deee 100644
--- a/package/libzlib/libzlib.mk
+++ b/package/libzlib/libzlib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBZLIB_VERSION = 1.3.1
+LIBZLIB_VERSION = 1.3.2
 LIBZLIB_SOURCE = zlib-$(LIBZLIB_VERSION).tar.xz
 LIBZLIB_SITE = https://www.zlib.net
 LIBZLIB_LICENSE = Zlib
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
