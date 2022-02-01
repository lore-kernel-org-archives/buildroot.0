Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C7ADC433EF
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 22:05:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54A22415D0;
	Tue,  1 Feb 2022 22:05:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S66fKDgxWP3P; Tue,  1 Feb 2022 22:05:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 844B241613;
	Tue,  1 Feb 2022 22:05:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D83181BF989
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 22:05:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C574641613
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 22:05:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ONSQHu9rtAHj for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 22:05:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BFE1641594
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 22:05:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id D29E982817; Tue,  1 Feb 2022 21:58:21 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 1 Feb 2022 22:23:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f1768855e73c1c41eed0cad94ec4a5f90c8535bb
X-Git-Newrev: 65f4f119f2db06230bd1c83d2907a08fb23685db
X-Patchwork-Hint: ignore
Message-Id: <20220201215821.D29E982817@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/hiawatha: fix build with gcc 4.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=65f4f119f2db06230bd1c83d2907a08fb23685db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since commit
4e36e8f2081a66f477dd038793082045876d65ee:

/tmp/instance-1/output-1/build/hiawatha-11.1/mbedtls/library/ecjpake.c: In function 'self_test_rng':
/tmp/instance-1/output-1/build/hiawatha-11.1/mbedtls/library/ecjpake.c:973:5: error: 'for' loop initial declarations are only allowed in C99 mode
     for( size_t i = 0; i < len; i++ )
     ^

Fixes:
 - http://autobuild.buildroot.org/results/1befc1552af91f34c600229138910c2078c2fdca

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/hiawatha/hiawatha.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/hiawatha/hiawatha.mk b/package/hiawatha/hiawatha.mk
index 14d3c9f1ee..25da98a43c 100644
--- a/package/hiawatha/hiawatha.mk
+++ b/package/hiawatha/hiawatha.mk
@@ -15,6 +15,7 @@ HIAWATHA_CPE_ID_VENDOR = hiawatha-webserver
 HIAWATHA_CONF_OPTS = \
 	-DINSTALL_MBEDTLS_HEADERS=OFF \
 	-DUSE_SYSTEM_MBEDTLS=OFF \
+	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -std=c99" \
 	-DENABLE_TOOLKIT=OFF \
 	-DCONFIG_DIR=/etc/hiawatha \
 	-DLOG_DIR=/var/log \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
