Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD963EE49A5
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 20:18:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8963B40C6C;
	Mon, 21 Aug 2023 20:18:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8963B40C6C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WkrAnaIRHA5H; Mon, 21 Aug 2023 20:18:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CC75340C43;
	Mon, 21 Aug 2023 20:18:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC75340C43
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A04761BF8B4
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 20:02:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BB1D041525
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 20:01:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB1D041525
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lzT3qNQv4bmx for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 20:01:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4E79B409F4
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 20:01:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E79B409F4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 46A1D86025; Mon, 21 Aug 2023 20:01:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 12 Aug 2023 14:33:59 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 61f79aa13d7ba84cfa720ad9565fc12d60b56000
X-Git-Newrev: 35749826b407d2f742ae79971dbd10811a335ef1
X-Patchwork-Hint: ignore
Message-Id: <20230821200126.46A1D86025@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/e2fsprogs: fix compile
 error for SH
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

commit: https://git.buildroot.net/buildroot/commit/?id=35749826b407d2f742ae79971dbd10811a335ef1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Compile of e2fsprogs is failing because of gcc bug
111001. Workaround it by forcing the usage of -Os.

Compile fails with:
	CC rw_bitmaps.c
terminate called after throwing an instance of 'std::bad_alloc'
  what():  std::bad_alloc
during RTL pass: sh_treg_combine2
rw_bitmaps.c: In function 'read_bitmaps_range_start':
rw_bitmaps.c:447:1: internal compiler error: Aborted
  447 | }
      | ^
0x5e7a6f ???
	../sysdeps/aarch64/start.S:81
Please submit a full bug report, with preprocessed source (by using -freport-bug).
Please include the complete backtrace with any bug report.
See <http://bugs.buildroot.net/> for instructions.

No need to backport, because gcc 13.2.0 was introduced recently in
Buildroot commit: 3009095ba8a87a22f55f6b89e42f667487563b94

Fixes:
 - http://autobuild.buildroot.net/results/fb7/fb7e9c8b02b979b3a75185c0afa4ab0ca654f6f6
 - http://autobuild.buildroot.net/results/659/659313b1783db491653bcc85b37da40c7b077225

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/e2fsprogs/e2fsprogs.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index 75214be8c7..80090621bf 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -70,6 +70,11 @@ ifeq ($(BR2_nios2),y)
 E2FSPROGS_CONF_ENV += ac_cv_func_fallocate=no
 endif
 
+# workaround gcc bug 111001
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_111001),y)
+E2FSPROGS_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -Os"
+endif
+
 E2FSPROGS_CONF_ENV += ac_cv_path_LDCONFIG=true
 
 HOST_E2FSPROGS_CONF_ENV += ac_cv_path_LDCONFIG=true
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
