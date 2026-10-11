Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 315BDCA9ECF
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 22:02:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 376B380C68;
	Sun, 11 Oct 2026 22:01:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EtPE2NfNnpEA; Sun, 11 Oct 2026 22:01:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4DE3B80C5C
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791756117;
	b=UHCOO3ixq6jtvHIHkP773/X43saIMOOxnkAYAn6m87ZgvdMGx3KXRgYYvKurG7v0kTON
	 N+YnEpANhcQYIROrpj1wrqX96sfU4OJHZ3RUn7FK6Gv4uZFUGYmpAYyWUhoMqYJ+ibr16
	 0O4uVqx8NEpBky/Req1C8qpiuNx3BXowBPpd2ltDeXenblV57Z+smA0ogLB8PPhVkQU+Z
	 nOr0tjzRlfHBpUGHDH4cf7aklGIg+WD2xVL1J1GQiAqTihVhQj0V3+zaNJhJEAteufIkl
	 1JtxNot2aQ1kYGgM96WsHDOBLjnlYat4dSRSCSFTvknjyXqg6kfBikVnvm+9R3ZqDTQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791756117;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 To:Cc:References:Content-Language:In-Reply-To:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Transfer-Encoding:Content-Type:Errors-To:Sender;
	bh=yqevp01MuASXdVUOUvGyTvrL0fc6GZkmvrIPol+BY+8=;
	b=Vw7QQ2450N0m0jxD2rgSU0SIU8sUvh6uQmIYexzFFcatPwlWRD7LuIPb4LrUf3K7cv6Y
	 6yehNoYstdDgEGyO+jUApivzCkvopIgSFEvte3ZrVoIhoTVNXngTEfb6+XM4ZTIj1Dyqf
	 h4WMuRmiT/O0gXb1Z8TVG70HpGDIz7+602sx5shd5GQOvRlj602+a/Nny2VfFYgffFyW2
	 kNlDb+SlU5v/tQm8oo07pFQws3EIgjg1IbQnksT/af8EdWYBX+aNNMzuvTLwo+dtkCGcr
	 pHkTu1FcczZpSd/dxWRKhojIjpclF24ZL1vE88Xefr7AHVSxH/un+YbX3aoTL443G6Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791756117;
	bh=yqevp01MuASXdVUOUvGyTvrL0fc6GZkmvrIPol+BY+8=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lpXa5QmSc9ghqMzdkDBosZ7nNarfpYt6YwT+HLnR072o6jLgZmbD4WsMmDRcZwGLw
	 5EYb65vUO7+cl3W4skFOEx1pAAKXXZ+2F7i1pICxlslW9hMTIvq50iWk/JUYn1/HUj
	 zytcd9fQJiRCsKiVNf86fexMLCp0r2YQfJ5zIHCPJbDxruPa2Uh5Le2tRlxm1IjPJ9
	 86998XfCZbk5ZL3ypZGTxn5M8CLWnSXtPaK4Xj/xe6hmZaHZ6+yT9CbJ136lnwjDwV
	 0AjIT9VaYML56Xz75nyeywmkETLBM6UrLzPSBs7K4XngJYkwirNzrUUEDwl3QBpV3C
	 Vk9cV4hEuX8QQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4DE3B80C5C;
	Sun, 11 Oct 2026 22:01:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AFD59380
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 22:01:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A206C80C5C
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 22:01:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UD8cPZIoy6CW for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 22:01:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8D90580BB7
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791756115;
 b=VGg1wMI1kjQ0rFEVpoVY7IAQ0U0KxDYsTMNfy7MFV1JfeSBRx2F4FYY6h0PAGfVC7Qn4
 rJutasOP0tf1LoHcx3eFhW7YGwYHelIM7wWG7gwzeJ42rmZh62af/XuIJR+ovhAPmQo+1
 s3CVh5PxZtaMnCVNaAtk0qrHT16cA2ifKXz718y1qGiT3xotNAXA0mDuYaZRmVFq/eWbg
 nM6JLeXzAwHJEd/64RUqWWWzfO+Ao+DuIrH/QOK+QKbykBU5tU5ZCjSwCB6ezQRGvvsXM
 Sx7sFr6gd6oscb39IvWwKwzk7Q2FHWdO9wx8KOGwWC5V4bT8IyJai2KMRKoypLpPV5A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791756115;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
 Content-Language:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding;
 bh=oemWxtGwpr/TPZ243W9ZL5UW4h7pZ2EEo3tczmsmhjA=;
 b=UeoWGKUu+wsRzYaUsJWEBtnvL34lm/2hRvPBxbyV2GgbaG0Eyg2qB/SS9oLnnrdO+6GX
 BjwDGoa/UAtWnFozslmUlLntBYAwqzOPinWxqoOsHp+U+bxgMgeDfbCmxtQPLc6bbBWi4
 72RFKFZOSMV8W08sBPG4Eagn9xv6/xLyOA1OoDnlwjZU2OpkdqiRpZ2So+NQxUDhN86W6
 6NB6f0BywFpUdwDc34ZFG35pcGB1tAzh2TWHzk9P9Wwv4BWmsU1wK8tLIZ2zqUxzeQ9gT
 UU6u96VHX9KvwkFDEmE646vLYtXwEtfCREXO0kVwiJ6z5U8F5sE0CGX+OyANGWYnPPA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=IhrgatBP; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8D90580BB7
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 22:01:54 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-48af4d4e61fso783466f8f.2
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 15:01:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791756113; x=1792360913;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=oemWxtGwpr/TPZ243W9ZL5UW4h7pZ2EEo3tczmsmhjA=;
 b=12edUGJkr/hVWsOKDjExr1bLqbjHq1YRtEIhyHCzlbLwdZS2ICDstTRKFhZR8OyRaf
 AjsLcmMzH0E5mhZS0j/vt0Tk7Cu7XYEdcAHR6tYzn/n+fN0rzxc3BD5ZthgV7PlWzsIZ
 XKPttUbQAoy+GCl1kSzV0Yd9pAdyvio4r0Tfuc8IJ3H+iWOx7F40hPP8IfGDmupMtK7I
 k5tJpPQu78A53WWAaybab02zluvmMuYrv0pgqDoNDMO/QQ0MKLsfRo6bMdD+dmxqECLa
 wrUxkrfroXHUUsWGpMwO0O8KMm5l+QYBxXTs8KRQjsrFQk5oI9mOCC5MF5n3AGQgNjHO
 TZZQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwIqmnBCS6xul664T9ky0dRpxV6Hj/geEsXL5Xu6zlwY6HbYUkX0s3Vr62Ltd3PeCtCyU+H+3arKAY=@buildroot.org
