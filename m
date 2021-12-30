Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2513CC433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 20:06:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 76EAE827E0;
	Thu, 30 Dec 2021 20:06:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 73BkDsTkjiy0; Thu, 30 Dec 2021 20:06:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D66A0827C6;
	Thu, 30 Dec 2021 20:05:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6DC8B1BF361
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 20:05:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 58F52827C6
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 20:05:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p8DMPkjSq98x for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 20:05:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd10102.aruba.it (smtpcmd10102.aruba.it [62.149.156.102])
 by smtp1.osuosl.org (Postfix) with ESMTP id 05BE3827C5
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 20:05:56 +0000 (UTC)
Received: from [192.168.50.18] ([146.241.138.59])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 31gPnNPN0LDgd31gPnrcZf; Thu, 30 Dec 2021 21:05:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1640894754; bh=go+Pk9eOS2M8imXO/n1DGhkezA1riOZaFFBhr9n0xk4=;
 h=Subject:From:To:Date:MIME-Version:Content-Type;
 b=VRQ/BHV0FxQni5Kvutozo+7zLAqNPOdF6LNnOnowOPuRCC1ACxFvsAhXX1c5LBmEz
 GsHa3aRl3SEn0/uDU074HV3NXlORVVL5ktRkFSZGnU6hggV8JVfYKJJjHbGz9LPZBR
 6SpJhtSH5w4JAyqWYruhO4uFUK7x+c3XnVJZ+ghLLlkbSnQ2W6wGwsVakksNR85hXa
 NZtarMJgov15pdftu4RJasAfwYBvHNwlTm7qfu3Rlwr3ooMTcRw6HwQc2vq8mmlJ9/
 AaYwbaXDP4KCzQADjevfGon6JdHuEmwyjcT1T8Dtt/GH7VqpXA0g2CgefQIU647DA2
 De7prRlT5oKqg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: Arnout Vandecappelle <arnout@mind.be>, buildroot@buildroot.org
References: <20210726235656.1df4ddeb@windsurf>
 <20210726223435.2906458-1-giulio.benetti@benettiengineering.com>
 <20210726223435.2906458-4-giulio.benetti@benettiengineering.com>
 <105b5335-044a-b800-2451-7c9edf6cf987@mind.be>
 <d6448805-9a07-0d5a-c527-60b42944de69@benettiengineering.com>
Message-ID: <391ca4ef-c213-e972-ac15-4ff3e225bf87@benettiengineering.com>
Date: Thu, 30 Dec 2021 21:05:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <d6448805-9a07-0d5a-c527-60b42944de69@benettiengineering.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfGNxF7uUzJ0Goh8KT6iWF7bwsdSF020XFszq1en2POQ0R0HEFKLm2en2E862DShCUxP6jqn/jCJul0eH3euRsiZBhf8oHwrWjyTeXtgmNWF9fI032yPp
 6rOXSRkrlZFmmmI+L2GbCIOQGjN9oBaxaFgaqs3ZLSCcdA23kQ6XQQXHiRHVRUhEDMcmNrf3cGflwmDtUsRa+Ll1N6RRYZoM6qA7XrsBUmyG721DxB9BgAch
 VHZe7Eb1xEymYEM4uY/u8wV6MzTqnuSmOOT//LrzfkRnBcGvcesF2+WVyxfTM6oAUTs8Ue7aXJP1aQLQvLmWxCe/BdZcz9PQrJLY6/krUYpQWbHZy3DIUyTd
 +ryQWkhue7siPhkS6cbLAOyALywr6qq8QJk7WfiwdpgEPMBdNeZTUEBKGb6nlEoBbP0+v4PEEO91E0Op6I9cZXW6x8wFg1ULb13pX8p0hIi+J/aAxsM=
Subject: Re: [Buildroot] [PATCH v2 3/3] toolchain: remove binutils bug 21464
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>, Matt Weber <matthew.weber@collins.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Arnout, Thomas, All,

On 17/08/21 23:27, Giulio Benetti wrote:
> Hi Arnout,
> 
> On 8/17/21 11:11 PM, Arnout Vandecappelle wrote:
>>
>>
>> On 27/07/2021 00:34, Giulio Benetti wrote:
>>> This bug has been fixed upstream and backported to buildroot binutils
>>> package. So let's remove it from toolchain/Config.in and from packages
>>> that are affected by it:
>>> - libgeos
>>> - postgis
>>> - protobuf
>>
>>    It's not clear to me if all the external toolchains that we use also have this
>> patch already. Basically that boils down to the stable and bleeding edge bootlin
>> toolchains.
>>
>>    Well, I'm pretty sure they're not yet updated, since they're still  2020.08-1...
> 
> For this patch we have to wait until all or1k patches have been applied
> to Bootlin toolchain and they got rebuilt and bumped.
> Then we can apply it since Buildroot will become OpenRisc bug free. But
> this depends on external OpenRisc toolchains that only Bootlin provide

Unfortunately libgeos is still affected by this bug and postgis too 
because it's its dependency. The reason is that libgeos has been bumped 
and I've never given a build after that.

Only protobuf has been fixed after rebuilding all Bootlin toolchains.
So I will report upstream that is usually very responsive and ask to fix 
this binutils again, hopefully once for all.

So please drop this patch. I'll send a patch for protobuf package only.

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
