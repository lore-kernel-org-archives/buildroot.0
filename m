Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9914DC3DA60
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 10:14:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66621405F2;
	Mon, 15 Jul 2024 10:14:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wmH3P7wu5k0C; Mon, 15 Jul 2024 10:14:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3548E4061E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3548E4061E;
	Mon, 15 Jul 2024 10:14:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2B8811BF3FF
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 10:14:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2C343405C1
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 10:14:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R2dJdGV_oKqN for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 10:14:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 19342405C4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 19342405C4
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 10:14:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 139E286C42; Mon, 15 Jul 2024 10:14:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Jul 2024 12:13:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 649101f6e65c5345e97229d31f19ea1f8e7b16c4
X-Git-Newrev: 430edbdc8820087a31be9e1c0e8c922753d24021
X-Patchwork-Hint: ignore
Message-Id: <20240715101424.139E286C42@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt5/qt5webengine-chromium: add
 patch fixing a C++ build issue
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1968139815284041943=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1968139815284041943==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=430edbdc8820087a31be9e1c0e8c922753d24021
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Backport a small subset of an upstream patch to fix:

../../3rdparty/chromium/gpu/command_buffer/service/program_manager.cc: In member function ‘std::string gpu::gles2::Program::ProcessLogInfo(const std::string&)’:
../../3rdparty/chromium/gpu/command_buffer/service/program_manager.cc:623:25: error: ‘using re2::StringPiece = class absl::string_view’ {aka ‘class absl::string_view’} has no member named ‘as_string’
  623 |   return output + input.as_string();
      |                         ^~~~~~~~~

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...u-command_buffer-service-program_manager..patch | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/package/qt5/qt5webengine-chromium/0009-chromium-gpu-command_buffer-service-program_manager..patch b/package/qt5/qt5webengine-chromium/0009-chromium-gpu-command_buffer-service-program_manager..patch
new file mode 100644
index 0000000000..4dc8514d37
--- /dev/null
+++ b/package/qt5/qt5webengine-chromium/0009-chromium-gpu-command_buffer-service-program_manager..patch
@@ -0,0 +1,38 @@
+From dbb4ea2d1f410df29eee5a0a06bfb8318b0781dc Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Sat, 13 Jul 2024 18:17:25 +0200
+Subject: [PATCH] chromium/gpu/command_buffer/service/program_manager.cc:
+ StringPiece::as_string() is gone
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fix:
+
+chromium/gpu/command_buffer/service/program_manager.cc:623:25: error: ‘using re2::StringPiece = class absl::string_view’ {aka ‘class absl::string_view’} has no member named ‘as_string’
+
+By taking a small subset of upstream commit
+https://github.com/chromium/chromium/commit/8d7cdb7b45abb2725200cde990d795024b405e79;
+
+Upstream: https://github.com/chromium/chromium/commit/8d7cdb7b45abb2725200cde990d795024b405e79
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ chromium/gpu/command_buffer/service/program_manager.cc | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/chromium/gpu/command_buffer/service/program_manager.cc b/chromium/gpu/command_buffer/service/program_manager.cc
+index 021530c7e39..5fb3e2b768e 100644
+--- a/chromium/gpu/command_buffer/service/program_manager.cc
++++ b/chromium/gpu/command_buffer/service/program_manager.cc
+@@ -620,7 +620,7 @@ std::string Program::ProcessLogInfo(const std::string& log) {
+       output += hashed_name;
+   }
+ 
+-  return output + input.as_string();
++  return output + std::string(input);
+ }
+ 
+ void Program::UpdateLogInfo() {
+-- 
+2.25.1
+

--===============1968139815284041943==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1968139815284041943==--
