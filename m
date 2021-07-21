Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 677AEC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:11:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3555A60EE8
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:11:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3555A60EE8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F99560862;
	Tue,  3 Aug 2021 22:11:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FB_LGnfmhTu8; Tue,  3 Aug 2021 22:11:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63E2860664;
	Tue,  3 Aug 2021 22:11:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 220AC1BF9AA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 714AB8398E
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ynWpiCS6-UKN for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D7CF98356C
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 2DDA8878D7; Tue,  3 Aug 2021 21:10:14 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 21 Jul 2021 23:34:40 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 83e70c289381c2f58361270ed1384463728d3599
X-Git-Newrev: 3dc1fc23c8ffee0720fa42ca13ec5cd229949c1e
X-Patchwork-Hint: ignore
Message-Id: <20210803211014.2DDA8878D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libtirpc: drop rpcgen
 patches
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=3dc1fc23c8ffee0720fa42ca13ec5cd229949c1e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

rpcgen patches raise a build failure with host-libtirpc since commit
0a5a9741e03e666204d577f82d29d93ba610381b because rpcgen is not provided
by modern glibc:

rpcgen -h -o tirpc/rpcsvc/crypt.h tirpc/rpcsvc/crypt.x
make[1]: rpcgen: No such file or directory

Those patches were added to build rpcbind back in 2012 with commit
18828103cdc8b929b29f5cbc27cd771ab1a26326 however they don't seem to be
needed anymore as rpcbind builds fine without them

So drop those patches and autoreconf as well as the host-nfs-utils
dependency from the target variant.

Fixes:
 - http://autobuild.buildroot.org/results/6607cb9bec426b8c78e649484d5a149a1bf12a7f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ly-generate-XDR-header-files-from-.x-sour.patch | 1001 ------------
 ...R-files-needed-to-build-rpcbind-on-top-of.patch | 1653 --------------------
 package/libtirpc/libtirpc.mk                       |    2 -
 3 files changed, 2656 deletions(-)

Patch is too large, so refusing to show it
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
