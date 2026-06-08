Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AB1CCD8C92
	for <buildroot@archiver.kernel.org>; Mon,  8 Jun 2026 02:06:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86A0D60770;
	Mon,  8 Jun 2026 02:06:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5N4ruutzek_g; Mon,  8 Jun 2026 02:06:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3FC206089D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780884379;
	bh=qjaOtbhcFYJpX31Pi/Dhenq3nUp8EqmAZaKS3tRtSuk=;
	h=From:Date:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=AR/FL2NM2xjW+HTj3eE1d0oECEZT+RYSWqdZ34ocnPW9pswau8wfOPglcm875ags6
	 GqO4SSbc4oxMejj6aijYanrhshdV9QKl5JMaDJ0ammljU/TE7rxKTo9n/irldCYHPK
	 qStFhiJ+r5UwEhWajDA+QT/c4h6BLIGYgyQwlsFhc60mNiTgfBcyKEuJZdd/B5iYv6
	 WHNvDcIHpuThY8F1ynGjClkct8hpsVYbJ3M/gcm+TwmtRfdLSEJAykuFEQ41Z6CszF
	 pcpkfV7A74D718gGhmodTYtPM0URKzl7O9EK3C6kzfvtmH7fxNXG4ZQjAHVMceb6ti
	 00FmGmvTpofsw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3FC206089D;
	Mon,  8 Jun 2026 02:06:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E905EC
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 02:06:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0F5D840511
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 02:06:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aziGI5oEEu7J for <buildroot@buildroot.org>;
 Mon,  8 Jun 2026 02:06:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F0882403F0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0882403F0
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F0882403F0
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 02:06:16 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-36ba285e98bso3662531a91.2
 for <buildroot@buildroot.org>; Sun, 07 Jun 2026 19:06:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780884376; x=1781489176;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E0mTWeGk+a5AfEsPPgZRy2RpI6Yb33nz36/Q3X85T/k=;
 b=kQY8mAB6mzcKiunHAG1/mSLhPj5I48g70wmgSX+/UcNu4/JcoaZMRQH9Ok8DO4Az61
 xHpxKwywT6l1EMxisCJeqtHlh9uNCAxkqIeVtcD/NJYt7SQn8EKZc3K2ErFaASlBs8oL
 cp5ZYfBQ9lnMENHQrXNM0u6ra88Z9ns9iU2RQr6AAQgo4H0wE+4Y3uwsZBfgRC8z0180
 ou2pi1ilVMlfe62IbNNOxm1Rlk9Y4pU9cIsqBzAa/UumGXnUnTSCQjtw057BvL8PYsoX
 uh+6kcHZlo8eHbf/pfB5S6GVq2id/Cw/bofNB9HOZy+NYf7c1jB9MqLNFU01n+qZZgP4
 qSfw==
X-Gm-Message-State: AOJu0YzL/ZiO53EkIKomQl43uou27U7REGw2xfig7He2LmDMxlRiiPu9
 9ZIQp+4/tceB0nJTjo5qKjapUGBupjDX9UVMxUnVUfiR2eKuXps/2IRL
X-Gm-Gg: Acq92OG7OCOQS1MVfyQ8uDetMxq04T58rf3c/9HhQxsUk41WL2ij+bI0gzjV6318c6B
 jXYpLl6BWQXSr/VbG6vpsUztxSakstorGhzGZqUJjOoqM5zGw3WAPSVZph3kmme0hCqs+G0f5KB
 dFgtaU6pIh5Pk1KegfaqmakZaMFsM8Ck0KDuYrMioAPjf/qJpx2VfPxVS9VDM/3gjri/Ad3EUrw
 uiUlQVn+XiDRwBezPcSWce3yEK6mYESbsXDxbJXVmw5hJuKWkSbM6G+ANunSMYa7/b4odvNfiH7
 +lrps36XaBVf6/j/cEvnI1HD6E8qSUSclhIeI1EFHnsPWgi/6TyN5fc09ltYCH4656F7n8darug
 e64hofBhDc63lMQ6xBmw3skcM20B3wYujzcS6znVkwE7b+rxdf8ugolrkHY85VifxoZZU9y7DC3
 qu9dSoN+D4hPtE3DeiXa8YxV+Q94WGavTCLhvwGIo=
X-Received: by 2002:a17:90b:58e7:b0:36b:936e:73c8 with SMTP id
 98e67ed59e1d1-370f0e4ad33mr15769663a91.19.1780884376038; 
 Sun, 07 Jun 2026 19:06:16 -0700 (PDT)
Received: from wash-34.local ([50.47.124.161])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-36f6d109dcdsm15500399a91.9.2026.06.07.19.06.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jun 2026 19:06:15 -0700 (PDT)
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Sun, 07 Jun 2026 19:06:03 -0700
Message-Id: <20260607-b4-virglrenderer-v1-0-15cd736c623c@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWM0QrCMBAEf6Xcs8E0SEr9FfEhadf0RK5yqaVQ+
 u8m+jjLzuyUoYxM12YnxcqZZynQnhoapiAJhsfC5Kzz1tvOxItZWdNLISMUagI63/reefSOivZ
 WPHj7JW/3P+dPfGJYaqc+YsgwUYMMU51m5cRyFmwLHccX5t2AD5IAAAA=
