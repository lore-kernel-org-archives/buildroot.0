Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B816EC61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 00:56:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7189D610D3;
	Tue, 21 Feb 2023 00:56:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7189D610D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D_SXMnoRKVQG; Tue, 21 Feb 2023 00:56:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D3C3610B2;
	Tue, 21 Feb 2023 00:56:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D3C3610B2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5393E1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:01:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 85A6541819
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:53:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 85A6541819
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LliPs15LV6qJ for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:53:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C44C64181C
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:53:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C44C64181C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C045C8648F; Mon, 20 Feb 2023 20:53:00 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 15 Feb 2023 22:23:17 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c3a1f0fe1b912727bb7b5baebe938f75036e566b
X-Git-Newrev: 854314d15361dc3b69b97ee29d483ee920b9098f
X-Patchwork-Hint: ignore
Message-Id: <20230220205300.C045C8648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/pipewire:
 compress-offload needs kernel >= 5.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=854314d15361dc3b69b97ee29d483ee920b9098f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

SND_AUDIOCODEC_A{LAC,PE} are only available since kernel 5.7 and
https://github.com/torvalds/linux/commit/0f546d6f0292fb624b4cf0cc70096ddb9ea070e6
resulting in the following build failure since bump to version 0.3.65
in commit 247e2d0eb1e60f483044d58bed58c5ed321528f7 and
https://git.buildroot.net/buildroot/commit/?id=247e2d0eb1e60f483044d58bed58c5ed321528f7:

../spa/plugins/alsa/alsa-compress-offload-sink.c:183:11: error: 'SND_AUDIOCODEC_ALAC' undeclared here (not in a function); did you mean 'SND_AUDIOCODEC_AAC'?
  183 |         { SND_AUDIOCODEC_ALAC, },
      |           ^~~~~~~~~~~~~~~~~~~
      |           SND_AUDIOCODEC_AAC

Moreover, flac_d is also only available since kernel 5.5 and
https://github.com/torvalds/linux/commit/d2522335c92c090bf58531a2b696d7fe80ab2a7a

Take this opportunity to make compress offload an explicit option rather
than automatic based on the availability of tinycompress. The
relationship between them is not obvious.

Fixes:
 - http://autobuild.buildroot.org/results/9ecd9aca5edc3756154da59573157954f06e6537

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/pipewire/Config.in   | 12 ++++++++++++
 package/pipewire/pipewire.mk |  2 +-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/package/pipewire/Config.in b/package/pipewire/Config.in
index f038291e87..4929e5d3d1 100644
--- a/package/pipewire/Config.in
+++ b/package/pipewire/Config.in
@@ -15,6 +15,18 @@ config BR2_PACKAGE_PIPEWIRE
 
 if BR2_PACKAGE_PIPEWIRE
 
+config BR2_PACKAGE_PIPEWIRE_COMPRESS_OFFLOAD
+	bool "pipewire Compress-Offload"
+	depends on !BR2_STATIC_LIBS # tinycompress
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_7
+	select BR2_PACKAGE_TINYCOMPRESS
+	help
+	  Enable ALSA Compress-Offload support
+
+comment "pipewire Compress-Offload needs a toolchain w/ dynamic library, headers >= 5.7"
+	depends on BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_7
+
 config BR2_PACKAGE_PIPEWIRE_EXAMPLES
 	bool "pipewire examples"
 	help
diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
index 976d7783b9..ecf4a035ec 100644
--- a/package/pipewire/pipewire.mk
+++ b/package/pipewire/pipewire.mk
@@ -215,7 +215,7 @@ else
 PIPEWIRE_CONF_OPTS += -Dsdl2=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_TINYCOMPRESS),y)
+ifeq ($(BR2_PACKAGE_PIPEWIRE_COMPRESS_OFFLOAD),y)
 PIPEWIRE_CONF_OPTS += -Dcompress-offload=enabled
 PIPEWIRE_DEPENDENCIES += tinycompress
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
