Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC50AC433F5
	for <buildroot@archiver.kernel.org>; Sat, 12 Feb 2022 22:05:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A603940022;
	Sat, 12 Feb 2022 22:05:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wsJQX4etuZR4; Sat, 12 Feb 2022 22:05:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9297C400AB;
	Sat, 12 Feb 2022 22:05:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7DBA21BF3AF
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 22:05:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 78C35606E7
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 22:05:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mu7yuVIgxaZw for <buildroot@lists.busybox.net>;
 Sat, 12 Feb 2022 22:05:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7812660671
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 22:05:07 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id co28so21585621edb.1
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 14:05:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=I+9bigQpSRz5fhCAq2j4TwQ8hZduiWwYuHXV5EEIN7E=;
 b=J5pvLlf5sAlRmPwd+LhNpbirBH5QQGEH6v8dCsQieWH4J8z6If6ADkgDeMFw3Jigv7
 g1ncefZDkbJQtvvRmbKoeCclhBWuIuPBkbQiLeUGhm0Zxg4clSC3/vOjqHh9MrJcYS3G
 fLnwweIAzWegHfAh7uGlpnSaemPGdDObNcqMigRmvvPqwQMFKY+sVuYcSWDcdyZvRuqZ
 a027XZbG4S8vkPNwWrbiW3CKGhJHIEG0Ch5HNomETvvs2Khl2Uo8bq7gli9T6MnQ+0VZ
 2mWG7R/eX1G5Z8pu+Z32k/eUY+Wpz0m294caIydiARW6tPp8xYjUtqP7k+fLxZVnCKDC
 3jww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=I+9bigQpSRz5fhCAq2j4TwQ8hZduiWwYuHXV5EEIN7E=;
 b=IzFyQyvWKH+1RocVtrc/4DgQmPDyQk11lyOwGA3oHgQcFIlMmbTBiD7VVUEiywhqOa
 vwWJm6xMEmtI07l7eRKhaxHGivURW/F8hAZABE/vQ0WQv8iKv4hkg+aT8JOlyWRfiMR9
 8jBTrg1UIGSgxcfVTtOgYJwSabPry/T5Tihk2y681y18pBp9SFVpaOEu26bycnoXfNn8
 Zs5SmRCMkCJat/zumL+rfiz3rFOcbh9/aB2lm7f8E4TC2RraIH9MruOqtiAAqSzU+w6v
 fO67e0Rgwi1APzjzU0dP0kPwT7ljFn/rXyqqU5kiRwiDrFiSM8U0rDQ+0Z1n1RC7XoR9
 yFuA==
X-Gm-Message-State: AOAM531ov6Bv/ZtCWdyUJEBzpx54iQtV/VOdSB5he0DK0/K046HZvOx3
 ZTd4W8k7gsWKkoJqrDiOOH4kYmwflJ610A==
X-Google-Smtp-Source: ABdhPJxID+a23rx2wnCiHJ4J5CIeBe9c20dn/e3c/hsm9ml5TFufmgPZGlh59SUlTfPukCcmy/bKgw==
X-Received: by 2002:a50:d70e:: with SMTP id t14mr8390146edi.19.1644703505758; 
 Sat, 12 Feb 2022 14:05:05 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id s8sm1017640edd.72.2022.02.12.14.05.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Feb 2022 14:05:05 -0800 (PST)
Message-ID: <32309155-0d7e-94ff-603f-496c783e82d5@mind.be>
Date: Sat, 12 Feb 2022 23:05:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20220204005610.897894-1-giulio.benetti@benettiengineering.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220204005610.897894-1-giulio.benetti@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH] board/pc: fix build failure due to new
 genimage 15
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



On 04/02/2022 01:56, Giulio Benetti wrote:
> Actually genimage fails to create final image with:
> ```
> ERROR: hdimage(disk.img): partition [MBR] (offset 0x1b8, size 0x48) overlaps previous partition boot (offset 0x0, size 0x200)
> ERROR: hdimage(disk.img): bootloaders, etc. that overlap with the partition table must declare the overlapping area as a hole.
> ```
> 
> This is because genimage 15 is less permissive than before, so let's add
> holes = {"(440; 512)"} to leave room to MBR.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935249
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   board/pc/genimage-bios.cfg | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/board/pc/genimage-bios.cfg b/board/pc/genimage-bios.cfg
> index 26d12d9ab3..54026f6527 100644
> --- a/board/pc/genimage-bios.cfg
> +++ b/board/pc/genimage-bios.cfg
> @@ -7,6 +7,7 @@ image disk.img {
>   		image = "boot.img"
>   		offset = 0
>   		size = 512
> +		holes = {"(440; 512)"}
>   	}
>   
>   	partition grub {
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