X-Gm-Message-State: AFq9FYKATSFjQI/1wxYAXHoKW+egmRvRiSCNwEyqdu+y9F40/hjhl0US
 w+yU71sc6hY6hIMriQFObQYR3utR81raJ5UMkJrxZcy2Ac7M4BXovmep4RGVEyAwaC0=
X-Gm-Gg: AYBFou1Us3FDufqJGgx16Axifj6wFQhu68L3VvrT5XENI8rIqnmb73ivAbl8TEtYrza
 oUbf65wVeHgquJcKw0ehIUhU5cL2SX2gOGFLASiBjoZz/0RD/pFVhwtzga7yRyoY0oxg2TSh/eH
 n7XcOgtXeTNtarUh7Q1lToLGWPWgOHYIuQ5DwdRNcM2izfVLc65C3prUxq0QDR8duhFxvdiksRk
 CGwrJDXYMYtPMmWk5WErhtJABk1mbRhKLNIiJPPkzumDXiqScWXzJwXcRw3J9bdeTM0ZvUIjQJP
 e/I11oPNiKX2rn3qPrm8NqApdeIHY+D7F+54FIrqYafSFO3An7aAC9cVkbRRAGQ86sKIBZ6aV7E
 NZIfSXcFFno40+s65HXZN3bXDj/lUwkSyHHOGVom7FphS5BdDrCl1a+/mtB9ngUfC3m6Sx7MpSD
 d7gLdZ7TRs3IL4ueP+q4u5stinRIntQImMgTlAWNWh8q4t5SVHNdDV+ey2mphj1dyPO0cR7MaBq
 PX9WVX5W4lQf+1BXe94TY4sZgkcwbqq1jFDuml7x7d3
