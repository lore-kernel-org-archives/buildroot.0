Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88D6AC5AD5A
	for <buildroot@archiver.kernel.org>; Sat, 15 Aug 2026 14:05:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54AF14086C;
	Sat, 15 Aug 2026 14:05:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nGgJTQEcy_Tb; Sat, 15 Aug 2026 14:05:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 758D340891
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786802702;
	bh=kC7CA+SRrIMvE0xLoWpm4AJrAU+USwl/E7mxakKOdB4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=FKJND5MRmPLaVP7gahH7Dine4TIpkI65r04r+ZRnfoIk/+CeUfmzbdnaKeCyFsjpK
	 bfGBP8KzH3YnH3c/l3YxQz4H3th9JJan3+FGppigKoA4+YvQQnwIOOYVe7xRJ+q8uA
	 dsbpeUAzVl1YO9rtrcXgR0SL9Q1h/g6t4Avr0gaPn1KLoL29ZlPDTCsuDP6Hh5Ehdz
	 FZWzddIvy4nn26j0XiZHkBHhZ8JZnafCw9i40QPYxYMCr7ZhFopPDLNAtwuCTWt7Pm
	 LH2CjijaGmhs+1OnkiQ59qtzj3xyVcPIlUILsb8gQnu3XHlwvfLJPZPfimaOqJ9Xbs
	 7EfKOmQlZAkEQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 758D340891;
	Sat, 15 Aug 2026 14:05:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 43E64361
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 14:05:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 41BBB6066B
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 14:05:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UofToBevsuyn for <buildroot@buildroot.org>;
 Sat, 15 Aug 2026 14:05:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4E17360621
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E17360621
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4E17360621
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 14:04:59 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 4198E13F88D;
 Sat, 15 Aug 2026 16:04:49 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 15 Aug 2026 16:04:49 +0200
MIME-Version: 1.0
Date: Sat, 15 Aug 2026 16:04:49 +0200
To: Neal Frager <neal.frager@amd.com>
Cc: buildroot@buildroot.org, joseph@anodize.com, thesamprice@gmail.com,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com,
 romain.naour@gmail.com
In-Reply-To: <20260814131446.2547523-1-neal.frager@amd.com>
References: <20260814131446.2547523-1-neal.frager@amd.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <31dbebb593dc22e51e054e18bc088f78@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH v2 1/1] board/qemu/microblazeel-mmu: fix run
 command for qemu 11.0.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 14/08/2026 15:14, Neal Frager via buildroot wrote:
> With qemu version 11.0.0, support for microblazeel has been folded into 
> the
> microblaze target. This means that the run command for microblazeel-mmu 
> needs
> to be changed to reflect this.
> 
> See the notes in the qemu bump commit to 11.0.0 for more details:
> https://github.com/buildroot/buildroot/commit/9a5369effd22011b52b82c91f702bacde690c41a
> 
> Run command for qemu versions prior to 11.0.0:
> qemu-system-microblazeel -M petalogix-s3adsp1800 -kernel 
> output/images/linux.bin -serial stdio
> 
> New run command since qemu version 11.0.0:
> qemu-system-microblaze -M petalogix-s3adsp1800 -kernel 
> output/images/linux.bin -serial stdio
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
