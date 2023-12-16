Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 546D9C46CA2
	for <buildroot@archiver.kernel.org>; Sat, 16 Dec 2023 16:11:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F211E60B92;
	Sat, 16 Dec 2023 16:11:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F211E60B92
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FsQv0ZYjvyC8; Sat, 16 Dec 2023 16:11:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E647560B99;
	Sat, 16 Dec 2023 16:11:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E647560B99
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D09641BF867
 for <buildroot@lists.busybox.net>; Sat, 16 Dec 2023 16:10:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A9B424175A
 for <buildroot@lists.busybox.net>; Sat, 16 Dec 2023 16:10:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9B424175A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PtGJj4XBc2zN for <buildroot@lists.busybox.net>;
 Sat, 16 Dec 2023 16:10:07 +0000 (UTC)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 81E9F41774
 for <buildroot@buildroot.org>; Sat, 16 Dec 2023 16:10:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 81E9F41774
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40c60dfa5bfso20044435e9.0
 for <buildroot@buildroot.org>; Sat, 16 Dec 2023 08:10:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702743006; x=1703347806;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=BBwgxECHcJib0qmuLdOIlnLtf54IZrKWbLYtcnH6SW0=;
 b=MO0pAq4gZyD5nlhekzmfX7KHszmbVWr7MbOszSagH55sFqFJMAJExYuXTb5q8+DG8X
 5kEGGot6wwLpI9Od42Vri/vj9cKHSM6MXFZHxj3U641MpZ5u/mL9oeg8FdW+jjHLSdSw
 pr2a30G6kNQ3fz5R6CxsFiG7VVqly8j6RWJc0IuGA3d1zobKF9PIzWIXlG4+mB89D59k
 XhqH3lm3MCEMs1FqwrK9GFTyxM2/EBpS0tUIvJD0wT3weGkNxYNmUbOeoVQY8UbLd9R8
 ogL3CemykZ6LXKE5uQ5iOCsRaXN63GP7HTxHXC5PxfUQwEEGDhCxZjJJ/vAOoTtg6aPq
 XzFw==
X-Gm-Message-State: AOJu0YxxaGLDpSFbKLy81c3+ATZfQG4cXWZ2Y0ZLPmVvHbOnauwD2OFp
 oxn5G16LZMAAloFOnC4nGxnfyr0fpcE=
X-Google-Smtp-Source: AGHT+IEeE0onvoHi3try91/vwv78JFYLvXiwrelNumN93J2i1WQF3rhgOevciyGvK6/2WlZKohbA7w==
X-Received: by 2002:a05:600c:2804:b0:40c:3eab:d987 with SMTP id
 m4-20020a05600c280400b0040c3eabd987mr6523483wmb.125.1702743005589; 
 Sat, 16 Dec 2023 08:10:05 -0800 (PST)
Received: from landeda.home ([2a01:cb19:8290:3800:4f89:5708:1633:580e])
 by smtp.gmail.com with ESMTPSA id
 k40-20020a05600c1ca800b0040b45356b72sm36319926wms.33.2023.12.16.08.10.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Dec 2023 08:10:05 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 16 Dec 2023 17:10:00 +0100
Message-ID: <ecdf7a2374c264e50f65cda967874e28c4c914e3.1702742998.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1702742998.git.yann.morin.1998@free.fr>
References: <cover.1702742998.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702743005; x=1703347805; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BBwgxECHcJib0qmuLdOIlnLtf54IZrKWbLYtcnH6SW0=;
 b=PzuPnwNMSxCoUKYjk9kUzi/xvhB8DtB7jQMlwQ0OQWd1EECdzJn2ltmUPcSQXj40tn
 IQ8ogH15BifzHVnvHy33QP0WQw3bCPHm6jGm1Iu35fhsMTaGf8M0oBVCDc1UgCdKCHz0
 bwYy3qAjc3TprrL2qLluhye6H1+2AKVlHJXYCpncodqeG/p2vKKYNMG4EPY+6ewGux/T
 GJOLrADylQswPTh5ukdq6N+FRfeSDXQvj2Df2pVSX/NxKyJhBw+vVHlHxbYN+szAEOcP
 8NyHj0/X6F1a/6R+33XXcJIQd+UiaOtC+LSOk462uNuN8B6yqJZQ20tyPB0NCwk8azQ6
 fQ5Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=PzuPnwNM
Subject: [Buildroot] [PATCH 7/9] support/docker: split base image into three
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

Our basic image should have only what is strictly required to do the
build, i.e. only the packages listed as mandatory in the manual.

Then we need an image for running our CI, with a few additional
toolings.

