Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51ABEC61DA4
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 09:28:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B348A40894;
	Mon,  6 Feb 2023 09:28:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B348A40894
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q4qv9T2oXdIT; Mon,  6 Feb 2023 09:28:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B509408B4;
	Mon,  6 Feb 2023 09:28:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B509408B4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 795281BF470
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 09:28:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 603F440894
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 09:28:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 603F440894
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JhAXdD6m5bZo for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 09:28:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3ABE840913
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3ABE840913
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 09:28:43 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id g6so1731520wrv.1
 for <buildroot@buildroot.org>; Mon, 06 Feb 2023 01:28:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5q+jKZu+7bQXZBKeKj/HbiQsZzEJfnA8Wn8u2SXtQfk=;
 b=0DQbWKnsgUSergPg6BvvytHOR2egGRxUkdrhRHVR3CXkszLT1LoGWczsEk04V5MD+5
 tkGOLeLR1n4hycTubZrLenj1TkEYeoKLYPLRm2dqxpHrbbij3zCMuDNnnLWS26edHoJ+
 TxRdknFT2zPHxmlZv+cjMu/B8NFZm+8vs1IPBceANghUyeTaJhZ1cew+zxJX4BInADIr
 wzRKewdftrk18hDMcpkHBgjRnggfQyHeTxAuKFRUelEnhWKfOmjEoHCYVWMKR+LpYtL2
 qXCsAWXpm/UJqkF04ELCjazXiT2HezNOV4HQeh8UsAP5B/vvwsK1IUWv6SwDHU1OQ3pE
 v9eg==
X-Gm-Message-State: AO0yUKXbUMOzIB8FmJjghBzRUe1TwhukHsoBJIQ2B9yYTEZhHNn9YoSz
 iFQQ4ccuPH5ttGwg+5ruAlL9qQ==
X-Google-Smtp-Source: AK7set8nzcvouge6jKEaKgq/QsIbAYumj10pJPBv3mZHcJFND1hL160c+fRVHmkJh2Un19ZTBwPzgg==
X-Received: by 2002:a5d:644a:0:b0:2c3:e16a:aa33 with SMTP id
 d10-20020a5d644a000000b002c3e16aaa33mr5584436wrw.36.1675675721419; 
 Mon, 06 Feb 2023 01:28:41 -0800 (PST)
Received: from [192.168.16.188] (cpe1150018.bra.be.verixi.net. [85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 t6-20020adfa2c6000000b002be063f6820sm8585046wra.81.2023.02.06.01.28.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 01:28:40 -0800 (PST)
Message-ID: <562fd1af-139a-1aa8-4c71-bd7c6a001fe3@mind.be>
Date: Mon, 6 Feb 2023 10:28:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-GB
To: Edgar Bonet <bonet@grenoble.cnrs.fr>,
 Ramon Crichlow <rcrichlow9000@gmail.com>, buildroot@buildroot.org
References: <CACHw65JEOTp4HhvXMUURSoD-ce5Topa1Z0VNvHWjw8HaBaE-aA@mail.gmail.com>
 <f9ed7f28-711a-2fd6-d04c-06d007a34fb7@grenoble.cnrs.fr>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <f9ed7f28-711a-2fd6-d04c-06d007a34fb7@grenoble.cnrs.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5q+jKZu+7bQXZBKeKj/HbiQsZzEJfnA8Wn8u2SXtQfk=;
 b=UsZ+p4mNj8BfK0U5J6qt0q5JiIMXo+MJRHRKL9fUVHLRAhXM7AOcaWUUDkksRTIZy4
 4XLrDvnjmJjdFL/CVvM03S8STnTuxAdBaEtkwniD4Fxj57MvI7TRR3RWMD8+u7yFsx8d
 q8AuyGUQGXS6IbD4moru+hsYb0EPnAzLJTecDokdAFOWaTT+fLShlZo3bDwGqtGoyyBl
 EELAwf0rc6+dvoo8BDVfQIR90e2qjQlZ1jluOBe3arSoROZdvtZgzew9m/BeRSl48GaV
 DzwFZtbLX0rQUQ9jp0TTPJkd7HLtF73LTOcvr7thE+EDGkWMp6h6tFVIHplCFb1Ua4UD
 cqPg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=UsZ+p4mN
Subject: Re: [Buildroot] Development flow to track .config
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 31/01/2023 22:36, Edgar Bonet wrote:
> Hello!
> 
> Ramon Crichlow wrote:
>> Is the following flow best practice?  If not please suggest a better one.
>>
>> 1.  Make a change to .config using make menuconfig
>> 2.  Diff the change between .config and .config.old
>> 3.  Edit abc_defconfig to mirror the changes in step 2
>> 4.  Commit abc_defconfig
> 
> Not sure it's the best, but here is what I do:
> 
> 1. git switch -c 'my-custom-branch'
> 2. make some_board_defconfig
> 3. make nconfig # or your preferred variant of menuconfig, save and exit
> 4. make savedefconfig # this will save the relevant changes to some_board_defconfig

  If you want to start from scratch instead of an existing defconfig, or if you 
want to save with a different filename, you can use

make savedefconfig BR2_DEFCONFIG=/path/to/defconfig/file

  Regards,
  Arnout


> 5. git commit -a -m 'My custom changes to some_board_defconfig'
> 
> Best regards,
> 
> Edgar.
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
