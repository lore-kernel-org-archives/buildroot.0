Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAEDEC636CD
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 13:09:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 589694090E;
	Tue,  7 Feb 2023 13:09:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 589694090E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IkfxKz8dSafe; Tue,  7 Feb 2023 13:09:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5734A417B8;
	Tue,  7 Feb 2023 13:09:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5734A417B8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1BE0D1BF376
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 13:09:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 03503417B8
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 13:09:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03503417B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cMU0xyxf0DE4 for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 13:09:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C082F4090E
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C082F4090E
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 13:09:50 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id k13so6091594wrh.8
 for <buildroot@buildroot.org>; Tue, 07 Feb 2023 05:09:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=07ofZ2+dcqzTDeLqJAaw7lZXWYl2MJ/7ZfkRKy81Dz8=;
 b=3og+4bzHvuzQwak1WJXpnTJFUEgXUZsFHQ+jtGj2tYhZYGYnhmAzizeSDE2BkJDVBN
 A67S8b8OUgM+INn5GhhbG/0H4jtuNnCy2pf0ZYu/JUjnm2HxEg48VCEmDhZZ7pwRUu++
 P0jveo7VjOm6LsU+np8kqjnyYQo+rcIl15Bnb06oVcbEOY8Hzrk09BbOXOsIEcgkLycK
 8IGOroeanw+qgYybV29LpfOuaN7epm5uBMByDVDDi5nM/6JVePHmF0jLGLqbYAQui0Nd
 0jQDp6EfCBFrjcuT/+uP2MtK/iO0RJUTyxT9K1JX7z+CIZD8ndjSLrUwuuQu1W2NBAR0
 kCbQ==
X-Gm-Message-State: AO0yUKVm2H7fua6QO3gGLQz/YzrCTF/Rz1W+gZ2EBLFIqJS2Rsp1dQ+4
 9LeGZ+5ThnxZ6W9OS28igIEcQA==
X-Google-Smtp-Source: AK7set+pmmWI0mncyFmyMQmEAuHyDh5cVJit5UbSAlUtYXCInMAsz5C1KMyKXz0UGd5LUbtEcN4L7g==
X-Received: by 2002:adf:dd82:0:b0:2bf:b199:c7eb with SMTP id
 x2-20020adfdd82000000b002bfb199c7ebmr2794246wrl.54.1675775388771; 
 Tue, 07 Feb 2023 05:09:48 -0800 (PST)
Received: from [192.168.16.188] (cpe1150018.bra.be.verixi.net. [85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 h10-20020a5d504a000000b002c3efca57e1sm3309300wrt.110.2023.02.07.05.09.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 05:09:48 -0800 (PST)
Message-ID: <d2377e42-ecbd-0737-4684-d35f2784bf33@mind.be>
Date: Tue, 7 Feb 2023 14:09:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-GB
To: Icenowy Zheng <uwu@icenowy.me>, buildroot@buildroot.org
References: <20220616020353.497241-1-uwu@icenowy.me>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20220616020353.497241-1-uwu@icenowy.me>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=07ofZ2+dcqzTDeLqJAaw7lZXWYl2MJ/7ZfkRKy81Dz8=;
 b=Cm3mHcrTpR3DypZLe2V87Ey2pPfMn2n84VE9iKOfH5aJsyqF/C/JHV/HsPE5/x4Owq
 j6e6DPpTT+5Kseh4s5AnMXgjm1YGcnCrdTv9m3h/I3J8KEWPD/KqWvf5629lbZhpFKC1
 dWil5GODUWIEAyatBQxwRz3k/ZXqAnGLBdxoCx2zwd993+dpjPrUtu7ptuNkZcKeqw1c
 Y43DzzGIzdYFG7gV7xJaGBvXID+e3PDw62E2F23H3igC2gUsCXvqmb3jHjY3mUJ6TEwT
 GJYjt3d2JFMlLkF/1kjYoozgXM8ThfPCchjK6hsGVFLWvvsYLGVkhGntdkZtkYERU0ch
 dt8A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Cm3mHcrT
Subject: Re: [Buildroot] [PATCH] package/pkg-generic: ignore error when
 chmod'ing extracted source
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Icenswy,

On 16/06/2022 04:03, Icenowy Zheng wrote:
> The chmod command included in GNU coreutils 9.0 will exit with 1 when in

  As mentioned by Romain, this is really a bug in coreutils which was fixed in 
coreutils 9.1. Since I assume all distros will have updated their coreutils, I 
see little value in carrying a fix in Buildroot. On the other hand, there is 
some value in seeing a failure of the chmod.

  Therefore, I've marked this patch as Rejected in patchwork.

  Regardless, thank you for your contribution!

  Regards,
  Arnout

> a recursive a symlink is met and the mode of both itself and its target
> is retained; however this situation is usually expected (such kind of
> symlink exists in, e.g., a newly extracted tarball of Linux kernel),
> thus not a failure.
> 
> Considering this chmod call is only kind of vanishing, ignore error for
> it.
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> ---
>   package/pkg-generic.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index b233b07548..03e4b029b3 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -216,7 +216,7 @@ $(BUILD_DIR)/%/.stamp_extracted:
>   	$(Q)mkdir -p $(@D)
>   	$($(PKG)_EXTRACT_CMDS)
>   # some packages have messed up permissions inside
> -	$(Q)chmod -R +rw $(@D)
> +	-$(Q)chmod -R +rw $(@D)
>   	$(foreach hook,$($(PKG)_POST_EXTRACT_HOOKS),$(call $(hook))$(sep))
>   	@$(call step_end,extract)
>   	$(Q)touch $@
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
