Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8530E104891E
	for <buildroot@archiver.kernel.org>; Fri, 27 Feb 2026 23:14:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4DCE883C92;
	Fri, 27 Feb 2026 23:14:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VT1IFlEk4Xfw; Fri, 27 Feb 2026 23:14:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9376083C30
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772234066;
	bh=1N211Uio+73iYTlS5QPztirC+kPvUmaqWoNnRVYH1ZY=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=R5idt0cdLa2bznSTQ9plDbKZM3TP7Gt5UWVuKsZ/6g4g+2Ve81K95L7mntgciRLJ8
	 eOM5nnv5CZpAag8LqnALDLAQzK9fW6crQJMnkDyysS6tjgH2NfsfLZidabmBadiZzO
	 kxknCVbBWFG89GF+/m2aiCzTrMYRTiaDJz1AEGdlDDYU5wNtcMHnBuEsh3AxWDevx/
	 6xb7gab3SgnDOUBk+hvkagXPcvqQRZQk92SH5HLZvH8VdephfBkobyPvmgyZxHqCtp
	 LECadhOUGlen2dR9giiKIuu29kKBCegGD/SUOADvygxU00dEh3sgIZk/EACnQ+kydX
	 gQgNv/VZl/4/w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9376083C30;
	Fri, 27 Feb 2026 23:14:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 26D681F3
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 23:14:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0C29360E1D
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 23:14:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jyvax_974NFj for <buildroot@buildroot.org>;
 Fri, 27 Feb 2026 23:14:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com;
 envelope-from=joseph@anodize.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 15CD360E1C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15CD360E1C
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 15CD360E1C
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 23:14:23 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-2ad617d5b80so17097505ad.1
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 15:14:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772234062; x=1772838862;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pyat1yVI8ho5GHDX/cKMejKXgo0frhvzp6KT/xusC38=;
 b=wIpOqdPtr3cJQZMQz9fqvZxz0mMslEaTHqSdupjAPOf+4Dna6Gkk5njQ9NKUHjY9sQ
 /pU1fUpY34RynI7M1t08DsXCVIa8bQCygrqOEki4IS05cS0rWoIKax9BnbmoaI8XCDVc
 s3p+iRZNggjhWcvQJp/PSm3kJRLUnpgh+EL44/xS69r94+ca484lJlosG4DLFT9DiMRY
 4PDrElLu6l7xm6EFqqW5KrELfXvEKDybhFAMjCVOBr0qHOF5q30wyYHnmX0ymDE3UmWD
 jqPOgQRrF5khxJnULm+FjEC07wwnQvUi44bBCez3sQyDO57IqPZhLu8XTpw24ageM8XW
 a77Q==
X-Gm-Message-State: AOJu0YwYKdOmg3rLps5SCPu3RESanRhPyNIxZ252O462KhbD+AqLMxJD
 lZ55SsPH30f4r6hufS/fWtiJbbk2MuhQd3Yow6JlG1g0npvBUIuDIsGXkxdUp+kN86svfkMvTbj
 ukbnpLjY=
X-Gm-Gg: ATEYQzz1AfCzQOLOW+CscZ6RJwf6w4PmYYVZZJW3Ua1wYcZHRNR1GaLrvw+qw0utvX4
 118j4jkxAwNEebtaVp1CoXa4J7eBYf1mn5NfQjdo0XRhTibIR2ff8iLsLWQT8bXlzvSzYOC05KM
 3oiBZ4ris+iXmOlm9/8YQvBxVgCxR90Zu91Hwj4Te5HNITcFTAYuq19dhZNUXYX7PONcl9W8NiL
 qzpd0Sh8eM74YBUBH5xqeyePlWhYnNCyDkI3mi/gRv07zdeBSg40tDD73MzWRljU5bHzPxYARqh
 RIKFBLFJhaLeiUhGvwPR+dCCgEo9WYZnkejJIKgucS6BrLulcybmVxqjB/U35IOWGnkOnBlqEiJ
 Uq04IIgJjKnApdZm8P9jlcyqgXV8iiQMBgTSuc/Gk5gBXnZEysDHGwjfb5EaQsyWE/iX2qDMrrm
 8jv2KM92vv6gpmkz9/K7+dsba8SGQIczADyok=
X-Received: by 2002:a17:903:3c4b:b0:2aa:d630:cd5d with SMTP id
 d9443c01a7336-2ae2e4bb332mr42500975ad.44.1772234062486; 
 Fri, 27 Feb 2026 15:14:22 -0800 (PST)
