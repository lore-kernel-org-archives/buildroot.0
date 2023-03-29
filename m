Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB944C6FD18
	for <buildroot@archiver.kernel.org>; Wed, 29 Mar 2023 12:39:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C30141DD3;
	Wed, 29 Mar 2023 12:39:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C30141DD3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8FEjOiv7uNZI; Wed, 29 Mar 2023 12:39:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0547141DCE;
	Wed, 29 Mar 2023 12:39:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0547141DCE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7F9A01BF5A1
 for <buildroot@lists.busybox.net>; Wed, 29 Mar 2023 12:39:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5961061474
 for <buildroot@lists.busybox.net>; Wed, 29 Mar 2023 12:39:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5961061474
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vP0RHvBuOJXB for <buildroot@lists.busybox.net>;
 Wed, 29 Mar 2023 12:39:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6793260D63
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6793260D63
 for <buildroot@buildroot.org>; Wed, 29 Mar 2023 12:39:47 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 lr16-20020a17090b4b9000b0023f187954acso16013768pjb.2
 for <buildroot@buildroot.org>; Wed, 29 Mar 2023 05:39:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680093587; x=1682685587;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4NJjZxkk4pea7R5Hk1OHNhJBx85Yo1P1rXoX/VdYTJo=;
 b=oaKsO3Fezs64fPS0hI7amlpefqsBTPA0FTIeDix74ynETkVQdYBSd8sBVqN0o0F58d
 jf35YtfaS+AVAnph/rObDv1hOnBT978KD6V+EzAsMjLOCQ2srLm26YWnhsf1K+QNRZV2
 bp0z9JmnAzRJ3FX8GavUUIoWLquUne0nFatf+kyZpns935UIFC6zIN5V9GknnFgjZcEA
 FB3/x7InESPTuuVLJsUkTSobTNqYIF9oJld23P4gZSZZimjdVFY/pPzz2kaJ0viXjKgg
 gfQg0rde7V0odgsy0hfD7WlhKt3w8svUZR4m5hCIXFM5KHCPbjak8kPr2QGJf0Vtqj0A
 Of3Q==
X-Gm-Message-State: AAQBX9d8qvjHHz0S7TqdU6xPu0mKvW5HUPIGFRyTPsSJ0HytVw6ZC9Ei
 tNjL+sf5u5aVgRbb8na97TA=
X-Google-Smtp-Source: AKy350YmEzA10FPRMsrrwttAvoRhtc0WilGcIUwE9luhoIqQ2ldTPuIdP6sQdlVUr0X7zo6VylQpAQ==
X-Received: by 2002:a17:903:120b:b0:1a0:42d4:e38a with SMTP id
 l11-20020a170903120b00b001a042d4e38amr24888058plh.11.1680093586628; 
 Wed, 29 Mar 2023 05:39:46 -0700 (PDT)
Received: from [192.168.1.105] (ip72-194-116-95.oc.oc.cox.net. [72.194.116.95])
 by smtp.gmail.com with ESMTPSA id
 12-20020a170902c10c00b0019cad2de86bsm22948941pli.156.2023.03.29.05.39.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Mar 2023 05:39:46 -0700 (PDT)
Message-ID: <f4e1e805-4ab0-e187-8001-c5cfa9c0be00@gmail.com>
Date: Wed, 29 Mar 2023 05:39:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Arnout Vandecappelle <arnout@mind.be>
References: <20230326130937.56650-1-f.fainelli@gmail.com>
 <20230328202533.GD3204460@scaer>
 <c7968ace-cfbb-1c54-bdde-083a37423686@mind.be>
 <20230329105022.6137bf1a@windsurf>
 <ffed7523-6dbe-6d61-03e7-57cdbc732097@mind.be>
 <20230329112855.6110cf8d@windsurf>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20230329112855.6110cf8d@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680093587; x=1682685587;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4NJjZxkk4pea7R5Hk1OHNhJBx85Yo1P1rXoX/VdYTJo=;
 b=LUPeB5qspkyk0pycSDSVkvNf+W0kSYMASXiJ2+KnEOuP2kQo2i9tfAOVqmSrQxdBoB
 qjh/1ab1J/KOtVxIDvJYH59bCM3Z5PhmUzZXk1VYs8zILPDUZDkV/J0ez8GI4imTByMI
 TpReymOlg9dRb60SCttBOeuOWb61OyFWjmrX2zqArbFqbqdGR3Cp4wT8jR/gt6V6cUNx
 YeNif3z1FMkgkgQ+JWmAk1tiLQsfBlPIPVTQBrMLKDlGDi1+AfQFmtTuKPdXphygI830
 yO9AcaFyLcomeVZCB416UmidXhfx2pVzQ43P6oijvhFqWLcUkLjekSNFUg66/HxEijSa
 BxjQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=LUPeB5qs
Subject: Re: [Buildroot] Indicating upstream status [was: [PATCH]
 package/bluez5_utils: Fix builds with musl-libc]
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
Cc: d.lang@abatec.at, marcin@bis.org.pl,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 3/29/2023 2:28 AM, Thomas Petazzoni wrote:
> On Wed, 29 Mar 2023 11:06:47 +0200
> Arnout Vandecappelle <arnout@mind.be> wrote:
> 
>>    Yeah, that's why I propose "Upstream:" - it's generic enough to cover all of
>> these cases. The contents can be freeform I think, check-package should just
>> check that the Upstream tag is present. And the documentation should give
>> examples of the five cases you mention.
> 
> Sure.

Yocto uses the following format [1]:

Upstream-status: 
(Pending|Submitted|Accepted|Backport|Denied|Inappropriate [reason])

would you want to adopt something similar? OpenWrt to some extent does 
something like that as well although in a less unified fashion, 
sometimes the patches are placed in a specific patch directory 
(backport-x.y.z, upstream-x.y.z) and sometimes that information is 
placed in the patch file itself.

[1]: 
http://wiki.yoctoproject.org/wiki/Best_Known_Methods_%28BKMs%29_for_Package_Updating#Patch_Comments

> 
>>    The "patch taken from downstream" is the only one which doesn't fit in the
>> "Upstream" thing. But it's also a situation we don't really like: we basically
>> don't want local patches, and a patch taken from some other distro _is_ a local
>> patch.
> 
> The reality is that we have such patches (for example to fix musl build
> issues), and we somehow have to live with them.
> 
> Thomas

-- 
Florian
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
