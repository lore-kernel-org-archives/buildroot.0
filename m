Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A34B8C83F22
	for <buildroot@archiver.kernel.org>; Wed, 16 Jul 2025 13:17:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F8AE607BA;
	Wed, 16 Jul 2025 13:17:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LMou8xNh5FLw; Wed, 16 Jul 2025 13:17:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A93760B2E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A93760B2E;
	Wed, 16 Jul 2025 13:17:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 92A0211AA
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 13:17:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 83A8283DD6
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 13:17:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9SmJGKnYYOkd for <buildroot@buildroot.org>;
 Wed, 16 Jul 2025 13:17:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=gero.schwaericke@sevenlab.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2619B83DD2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2619B83DD2
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2619B83DD2
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 13:17:16 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-ae0dad3a179so1102484266b.1
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 06:17:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752671835; x=1753276635;
 h=from:to:cc:subject:message-id:date:content-transfer-encoding
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FHPJiQaNy2FtGvZkCEJ9Eg3Ri7cG4IueuA03PCZzuFc=;
 b=oxu9RaeF95WQpQGjNOi/KduhpOvlXcciNcgLzRrVKSZ1hAsijKQN3PlmZ+VIP4CPfs
 zFUnCaYkZXJ+dDIEazfWvIU3SKetcAmpNkzgGUw35sOUKk4jZdlOrOS+rPJRxsVzejjH
 ht4MbHt6r4XmsWCrGR85JHA5g+ul8s7LdQ/oCubqUkzybxja++Qxn6dizcfoaWtTtEEr
 a+8lsk+wMqHn2o9tkXoL7y6KbAIqY71zBjfGicwumDtOgrE6XN7gCvDU0bZVIJXHY7Mv
 KTfIytDLQFAWgY3JF1+z6UdTx9JOwhEN+Db4ZriPXWISECHuI6MYa/YjHFd5zc29UHu3
 qCNQ==
X-Gm-Message-State: AOJu0YwK6fs1+mU5CWW74xNEvzhDqLx8Pv1HwUVwxhIXUuFao0ioxMaL
 SH8LjapCq5YY3SZwmZC0K3ngXKGRotNXf3dT5Qg6gRZr7fGibhSFVZGR9qhzvIunDd/AElg8UfB
 b6nE9
X-Gm-Gg: ASbGncu47O5XdxcYqJgKZjdVkIXJ1fxs2yshv9xRx+38oZgvkVVbaUnj4+3C8sb80nR
 VPY1TdudJfzz0P65s4u6e8HLeZBoWH7ZO6i8iicocIes8yLb2cTRcwR2dZvVk8Q+/TdsXMKTa7Y
 tV4oym34tbRTMNNNQLqJCuqht2Nw8i/g4jufjf8k0+3WsmnynZcFgRxuWPsYAvgQ3m8kzHe40E8
 jt+P0cnjaDUV4WouA+smrYHUjphafTogiB9Nj2xGx6Xe+lSP6AFu3I3Xh/WIvg4ii1fKWB3jSZY
 FYvjpvq4ONgDB707nXXENUqkwnFc1zD3tPG/Rl/1mwHzM5Vyt/IEMSarcq7CMwUhOwO/t0q2cNz
 khLxD1ORbACDMy5X+yhfB2kT9ShNl2KXWEp8=
X-Google-Smtp-Source: AGHT+IHqvKKhf/13OWJCWI52HNFpRXNRBaCJKEb58M2sMI6QASAdxwBLog4InMYCenc1NeAjATdCjQ==
X-Received: by 2002:a17:907:f1ca:b0:ade:1863:6ff2 with SMTP id
 a640c23a62f3a-ae9c9b814d8mr306144366b.52.1752671834584; 
 Wed, 16 Jul 2025 06:17:14 -0700 (PDT)
Received: from localhost ([2a02:8109:8a91:de00:4226:6562:cd55:1257])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-611d8d54112sm7865914a12.1.2025.07.16.06.17.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jul 2025 06:17:14 -0700 (PDT)
Mime-Version: 1.0
Date: Wed, 16 Jul 2025 15:17:14 +0200
Message-Id: <DBDIB94NTTBS.3LVPF0F3PQ86M@sevenlab.de>
Cc: <yann.morin.1998@free.fr>
To: <buildroot@buildroot.org>
From: =?utf-8?q?Gero_Schw=C3=A4ricke?= <gero.schwaericke@sevenlab.de>
X-Mailer: aerc 0.20.1-26-gcbffbc9ac803
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sevenlab-de.20230601.gappssmtp.com; s=20230601; t=1752671835; x=1753276635;
 darn=buildroot.org; 
 h=from:to:cc:subject:message-id:date:content-transfer-encoding
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=FHPJiQaNy2FtGvZkCEJ9Eg3Ri7cG4IueuA03PCZzuFc=;
 b=n44FAbmes6sCdSrLg1ZGK6kl6Ap/zBixypuaUXHBE9ykZYy4GXijrn0Mk2Ax6a+s8V
 gM5zjyVi0kIDQQJ8cZnMVBVCnptQqcxdSWXi0G2Mp/jibWAGIzipVWfYr1LqQvbNd5gw
 9XqdTDlJhvFCu5aQ1JwdhJbgQP2/Z5xIaqCNvdiMpFSzaMvIdVHR4/YeuTs2N8qLZoIX
 K2TksgDEdZdYIK4oSGEsr4kB4feU6lNFzimHrG2rC7PftJeyDHWFqwyJ6Eox92kZL+xk
 A96Xvt4u4qhUBrWliiovFqld1naMZTZGYZobJSomMdVSm5MnJnz7yky1IigH1RDQWgUs
 ONjw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=sevenlab.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=sevenlab-de.20230601.gappssmtp.com
 header.i=@sevenlab-de.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=n44FAbme
Subject: [Buildroot] fs/ubi: UBI/UBIFS option sharing
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

Hi,

I stumbled upon the following inconsistency regarding UBI/UBIFS:

fs/ubi/ubi.mk uses the option BR2_TARGET_ROOTFS_UBIFS_MINIOSIZE from
fs/ubifs/Config.in. This assumes that if you're building a UBI image,
you are also building a ubifs rootfs. That's not always the case. I
stumbled upon this when building a ubi image with a squashfs rootfs.

There are:

- PEBSIZE   (in ubi)
- SUBSIZE   (in ubi)
- MINIOSIZE (in ubifs)
- LEBSIZE   (in ubifs)

PEBSIZE, SUBSIZE, MINIOSIZE are all inputs from the flash layout.
LEBSIZE is based on these inputs and is the block size for all FS that
need to fit into the UBI image (rootfs or not).

I think this is a leftover from the migration from a combined
ubifs-in-ubi-image approach to the separate ubi and ubifs filesystems in

  9fc21664e8 (fs/ubifs: spin-off ubi to be its own filesystem, 2017-12-28)

Currently we're just building the ubifs rootfs und don't use. It's not a
huge deal, it clutters the config a little and takes a few seconds
longer to build.

I wonder what a better solution could look like. Here are some ideas:

1. Move MINIOSIZE and LEBSIZE to ubi/Config.in.
2. Create a NAND support option in fs/Config.in with the NAND parameters
   that ubi and ubifs can depend on.
3. Remove fs/ubi entirely and use ubinize like genimage.

Granted, any of these would require all users of fs/ubi and/or fs/ubifs
to do a major migration. So maybe option 4. leave everything as is? :)

Any thoughts on this?

Best,
Gero
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
