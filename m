Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74775CD37B2
	for <buildroot@archiver.kernel.org>; Sun, 10 May 2026 19:38:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45F2B846AC;
	Sun, 10 May 2026 19:38:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R-0b8yL-YeIj; Sun, 10 May 2026 19:38:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3146F8459A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778441926;
	bh=Gq+VDegeGnAalw6jYlcpcEabgZDawqtKpszdZDGBK54=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fAvyGSeBSyW80XSvj18x1ZgeBhDFTTJqiEzeGhSxmS/yYLXp2Jy2bXGvPm3tYYUe9
	 F5jd3bBzxXWWjiJ4lx5l8EB8ODYJgn9dNClKu28YapoOX1n/Zpxfbqx+XxyL9KWdTp
	 pSFf4VbRx7KqLRETWC+e7YRouZK+g/u7iGckIJToi1WnigkuGZUH0QeD1wVdFPEOJE
	 H2T5LyVoMrWfZXLvbqZ9UUrd0EkxN7qkHRDN9BPvTe1Dr49lwtqk+KPbQJ/MpKVhzA
	 jqY6mCDw7rWY/y1L0Cp/oyp6EcaP+jBxF9i7tgIvndZN39ZdHo/IaN/8cGrJvKOp0D
	 NwqfABgRx6ZGg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3146F8459A;
	Sun, 10 May 2026 19:38:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 45C41223
 for <buildroot@buildroot.org>; Sun, 10 May 2026 19:38:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 37C1360859
 for <buildroot@buildroot.org>; Sun, 10 May 2026 19:38:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j5OyxviY6vr8 for <buildroot@buildroot.org>;
 Sun, 10 May 2026 19:38:43 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com;
 envelope-from=j@j-ernberg.se; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6CB186082B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6CB186082B
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6CB186082B
 for <buildroot@buildroot.org>; Sun, 10 May 2026 19:38:41 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-5a85b30dd54so3669141e87.2
 for <buildroot@buildroot.org>; Sun, 10 May 2026 12:38:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778441919; x=1779046719;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+vG5ohIaQ4bGB9LYXGL0AOVl7Q3SyO2LRgZbhFqujkE=;
 b=Qd/OCu7V4fiTCjHhm+Rhe8MsUCBikrS8okTAUrn2uKaBh+C+Oq9ChZX4q+DQkaNz6Y
 itX2rfxe0mEaLSlYjneZzl4eL0UFs5pBHtK5caJqF6yKzvyGEPvkjFsScVrC1sXu/Ql3
 tIKy1LtdAJP/toMnSer1X5lKADB26oda1Cf5mApguoIir4O3fRRpXtlyiKtXNHUeICBC
 4LJ14ePzCcj9Ty7mofjQSjCWJtAkHB91huFt7LxWlcOUMT7n2Zd1RqRLUuS3DKzEoh3i
 cXwY+acWolSBwVkjVjPyIqon/Zd07tk8c+OQc00VCjLTDadwGt6sNlEsVvY0SvYGgH2E
 5Nsg==
X-Gm-Message-State: AOJu0Yw8G7LVtpF9/KngCcyYV6d6zoGyZH5fmLcNxyKC6/3Anju9YOPb
 MZ+sa1ILA+gAhOfcgAx/oSkwq7E1p7IQ5cFM8YPW0uUSWqyxhRd3dkQxhRV42afu8ETcM+DiyIK
 5aQqBSMytHg==
X-Gm-Gg: Acq92OG4ck5mFwhXPgyA2w9C3IjmqQLmn1b6yDL4tA/eNxSy7H7fDcbyGXatTJvsclO
 clhaOzTHhfd66gVX3uuX3GhOl/hJEA0iR93TERY2rarw9xCZOkX2CJmftUp3yxKx+/kZp0GFH44
 i5S2Gv8AeFxOK/L36dmsiKcPhxJTeolpMH/XZjEDTRBrPpkMWEAUH2FV+HxICyE9C0rMVvQV2Jw
 i9Qbxx5N1ICme8k7ly5VEQMpy1dDArrChfM2fg/JzTQS4PcSxYWJRBPJF0Y9quHD8vBjvtHMhiD
 Us3e8eGiLHsRElCNKtegmSWm3HSSV7IY51vY0eu63Ke/TKilJLbrGC+Kh1OdrfMhnrJbltFxi3N
 ZHeuGi7/90clF7JmNO0GLuFhOTLnDLL3ggnHML43VsVP41Gz+9LvpkgissyK0WQJtpBvOqZmQTE
 E3Ih2lVI8bQhZ5Nl1aRi0dW2GRZt/JbgtXIJ895iYII5EszmEcZSAsl+Sp3pJ29Q==
