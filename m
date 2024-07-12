Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCEC4C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 06:46:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 646C6409F2;
	Fri, 12 Jul 2024 06:46:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GYU4zr5ezxWB; Fri, 12 Jul 2024 06:46:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E7D67400FE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E7D67400FE;
	Fri, 12 Jul 2024 06:46:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6E19C1BF591
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 06:46:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5B98360ABC
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 06:46:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sHXOH20ReUN8 for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 06:46:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7CCD660A99
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7CCD660A99
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 06:46:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 704388465A; Fri, 12 Jul 2024 06:46:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 08:45:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b2aa09a492cf0b1b481b754dcc5f0168a039bd3c
X-Git-Newrev: e8efe3df48b2e7d3216162128fe67c58cbf02324
X-Patchwork-Hint: ignore
Message-Id: <20240712064606.704388465A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mpd: fix build with fmt 11
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
Content-Type: multipart/mixed; boundary="===============7955592958493542433=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7955592958493542433==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=e8efe3df48b2e7d3216162128fe67c58cbf02324
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since commit 6b86f07 (package/fmt: bump to version 11.0.1), mpd fails to build:

/home/data/buildroot.x86_64/host/x86_64-buildroot-linux-uclibc/sysroot/usr/include/fmt/base.h:1392:29: error: passing ‘const fmt::v11::formatter<std::__exception_ptr::exception_ptr>’ as ‘this’ argument discards qualifiers [-fpermissive]
 1392 |     ctx.advance_to(cf.format(*static_cast<qualified_type*>(arg), ctx));
      |                    ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../src/Log.cxx:5:
