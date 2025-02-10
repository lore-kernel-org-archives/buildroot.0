Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A67BFC02198
	for <buildroot@archiver.kernel.org>; Mon, 10 Feb 2025 20:57:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 287A180C75;
	Mon, 10 Feb 2025 20:57:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VBFr6pkoXCvy; Mon, 10 Feb 2025 20:57:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A66B80BF2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A66B80BF2;
	Mon, 10 Feb 2025 20:57:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D2BCBC2
 for <buildroot@buildroot.org>; Mon, 10 Feb 2025 20:57:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C201460C23
 for <buildroot@buildroot.org>; Mon, 10 Feb 2025 20:57:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U3xm4s3gEKzu for <buildroot@buildroot.org>;
 Mon, 10 Feb 2025 20:57:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2F4CB60C18
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F4CB60C18
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2F4CB60C18
 for <buildroot@buildroot.org>; Mon, 10 Feb 2025 20:57:23 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43944181e68so15797215e9.0
 for <buildroot@buildroot.org>; Mon, 10 Feb 2025 12:57:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739221042; x=1739825842;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=15FZ1xrdR0Cav5vAmamrqCwtCNnFwYtw6TcHwj0KMMM=;
 b=le88QBgv/ngdeWFjsXmpkibsfb4xoz8yCqt7PXbTn36UmQeJ5SFMYjPrElbV1PCALB
 jINBNqiRgGnBo2Rz5lQ4eXIlqZ5luO1MYFbnf+JIyJfCR+gvon9ncbY1rCXt/99tMS7g
 yJ8W+hirrJ1RKRtbKX/GwNxPkCfGc1zzI1+bLGwdgXMD/1XpiL3FFg1t2Qjd5A8FWLmP
 k6ujYd8o4g9BvYkF2N916hWdGqJske2rAiAKl0v/GW+00oEnQ71upnMj81gnQOilEF1W
 YE3vdfkkykX5uWBAbJ41zPEGqr8M9Iwdjdy178LpR4Qk4yhoycFMlJxNmYjzYSAHtBtx
 6SuQ==
X-Gm-Message-State: AOJu0Yy9RM03LEhwYigEqmQmsD/0a0fYI4Hkwhm4Yl0HD3HRDnK6Y/wv
 GwgXGT2gaKozHNWbLsJ5s8q0hO4kgh1CgaqlSMEoL5EouV6tlFhee7KXDBS17kFdyCLs4kca82E
 f
X-Gm-Gg: ASbGncsWXls7afXu1GzjewxTMhqFJxkUEV5R0P4NFOxJBW31cDLL26iPr2MVri3CX/j
 Us3dEzjOzfopYT73dzn62DvUVGbqDk/PVv0R1ItraySsMvaWpLe8cwCufcyTKq/4DuaL9LCkP+u
 IdxDsWoeEs+tzVr2HmtQliVHO9Lj9rmKxQJaxWSoqWU8APotLrcIl7ccJLzjFR6qVk8HPnnvLLD
 ifjDYqjoVaxdER9c8QppOC1ssOFXM6WxOhKciivuGFm11ChaXa7UOUCyZ1nFIUsouh93aAEGygK
 ZWhXqRBFDQpnKfe2044mmd6jgQLFwtrZkKMw/kG4cbH613YmJjrUjAHYoRgJfjTGAbSjNRB6ut/
 x0pRZLSyb4Yzs
X-Google-Smtp-Source: AGHT+IGkrAJ8NZ1jfbConnoEjvOeYvyFI1HdhfyfsRMwcFzRSsmZaZV7Bp1ErosnOnZe/SESCIB7Ag==
X-Received: by 2002:a5d:47a6:0:b0:38d:d9e4:9ba6 with SMTP id
 ffacd0b85a97d-38dd9e49c91mr6452037f8f.3.1739221041852; 
 Mon, 10 Feb 2025 12:57:21 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dd4342502sm7650125f8f.26.2025.02.10.12.57.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Feb 2025 12:57:21 -0800 (PST)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Mon, 10 Feb 2025 21:57:16 +0100
Message-ID: <20250210205716.599848-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1739221042; x=1739825842; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=15FZ1xrdR0Cav5vAmamrqCwtCNnFwYtw6TcHwj0KMMM=;
 b=kMi2Y/dnHua5TVvPfPeyH3i2GhNPdbuQ5oJJKyloUNX73M74RV4PHKbb6hlC1wWUi5
 8OrJQo/9vwqmYI//wtoi48SgzQ7qjoTskKHn24j67rqzlJwRFgjMnqrcnNw/4AURe/MU
 lGZ/Mvv5nncS/eQGPzOc5RoW4zMEuoFIRdVk8=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=kMi2Y/dn