X-Received: by 2002:a05:6512:3b0a:b0:5a8:64fd:142 with SMTP id
 2adb3069b0e04-5a887ae1ffbmr6469701e87.15.1778441918855; 
 Sun, 10 May 2026 12:38:38 -0700 (PDT)
Received: from localhost (78-71-152-124-no2360.tbcn.telia.com. [78.71.152.124])
 by smtp.gmail.com with UTF8SMTPSA id
 2adb3069b0e04-5a8caf287a3sm404806e87.36.2026.05.10.12.38.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 May 2026 12:38:37 -0700 (PDT)
From: John Ernberg <j@j-ernberg.se>
To: buildroot@buildroot.org
Cc: john.ernberg@actia.se, John Ernberg <j@j-ernberg.se>,
 Andreas Ziegler <br025@umbiko.net>
Date: Sun, 10 May 2026 21:38:22 +0200
Message-ID: <20260510193826.2846038-5-j@j-ernberg.se>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260510193826.2846038-1-j@j-ernberg.se>
References: <20260510193826.2846038-1-j@j-ernberg.se>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=j-ernberg-se.20251104.gappssmtp.com; s=20251104; t=1778441919; x=1779046719;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+vG5ohIaQ4bGB9LYXGL0AOVl7Q3SyO2LRgZbhFqujkE=;
 b=hwuI9Z2B7KK8ZQLrUlOu5Db9ddrcQSXn5jHsf0Yv555QgMy6X9xHBmh5Rfwm11aMxE
 O72zGjXAK1QMCW/XzakgOT2rdOmseAk3JTcVGlLZlUTHLgsm+9sRaTN7MzYtulPZOzsH
 429l6H8M0KrhyIUXnUxvjGsH4v1yH5fRatEFjXd/rl1WRYfb+78fjTiEpsCprnkkKI2Z
 3cK6mra/nfGox447CuUDETjWz7u0Uj9jh3NKLnI9tw4X5bRhQbSsUV7SBQksSY8V0A6j
 MUWHBPN3BDbpu1KFS7vYyCQvh4Ic063Sj1HZAydpCdlbpf41u/iD5o0sPta+KfFRCwCp
 DWEg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=j-ernberg.se
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=j-ernberg-se.20251104.gappssmtp.com
 header.i=@j-ernberg-se.20251104.gappssmtp.com header.a=rsa-sha256
 header.s=20251104 header.b=hwuI9Z2B
Subject: [Buildroot] [RESEND PATCH 4/8] package/mpd: Disable sidplay support
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

Commit 25af5a3b3aa3 ("package/mpd: update version to 0.24") from March 2025
bumped mpd to a version that dropped support for the libsidplay2 library in
favor of libsidplayfp. [1]

Since libsidplayfp is not provided by buildroot and no one has complained
yet the sidplay feature is likely unused, as enabling it breaks the build.

Drop support. If someone needs it it can be re-added along with the
dependency.

Link: https://raw.githubusercontent.com/MusicPlayerDaemon/MPD/v0.24/NEWS [1]
Cc: Andreas Ziegler <br025@umbiko.net>
Signed-off-by: John Ernberg <j@j-ernberg.se>
---

RESEND:
 - Forgot to subscribe this e-mail to the list

 package/mpd/mpd.mk | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index ce7c44a9a8..e60eb23cfa 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -24,6 +24,7 @@ MPD_CONF_OPTS = \
 	-Dmpcdec=disabled \
 	-Dopenmpt=disabled \
 	-Dpipewire=disabled \
+	-Dsidplay=disabled \
 	-Dsnapcast=false
 
 ifeq ($(BR2_PACKAGE_EXPAT),y)
@@ -284,13 +285,6 @@ else
 MPD_CONF_OPTS += -Dshout=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_MPD_SIDPLAY),y)
-MPD_DEPENDENCIES += libsidplay2
-MPD_CONF_OPTS += -Dsidplay=enabled
-else
-MPD_CONF_OPTS += -Dsidplay=disabled
-endif
-
 ifeq ($(BR2_PACKAGE_MPD_SQLITE),y)
 MPD_DEPENDENCIES += sqlite
 MPD_CONF_OPTS += -Dsqlite=enabled
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
