Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E47E2D5B866
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 19:47:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 937B280CB4;
	Mon, 15 Dec 2025 19:47:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id COFvoYL4sWXU; Mon, 15 Dec 2025 19:47:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF3F581A95
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765828064;
	bh=ZhqWUTGybZDzsuaCyzK86QooobaslFPzyCPamfq5SQw=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lMRoiNBrfyRYX11DWSaSzqNMPmhrgEkpjRjnSNXc8hQB2qKPYkKEjFlvWa0ICFcZG
	 PdT4MNvtV2ojzP7GwuRXzJU0Bde/Xfe2ZsPsSVNrOs1QYRLmPNIabAXXO2oSAfV7Sw
	 xZyu7fjaUp/LRmNU0RQZk4aYy5cHzyQJGx+vTQxe2pdFAnoT2FCdE18t4qDG62YVVj
	 mUHDPELcUfFG1KTGyIhJSGszgtwcb0LfZTSKrzmH4kSccd9wCIWES45G0bmctl43MR
	 voGhwcS5EvSS2TrAzE8DHGwhG2qCN89zYO6H90jIn6dsVyJIxe16OXG1kVBt1XHWGd
	 UY+eWD6LvjAXQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF3F581A95;
	Mon, 15 Dec 2025 19:47:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D10C255
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 19:47:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0EC4681A95
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 19:47:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V34ZLe7iISj9 for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 19:47:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=shirokovalexs@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E82B681A3B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E82B681A3B
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E82B681A3B
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 19:47:40 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-b7633027cb2so680149366b.1
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 11:47:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765828058; x=1766432858;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SF4iB/R98fpTSrPcG6ia3T79+xgi22+zLUbVZAhu+7M=;
 b=giPVU3b9up1gNnnj9571wjXctVK8bpZt6tACHuUZf2/Y6ZA+bGWjwpKxwyIJsP1RuB
 wtbbJEzRx5I4ch6dt4ZESTP5MFILhy62wKAigxnnvj6L+s/tOB5+tPP/iHo7RbfBWIXH
 X8pMpTrVtvdm8WD1uM/8LuuIG1rvi70aql6tzbYBvMfBC8MyhZ1Kb60jUjnJNhZ6S1s1
 fJ6dwTHEtuJhLxJIZBCZ0PvKmiMmSDqNmCq8SMqS0BR678vVgbrHQBCGtz3/NdrOAv+4
 dJchqSxn5k5Tfp5JTZsdSA9hn8e0ooUGxysGQ0U358xZDh+vG/WlBnIDbhuVPsOOgLWz
 7JhQ==
X-Gm-Message-State: AOJu0YwYE8m1aSi3VnXhjSMhTwGhRBBp4gwMwM6hoQsRjM7kt9PT0giM
 m9NGMqKYT2E/NaL1j3UqO3ygiMPGPfjQRaJhg+zJOlHKJz8zCj4wAV3BIIU6
X-Gm-Gg: AY/fxX7ByEhqMZg5d+Ro/0W9WZ2L1KjRtTJJa26ziGt0ChiWWw0tBWfBVoQTe7gzVhg
 V5d7XdXLoTltJgMkEPhg/u0lPg8FxXWLG6uu82xFFFdNdMZCsiUVFpF0TTcWdyjhXRXv2S+i1Ba
 aoSz1zEA6E9cmGxZzcSQKMFAvABJjN70Fht280qWC7X6Hh4F7YMOg8aUmDZWyqF7RfEaa4nH5SI
 xt09tIei3+LqC+JRAcuU8eFIWolqRg4YJQiLIX5id+rcYMdhWITNIqjbfezhfk7flYLvKWrwPZZ
 3eXIVNo+VuM7AP++WbFT6SsP9QlVQqPXFC2OLoYyKdU59aqtRCRs8VobzEUly+UpLp6FnRsd2fs
 9sJkSWh0+XlNpWCcf5ZIaazuBNT91n3itdGuAotKCTfdqU2ctvf5Hmz5j+NulFDa+mTA5CJM13t
 c5s/8+1rHopzdr2JHEyt4jLqRkgA==
X-Google-Smtp-Source: AGHT+IEbZXiQ7bcg2qpQvGRXVgNU/j0bw3+haJFmb40TDpAY+Cc+LsBkjcgUCUJ7VQrGsqv+czBS0Q==
X-Received: by 2002:a17:906:c113:b0:b73:9be1:33ec with SMTP id
 a640c23a62f3a-b7d236193aamr1188631066b.9.1765828058225; 
 Mon, 15 Dec 2025 11:47:38 -0800 (PST)
Received: from devhost1.play.pl ([2a02:a319:a1e0:eb00:92eb:221f:6fb6:f3ab])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7cfa2e70c2sm1453065766b.15.2025.12.15.11.47.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 11:47:37 -0800 (PST)
From: Alexander Shirokov <shirokovalexs@gmail.com>
To: buildroot@buildroot.org
Cc: Alexander Shirokov <shirokovalexs@gmail.com>
Date: Mon, 15 Dec 2025 20:46:37 +0100
Message-ID: <20251215194716.116592-1-shirokovalexs@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765828058; x=1766432858; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SF4iB/R98fpTSrPcG6ia3T79+xgi22+zLUbVZAhu+7M=;
 b=AKxoJTPhfoSH3eEolNrvY+3HxT90zT2cS7pCuWd9GSkPWQsPjHLEmAm5OyUqoj6Ufz
 aGypdkE+4x/O+6WO5KCEREkcqDSXjHlolVt30lLJeDjyH9eSqWo9YyYRzl+A+zLkcjMB
 ZduZe6bwRQiga86+B/KemON97zDALCaZLSGwQEweryiltz4o7Yw03UIO+Y++cD2p+g4a
 QJodwMuP3CtJGoCtuQ7vK+YdkCvdIh7ikn97UNB3pv9HqIsmCTbv0B1eAX5AYO+mVtbO
 HqCOf29Y3f4IJOcPhf6vf0+j5LhC4yW48tuv1GXqnIotnHSZUbbmLRjrPzpUMMI3ho6R
 ipZw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=AKxoJTPh
Subject: [Buildroot] [v1, 1/1] package/broot: bump version to 1.54.0
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

Changelog:
https://github.com/Canop/broot/blob/main/CHANGELOG.md

Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>
---
 package/broot/broot.hash | 2 +-
 package/broot/broot.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/broot/broot.hash b/package/broot/broot.hash
index e01762f275..f2a5b59263 100644
--- a/package/broot/broot.hash
+++ b/package/broot/broot.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  a006e15ec340d05451459f6e95a52789b6f55c93617129ca9178d00d43437cef  broot-1.53.0-cargo4.tar.gz
+sha256  e41a6e9c9bfac22ebbc55c7af1cbfeca08ce68d6a9935e05da5f38d224edb245  broot-1.54.0-cargo4.tar.gz
 sha256  89461664ce2aee7d80ea8fba7118fe7abd490d76ba435cf1d81d3128e060711f  LICENSE
diff --git a/package/broot/broot.mk b/package/broot/broot.mk
index a5c5ba2271..f8043ee02a 100644
--- a/package/broot/broot.mk
+++ b/package/broot/broot.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BROOT_VERSION = 1.53.0
+BROOT_VERSION = 1.54.0
 BROOT_SITE = $(call github,Canop,broot,v$(BROOT_VERSION))
 BROOT_LICENSE = MIT
 BROOT_LICENSE_FILES = LICENSE
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
