Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAF59C46CCD
	for <buildroot@archiver.kernel.org>; Sat, 16 Dec 2023 16:12:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92B9760F99;
	Sat, 16 Dec 2023 16:12:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92B9760F99
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w2FwZDZMFrAs; Sat, 16 Dec 2023 16:12:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22FF160F5F;
	Sat, 16 Dec 2023 16:12:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22FF160F5F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 108711BF28A
 for <buildroot@lists.busybox.net>; Sat, 16 Dec 2023 16:10:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EAF4D41761
 for <buildroot@lists.busybox.net>; Sat, 16 Dec 2023 16:10:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EAF4D41761
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2zvuRTHr3chi for <buildroot@lists.busybox.net>;
 Sat, 16 Dec 2023 16:10:08 +0000 (UTC)
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AE6774177B
 for <buildroot@buildroot.org>; Sat, 16 Dec 2023 16:10:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE6774177B
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40c3fe6c1b5so18046855e9.2
 for <buildroot@buildroot.org>; Sat, 16 Dec 2023 08:10:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702743007; x=1703347807;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=fQuP/A1KXT2y+uEeJW3VswSpdAnzYi0AM+MPsmKkSY4=;
 b=NCbjUZFaNXyL354jJdmwpkgUAIVFUb3/exMd+6lWtvRFBiu0y1jjsndwMF7wFq4RIY
 JrJMe0mOlEqX03EO2/nh7yx9aonykekF2cEX96c1w0Ku6SNsXKqqqv4jUYOWWGmVr7kE
 xjuZZPI0BOVWFTC28fkXb2C30FiEu3eo31MYg4tAiyU5lAx8byzRtYApOmvDj02xxOVa
 iFIeMnTCoW7618+bAMMD7JiWIaZ0UJKC9bXDlzF0KDmqI+IL5VrZkFXGu5P5DEPrWg4V
 9/1OdUz+FGmf/W+HM2XfWvVNoNMhrvu2paK0BTBQCGPcHDSJsQGadH40qUUFRUQag+1F
 E43g==
X-Gm-Message-State: AOJu0Yw5NnoA5IETf1ekephabFyyxn9uba7CeFyOO+wjIEipiZqWWA/n
 tGRrFbfy0SpqZeymVE+m5/HNMsm36Ys=
X-Google-Smtp-Source: AGHT+IFqo8o26UP5cSIsPtdwvKijEOGuUh4XumlDs1ObdBP0QZdyA9CYwdbcDYQzk6St7X3FbdYyTg==
X-Received: by 2002:a7b:c849:0:b0:40b:3d9f:eedf with SMTP id
 c9-20020a7bc849000000b0040b3d9feedfmr7203467wml.15.1702743006601; 
 Sat, 16 Dec 2023 08:10:06 -0800 (PST)
Received: from landeda.home ([2a01:cb19:8290:3800:4f89:5708:1633:580e])
 by smtp.gmail.com with ESMTPSA id
 k40-20020a05600c1ca800b0040b45356b72sm36319926wms.33.2023.12.16.08.10.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Dec 2023 08:10:06 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 16 Dec 2023 17:10:02 +0100
Message-ID: <667bcfe54dc93243aaf66e414bcb60583f5a97d7.1702742998.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1702742998.git.yann.morin.1998@free.fr>
References: <cover.1702742998.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702743007; x=1703347807; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fQuP/A1KXT2y+uEeJW3VswSpdAnzYi0AM+MPsmKkSY4=;
 b=jZ4zl2fJe7F4YrqxqLXqUGF0G13Yp3cbsJmU0UV03RQe64GjOlTYwsMNwtGCGrHKw0
 6nayFN1cOgBST3Gj2TITqkwSHOP3+95AFZPqgulqpZf2c8c0Ywp4qFicKhUYIQRXFv+e
 N3kMo8Jyn6hFMUE5KrCNfXbqnvxIS45z5ithU8PyJwu3P0Zu8UIjMYbyXvivwBNVeVan
 vtdRnVZVH/H/nFV24WThWgrM3qD8OHx7TkyQ58afGylf7FIrfpp/EnILxPNyWgECd5ye
 rHGj7f/ceHAsxoYKBNscOrBuVCn+uSwiOJqWzRs1hvQKgfYpde50jqBO0oeX8eqpr++v
 y9Mw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jZ4zl2fJ
Subject: [Buildroot] [PATCH 9/9] support/docker: add a Fedora-38-based image
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Unlink Debian, Fedora does not provide any time-based snapshots that
would provide a reproducible distribution.

However, it looks like the "main" repository does not change after the
release, with updates going into the aptly named "updates" repository.

So, in order to be as reproducible as possible, we remove all non-main
repositories, which also means no so-called modularity (but it's been
dropped upstream anyway [0]), and no h264 decoder from Cisco (but we
don;t need that for a Buildroot build image).

[0] https://fedoraproject.org/wiki/Changes/RetireModularity

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 support/docker/fedora-38.base/Dockerfile | 43 ++++++++++++++++++++++
 support/docker/fedora-38.ci/Dockerfile   | 47 ++++++++++++++++++++++++
 support/docker/fedora-38.user/Dockerfile | 35 ++++++++++++++++++
 3 files changed, 125 insertions(+)
 create mode 100644 support/docker/fedora-38.base/Dockerfile
 create mode 100644 support/docker/fedora-38.ci/Dockerfile
 create mode 100644 support/docker/fedora-38.user/Dockerfile

