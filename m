Return-Path: <SRS0=Jxa3=PY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5808EC433EF
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 21:34:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E0186109F
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 21:34:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1E0186109F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBC79407A0;
	Fri,  5 Nov 2021 21:34:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nLFOjM2za2tP; Fri,  5 Nov 2021 21:34:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40CBE4073F;
	Fri,  5 Nov 2021 21:34:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 596B01BF5B5
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 21:34:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5399C81DCA
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 21:34:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q76A5D8N5X90 for <buildroot@lists.busybox.net>;
 Fri,  5 Nov 2021 21:34:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5969181DBF
 for <buildroot@buildroot.org>; Fri,  5 Nov 2021 21:34:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 085118B37A; Fri,  5 Nov 2021 21:31:06 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 5 Nov 2021 22:34:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d2f92512f699cb34f6373c43e8da7f5907e2abd0
X-Git-Newrev: d51189ffe50fab00d36778a53d28c9d5cb34ae42
X-Patchwork-Hint: ignore
Message-Id: <20211105213106.085118B37A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/systemd: enable selinux xdg module
 for refpolicy
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

commit: https://git.buildroot.net/buildroot/commit/?id=d51189ffe50fab00d36778a53d28c9d5cb34ae42
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Without the selinux xgd module enabled by systemd package, refpolicy
fail to build due to policy/modules/system/systemd.te [1]

policy/modules/system/systemd.te:288:ERROR 'attribute xdg_config_type is not declared' at token ';' on line 508447:

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/1710552468
https://gitlab.com/buildroot.org/buildroot/-/jobs/1710552470

[1] https://github.com/SELinuxProject/refpolicy/blob/RELEASE_2_20210908/policy/modules/system/systemd.te#L288

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Adam Duskett <aduskett@gmail.com>
Cc: Antoine Tenart <atenart@kernel.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/systemd/systemd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 8c187d2ec3..a8b11faa5e 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -20,7 +20,7 @@ SYSTEMD_DEPENDENCIES = \
 	util-linux-libs \
 	$(TARGET_NLS_DEPENDENCIES)
 
-SYSTEMD_SELINUX_MODULES = systemd udev
+SYSTEMD_SELINUX_MODULES = systemd udev xdg
 
 SYSTEMD_PROVIDES = udev
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
