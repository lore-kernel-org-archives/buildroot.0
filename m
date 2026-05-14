Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59FDDCD4F3D
	for <buildroot@archiver.kernel.org>; Thu, 14 May 2026 21:43:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 141F382B97;
	Thu, 14 May 2026 21:43:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jIn0_mUKclWP; Thu, 14 May 2026 21:43:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2217B82BE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778795036;
	bh=2CxcHpWHbmyYRS5y10NISjpqMJpwIFPHLIjPqVveAH8=;
	h=From:Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=n0ebCygYKJjvT/IauZ/LrXlUPgNq4miZZOmMKCsYhn8SP3MpNbhI9hdNcWlozVZ+h
	 RU90PLOHtmvCUhfIO17rY+aZN0ZqHoPS1QMiyBW1B0/7Z6miDOKJexjBdsUcwkQpPR
	 LBa06gRKcTv1EHXRtC3wODRKQPktCQDSBtPCfh7bTfl34YzWBmFaRG5NtZED6vUW7S
	 HSZ/ZJ/TEzNoPchy4SraIJuTFGM8mmyiR/rMD9kdAWJVXim5a4pwH+fKzgV3YyReS5
	 1VyjRePIizlSO8LHxGQnwuSvoe0TofXHa0PR+COHeC1wASq3gmkvjS50UghyUgGaK7
	 AMnFkc8tsyOOw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2217B82BE5;
	Thu, 14 May 2026 21:43:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A64637F
 for <buildroot@buildroot.org>; Thu, 14 May 2026 21:43:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1026782BE5
 for <buildroot@buildroot.org>; Thu, 14 May 2026 21:43:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RhumZqQr8wxJ for <buildroot@buildroot.org>;
 Thu, 14 May 2026 21:43:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com;
 envelope-from=joseph@anodize.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3091D82B97
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3091D82B97
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3091D82B97
 for <buildroot@buildroot.org>; Thu, 14 May 2026 21:43:54 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-2b458ca2296so57827085ad.0
 for <buildroot@buildroot.org>; Thu, 14 May 2026 14:43:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778795033; x=1779399833;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g2i5cCY8/d2YajR6k1QMj5enBDf1NFG+fQsfYj2SI50=;
 b=FClKy8FF1YvQQkem4U6D1Vsvaqg0pJH5DhbW4/bHhWUDa5YgaOOOLZDggnMecnnI9s
 qY/ZamhANn4PDhxfMyFz7s+CT18M1EnZrAJPqVI1Nte30SWb4/mx5DQCEs+hQXQtaHIS
 w0mjXvuKJF0bjYAl9h2ubPGFlKsCxcThwOiZj3cDd6qfh955xErF+IymgI1M/6TDB/qk
 Z2/StOuW/FEVaGIkB4isFgwF3Fcl/erDw/GBzv+73Yax0Om9dJyUYsGc1Vm95LuIHeX4
 FK3wecAjoT0yBJS6PqMd4h/yS9NOG+r+db2sRNA+SmOvJTLk7sMuRFfyZ1yneE6X+dg5
 7+NA==
X-Gm-Message-State: AOJu0YyckrJC9SxOSfOMukHhbI2dRR/Gedhup3wSNUNO5TAGGaOg5TYo
 CH3X09HCv7j/MQxXJzj+1hp+gtOBpJtRpPYCKt75eJjL0/gzeH48KHm0EuF4yK2GIoQ=
X-Gm-Gg: Acq92OFg+Qem9KdwxZ0ZiDLw9Xk1xhwpHO5Zyu8hYzWkieS8weberdTpzLIWKy+O/Ah
 QPay1+CVHR+Bvropsv8XtFSKRzdgZENp1w7kvBgKn65GAeBT5+OazykJMa9Gnun5Kf/L3bK6uPz
 HWP3PLlQPVs/HgpvFO/1pkBrSbAx8sKtZcaFcRehuAL+lYsIJ/yQEj/FUSJSvF7yG9B1ky2J5W1
 +ASkG6ss2E+xjd5qLhmJkfLEi2grfBS2KrpWB/c7AKfP3CyMEKA8d30ZhD9pDDyX3OTv4p4rb+e
 UPZTC5dAYDFzDm9mdM45DVSdwUUAiX15zHm0+4IhqcNtQDIv13qfT26vyd/JSjhAcR2HLSXxm1o
 C1wSyHHs7Vpus+vnDgOcXmhTqrArFo/aqroXqxcTjl1S6CKvW8zDII/Uj+T/QIcaldVkNpGUSR4
 qkuhCeT/pMrh7Wcg6HCzciSBO+MuDGrQ==
X-Received: by 2002:a17:902:b085:b0:2b9:86ca:5bf2 with SMTP id
 d9443c01a7336-2bd7e94c757mr8822745ad.30.1778795033250; 
 Thu, 14 May 2026 14:43:53 -0700 (PDT)
