Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC0D4C00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 17:03:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4033382443;
	Mon, 15 Aug 2022 17:03:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4033382443
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IdFHurXge6ll; Mon, 15 Aug 2022 17:03:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 242D8823C6;
	Mon, 15 Aug 2022 17:03:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 242D8823C6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 18CAA1BF41C
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 17:02:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E7E33607A4
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 17:02:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7E33607A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WLTKwxLTEcU8 for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 17:02:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 35D43605E8
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 17:02:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 35D43605E8
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 75F328765F; Mon, 15 Aug 2022 16:48:09 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 15 Aug 2022 19:00:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2bf6b0630808f8d195f1b9824492a8b072f2e3e3
X-Git-Newrev: 7fc0c327e67bc95957afb8999dad1a9ee869ec03
X-Patchwork-Hint: ignore
Message-Id: <20220815164809.75F328765F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pulseaudio: fix webrtc build
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

commit: https://git.buildroot.net/buildroot/commit/?id=7fc0c327e67bc95957afb8999dad1a9ee869ec03
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update fourth patch to avoid the following build failure with webrtc
raised since commit a40a516c8ae2e8c11549115e10aa74d98a4fab5d:

../output-1/build/pulseaudio-16.1/src/modules/echo-cancel/meson.build:13:0: ERROR: No host machine compiler for 'src/modules/echo-cancel/webrtc.cc'

That is because we removed the C++ language from the global meson.build.
Add it back to the local meson.build in echo-cancel.

The echo-cancel module is always built, but the echo-cancel meson.build
is only included if webrtc-aec is enabled. We only enable it when
webrtc-audio-processing is selected, and that package depends on C++.
Therefore, it is safe to depend on C++ in the echo-cancel meson.build.

Fixes:
 - http://autobuild.buildroot.org/results/e60d72268667ed57a254d7552fa2d785e2e21726

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../0004-meson.build-fix-build-without-C.patch     | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/package/pulseaudio/0004-meson.build-fix-build-without-C.patch b/package/pulseaudio/0004-meson.build-fix-build-without-C.patch
index e6453d641d..e770927f54 100644
--- a/package/pulseaudio/0004-meson.build-fix-build-without-C.patch
+++ b/package/pulseaudio/0004-meson.build-fix-build-without-C.patch
@@ -1,4 +1,4 @@
-From 9de058e15a4caba4939a864fb7caf67e0164f07e Mon Sep 17 00:00:00 2001
+From ac88536d7c3fde3c22933368296c9029bb67b9fc Mon Sep 17 00:00:00 2001
 From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Date: Mon, 25 Jul 2022 21:49:25 +0200
 Subject: [PATCH] meson.build: fix build without C++
@@ -16,8 +16,9 @@ Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 [Upstream status:
 https://gitlab.freedesktop.org/pulseaudio/pulseaudio/-/merge_requests/737]
 ---
- meson.build | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
+ meson.build                         | 3 ++-
+ src/modules/echo-cancel/meson.build | 2 ++
+ 2 files changed, 4 insertions(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
 index c5135330f..8248f263b 100644
@@ -37,6 +38,19 @@ index c5135330f..8248f263b 100644
    add_project_arguments('--coverage', language: ['c', 'cpp'])
    add_project_link_arguments('--coverage', language: ['c', 'cpp'])
  endif
+diff --git a/src/modules/echo-cancel/meson.build b/src/modules/echo-cancel/meson.build
+index 641cd35e7..3b998364e 100644
+--- a/src/modules/echo-cancel/meson.build
++++ b/src/modules/echo-cancel/meson.build
+@@ -6,6 +6,8 @@
+ # '-Wl,--unresolved-symbols=ignore-in-object-files' otherwise it fails
+ # at link time.
+ 
++add_languages('cpp')
++
+ libwebrtc_util_sources = [
+   'webrtc.cc'
+ ]
 -- 
-2.35.1
+GitLab
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
