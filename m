Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F341C3DA63
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 10:23:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2983280BA2;
	Tue, 23 Jul 2024 10:23:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FLI0gTA2AbQ7; Tue, 23 Jul 2024 10:23:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1850280C67
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1850280C67;
	Tue, 23 Jul 2024 10:23:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0690A1BF20F
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 10:23:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E8C31607EA
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 10:23:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sHauyMoA5W0L for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 10:23:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EC4F2607E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC4F2607E9
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EC4F2607E9
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 10:23:41 +0000 (UTC)
Received: from [192.168.178.36] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 65F762C86623;
 Tue, 23 Jul 2024 12:23:39 +0200 (CEST)
Message-ID: <26240fd5-3e84-4b2f-a82b-aedda6c7b9f2@bubu1.eu>
Date: Tue, 23 Jul 2024 12:23:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bryan Brattlof <bb@ti.com>, Brandon Maier <brandon.maier@collins.com>
References: <20240626-gitignore-output-new-v4-1-fcb3ebc263ca@collins.com>
 <20240722234911.2u4obhhk6srzomsr@bryanbrattlof.com>
Content-Language: en-US
In-Reply-To: <20240722234911.2u4obhhk6srzomsr@bryanbrattlof.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1721730219; bh=JApQXTI6VLqbAdIdAjmU+BVtUsMOmpnwxiwp1BW7APM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=W1iCsw6vR2hdFge9pO8zqUU8POHQTF1HYbvY4WZFF9pOwVj/bJWSOFcd+D31Y5MG9
 HrNEOGr+ofmcc+P38J0FXH8p9IX2v3T/V9HJjFnFrOCvAUAi1U+DTJe9ZA/2+1TWlu
 Ig0ZHR1aRZkQrpd0XGIx0UV/gbpQigPMbRKd9SKd3JweF3QiNDJZLLpsnAOhcW+5Na
 9EJ7mSjDXV2ShqERnrPaCWGD06cF3W4QAgHt0t4jGFJdcP77jhY/MqL80UlagxVSQU
 Kn4hKHxUjY+s8EKfWXnIn06stwmonpiine94CaEK9wWnj0HQLaeAV7LT7KqBA+jT/Z
 blzsDcGEOpEng==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=W1iCsw6v
Subject: Re: [Buildroot] [PATCH v4] Create a .gitignore file in the
 CANONICAL_O directory
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Romain Naour <romain.naour@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Bryan,

On 23.07.24 01:49, Bryan Brattlof via buildroot wrote:
> Hello everyone!
> 
> On June 26, 2024 thus sayeth Brandon Maier via buildroot:
>> From: Yegor Yefremov <yegorslists@googlemail.com>
>>
>> This .gitignore file ignores all files in an output directory and
>> hence doesn't change the git status.
>>
>> Remove "/output" entry from the main .gitignore file as it is already
>> handled by this general approach.
>>
>> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
>> Signed-off-by: Brandon Maier <brandon.maier@collins.com>
>> ---
>> This is a resend of the v1 of this patch from Yegor Yefremov, as the
>> original patch series seems to have stalled.
>>
>> I'm not familiar with the process for resending someone else's patches,
>> so let me know if I should redo anything.
>>
>> I find having the output folders gitignore'd is useful as some newer
>> tools like fd-find and ripgrep will automatically respect gitignore.
>> Otherwise the output directories are huge and quick searches can
>> suddenly take a long time if I have created a few.
>> ---
> 
> For some odd reason this seems to have broken
> python-jsonschema-specifications in a fairly weird way that I'm not
> fully sure I understand.
> 
> Somehow when downloading the source with this patch applied the build
> will succeed but it will never be installed in the host directory.
> Reverting this patch and deleting the package in the dl/ directory fixes
> everything. (at least for TI's reference boards)
> 
> I'll continue to look into this, just wanted to start the thread just in
> the off chance someone else is doing the same :)

I just ran into the same problem now for pydantic-core, which pointed to 
https://github.com/PyO3/maturin/issues/1911

Is python-jsonschema-specifications also using the rust/maturin infra or 
is there a separate gitignore problem in another build tool?

Marcus

> 
> ~Bryan
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
