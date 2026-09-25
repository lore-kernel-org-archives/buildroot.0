Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB68CC98326
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 14:56:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92BF281355;
	Fri, 25 Sep 2026 14:56:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g1lta8gZdeNK; Fri, 25 Sep 2026 14:56:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org C72548136C
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790348215;
	b=aLtyvaqEW0YdFdQJTG9qxqwQIpqBXiJGxAkwB+gdO27Xah3i2kcDvIb2egfCLifQI5Jw
	 5afAZO3ve2tJG3k1X7VbBqpCNiiTQMUfqQk2szWeMzK4DrHnacqJScoQEltpJREou1a9w
	 3n4RL/z/YrAA2vGjLOQbfh2uEHFwp/lSnJ3r9f463snWJVEAG/X3vFkSQtkGsETRaFRD6
	 heET9otL+SuwpY6Fp7aOhPhGCY58Ghr+0CV6uflLV2zMs16pyCoC51NmtKzFi36zWY3TQ
	 oDXMgb68CFs2lkNMWHrdeKbP4LzDUa+SQ2mtr2BuCz4Utzfi2J5/iz9vw2ooueveWSA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790348215;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=4SmZCOxi/sAfPNxAxzdREWDeQE6z9uh2t290Sv9QxCw=;
	b=JQ8MQdRf8CRqC2FkhVwGMk8EOK2p0BGwiEhRKoA5H2RTgZZFdFZrTl2OAQO/Z477jxu5
	 +LSbzJNrg6nH/yQXXzZMbg2QPE5UDvXkiViGkQFK2rxPhLVf5z6Baiseca//CsmIQvWuL
	 DAGuFy4/nU0Kew59HZqwGl8h0INeYjKsJarniZp32faV9OVjrJjOFJIJE5WHLPHYFuH+N
	 U2gs1OigtRuN0i7Dk1vJ+hvAmi2JKBM08JuzqhdYb8sPCKp2MTCZQ8XM+7mIiCK+NgqGp
	 WTKKfGMk0DV/mbO+s9C2z09m9Odo4H3X3axLK9NEm75DMmxZ0JDn/T3Zm0il/VgNjjg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790348215;
	bh=4SmZCOxi/sAfPNxAxzdREWDeQE6z9uh2t290Sv9QxCw=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=aAcn4AM1LYN/NPbwDpmStuGY8L4UuLr9A9K1v7ml98VQXipSpt0IjPgWk9h/hXwGU
	 qZgVI/Ui4ndj7LNi+IsHy6EdJw+ARkYNZHNc/AIjAk4QvTDGlzjxEopdCe2ylcwso+
	 vBbMW+JvKJDbL5cF2lau4+Ijw9MNWxkc56BIyacgD8tJfdkHe9vdMa6YanmDwcwrwH
	 G5JtGlGFI8ijZmnnTSKRKhvRY7eAG4Z+X3u8SsP0yqFH3td4wvuWg0msoYOqC1BuiH
	 vNOojBiIbFFg98+BMIZ+uzzM2L6uyWmyuxtiXxOiZy0dUZlxRnQYw84yx3vNoUQIYf
	 SXkMPCqdaMiDQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C72548136C;
	Fri, 25 Sep 2026 14:56:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 51046332
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:56:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 42A3340CBA
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:56:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Chr8TKVZZYg for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 14:56:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 6776240CB7
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:30::10"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790348213;
 b=GfGwkMwnIjxIOYdmUxuDfpMCHGb6IT3LsaTqByQ7hHQL5qVXaB+zEmVwwe4CXiGGAqC/
 3ZAyT1D1UUIpIPJ9QwOew1O56ICf+iRagISpnfL63hs8q+U063O4l2fmm0RrChg4M/Mct
 iWXIXK2BwePKTeS4+XE57n29n8fSfZSKzKt6Nf5XslmShrav9golR3gaRUCVTOhsUHyK/
 ucaOvuM+n0MEo2kAFUVK/x5SAEOGKaBHDXC9Fl/wUOqw+FxS8ACki1LRbGPCIbgZ4zy+Z
 VABOi50K+mnqsOSyUToqXQB77SEl5zWbKeMpie8Spcwk9EgqF02QDdIGg2OKtpfxgTQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790348213;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=e+G0b5SJwVg3S3h84cL2/j8vi8t1dVPMxZ8PrWMG6Tk=;
 b=gjFIoCJECl4wSLOZPIG4z10Rpsplq0jrLQj7gRb067BBpUY9tdDg/UyqPWCIKyvP6kQM
 6r8Lx50NMUp5evTmVmymicK6raW4pSGWykxQFDlCHUw55fNLVR1HBU/QAxRKJ3aT83TGe
 vAm855WuHgO8IYrRff1kmvkHRYL4TW0J81lzMRj586h9bhRzcltqHxQ+YAsNzzgT8pFak
 x/5Jn8pA58b4Z33Y5v/6xb+tnZGgDQrX0Dfdjv7UjwXMYxndjy/bY6jHoi8IMKL52ccY3
 aJZU2UN85LBVRoqzs8ic9zhel6D7IPDqDSYoUE7snrbOeZO7HQpQq2FtpVI12ZarGCA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=none header.from=vodden.com; 
 dkim=pass header.d=vodden.com header.i=@vodden.com header.a=rsa-sha256
 header.s=google header.b=ZWPIDLEF; 
 arc=none smtp.remote-ip="2a00:1450:4864:30::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:30::10; helo=mail-wr2-x10.google.com;
 envelope-from=richard@vodden.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=vodden.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=vodden.com header.i=@vodden.com
 header.a=rsa-sha256 header.s=google header.b=ZWPIDLEF
