Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A94AD0D151
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:03:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35740415E7;
	Wed,  7 Jan 2026 18:03:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 54mCTsX3AJWQ; Wed,  7 Jan 2026 18:03:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A346415DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808995;
	bh=9kq107cei9oTJxsRUBlQrfzH47BLI2l8LaN56o/isOM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=SkYtrDIqZh905KjU7PQnbsEL7+Z34148Y9t8a5e7K1zmfddnGIktH8CzzhMCf/JPK
	 yI+tRu9S4caulrs+/dVAPPYuLXQXtIdloaTd/9eMtKDgt8u4lIWz+c0oKPEx3nS1IG
	 Q+/zqTLtOPKDv4UhAJpPnHbYaRCi8Iltz+GPjyzNgwut4QaGtMHO7LFj2I6w1Sl/C5
	 7SAZSmJHHnmZZLUE86KRq0xL6mVt7ZCfcxoDmQ8UDSG0SyrZufhLlGrBzDICdoon2I
	 LfY+wjG3zt4jsXanvLW2Z1xPu8DTy8w8RpzrZ8ajqh8vT/+idJzVwNQlpZDsJGl4QU
	 5WurhIov4uhSQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A346415DB;
	Wed,  7 Jan 2026 18:03:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 11043A58
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 248028112C
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mjBhEDfUCKqI for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:01:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 530D2810E0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 530D2810E0
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4FF1B81340; Wed,  7 Jan 2026 18:01:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 08:56:02 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 8fb28e79f2d1290ac34fb393bc50b89f5adb775a
X-Git-Newrev: 0584d66576fd5a62db90b25a10bf502ce2867a9f
X-Patchwork-Hint: ignore
Message-Id: <20260107180113.4FF1B81340@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/xvkbd: fix build
 with gcc >= 14.x
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0584d66576fd5a62db90b25a10bf502ce2867a9f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Fixes:

  https://autobuild.buildroot.net/results/86f2ba051e864375bda620dd92e01cb7b8532ac3/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 62db5ae5675a512812f8b183cb9a0216e688a621)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/xvkbd/0001-gcc-14.patch | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/package/xvkbd/0001-gcc-14.patch b/package/xvkbd/0001-gcc-14.patch
new file mode 100644
index 0000000000..6ecce1327e
--- /dev/null
+++ b/package/xvkbd/0001-gcc-14.patch
@@ -0,0 +1,19 @@
+Fix build with gcc-14
+
+Upstream: https://sources.debian.org/src/xvkbd/4.1-3/debian/patches/gcc-14
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ xvkbd.c |    1 +
+ 1 file changed, 1 insertion(+)
+
+--- a/xvkbd.c
++++ b/xvkbd.c
+@@ -15,6 +15,7 @@
+  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
+  * See the GNU General Public License for more details.
+  */
++#define _CONST_X_STRING
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <unistd.h>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