X-Change-ID: 20260607-b4-virglrenderer-ae7616926e92
To: buildroot@buildroot.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780884375; l=7299;
 i=joseph.kogut@gmail.com; s=20251022; h=from:subject:message-id;
 bh=76AaKL2eTLWCkV2k4rxOlsLARayZLvFyV+cYXTHZ0fo=;
 b=Cu+l3cWzQdyMfpCwqiVCUocqFJTMWxbWTmAFA/E2v3QP8OX7orXTkEXiix3VPeGTJZUq/64O6
 YCZeNUNe7o5DX/Jj36xhcH0zf3s6DmJDn4owx7tr9ka4POkTeGE0TCm
X-Developer-Key: i=joseph.kogut@gmail.com; a=ed25519;
 pk=pkWqHIjgowoQ51cQZTl6aTwJnXIFThap40f4w8cEsxw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780884376; x=1781489176; darn=buildroot.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=E0mTWeGk+a5AfEsPPgZRy2RpI6Yb33nz36/Q3X85T/k=;
 b=TIk0jrWtzgQP7b5sQ1pRJvgQ3UNqkmi5XDAuKdckNS7xYruinSMlqlApND5EeTaUJv
 DVtDD6h2b8aor5ZT8TG0zNORSCJbC4O4Eeup9QRNoRGtog42H7kIeXmpxt/0JW1gu99D
 lOB3dHI3Uv5FK+P4HCjBwEGw3T712wOM6K7Q7JiOdeBk1zqKzcYpRx7V1G5iXZfsAlya
 OBYBFOVd9HBX9lVykYg1uB8y17DfIqT3MSlgAltRSYdWzPlKidsQ98YMHlD1gkrQoU/k
 bknfZBT/TcUxkJmqVMCo9R+Zk+1Y5RNg9GoTGNCnqjyAVvvSH9pIjsUKox/wCGN8kEoO
 lhsg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=TIk0jrWt
Subject: [Buildroot] [PATCH 0/7] Add virglrenderer support
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Joseph Kogut <joseph.kogut@gmail.com>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Adrian Perez de Castro <aperez@igalia.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

This patch series adds support for building the virglrenderer library in
buildroot.

Virglrenderer is a userspace library used to support rendering and
compute in virtual machines over virtio-gpu. Virglrenderer supports
serialized API level access to OpenGL and Vulkan through virgl and venus
respectively, as well as mediated DRM level access using host native
context [0]. Notably libkrun [1] and rutabaga_gfx [2] are also capable of
utilizing virglrenderer.

The first two patches prepare for removing libepoxy's dependency on
GL/EGL, and the third patch removes it. This allows virglrenderer to
build with its libepoxy dependency, without actually depending on
EGL/GLX.

This enables, for example, headless compute through Vulkan using Venus
or host native context inside virtual machines.

The fourth patch adds the new virglrenderer package. Optional configs
enable VirGL (API-level OpenGL passthrough), Venus (API-level Vulkan
passthrough), hardware accelerated video encode/decode through VA-API,
and DRM driver specific backends for host native context support.

The fifth patch adds an OpenGL config for qemu.

The sixth patch adds a qemu virglrenderer config that selects OpenGL
support, as virgl/venus support in qemu currently requires a GL
accelerated display frontend (a patch series on the mailing list [3] is
proposing decoupling display GL support from Venus). Other VMMs
such as libkrun don't suffer from the same coupling currently.

The seventh patch adds a new runtime test for virglrenderer with
qemu using a software GL driver and a nested guest.

[0] https://www.collabora.com/news-and-blog/blog/2025/01/15/the-state-of-gfx-virtualization-using-virglrenderer/
[1] https://github.com/containers/libkrun
[2] https://github.com/magma-gpu/rutabaga_gfx
[3] https://lore.kernel.org/qemu-devel/20260317182049.33848-1-lucaaamaral@gmail.com/

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
Changes in v8:
- Clean up Kconfig help, indentation, comments [Arnout]
- Move virglrenderer vaapi cfg, under "Other options"
  [Arnout]
- Add placeholder comment for vaapi support
- Squash glibc 2.43 build fix into virglrenderer [Arnout]
- test: Split into inner/outer kernel/rootfs [Arnout]
- test: Use aarch64 build [Arnout]
- test: disable BR2_PACKAGE_QEMU_BLOBS in outer guest config
- test: switch from glmark2 to kmscube (remove udev dep) [Arnout]
- Link to v7: https://patch.msgid.link/20260515-virglrenderer-v7-0-1f1814b65ccd@gmail.com

Changes in v7:
- History cleanup
- Link to v6: https://patch.msgid.link/20260515-virglrenderer-v6-0-d9081c13baf9@gmail.com

