Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B337C00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 16:29:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2349460FD6;
	Mon, 15 Aug 2022 16:29:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2349460FD6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ra7rYOwfqg0D; Mon, 15 Aug 2022 16:29:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4BC9E60BAB;
	Mon, 15 Aug 2022 16:29:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BC9E60BAB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B08241BF41C
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 16:29:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8B9F860BAB
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 16:29:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B9F860BAB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LXvyki5Aaa8Q for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 16:29:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F1EE6059C
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [IPv6:2607:f8b0:4864:20::736])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5F1EE6059C
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 16:29:48 +0000 (UTC)
Received: by mail-qk1-x736.google.com with SMTP id g21so2199019qka.5
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 09:29:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=QX2oBTWjd93upgeKgzib1iaXDSf+OLs55AAIpxH2MdM=;
 b=wY92XPC81GzX9x6qaHRy4gz/1BZ+p7iRs29DxFHO53Gr/B0dQPVMIEzOfHg4ft8MIM
 sxI8bDz3kXaEn2+ZTUmHGRVIlrSmOYAV4/heVH7yNfN+WFF7p1FhrBezTG5PcHFNZ7cW
 5G9GWeQjuuji4FANT10Vl8WdjVEjGlkAfT1VWBp8WMezc/0521tvl0EnbaYxhLsG34RH
 mrLJ8sLuxWgCRtwet7HRVRiu4AQ6o3qG6D57nNVs3cVEFItHF1U1Ikx79pRqj99RLdT2
 jSF28iXl16CrKOSjv9eRB6v75jYa5UMoB+U4K0rKKAzi84VysoMeLtSm+4IYw4SSerP3
 vlpA==
X-Gm-Message-State: ACgBeo183T+RLUeHkiyJPk9oH5u+LTasPg37nVyfyxqJ2klISUE2O71j
 fjLIm+u1dyGBdwz5anINp24=
X-Google-Smtp-Source: AA6agR6QXA5vDkzVPPcByED1ZWm4H5NGA0I90/B3WuZLzTgBCFoE0CDwchUBHziLR12NceMQ5YR+JQ==
X-Received: by 2002:a05:620a:294d:b0:6b3:bb34:ecf2 with SMTP id
 n13-20020a05620a294d00b006b3bb34ecf2mr11916657qkp.181.1660580987143; 
 Mon, 15 Aug 2022 09:29:47 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
 by smtp.googlemail.com with ESMTPSA id
 n5-20020a05620a294500b006b93fcc9604sm9931275qkp.108.2022.08.15.09.29.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Aug 2022 09:29:46 -0700 (PDT)
Message-ID: <85a49368-80d9-e4ed-4fc4-1b534350ac81@gmail.com>
Date: Mon, 15 Aug 2022 09:29:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Markus Mayer <mmayer@broadcom.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
References: <20220809203505.3620840-1-mmayer@broadcom.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20220809203505.3620840-1-mmayer@broadcom.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc;
 bh=QX2oBTWjd93upgeKgzib1iaXDSf+OLs55AAIpxH2MdM=;
 b=i42RIelNcNdrceqDt7mZJVox82CyNWsqe4CvmPjHRaEMSduI0SI73o1GuIpYffu4h1
 iC8PZal8xfMf2F8bzBHcLyLjQrxUwA4zVXMWVjzmrxgORcFvyC4Ofq57vE0afE05LjHf
 ip1VXj023iXlD2gtDrMnx5qU5FnJM8DyfRkUSm6boWhK2Fb1/qfgoQ+kJ1/9CiIz+N4h
 8KTTd70u5g1f5h2NcRkmjxjjF9nUNy7FcmPzdhxWf0OwPTZ46zJdfiku0zSe1yz/E8FJ
 PY+9dBv/O7W8PtSD4d7dscnJzT7MEB/ozhJx6Bl+C01y8JLkmoOfGElsRWg0RvSYSqKM
 srRg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=i42RIelN
Subject: Re: [Buildroot] [PATCH] package/linux-tools/linux-tool-perf.mk.in:
 Fix disabling of documentation
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 8/9/22 13:35, Markus Mayer via buildroot wrote:
> We are trying to not build the perf documentation. However, the hook
> being used to do so was named incorrectly. As a result, the build steps
> to disable the documentation were never executed.
> 
> Rename the hook from
>      LINUX_POST_PATCH_HOOKS
> to
>      LINUX_TOOLS_POST_PATCH_HOOKS
> to fix the issue.
> 
> Fixes: 20b144666909 ("linux/tools: make it a real, separate package")
> Signed-off-by: Markus Mayer <mmayer@broadcom.com>

Tested-by: Florian Fainelli <f.fainelli@gmail.com>
Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
