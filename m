Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD159C282C5
	for <buildroot@archiver.kernel.org>; Mon,  3 Mar 2025 04:16:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0EC496077A;
	Mon,  3 Mar 2025 04:16:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bb9r4Mijy0rp; Mon,  3 Mar 2025 04:16:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 356546078C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 356546078C;
	Mon,  3 Mar 2025 04:16:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2EE53182
 for <buildroot@buildroot.org>; Mon,  3 Mar 2025 04:16:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2A1A86078C
 for <buildroot@buildroot.org>; Mon,  3 Mar 2025 04:16:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dBuhYbme4JXX for <buildroot@buildroot.org>;
 Mon,  3 Mar 2025 04:16:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::233; helo=mail-lj1-x233.google.com;
 envelope-from=troglobit@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BFE4C6077A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BFE4C6077A
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BFE4C6077A
 for <buildroot@buildroot.org>; Mon,  3 Mar 2025 04:16:02 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-30ba5cccc19so16202541fa.1
 for <buildroot@buildroot.org>; Sun, 02 Mar 2025 20:16:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740975360; x=1741580160;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yUUb4H8Z38d7v/C8iJzUQcH7iVWCI6oJ2kpHW6Ir+kM=;
 b=EH9ZborXEO+6z+ZMmtGwZwaoOYZJYNQMy3QoAUsQ7A/5eYvHMIsZ1ulPkPmF3kYkyJ
 mp6EXGc2DHbKR05rR9suR9p3/BUmDDmb00PSM6IiGdeisKfGIs20dxA7CKr/MQ+GM/wB
 4kZko3jCzPGlSv8Xd6dtd6dPgmbQHA0QFoNDyo8oePoWAp/q5FPE4SJ1u5RfAI3xXg4X
 kjdiZ7mwzyTV6h/eSB/6d8TPkfMh7f7qZKkY8cQqUZkvMzzsm9m2CQ9AtFjkGW1vJdne
 8NwGTWiwA8MKMojGPZfxaFxKbQdvyCeKpGUhs4UOHXFTwdP+jfVZe+JQi+hbgL0LZJ+L
 WfvQ==
X-Gm-Message-State: AOJu0YxPDvrsNJVpH+Bj8W46iYkdZcl5ay+S9UN9o4RGiYMu+WTlwQ1C
 wCWYk2Mswxmsln+VhHx9c5TDlUWAwnU5b48kxrvhmuQmJeSBfJy4+acUsw==
X-Gm-Gg: ASbGncvgStehBVylmq0Ft+SLZ5mBbtV3sOz8nrQa10t0x9Gxr/gs4ldsNJwJzfZ6Xnf
 PrwORkFQW7JjpBVzM1Fyj43vES3fO/ZXzB0gVY5yVZhnEDJzus9y16Q6ezRNI0mpGslS81Jba6X
 +DIWwY0dKGmVrP4dUuvZto2UZ7xOJ8gJhylgeqzJmdry88VUsM+YCi+L4HM2SAEopYb7N1mnLpH
 Lo9pnV4RHV57fzk5ecHRkyQxi9tIhXDuhcN2Ty3Svh2VvOptbaxZkoHfDAyfTUglwRHPd/kUFUp
 Jyipl+XZ7kQkaQ406Wx2D9Y=
X-Google-Smtp-Source: AGHT+IFKtQcXUMzAmxtb6xB8moGDUWf53JM+8mJHVf9rrcs4B2O0Tg2tgYLZISHpbGNDU9u2nF7Qxg==
X-Received: by 2002:a05:6512:158f:b0:545:6ee:8396 with SMTP id
 2adb3069b0e04-5494c11b5f0mr3738410e87.13.1740975359965; 
 Sun, 02 Mar 2025 20:15:59 -0800 (PST)
Received: from gimli.lan ([2001:9b0:214:3500::e19])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5495c30df33sm506898e87.128.2025.03.02.20.15.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Mar 2025 20:15:58 -0800 (PST)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Cc: Joachim Wiberg <troglobit@gmail.com>
Date: Mon,  3 Mar 2025 05:15:50 +0100
Message-ID: <20250303041551.3968139-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Organization: Wires
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740975360; x=1741580160; darn=buildroot.org;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yUUb4H8Z38d7v/C8iJzUQcH7iVWCI6oJ2kpHW6Ir+kM=;
 b=cADEkvwWXckquDHKRHuA9gGp+kUMWfl4srEm9uXwB8Fy5ofVJkar3dIW8uHmZpWvOg
 jxD8Y5An9yzJm3LMtpMY4w7TnlQPRiJ2vlqbU0Xs2yGui+ZjnsjDsZcGIVilBoD2jlVB
 iohpHoOQsP0j3MQ5wAiFIAo6h3OWR4QwJ03PL4D9ZwoWUdcMUnjad8rwNBapFMpz0y93
 tHzmKZtSsrOMM31A+9/7iqB+JSUg2jDHWKo6G7lzeMwnZi0MRQ/z4S1vi88jC61zXIYh
 FNM/QWbhx3ZSak+45J12uUIUEa0mifCqLg1xhdB66H2s9emrYc2ufWCtGM9MJRimtvrv
 cbxw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=cADEkvwW
Subject: [Buildroot] [PATCH 0/1] package/sysklogd: bump to v2.7.1
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

Hello everyone!

Minor bugfix release of sysklogd, possibly interesting also for 2025.02
due to the hostname filtering bug in v2.7.0.

Best regards
 /Joachim

 package/sysklogd/sysklogd.hash | 4 ++--
 package/sysklogd/sysklogd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