Changes in v6:
- Add explicit EGL dependency for weston XWayland support, and only
  enable XWayland glamor when libepoxy has EGL support
- Fix stale libepoxy dependency comments in wpewebkit
- Document why libepoxy can be built without GLX or EGL support
- Improve qemu OpenGL dependency comment
- Add qemu and virglrenderer comments warning when no virglrenderer
  backend is enabled
- Add a runtime test for virglrenderer using nested qemu and virgl
- Link to v5: https://lore.kernel.org/r/20260318-virglrenderer-v5-0-09a3274852d6@gmail.com

Changes in v5:
- Fixed authorship, Signed-off-by, and sent from address
- Link to v4: https://lore.kernel.org/r/20260317-virglrenderer-v4-0-ed223e222bb6@gmail.com

Changes in v4:
- Removed libepoxy dependency on GL/EGL
- Introduce explicit configs for virglrenderer DRM backends, virgl
  (see above note)
- Moved virglrenderer Kconfig from Libraries -> Graphics to 'Graphics
  libraries and applications' (next to mesa3d && X.org)
- Add a patch from upstream virglrenderer to fix glibc 2.43 builds
- select libdrm in virglrenderer only when required (drm backends,
  video)
- BR2_PACKAGE_VIRGLRENDERER_DRM_BACKEND_MSM depends on !BR2_arm
- Explicitly configure GLX and/or EGL when
  BR2_PACKAGE_VIRGLRENDERER_VIRGL=y
- Separate comments for qemu GL/virglrenderer [Romain]
- Split up qemu feature configs into separate commits [Romain]
- Link to v3: https://lore.kernel.org/buildroot/20260219-virglrenderer-v3-0-e2ff1a23be3f@gmail.com/

Changes in v3:
- Bump version to v1.3.0
- Add optional deps for panfrost and i915 native context (new)
- Add config for vaapi support
- Remove GLX in favor of EGL
- Update qemu docs links, as previous ones 404 [Romain]
- Fix invalid config reference in BR2_PACKAGE_QEMU_VIRGLRENDERER
  [Romain]
- Select libepoxy when enabling OpenGL support in qemu [Romain]
- Add depends on gcc >= 4.1 to virglrenderer (from meson.build)
- Add depends on libgbm to virglrenderer [Romain]
- Add comments for missing dependencies to virglrenderer Kconfig
- Select vulkan-headers when venus is enabled [Romain]
- Disable venus explicitly when the symbol isn't selected
- Link to v2: https://lore.kernel.org/buildroot/20251203-virglrenderer-v2-v2-0-2846fc1a579a@gmail.com

Changes in v2:
- Rebase onto next (python-glslang patch merged)
- Bump version to v1.2.0
- Remove hidden configs for virglrenderer vDRM backends [Romain]
- Fixed typo in qemu/Config.in [Romain]
- Split up configs for qemu OpenGL and virglrenderer support [Romain]
- More detailed qemu config help messages
- Link to v1: https://lore.kernel.org/r/20250618-virglrenderer-upstream-v1-0-57525ac8406e@gmail.com

To: buildroot@buildroot.org
Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Adrian Perez de Castro <aperez@igalia.com>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Cc: Joseph Kogut <joseph.kogut@gmail.com>
Cc: Romain Naour <romain.naour@gmail.com>

---
Joseph Kogut (7):
      package/weston: add EGL dependency for XWayland
      package/wpewebkit: fix stale libepoxy dependency comments
      package/libepoxy: remove gl/egl dependency
      package/virglrenderer: new package
      package/qemu: add OpenGL config
      package/qemu: add virglrenderer integration
      support/testing: add virglrenderer test

 DEVELOPERS                                         |   2 +
 package/Config.in                                  |   1 +
 package/libepoxy/Config.in                         |   8 +-
 package/qemu/Config.in                             |  35 +++++
 package/qemu/qemu.mk                               |  15 +-
 .../0001-fix-build-with-glibc-2.43.patch           |  39 +++++
 package/virglrenderer/Config.in                    | 114 +++++++++++++++
 package/virglrenderer/virglrenderer.hash           |   5 +
 package/virglrenderer/virglrenderer.mk             |  62 ++++++++
 package/weston/Config.in                           |   6 +-
 package/wpewebkit/Config.in                        |   4 +-
 package/x11r7/xwayland/xwayland.mk                 |   2 +-
 .../testing/tests/package/test_virglrenderer.py    | 159 +++++++++++++++++++++
 .../test_virglrenderer/linux-inner.fragment        |   4 +
 .../test_virglrenderer/linux-outer.fragment        |   6 +
 .../rootfs-overlay/etc/profile.d/stty-raw.sh       |   3 +
 16 files changed, 455 insertions(+), 10 deletions(-)
---
base-commit: 32351f979822a0b3a45b82c2d82bdb2328b02f5a
change-id: 20260607-b4-virglrenderer-ae7616926e92

Best regards,
--  
Joseph Kogut <joseph.kogut@gmail.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