diff --git a/support/docker/fedora-38.base/Dockerfile b/support/docker/fedora-38.base/Dockerfile
new file mode 100644
index 0000000000..e48a621103
--- /dev/null
+++ b/support/docker/fedora-38.base/Dockerfile
@@ -0,0 +1,43 @@
+# vi: ft=dockerfile
+# Note: this dockerfile is not reproducible: even if we pin the image
+# to a specific tag and hash, the repository where we fetch packages
+# from is not pinned to a specific point in time; i.e. we'll get
+# whatever is current at the moment we build.
+
+FROM fedora:38@sha256:e9b68b3351329d72df54dfa5d10b2310e10829f6af58a8c30e0fc612d4f3b749
+
+LABEL maintainer="Buildroot mailing list <buildroot@buildroot.org>" \
+      vendor="Buildroot" \
+      description="Container based on Fedora 38, with everything needed to run Buildroot already installed"
+
+# Only keep the main repository, so we only get packages as they were
+# at the time of release, and we get no update: this helps a bit with
+# reproducibility.
+RUN rm -f /etc/yum.repos.d/fedora-*.repo && \
+    dnf -y install \
+        @development-tools \
+        bc \
+        bzip2 \
+        cpio \
+        file \
+        gcc-c++ \
+        git \
+        perl-English \
+        perl-ExtUtils-MakeMaker \
+        perl-FindBin \
+        perl-IPC-Cmd \
+        perl-Thread-Queue \
+        rsync \
+        unzip \
+        wget \
+        which \
+        && \
+    dnf -y clean all
+
+RUN useradd -ms /bin/bash br-user && \
+    chown -R br-user:br-user /home/br-user
+
+USER br-user
+WORKDIR /home/br-user
+ENV HOME /home/br-user
+ENV LC_ALL C.utf8
diff --git a/support/docker/fedora-38.ci/Dockerfile b/support/docker/fedora-38.ci/Dockerfile
new file mode 100644
index 0000000000..b136970502
--- /dev/null
+++ b/support/docker/fedora-38.ci/Dockerfile
@@ -0,0 +1,47 @@
+# vi: ft=dockerfile
+# Note: this dockerfile is not reproducible: even if we pin the image
+# to a specific tag and hash, the repository where we fetch packages
+# from is not pinned to a specific point in time; i.e. we'll get
+# whatever is current at the moment we build.
+
+# Based on our reference build image
+ARG BR2_REGISTRY
+ARG BR2_DOCKER_VERSION
+FROM ${BR2_REGISTRY}buildroot/fedora-38.base:${BR2_DOCKER_VERSION}
+
+LABEL maintainer="Buildroot mailing list <buildroot@buildroot.org>" \
+      vendor="Buildroot" \
+      description="Container based on Fedora 38, with everything needed to run Buildroot already installed"
+
+USER root
+WORKDIR /root
+ENV HOME /root
+
+# Only keep the main repository, so we only get packages as they were
+# at the time of release, and we get no update: this helps a bit with
+# reproducibility.
+RUN rm -f /etc/yum.repos.d/fedora-*.repo && \
+    dnf -y install \
+        breezy \
+        cmake \
+        cvs \
+        mercurial \
+        openssh-server \
+        python3 \
+        python3-flake8 \
+        python3-magic \
+        python3-nose2 \
+        python3-pexpect \
+        python3-pytest \
+        qemu-system-arm \
+        qemu-system-riscv \
+        qemu-system-x86 \
+        shellcheck \
+        subversion \
+        && \
+    dnf -y clean all
+
+USER br-user
+WORKDIR /home/br-user
+ENV HOME /home/br-user
+ENV LC_ALL C.utf8
diff --git a/support/docker/fedora-38.user/Dockerfile b/support/docker/fedora-38.user/Dockerfile
new file mode 100644
index 0000000000..fd0ebccade
--- /dev/null
+++ b/support/docker/fedora-38.user/Dockerfile
@@ -0,0 +1,35 @@
+# vi: ft=dockerfile
+# Note: this dockerfile is not reproducible: even if we pin the image
+# to a specific tag and hash, the repository where we fetch packages
+# from is not pinned to a specific point in time; i.e. we'll get
+# whatever is current at the moment we build.
+
+# Based on our reference build image
+ARG BR2_REGISTRY
+ARG BR2_DOCKER_VERSION
+FROM ${BR2_REGISTRY}buildroot/fedora-38.ci:${BR2_DOCKER_VERSION}
+
+LABEL maintainer="Buildroot mailing list <buildroot@buildroot.org>" \
+      vendor="Buildroot" \
+      description="Container based on Fedora 38, with everything needed to run Buildroot already installed"
+
+USER root
+WORKDIR /root
+ENV HOME /root
+
+# Only keep the main repository, so we only get packages as they were
+# at the time of release, and we get no update: this helps a bit with
+# reproducibility.
+RUN rm -f /etc/yum.repos.d/fedora-*.repo && \
+    dnf -y install \
+        ncurses-devel \
+        sudo \
+        && \
+    dnf -y clean all && \
+    printf 'br-user ALL=NOPASSWD: /usr/bin/su -\n' >/etc/sudoers.d/br-user && \
+    chmod 0440 /etc/sudoers.d/br-user
+
+USER br-user
+WORKDIR /home/br-user
+ENV HOME /home/br-user
+ENV LC_ALL C.utf8
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
