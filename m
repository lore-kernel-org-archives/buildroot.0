Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFB06CCF2E3
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 11:59:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 718B16063F;
	Mon, 19 Oct 2026 11:59:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DAoI8xHIDV0u; Mon, 19 Oct 2026 11:59:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8D7B160612
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792411165;
	b=C/zlBh9muuwup3swVz3hk8nCvPczPdZ5O4esl6Cs0iDkwmjjn7+XHzyFWwnzZxngbQ0z
	 aJND91cGQr0+r0X1YzysTpsdVITVFfF0mXj7T/b9pOpH6OkTd8xywtv49BwvWjDrE5ehS
	 mm8U5Dfq16pcvtrgoVYqg8q/7tFQNk/TX0CZJrb7Lhu1DSRJpTfPeGUwKJlqe9NN+HI4y
	 1PG6lIuSIh4ExXOepIf/EBrBG7QABONph2ikrs9PWQ7TyeuNrW3f/W1muHw1K8zWmA+Zd
	 TViOZ5So66SdBv2hjug7clv7W82VzRcHXMkekqZDmQ6PE0ENY/eNz+oU/7sPcIq+YuA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792411165;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=3f6BEeQlo0ogVMt/LctYi2JH1I30QPll0X4ycAr45ZU=;
	b=RulMrvlLd9RDkJTFKldkuM3tb0gVfpyckhXaTIlnQc4bLK0ubOzc1O8xPBHanzxlkEpi
	 zkUJqyxr4ZKNkFlJ1aIBUOb2MNC1BsvKi3PDj/2lNwWvq/YUuOnLizM6EwqGm3iWJlimb
	 BoQU6qDq7MuUcA2CJXGuD6MCNKr5H4EH2f/07iy+Ywkq/Aq7d5Vw5Mk97F5am+OyJ2NNv
	 G6Nn61SRJZGjuc/Q3v4qH5dg+1lrNd4SA0g13MJxZ8OltOFhBN3sdAlTgdvAc565KY0T2
	 5aT9gBlk5IClS04pos/0FSVmMrYhqatLjYy2FM9dy/5qw8sP7xYp1WRnf6dvxo1+YCA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792411165;
	bh=3f6BEeQlo0ogVMt/LctYi2JH1I30QPll0X4ycAr45ZU=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CtUxJPCYy11+tbTt/4XPdQ1WYKtunlMud/Na4Y5gSiKMuceuMUugxcd6a6N8YNCuN
	 9Fs9ZppF8THBvFi/df7CL7DW4sb09e5RhyGLqsDf4a6CuBSzOQveayINa9iIyVEUcf
	 xM6/Ruviw1zKNGuUPq22PuKiRo6bZvb8IL51l2dXiiVnPRkPizEy4RtmUCqqggi4yS
	 HDKG5MLyaJh28xYMR4PswaN6WVlToMpn6BkY092v4vzrd0YoGtnDYXR4suy4xEHIBI
	 2FzZhgD+Ud6WIymZ4PW7EfrDWv5j/fn12P7IHGHv5mqGp++oUNMhS+ta+wJ8C50uWv
	 OeL7wODpFY86g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D7B160612;
	Mon, 19 Oct 2026 11:59:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 12BC01DE
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 11:59:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 04883406C0
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 11:59:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WGHUDlmRfYDA for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 11:59:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 26C27406BF
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::1232"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792411163;
 b=fFB0VRWmDH4l+kXCBVfHU9p9kj977DRiO0JRshoi4p+0VCcSKkyGsCSGguawmpTA/7hB
 fgquryb1OIlAQVWLtP1Reo8rdaPw5mZgIANqMOBgHiJx7Eck9JKV8e61QZXoD79CLnv1n
 b3q7O69oK9fNYEWwvz5vhSEnrU8+QjQ0PSa+WzPnyJNAW9OKVZYOrhjxdgsaBe8bPt39S
 xoibGz2eFm7EkAwVPa0rlo5rxdCLST93D+oQG5PZBN+LbKo2eHziGUeCJshTVdC+xXSmg
 TQ2DecObz2HHqWbsUC1V09tMJTrdzcgU2sQSpGkdcHZhn1aAxnGCKKFgUq7oNBp+NgA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792411163;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=A55+/bIrb8REMeMiFlZBycUp4ZzfUwH6GiwLrXHcfjA=;
 b=h6u6fV3lHRU70g8GYjxdLY1cRtwyFlD0mx5lR2/pBrWNX0F13KJ4UCVDgCHVUqZIsesf
 Qvk9wpzg8vLeqUz9LXQaGcvzQbVae9Q3Ra1BNFmSDs83sEaWIT8F1xtfYZk4eMyfQMRSI
 TRwYJbCnJ1dI23J+4FwRoCI88zNPv++Jb+RY+cmDuEDZmUs/L2TY3NrH9zr3ZLZVVffiG
 B+0u8nreTz8CUuaxM5NcEdeFhlyH00yWTOzPYhcxbGujDUKOvM/DzHIeWgRLSLo6oiJFQ
 mW8kUPum4pnZ6m7AhvE5vG7pmW+6McHRcYw6KN5Mevl56RuWRDOfTkUfp850H0pT92A==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=bsq81QAP; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::1232"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1232; helo=mail-dl1-x1232.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=bsq81QAP
