Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E08DC54798
	for <buildroot@archiver.kernel.org>; Tue,  5 Mar 2024 12:33:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7AF5241620;
	Tue,  5 Mar 2024 12:33:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mZ6IAVRIFA0w; Tue,  5 Mar 2024 12:33:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5080F41622
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5080F41622;
	Tue,  5 Mar 2024 12:33:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 77B121BF3D4
 for <buildroot@lists.busybox.net>; Tue,  5 Mar 2024 12:33:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6176D41624
 for <buildroot@lists.busybox.net>; Tue,  5 Mar 2024 12:33:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SdVpSOquFF-S for <buildroot@lists.busybox.net>;
 Tue,  5 Mar 2024 12:33:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B9E041620
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1B9E041620
 for <buildroot@buildroot.org>; Tue,  5 Mar 2024 12:33:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0F05288100; Tue,  5 Mar 2024 12:33:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 5 Mar 2024 12:29:04 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fd484c1f57781aed6e99a61cbfae21e0edbe7dd8
X-Git-Newrev: 4766ace0d05dd264c37ee923634b897ba0dd3a43
X-Patchwork-Hint: ignore
Message-Id: <20240305123334.0F05288100@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openblas: fix mips64 build
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

commit: https://git.buildroot.net/buildroot/commit/?id=4766ace0d05dd264c37ee923634b897ba0dd3a43
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use MIPS64_GENERIC instead of SICORTEX with mips64 to avoid the
following build failure raised at least since bump to version 0.3.25 in
commit 6a172ffe6b2aa5c59427696775cfa4c189f99c19:

../kernel/mips64/amax.S:76: Error: opcode not supported on this processor: mips64 (mips64) `mtc1 $0,$f0'

MIPS64_GENERIC is available since version 0.3.22 and
https://github.com/OpenMathLib/OpenBLAS/commit/a50b29c540c25baf8f788131cc905ebe0575f253

Fixes:
 - http://autobuild.buildroot.org/results/b8da10aeb16343540ce3672faabdaa4d3bffb020
 - http://autobuild.buildroot.org/results/32702ccaa2384252058840960d8998abca294fad

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openblas/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/openblas/Config.in b/package/openblas/Config.in
index 26a76d29fb..74c4a3aa5c 100644
--- a/package/openblas/Config.in
+++ b/package/openblas/Config.in
@@ -28,7 +28,7 @@ config BR2_PACKAGE_OPENBLAS_DEFAULT_TARGET
 	default "PPC440FP2"       if BR2_powerpc_440fp
 	# P5600 is built with MSA support which is only available in Codescape toolchains
 	default "P5600"           if BR2_mips_p5600 && BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS
-	default "SICORTEX"        if BR2_MIPS_CPU_MIPS64
+	default "MIPS64_GENERIC"  if BR2_MIPS_CPU_MIPS64
 	# I6400 is built with MSA support which is only available in Codescape toolchains
 	default "I6400"           if BR2_mips_i6400 && BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS
 	# OpenBLAS assumes SPARC=Sparc v9
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