Received: from mail-wr2-x10.google.com (mail-wr2-x10.google.com
 [IPv6:2a00:1450:4864:30::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6776240CB7
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:56:52 +0000 (UTC)
Received: by mail-wr2-x10.google.com with SMTP id
 ffacd0b85a97d-4843f22dcb8so795459f8f.0
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 07:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vodden.com; s=google; t=1790348211; x=1790953011; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=e+G0b5SJwVg3S3h84cL2/j8vi8t1dVPMxZ8PrWMG6Tk=;
 b=ZWPIDLEFG19agHSJWLMW8cS4Nnar6WAKJrCBQG6Kx21W9+VNm7e8UgRRyU0F+nL0Be
 Mxz1WhpTnkM+E0T1B7wgEm8d6Z8G+DPHzIf2Bonj8jgXaBwBcayAMbqo8qv49P2iQzpd
 ZJIl4XyMlsgBU+T+KfCUQhyPjlXNzsFXXuxxE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790348211; x=1790953011;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=e+G0b5SJwVg3S3h84cL2/j8vi8t1dVPMxZ8PrWMG6Tk=;
 b=s7dtzNX3gRg+P/ryzJk7mKfoBEb0ZPO4RaASr0MKPmve3wYiS/k8T/580c7nCRwchA
 lNwBMADpk6swJOrhFeiF7FD9bop6ieaE7CMcfPCJOWL0uOkXljxfG4v5oM77GdF9zzQw
 atAub1sfIK3SPn/edkXikz0lyMxGcd7GaVtDLZQDVKYbhIghZmx443wquIqqeQzP54ep
 Uw31A9K/MyQQTerwOpNKmX5eNxGljkDvrsG4lUgR6wpvenkZ+oTDXf2b+L4Uifv06dnV
 U4UW6+fjBCzIaBr2ES/zz/HDEf6tmAuByqA6EHtMdmezgSRvNtZOvdyqPJ7AvlIRmZsx
 RMKA==
X-Gm-Message-State: AFuF++liUFWEIZAHDd+PJ6JJvdnsoR3RbveVC9sYaccXF9HjIU21IbAU
 UbDq0ddV1mb9B0Jl56teSxLSgOzO1uG7v1d7t6V1cTcVBXDngKJp4gAaM024REsEBwQ8i0jBI2f
 yq6LTpVzz0A==
X-Gm-Gg: AYBFou2uS7mUEeP9xVTWvvgN0BwPwTD14E5/ieuabuTz9fjOfr4ex5AKD2Mpw7Cke/L
 8EYp1PAHoG7QSYBi5/3kxlPSw/nW2LhYFv16Xhi1wwddXBIXGahkIXh539UNuST2r2NEexqt4E/
 WAp7V4hNNYOYXnF/K+Mqtd3LcUNpcO88MuA9wDAKKyByfImJiTn6bAKJwjK2EdFZotpOtONLtFD
 86Ajc+JRnHpSfxkEtbVKz5b8k6llctnPavYjLQJ40JY5I8wbMuYPhmFsqUkw+uHaQGQnu8QOrcX
 SonaAvbvAm71K5ISmOUs1LNsXmFBjP6lwxM8/UQoEUxAkOMVVeiu32AhxUkWKkMQzvGn1wpA+rN
 Z2b37y9gqLg+AGtzt2M52VKNAWQCWFLq1Dcov7mQ7baMknA7qPVLyUrViitB59rFqwjPeNBmac0
 cAucKbDQtYICvP3CM85W61QGCuO1bPRhp5m5fBma8JXEfvNSvuB7lcOOHNlIJRT7s5Le0p5dCHO
 LSlKtDExl+4YtJ1sIQ/JJBJT+A8aC0Nws9FMi084nBOGk9YG+USi9pZ7MBjuUeo
X-Received: by 2002:a05:6000:2885:b0:487:834:9307 with SMTP id
 ffacd0b85a97d-48871973efbmr11140926f8f.50.1790348210067; 
 Fri, 25 Sep 2026 07:56:50 -0700 (PDT)
Received: from LargePixelCollider.localdomain ([154.61.62.140])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4887a3625ccsm8046779f8f.22.2026.09.25.07.56.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2026 07:56:49 -0700 (PDT)
From: Richard Vodden <richard@vodden.com>
To: buildroot@buildroot.org
Date: Fri, 25 Sep 2026 15:55:21 +0100
Message-ID: <20260925145521.54655-3-richard@vodden.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925145521.54655-1-richard@vodden.com>
References: <20260925145521.54655-1-richard@vodden.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH RESEND 2/2] DEVELOPERS: add Richard Vodden for
 boot/opensbi
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
Cc: Leo Yu-Chi Liang <ycliang@andestech.com>,
 Alistair Francis <alistair@alistair23.me>, Mark Corbin <mark@dibsco.co.uk>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Kanak Shilledar <kanakshilledar@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Richard Vodden <richard@vodden.com>,
 Francois Dugast <francois.dugast.foss@gmail.com>,
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Richard Vodden <richard@vodden.com>
---
 DEVELOPERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index f4b74629..6fe4dab4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2903,6 +2903,9 @@ N:	Richard Braun <rbraun@sceen.net>
 F:	package/curlftpfs/
 F:	package/tzdata/
 
+N:	Richard Vodden <richard@vodden.com>
+F:	boot/opensbi/
+
 N:	RJ Ascani <rj.ascani@gmail.com>
 F:	package/azmq/
 
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
