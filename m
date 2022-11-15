Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 968CEC43219
	for <buildroot@archiver.kernel.org>; Tue, 15 Nov 2022 13:27:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3D0C840A63;
	Tue, 15 Nov 2022 13:27:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3D0C840A63
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4eVA05lENWh0; Tue, 15 Nov 2022 13:27:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7C0FC409F9;
	Tue, 15 Nov 2022 13:27:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C0FC409F9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 61F4D1BF94D
 for <buildroot@lists.busybox.net>; Tue, 15 Nov 2022 13:26:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3E3A340A63
 for <buildroot@lists.busybox.net>; Tue, 15 Nov 2022 13:26:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E3A340A63
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wlue-a3nbY4Y for <buildroot@lists.busybox.net>;
 Tue, 15 Nov 2022 13:26:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 83624409F9
 for <buildroot@buildroot.org>; Tue, 15 Nov 2022 13:26:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83624409F9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6E2DE83CA1; Tue, 15 Nov 2022 13:26:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 15 Nov 2022 14:22:33 +0100
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 19a07fbe5fa155cc9702d6875ce465783d31dd89
X-Git-Newrev: 868734d040ad0bacd059682649efb4469d53664e
X-Patchwork-Hint: ignore
Message-Id: <20221115132631.6E2DE83CA1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] utils/genrandconfig:
 disallow configs with BR2_XTENSA_CUSTOM=y
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

commit: https://git.buildroot.net/buildroot/commit/?id=868734d040ad0bacd059682649efb4469d53664e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

When BR2_XTENSA_CUSTOM=y is used with the internal toolchain, an
overlay file is mandatory, which genrandconfig can't provide. So we
simply disallow such configurations.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit c81da5e41c8b8863920a1f0416e4f7f4d22788bf)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/genrandconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index f19a405685..9c6c2b359c 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -304,6 +304,11 @@ def fixup_config(sysinfo, configfile):
     # No C library for internal toolchain
     if 'BR2_TOOLCHAIN_BUILDROOT_NONE=y' in configlines:
         return False
+    # Xtensa custom cores require an overlay file with internal
+    # toolchains
+    if 'BR2_XTENSA_CUSTOM=y' in configlines and \
+       'BR2_TOOLCHAIN_BUILDROOT=y' in configlines:
+        return False
 
     if 'BR2_PACKAGE_AUFS_UTIL=y\n' in configlines and \
        'BR2_PACKAGE_AUFS_UTIL_VERSION=""\n' in configlines:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
