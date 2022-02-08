Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E56E0C433EF
	for <buildroot@archiver.kernel.org>; Tue,  8 Feb 2022 11:20:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 88977404FE;
	Tue,  8 Feb 2022 11:20:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X28AdCFKPago; Tue,  8 Feb 2022 11:20:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6129F40435;
	Tue,  8 Feb 2022 11:20:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 33ABD1BF5F6
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 11:20:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2180C60C09
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 11:20:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OfyjvKqsjYiC for <buildroot@lists.busybox.net>;
 Tue,  8 Feb 2022 11:20:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd01-sp1.aruba.it (smtpcmd01-sp1.aruba.it [62.149.158.218])
 by smtp3.osuosl.org (Postfix) with ESMTP id B1344607DE
 for <buildroot@buildroot.org>; Tue,  8 Feb 2022 11:20:49 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id HOYBn6yFaroAhHOYBnXoX9; Tue, 08 Feb 2022 12:20:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644319248; bh=E7BfNVN2d8kcvNtBgdeHdyYxj11tF+KV+V+iLa0q+v0=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=hMrkzOmbayhOu/qMKh51/NK8Y5L/z28ic5xnbEZBLAkgXbKQWNOnGaD4UVGlPKs1I
 pkkNmkN0p8ymLJgIqaCBz/9L9KQanaXwqr2vDfsjNFApPJheDWO7q9vUkjmJL1Y3oQ
 gapDJKeXWhaJFKTar4zJ1tOdfu2gJ4MfkepagvK/5wA9Wh/KhR8Blf0tR9ZJIP8KiY
 HOmoyGGhR2MEkM9S++DDEwMtEYctARW3s8T/rxjMQkqhqG/11tIrWu6TyfH3GfiQhe
 lG1ZhiCZo2EDCDvUqcyXyZLjPCG+xOkLfw2nOxu1JiLcEGiEM8rrmAhpEdpeXyiQ9P
 H25psJf40hC7g==
Message-ID: <d1802130-75a7-84e9-d359-ff4afea3bdd7@benettiengineering.com>
Date: Tue, 8 Feb 2022 12:20:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Neal Frager <nealf@xilinx.com>
References: <SJ0PR02MB77580A9E2B0D263EE239D46ED72D9@SJ0PR02MB7758.namprd02.prod.outlook.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <SJ0PR02MB77580A9E2B0D263EE239D46ED72D9@SJ0PR02MB7758.namprd02.prod.outlook.com>
X-CMAE-Envelope: MS4wfMhG5V7zXbspUrheauS+WaLy42yHuuoKT1NXNe9TPDUv2Rsj9fgNMHW29WpSBy/JmTSOUVtdQiPokpvxEjufUXLTGj/wki3rO7D7cbW+88VpXxYLJTHb
 g+48Ic94q+ZFULXyCz8TUeAjE9hL1SaHR6TPgYNQ5furN8cBxKM5Ec4wnCeMi2FJuvZh12gNylwpoLUX9k+gBL07n0NhrFPrD/N2M2IPnOkf5gYJ+NQX0uyV
 99quPJE4qmrRyK0rOQWlp5BmZOgoApzdEWaZlrq2vTI=
Subject: Re: [Buildroot] Xilinx mainline ATF v2.6
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
Cc: "luca@lucaceresoli.net" <luca@lucaceresoli.net>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Neal,

On 08/02/22 12:13, Neal Frager wrote:
> Hi Giulio,
> 
>> today morning I had couple of hours and I've managed to fix the build failure and sent the patch upstream:
>> https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/13800
> 
>> Can you please give a try to that patch?
> 
>> Here is a fast link to download exactly that one:
>> https://review.trustedfirmware.org/changes/TF-A%2Ftrusted-firmware-a~13800/revisions/1/patch?download
> 
>> But its name is awful. So please:
>> # git clone https://github.com/giuliobenetti/trusted-firmware-a.git
>> # git checkout bl31-zynqmp-linker-failure # git format-patch -s -M -o . -1
> 
> I am trying to test your patch now, but when I follow your instructions, I get the following error upon checkout:
> 
> error: pathsec 'bl31-zynqmp-linker-failure' did not match any file(s) known to git.
> 
> Any ideas how I can obtain the proper patch for testing?

Yes, the branch name was wrong. So:
# git clone https://github.com/giuliobenetti/trusted-firmware-a.git
# cd trusted-firmware-a
# git checkout fix/bl31-zynqmp-linker-failure
# git format-patch -s -M -o . -1

Here is the pending patch in ARM Gerrit:
https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/13800
You can download it from there too following their instructions.

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

> On 04/02/22 14:32, Neal Frager wrote:
>> Hi Giulio,
>>
>> If you simply modify the defconfig from my patch to change BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v2.4" to BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v2.6" and rebuild, you will see the build error when trying to build the mainline ATF v2.6.  If you can fix it on your side, that would be great!
>> er
>> Best regards,
>>
>> Neal Frager
>> Xilinx
>>
>>
> 
> Best regards,
> Neal Frager
> Xilinx
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
