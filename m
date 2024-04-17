Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F896C4345F
	for <buildroot@archiver.kernel.org>; Wed, 17 Apr 2024 23:16:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 205AD605A3;
	Wed, 17 Apr 2024 23:16:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uaZdyRMNLA-z; Wed, 17 Apr 2024 23:16:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 241BD6068F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 241BD6068F;
	Wed, 17 Apr 2024 23:16:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C37BE1BF20D
 for <buildroot@lists.busybox.net>; Wed, 17 Apr 2024 23:16:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AF1FB403EC
 for <buildroot@lists.busybox.net>; Wed, 17 Apr 2024 23:16:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VuguzpbTRa2E for <buildroot@lists.busybox.net>;
 Wed, 17 Apr 2024 23:16:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=66.163.188.148;
 helo=sonic303-22.consmr.mail.ne1.yahoo.com;
 envelope-from=dterry_engineer@yahoo.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 707EB403D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 707EB403D0
Received: from sonic303-22.consmr.mail.ne1.yahoo.com
 (sonic303-22.consmr.mail.ne1.yahoo.com [66.163.188.148])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 707EB403D0
 for <buildroot@buildroot.org>; Wed, 17 Apr 2024 23:16:13 +0000 (UTC)
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1713395772; bh=27EixXTTgZNQl8Lz7iDS2kta2gamiPnOKWl0MErGFMA=;
 h=X-Sonic-MF:Date:Subject:To:From:From:Subject;
 b=cyoXfUHRk3mc0lQRxQFICneYNihGkehW42M8xTGv7KK4bNcx/phttuKs4r/5VfVWwoKzi65ajS5W9RJq4uvYWvPH1WRsaSgxZvgQ6CzqQZz7TQbe6clKTgQRpoC3URdVnJcIN8wXgpZuS0qYp4NZgnq50NxU6hvxXx7mdV2o+gCeZT5sE3L0ddNMat61xNd9sIbaS5oAsqLp++Rx4LRytNCkz5WihhoTqYfi6dT8209SbM3jnJvXqoEGHyyzunt31eoADf/9i4xbCmtOYGT1P7StStfdcnWgBltfLN74COrRkhRzHE3g8fZdV0ktzaaoKYD+VfYYu8XrusXLJ4HrLA==
