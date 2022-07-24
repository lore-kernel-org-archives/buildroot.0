Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0538FC43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 07:45:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F78383F9E;
	Sun, 24 Jul 2022 07:45:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F78383F9E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4iXidfQppqgb; Sun, 24 Jul 2022 07:45:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FE8383EF9;
	Sun, 24 Jul 2022 07:45:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8FE8383EF9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B562B1BF578
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 07:45:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8BFF4417B1
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 07:45:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8BFF4417B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zglg8-kEYIGd for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 07:45:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EFBBA41752
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EFBBA41752
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 07:45:26 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 a18-20020a05600c349200b003a30de68697so6506768wmq.0
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 00:45:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=dYG3V93hrQO6gSvxQCYDZKX5CeezLuFNuy7G3L7S9vE=;
 b=nHzAqWs1Z4zldla4d7D0t8yGyp5xh7cfkmNgzJk2XaFU5nsv3PILpaOVT5NobmeydL
 UIAmlo9xei7kXFvzU0C65V6Uni8GsHuQnWyweVB1X3ukilCG5hEEqcwT/5Pi48KomBld
 Zjrgmn/e8mqJ5snb06h3Enz8eCLWLvugZ2lW0/ov2C+SG6aTvbIhQA9hDk+Eh1JB9gMa
 bH/T/xw3O+xZfeJ/hHimFQGTkOZwnALjdXuBGek43xBj1I7p36XdCOSAvezYqRvEmLJJ
 THTAi4NPus52A1HOl0TzyrtoFsNktzLITOOZulQb3GhRHhfSiB/us29B5SpI4MXVccOJ
 JvYQ==
X-Gm-Message-State: AJIora9ertddoT3Qu3V3RVAAeFOfjCyGcr2Kog5V5e0nnBne79DtrQL1
 QQDzMiPqE9ZjVm1yUiBQXDuS1Q==
X-Google-Smtp-Source: AGRyM1vQ0XioKY2uK0vs3x0o4F+Zlbg6fhwijmiGgej9vXCQqPHEvtGQ2BCCcZ0ETbk5angRP4DosQ==
X-Received: by 2002:a05:600c:2056:b0:3a3:2cf8:ec9 with SMTP id
 p22-20020a05600c205600b003a32cf80ec9mr4767385wmg.51.1658648724722; 
 Sun, 24 Jul 2022 00:45:24 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 v1-20020adfe281000000b0021e5adb92desm7787984wri.60.2022.07.24.00.45.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jul 2022 00:45:24 -0700 (PDT)
Message-ID: <263543fd-ec60-fede-a500-2204ec1ffa30@mind.be>
Date: Sun, 24 Jul 2022 09:45:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Ricardo Martincoski <ricardo.martincoski@gmail.com>,
 thomas.petazzoni@bootlin.com
References: <20220723165800.54811fe3@windsurf>
 <62dccb0e9f68e_2245ea9d8-3e4@xultri.mail>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <62dccb0e9f68e_2245ea9d8-3e4@xultri.mail>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=dYG3V93hrQO6gSvxQCYDZKX5CeezLuFNuy7G3L7S9vE=;
 b=SnPFv3VBvZfY38Nrzn5m48sVYp+YGCoYZMogK+fHju5UK0D8oGQxtisR11l7kKyFzM
 Ervz+6b/l7YQtBHG89zeYRn8GOU4UjV/n/1YjuI6ebCZc8p3GBkkHIkpneSF+wDb0eSg
 atwbMY/x3ijVv/+RnxDN/xWuo7/Vq6dsRZ7lfSE2Gt5GJXQrgsi4rIOXwipW2LNj5+q0
 DELeb/QsfVvzVCwzUsMTH6SHPc2SchLBD8GByeqfj2TMSsbEeKmu4ilr+3QHFJRuFFBC
 C5KKqK8nvqmfYXepLnclhTD1bskxEWcKmBbnX5EUVSdv/W2uQU853HG2zoO3ryPDRI6C
 mTqA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=SnPFv3VB
Subject: Re: [Buildroot] [master, next,
 lts] utils/get-developer: fix DEVELOPERS syntax check on GitLab CI
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 24/07/2022 06:31, Ricardo Martincoski wrote:
> Hello Thomas,
> 
> On Sat, Jul 23, 2022 at 11:58 AM, Thomas Petazzoni wrote:
> 
> [snip]
> 
>> So instead, I've added a -v (v for validate) option in get-developers
>> that simply does the validation step. I didn't introduce the extra
>> complexity of making parse_developers() return the number of errors and
>> warnings, since this was anyway not used anywhere. So I simply rely on
> 
> They were being used to bail out on errors and warnings.
> +        if nerrors > 0:
> +            sys.exit(2)
> +        if nwarnings > 0:
> +            sys.exit(3)
> 
>> parse_developers() returning None when there is a validation failure.
> 
> The minor issue I see on trusting only on current parse_developers() return is
> that some cases do generate warnings but don't fall into this condition.
> 
> In the current master (95ea6664) we have:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/2761693090
> 31 $ utils/get-developers -v
> 32 WARNING: 'configs/minnowboard_max-graphical_defconfig' doesn't match any file
> 34 Running after_script 00:03
> 36 Saving cache 00:03
> 38 Uploading artifacts for successful job 00:04
> 40 Job succeeded
> 
> We could catch that in at least two ways:
> - adding the number of errors and warnings to parse_developers
> - in the GitLab CI using grep in the stderr from get-developers

  Or change parse_developers() to make that warning an error...

  Regards,
  Arnout

> 
> Regards,
> Ricardo
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