Subject: [Buildroot] [PATCH] support/docker: prepare for Aarch64 Docker
 images
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

With the new 'buildx' command using 'BuildKit' since Docker 23.0 [1],
it become easy to build the same image for several architectures [2].
The only requirement is to use a Dockerfile without any architecture
specific definition.

Since our current Dockefile contains already some i386 specific
packages (g++-multilib,libc6:i386) to provide x86 32bits support,
we have to install them conditionally.

Update the build process described in the Dockerfile accordingly.

For now, Aarch64 hosts can't be used by the Buildroot testsuite (yet)
since the Bootlin external toolchain (used by default) currently only
support x86_64 hosts.

[1] https://docs.docker.com/engine/release-notes/23.0/
[2] https://www.docker.com/blog/multi-arch-build-and-images-the-simple-way/
[3] https://www.docker.com/blog/multi-arch-build-what-about-gitlab-ci/

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
Tested on my Buildroot personal fork using the buildroot/base:20250209.1423:
https://gitlab.com/kubu93/buildroot/container_registry/2394843

I used my new BeaglePlay board (aarch64 based SoC) with the pre-installed
Debian image (with Docker installed) to fetch the arm64 image using
utils/docker-run. But due to the eMMC size, I was not able to perform any
complete build.

Now that the arm64 image is working, I tested it with Gitlab-CI to build
one of qemu defconfig (qemu_riscv64_virt_defconfig):

To build with an arm64 host, a job needs contain a 'tags' property using
the label defined by the arm64 runner. Otherwise an x86_64 runner is
used by default.

Likely gitlab provide several runners (even for the free Tier)
- saas-linux-small-amd64
- saas-linux-small-arm64

Here a pipeline example where the qemu_riscv64_virt_defconfig was build
twice in parallel on amd64 and arm64 host:
https://gitlab.com/kubu93/buildroot/-/pipelines/1662949264

qemu_riscv64_virt_defconfig: [saas-linux-small-arm64]
  Duration: 78 minutes 39 seconds

qemu_riscv64_virt_defconfig: [saas-linux-small-amd64]
  Duration: 94 minutes 29 seconds
---
 support/docker/Dockerfile | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/support/docker/Dockerfile b/support/docker/Dockerfile
index 8b8a478f66..93044eb7fd 100644
--- a/support/docker/Dockerfile
+++ b/support/docker/Dockerfile
@@ -1,7 +1,9 @@
 # This Dockerfile generates the docker image that gets used by Gitlab CI
-# To build it (YYYYMMDD.HHMM is the current date and time in UTC):
-#   docker build -t registry.gitlab.com/buildroot.org/buildroot/base:YYYYMMDD.HHMM support/docker
-#   docker push registry.gitlab.com/buildroot.org/buildroot/base:YYYYMMDD.HHMM
+# To build it for arm64 and amd64 (YYYYMMDD.HHMM is the current date and time in UTC):
+#   docker buildx create --use
+#   docker buildx build --platform linux/amd64,linux/arm64/v8 \
+#       -t registry.gitlab.com/buildroot.org/buildroot/base:YYYYMMDD.HHMM \
+#       --push support/docker
 
 # We use a specific tag for the base image *and* the corresponding date
 # for the repository., so do not forget to update the apt-sources.list
@@ -21,9 +23,20 @@ ENV DEBIAN_FRONTEND noninteractive
 # This repository can be a bit slow at times. Don't panic...
 COPY apt-sources.list /etc/apt/sources.list
 
+# Install 32bit variant on x86_64 image.
+RUN if [ "$TARGETPLATFORM" = "linux/amd64" ]; then \
+    dpkg --add-architecture i386; \
+fi
+
 # The container has no package lists, so need to update first
-RUN dpkg --add-architecture i386 && \
-    apt-get -o APT::Retries=3 update -y
+RUN apt-get -o APT::Retries=3 update -y
+
+RUN if [ "$TARGETPLATFORM" = "linux/amd64" ]; then \
+    apt-get -o APT::Retries=3 install -y --no-install-recommends \
+        g++-multilib \
+        libc6:i386; \
+fi
+
 RUN apt-get -o APT::Retries=3 install -y --no-install-recommends \
         bc \
         build-essential \
@@ -35,9 +48,8 @@ RUN apt-get -o APT::Retries=3 install -y --no-install-recommends \
         cvs \
         file \
         flake8 \
-        g++-multilib \
+        g++ \
         git \
-        libc6:i386 \
         libncurses5-dev \
         locales \
         mercurial \
-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
