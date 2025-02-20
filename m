Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D1E1C282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:21:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA09883F12;
	Fri, 28 Feb 2025 17:21:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JDysHzFxLnJc; Fri, 28 Feb 2025 17:21:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0F9785EC5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0F9785EC5;
	Fri, 28 Feb 2025 17:21:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F4FE1DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:47:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F02944710A
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:32:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DysiIWe_ShcO for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:32:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7C1647141
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D7C1647141
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D05BA87A74; Fri, 28 Feb 2025 16:30:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 20 Feb 2025 20:15:15 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ea30149c13cecbca986526a21bda73ec98067247
X-Git-Newrev: 9f7fb952866fe855bcc7a614cdc5f5f6d18f51d7
X-Patchwork-Hint: ignore
Message-Id: <20250228163044.D05BA87A74@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] support/docker/Dockerfile: fix
 typo in tar configure options
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

commit: https://git.buildroot.net/buildroot/commit/?id=9f7fb952866fe855bcc7a614cdc5f5f6d18f51d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Commit 12e9fc1da5d4 ("support/docker: add tar 1.35") added logic to download
and build tar for the host, but mistyped a configure option:

configure: WARNING: unrecognized options: --disable-year2028

Fix that.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/docker/Dockerfile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/docker/Dockerfile b/support/docker/Dockerfile
index 12d3fe024c..e7677ac6a9 100644
--- a/support/docker/Dockerfile
+++ b/support/docker/Dockerfile
@@ -80,7 +80,7 @@ RUN curl -sfL https://ftpmirror.gnu.org/tar/tar-${TAR_VERSION}.tar.xz | \
     tar -Jx -C /tmp && \
     cd /tmp/tar-${TAR_VERSION} && \
     FORCE_UNSAFE_CONFIGURE=1 ./configure \
-        --disable-year2028 && \
+        --disable-year2038 && \
     make && \
     make install && \
     rm -rf /tmp/tar-${TAR_VERSION}
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
