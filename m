Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61702C02198
	for <buildroot@archiver.kernel.org>; Wed, 12 Feb 2025 12:33:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C597E40109;
	Wed, 12 Feb 2025 12:33:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u-XstUUhD2gH; Wed, 12 Feb 2025 12:33:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 816F84010F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 816F84010F;
	Wed, 12 Feb 2025 12:33:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D1D921C9
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 12:33:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B5C3A84736
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 12:33:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UoSyYZb3YiAH for <buildroot@buildroot.org>;
 Wed, 12 Feb 2025 12:33:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF3F484737
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AF3F484737
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 12:33:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A420B8756C; Wed, 12 Feb 2025 12:33:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 12 Feb 2025 11:08:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: abd20d7a27fb2fc0a7bd9d8ccd515485da742133
X-Git-Newrev: 3bc94471ca8a90f331366d9593630952b0e7bb10
X-Patchwork-Hint: ignore
Message-Id: <20250212123324.A420B8756C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/docker: prepare for Aarch64 Docker
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3bc94471ca8a90f331366d9593630952b0e7bb10
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
