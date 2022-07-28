Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CE4FC04A68
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 19:06:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BC3E140573;
	Thu, 28 Jul 2022 19:06:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC3E140573
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ACk-XqjwuQsa; Thu, 28 Jul 2022 19:06:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C3B304031D;
	Thu, 28 Jul 2022 19:06:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C3B304031D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ADE2C1C1190
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 19:05:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9502760B73
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 19:05:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9502760B73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qei9aAsJOjhA for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 19:05:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7952960AB5
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7952960AB5
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 19:05:46 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id mf4so4714220ejc.3
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 12:05:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ZA48vGBAO1hvQpyZGo0U927qVE0nIBPFOa8TTnZeCOw=;
 b=JibKoVJa9vND4LLPQbKCMO36lxFNDUtNEg4gKpubBcbaprMkAGM+OlNKRDW5Y2FJ74
 NUJzu8ELShu4jk++dkPvbR2ASW9UaLKP+gYMPU7MbjyYdRAQGkc7W0SNmZR/UjRgkf61
 7bqrFMR1tbZAy0gqRXQeH5nI9mG2sZLb6GEIV33rUFsN1bJQu5wmVJfyB3KWbQZ6TnQw
 TUKfDiRjVOTEvoW58Y4fK0H+n5XXkxgf7uEWRHlzGq2EVEtxV4AxYZWRQPKMOnVMOX4t
 qNdoxa1NhM6XvHzldQoQXcd7U3wYTONumeSkARTZ7XKM/i0duXzgKUUTiO4hDijUB3AZ
 9NwQ==
X-Gm-Message-State: AJIora9vV4cQHTLHEX9z4GDSKG0MbExT0INBMdxItmgUYiludda6QJi1
 1jHSp+P3uev1qv5+unU8EoddzQ==
X-Google-Smtp-Source: AGRyM1tGgUOMlN/nrd/xnTy5eypArSZpJxs2J6KUQA3+/93l6GV2IAf7jX8vLEYjeX8AxdCFEqVJVA==
X-Received: by 2002:a17:907:b590:b0:72b:949c:c737 with SMTP id
 qx16-20020a170907b59000b0072b949cc737mr243991ejc.155.1659035144609; 
 Thu, 28 Jul 2022 12:05:44 -0700 (PDT)
Received: from [10.101.1.216] (ip-185-104-137-32.ptr.icomera.net.
 [185.104.137.32]) by smtp.gmail.com with ESMTPSA id
 u6-20020aa7d986000000b0043bb8023caesm1126518eds.62.2022.07.28.12.05.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jul 2022 12:05:44 -0700 (PDT)
Message-ID: <f5755138-0cf5-1ace-ed13-7718c5799189@mind.be>
Date: Thu, 28 Jul 2022 21:05:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Norbert Lange <nolange79@gmail.com>, buildroot@buildroot.org
References: <20220222102211.74573-1-nolange79@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220222102211.74573-1-nolange79@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=ZA48vGBAO1hvQpyZGo0U927qVE0nIBPFOa8TTnZeCOw=;
 b=aQiT4PPHSsxNxMOMFH+awEufOKq+SXFaU84Tak+0y8wOjqCQ4QZk/5s/iVS4VO8FU4
 kYL3fMFn8MEwxCznMYSJSmXCuXA21aT3zBMoYAnBKiovRRgi0B+Z7WN4HLtopNYwv+zq
 RX7fZihnYWoXiY9yOpgGHk/pbjh/9ARMKIHHg90Ba1eHUh0iRN9dYAeb1kLkDiYjlf8J
 1b3xRMSI2TPymKSkrWr07JiGgF6EVCWI2cUn+V6Z6tJQJJZrdywH/18QcdZp43KTfakz
 ZcF21ZdFtNMP36b1JTpdmVdpzhX8A74YXEfZK1dV3M/YgidbHYU0nCKK7YP+XR0bgYx6
 y0mQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=aQiT4PPH
Subject: Re: [Buildroot] Patch series
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



On 22/02/2022 11:22, Norbert Lange wrote:
> As is was suggested I pulled my patches in a series,
> this should combine most of my open work.
> 
> It does *not* contain:
> 
> -   toolchain: support mismatched merged usr [1]
>      recent enough
> 
> -   package/dbus-broker: new package [2]
>      recent enough
> 
> -   package/openssh: improve integration for systemd [3]
>      outdated, no time to fix it
> 
> 
> Patch 1 and 2 set the runstatedir for CMake and Autotools (new patches)
> 
> Patch 3 and 4 are rebased and adopted to feedback.
> 
> Patch 5 contains a better commit message
> 
> Patch 6 and 7 are new
> 
> 
> [PATCH v3 1/7] package/pkg-cmake.mk: use /run as runtime path
> [PATCH v3 2/7] pkg-autotools: optimistically set runstatedir
> [PATCH v3 3/7] package/systemd: use current tool for generating HWDB
> [PATCH v3 4/7] package/systemd: remove hwdb-update service
> [PATCH v3 5/7] Makefile: remove /usr/lib/rpm directory on target
> [PATCH v3 6/7] package/zsh: Enable dynamic modules
> [PATCH v3 7/7] package/zsh: enable static regex module

  Series applied to master, thanks.

  I updated the commit messages in almost all of them. They were already pretty 
good, but writing it down myself helps in understanding everything.

  I have a few more comments in individual patches.

  Regards,
  Arnout


> 
> [1] - https://lists.buildroot.org/pipermail/buildroot/2022-February/637079.html
> [2] - https://patchwork.ozlabs.org/project/buildroot/patch/20220109221650.777610-1-nolange79@gmail.com/
> [3] - https://patchwork.ozlabs.org/project/buildroot/patch/20200611091407.12688-2-nolange79@gmail.com/
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
