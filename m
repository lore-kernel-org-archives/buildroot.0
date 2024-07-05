Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71B02C30658
	for <buildroot@archiver.kernel.org>; Fri,  5 Jul 2024 06:09:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 222CE80BC3;
	Fri,  5 Jul 2024 06:09:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RmkVf0qTP1oK; Fri,  5 Jul 2024 06:09:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3673380BD6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3673380BD6;
	Fri,  5 Jul 2024 06:09:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 73B261BF215
 for <buildroot@lists.busybox.net>; Fri,  5 Jul 2024 06:09:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5F91580BC0
 for <buildroot@lists.busybox.net>; Fri,  5 Jul 2024 06:09:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gFzqYbyslbrD for <buildroot@lists.busybox.net>;
 Fri,  5 Jul 2024 06:09:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22f; helo=mail-lj1-x22f.google.com;
 envelope-from=troglobit@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2A68780BBA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A68780BBA
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2A68780BBA
 for <buildroot@buildroot.org>; Fri,  5 Jul 2024 06:09:24 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2eaa89464a3so13155401fa.3
 for <buildroot@buildroot.org>; Thu, 04 Jul 2024 23:09:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720159761; x=1720764561;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4CGcv7dApMHWQqMdjN/jkbbozO27Vj5Z+8U7pgGrdqY=;
 b=LT8S5EkS8c2zxwBhV6NDTBiZ22Ux/sriD4V2S7Cz0nkZ2YwQYUqrjaRkE+07B3tf2N
 cFWsXmdPbWqD6J0i2PM/3fWXn112wZacBShjaHzA/VXIrYzCm6VrI0lihK6NHL/U7G6p
 /Z5hIFsANlxOw99iTbtCWEkAKGSUOxKtU6n8fADQdt1Kps5mijJb5uUVglLsvGy3iYMx
 GItpQnFcSrLVEk5ryxi5TocAUB1rm+3Iqo9V46FAlNe/6gNYmJioJ07f6oeTfiTIXcdS
 gv8M1JL/Z2ZruR4lf8zmMl6sLwkaH6A1mVt3ztT6eMWm+OZD9q0uE1073aPTturQZJlt
 85hQ==
X-Gm-Message-State: AOJu0YwBUhFzzx2BiocujgUpk108UVu/17KJyVvDonyp40zk/Puv0FKk
 Kn2U7F6xwa/g0HXRYEAP0fmWS//syyuAYzkgLkjeAL5HSm4RUlQHGBqhjS4x
X-Google-Smtp-Source: AGHT+IEN7w0xKc/YP7DA3NpFqJZlRSYGHskbrCMwr+7UO/WhXrcDz12qP698RBjlmWFKgAVshBZqpA==
X-Received: by 2002:a2e:8615:0:b0:2ee:8905:769c with SMTP id
 38308e7fff4ca-2ee8eda3127mr24018681fa.28.1720159761138; 
 Thu, 04 Jul 2024 23:09:21 -0700 (PDT)
Received: from gimli.lan ([2001:9b0:214:3500::e19])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ee789563c4sm10114351fa.81.2024.07.04.23.09.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jul 2024 23:09:20 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  5 Jul 2024 08:09:04 +0200
Message-Id: <20240705060905.3670541-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720159761; x=1720764561; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4CGcv7dApMHWQqMdjN/jkbbozO27Vj5Z+8U7pgGrdqY=;
 b=nk2GVp1xF99wNBAT6DQ4DXEy0MsrMFx9eI3v80jsxW1Jd7UgjNNkkgrIjFs0XzvRyG
 7n0qBRHh7+dj5WtJz9xT8jUnz/NeW0H2pnwWgc3h1OtyDtd7+/PMPPwSURDFp4WdDFsO
 GWP9Yoae4YPvRqf3YKf0Hn3b8Xv+ZJNCsdNZwN+ehkJaH2ldwp9565NPFSvCai9MrLcW
 p5Kj4s7aSI7Ol5eXoFctUog3k/7qe5og0rC9hFVuAeFd51hC9Lcuixz99YTJ1d0NtyUA
 v3x53dlWZqJbCUxdC5PacskApbCkeLS3stKU/E0RHvH36K1AyCjfD6iAkI01YY/z3HxN
 YC/A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=nk2GVp1x
Subject: [Buildroot] [PATCH 0/1] package/openssh: LTS fix for CVE-2024-6387
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Joachim Wiberg <troglobit@gmail.com>,
 Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

this patch is intended for 2024.02.x, and may apply to earlier versions
of Buildroot as well.

For a background, see the mailing list discussion at [1].

Best regards
 /Joachim

[1] https://lore.kernel.org/buildroot/b335fcb8-5ea2-4ca9-9bf8-a5d62caab290@mind.be/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
