Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDFD5C636D4
	for <buildroot@archiver.kernel.org>; Wed,  1 Feb 2023 22:16:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64D4960F9B;
	Wed,  1 Feb 2023 22:16:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 64D4960F9B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oENiT2ftzDWX; Wed,  1 Feb 2023 22:16:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C55660E22;
	Wed,  1 Feb 2023 22:16:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C55660E22
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2CB331BF47F
 for <buildroot@lists.busybox.net>; Wed,  1 Feb 2023 22:16:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F400F4093D
 for <buildroot@lists.busybox.net>; Wed,  1 Feb 2023 22:16:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F400F4093D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c7xK7jW0RZn5 for <buildroot@lists.busybox.net>;
 Wed,  1 Feb 2023 22:16:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9CB254088F
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9CB254088F
 for <buildroot@buildroot.org>; Wed,  1 Feb 2023 22:16:48 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id m11so178153pji.0
 for <buildroot@buildroot.org>; Wed, 01 Feb 2023 14:16:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RggF2mv/H4MiVAcLoXX0ULp1VnAfvubhbl4NQSMLYgU=;
 b=qnVYsEOMYafUIxzUfiDsZB+J3xg9jyFUcRCBaY/YY2VhR6sf0M9hOIdFE0eM+zV1JZ
 w1QDTW8kwMrmLMwzo9OW6W33cL0NuOMO1KJgTvI5rMJPXiGUtdMj6dqWZdGlla2lvq+y
 5tivJQtJT/ytTzW1eCfaH9SEfVhtg4QCljK7SqUeLlReAgUPfNah/0fHiXlEyzTANqda
 FfNXyAn1KnvIUqIZIZBUygphAqwm1BXHVxA14KhrAxxZ0fXIckiKiBVM90/WE0NZQTiN
 Oh1clDVuXFN5W+lawqeET0VQZ4ny8mqQz1pnzGofDZGRVVaYE1ZugVTL14Fdf0m0OJ1M
 ecHw==
X-Gm-Message-State: AO0yUKWnpFOOSuOZtK6ciefkOwCK3ZhQdVuYcFFTmnX/6yHgTxPNujgp
 FJWZ+ET50vnfCSssRapPtQ+ijg==
X-Google-Smtp-Source: AK7set9Dt7jTX8OwQjfzIkuYs59QzJrqYdG5itgjl1ZwKy7jNkS7MtWwzvoOYqSAFZyz2Xd41skGiQ==
X-Received: by 2002:a17:90b:390f:b0:230:1784:eab1 with SMTP id
 ob15-20020a17090b390f00b002301784eab1mr4264601pjb.15.1675289808049; 
 Wed, 01 Feb 2023 14:16:48 -0800 (PST)
Received: from [192.168.0.164] (S0106f875a4344b41.gv.shawcable.net.
 [70.67.112.211]) by smtp.gmail.com with ESMTPSA id
 n6-20020a17090ade8600b00212e5068e17sm1817646pjv.40.2023.02.01.14.16.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Feb 2023 14:16:47 -0800 (PST)
Message-ID: <a8bf6373-ac4c-1872-3943-8fa9c6594ca5@threespeedlogic.com>
Date: Wed, 1 Feb 2023 14:16:47 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Content-Language: en-US
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
References: <20230201195956.1758827-1-gsmecher@threespeedlogic.com>
 <20230201225237.0fb5dacb@booty>
