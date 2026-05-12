Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9B33CD343F
	for <buildroot@archiver.kernel.org>; Tue, 12 May 2026 22:04:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 925FB41105;
	Tue, 12 May 2026 22:04:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eMN2Uuem5E_2; Tue, 12 May 2026 22:04:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C082410B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778623493;
	bh=hEuP0cT6flLJzmEtnMBu4jnpH5VHVaxmeLbNdVNIrso=;
	h=From:Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dNoX3kClbcEYiCkB4c/6e+tRWBEA5VPbOalGzPgnYao8pQ1EXDik5lDypjw5qNQpP
	 EqhfOqg0ClGM6KyT7CidguPHs3ppjX10c58iNjj6P6vGrccCQH9DvSpK8i/CPmB4ql
	 czvjFGrkUycgVpPj9Z4GoYfshCIEs0URE9zQWKVqRJl7JtlEz1Au/ntY0hw4xtdwvK
	 IM8ZozzlVRwACEg2l8gXiLO9Cpr4VHTewxgoGfEqeeiSUp5X5xeInVZCCP97zE3jak
	 AWrqNsEM50Il3lzRMnvS62gAPCe0GT8WPV/9LwzXvw5e9EiRsnsn+SN8xCLaJtojpP
	 h8tt5oOU2G93g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C082410B5;
	Tue, 12 May 2026 22:04:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C7A6415F
 for <buildroot@buildroot.org>; Tue, 12 May 2026 22:04:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ADB4E60EB2
 for <buildroot@buildroot.org>; Tue, 12 May 2026 22:04:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JlYtBnHtwQak for <buildroot@buildroot.org>;
 Tue, 12 May 2026 22:04:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com;
 envelope-from=joseph@anodize.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B51B060E7C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B51B060E7C
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B51B060E7C
 for <buildroot@buildroot.org>; Tue, 12 May 2026 22:04:50 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-83659d38e38so2721494b3a.1
 for <buildroot@buildroot.org>; Tue, 12 May 2026 15:04:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778623490; x=1779228290;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q/x8fZdq0KdXJDajHRRyfRZbYX38Hm7hVNcxJxPH47U=;
 b=JWW/oIFzph8wzQA31bS3qpy8j0zSOq276xauWN3qY9CLZv3cEzJEblTx4Ox3e/BtJh
 U7YgFqtf8wnDyOhzIQvKhzyFeyCcuXHAFsWHFDc1RYX1+BOK6JyeI4jWWJE7JoT1cCMJ
 kottJX0wn/NlguBHeljrl+MMHH5WiJTECaJ5SdDzVKDkoeA3vJV1OTd0AUNrdqd3KuRo
 86kf6odez+4vF5y9o2tQ+qy02aTsbWUJI7jyqBgsWD4nTIQNKPGfZsPXphPXXSyGSXCT
 tvl+Kg22ft/4wcpNBnhtMKrFSsmL6x9bsdozbgrycmGYiDB9MF/MzyUMSojfQterbMBO
 xcIA==
X-Gm-Message-State: AOJu0YxnTBjnp9Q1JX3We86hzBff+zUODFotVO8SZwkJDVDtMQ6R4NC3
 zvkhy4V1jQiwOBFxPhu8p9z5BsN1Gwg4c4xapbiNM7ZeQqaYhMrbVs7bn1EQO875IYQ=
X-Gm-Gg: Acq92OHCt5k/9zebagM8C6VqpqhyC5Mb+767tXVJeGRkhQ51zo8EPDOQ7nlYdfG/nOc
 uWY/oKd64REIu5gANpWmzKRDqo8sfqP/BbPlv7XYDyUBVBJAgSDLbeGF91akSqvkkwnuTt9oypQ
 RQwkBd1gCd6YvD96wtcxRMOIL7rjEupLOEn3fEZdsxuNsICl5mwEaudDraUf6b6tCr3aDJxVpAK
 OIDk7l8D87kUxTUxpw4AsJA4BNvW58MkDLHLcleEU8cNrDLIl/7eSrbhgMQZoVWL6CLElPbV0Gg
 L6TsH/fCi82dzLm76d6o3IfwidR/BVrER4v885KyPQeU5dsPQ20hPjoQrQyHY9wmBP/cFkMZNMF
 WZUBJJicAUqV8f2Lk/geLyAWb/5KzLLjPLTj8OhpcBpcNeLhCQxJMqXzL/6ViPTbdJsJvOHvycY
 FsJe56AoegFvO8wY0YKJs=