X-YMail-OSG: KTdXTEwVM1n.Ss9XxuAwbu8Zk_clJzElbkuzu6apnJJUimmdpMbsEJfACusY917
 dtCxau7txgXsitwCa43XWKK97WI3uZZRNqCyHwOTl3GCQFipsqGU.jGcOx3mx1w9NeDVlFN6nxh2
 EyiYRw9So2f9c_jWgFlnZw0k9P.yy3hhuA0jXtLZynPOlSl9FGSMjRi6qu.V0..dNAjOptrzZY37
 r58srmc16urNRmnZDCHiBjp2fL1gUrjfMiHs8DWxmIweLsx0JNwNYnEX9JgmTVqSK7WgO5RWgraK
 adjlVk.KLDQWHZv0_6T6_5KwXZkD5ubEzDah9ZdkNU2UN3f4MzBoBtdsT_xKWcut9UP_Ga98.5Zn
 OiLcmfxDLH0yPD68Bae4UmERVDeOqXPDNz6b3cbJKHQD7QlZEy0YaqqSFpaOoSjOZkTiyPaMaXM.
 qFidxbINeje46w57EDnIDHmNYVVuQqTg2NQyrwUKgQV9ktUilcYvfVtGCRle3QR_TlTdPQ5lzy1s
 _KXxbtHDLvoed6Q65lnn46RK4chv66sCJW4bv8YjFdGWm0jMYHoMxOnw2vdSMliX518asbX52hvA
 4PTmUduVTPPOv3fdW.ztjXQowj8qP_0aKx0xH1AFfYEiMHKMFiMYClySaWIt7ez26l0d8E5Uum8n
 IqinkCtplkPsW9jKTNqs.9Z2TWA29BmQfz4SvlwFt.Df78bIGwiZmFuC_L1aP3W38CyfSIYu_0Kq
 ZJFmfffyAWq.3kvYnDSSd5yjpdCMnjEuEaALBKXOBcX2ZSJtpv2szBR3pDSTf5O8qpRAgFHRXCFV
 Cmfyp_k.FaSB4cg1VTT_70etMkfKYmRYIm8W5Xay3llNW5yUEoOBypvtdANZVT3L2f94.XF97ufO
 UNv_20ZtS0TUUmgCz1QrqqiyWvSM33MZb7g57HrYJyjSsyyKiRJh54AZ5fYLVMDbemtdW_geaUEM
 Vb8iVfL63YbGAjoebr2AWJd3ArOpn13U_XjIq.seAU7hI0kuTar6bc.._1eu8cJMpDGtrd_5HiQS
 .eVXbQ4BEA7VPYUQnnSnhMT.8PTFp.3XlCIbqghgq.JctzDORN5QL8jc4t5g9I27bzES71A8FzO8
 CTy6sBJEKwSaRDS6xJzuTdnzkDnch55.H9455bAovDset.G6Ub.EaBV2Il34f28poJ5CjxkHIsyk
 NQaH9nNR9FXR0YQVMqsgf8nin_8BeQJc2QmbbWuLQ7xgzd5EqVGr80TX3.huFCRPjs7SeXiJLJKd
 RiTTZExHSEsswzJq3AF0R3rp7GtqeRU3jkDIWUjhzpJT0ilOw16F0EgVAQ7CL3EacU1vvI0.uZGs
 4XfAkHDb29kaHS2ySPrN4vza6p7LVm_ve_HuDZcdFYgipb1wbT0q3ifGjwiU.IOau81B.YmJfnG2
 UV_xLY_wpNQjVZw.x2f9OFaPhGjHagBlvYwlNBKnHorCR_DY3XuZ6FLflitwQCwihMWWZanB1WJD
 hAp7sCjVG6oeMDjobw4eB0qmrc3ciZWcLiSqNcGygiMxiw3EAe3jdq7XRmutjI2p_VFGToPzhQ6v
 v55z_QWCw2eoTn7lTXLPPjMOh3UWKH3aSs7g6UGFReSY1eo8IjwpNOWku_gFZQp9dPHfjbQ7Mxan
 JmZQeh8rNzPGvR_q1Lk7uLNwaRqlgzGBSTkND4QFFtr0w.eGbPChXtCKakRlreXK0Z77YxJJ1Oqd
 HTu9FamXBJYCjkgHxVx9V1C6ubkNuduE.5CVzukptZZwy_WFpODtoK1FNeIK8whDMM5GBAYsoyJR
 xjzOLLbNzdDvm7tR4HxM9W76lCWhSUr1GP2bByFYZrJDbeu7QHuSHzz5gXK2OmP.feae2bCI11XF
 GOiMqSVqUvYq8tb8ws5nU_ZeLt.QrdLpHCAVA4TWpvc6KplzOlPlggIPujTYxFYrGQ2XRwhLwNn5
 wlP.xrhPiCxDWQs.zWQKRf6w_M._VE6BMxtP0WKjiDkAsrNGzlSqaUsloI6noL.OeIiRLWgqfLY5
 ZkXw.thDzMAi3LUpbQy.CIJVo.dl5eCtD.SGd.NJOc6vIEWElQ_xn6AfRcFubdfNjzfOhIttXTrL
 SXH_sqOgYWdzev45gD9zYqU3UcUij0Tv.1QYBTpxA7xTZn0_PZ3cbK0bePmNR.eQ.YJPEtPdEdbl
 MVkyRrW7Nj6DP2.CCCkMfTI9w38AVn_WdAVUcKTlAvPkd9UYk0NyW9KuqmOceJXfaZujtnPhrTHt
 Grj2lCemfUnZyZb3zyK3KJ2459ttYd6R1pgOsciEVIWJgDXKNjDXKPnCBHO5uaZSYdPOCT_8LlJf
 WodRdcRWAx3nawqbJgTEVfS0ZrtWOAg--
