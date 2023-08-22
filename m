Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 037E9EE49AE
	for <buildroot@archiver.kernel.org>; Tue, 22 Aug 2023 19:23:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81DAA61204;
	Tue, 22 Aug 2023 19:23:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 81DAA61204
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v9DszJ-rmNcU; Tue, 22 Aug 2023 19:23:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA83A605BE;
	Tue, 22 Aug 2023 19:23:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA83A605BE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9FDD01BF370
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 19:23:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 84D8140491
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 19:23:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84D8140491
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZVGVq6mklzuC for <buildroot@lists.busybox.net>;
 Tue, 22 Aug 2023 19:23:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7668240450
 for <buildroot@buildroot.org>; Tue, 22 Aug 2023 19:23:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7668240450
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 657468616F; Tue, 22 Aug 2023 19:23:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 22 Aug 2023 21:21:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6d8deb4b23ee57a69308bcdc5ceafa02aacc1edd
X-Git-Newrev: 5a4429a6dddafb6d6ed2aa3db5e4590bfae43d45
X-Patchwork-Hint: ignore
Message-Id: <20230822192327.657468616F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zlib-ng: handle power9 cpu,
 fix compile error
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

commit: https://git.buildroot.net/buildroot/commit/?id=5a4429a6dddafb6d6ed2aa3db5e4590bfae43d45
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Zlib-ng misdetects the powerpc cpu and the package fails to compile
for non-power9 cpu's.
Power9 support was added Upstream in commit:
02d10b252cc54159f7c33823048daec4b023fb22
So it was introduced in zlib-ng 2.1.3 and this was added to Buildroot
in commit 0df456ea6e05306fb077e96064adf68f3863eeea.

So there is no need to backport it to older Buildroot releases.

Fixes:
 - http://autobuild.buildroot.net/results/a9f/a9f45486664b2d5b23a2f330a63955a06ae8189d

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/zlib-ng/zlib-ng.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/zlib-ng/zlib-ng.mk b/package/zlib-ng/zlib-ng.mk
index 23f1bd2158..fbb906503a 100644
--- a/package/zlib-ng/zlib-ng.mk
+++ b/package/zlib-ng/zlib-ng.mk
@@ -35,4 +35,10 @@ else
 ZLIB_NG_CONF_OPTS += -DWITH_POWER8=OFF
 endif
 
+ifeq ($(BR2_powerpc_power9),y)
+ZLIB_NG_CONF_OPTS += -DWITH_POWER9=ON
+else
+ZLIB_NG_CONF_OPTS += -DWITH_POWER9=OFF
+endif
+
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
