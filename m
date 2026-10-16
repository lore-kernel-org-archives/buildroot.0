Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DB86CCF2C1
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:09:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9994460ADF;
	Fri, 16 Oct 2026 13:09:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EdpSekqeFavM; Fri, 16 Oct 2026 13:09:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2ABB460BBE
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156156;
	b=eCTiZdaLo/Onhw8/pPkag4GIHXm1fE9YyW2cENPYwgOxO9tGi8N6zDs2npDSGe5Z+w9X
	 t7NM/zxg8xgjPcNCBbuuf87wxvLH6MXf3Tndie6Z6OrEwCB35cZGCO5hp9pdqCFWL+ZO7
	 0GfOhnTabbeZPSLL36odBAKIeGzuMgGYD0trtQxndo3WAGC820Oo/9zn3t666FDth49JB
	 WxGwPbGo5wL3h3c97E9oGxq5pNaragIe/zFQ7tDXZj6S9kg23fnTU2MU6ai2mbSS+hjow
	 k9v2jx4UMrvFJyK+gP56sY3CG0tvW5VR/hhaZIxHMOSwmm1naQ1Uk43j95LhxeGFcTg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156156;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=sjpmj/cJ/5h5Y+kTXxUAtm/KOeowHMSZBx7Jmvxt7uI=;
	b=KTKH8hvMFRIWssbu7GhpeDakQCdg2dLOepqt3L506Y9o57N6fP5Iy7jGR7IrwUZybPDl
	 ESoLAf8aw5Lx1wiRhShSXLGbShMmiPUNJ7zOy9NOhH6Fx1kXl8kB5hxXVcfLfRh2S4C9Q
	 P2aoZYHs/HV2FVO9Gs2H7SlaC+/VZPAWaJILufL/w2tv9jqwhJxfcFJk0Tx4hmTXiDXGV
	 N4tVDr4Ep9QIahMaLJV1vREKRWwO9P2Ip7OITlzfu/c4Ko9qOMnsajqP2gPOW+ue963az
	 bHhpKw9cZ41P4+IHPurS+TAsx3m4gDUufCOTuCy0saVWXasMp92d+ral9nvOqCIYWfQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156156;
	bh=sjpmj/cJ/5h5Y+kTXxUAtm/KOeowHMSZBx7Jmvxt7uI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=iPyJutzx1IMVR/zBMJ7gB5QUVNmHKWcJ6P1jjGzzEkWV1Uy1eXF13LNMn5djvfb+y
	 8R4M6SUvj5Kri7+bW2DejSHZ60PWc3pRyEk7FdOD2NUoVliMtFTcVS2m3SbA2m4AGX
	 3+83yjrmFlzZlBW4tUjEEB+dAy7twZzb4KVl78AHWw0dXvVR02pBSPCy9smf9Hhk9K
	 vbO2SySvgsVi5m/g1feT4YmOE4kiWDzZ5+ViXvWA2hGj2YGML3bb5MEfRCvbllvU1x
	 pfhTIzW5HQEG6AA4X9V6HnqprFZSOcpp96avNUIVmghCnTC601FSltmhJT+jCYBjnA
	 kKFEurWuAzvDg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2ABB460BBE;
	Fri, 16 Oct 2026 13:09:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E6138769
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CA6F040A13
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P2lPE4hiXlzP for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C53E440A08
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156107;
 b=TZvS5GWQV8Sx7tInW4ubZzl0yThdk+6WWnWmJQKYn59Sy6MfHWjQY0tVAFWW6y9Bowfi
 4koYid6t6UVk8C1UUdANWY43q66GInNulT4EI+WX+/Vln2O0OoFKWQ7/HhyePJzm0Wbgm
 sRCw4wFZuG4N8HtLMwUYgPLzYmp7LIQP932yKtf/VXgyBvREr4P7Hlyfq+aOwLQt3WDb3
 WL0hjOK6P43W/dU27pMur1ybOURhPC2IJr8tIQoFjb5ANS3skXOnqvcU4mA6Cf3EPD2ge
 +2QFPyfLabuWvAZauY3z/DKr5gU6tH/+lNFdvk/WJnCubZmnj91Ai7i97gNzLkDCTyA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156107;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=aLbD3upxe3a906FVKx+TClJn817o6niD6vtp2VhBE7U=;
 b=JJn+OpU8D/R+o9QsojilzzuyGuUI3/Jp5TpMGd+MN6rjrda8XQYx/f+7j8PuEDKVq/E2
 NcxU3P9Z6NiKZtDNe4mH856JT5eGMg7Wx9J9u0BVXmq9Q1q+4rBAhYJcauT4fqO2s5Tmy
 irnH4fNwhUOOyQBCoYFcoJ5UKUZtz2BIcw0GB9dwLR0x9rumfKqcSU9u45De2kl91ksxl
 R+Eo7dnemuQAgBTyeEBu2mwcMszX/iHaK+MGPUHMzfFM9uTbilDc2nKkQReN1cXwn+9b9
 hBQUlj/Gx8tbDpnyPs9w8Pu3hTP0naWG3w3UHUFMaoH6MJ5wIRUQH6yYggW9Uz4/AAw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C53E440A08
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B66C6960D8; Fri, 16 Oct 2026 13:07:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Oct 2026 15:07:51 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: e834f75618e9ed0809a2683577d3fe588dd8dd76
X-Git-Newrev: 43d552903fceaf95affbc835f545757becdc83fd
X-Patchwork-Hint: ignore
Message-Id: <20261016130706.B66C6960D8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/kbd: add CPE
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
Content-Type: multipart/mixed; boundary="===============3951045142274759190=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3951045142274759190==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/43d552903fceaf95affbc835f545757becdc83fd
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The resulting CPE ID is:

cpe:2.3:a:kbd-project:kbd:2.10.0:-:*:*:*:*:*:*

The vendor and product are valid, see e.g.
https://nvd.nist.gov/vuln/detail/CVE-2011-0460

Signed-off-by: Sebastien Guillaume <sebastien.guillaume@vendeeconcept.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 93df82900d7774672f8d37bc8d967dbf2798c195)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/kbd/kbd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/kbd/kbd.mk b/package/kbd/kbd.mk
index c460779467..44b9de308f 100644
--- a/package/kbd/kbd.mk
+++ b/package/kbd/kbd.mk
@@ -9,6 +9,7 @@ KBD_SOURCE = kbd-$(KBD_VERSION).tar.xz
 KBD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kbd
 KBD_LICENSE = GPL-2.0+
 KBD_LICENSE_FILES = COPYING CREDITS
+KBD_CPE_ID_VENDOR = kbd-project
 
 KBD_DEPENDENCIES = \
 	$(TARGET_NLS_DEPENDENCIES) \

--===============3951045142274759190==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3951045142274759190==--
