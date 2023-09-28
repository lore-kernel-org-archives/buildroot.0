Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22DFBCE7B10
	for <buildroot@archiver.kernel.org>; Thu, 28 Sep 2023 09:29:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C906540EC1;
	Thu, 28 Sep 2023 09:29:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C906540EC1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oqWGKLfM0cI4; Thu, 28 Sep 2023 09:29:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0531408B9;
	Thu, 28 Sep 2023 09:29:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0531408B9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D5BCC1BF2BD
 for <buildroot@lists.busybox.net>; Thu, 28 Sep 2023 09:28:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB0B842C37
 for <buildroot@lists.busybox.net>; Thu, 28 Sep 2023 09:28:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB0B842C37
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p5gHqfGhHkmv for <buildroot@lists.busybox.net>;
 Thu, 28 Sep 2023 09:28:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 884F742C33
 for <buildroot@buildroot.org>; Thu, 28 Sep 2023 09:28:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 884F742C33
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 75E6082A3A; Thu, 28 Sep 2023 09:28:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 28 Sep 2023 11:26:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: caa0b804a833b387a4c028cee664f6338afece8b
X-Git-Newrev: 54f6e1f81fd7c96d2ce68d48c10407e50778fc0c
X-Patchwork-Hint: ignore
Message-Id: <20230928092844.75E6082A3A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bind: security bump to version
 9.16.44
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=54f6e1f81fd7c96d2ce68d48c10407e50778fc0c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix CVE-2023-3341: The code that processes control channel messages sent
to `named` calls certain functions recursively during packet parsing.
Recursion depth is only limited by the maximum accepted packet size;
depending on the environment, this may cause the packet-parsing code to
run out of available stack memory, causing `named` to terminate
unexpectedly. Since each incoming control channel message is fully
parsed before its contents are authenticated, exploiting this flaw does
not require the attacker to hold a valid RNDC key; only network access
to the control channel's configured TCP port is necessary. This issue
affects BIND 9 versions 9.2.0 through 9.16.43, 9.18.0 through 9.18.18,
9.19.0 through 9.19.16, 9.9.3-S1 through 9.16.43-S1, and 9.18.0-S1
through 9.18.18-S1.

https://ftp.isc.org/isc/bind9/9.16.44/CHANGES

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bind/bind.hash | 4 ++--
 package/bind/bind.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index a8c15f2a12..d500b61128 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,4 +1,4 @@
-# Verified from https://ftp.isc.org/isc/bind9/9.16.42/bind-9.16.42.tar.xz.asc
+# Verified from https://ftp.isc.org/isc/bind9/9.16.44/bind-9.16.44.tar.xz.asc
 # with key AADBBA5074F1402F7B69D56BC5B4EE931A9F9DFD
-sha256  a8b51c6bfdf3ab6885102f764c2418e037897b7ea46a09f8f07876fa11a6c0b3  bind-9.16.42.tar.xz
+sha256  cfaa953c36d5ca42d9584fcf9653d07c85527b59687e7c4d4cb8071272db6754  bind-9.16.44.tar.xz
 sha256  13491a682dc0f5ee2273cebd3949e2be62f9470fe659419a03a308d4f444773b  COPYRIGHT
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 618b5b9278..03ffcbec42 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.16.42
+BIND_VERSION = 9.16.44
 BIND_SOURCE= bind-$(BIND_VERSION).tar.xz
 BIND_SITE = https://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 # bind does not support parallel builds.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
