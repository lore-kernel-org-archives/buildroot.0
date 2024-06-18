Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF6B3C2BA15
	for <buildroot@archiver.kernel.org>; Tue, 18 Jun 2024 20:12:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BD0C42A91;
	Tue, 18 Jun 2024 20:12:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xpxaTgHHHxNp; Tue, 18 Jun 2024 20:12:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 330D8416A2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 330D8416A2;
	Tue, 18 Jun 2024 20:12:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B77BE1BF4DD
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 20:12:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A448E400AC
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 20:12:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sTz9SXSqJtTg for <buildroot@lists.busybox.net>;
 Tue, 18 Jun 2024 20:12:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 403E640021
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 403E640021
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 403E640021
 for <buildroot@buildroot.org>; Tue, 18 Jun 2024 20:12:21 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3632a6437d7so108396f8f.0
 for <buildroot@buildroot.org>; Tue, 18 Jun 2024 13:12:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718741538; x=1719346338;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WmBxixDLoShEkvdboNAedh2Pevo4BpwsvhA0Gke+cMY=;
 b=XxKTEcxIT2x85sAAyV90tPrvnMUpk5QPaKY6syHELMdaShf9QZ/Js/4YaUCJkX9S8V
 wRJhmSrkGbMZkMrRuVXIynxdjdZYJqzTjZlEGDKdt6RWh384YYN5UQccewpBDIaJskHL
 BkreFp7j2Aj+tum8+4NzZHasRJHQIwMNm/WQ56rl3aT0TwRqeuXIof0MVqbXhZp/T7rG
 6oqaKqpLy2EYTgmCFW07RPf6sFL5wNybnCtdRIwmSAeRK6eKscPG5StZ4j+p8twrOaLQ
 wruZi7KUl11DWslVi5XPY55hzONfG7a0L/zQ4pCqt1Q513rN3yTBGboi7bwYcY2cdW1r
 Ac4g==
X-Gm-Message-State: AOJu0YzL4rRRIohA88AP+gilS2+CtYhT3/SMw+7LRqSOqPBKrjKBxL60
 APGUsJzbx1BtvDM7y9nOD17s38/q2qxwA7p4SBExYjy3GJq/7FS+8lqp+Q==
X-Google-Smtp-Source: AGHT+IELAnYD40ZNy4p4MXshuo1ggqpPJ17DFCHzGCDObavEzu3b+y6Ij/65t6exOj4Tq5DudRccDg==
X-Received: by 2002:adf:f20f:0:b0:360:70e3:ef2b with SMTP id
 ffacd0b85a97d-36301358babmr795607f8f.26.1718741537917; 
 Tue, 18 Jun 2024 13:12:17 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-362a5ff6085sm1403141f8f.106.2024.06.18.13.12.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 13:12:17 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 18 Jun 2024 22:12:16 +0200
Message-ID: <20240618201216.2538433-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718741538; x=1719346338; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=WmBxixDLoShEkvdboNAedh2Pevo4BpwsvhA0Gke+cMY=;
 b=dmfN6m6vczXFJWKbZ2lK6JJsdmG17fm6rkU2+0H4kbu5qjXQXsi7Ib3TnEms768H1v
 zVJgDOQXf8DcEefn+PGrY3AjlGCxB7udZdAG5aKW9fEIotw59FBWDiFkk0quaIV8Uu2R
 SIiyRuYoG3eR8hoOtwTzN8KQufDhINT4eQqy18/uqaMX06Apxb7U9bEEpLC7hji3J/p6
 TefM2nmiZp5wkgvZpD4263MJFCZ/z2svCuinxPyIsCi7mG14XowHZKs+24hyZ1dLGpDa
 yIe4/W5MK9aNH5oFI399CXrakGbLp3e4iROCX3LD+HFs67u5i6M+dI3/4n0ME3LtGe+L
 KRYA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=dmfN6m6v
Subject: [Buildroot] [PATCH] package/go-bootstrap-stage3: move missing patch
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
Cc: Romain Naour <romain.naour@smile.fr>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The patch was added in commit 25991c843c3f (package/go-bootstrap-stage3:
fix go-bootstrap when parent dir contains invalid .git). Then all the
go-compiler packages were moved to a common sub-directory, in commit
0290c543dec8 (package/go: new subdirectory for go variants).

However, the patch for commit 0290c543dec8 was sent to the mailing list
before 25991c843c3f was applied, so it could not have moved a fiel that
was only added later.

Move that file, now.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Perale <thomas.perale@mind.be>
Cc: Romain Naour <romain.naour@smile.fr>
---
 ...001-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename package/{ => go}/go-bootstrap-stage3/0001-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch (100%)

diff --git a/package/go-bootstrap-stage3/0001-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch b/package/go/go-bootstrap-stage3/0001-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch
similarity index 100%
rename from package/go-bootstrap-stage3/0001-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch
rename to package/go/go-bootstrap-stage3/0001-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
