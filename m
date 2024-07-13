Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A9F3C3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 05:42:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 89C5360A77;
	Sat, 13 Jul 2024 05:42:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8eW7y2pmlpfK; Sat, 13 Jul 2024 05:42:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 28963606B1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28963606B1;
	Sat, 13 Jul 2024 05:42:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 268581BF847
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 05:42:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 141E7606B1
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 05:42:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zfjqaHNIU4jJ for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 05:42:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12b; helo=mail-lf1-x12b.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 177C26064E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 177C26064E
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 177C26064E
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 05:42:30 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-52e97e5a84bso3845427e87.2
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 22:42:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720849348; x=1721454148;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=P35/kdXALj/uD30Bdq/CQfAgSqSAn3u/K7shahPZl0s=;
 b=aFPaU3DmuSClpQyFhD8Vnes8E9XsVtQ3RhmeetUFQhnL+vsaIttST4mQmkPE3FwWvd
 ib9HYwrTWb26nR9YmirjAZ/F2kGHS/iPgGHK0VFWqIN9/qr+j2YZY0XNe5Mq7/p8VJ/G
 AaqvsR/5jv89b4bjds0fauPraF/aOCm9yG4Oh1vtXI4xx6PvdWDX3oCG23kGhhkqdZJm
 IsS/lKrnaNwgl2dsuNCDSqAhfyYkf/Hu5Ke606qrniUI7u3Tn4fNqKPuAK/2ei82U07u
 TikUP0T97KC6/Yb7nThhe11ygtds3TBXjCahtLsTKryjKpG34PQq1rUlpsKhqI5+bD3/
 vL0A==
X-Gm-Message-State: AOJu0YyJL9cCUFTN3ywWof5FhD3bgymEvntWNXLP+OcovUZovzh+wYjK
 YAYOAAsq2dgUHxWEtmx5n3JzW51SpZCYbG3P6WRWr4/Xlyq4UxqsSeZSYg==
X-Google-Smtp-Source: AGHT+IHT1YNpMPiAvIAg+a90atxZGiyCqczYA4LlW9JOMHf60I36zWIgT/kMCb077AKy+J4lVDmUeQ==
X-Received: by 2002:a05:6512:39cc:b0:52e:96d7:2f38 with SMTP id
 2adb3069b0e04-52eb99d6840mr12833630e87.62.1720849347810; 
 Fri, 12 Jul 2024 22:42:27 -0700 (PDT)
Received: from hthiery.fritz.box ([95.91.160.230])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a79bc7f1e5asm19866666b.109.2024.07.12.22.42.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jul 2024 22:42:27 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 07:42:12 +0200
Message-Id: <20240713054213.228070-1-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720849348; x=1721454148; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=P35/kdXALj/uD30Bdq/CQfAgSqSAn3u/K7shahPZl0s=;
 b=GkFAps8hYHor20+PXJ8Wp5Y//U/EC5TfqyBnm3xF5MIRfdQPFoyN2cWa0MQfldzbP6
 Z78GJLG70oNP6tP0ohS472BSyV1E8dmwMOTsldq3cfbpkb/KCAM2/4hNeM0gzbo0KIZD
 jdTvhmaDOdJ42W0ssr1fqmCGrcg+pakjAmABKyiQ94PRFcHFhOn7chb2AgMHoSMLUkKn
 5ooUdHdIc7HSituef/fCI7XersPeUt63jonnhqGi1w9gx5fG7Dywz0hAxvPyHOT1YEVy
 vMzawQZz1jy+vcUMJIy5KUTGciHIUBYS82AjCDEoMFfVHVeecgEg8Zy77dy6WsvLJtl8
 ipCw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=GkFAps8h
Subject: [Buildroot] [PATCH 0/2] pkg-cmake CMAKE_ASM_COMPILER override
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>, Daniel Lang <dalang@gmx.at>,
 Samuel Martin <s.martin49@gmail.com>, Romain Naour <romain.naour@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

While I was adding a new host package (blake3) I got an error
with the selection of the ASM compiler. The error could be fixed
by using -DCMAKE_ASM_COMPILER="$(CMAKE_HOST_C_COMPILER). During
the review it was noticed that the value DCMAKE_ASM_COMPILER was
incorrectly set in the pkg-cmake infra. After this was fixed,
the workaround for this could be removed in the blake3 package.

This workaround is also present in the llvm package and now
can also be removed.

Heiko Thiery (2):
  package/pkg-cmake: remove override of CMAKE_ASM_COMPILER
  package/llvm-project/llvm: remove overriding the ASM compiler

 package/llvm-project/llvm/llvm.mk | 6 +++---
 package/pkg-cmake.mk              | 1 -
 2 files changed, 3 insertions(+), 4 deletions(-)

-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
