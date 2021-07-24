Return-Path: <SRS0=+dJA=MQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C66E8C4338F
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 14:54:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E34DC60EB0
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 14:54:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E34DC60EB0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2ACD403FB;
	Sat, 24 Jul 2021 14:54:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uQLFc-2MTcwL; Sat, 24 Jul 2021 14:54:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9B0640408;
	Sat, 24 Jul 2021 14:54:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D15A01BF32E
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 14:54:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C01CC60618
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 14:54:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PCFeHJsvVaD1 for <buildroot@lists.busybox.net>;
 Sat, 24 Jul 2021 14:54:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D961660601
 for <buildroot@buildroot.org>; Sat, 24 Jul 2021 14:54:02 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id e19so8073569ejs.9
 for <buildroot@buildroot.org>; Sat, 24 Jul 2021 07:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=G4f/73rjePChzXEfiEkx1TZUGiHPgVmQ0jh3cjUPtB8=;
 b=ARe+f8tynvwbRnyp8+XbUr1g3IEKNte3GGAX03FxKTo1B/QESJrNlEdbp8JxlEMQbD
 WxYwDZQkje1dBA5Oq/ViClnvp7vA7IAV9KvLtCFEe+ighLZ/J82DFikzZxrYshAqijFo
 IHrKtNQx30fGFfWIQVKuqln3qfsqR8XXPD/Qo0Nzi9EqZtksyt3nll1HZxNPzMwKhmNO
 jtcpeXwiDZofCB+PhGjHd9x774etF5TxN6eyMxLvgwFGUUkcVMkcCRv+s/wyaxc0TRT/
 pmyLj8GGshzW/U4TtgfInz4pnSAf5UXF2fPzfeY1eABvs4zWNZCSkHkm5Cdn1m19tgZL
 DMaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=G4f/73rjePChzXEfiEkx1TZUGiHPgVmQ0jh3cjUPtB8=;
 b=QSnI1vqC1uzZdfdAsaEp1Dw1uOgcfqZw05prd+xaAp5PXJFoo+mUQkoHRCVqZgVKdb
 TE8fcY0QZ7b97F+Q7y3lNBcgywCPwXyPVZJLmQQ2YOgABEBkk6UOJHt37mtq3s2AY1IG
 6StcnKfNH++00/YI/XEnN3kzUXgp+3qbREbxnJEMo2Wo6nMezttU4GZ5zqlO/zXnWkwZ
 pooQbiQ6tlwKloKUSS3SIXJVSCP4zi4pYRLCq7I7u5KSY3fm4jNe5GX7BWF3uf2BSjQ/
 P+jMMDjgPEH0YlUy1QG/igS1A3MfTj1izrSG6dvG77gt846aVeknC2S7Dxlk3qYAzl5e
 O9zw==
X-Gm-Message-State: AOAM532xtjv69QFWfh2iIW2QDzlqgijS5OHqymzCbb/tbFwJRBEkh70Z
 magycuZeF02pf4tgfcxtMjNwzw==
X-Google-Smtp-Source: ABdhPJwMMx0zpaXMvqKqT8YFnJmT60d1v7gn4c1JrpoxTLXHDtlwXkBIr5BCKDLZNS7GGwSfgdNRVw==
X-Received: by 2002:a17:906:76d8:: with SMTP id
 q24mr5318311ejn.22.1627138440568; 
 Sat, 24 Jul 2021 07:54:00 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id n18sm12536144ejl.74.2021.07.24.07.53.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Jul 2021 07:53:59 -0700 (PDT)
To: Damien Le Moal <Damien.LeMoal@wdc.com>,
 buildroot <buildroot@buildroot.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mark Corbin <mark@dibsco.co.uk>
References: <20210715004843.337268-1-damien.lemoal@wdc.com>
 <20210715004843.337268-5-damien.lemoal@wdc.com>
 <6a1b7aba-9fe8-d0ab-ffda-b24167b0cfce@mind.be>
 <DM6PR04MB7081EB636A8B06DE6FFE16F4E7E59@DM6PR04MB7081.namprd04.prod.outlook.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <4ca01298-b90a-fffc-2dff-c2955f3a88da@mind.be>
Date: Sat, 24 Jul 2021 16:53:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <DM6PR04MB7081EB636A8B06DE6FFE16F4E7E59@DM6PR04MB7081.namprd04.prod.outlook.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH v2 4/9] board: Add Sipeed MAIX-bit support
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Alistair Francis <alistair@alistair23.me>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 24/07/2021 00:40, Damien Le Moal wrote:
> On 2021/07/24 7:25, Arnout Vandecappelle wrote:
>>
>>
>> On 15/07/2021 02:48, Damien Le Moal wrote:

[snip]
>>> diff --git a/board/canaan/k210-common/rootfs_overlay/usr/sbin/init b/board/canaan/k210-common/rootfs_overlay/usr/sbin/init
>>> new file mode 100755
>>> index 0000000000..286346ddc3
>>> --- /dev/null
>>> +++ b/board/canaan/k210-common/rootfs_overlay/usr/sbin/init
>>
>>  /sbin/init, not /usr/sbin/init. Doesn't matter because you have merged usr, but
>> it's better to follow the standards.
> 
> OK.
> 

[snip]
>>> +BR2_ROOTFS_MERGED_USR=y
>>
>>  Why?
> 
> Without this, the SD card config does not result in the system starting the init
> shell. Not entirely sure why. Will have another look at this.

 Maybe because you put the script in /usr/bin/init instead of /bin/init? :-)

[snip]
>>> +BR2_TARGET_ROOTFS_INITRAMFS=y
>>
>>  This will install another /init script that ends up exec'ing /sbin/init. Maybe
>> it would be better to replace that /init script as well (just symlink /init ->
>> sbin/init).
> 
> Hmm... All the default init stuff is disabled in busybox so I do not get that
> init script/process. Will check again.

 It's not added by busybox, it's added by fs/cpio/cpio.mk
(BR2_TARGET_ROOTFS_CPIO gets selected by _INITRAMFS).

 IIRC the script is not put in output/target/init, only in the temporary
directory from which the cpio is created. On the booted system or in
output/images/rootfs.cpio, you should be able to see it as /init.


 Regards,
 Arnout


_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
