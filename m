Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A44CCD4F3D
	for <buildroot@archiver.kernel.org>; Tue, 12 May 2026 22:05:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC08741139;
	Tue, 12 May 2026 22:05:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7qhI30to2IRY; Tue, 12 May 2026 22:05:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C04E34112E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778623499;
	bh=CHc8gi60jeww51H4WkVe2D1myrszMPa7CJJocGZ8ZBs=;
	h=From:Date:References:In-Reply-To:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rSX0quEbPbSBzFndd5Mu0EBgPhQhBAh6XG/64jsukxcPh5G+75/4CwxFw5nxbPV+R
	 jd/E8hSx4m8MyY7KeqgtCrNqShhxD3LMKYjWScYEYgmyEg5smprlcQi/Ri4bSb0o/K
	 Ib9XDkPR/5FVqFxF7+1OY8kyZOQbktkpNnwIdZ6NElxeiK28v/dw8oOME9MXevrJKb
	 +3s7TzTdQC/bBPBkxIfs5wyJmy0prURpX0niWM686mZeV9qN5iOyCgv9rsJb/Zfuco
	 ob1ejx2qLOuHrTFZFFN10gkLCNNsIdTYN7mnn8vHi4yyKGhMaH1wexOMuC1GOiZWQh
	 WiDiG9qrKgPWw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C04E34112E;
	Tue, 12 May 2026 22:04:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E47C9270
 for <buildroot@buildroot.org>; Tue, 12 May 2026 22:04:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CA8AA60EB2
 for <buildroot@buildroot.org>; Tue, 12 May 2026 22:04:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zg9GfGiALFhI for <buildroot@buildroot.org>;
 Tue, 12 May 2026 22:04:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com;
 envelope-from=joseph@anodize.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D108860E7C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D108860E7C
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D108860E7C
 for <buildroot@buildroot.org>; Tue, 12 May 2026 22:04:52 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-837b39eb078so4120281b3a.2
 for <buildroot@buildroot.org>; Tue, 12 May 2026 15:04:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778623492; x=1779228292;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=q0HXbLorFouxR0d2H2StIJ7RbARRlXhKi5mAkjEbOqY=;
 b=NwXWYNTLnZ4BTaMDE82NWXVecIOxkYQa1ymDybfsrr4wcettwsQQVII6j/FZ/z8TnC
 TbsGEyRgRz6YsEHXZcOWRMqYcNLUEqBsF7l/1NdQqf4C1VAu9/LylOovHHsR8r7z4Pj7
 DIp8/cc55yi57LZico1vwP8yqwn/69XMkIXN4JgfMtpXaCp9kT/mzj9qyYIpjxIrHQJd
 FbuIQq8SfqaB7/6mpjnUw+/IHt3LmukmT0MN+b3DOJGH8CMOLjeEDdbFmKLOWF3Dz3jj
 tyQ8xbinO7sJvZLkOoWJu7U0u/UEvEJTfGcaiEOSudQk6Rmp6luBli4O3/4NRYEeSoZp
 lJcw==
X-Gm-Message-State: AOJu0Yy+4mzjBHSFS7b5GEwTdFv0gCCQoNeZMypSiXqApIsBrENXdJ7p
 SAzzX0qKClVLteLNaskGHe2MmOgb/rH8TM8stUGeTWjMTsK/0LqjftFYeNYJib7YGqI=
X-Gm-Gg: Acq92OGA8E1gFVLj9tAHeP/5/69VCQnxhO8qtnJZlsVoL6yaVh0kZwHVlYaTJ4zlN9q
 yfXQNnPiBx/SpGqoQuzxIb4DqZnBUb0QGOvSiZaqzIr2nurYVXdHk7Tm+QktexrL9D76Dv2Avu+
 Eu7E8mFhR/GkTgPphT0K6lP+NOmMRsAtgIEtR7WhD7QwL46utdTOPG1qMFevzEbFK5tIm2GAuoE
 lrvDo2oFQgDBKa2bfVkSqTp2Sfm9Yueo6XAWX8v09FNCiZVlUwhm4lXyf/vxcJvrHrFx+jmW/A+
 2FgKjvGlyNRUkUxbhdS3hBfjux1ScIMdI6Id81u8RyutpTCnuPSfsdyxO+q1t7vAbspfqbHOH9r
 c1cmmjFSUApPPFxWfjbBatRc4bbp8xV1IAG2iX27u11Ra0EWAQ0E6f5MRLvqwIjpxcnHhzpixOw
 fkjYururhqqqPYZdxlrog=
