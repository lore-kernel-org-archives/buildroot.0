Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C819ECAC582
	for <buildroot@archiver.kernel.org>; Fri, 12 Sep 2025 08:35:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8AB7C60B9E;
	Fri, 12 Sep 2025 08:35:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lpAswyBmWcCp; Fri, 12 Sep 2025 08:35:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C156160BA8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C156160BA8;
	Fri, 12 Sep 2025 08:35:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 109A312D
 for <buildroot@buildroot.org>; Fri, 12 Sep 2025 08:35:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 02D0C60BA8
 for <buildroot@buildroot.org>; Fri, 12 Sep 2025 08:35:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pSe3-6WxJCA1 for <buildroot@buildroot.org>;
 Fri, 12 Sep 2025 08:35:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::464; helo=mail-wr1-x464.google.com;
 envelope-from=anton.bengtsson@plejd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2D99960B9C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D99960B9C
Received: from mail-wr1-x464.google.com (mail-wr1-x464.google.com
 [IPv6:2a00:1450:4864:20::464])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2D99960B9C
 for <buildroot@buildroot.org>; Fri, 12 Sep 2025 08:35:07 +0000 (UTC)
Received: by mail-wr1-x464.google.com with SMTP id
 ffacd0b85a97d-3d44d734cabso1353563f8f.3
 for <buildroot@buildroot.org>; Fri, 12 Sep 2025 01:35:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757666106; x=1758270906;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wXXn0VCTKMASoC9+DpLrdBRAzF4Enjmm+Ly9iaOLNyc=;
 b=ITzkTEf98OXla8/rASzi92gd2V/ab/qFI+i/sY+QP1w/dmgsleyWNhl9S9ZezupCJK
 NoGDHjUZIW+77PiGTvVaTcwmXZSmv++qc3FVxfrxstCbtIc1MqIjT3n66H30rLobIZkG
 L3sgfpqO1nBkFB7bJhRQw0G/2yMsV9VU00fNptxeNxJ082T8tVhBN7DPoc0QwgMYCiYp
 dHjQ8EpSr+PByepgwENikl/GD+K2KK6nuUB/dsqyuUyI3Ykb2YaSoIz5Etvf2pydgF3R
 im9xQTOZbXdkSCsfirRBIhTbsxnZnY+chb69HQjj2z4i9pknOHw6mqRiJubRJVJnFlYA
 KS+g==
X-Gm-Message-State: AOJu0Yx/eoxnVlU285ps1DYeOHaXCgrxY6bzGW4FBc2jjJOtnbxUrReC
 EbT9VW00vu+h3HcJJ7oQg2cAhv7wo2PU3WBRMf1X6H/X81miDy0sdIOTk9dNtaxRkD1tYOC2wf6
 ZARc3A9WO0TrmPrBEK7v3CGgY4CnUaqEWA7WP9RO5ab7r
X-Gm-Gg: ASbGncug9p1iSBhIn+X2U9HvqnSnnhFcYDRHJ8xnJcWefr9Lz1uggG76MvL1iq3Q97f
 goZuEneMuNXb11QAcn8E76iALUypniRAQ+Vsy9RZhUhorI+XB/flX/F10GCojkSOkcQnV/3GuDe
 eXTdQWDhehtYVZwaMZl+Gdgzod+hYrx+qmER/px1us6/mO8J8bqNreXRI5AXL/pxebUzlozdkGY
 zltKq626bJ8Yw8UOv2cQt1C9Hjm7wNuYReRv4eROl160gBs3WH7ZVsQIkGxBxA+Ex/xUhCOyYEy
 GAU4wMYZiOFgho/xQys4DHFlStKDvORQet4P1IewOBqeSDDpxkR8FWiAXcQmCaQv9kNyQTl+Vw7
 oaKe9S4dy04yBpa81
X-Google-Smtp-Source: AGHT+IHcqwtYFqBqnY8H/g0Oow0NGP8UYxvIVMCsXbSyIxoNIwSSwSzvWbK7Hu+Bhcd5RIZ/l+KqbUSzZ+n5
X-Received: by 2002:a05:6000:2307:b0:3e3:e7a0:1fec with SMTP id
 ffacd0b85a97d-3e7657924f5mr1924595f8f.16.1757666105866; 
 Fri, 12 Sep 2025 01:35:05 -0700 (PDT)
Received: from anton-b-thinkpad (h-213-164-192-18.NA.cust.bahnhof.se.
 [213.164.192.18]) by smtp-relay.gmail.com with ESMTPS id
 ffacd0b85a97d-3e7607effc7sm794601f8f.44.2025.09.12.01.35.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Sep 2025 01:35:05 -0700 (PDT)
X-Relaying-Domain: plejd.com
To: buildroot@buildroot.org
Cc: Anton Bengtsson <anton.bengtsson@plejd.com>
Date: Fri, 12 Sep 2025 10:34:32 +0200
Message-ID: <20250912083432.3444568-2-anton.bengtsson@plejd.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250912083432.3444568-1-anton.bengtsson@plejd.com>
References: <20250911121235.3062715-1-anton.bengtsson@plejd.com>
 <20250912083432.3444568-1-anton.bengtsson@plejd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=plejd.com; s=plejd; t=1757666106; x=1758270906; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wXXn0VCTKMASoC9+DpLrdBRAzF4Enjmm+Ly9iaOLNyc=;
 b=P0cNNPZxsV4cFu+o8fHDP+exqku10zHNpzK/3bHLdJ0YgpjOYB6WOnPiQ8wO4N6K1e
 wRIn0v06pJHsHCGYzRDr5YbW40ROr7USqFJZ1zL7CSyOOuJAU50BgLxNRbIEetvr79t6
 V4K8h90DWJfh1wHY4H31ghxWkTfzy56UipOe4=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=plejd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=plejd.com header.i=@plejd.com
 header.a=rsa-sha256 header.s=plejd header.b=P0cNNPZx
Subject: [Buildroot] [PATCH v2 2/2] support/docker/Dockerfile: add
 python3-looseversion
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
From: Anton Bengtsson via buildroot <buildroot@buildroot.org>
Reply-To: Anton Bengtsson <anton.bengtsson@plejd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Required by support/scripts/cve.py after the migration from 'distutils'
to 'looseversion', since the former was removed in Python 3.12.

Signed-off-by: Anton Bengtsson <anton.bengtsson@plejd.com>
---
 support/docker/Dockerfile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/docker/Dockerfile b/support/docker/Dockerfile
index e7677ac6a9..82e1942505 100644
--- a/support/docker/Dockerfile
+++ b/support/docker/Dockerfile
@@ -59,6 +59,7 @@ RUN apt-get -o APT::Retries=3 install -y --no-install-recommends \
         openssh-server \
         python3 \
         python3-flake8 \
+        python3-looseversion \
         python3-magic \
         python3-nose2 \
         python3-pexpect \
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
