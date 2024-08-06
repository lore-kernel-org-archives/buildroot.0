Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B19FFC49EA1
	for <buildroot@archiver.kernel.org>; Tue,  6 Aug 2024 22:46:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B60660880;
	Tue,  6 Aug 2024 22:46:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Zy_wLnMgRFF; Tue,  6 Aug 2024 22:46:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D7AF2608B4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7AF2608B4;
	Tue,  6 Aug 2024 22:46:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 56BE81BF302
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 22:46:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 451D840343
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 22:46:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CHWHe3mEMaQr for <buildroot@lists.busybox.net>;
 Tue,  6 Aug 2024 22:46:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F5F040457
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0F5F040457
 for <buildroot@buildroot.org>; Tue,  6 Aug 2024 22:46:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0AE9A8438F; Tue,  6 Aug 2024 22:46:15 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 7 Aug 2024 00:43:52 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 295e166502809202a8d6c4459de8c816b28b7777
X-Git-Newrev: fd6410c6f9d9643866b8596eea85acf5e7e1fd2c
X-Patchwork-Hint: ignore
Message-Id: <20240806224615.0AE9A8438F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/kexec: fix link
 error when BR2_OPTIMIZE_0=y
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

commit: https://git.buildroot.net/buildroot/commit/?id=fd6410c6f9d9643866b8596eea85acf5e7e1fd2c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

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
(cherry picked from commit a411588b582ad6a0c8573ec9f59f737473d69bee)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