../src/lib/fmt/ExceptionFormatter.hxx:15:14: note:   in call to ‘auto fmt::v11::formatter<std::__exception_ptr::exception_ptr>::format(std::__exception_ptr::exception_ptr, FormatContext&) [with FormatContext = fmt::v11::context]’
   15 |         auto format(std::exception_ptr e, FormatContext &ctx) {
      |              ^~~~~~

Adapt an upstream change to restore mpd compatibility with fmt 11.

Fixes:
	http://autobuild.buildroot.net/results/73514ea76a5960f59b4c50e2074571b10e4682d4
	http://autobuild.buildroot.net/results/a58ddbdfe35bd19021e65db0b8b8cc4c1c884d51

Signed-off-by: Andreas Ziegler <br015@umbiko.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-lib-fmt-support-build-with-libfmt-11.0.0.patch | 93 ++++++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/package/mpd/0002-lib-fmt-support-build-with-libfmt-11.0.0.patch b/package/mpd/0002-lib-fmt-support-build-with-libfmt-11.0.0.patch
new file mode 100644
index 0000000000..e0a361fee2
--- /dev/null
+++ b/package/mpd/0002-lib-fmt-support-build-with-libfmt-11.0.0.patch
@@ -0,0 +1,93 @@
+From 1402869715e3efca87942d79c3173a6b21a6925d Mon Sep 17 00:00:00 2001
+From: Rudi Heitbaum <rudi@heitbaum.com>
+Date: Fri, 5 Jul 2024 14:27:45 +0000
+Subject: [PATCH] lib/fmt: support build with libfmt-11.0.0
+
+Upstream libfmt commit fmtlib/fmt@d707292
+now requires the format function to be const.
+
+Adjust the function prototype so it is const and can compile.
+
+Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
+
+Context: https://github.com/MusicPlayerDaemon/MPD/issues/2071
+Pull request: https://github.com/MusicPlayerDaemon/MPD/pull/2069
+
+Fixes: http://autobuild.buildroot.net/results/73514ea76a5960f59b4c50e2074571b10e4682d4
+Fixes: http://autobuild.buildroot.net/results/a58ddbdfe35bd19021e65db0b8b8cc4c1c884d51
+
+Rebase for mpd-0.23.15
+
+Upstream: https://github.com/MusicPlayerDaemon/MPD/commit/3648475f871c33daa9e598c102a16e5a1a4d4dfc
+Signed-off-by: Andreas Ziegler <br015@umbiko.net>
+---
+ src/lib/ffmpeg/LibFmt.hxx            | 2 +-
+ src/lib/fmt/AudioFormatFormatter.hxx | 4 ++--
+ src/lib/fmt/ExceptionFormatter.hxx   | 2 +-
+ src/lib/fmt/PathFormatter.hxx        | 2 +-
+ 4 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/src/lib/ffmpeg/LibFmt.hxx b/src/lib/ffmpeg/LibFmt.hxx
+index aa068711f..dee83ed2d 100644
+--- a/src/lib/ffmpeg/LibFmt.hxx
++++ b/src/lib/ffmpeg/LibFmt.hxx
+@@ -29,7 +29,7 @@
+ struct fmt::formatter<AVSampleFormat> : formatter<string_view>
+ {
+ 	template<typename FormatContext>
+-	auto format(const AVSampleFormat format, FormatContext &ctx) {
++	auto format(const AVSampleFormat format, FormatContext &ctx) const {
+ 		const char *name = av_get_sample_fmt_name(format);
+ 		if (name == nullptr)
+ 			name = "?";
+diff --git a/src/lib/fmt/AudioFormatFormatter.hxx b/src/lib/fmt/AudioFormatFormatter.hxx
+index e0ffb6216..8da98efd4 100644
+--- a/src/lib/fmt/AudioFormatFormatter.hxx
++++ b/src/lib/fmt/AudioFormatFormatter.hxx
+@@ -39,7 +39,7 @@
+ struct fmt::formatter<SampleFormat> : formatter<string_view>
+ {
+ 	template<typename FormatContext>
+-	auto format(const SampleFormat format, FormatContext &ctx) {
++	auto format(const SampleFormat format, FormatContext &ctx) const {
+ 		return formatter<string_view>::format(sample_format_to_string(format),
+ 						      ctx);
+ 	}
+@@ -49,7 +49,7 @@
+ struct fmt::formatter<AudioFormat> : formatter<string_view>
+ {
+ 	template<typename FormatContext>
+-	auto format(const AudioFormat &af, FormatContext &ctx) {
++	auto format(const AudioFormat &af, FormatContext &ctx) const {
+ 		return formatter<string_view>::format(ToString(af).c_str(),
+ 						      ctx);
+ 	}
+diff --git a/src/lib/fmt/ExceptionFormatter.hxx b/src/lib/fmt/ExceptionFormatter.hxx
+index 3f342df67..f08b3bb22 100644
+--- a/src/lib/fmt/ExceptionFormatter.hxx
++++ b/src/lib/fmt/ExceptionFormatter.hxx
+@@ -38,7 +38,7 @@
+ struct fmt::formatter<std::exception_ptr> : formatter<string_view>
+ {
+ 	template<typename FormatContext>
+-	auto format(std::exception_ptr e, FormatContext &ctx) {
++	auto format(std::exception_ptr e, FormatContext &ctx) const {
+ 		return formatter<string_view>::format(GetFullMessage(e), ctx);
+ 	}
+ };
+diff --git a/src/lib/fmt/PathFormatter.hxx b/src/lib/fmt/PathFormatter.hxx
+index e5ae89dec..add06df81 100644
+--- a/src/lib/fmt/PathFormatter.hxx
++++ b/src/lib/fmt/PathFormatter.hxx
+@@ -29,7 +29,7 @@
+ struct fmt::formatter<Path> : formatter<string_view>
+ {
+ 	template<typename FormatContext>
+-	auto format(Path path, FormatContext &ctx) {
++	auto format(Path path, FormatContext &ctx) const {
+ 		return formatter<string_view>::format(path.ToUTF8(), ctx);
+ 	}
+ };
+-- 
+2.43.0
+

--===============7955592958493542433==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7955592958493542433==--
