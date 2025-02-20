Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14B94C021B2
	for <buildroot@archiver.kernel.org>; Thu, 20 Feb 2025 19:17:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9DA483F8E;
	Thu, 20 Feb 2025 19:17:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8F1LM5ZgqMT8; Thu, 20 Feb 2025 19:17:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EAD9184001
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EAD9184001;
	Thu, 20 Feb 2025 19:17:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 650B9194
 for <buildroot@buildroot.org>; Thu, 20 Feb 2025 19:17:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 49B9A60BB3
 for <buildroot@buildroot.org>; Thu, 20 Feb 2025 19:17:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j_CA4zTI0Wt4 for <buildroot@buildroot.org>;
 Thu, 20 Feb 2025 19:17:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8022860746
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8022860746
 for <buildroot@buildroot.org>; Thu, 20 Feb 2025 19:17:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 76A2E87936; Thu, 20 Feb 2025 19:17:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 20 Feb 2025 20:15:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 002931cc3a4cec7528c918311a869198b547ef24
X-Git-Newrev: ea30149c13cecbca986526a21bda73ec98067247
X-Patchwork-Hint: ignore
Message-Id: <20250220191724.76A2E87936@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/docker/Dockerfile: unbreak 32bit
 support for x86-64
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

commit: https://git.buildroot.net/buildroot/commit/?id=ea30149c13cecbca986526a21bda73ec98067247
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes ttps://gitlab.com/buildroot.org/buildroot/-/jobs/9153298207

Commit 3bc94471ca8a ("support/docker: prepare for Aarch64 Docker images")
reworked the Dockerfile to only add the 32bit support when building for
x86-64, but it forgot to add a TARGETPLATFORM argument so the conditionals
never triggers.

Fix it by adding a TARGETPLATFORM argument as explained here:
https://forums.docker.com/t/build-multi-arch-images-with-different-commands-per-architecture-in-docker-file/134795

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/docker/Dockerfile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/support/docker/Dockerfile b/support/docker/Dockerfile
index d0bdc73bbf..12d3fe024c 100644
--- a/support/docker/Dockerfile
+++ b/support/docker/Dockerfile
@@ -14,6 +14,9 @@ LABEL maintainer="Buildroot mailing list <buildroot@buildroot.org>" \
       vendor="Buildroot" \
 description="Container with everything needed to run Buildroot"
 
+# Architecture to build for
+ARG TARGETPLATFORM
+
 # We need tar >= 1.35
 ARG TAR_VERSION="1.35"
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
