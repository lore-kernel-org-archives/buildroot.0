Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 231C7C83F01
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 11:22:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC2E481F9E;
	Wed, 30 Aug 2023 11:22:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC2E481F9E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YCd9tEfd7OUa; Wed, 30 Aug 2023 11:22:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF4E482661;
	Wed, 30 Aug 2023 11:22:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF4E482661
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8ACC11BF42D
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 11:22:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 61C19416EB
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 11:22:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 61C19416EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UgEIr3_krhhr for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 11:22:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6FCD7416A5
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 11:22:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6FCD7416A5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5E54B86593; Wed, 30 Aug 2023 11:22:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 30 Aug 2023 13:07:07 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 836cb23310cbbb003225a3ea4f1d2b4686fa81f0
X-Git-Newrev: b8088fce0a83f3f0c07a7ba5dc00fcac1192fdc1
X-Patchwork-Hint: ignore
Message-Id: <20230830112210.5E54B86593@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/ntp: needs either
 mmu or threads
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

commit: https://git.buildroot.net/buildroot/commit/?id=b8088fce0a83f3f0c07a7ba5dc00fcac1192fdc1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Fixes:
http://autobuild.buildroot.net/results/f2b466853ed296fdc8b4629f36e5a6447658f82d/

Quoting the first error message:
ntp_io.c:3793:9: error: unknown type name 'blocking_child'

ntp needs either fork or threads:
https://bk.ntp.org/ntp-dev/include/ntp_workimpl.h?PAGE=anno&REV=4d6178063mDeaH-s7PteNqw1DDK-Rw

  #if defined(WORK_FORK) || defined(WORK_THREAD)
  # define WORKER
  #endif

to enable the blocking_child code based on the WORKER define:
https://bk.ntp.org/ntp-dev/include/intreswork.h?PAGE=anno&REV=4d617805zzdW7YeB56-WZ4GbGCcXxw

The build error first occured on April 3rd, 2022:
http://autobuild.buildroot.net/results/31b/31bfdac8411ebf043a39e3277f6d7b008fe337b0/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f2d9118423612818c897bf075bc055fc7252cfc6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ntp/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ntp/Config.in b/package/ntp/Config.in
index 97d933b5a8..78f008a4b8 100644
--- a/package/ntp/Config.in
+++ b/package/ntp/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_NTP
 	bool "ntp"
+	depends on BR2_USE_MMU || BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_LIBEVENT
 	help
 	  Network Time Protocol suite/programs.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