From: Graeme Smecher <gsmecher@threespeedlogic.com>
In-Reply-To: <20230201225237.0fb5dacb@booty>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=threespeedlogic-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RggF2mv/H4MiVAcLoXX0ULp1VnAfvubhbl4NQSMLYgU=;
 b=LBDyyGI76AdC9bUYw68eFDFNJr0rNV9TWlQmSSrTp5quEaksG+hCOUuSql4LXlYhit
 a8JLnF7aeNAju6nON6pa4D4WbKO8+HYKmnPZvHlm2tRxh6cJHCH/ryfUKeEyRJrTRGRO
 FPnpEyc2PtEdYBkQ7dk59vVgBdbe6sAJRm5/J7zLw2Eum20FuZ3ZckNP5oYXpsxoCDsE
 TxloDkZCzbcRnREstZY4ZtUVkK2OUvpew4F36DzhaJNEOq+y2sWh6eaauFWciKV/d6AM
 nw2+nIGugq68xKKSUbjZ6O3sNkQ83lCQ3yQE7fwQXi7L8eR1GoA0buTO3JtY7zr1kj75
 YTDA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=threespeedlogic-com.20210112.gappssmtp.com
 header.i=@threespeedlogic-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=LBDyyGI7
Subject: Re: [Buildroot] [PATCH 1/1] board/zynqmp/post-image.sh: Don't
 insist on a xilinx/ prefix for .dts files.
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
Cc: Neal Frager <neal.frager@amd.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Luca,

On 2023-02-01 13:52, Luca Ceresoli wrote:
> Hi Graeme,
> 
> On Wed,  1 Feb 2023 11:59:56 -0800
> Graeme Smecher <gsmecher@threespeedlogic.com> wrote:
> 
>> If using BR2_LINUX_KERNEL_CUSTOM_DTS_PATH to copy .dts files from
>> buildroot into the linux tree, these .dts files are copied to
>> arch/arm64/boot. Unfortunately, the post-image.sh script expects to find
>> them in arch/arm64/boot/xilinx.
>>
>> This patch does not require the xilinx/ prefix to be present when
>> symlinking the device-tree to system.dtb where u-boot expects to find
>> it.
>>
>> Signed-off-by: Graeme Smecher <gsmecher@threespeedlogic.com>
>> ---
>>   board/zynqmp/post-image.sh | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/board/zynqmp/post-image.sh b/board/zynqmp/post-image.sh
>> index ed6dbe188c..c5de2db820 100755
>> --- a/board/zynqmp/post-image.sh
>> +++ b/board/zynqmp/post-image.sh
>> @@ -5,7 +5,7 @@
>>   # devicetree listed in the config.
>>   
>>   FIRST_DT=$(sed -nr \
>> -               -e 's|^BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/([-_/[:alnum:]\\.]*).*"$|\1|p' \
>> +               -e 's|^BR2_LINUX_KERNEL_INTREE_DTS_NAME="(xilinx/)?([-_/[:alnum:]\\.]*).*"$|\2|p' \
> 
> I think the following simpler change would also work. Can you check
> that please?
> 
> -               -e 's|^BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/([-_/[:alnum:]\\.]*).*"$|\1|p' \
> +               -e 's|^BR2_LINUX_KERNEL_INTREE_DTS_NAME="([-_/[:alnum:]\\.]*).*"$|\2|p' \

Assuming you intended \1, not \2 here - this suggestion breaks behaviour for a couple of defconfigs in the tree. If I run the ZCU106 defconfig through this regexp, I get:

	$ cat configs/zynqmp_zcu106_defconfig | sed -nr -e 's|^BR2_LINUX_KERNEL_INTREE_DTS_NAME="([-_/[:alnum:]\\.]*).*"$|\1|p'
	xilinx/zynqmp-zcu106-revA

...this creates a dangling symlink in output/images (system.dtb -> xilinx/zynqmp-zcu106-revA.dtb).

The right behaviour is to strip any prefixes that exist, without requiring any. Something like:

-               -e 's|^BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/([-_/[:alnum:]\\.]*).*"$|\1|p' \
+               -e 's|^BR2_LINUX_KERNEL_INTREE_DTS_NAME="(.*/)?([-_/[:alnum:]\\.]*).*"$|\2|p' \

This is less Xilinx-specific, although it seems a tad greedy.

best,
Graeme
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
