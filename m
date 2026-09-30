Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC352CA5FD2
	for <buildroot@archiver.kernel.org>; Thu,  1 Oct 2026 14:22:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A7B540A44;
	Thu,  1 Oct 2026 14:22:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WWSHToRCIRim; Thu,  1 Oct 2026 14:22:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org AF7734085B
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790864567;
	b=INneUf480PeJH3ZpVz0MZO5sz0m5xhCwBsXZbcFAjye9XDyPI8b7NTrwwmyZp/GEGl8r
	 bkhOL97WC8zumF0FGGDZYUn9nR3pr+0V/Zea0snVtx3mUUZ9kHLbdsvdDt2SoTACp6xk9
	 YaB0Il45tP+kgurkmy2kccalka8OqiQnTeXJDID5tGY4VF6CaFAv2mA+DHAP+eep6ywmx
	 ElPBacXEDjheJeSuIwqC/D7dY1V3TRLkY7LFhW6rG61L1KlMSvaHPQJgrD0pq9PN7Spw/
	 7RPUg1KfmXn6dm+8dqNjMZC9pZVcEY51kJImQWGo+EayZT1ROH9e+BJLRbCM6pt8QlA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790864567;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=ngpjD4moxbTFfAI0tM++aR8qRsPG/EIZxnVb6aX8Vk0=;
	b=QvnDg6f8T31+0Ywuue+zcbXblDefnlm/WWR1UNpPJGcyZpx8hGfFAf0c3OwCwjGi0MM4
	 MdWtmyydXP4Y2z4ygo/lg6SyCKoEnREIxU3kOjjpxB06nnlqA7Jh0fhu6OcCqhpqECpdb
	 3jxXi/6ZOwjBj3qImzfkkhLLMcmOcWPpQVE2XTBzlKUx4i9B8hkJ+f9byZEg+Gf1mdtP4
	 LZklg3AF1SjLaM0cLF6vrnnK3LBx8HfhOcu6ptgILmxZRqIzrj9ebbGP4wPYvN+yAuG+M
	 AEGT4tYB//n4DXpd5QEAAOyUziLi1fMEnIdmu7ng1cFYAxasRjzd8jnEqhv1AcMigRA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790864567;
	bh=ngpjD4moxbTFfAI0tM++aR8qRsPG/EIZxnVb6aX8Vk0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jCfGjZfubWjGiMw+xGzmC92bBu1jmBhPv9SDDVs2hty+8qtJehqaSmqaaCbb6pXPT
	 1qGLsPsD0np5ffcSp/wq6LBRFE8hSKbwZ+HbqWzXRU/wVFeaBLSzmyBKHLiq8ZzZqm
	 UKjqNg8NZgE0BTROO7pQJrOiQPwOBwIVhDkICEkdJ5tNcfr47/Deyjej4IzG1guZIF
	 ji+LWv4beJjHdqzT0fDAcYqyJrM76HtkWIQRV8AeYAres7abr8ahpC73p4AXmYaCZu
	 CO3IMF47JnPLOEtJH2v5N0buznmQ+UT1Vu0dqGm3zjMGPIrXwA48qMxOIRLc3rtYvR
	 PCjpDNSNQEGbA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF7734085B;
	Thu,  1 Oct 2026 14:22:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AC204116C
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9D0BD40844
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EKyJgMlXmEhA for <buildroot@buildroot.org>;
 Thu,  1 Oct 2026 14:22:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 81B6640825
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790864560;
 b=qhZBj8tVo9MqT7iZtjShFTZb3kVHMVrzwcdOwpze666M8Ahe3NZlqJhh3n9jmHhaKWFA
 eU+HLNs2kt9hGb8oiTe/xqjEG7o52ObyFTOTIyAC1xHP1cbaereWA0QFn1LK1mx47R+gV
 ndLpI/nHSYYOmwIgW6T9B1VSRggpEMkchPN2KFpQ8kaHlGhJQo/ltBumFtEayGrixtDgW
 7OthsWGJo+IUIuif6A1xhcGzywExW+9h1Pyq5NdSnZsddR6fGi1wZOlR5o1MuHAc2TIzY
 ea/PH8CdCIOElN5azfwy0pGnCRPbNJVPZFFVoRmdskZXTnKoge0SQrHHNnjjh+sim3w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790864560;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=iSdtFAX8saVrTXQRB96GJyJESKwP2vCd/BweKLD6sdo=;
 b=AMDBR8eF7Z1YznESBAwLylkoLye0j905s+1JtqGo9/HDX0hu28Ez4mOcYY6ATU/CtD2a
 HmXNVVpR4NoG4UFniSDZhTQdOfpEJ3vwjJiDQxArHelq+mj1lE3PcTUo2JaXQ5O9cFnAI
 4BWX+DwzF64KPYxPbAyN3lyrIdXii9Bso9sW1Qr8VNoEW6Rtp6mwNjyyyKkiAkOau9F+/
 XmZ28jJ30Nhb/OB4aAnLH1EnCXDa/kA0IVaUP6Tlo0U0dH8bfDImu48OZEmtsa/btrzLH
 Y+DqiyU56ZH0Aeg1uJKBUaxnAKCLfyH7c6mSTdkwX+9lX/iS9otqJ3WQkH1MMSc13xg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 81B6640825
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BBF6895B8E; Thu,  1 Oct 2026 14:21:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 30 Sep 2026 16:07:15 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: ffcff64b60f2d95a0eec41306cebc04d31794aa4
X-Git-Newrev: e0dd5372bd55d3bcda425386a32c45ec4083c88e
X-Patchwork-Hint: ignore
Message-Id: <20261001142126.BBF6895B8E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] DEVELOPERS: remove Koen
 Martens from capnproto and linuxconsoletools
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
Content-Type: multipart/mixed; boundary="===============0289770437117844700=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0289770437117844700==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e0dd5372bd55d3bcda425386a32c45ec4083c88e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

I have left the field of software engineering and will no longer
contribute.

Signed-off-by: Koen Martens <gmc@sonologic.nl>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
(cherry picked from commit 81060d467fed41280001ad1c31d002a712b2a134)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 DEVELOPERS | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 68fbd015a3..82d60cf430 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2047,10 +2047,6 @@ F:	package/rockchip-rkbin/
 N:	Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
 F:	package/wqy-zenhei/
 
-N:	Koen Martens <gmc@sonologic.nl>
-F:	package/capnproto/
-F:	package/linuxconsoletools/
-
 N:	Kory Maincent <kory.maincent@bootlin.com>
 F:	board/octavo/osd32mp1-brk/
 F:	board/octavo/osd32mp1-red/

--===============0289770437117844700==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0289770437117844700==--
