Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BA79C64EC7
	for <buildroot@archiver.kernel.org>; Sat, 25 Feb 2023 21:01:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9C6494016C;
	Sat, 25 Feb 2023 21:01:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C6494016C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FoNk__AmuQiv; Sat, 25 Feb 2023 21:01:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D8FCB40146;
	Sat, 25 Feb 2023 21:01:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D8FCB40146
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8C88D1BF3EE
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 21:01:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 73B69415F6
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 21:01:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73B69415F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0rOrntPls_lw for <buildroot@lists.busybox.net>;
 Sat, 25 Feb 2023 21:01:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 802D54156E
 for <buildroot@buildroot.org>; Sat, 25 Feb 2023 21:01:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 802D54156E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6E3A286B0C; Sat, 25 Feb 2023 21:01:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 25 Feb 2023 21:53:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cc5a6c4af7e7809fccdb72b7140b33dacbbd1a94
X-Git-Newrev: 5e1a50e4e67b6a650f9d13729ee955e8332de951
X-Patchwork-Hint: ignore
Message-Id: <20230225210124.6E3A286B0C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/genrandconfig: add lpc32xxcdl
 handling
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

commit: https://git.buildroot.net/buildroot/commit/?id=5e1a50e4e67b6a650f9d13729ee955e8332de951
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since the addition of the package
in commit 20695936ad63f602662bc4c6124a26312c46ff52:

make[2]: *** /tmp/instance-0/output-1/build/lpc32xxcdl-2.11/csps/lpc32xx/bsps//source: No such file or directory.  Stop.

Fixes:
 - http://autobuild.buildroot.org/results/72c9a4080318b1b247ca3517c95c689dff1068d2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/genrandconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index ea8548d42c..6ec398851a 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -492,6 +492,10 @@ def fixup_config(sysinfo, configfile):
         configlines.remove('BR2_TARGET_BAREBOX_USE_DEFCONFIG=y\n')
         configlines.remove('BR2_TARGET_BAREBOX_BOARD_DEFCONFIG=""\n')
 
+    if 'BR2_TARGET_LPC32XXCDL=y\n' in configlines and \
+       'BR2_TARGET_LPC32XXCDL_BOARDNAME=""\n' in configlines:
+        return False
+
     if 'BR2_TARGET_OPTEE_OS=y\n' in configlines and \
        'BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL=y\n' in configlines and \
        'BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL_LOCATION=""\n' in configlines:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
