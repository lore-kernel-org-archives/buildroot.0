Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10A5CC83F1A
	for <buildroot@archiver.kernel.org>; Tue, 22 Jul 2025 05:05:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FDA38444C;
	Tue, 22 Jul 2025 05:05:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Re2L4Zn-Hzk5; Tue, 22 Jul 2025 05:05:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB25F8409E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB25F8409E;
	Tue, 22 Jul 2025 05:05:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A22FADA
 for <buildroot@buildroot.org>; Tue, 22 Jul 2025 05:05:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 92F2D84006
 for <buildroot@buildroot.org>; Tue, 22 Jul 2025 05:05:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EOld2VAITLEX for <buildroot@buildroot.org>;
 Tue, 22 Jul 2025 05:05:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com;
 envelope-from=lancethepants@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E525783FF3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E525783FF3
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E525783FF3
 for <buildroot@buildroot.org>; Tue, 22 Jul 2025 05:05:45 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-3122a63201bso3704660a91.0
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 22:05:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753160745; x=1753765545;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JZg+Xg8Rr2pYUMnwkxB86NVO7h5TfINcztGjvpJNUzA=;
 b=wCD64q2eJ9pkYtNy+drMyRPqpXnY/jn0+YweCCoMC2mWb9n9xuaUXf6MBf3OMfvzac
 Mo60+CB36SywinyMUC3tsFPKgSjejNH5YmQE8fedxUFOtVN6D/R8wFCo0nLKkKjDXdGn
 cMpTPW+FyWgJOjsUTY98QhbeFDxLPlRVqKN3uCY744y7kjkdKDjLUD4vZCftTY96ssXl
 eEd+f/KPFzmaNvVoW50P10WHaSqQNT0c07YF93ArXFWNEj8oaaeQ+EOsjLpeyZuEh+aZ
 jNO99PCtMAP+LpoDzW8sBgvjzbykbrXF8+kbiHZ2VKsPzjTkt0Zs/OpInUCgpqSP+Mgu
 7I2w==
X-Gm-Message-State: AOJu0YxfS00z8kmguz1UcqE0oNVYpmIBxjCET8DGX3mXXsAqUP3a+F4r
 il65NjJz3wPIf4xOp3MRQc3p0KoBQnRNsvh2P3oHMvF3SZzGTHf2e5dgOS0gAw==
X-Gm-Gg: ASbGncvseRotkhOIf2SxtAxWW9qE03D1yibKggC4CWg0t0ts/hFlFeSv86FmLIjMEyh
 djIfSjnLyPliXgCAn9wt25uSGefERrheQl7exbrQST5vFsog8G+tyhOfG8LxWXeeMkJgHBV+j+J
 bAT3YVqFzHqzcLF8mgdIn6WkLe9WB4sTzf6h35/wUf7vWSoImelvgacf6HL9OGuhZPSR7Yx2kRl
 PM0+6niiqanu3KqO9vj2SCK9aWVT8UMZiDoO0rmjSPzz7bxHjmNvAbaCBVctTMOZlzHMziWqHz+
 3ItxKirZcURWQLqaEGT+OB3XXegd/HOvvdTvJH4G3fCmmfuBarjZmvqktgVdM8YQlssnj5G5pjV
 zsz7IQ3+uh8f9uQ==
X-Google-Smtp-Source: AGHT+IFJBnxLhJZ97y3od2JAJVt/ipI0Am87KvYyY1pZXt1zNwyoDlu8GNwd8MoiX+OFCrpYrPKJwQ==
X-Received: by 2002:a17:90b:270b:b0:311:d670:a10d with SMTP id
 98e67ed59e1d1-31c9f4d0057mr29355262a91.26.1753160744964; 
 Mon, 21 Jul 2025 22:05:44 -0700 (PDT)
Received: from ProgramPC.bm.local ([76.8.199.226])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31cc3f2dbd9sm7197734a91.32.2025.07.21.22.05.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jul 2025 22:05:44 -0700 (PDT)
From: Lance Fredrickson <lancethepants@gmail.com>
X-Google-Original-From: Lance Fredrickson
To: buildroot@buildroot.org
Cc: Lance Fredrickson <lancethepants@gmail.com>
Date: Mon, 21 Jul 2025 23:05:41 -0600
Message-Id: <20250722050542.2949118-1-lancethepants@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753160745; x=1753765545; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JZg+Xg8Rr2pYUMnwkxB86NVO7h5TfINcztGjvpJNUzA=;
 b=UDeZVHyOCSOe7jpALxzyFR+9n2mKPuD9WQKAx/Qr9gGZeUweeuaDIFx+44zmcJ4/UL
 foTbYaQpV3armtPoulH/mtJHhijLsVE6hj/hJSgQlzYdNGQGzQRH91xIAT1W2WFrCFDH
 zGMp03uIt+cPYvWK2vqOPOjU4OwcA2BLAij+0vdMudNq+T7WVnw17FLSy657bSFBJn8W
 GN/sbZdQVPXiOJE4kn8hUOAOWq6Lvwk6Wl5BABu3k6pViMCyIacrj6SB5WNcJxPg5YAo
 aRDyEC7Sf1/QDmNcoKJFhq3sNTPZRsma7p8CELZD1kb6h27auCQS2hRl9o999UQjPPpg
 lVHQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=UDeZVHyO
Subject: [Buildroot] [PATCH] package/ncurses: bump to version 6.5.20250720
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

From: Lance Fredrickson <lancethepants@gmail.com>

Release notes:
https://github.com/ThomasDickey/ncurses-snapshots/blob/v6_5_20250720/NEWS

Fixes observed issues with htop on aarch64/musl after the last ncurses update.

Signed-off-by: Lance Fredrickson <lancethepants@gmail.com>
---
 package/ncurses/ncurses.hash | 2 +-
 package/ncurses/ncurses.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ncurses/ncurses.hash b/package/ncurses/ncurses.hash
index 9829cd512c..7369e3cd64 100644
--- a/package/ncurses/ncurses.hash
+++ b/package/ncurses/ncurses.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  271044605db2f64fcd1c697c5444a08eae0f70cae33b934e59f205954004a449  ncurses-6.5-20250517.tar.gz
+sha256  fc3871f051e941a637488c07c81d984f731003e65c0f78353606e18296011aac  ncurses-6.5-20250720.tar.gz
 # Locally computed
 sha256  708999f95527e1ffa670c6fce288c6c600cb477dd04afcc1171422b3dd4ee226  COPYING
diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index 4eac66a71c..864f62b57c 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -6,7 +6,7 @@
 
 # When there is no snapshost yet for a new version, set it to the empty string
 NCURSES_VERSION_MAJOR = 6.5
-NCURSES_SNAPSHOT_DATE = 20250517
+NCURSES_SNAPSHOT_DATE = 20250720
 NCURSES_VERSION = $(NCURSES_VERSION_MAJOR)$(if $(NCURSES_SNAPSHOT_DATE),-$(NCURSES_SNAPSHOT_DATE))
 NCURSES_VERSION_GIT = $(subst .,_,$(subst -,_,$(NCURSES_VERSION)))
 NCURSES_SITE = $(call github,ThomasDickey,ncurses-snapshots,v$(NCURSES_VERSION_GIT))
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