Received: from mail-dl1-x1232.google.com (mail-dl1-x1232.google.com
 [IPv6:2607:f8b0:4864:20::1232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 26C27406BF
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 11:59:22 +0000 (UTC)
Received: by mail-dl1-x1232.google.com with SMTP id
 a92af1059eb24-18cdcfc05ffso56588c88.1
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 04:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792411161; x=1793015961; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=A55+/bIrb8REMeMiFlZBycUp4ZzfUwH6GiwLrXHcfjA=;
 b=bsq81QAPSEoUsJLbe+wtuqOxKVOZtbvKTPVLZvoP/ef0fX+tV5cDr8CWSqQO6eCguq
 w06CN2rkPwBXPaiW3G4R1zCTLNUJu3GLjqQXZQWHFOpYd3vY9YWL7zyQ3LoAuBGGDrVA
 4os+33hxbWCGAMRCEnVXadIRwRuCv0hlVu69uX2lI8gOYjNPPSBkh9Qfj5dG6aLnBSj6
 zaonqWsxQot8HtcdTtt9XRvCs6NBKeQnIlu1BeTDmq5Guq0pg3CD5HMiVZkEVoglh/9r
 2AhhlFxRtrPi2yONYy3VkK7Fx2MCL8o4V4vOSGg7yKy8675EKcbUvq+wWc3kc9ldzTfl
 R4vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792411161; x=1793015961;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=A55+/bIrb8REMeMiFlZBycUp4ZzfUwH6GiwLrXHcfjA=;
 b=MwSKWNxCjwyamUVc2bEN21nmUDKY4hcspcSDaCFucMIflvqC9rD7Pmsep1W9lgB6Bv
 YlItqlA8fEy36kic/WMnMMPOi3E/DJfPqqO1yjmIPk5OkP/4p8jfdABo8PIldaoZIdbs
 +wqWq29csW7Vfol44SjPbOO6WU00GPnX2uJeh+uOwypsiTV9CFDIsOC5aBDSke55Czjj
 MywtWzg4lUqAc2wx2T00bVnn5jKw8HxEZcsD1xO2YqPzYHyoF6m2xQGPZQHvsRTr+IFr
 XT7rZFvAxKAtgqvdoVzUOyMFYlK4Bl0sJHHp79ghPbdTc+8yyn3b7l8rLx9KNGyORU98
 ybmw==
X-Gm-Message-State: AFq9FYLFHcR7djX7zQTAM6H/K+TPF0QDSdvRXBVXR3Sp9NaGC0+v1ant
 xhJXyCI5ZmBybbgpFFaMui8q+6pB5wWFb+Ra6fj22ODApjcHmaXf+e3mSg+k3tjfhtg=
X-Gm-Gg: AYBFou3EkVz23AXSHdK6WF1IJOe9072Mx4lrOflQSzyXtHabIiPdjm6zwSkpWvi4unV
 NHLBT8YBeAcgU4woNbMYnTOn1BO2cNcJltH4GCbb6vypWj8mZ/Z+sZuHVuDJTveNE3tYFGQT2hB
 Nv3GFPOx3EwJvlCJd5JoOARTHvpruj8+uu9bPZSbsylHdunATUYk013dDEvcLqCoFBV81wD18U8
 MUMIxYxLxMPOMiuPnj2VoytgEAdyBCVWluu6gXF5dq6EufH9MtoCZonHJ44KG6VG3x44s6Aarnh
 rz9TMg7liW/4mAWa7z7NkYu9OGGiYFw0sF85Jl4ror/JQRyWkXbEMhIY7rfSqgQNH7k3NPYOrFm
 q3O1Q6HFX8MgsZWK3FeApQY5eNkoPXhb/r4i62Z3j1+hPL/rPQSwTKBtXvzWSuCenvU3rosss8u
 v4sCRpwAogNNUkkyT6hxJ5Up9XYzrDEcbtv27V6JKV8BWeGpJ7rOJJ7JjgRzR8+sy3G/dXyvkaw
 ilL9IYHGJCwiNfGfu8p8VKQjM65SCNh
X-Received: by 2002:a05:7022:5f04:b0:18b:48c3:287c with SMTP id
 a92af1059eb24-18b48c35c92mr2073798c88.41.1792411161274; 
 Mon, 19 Oct 2026 04:59:21 -0700 (PDT)
Received: from fedora.taildae27b.ts.net
 ([2405:201:9008:10c1:dea5:be99:85df:68ae])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-36083283478sm30657918eec.29.2026.10.19.04.59.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2026 04:59:20 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Mon, 19 Oct 2026 17:29:15 +0530
Message-ID: <20261019115916.775677-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/hyperfine: bump to version 2.0.0
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

For change log, see:
https://github.com/sharkdp/hyperfine/blob/v2.0.0/CHANGELOG.md

Changes in v2.0.0 include:
- Add support for alternative performance metrics (peak memory usage,
  instructions, CPU cycles, cache misses, branch misses, ...).
- Add --env to set environment variables even without an intermediate
  shell.
- Benchmarked commands are now executed directly by default, without
  an intermediate shell (--shell=none).
- The JSON format for --export-json has changed (schema version 2).

Refresh the vendored cargo tarball hash for the new release.

Tested using:
 utils/test-pkg -c /tmp/hyperfine.config -p hyperfine
 (Result: 6 builds, 3 skipped, 0 build failed)

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 package/hyperfine/hyperfine.hash | 2 +-
 package/hyperfine/hyperfine.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/hyperfine/hyperfine.hash b/package/hyperfine/hyperfine.hash
index 0bd5a1b873..6abfa53fa0 100644
--- a/package/hyperfine/hyperfine.hash
+++ b/package/hyperfine/hyperfine.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  10ef59c1ae8c368f3663cecff219f872ada90dd6bdd52d07e544bf9bdf777093  hyperfine-1.20.0-cargo6.tar.gz
+sha256  09a95fe2fab6d647acd5f8653e686650ec6fdd629c0d639fb8ac840e622ef68b  hyperfine-2.0.0-cargo6.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE-APACHE
 sha256  1dfee18c2ff07ce551de4d6a1d2db158c0380746b488a7f0d08c8e0d3568b7c3  LICENSE-MIT
diff --git a/package/hyperfine/hyperfine.mk b/package/hyperfine/hyperfine.mk
index 8af6e0298a..59e503d094 100644
--- a/package/hyperfine/hyperfine.mk
+++ b/package/hyperfine/hyperfine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HYPERFINE_VERSION = 1.20.0
+HYPERFINE_VERSION = 2.0.0
 HYPERFINE_SITE = $(call github,sharkdp,hyperfine,v$(HYPERFINE_VERSION))
 HYPERFINE_LICENSE = Apache-2.0 or MIT
 HYPERFINE_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