X-Received: by 2002:a05:6000:2303:b0:48b:58e:6cd9 with SMTP id
 ffacd0b85a97d-48dbacea01fmr17388958f8f.14.1791756112157; 
 Sun, 11 Oct 2026 15:01:52 -0700 (PDT)
Received: from [10.20.174.153] (ptr-94-109-36-182.dyn.orange.be.
 [94.109.36.182]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48db94e4018sm16193815f8f.11.2026.10.11.15.01.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 11 Oct 2026 15:01:51 -0700 (PDT)
Message-ID: <ff2b41ff-0c2a-44c9-8938-cb39cfb5ca7a@mind.be>
Date: Mon, 12 Oct 2026 00:01:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Neal Frager <neal.frager@amd.com>, buildroot@buildroot.org
Cc: alistair@alistair23.me, stefano.stabellini@amd.com,
 ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 micheal.saleab@amd.com, yann.morin@orange.com, matthew.l.weber3@boeing.com,
 Matthew Weber <mathew.l.weber3@boeing.com>, brandon.maier@collins.com,
 john.ernberg@actia.se, brian.j.wood2@boeing.com, ju.o@free.fr,
 stewart.hildebrand@amd.com, thomas.petazzoni@bootlin.com, arnout@rnout.be,
 romain.naour@smile.fr, michal.simek@amd.com, romain.naour@gmail.com
References: <20261001124057.1941988-1-neal.frager@amd.com>
Content-Language: en-US
In-Reply-To: <20261001124057.1941988-1-neal.frager@amd.com>
Subject: Re: [Buildroot] [PATCH v6 1/3] package/xen: add custom version
 support
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Neal and all,

(replying to this first patch, but the comments apply to the whole series)

On 1/10/26 14:40, Neal Frager via buildroot wrote:
> Add the ability to configure specific Xen versions while leaving the default
> version unchanged to avoid breaking any builds already using Xen 4.22.0.

We brought this topic to the Buildroot developers meeting this week-end 
after ELC. While there was no strong argument against merging this, 
there wasn't any in favor either.

What was agreed upon is that it misses a justification for doing so, ie. 
what is the actual reason prompting for this feature ? An alternative 
could be to package these alternative Xen trees in a br2-external, or to 
use OVERRIDE_SRCDIR but there might be a good reason for not doing that ?

Moreover, Xen has a track record of regularly breaking the build and 
requiring manual tweaks to xen.mk. For example, since Xen 4.20 no longer 
bundles qemu-xen in its release tarball, the bump to 4.21.1 required 
adding a separate qemu-xen package to avoid downloading submodules from 
the internet during the build.

> To test:
> BR2_aarch64=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
> BR2_PACKAGE_XEN=y
> BR2_PACKAGE_XEN_CUSTOM_VERSION=y
> BR2_PACKAGE_XEN_CUSTOM_VERSION_VALUE="4.21.2"
>
> Add to package/xen/xen.hash:
> sha256  9c5c2ad0b4ab86ddd378f60ecc5b1ed53d36b436249ba27c86831003e1281fa3  xen-4.21.2.tar.gz

Additionally, all your patches mention manually editing xen.hash to add 
a new entry, which somewhat defeats the purpose of the custom version: 
users could as well edit xen.mk to chose an alternate version.

Finally, in the discussion of v4 [1] Matt touched on qemu-xen that could 
fall out of sync with Xen itself, and I would stress that this is even 
more of a problem if selecting an older version, predating the rework 
for Xen 4.21.

[1] 
https://lore.kernel.org/buildroot/BN0P110MB20672AF5339439D6D7AD3013F3D5A@BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM/

Kind regards,
Titouan


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
