Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F61BC282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:41:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2A9641350;
	Fri, 28 Feb 2025 16:41:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PkfGUqRLSdJh; Fri, 28 Feb 2025 16:41:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACA1440810
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACA1440810;
	Fri, 28 Feb 2025 16:41:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 05EFE1DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:32:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BFF9E42593
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3IZzNtIRa5Fi for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:29:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6241A424D9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6241A424D9
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5EDB5820F8; Fri, 28 Feb 2025 16:29:42 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 17 Dec 2024 00:13:08 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 8e00663624a3c5f2603c54af62efecd6f25874ad
X-Git-Newrev: f97b67be7429e35c16757b68ee057c435d4389a2
X-Patchwork-Hint: ignore
Message-Id: <20250228162942.5EDB5820F8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] utils/genrandconfig: more
 igh-ethercat tweaks
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f97b67be7429e35c16757b68ee057c435d4389a2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

utils/genrandconfig already had some logic to disable building
igh-ethercat drivers since they are highly kernel version
specific. Commit
eec3a1108a65ab8de4a313a7f34205c5d5ad8f2b ("package/igh-ethercat: add
configuration options") recently added a number of additional config
options to build more igh-ethercat drivers, which causes a number of
autobuilder failures. This commit therefore updates genrandconfig to
also not build those new drivers.

Fixes:

  https://autobuild.buildroot.org/results/9489b68967a35aa398e608d663824b2d2be9cae5/ (stmmac driver)
  https://autobuild.buildroot.org/results/ec2c24f16b365a3e7de8964fc8d73cb570c74abe/ (igc driver)
  https://autobuild.buildroot.org/results/65e17f8e03ab14dd9f39386f2176629677b8ba8c/ (genet driver)

Cc: Jannik Becher <becher.jannik@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 utils/genrandconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 0698cc5ff0..67f0ea9f73 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -504,7 +504,8 @@ async def fixup_config(sysinfo, configfile):
 
     # Don't build igh-ethercat driver as they are highly
     # kernel-version specific
-    for opt in ['8139TOO', 'E100', 'E1000', 'E1000E', 'R8169']:
+    for opt in ['8139TOO', 'E100', 'E1000', 'E1000E', 'R8169', 'GENET',
+                'IGB', 'IGC', 'STMMAC_PCI', 'STMMAC', 'DWMAC_INTEL', 'CCAT']:
         optstr = 'BR2_PACKAGE_IGH_ETHERCAT_%s=y\n' % opt
         if optstr in configlines:
             configlines.remove(optstr)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