X-Received: by 2002:a05:6a00:94e1:b0:82f:74b2:7fba with SMTP id
 d2e1a72fcca58-83f03e94f86mr498456b3a.4.1778623489865; 
 Tue, 12 May 2026 15:04:49 -0700 (PDT)
Received: from wash-3.local ([50.120.90.9]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-839685a8125sm24388390b3a.61.2026.05.12.15.04.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2026 15:04:49 -0700 (PDT)
From: Joseph Kogut <joseph@anodize.com>
Date: Tue, 12 May 2026 15:04:43 -0700
Message-Id: <20260512-mesa3d-amdgpu-virtio-v2-0-30678b797df9@anodize.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23MQQ6CMBCF4auQrh3TDgjRlfcwLoZ2gJqUkrYQI
 +HuUl24cfkn732riBwsR3EpVhF4sdH6cQ88FEIPNPYM1uwtUGItTwrBcaTSADnTTzMsNiTrAc1
 ZNaTKpsJK7NcpcGefH/Z2/3ac2wfrlK286IJ3kIbA9OMRm//8okBCybVR0lRM3F1p9Ma++Ki9y
 1pLkaENNOoha45i4iC27Q1N457Q3wAAAA==
X-Change-ID: 20260512-mesa3d-amdgpu-virtio-2d917a137424
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, Joseph Kogut <joseph.kogut@gmail.com>, 
 Romain Naour <romain.naour@gmail.com>, Joseph Kogut <joseph@anodize.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778623489; l=3750;
 i=joseph@anodize.com; s=20251022; h=from:subject:message-id;
 bh=aIbvBjgjyELZ2kesLjznpXsPYto3SAZGSgiacg7dg1w=;
 b=tjVt+rMYXokJDfHB3b6b8H2VcZ30aVGYsMwV14n5p3/C/NaxCBXYOAtPguncTOXTfPsDF/Jd5
 XY7S2eHQ+SBC1d/SDIKXIp/rM9E4frhh2skZ6rd1X0IAdOJ2+J6Tqn8
X-Developer-Key: i=joseph@anodize.com; a=ed25519;
 pk=pkWqHIjgowoQ51cQZTl6aTwJnXIFThap40f4w8cEsxw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anodize.com; s=google; t=1778623490; x=1779228290; darn=buildroot.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Q/x8fZdq0KdXJDajHRRyfRZbYX38Hm7hVNcxJxPH47U=;
 b=gwz7yp7s62g8taj6lkFToCAQyXTercP1i790c7xBWGb4nhULOEPQR44AwnTF0m7Ofe
 FP9nf0inxR0SjeKmFqRDzp4ntz1jBngeWbLH3ZD7S+af4QLpeokX5Qh1nOv1qFwAK9lA
 fUEFa4QSSSk9bewJNsfgzsNXbsgBynRBclpIDvH0vhyEEOs6SzDy6l+3Tz26zcXQlFPW
 G9pDyv3iMclCfOlvYLOM8BKj5qZJXL/uCdTx8iXu6qpCjl0Gh74+8MJrfXBWTNwsEQhO
 QVQGlCfcxQMEGRabO4E8+j2ScVRKhcQ3qksAozDjey3EjcwmPZEx9adlJCSAYjhcErDN
 eoGA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=anodize.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=anodize.com header.i=@anodize.com header.a=rsa-sha256
 header.s=google header.b=gwz7yp7s
Subject: [Buildroot] [PATCH v2 0/4] package/mesa3d: add host native context
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
[6] https://lore.kernel.org/buildroot/20260512-virglrenderer-v5-0-1806e588eb59@gmail.com/

Signed-off-by: Joseph Kogut <joseph@anodize.com>
---
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
base-commit: 258128aefef95cae78cb5fba8572dc6ce285c801
change-id: 20260512-mesa3d-amdgpu-virtio-2d917a137424

Best regards,
--  
Joseph Kogut <joseph@anodize.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