Received: from wash-3.local ([50.120.90.9]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2bd5c05f287sm49907305ad.24.2026.05.14.14.43.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2026 14:43:52 -0700 (PDT)
From: Joseph Kogut <joseph@anodize.com>
Date: Thu, 14 May 2026 14:43:36 -0700
Message-Id: <20260514-mesa3d-amdgpu-virtio-v3-0-dd75eca7fa50@anodize.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WPwWrDMAyGX6X4PBdbSeOlp75H6UGJlUYDx0V2z
 baSd1/cHcZgsOOHpO/X/1CJhCmp4+6hhAonjssGzctOjTMuV9LsN1ZgoDMHCzpQwsZrDP56u+v
 Ckjlq8L11aBvXQqu205vQxO9P7fnyzek+vNGYq6tuTBKDzrMQ/ugB3N/6YrXRDXXeGt8S0nTCJ
 Xr+pP0YQ7UNmEgPgss4V1vAlEnqYOaUo3w86xWo7/zTpECNMp17HVzv/NT/irqs6/oFzjIl/TM
 BAAA=
X-Change-ID: 20260512-mesa3d-amdgpu-virtio-2d917a137424
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, Joseph Kogut <joseph.kogut@gmail.com>, 
 Romain Naour <romain.naour@gmail.com>, Joseph Kogut <joseph@anodize.com>, 
 Romain Naour <romain.naour@smile.fr>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778795031; l=3944;
 i=joseph@anodize.com; s=20251022; h=from:subject:message-id;
 bh=mRi/RhRlG0Y3sh4hR0sqcIPRjo5x/jFCVqMTkoOLQ6M=;
 b=IMRSJyKZloflCJLLzMWxk4TKC0GCZX3+azAJpge2SqmgpeX53LSunWJ7NYCiRhQGB0j01natJ
 sqD8msR2Q87BtwqmW7R0AQ33dQd1mROU++baagpvjd/mzH5DOBsc6ko
X-Developer-Key: i=joseph@anodize.com; a=ed25519;
 pk=pkWqHIjgowoQ51cQZTl6aTwJnXIFThap40f4w8cEsxw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anodize.com; s=google; t=1778795033; x=1779399833; darn=buildroot.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=g2i5cCY8/d2YajR6k1QMj5enBDf1NFG+fQsfYj2SI50=;
 b=Ig98JlZkUlkuYYRGQbjPC6F5b5iDahQYdXbdvKuGgWyzwvWSnHFSAUZaR2Ph57W5Kq
 8fSaF21MZEyYANinDhLBRDgIwwJv9ng+qqBds+U1dnDigekAKmpjabdy3RVFv1d7Dyqk
 b3MI1C6DNKak3iLtfTAYXbQ3m108OUpcOmPb3fXvTgaNS0nuWhfOPAcOCHuGcNYCGa1U
 x36Rgn9TS1OLBd9cwLAXh6LuLEUkcf5sjoqzMppUEaACPcUxVCWSshqNY5EKHEvaeqEF
 eH7dI5TfLcw4X6NTHDS+A9OR+PoDg+VT4wijDUeWeOZaiCGhPI1bQt92KNNxlMvehjgV
 SzAw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=anodize.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=anodize.com header.i=@anodize.com header.a=rsa-sha256
 header.s=google header.b=Ig98JlZk
Subject: [Buildroot] [PATCH v3 0/4] package/mesa3d: add host native context
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
based projects like muvm [2], and qemu as of v11.0.0. Also, VMMs which support
rutabaga-gfx [4], including CrosVM and qemu (partial).

See this video [5] for a demonstration of libkrun/muvm with host native
context using the asahi UMD.

Upstream mesa recently also merged support for i915 and panfrost host
native context, which should be a part of v26.3. Those config options
can be added once they become available in a supported release.

See also the patches adding the virglrenderer package [6] to buildroot,
and bumping qemu to v11.0.0 [7].

[0] https://www.collabora.com/news-and-blog/blog/2025/01/15/the-state-of-gfx-virtualization-using-virglrenderer/
[1] https://github.com/containers/libkrun
[2] https://github.com/AsahiLinux/muvm
[3] https://www.qemu.org/2026/04/22/qemu-11-0-0/
[4] https://github.com/magma-gpu/rutabaga_gfx
[5] https://www.youtube.com/watch?v=xRNu0XaXTng
[6] https://lore.kernel.org/buildroot/20260512-virglrenderer-v5-0-1806e588eb59@gmail.com/
[7] https://lore.kernel.org/buildroot/20260514-qemu-v11-0-0-v3-1-e64cbadaa8e5@anodize.com/T/#u

Signed-off-by: Joseph Kogut <joseph@anodize.com>
---
Changes in v3:
- Minor continuity fix in Config.in [Romain]
- Link to v2: https://patch.msgid.link/20260512-mesa3d-amdgpu-virtio-v2-0-30678b797df9@anodize.com

Changes in v2:
- s/MESA3D_GALLIUM_DRIVER_FREEDRENO_KMDS/MESA3D_FREEDRENO_KMDS [Romain]
- Link to v1: https://lore.kernel.org/buildroot/20260227-mesa3d-amdgpu-virtio-v1-3-3e6d10d4eaef@anodize.com/

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
base-commit: eb496bd63ef4a4466f9482fa4b3226e20cfb7f7b
change-id: 20260512-mesa3d-amdgpu-virtio-2d917a137424

Best regards,
--  
Joseph Kogut <joseph@anodize.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
