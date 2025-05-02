Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8858EC3ABAA
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 11:14:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4BD7842D16;
	Fri,  2 May 2025 11:14:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T6Hl70vWtW8V; Fri,  2 May 2025 11:14:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B73542D1A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B73542D1A;
	Fri,  2 May 2025 11:14:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0309DEE
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:12:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A1F8D41E52
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lp7yYpEEdfa3 for <buildroot@buildroot.org>;
 Fri,  2 May 2025 11:11:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8ADC041743
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8ADC041743
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 845E3864AE; Fri,  2 May 2025 11:11:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 May 2025 12:10:39 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: b562ab494b1bbec8daea3a37bb979dc59f59e080
X-Git-Newrev: 9aeaca3ae67887c3981994aa545506cef6735887
X-Patchwork-Hint: ignore
Message-Id: <20250502111135.845E3864AE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libv4l: disable
 some options when BR2_STATIC_LIBS
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9aeaca3ae67887c3981994aa545506cef6735887
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Since libv4l was bumped to 1.28.1 and converted to use the meson build
system in Buildroot commit 41ce1cc690b0837a1822079317bf317ddaeac17b,
the build started failing on BR2_STATIC_LIBS=y configurations due to
compiling code that isn't compatible with static linking.

This commit fixes that by disabling the plugin code and the wrappers.

Fixes:

  https://autobuild.buildroot.org/results/89c6c7c0fd991d777ac7cd2b2322424099fa89cc/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit cebfadde9ba7b26eaea51448cb425f878eb31885)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libv4l/libv4l.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index e8bcc2bdfc..a535b8e8a6 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -16,6 +16,10 @@ LIBV4L_LDFLAGS = $(TARGET_LDFLAGS)
 LIBV4L_LICENSE = GPL-2.0+ (utilities), LGPL-2.1+ (libraries)
 LIBV4L_LICENSE_FILES = COPYING COPYING.libv4l lib/libv4l1/libv4l1-kernelcode-license.txt
 
+ifeq ($(BR2_STATIC_LIBS),y)
+LIBV4L_CONF_OPTS += -Dv4l-plugins=false -Dv4l-wrappers=false
+endif
+
 ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
 LIBV4L_DEPENDENCIES += alsa-lib
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
