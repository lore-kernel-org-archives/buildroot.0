Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 827A6CCD190
	for <buildroot@archiver.kernel.org>; Tue, 14 Oct 2025 19:18:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41BE341343;
	Tue, 14 Oct 2025 19:18:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y5qZPXEmpj7W; Tue, 14 Oct 2025 19:18:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 724DC4135C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 724DC4135C;
	Tue, 14 Oct 2025 19:18:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 73CF6BC
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 19:18:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 59E2F411E2
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 19:18:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id do_9HmP7sbhf for <buildroot@buildroot.org>;
 Tue, 14 Oct 2025 19:18:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=maxime.leroys@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3701440545
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3701440545
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3701440545
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 19:18:33 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-46e504975dbso34486325e9.1
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 12:18:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760469512; x=1761074312;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1yde+bhcCQm3EUNhETqT/3mHmo90Kp4Km5tIiRFTWEM=;
 b=e5UKl/3vF67BLqhPGX3YDCyvPIIi8pK6+0h7GCN79NXk9VwQASMmjjZ4WAjaDSvZFR
 Wr+1wklk0PEquwiypMse8o5bVxUBWof1auEygGmVlXwM3MLHm+aJZFQruDharZ072uax
 7wMc/P5PJL/qQlS2sG/FCmxTgisVlYXF+Wfg6juybwt04YzPZfTENGIO79BT3De4vupO
 btnAmLutAhcqt99Xxw6xZtp4HE1gVWIoY1ne3ElIg8cRilOdVV52Hrx0+SKpQ5yXtQ/X
 sc+Quem/pUxh/8cRBp3edke4jZkGAVrs1ZA+Aaposyh4mFfeAGSGm32SVE494oz6kP+J
 16iw==
X-Gm-Message-State: AOJu0YyDcdyWqjjxeGdA6Z+AtqRv8KvDWiFqiFa7BhPFeLqNMs17eHOH
 TBlIpfT2noTmj2Zsa8QRWTFnHUBlsnvao1EaFpWtol0gUmYBOLPq6uDbh9qKQQ==
X-Gm-Gg: ASbGncuuXLYHAgbIOs5Peqgn3TzY2JgN/1eRx6o6DpcKZAYJWYjuVNuYT6G/gKm+hke
 GIuw3cRqbha1iLjuZ7z2liOfkCpFoQ97x0/t7Qz9YwzjnNLUc5hN1B4ypldruchu8XvLn4WJyG8
 2q8hYrAdBxhNRv7/kn9nrPFGER8v83uhZ8Lie97Fy+I23P/9SMUued3hhsLBbbSmy6Y08RfVqK0
 Z+6qZHoTPAvTbLOzJvCWfpDtwsMoP5i54uSezTM1gu66XqqfgDz4NPFernnZxXcirG9zxq2ME8U
 S3ET+d2zU7SboT2Wgk2RJ6S05YJup2TI4+KMX7osUra2txbCG8hpOpxA69siTWE5f7LiuqP4w8N
 IPotXAKxslxV2a+p9AZEWBK5ygwZBxwyCSfjTZOyiK0A+
X-Google-Smtp-Source: AGHT+IHfs3lkeutvqzRthYQekZ8bsIK7AgTaYCsgECoL1SMNtLJrgJ/uvB6NRccZQCET9UbnhvotAw==
X-Received: by 2002:a5d:64c4:0:b0:3ed:a43d:8eba with SMTP id
 ffacd0b85a97d-4266e8de141mr17131501f8f.52.1760469512114; 
 Tue, 14 Oct 2025 12:18:32 -0700 (PDT)
Received: from freepad.. ([2a01:e0a:6f:bdf0:5505:2845:5a50:c0c0])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426d0d9050bsm23343262f8f.13.2025.10.14.12.18.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 12:18:31 -0700 (PDT)
From: Maxime Leroy <maxime@leroys.fr>
To: buildroot@buildroot.org
Cc: Maxime Leroy <maxime@leroys.fr>
Date: Tue, 14 Oct 2025 21:18:26 +0200
Message-ID: <20251014191828.442802-1-maxime@leroys.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760469512; x=1761074312; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=1yde+bhcCQm3EUNhETqT/3mHmo90Kp4Km5tIiRFTWEM=;
 b=XtMqA7rhZUCuvnLS9Jr6E96TFMX/8UMVpqtrWRiDMC3jtyWC6b0uy7yqmthrunpt5m
 diQ0Ew4EXeHYodN3rc99n+llTBhAvpmtu8309FcXzEXg5hpRnaN5pbBtdrsgNJSdB21m
 7FJ0k4eIHV1fzmooLWyHC8G/YEb/JpiVUjA4dLdQj1dmE/QKJPfedcdrglvfGyBi3Rjt
 jphp++B8OImimGdG1vVDaEPnjiVRv0XmzBo6/PQ+xp0WfANtRsRUhPBqt6ZMs6VI2GeS
 mHlCr8f5OUJNrV7HLfA4TM/jCZzG9UBXtH1vMA93R9P5UwlZpXOS1H6EchsqsWTxeosB
 tjkQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=leroys.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=XtMqA7rh
Subject: [Buildroot] [PATCH 0/2] new version of grout package
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

Grout 0.13.0 requires libecoli 0.8.0, so both packages are updated accordingly.
Build tested successfully in CI:
https://gitlab.com/maxime-leroy/buildroot/-/pipelines/2099339317

Maxime Leroy (2):
  package/libecoli: bump version to 0.8.0
  package/grout: bump to 0.13.0 version

 package/grout/grout.hash       | 2 +-
 package/grout/grout.mk         | 2 +-
 package/libecoli/libecoli.hash | 2 +-
 package/libecoli/libecoli.mk   | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
