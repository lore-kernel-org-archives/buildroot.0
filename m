Return-Path: <SRS0=Fkjy=NM=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C839C4338F
	for <buildroot@archiver.kernel.org>; Sat, 21 Aug 2021 23:08:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F2DF60E93
	for <buildroot@archiver.kernel.org>; Sat, 21 Aug 2021 23:08:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9F2DF60E93
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73FF080E89;
	Sat, 21 Aug 2021 23:08:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5ImFaHzkcdT2; Sat, 21 Aug 2021 23:08:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 19C4080E8E;
	Sat, 21 Aug 2021 23:08:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5C0151BF41B
 for <buildroot@lists.busybox.net>; Sat, 21 Aug 2021 23:08:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4A28440109
 for <buildroot@lists.busybox.net>; Sat, 21 Aug 2021 23:08:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XuJuwaTWoVhG for <buildroot@lists.busybox.net>;
 Sat, 21 Aug 2021 23:08:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd01-ws.aruba.it (smtpcmd01-ws.aruba.it [62.149.158.241])
 by smtp2.osuosl.org (Postfix) with ESMTP id 76157400CB
 for <buildroot@buildroot.org>; Sat, 21 Aug 2021 23:08:08 +0000 (UTC)
Received: from [192.168.47.129] ([141.136.161.207])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Ha5rmuRw0Zx06Ha5smLqse; Sun, 22 Aug 2021 01:08:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1629587287; bh=jzpmtjgVXR+SD22l2hGjxzpF2xlIHLX8c7mmf/xumUA=;
 h=Subject:From:To:Date:MIME-Version:Content-Type;
 b=JUTXvCA4hYfZ87fbBhl6j8VsUsF/0OHBonO3baBiQO0X/URys3Y8xSPVC+nQEZVj8
 7K1EeJrdYIHX6pQ+94ggmujvtmTrPXqHyIXlqItR6RiqKRCu+BQcif5RhQRKRejzNS
 kqRD+s2InqRBYJB0yMZUtFmaksi6sqXkdGRD2Zjm4GiVIcEgK2VRwGpa6t7c3BDw9b
 SslbsmPytLT1RhjABFpop2K7Z3lN2BFC6/8rmxjkgK6p+buDszrWqf62G/dVaAVEcL
 P8yxh1ShMEe4Ko7BAqV9yIC2rrswoicZzrw34ve2gMRA5y9qkAo66WTmoRZxQPht8A
 CE/fOEUeKcMLQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org, 
 Matthew Weber <matthew.weber@rockwellcollins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Adam Duskett <aduskett@gmail.com>, Herve Codina <herve.codina@bootlin.com>,
 Giulio Benetti <giulio.benetti@micronovasrl.com>,
 Bernd Kuhls <bernd.kuhls@t-online.de>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Arnout Vandecappelle <arnout@mind.be>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>
References: <20210818065730.330904074D@smtp4.osuosl.org>
 <20210818234453.03d2237a@windsurf>
 <412e2832-62e5-8cbe-6a85-e797b3281978@benettiengineering.com>
Message-ID: <7bd7ca27-6dae-bd41-b26c-da857344c0d0@benettiengineering.com>
Date: Sun, 22 Aug 2021 01:08:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <412e2832-62e5-8cbe-6a85-e797b3281978@benettiengineering.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfMyRH/VSms+lx6mifKAANaRnNCaZCkCCeLwt/BbrDkZBHbs5unhwUEVq8bfB8+gOS2FDfZkjcowqyqzfemSuCVVe6mCf1CPsvyCLCyF5vu3WNcwbCKjy
 RToW+dGb6FHAH3dVqxUwMOPcudxOXOlm1GHBlr7a3f69DcfU0rB9hpYeFB+ARyrhYTbVLheUz9QCltxR4YOe61aeEWnjxRGEiHMHwh+5B6QLL0hdZp2eSt29
 MVySU2NviQU9bshlLhvD/VATwIKrTRb8hhN9WNjnxgOqobZoj0Kw1lcCoLgT2mhw1BPxUByLS5i7jVHq+HKe7Yc7/0PZQlotdBVGiLnRbfw8lBS7Bc9TFKCx
 17AP9Ut4+50ve/XbHuz2IzQchniuKfrNhok2tv6G3TQQvILDnsSdzxuB+CeSpTs2BVbzhO3jZE5bHSQ4UKDxc9zrZbALRB38Db+X/erYHXbqf+1PINYcTiF5
 C5YV6hUiTGxJlqEgZpTEfQRsXrx78ORSFMLPn+ncOJQWbMucjw1nnF/7tGgmNrYTtupjUu+CQAOWLFHbaAOnlaLYXQCpjCubTrQuvlzC+6QPAh6e+PO5WM+p
 tI/DQmozG8UxBJ5ImRZPA7CY
Subject: Re: [Buildroot] Analysis of build results for 2021-08-17
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hello Thomas,

On 8/19/21 12:24 AM, Giulio Benetti wrote:
>>>       m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/b92980a563fe7ee331e70f288ce041be0bf29d40 |
>>
>> /tmp/ccix98g9.s: Assembler messages:
>> /tmp/ccix98g9.s: Fatal error: Tried to convert PC relative branch to absolute jump
>>
>> Another toolchain issue... Adding Giulio in the loop.
>>
> 
> I'm reproducing it now.
> 

This ^^^ is fixed by this patch:
https://patchwork.ozlabs.org/project/buildroot/patch/20210821230613.470903-1-giulio.benetti@benettiengineering.com/

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