Finally, we want an image that users can run to use Buildroot (not to
develop on Buildroot, but just to use it).

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/docker/base                           |  1 -
 support/docker/build-all                      | 31 +++++++++----
 .../Dockerfile                                | 28 ++----------
 .../apt-sources.list                          |  0
 support/docker/debian-bullseye.ci/Dockerfile  | 43 +++++++++++++++++++
 .../docker/debian-bullseye.user/Dockerfile    | 32 ++++++++++++++
 6 files changed, 101 insertions(+), 34 deletions(-)
 delete mode 120000 support/docker/base
 rename support/docker/{debian-bullseye => debian-bullseye.base}/Dockerfile (59%)
 rename support/docker/{debian-bullseye => debian-bullseye.base}/apt-sources.list (100%)
 create mode 100644 support/docker/debian-bullseye.ci/Dockerfile
 create mode 100644 support/docker/debian-bullseye.user/Dockerfile

diff --git a/support/docker/base b/support/docker/base
deleted file mode 120000
index 95f9ccb9fc..0000000000
--- a/support/docker/base
+++ /dev/null
@@ -1 +0,0 @@
-debian-bullseye
\ No newline at end of file
diff --git a/support/docker/build-all b/support/docker/build-all
index d5c01771cf..6ae4ba5d25 100755
--- a/support/docker/build-all
+++ b/support/docker/build-all
@@ -2,16 +2,31 @@
 set -e
 
 BR2_DOCKER_VERSION="${1}"
+BR2_REGISTRY="${2:-registry.gitlab.com/buildroot.org/}"
 
-if [ -z "${BR2_DOCKER_VERSION}" ]; then
-    printf 'Usage: %s VERSION\n' "${0}"
+case "${BR2_DOCKER_VERSION}" in
+  (""|*/*)
+    printf 'Usage: %s VERSION [REGSITRY]\n' "${0}"
     exit 1
-fi
+    ;;
+esac
+case "${BR2_REGISTRY}" in
+  (""|*/)   ;;
+  (*)       BR2_REGISTRY="${BR2_REGISTRY}/";;
+esac
 
 BASE_DIR="${0%/*}"
