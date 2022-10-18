Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9B3AC433FE
	for <buildroot@archiver.kernel.org>; Tue, 18 Oct 2022 19:49:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52F0583EE0;
	Tue, 18 Oct 2022 19:49:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 52F0583EE0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MKLTVnR7CJwx; Tue, 18 Oct 2022 19:49:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 855B983F0F;
	Tue, 18 Oct 2022 19:49:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 855B983F0F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0A90B1BF95F
 for <buildroot@lists.busybox.net>; Tue, 18 Oct 2022 19:49:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D91374190F
 for <buildroot@lists.busybox.net>; Tue, 18 Oct 2022 19:49:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D91374190F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jW44s7AKX_qf for <buildroot@lists.busybox.net>;
 Tue, 18 Oct 2022 19:49:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C485E4190B
 for <buildroot@buildroot.org>; Tue, 18 Oct 2022 19:49:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C485E4190B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B10A486EBE; Tue, 18 Oct 2022 19:49:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 18 Oct 2022 21:47:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2b564a8ccf8016d4c3c285702b37192abe0852e4
X-Git-Newrev: 85a9a3f0e644556b0cd8f2126c6efa5d32695704
X-Patchwork-Hint: ignore
Message-Id: <20221018194944.B10A486EBE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gesftpserver: fix build with gcc
 4.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=85a9a3f0e644556b0cd8f2126c6efa5d32695704
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with gcc 4.8 raised since bump to
version 2 in commit 026265bf7e09e0348aefa79e7a1f32add925f23b and
https://github.com/ewxrjk/sftpserver/commit/dbbf0d45425a72a790d25b889ca2cfa909aaaadf:

In file included from alloc.c:25:0:
utils.h:204:48: error: expected ';', ',' or ')' before 'dest'
 static inline void *sftp_memcpy(void *restrict dest, const void *restrict src,
                                                ^

Fixes:
 - http://autobuild.buildroot.org/results/2795213c07c4a961cee0ae7a4e7cccb8bcd6f68e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gesftpserver/gesftpserver.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/gesftpserver/gesftpserver.mk b/package/gesftpserver/gesftpserver.mk
index b47ec1c5d3..5a3ab0536c 100644
--- a/package/gesftpserver/gesftpserver.mk
+++ b/package/gesftpserver/gesftpserver.mk
@@ -16,7 +16,9 @@ GESFTPSERVER_CPE_ID_VENDOR = green_end
 GESFTPSERVER_CPE_ID_PRODUCT = sftpserver
 
 # forgets to link against pthread when cross compiling
-GESFTPSERVER_CONF_ENV = LIBS=-lpthread
+GESFTPSERVER_CONF_ENV = \
+	CFLAGS="$(TARGET_CFLAGS) -std=c99" \
+	LIBS=-lpthread
 
 # overwrite openssh version if enabled
 GESFTPSERVER_DEPENDENCIES += \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
