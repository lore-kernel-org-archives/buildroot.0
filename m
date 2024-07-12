Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54348C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 19:53:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 19F6380B0A;
	Fri, 12 Jul 2024 19:53:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p9z3P28iMPOb; Fri, 12 Jul 2024 19:53:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B4078471C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B4078471C;
	Fri, 12 Jul 2024 19:53:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 163DE1BF279
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 19:53:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0F555840E5
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 19:53:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FAeCvR0S6ewU for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 19:53:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C54C84198
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C54C84198
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 19:53:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 10DFB86168; Fri, 12 Jul 2024 19:53:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 21:52:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3149532ff14c6b5d4e00e9458a39daae60b07fca
X-Git-Newrev: a411588b582ad6a0c8573ec9f59f737473d69bee
X-Patchwork-Hint: ignore
Message-Id: <20240712195345.10DFB86168@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kexec: fix link error when
 BR2_OPTIMIZE_0=y
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a411588b582ad6a0c8573ec9f59f737473d69bee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When BR2_OPTIMIZE_0, -O0 is passed in compiler CFLAGS. This means no
code optimization will be performed.

kexec code uses a trick to detect unaligned accesses at link time
which needs at least dead-code-removal to work. See
put/get_unaligned() macros in kexec/kexec.h. This code was re-enabled
in upstream commit [1].

This commit sets at least -O1 (which include the sufficient
dead-code-removal) when BR2_OPTIMIZE_0=y, to fix those issues.

Fixes:
- http://autobuild.buildroot.org/results/8f8/8f8532f1dfbd71e52c51c00118934af9fa45e7cb
- http://autobuild.buildroot.org/results/528/528fd7baf9b0ad5549d22ec8e0623c5fa1f2d117
- http://autobuild.buildroot.org/results/499/499115439680adfb4b40042468e5bbb65d91ce6c
- ...and many others

[1] https://git.kernel.org/pub/scm/utils/kernel/kexec/kexec-tools.git/commit/?id=0723defb5308ac7fce296f8b596bff4df6803f01

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/kexec/kexec.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/kexec/kexec.mk b/package/kexec/kexec.mk
index df14b2d711..1fd8c0f0ab 100644
--- a/package/kexec/kexec.mk
+++ b/package/kexec/kexec.mk
@@ -16,6 +16,14 @@ KEXEC_SELINUX_MODULES = kdump
 # Makefile expects $STRIP -o to work, so needed for !BR2_STRIP_strip
 KEXEC_MAKE_OPTS = STRIP="$(TARGET_CROSS)strip"
 
+# kexec requires at least -O1 optimization level. Its code uses a
+# trick to detect unaligned accesses at link time which needs at least
+# dead-code-removal to work. See put/get_unaligned() macros in
+# kexec/kexec.h
+ifeq ($(BR2_OPTIMIZE_0),y)
+KEXEC_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -O1"
+endif
+
 ifeq ($(BR2_PACKAGE_KEXEC_ZLIB),y)
 KEXEC_CONF_OPTS += --with-zlib
 KEXEC_DEPENDENCIES += zlib
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