X-Sonic-MF: <dterry_engineer@yahoo.com>
X-Sonic-ID: 721bfb89-f1f7-4028-981d-a18f3c3c89b4
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic303.consmr.mail.ne1.yahoo.com with HTTP; Wed, 17 Apr 2024 23:16:12 +0000
Received: by hermes--production-bf1-5cc9fc94c8-v29cq (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID ef5bf62cc4167cb345d1d6547642e421; 
 Wed, 17 Apr 2024 23:16:07 +0000 (UTC)
Message-ID: <5bc2b354-bcfb-407e-8d77-47ffbade5cd8@yahoo.com>
Date: Wed, 17 Apr 2024 18:16:05 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <e2634bc6-2e68-4331-8354-49407b40f191.ref@yahoo.com>
 <e2634bc6-2e68-4331-8354-49407b40f191@yahoo.com>
 <6068206a-9a0c-4ef4-a5bb-9e6f35218297@benettiengineering.com>
 <d144cbba-9be6-477f-9a79-e72361487734@yahoo.com>
 <810bfc26-b829-42a8-8ae3-bf42ac3b7eec@benettiengineering.com>
Content-Language: en-US
In-Reply-To: <810bfc26-b829-42a8-8ae3-bf42ac3b7eec@benettiengineering.com>
X-Mailer: WebService/1.1.22256
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yahoo.com; s=s2048; t=1713395772;
 bh=oHLfg6vOpe+vF4r4fHhkvksXmojgD8BcE/BvMmrbkbg=;
 h=Date:Subject:To:References:From:In-Reply-To:From:Subject:Reply-To;
 b=EsNn22WLgUpxvl+TeYHBR9QhTBdwKH+/L0XHq1Op2SnEK0Gt95Ipy5jHDh41rWNv1tmtXBGHJVA3IpAuT5PvxWhs312OYC3PHMbAqssa+NH4YhxR1ODLIFBMsCGkTlOQVo+df9j9TIxxRgV9bYuQbugHMlqSrBWZHvrygnZTUW2awNys2X7k4iA+aWx9pf//NZYF3rrVul2W+n1NgaBH3cjH2IJjrEYeqvuH4Cd15x2awGpweiBPaGxbD5gDxoAuPhKsUsqRNTGoT1CgYyna32yXK2KhJU6teFg+RFm8cxwU5HiCDasnwrkoL0ktcWM5PuFIM9lYobfDYdaLlEMjxw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=yahoo.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com
 header.a=rsa-sha256 header.s=s2048 header.b=EsNn22WL
Subject: Re: [Buildroot] Problem with device tree
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
From: DTrustee via buildroot <buildroot@buildroot.org>
Reply-To: DTrustee <dterry_engineer@yahoo.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The exact instructions to download buildroot gets the most recent 
version which is how I started. Next step was to git checkout -b bootlin 
2022.02 but that does not work as I get:

fatal: '2022.02' is not a commit and a branch 'bootlin' cannot be 
created from it

So I cloned: git clone https://github.com/bootlin/buildroot which I 
think is the repository for the training. However that is lacking the 
output directory so make menuconfig fails. When I go to 
https://github.com/bootlin/buildroot sure enough there is no output 
directory.

How does one go about learning buildroot, the latest version, for the 
Beaglebone Black (or any other board for that matter)? I am reading the 
buildroot manual but it is not exactly a tutorial. Is it mostly trial 
and error until you figure it out?

Have a Blessed day!

Don

On 4/17/24 2:40 PM, Giulio Benetti wrote:
> Hi Don,
>
> On 17/04/24 18:25, DTrustee via buildroot wrote:
>> I know you are all busy, don't mean to bug anyone but I cannot get 
>> buildroot to make without errors. I have no idea why "operator '<' 
>> has no left operand" is generated or which include file is the cause. 
>> I truly appreciate your help. Is there documentation that walks 
>> through the build process? I have looked at the Bootlin training but 
>> it is several years old now and out of date.
>>
>> Buildlog is
>>
>> https://pastebin.com/Eqt6zi9a
>>
>> config is
>>
>> https://pastebin.com/8P2hB9uY
>>
>> buildroot 2024.02.1
>
> since you're following Bootlin course I suggest you as a first step to
> use Buildroot version pointed in the course(unless you're already 
> doing it of course).
>
> Then later, once you master things more, you can move to use latest
> Buildroot version.
>
> Kind regards
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
