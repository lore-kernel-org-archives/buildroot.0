Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36F2BE73158
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 11:46:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2FA4407FC;
	Mon,  2 Feb 2026 11:45:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1iYlRqJhPjui; Mon,  2 Feb 2026 11:45:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C2434099B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770032759;
	bh=ccAZD9D8OTii9BiJEic+NVz+vBQn59hN3IZ1lsoOgkg=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QSda/x3kh7mZQsnF9wrGbS5u7n9jxteG37oTFrWM3y2f5o5QQjSdtu1hE4oemDaed
	 QP8zTzDM/GLyhG5tx5Z1ef5evFO0XNZyrArf6g3DH0sQSy28RWG5uvfvXwuj4zfuWL
	 Oy0FuhkMmp67GvMYxuf/ywKnbzJRxZJRp6KMjzktFzTROpyfMWAYzf+Z9zYaAYG+f8
	 q2Q3Ge7IxQNt5QXBe4Lr/Mp7W5zbQN5FKZQwncNG66gtWe79bBVoGPH0zASNBS7eac
	 h++vq1CrGJp0uCdYb0M0UilGdx45oc5SOhtMVT40jRZxm1pCzhYP60i1sUeTgtMAcZ
	 5iyCNIoKU2T4Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C2434099B;
	Mon,  2 Feb 2026 11:45:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E7161E0
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 11:45:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5233D831A0
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 11:45:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vn1BPKkuHOMe for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 11:45:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A5FB83187
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8A5FB83187
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 11:45:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5E2288630E; Mon,  2 Feb 2026 11:45:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 2 Feb 2026 12:42:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a0081aa1f8c332d5fb6dbb19de9e46cb39be4931
X-Git-Newrev: 3df8b35285cff60e96b4ca5c852c2a07a551197f
X-Patchwork-Hint: ignore
Message-Id: <20260202114557.5E2288630E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgpiod2: enable gpioset
 interactive when libedit is available
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

commit: https://git.buildroot.net/buildroot/commit/?id=3df8b35285cff60e96b4ca5c852c2a07a551197f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libgpiod2/libgpiod2.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libgpiod2/libgpiod2.mk b/package/libgpiod2/libgpiod2.mk
index c5b53f631b..ae3bcfa207 100644
--- a/package/libgpiod2/libgpiod2.mk
+++ b/package/libgpiod2/libgpiod2.mk
@@ -24,6 +24,13 @@ else
 LIBGPIOD2_CONF_OPTS += --disable-tools
 endif
 
+ifeq ($(BR2_PACKAGE_LIBEDIT),y)
+LIBGPIOD2_DEPENDENCIES += libedit
+LIBGPIOD2_CONF_OPTS += --enable-gpioset-interactive
+else
+LIBGPIOD2_CONF_OPTS += --disable-gpioset-interactive
+endif
+
 ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
 LIBGPIOD2_CONF_OPTS += --enable-bindings-cxx
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