X-Received: by 2002:a05:6a00:4650:b0:83e:d52c:e6bd with SMTP id
 d2e1a72fcca58-83f042b7396mr485294b3a.38.1778623492038; 
 Tue, 12 May 2026 15:04:52 -0700 (PDT)
Received: from wash-3.local ([50.120.90.9]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-839685a8125sm24388390b3a.61.2026.05.12.15.04.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2026 15:04:51 -0700 (PDT)
From: Joseph Kogut <joseph@anodize.com>
Date: Tue, 12 May 2026 15:04:47 -0700
MIME-Version: 1.0
Message-Id: <20260512-mesa3d-amdgpu-virtio-v2-4-30678b797df9@anodize.com>
References: <20260512-mesa3d-amdgpu-virtio-v2-0-30678b797df9@anodize.com>
In-Reply-To: <20260512-mesa3d-amdgpu-virtio-v2-0-30678b797df9@anodize.com>
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, Joseph Kogut <joseph.kogut@gmail.com>, 
 Romain Naour <romain.naour@gmail.com>, Joseph Kogut <joseph@anodize.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778623489; l=539;
 i=joseph@anodize.com; s=20251022; h=from:subject:message-id;
 bh=5vlZ61Mj1k4NrA+fVxJsCt7A9IE+TYKhdBgPkRlZbZU=;
 b=L9o3kujH3vD0c4ZrWn5PsPWKnOyAGICGr5LQwRxCF+JGwdFWB//yecdcfzEdgLWX8kfI9HGi0
 tI61ypNCj/0Bggo67AnmnpMsfxSjnye3rEicf0oa7ADnTrlddQrOnuU
X-Developer-Key: i=joseph@anodize.com; a=ed25519;
 pk=pkWqHIjgowoQ51cQZTl6aTwJnXIFThap40f4w8cEsxw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anodize.com; s=google; t=1778623492; x=1779228292; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=q0HXbLorFouxR0d2H2StIJ7RbARRlXhKi5mAkjEbOqY=;
 b=MlSphTFYRU4P16vIAzIiGpfARUkLvVKApTNGSmffxdW9uT2OJltx1cpFysix8rbGcK
 1e9PGYLGFunqRUYHzLSN5TFq/V4IqEUJYpueCqhM07dlTFy6RpF7HSuNFjdRFV4mhjD+
 5Ae0EYxXeN6RV4mGV764Wa+rJsedDAnyiL7ROHr3F75Y97MlRGGqZ7duCflAJy3p9she
 bHToe0oP0/ldHdG5H3ZTZmGlY+c5WbY5Jq3dFzGsqiA5CULPGe5oNtvdDnFNqNHEZpv1
 9f6ypMNIk1dINounPqywNn3E7sxtDLJ4jDzmwMMdUT9Oas+xdNGTMntV5RBvs7J276xT
 IfPQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=anodize.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=anodize.com header.i=@anodize.com
 header.a=rsa-sha256 header.s=google header.b=MlSphTFY
Subject: [Buildroot] [PATCH v2 4/4] DEVELOPERS: add package/mesa3d for
 Joseph Kogut
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

From: Joseph Kogut <joseph.kogut@gmail.com>

Add mesa3d package to the list of files I maintain.

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index d849fa828a..25a047cb3e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1754,6 +1754,7 @@ F:	package/llama-cpp/
 F:	package/llvm-project/clang/
 F:	package/llvm-project/lld/
 F:	package/llvm-project/llvm/
+F:	package/mesa3d/
 F:	package/python-cython/
 F:	package/python-pycups/
 F:	package/python-raven/

-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
