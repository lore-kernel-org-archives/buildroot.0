Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F194C25B10
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 21:19:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6657041FA9;
	Thu,  9 May 2024 21:19:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 42OlelZOSOfa; Thu,  9 May 2024 21:19:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1038941FAA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1038941FAA;
	Thu,  9 May 2024 21:19:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 795371BF427
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 21:19:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 63B8381749
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 21:19:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HBxE18UUCUHK for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 21:19:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9724E81587
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9724E81587
 for <buildroot@buildroot.org>; Thu,  9 May 2024 21:19:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8FA8A86DF5; Thu,  9 May 2024 21:19:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 May 2024 23:19:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 21335682a1a8a2033047ffe59012c5946a1be9bd
X-Git-Newrev: 2cf2491a23e70dd38f037726551ed6df7a9ac340
X-Patchwork-Hint: ignore
Message-Id: <20240509211934.8FA8A86DF5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mariadb: really use system fmt
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2cf2491a23e70dd38f037726551ed6df7a9ac340
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 821f9dee8112dc02fe58d60273d0dfdabbc46d1f wrongly used WITH_FMT
instead of WITH_LIBFMT resulting in the following build failure:

[  0%] Creating directories for 'libfmt'
[  0%] Performing download step (download, verify and extract) for 'libfmt'
make[3]: Leaving directory '/home/buildroot/autobuild/run/instance-0/output-1/build/mariadb-10.11.6'
make[3]: Leaving directory '/home/buildroot/autobuild/run/instance-0/output-1/build/mariadb-10.11.6'
-- Downloading...
   dst='/home/buildroot/autobuild/run/instance-0/output-1/build/mariadb-10.11.6/extra/libfmt/src/8.0.1.zip'
   timeout='none'
   inactivity timeout='none'
-- Using src='https://github.com/fmtlib/fmt/archive/refs/tags/8.0.1.zip'
CMake Error at libfmt-stamp/download-libfmt.cmake:170 (message):
  Each download failed!

    error: downloading 'https://github.com/fmtlib/fmt/archive/refs/tags/8.0.1.zip' failed
          status_code: 1
          status_string: "Unsupported protocol"
          log:
          --- LOG BEGIN ---
          Protocol "https" not supported or disabled in libcurl

  Closing connection

          --- LOG END ---

Fixes: 821f9dee8112dc02fe58d60273d0dfdabbc46d1f
 - http://autobuild.buildroot.org/results/fbe3bc347a83a810ffbbbff93a45994963712bee

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mariadb/mariadb.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
index 8641437d4d..1dcf6568da 100644
--- a/package/mariadb/mariadb.mk
+++ b/package/mariadb/mariadb.mk
@@ -26,7 +26,7 @@ MARIADB_DEPENDENCIES = \
 	libxml2
 
 MARIADB_CONF_OPTS += \
-	-DWITH_FMT=system \
+	-DWITH_LIBFMT=system \
 	-DWITH_PCRE=system
 
 # use bundled GPL-2.0+ licensed readline as package/readline is GPL-3.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
