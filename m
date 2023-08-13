Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94E54C001B0
	for <buildroot@archiver.kernel.org>; Sun, 13 Aug 2023 17:44:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1175481429;
	Sun, 13 Aug 2023 17:44:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1175481429
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ug168-lb9gsf; Sun, 13 Aug 2023 17:44:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5642C813C0;
	Sun, 13 Aug 2023 17:44:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5642C813C0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 92F1C1BF414
 for <buildroot@lists.busybox.net>; Sun, 13 Aug 2023 17:44:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 79C5E400C8
 for <buildroot@lists.busybox.net>; Sun, 13 Aug 2023 17:44:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 79C5E400C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0LpsV2C0oDgP for <buildroot@lists.busybox.net>;
 Sun, 13 Aug 2023 17:44:01 +0000 (UTC)
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 616C9400BF
 for <buildroot@buildroot.org>; Sun, 13 Aug 2023 17:44:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 616C9400BF
Received: by helium.openadk.org (Postfix, from userid 1000)
 id E18133520C2A; Sun, 13 Aug 2023 19:43:58 +0200 (CEST)
Date: Sun, 13 Aug 2023 19:43:58 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZNkWXvyVT1DnVHG0@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-21-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1691948638; bh=EraHRdqTqWV79JImdZkSEmYiVZXyfTlPV1rKdAg0oVM=;
 h=Date:From:To:Subject:From;
 b=ViqyyQQAri4n4tGDI/Hzub2u1xsBqHZMRQXRjSFH0Fcor8wU3SSXlNTJljQDgrdyd
 oPijB0IgtaHa7FUaa0O9ZixXPqYv4TCKNwWT81QKxf1LObWi56Vo0+d4qzMbKawWc2
 cqvzXCBX9hhLtwRe4iTupV9N2EAuMuUFz1vy8I/vGgvbFFJl9JuhV6VVPy6NN6puHe
 c7MzdxZqB+d8q9+rGJ2xAZVfUKawqfxeG0XwfuSALD+eTHNuK9Qm8sYjbSxooz3STn
 EviSWmYDnEzWAJ9qjcBoB7Xt9VpSRdgF73ujcWEwwWk04mdp1Xuhg243JzEw62CrEw
 z2/nq8gNHfBYg==
Subject: [Buildroot] [PATCH] package/ntpsec: fix compile issue for some
 toolchains
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ntpsec unconditionally uses PIE to compile code.
This breaks compilation for at least microblaze-uclibc and
m68k-uclibc toolchains.

It would be better to add a configure option to allow to disable pie support,
but this is something for an waf expert.

When accepted, should be backported to older releases of Buildroot.

Fixes:
 - http://autobuild.buildroot.net/results/77f/77f4e4065874d022a2ae98d82508242f551e224c
 - http://autobuild.buildroot.net/results/e45/e45b65f2aa323df075d54ff43b0401b5ac7c6eb5

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/ntpsec/0003-disable-PIE-support.patch | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 package/ntpsec/0003-disable-PIE-support.patch

diff --git a/package/ntpsec/0003-disable-PIE-support.patch b/package/ntpsec/0003-disable-PIE-support.patch
new file mode 100644
index 0000000000..64eb559de0
--- /dev/null
+++ b/package/ntpsec/0003-disable-PIE-support.patch
@@ -0,0 +1,26 @@
+From 712675fbd2a736df817fecd7bfb39055946ef85b Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Sun, 13 Aug 2023 13:48:03 +0200
+Subject: [PATCH] disable PIE support
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+Upstream: N/A Not upstreamable
+---
+ wscript | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/wscript b/wscript
+index 292e3a45b..105c7eac2 100644
+--- a/wscript
++++ b/wscript
+@@ -299,7 +299,6 @@ def configure(ctx):
+ 
+     cc_test_flags = [
+         ('PIC', '-fPIC'),
+-        ('PIE', '-pie -fPIE'),
+         # this quiets most of macOS warnings on -fpie
+         ('unused', '-Qunused-arguments'),
+         # This is a useless warning on any architecture with a barrel
+-- 
+2.39.2
+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
