Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0F24C433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 22:36:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 772E1814B7;
	Sat,  8 Jan 2022 22:36:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m5FvHJFqqMrk; Sat,  8 Jan 2022 22:36:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CBB7381497;
	Sat,  8 Jan 2022 22:36:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 78E1A1BF3D2
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 22:36:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6E0614025D
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 22:36:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dbhM6fPlmPxw for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 22:36:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6DA5740185
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 22:36:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 3E50A832C8; Sat,  8 Jan 2022 22:29:49 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jan 2022 23:35:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d9437db2720c64b55d67178fc678f7bf8e6c5fd0
X-Git-Newrev: 8ccff780f49a24f01c44d31f4fe3bc1ea0a36d5c
X-Patchwork-Hint: ignore
Message-Id: <20220108222949.3E50A832C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/download/helpers: use tar xzf in
 post_process_unpack()
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

commit: https://git.buildroot.net/buildroot/commit/?id=8ccff780f49a24f01c44d31f4fe3bc1ea0a36d5c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For now, the download post-process logic uses mk_tar_gz, which repacks
a tarball compressed with gzip. So we can only accept as input a
tarball also compressed with gzip. To enforce that, this commit
changes post_process_unpack() to use tar xzf. This makes sure that if
a tarball compressed with something else than gzip gets used, it will
bail out and we will notice.

Support for other compression schemes can be added later on.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/download/helpers | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/download/helpers b/support/download/helpers
index 4c5eb466cc..ab31e27a69 100755
--- a/support/download/helpers
+++ b/support/download/helpers
@@ -78,7 +78,7 @@ post_process_unpack() {
     local one_file
 
     mkdir "${dest}"
-    tar -C "${dest}" --strip-components=1 -xf "${tarball}"
+    tar -C "${dest}" --strip-components=1 -xzf "${tarball}"
     one_file="$(find "${dest}" -type f -print0 |LC_ALL=C sort -z |head -z -n1 |tr -d "\0")"
     touch -r "${one_file}" "${dest}.timestamp"
 }
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