Received: from wash.clouded-fir.ts.net ([50.120.91.49])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2adfb69fff3sm72007995ad.48.2026.02.27.15.14.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Feb 2026 15:14:21 -0800 (PST)
From: Joseph Kogut <joseph@anodize.com>
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, Romain Naour <romain.naour@gmail.com>,
 Joseph Kogut <joseph.kogut@gmail.com>, Adam Ford <aford173@gmail.com>,
 Steve deRosier <derosier@cal-sierra.com>, Joseph Kogut <joseph@anodize.com>
Date: Fri, 27 Feb 2026 15:14:04 -0800
Message-ID: <20260227-mesa3d-amdgpu-virtio-v1-0-3e6d10d4eaef@anodize.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Change-ID: 20260225-mesa3d-amdgpu-virtio-a5b4116ea08c
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anodize.com; s=google; t=1772234062; x=1772838862; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pyat1yVI8ho5GHDX/cKMejKXgo0frhvzp6KT/xusC38=;
 b=G11MJnj+rB2bB7ZiMLWE7pJ4ql+gwuPnjXOFY7E899XkQYZDm0hg2Oe4F2rqiqmWlK
 eNAnwMS0xVo1o+5hz8oHhyYs1hC5pXha4xuyeCgpaAKG9J80jNv7rg3yQASM9CHx3T1L
 GjnyiyC9hvZFrcTn55lkEuXlKTu8wGN6Nt3Gp1wMy2UT3YN/DLP7zS1kyNKtBo7/Swil
 8b6s/xZEVfcLa0WPgMUM7t+uw9CKHUCJIUBITcj/kh71OD1E829KuV/I2eRmvaZZbu4b
 HbH+e7mx8eR3rl6fID8yJNIv9bP9z//FQotxRBTHv0VoXQCyOnjYuCYg7z7FXYYl434s
 7L5Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=anodize.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=anodize.com header.i=@anodize.com header.a=rsa-sha256
 header.s=google header.b=G11MJnj+
Subject: [Buildroot] [PATCH 0/4] package/mesa3d: add host native context
 configs
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

The first patch adds a config for mesa to enable the virtio backend for
amdgpu. The second patch enables the same feature for freedreno. The
third patch rounds out the freedreno API support by adding a config to
enable the vulkan driver (turnip), which can also be used with the
virtio backend.

This allows the mesa user-mode drivers that interface with the
amdgpu kernel-mode driver (radeonsi, RADV) and freedreno KMD (freedreno,
turnip) to do so inside virtualized guests over virtio-gpu, mediated by
virglrenderer on the host.

This combination, known as host native context [0], (sometimes referred
to as vDRM) is an alternative to VirGL/Venus for accelerated graphics
and compute in virtualized guests.

Host native context runs the UMD directly in guests. Compared to API
level virtualization through VirGL/Venus, host native context enables
lower overhead, more complete API support, better security, and
additional features like hardware accelerated video encode/decode.

VMMs that support host native context currently include libkrun [1]
based projects like muvm [2], and qemu with a patchset [3] that's
currently in review on the mailing list. Also, VMMs which support
rutabaga-gfx [4], including CrosVM and qemu (partial).

See this video [5] for a demonstration of libkrun/muvm with host native
context using the asahi UMD.

Upstream mesa recently also merged support for i915 and panfrost host
native context, which should be a part of v26.3. Those config options
can be added once they become available in a supported release.

See also the patches adding the virglrenderer package [6] to buildroot.

[0] https://www.collabora.com/news-and-blog/blog/2025/01/15/the-state-of-gfx-virtualization-using-virglrenderer/
[1] https://github.com/containers/libkrun
[2] https://github.com/AsahiLinux/muvm
[3] https://lore.kernel.org/qemu-devel/20260220001634.3579257-1-dmitry.osipenko@collabora.com/
[4] https://github.com/magma-gpu/rutabaga_gfx
[5] https://www.youtube.com/watch?v=xRNu0XaXTng
[6] https://lore.kernel.org/buildroot/20260219-virglrenderer-v3-0-e2ff1a23be3f@gmail.com/

Signed-off-by: Joseph Kogut <joseph@anodize.com>
---
Joseph Kogut (4):
      package/mesa3d: add amdgpu-virtio config
      package/mesa3d: add freedreno-virtio config
      package/mesa3d: add freedreno vulkan driver config
      DEVELOPERS: add package/mesa3d for Joseph Kogut

 DEVELOPERS               |  1 +
 package/mesa3d/Config.in | 39 +++++++++++++++++++++++++++++++++++++++
 package/mesa3d/mesa3d.mk | 17 +++++++++++++++++
 3 files changed, 57 insertions(+)
---
base-commit: 1cc6279d1144c0b61dc6051eb57ab8800931c96c
change-id: 20260225-mesa3d-amdgpu-virtio-a5b4116ea08c

Best regards,
-- 
Joseph Kogut <joseph@anodize.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
