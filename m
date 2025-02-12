Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD0E7C282D0
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:18:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35CC3501BA;
	Fri, 28 Feb 2025 17:18:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gZ7YStxqcdJ3; Fri, 28 Feb 2025 17:18:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23464500D5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23464500D5;
	Fri, 28 Feb 2025 17:18:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 14B9F711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:46:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B785F45BC3
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ItpkWq9ehgme for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D6B4451C5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6D6B4451C5
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6A81C8780F; Fri, 28 Feb 2025 16:30:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 12 Feb 2025 11:24:30 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 3bc94471ca8a90f331366d9593630952b0e7bb10
X-Git-Newrev: 03b0379426518d50650bbcfaeaff6836ec8e3d8d
X-Patchwork-Hint: ignore
Message-Id: <20250228163039.6A81C8780F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] support/docker/Dockerfile: use
 correct ENV syntax
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

commit: https://git.buildroot.net/buildroot/commit/?id=03b0379426518d50650bbcfaeaff6836ec8e3d8d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

buildx correctly complains about our ENV lines:

3 warnings found (use docker --debug to expand):
- LegacyKeyValueFormat: "ENV key=value" should be used instead of legacy "ENV key value" format (line 21)
- LegacyKeyValueFormat: "ENV key=value" should be used instead of legacy "ENV key value" format (line 94)
- LegacyKeyValueFormat: "ENV key=value" should be used instead of legacy "ENV key value" format (line 95)

The ENV syntax is defined as ENV FOO=BAR, not ENV FOO BAR, so adjust the
Dockerfile to match to get rid of this warning.

https://docs.docker.com/reference/dockerfile/#env

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/docker/Dockerfile | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/support/docker/Dockerfile b/support/docker/Dockerfile
index 93044eb7fd..d0bdc73bbf 100644
--- a/support/docker/Dockerfile
+++ b/support/docker/Dockerfile
@@ -18,7 +18,7 @@ description="Container with everything needed to run Buildroot"
 ARG TAR_VERSION="1.35"
 
 # Setup environment
-ENV DEBIAN_FRONTEND noninteractive
+ENV DEBIAN_FRONTEND=noninteractive
 
 # This repository can be a bit slow at times. Don't panic...
 COPY apt-sources.list /etc/apt/sources.list
@@ -91,5 +91,5 @@ RUN useradd -ms /bin/bash br-user && \
 
 USER br-user
 WORKDIR /home/br-user
-ENV HOME /home/br-user
-ENV LC_ALL en_US.UTF-8
+ENV HOME=/home/br-user
+ENV LC_ALL=en_US.UTF-8
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