-for context_dir in "${BASE_DIR}"/*/; do \
-    distro="$(basename "${context_dir}")"
-    docker build \
-        -t "buildroot/${distro}:${BR2_DOCKER_VERSION}" \
-        "${context_dir}"
+# "ci" images use FROM on the "base" images, so need to ensure we build
+# the "base" images first (don't rely on alphabetical ordering!). Ditto,
+# the 'user' images are based on the 'ci' ones.
+for type in base ci user; do
+    for context_dir in "${BASE_DIR}"/*."${type}"/; do \
+        [ -e "${context_dir}" ] || continue
+        distro="$(basename "${context_dir}")"
+        docker build \
+            --build-arg BR2_REGISTRY="${BR2_REGISTRY}" \
+            --build-arg BR2_DOCKER_VERSION="${BR2_DOCKER_VERSION}" \
+            -t "${BR2_REGISTRY}buildroot/${distro}:${BR2_DOCKER_VERSION}" \
+            "${context_dir}"
+    done
 done
diff --git a/support/docker/debian-bullseye/Dockerfile b/support/docker/debian-bullseye.base/Dockerfile
similarity index 59%
rename from support/docker/debian-bullseye/Dockerfile
rename to support/docker/debian-bullseye.base/Dockerfile
index f45ff6b0f8..a3e90a79ab 100644
--- a/support/docker/debian-bullseye/Dockerfile
+++ b/support/docker/debian-bullseye.base/Dockerfile
@@ -1,7 +1,5 @@
-# This Dockerfile generates the docker image that gets used by Gitlab CI
-# To build it (YYYYMMDD.HHMM is the current date and time in UTC):
-#   docker build -t registry.gitlab.com/buildroot.org/buildroot/base:YYYYMMDD.HHMM support/docker/debian-stretch
-#   docker push registry.gitlab.com/buildroot.org/buildroot/base:YYYYMMDD.HHMM
+# vi: ft=dockerfile
+# Debian-based minimal image with only mandatory packages
 
 # We use a specific tag for the base image *and* the corresponding date
 # for the repository., so do not forget to update the apt-sources.list
@@ -24,32 +22,14 @@ RUN dpkg --add-architecture i386 && \
 RUN apt-get -o APT::Retries=5 install -y --no-install-recommends \
         bc \
         build-essential \
-        bzr \
         ca-certificates \
-        cmake \
         cpio \
-        cvs \
         file \
         g++-multilib \
         git \
         libc6:i386 \
-        libncurses5-dev \
         locales \
-        mercurial \
-        openssh-server \
-        python3 \
-        python3-flake8 \
-        python3-magic \
-        python3-nose2 \
-        python3-pexpect \
-        python3-pytest \
-        qemu-system-arm \
-        qemu-system-misc \
-        qemu-system-x86 \
         rsync \
-        shellcheck \
-        subversion \
-        sudo \
         unzip \
         wget \
         && \
@@ -61,9 +41,7 @@ RUN sed -i 's/# \(en_US.UTF-8\)/\1/' /etc/locale.gen && \
     /usr/sbin/locale-gen
 
 RUN useradd -ms /bin/bash br-user && \
-    chown -R br-user:br-user /home/br-user && \
-    printf 'br-user ALL=NOPASSWD: /bin/su -\n' >/etc/sudoers.d/br-user && \
-    chmod 0440 /etc/sudoers.d/br-user
+    chown -R br-user:br-user /home/br-user
 
 USER br-user
 WORKDIR /home/br-user
diff --git a/support/docker/debian-bullseye/apt-sources.list b/support/docker/debian-bullseye.base/apt-sources.list
similarity index 100%
rename from support/docker/debian-bullseye/apt-sources.list
rename to support/docker/debian-bullseye.base/apt-sources.list
diff --git a/support/docker/debian-bullseye.ci/Dockerfile b/support/docker/debian-bullseye.ci/Dockerfile
new file mode 100644
index 0000000000..06db62e11f
--- /dev/null
+++ b/support/docker/debian-bullseye.ci/Dockerfile
@@ -0,0 +1,43 @@
+# This Dockerfile generates the docker image that gets used by Gitlab CI
+# To build it (YYYYMMDD.HHMM is the current date and time in UTC):
+#   docker build -t registry.gitlab.com/buildroot.org/buildroot/base:YYYYMMDD.HHMM support/docker/debian-stretch
+#   docker push registry.gitlab.com/buildroot.org/buildroot/base:YYYYMMDD.HHMM
+
+# Based on our reference build image
+ARG BR2_REGISTRY
+ARG BR2_DOCKER_VERSION
+FROM ${BR2_REGISTRY}buildroot/debian-bullseye.base:${BR2_DOCKER_VERSION}
+
+LABEL maintainer="Buildroot mailing list <buildroot@buildroot.org>" \
+      vendor="Buildroot" \
+description="Container with everything needed to run Buildroot"
+
+USER root
+WORKDIR /root
+ENV HOME /root
+
+RUN apt-get -o APT::Retries=5 install -y --no-install-recommends \
+        bzr \
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
+        qemu-system-misc \
+        qemu-system-x86 \
+        shellcheck \
+        subversion \
+        && \
+    apt-get -y autoremove && \
+    apt-get -y clean
+
+USER br-user
+WORKDIR /home/br-user
+ENV HOME /home/br-user
+ENV LC_ALL en_US.UTF-8
diff --git a/support/docker/debian-bullseye.user/Dockerfile b/support/docker/debian-bullseye.user/Dockerfile
new file mode 100644
index 0000000000..72f807b2d5
--- /dev/null
+++ b/support/docker/debian-bullseye.user/Dockerfile
@@ -0,0 +1,32 @@
+# This Dockerfile generates the docker image that can be used by users
+# to get a workign build environment
+# To build it (YYYYMMDD.HHMM is the current date and time in UTC):
+#   docker build -t registry.gitlab.com/buildroot.org/buildroot/base:YYYYMMDD.HHMM support/docker/debian-stretch
+#   docker push registry.gitlab.com/buildroot.org/buildroot/base:YYYYMMDD.HHMM
+
+# Based on our reference build image
+ARG BR2_REGISTRY
+ARG BR2_DOCKER_VERSION
+FROM ${BR2_REGISTRY}buildroot/debian-bullseye.ci:${BR2_DOCKER_VERSION}
+
+LABEL maintainer="Buildroot mailing list <buildroot@buildroot.org>" \
+      vendor="Buildroot" \
+description="Container with everything needed to run Buildroot"
+
+USER root
+WORKDIR /root
+ENV HOME /root
+
+RUN apt-get -o APT::Retries=5 install -y --no-install-recommends \
+        libncurses5-dev \
+        sudo \
+        && \
+    apt-get -y autoremove && \
+    apt-get -y clean && \
+    printf 'br-user ALL=NOPASSWD: /bin/su -\n' >/etc/sudoers.d/br-user && \
+    chmod 0440 /etc/sudoers.d/br-user
+
+USER br-user
+WORKDIR /home/br-user
+ENV HOME /home/br-user
+ENV LC_ALL en_US.UTF-8
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
