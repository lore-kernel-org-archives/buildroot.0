Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3372CA0FF9
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 10:07:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFDB1842BC;
	Fri, 29 Aug 2025 10:07:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t_TWRNUwW-E2; Fri, 29 Aug 2025 10:07:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D91BE842B3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D91BE842B3;
	Fri, 29 Aug 2025 10:07:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 067856C
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 10:07:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D994F4183D
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 10:07:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6KZyjjTyxIiR for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 10:07:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 028804182E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 028804182E
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 028804182E
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 10:07:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6AA6BB9782D8; Fri, 29 Aug 2025 12:07:51 +0200 (CEST)
Message-ID: <cbe45d00-ef5f-4133-bfe0-04cb517dd1a8@rnout.be>
Date: Fri, 29 Aug 2025 12:07:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Olivain via buildroot <buildroot@buildroot.org>
Cc: Julien Olivain <ju.o@free.fr>, Damien Le Moal <dlemoal@kernel.org>,
 Michel Stempin <michel.stempin@wanadoo.fr>
References: <20250823211802.2213734-1-ju.o@free.fr>
 <20250824113525.7f0d0261@windsurf>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250824113525.7f0d0261@windsurf>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1756462071; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=DXP1xIe2+cnbd1oKyW2UaRg7Gm2KGyn1Y4xBQbLch6I=;
 b=bgpc1pfiWaa6au7sfrP6aUWBjMC3on7b0wUPAdXIOL0CtVPMPh/c5Nob9xyITFHM6424Hq
 wGuzUZg65ERIuLNgFZqN9MKQwrOTVB2YVS39VOhzchF7VShPOvtFFFE7kqEyAbyCIS1G6Y
 n8K2MrZcKUI43Ng36VABJ7UJqjWnt0sR30Vgc3K/DRdjaCEjIwHzhJAL+Q4Wg2JoHxfk7P
 Y0rRwn5qnlLEXxz/UkeD2wryesTen4g/VK/LLEWQnmsNTclNs/lZQP1l6kQWKAvBVV0N3K
 LE5+D3uVCqyy8wJtsaMktpHlLHgP/2KrhL6zgWjGQaUROkWy+LOPn++htRZ7Iw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=bgpc1pfi
Subject: Re: [Buildroot] [PATCH 1/1] configs/sipeed_licheepi_zero: update
 Linux, U-Boot to fix build
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 24/08/2025 11:35, Thomas Petazzoni via buildroot wrote:
> Hello Julien,
> 
> On Sat, 23 Aug 2025 23:18:02 +0200
> Julien Olivain via buildroot <buildroot@buildroot.org> wrote:
> 
>> Since Buildroot commit [1] dc0f7215c6 "package/gcc: switch to 13.x as
>> default", sipeed_licheepi_zero_defconfig fails when building the Linux
>> kernel with the error message:
>>
>>      drivers/ata/libahci.c: In function 'ahci_led_store':
>>      ./include/linux/compiler.h:350:45: error: call to '__compiletime_assert_1138' declared with attribute error: BUILD_BUG_ON failed: sizeof(_s) > sizeof(long)
>>        350 |         _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
>>
>> This issue is fixed by upstream Kernel commit [2].
>>
>> This commit fixes this issue by updating the Linux Kernel from v5.3.5
>> (which is not a LTS series) to v6.12.43 (which is a LTS series
>> including the fixes). With this update,
>> BR2_LINUX_KERNEL_INTREE_DTS_NAME is updated accordingly to follow the
>> new DTS organization.
>>
>> This commit also updates U-Boot from 2022.01 to 2025.07. This new
>> version now requires BR2_TARGET_UBOOT_NEEDS_GNUTLS=y.
>>
>> While at it, this commit also switches to a stable glibc Bootlin
>> external toolchain, to follow the new guidelines from [3].
>>
>> Finally, this commit adds BR2_DOWNLOAD_FORCE_CHECK_HASHES=y and the
>> corresponding hash files. The .checkpackageignore is also updated to
>> reflect that change.
>>
>> Fixes:
>> https://gitlab.com/buildroot.org/buildroot/-/jobs/11026771001
>>
>> [1] https://gitlab.com/buildroot.org/buildroot/-/commit/dc0f7215c604e845009e03784a221332867bf35a
>> [2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=f07788079f515ca4a681c5f595bdad19cfbd7b1d
>> [3] https://elinux.org/Buildroot:DeveloperDaysELCE2024#Rules_for_defconfigs
>>
>> Cc: Michel Stempin <michel.stempin@wanadoo.fr>
>> Signed-off-by: Julien Olivain <ju.o@free.fr>
> 
> Thanks for the patch!
> 
> However, for defconfig, don't we normally require that changes are
> runtime tested on the HW? That's a bit the whole point of our defconfig
> I believe. Jumping from 5.3 to 6.12 is a big jump that deserves testing
> on HW. If HW is no longer available because the defconfig maintainer is
> not responsive and nobody else has the HW to test, the defconfig should
> be dropped I'd say.

  Julien mentioned on IRC that it was actually boot tested on hardware.


  Applied to master, thanks.

  Regards,
  Arnout

> 
> Thomas

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
