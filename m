Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0058CA5FCB
	for <buildroot@archiver.kernel.org>; Thu,  1 Oct 2026 14:23:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B844260DE6;
	Thu,  1 Oct 2026 14:23:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3HloDIlOSlM2; Thu,  1 Oct 2026 14:23:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org A2E7E60D6F
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790864619;
	b=ku1ZnwI7V9BH6mAKJdhU9BIJUyx+fUZVYtJjkfDOoIsD4bmI8pv6SuXkjf1qYEhxhlSQ
	 FmW37jcN71obVzSFCRZ422MjqhdTwNQpe1F7GyqgJLBP5Kcqv8Uo0tAUkRDYwO22FwFmK
	 xTU4VRpUwV5Uk/4s+8BM071SkQeNR8NiUu77HhSBki5ejULOPkJ7godbbh8nfLhddNumt
	 Fc/5Hg+0wH2HJ4Y7KHh/qlSQpiBLhwGM7WSMZXiCElWnJpd4QVvZoIf2VRs7D2AgRE76B
	 fHeF+Fvc3NdmgtFBiEZWgNPVDKlZVVQMyVoDdPU+tpC4wb7jvAffzTGXrCp+/07eCpQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790864619;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=whDMDxpKw0eukTuyFmNqE07HyUZMKdgPwtke10SepmI=;
	b=TP8bv9/bjWTLoJO0Er3orNbRv8DZ15hU9OXGT/fwnw2rx7Nh+Vi6Barj3vt59BZEeQF8
	 /xqNBB4LDtW21nMIeIyj4qfVe+H4rGYbCcH53Ymp0W5xng1Axu4dTNXaYTbu0fKhTIuKs
	 V4w26vT0fknn5LOBIPWv9ziU0u+pgGM9qx2MSZ/3cxTLdVIXwIdy+4uyvU7PJerOPu/95
	 7b4HkhFwYwfYTo9wY52OIE3lB+n+1qsp/pAW3ktou4SkNwdTdqlPc+z3KxyFBmxu6Sf6e
	 HjXbn4korgDQWJ8/upJgoDULXuHaeCjwB/O3Ll5Nl/LsTMaAtWvNm0euDcRHOclf5Nw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790864619;
	bh=whDMDxpKw0eukTuyFmNqE07HyUZMKdgPwtke10SepmI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Rm+TdqA0Q1JZ58BFCFOQHmh5EHSy+XCAFlvXG442MxmcTnKSvx7Sk4xcHMBj9Hw+l
	 OmxprYcrnJLnS5zdOjMwFHTAPMsz8IKGAZ7EQMHGIav+U9IROHWPNW93o8x2I8PTTT
	 sYOpkMwXFNvugqp6+4vhPGOIY4hYLZduDOzFxrt4h9Kk+7pcWR/u27c9DW9ZRD2ktE
	 Rs0Xdp2PKRkIjOmKYjT2qqxSn120bLnEiMgWcxuf1NDgWxvR7bSM8gsMYCren2Y0zR
	 5Cq/UQ1l5WNbR1jD0q6cw2nYx/B1lbE/Gpb7K3k/2T/eVPKnfORbwW0squjyCycOgg
	 8+t1znAIzFsSA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A2E7E60D6F;
	Thu,  1 Oct 2026 14:23:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E65E31FE8
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D2E3E40512
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ajncm99U3qJh for <buildroot@buildroot.org>;
 Thu,  1 Oct 2026 14:22:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 089484052B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790864563;
 b=KhDt9XIG/BkaM8ZPrawyNHspox9DrqPDrQvEEyPHdwIgirfnqwmnU8RFip09TttH9vCJ
 +xeZyBu8eRa/nNbRAkkoQPp7vyEO0nG97HONffWuHSoImcGdDcVfL0NoBpAukJNEXv8gT
 gRVgFph1JlZdGSDb0Iml07ftfCDtJgKEGB9UnFcqJgfGmfHnzFKiBKC6UVr+EeFJI+Fd5
 s5pEJ+c/GGOOjWsMVjJaVIE8JCc92W43HDGKwFndEguLMroQ3H4lcAmsm3VuAA+0Czy1P
 u1UnUPanKt9jJyAzitEJ0Sg+WfF/xeB0o53By8Zvts8tyB3LRDL5riWGapX/ay53QaA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790864563;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=cbHGQXWV+PD6i2C+jNLIKeW3DEzTJS5tySwRalAekSk=;
 b=aCdwbGQvAjVkOtsQRdAYpxWB8Oqx365NEhq9/HuBcOJiHXD91SeReRBMkUdxw1V/7ihm
 EK15Z9lifWU7MjltDc6tMkfB23EFNtDrX/bufHGWvt/dxTqiMDfiWSYczVN2CcQdWXzmJ
 M7/DEJCH0UMmzkoGPDnr8dt23B5m3kTiYvaAsoaNpsEHb0P1vcU5DAlZOaIealt7PFgJ6
 zpiODhtSmkwVmgtKvCXlXq/jdBThTzmOGpvxLJ9YGdymB5mHzS3wrrXOa98xtiqgqfiHU
 NKT0PZZJHqpbwpkedFpMK2QldhLzeGcn8u7B+B3fpp+xZIGfcJejjmD3lFCQHbJs4NA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 089484052B
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 441B69844E; Thu,  1 Oct 2026 14:21:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 30 Sep 2026 16:07:47 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: a080b40e2fef723ae84fa602ffa7cdd2499d966a
X-Git-Newrev: cb17178ea6ca234846bca8e081a20cc31e376ceb
X-Patchwork-Hint: ignore
Message-Id: <20261001142129.441B69844E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] .checkpackageignore:
 remove entry for mrouted package
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4627657567601078565=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4627657567601078565==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cb17178ea6ca234846bca8e081a20cc31e376ceb
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Buildroot commit [1] (package/mrouted: fix invalid daemon path in
S41mrouted) removed script execution permission but forgot to remove
the corresponding .checkpackage entry.

check-package is reporting the error:

    package/mrouted/S41mrouted:0: NotExecutable was expected to fail, did you fix the file and forget to update /builds/buildroot.org/buildroot/.checkpackageignore?

This commit fixes the issue by removing the entry.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/16661195972

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/d8f408b1f16d067d2e676f3db91e7b337aebe160

Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit e2b81003a490363bf249fc5a2ff4660f02333e8f)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 .checkpackageignore | 1 -
 1 file changed, 1 deletion(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 84349b537c..557894847a 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -611,7 +611,6 @@ package/mono/0002-Ongoing-work-on-the-cmake-build.patch lib_patch.Upstream
 package/motion/S99motion Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/mpir/0001-mpn-arm-udiv.asm-workaround-binutils-bug-14887.patch lib_patch.Upstream
 package/mraa/0001-include-Declare-gVERSION-global-as-extern.patch lib_patch.Upstream
-package/mrouted/S41mrouted NotExecutable
 package/mrp/S65mrp lib_sysv.Indent lib_sysv.Variables
 package/multipath-tools/S60multipathd Shellcheck
 package/musl/0001-avoid-kernel-if_ether.h.patch lib_patch.Upstream

--===============4627657567601078565==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4627657567601078565==--
