Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 443EAC77B61
	for <buildroot@archiver.kernel.org>; Mon, 10 Apr 2023 19:05:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E280D61383;
	Mon, 10 Apr 2023 19:05:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E280D61383
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bm_RoGEEvZey; Mon, 10 Apr 2023 19:05:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2EDDF60E92;
	Mon, 10 Apr 2023 19:05:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2EDDF60E92
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D48271BF316
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 19:05:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AD05C60E92
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 19:05:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD05C60E92
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b4pXBDRXDS_z for <buildroot@lists.busybox.net>;
 Mon, 10 Apr 2023 19:05:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB35060B03
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BB35060B03
 for <buildroot@buildroot.org>; Mon, 10 Apr 2023 19:05:44 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id l18so5258786wrb.9
 for <buildroot@buildroot.org>; Mon, 10 Apr 2023 12:05:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681153543;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bJr1lcFPbMd2crjVEcFrFhZVt0MMABzFdI503WXGl18=;
 b=73vTDd+3F+EXxaC01vDzn3ih2TyK+3UM1L6b0G4Oj4vW2c+ZKzYgZwl4PPtfTKLczO
 nHsO36VbNu14XCtl9AJVjYB9QFJDmx3Yyc0xKPIN9xfmdet1eD4gMn42xQJy6PresGq6
 nftUphN5DjI3vn58AzQEbHGSRiBBlTxbQdjscnEuHB3cO60/9PuokOhpPMxRYDfov+a2
 cgcfqmDYYIOgGjzwyf/El/+ZHcWqaeiyKqYeEktsOAMrDBCu2qRIPI0O8Ydp8Mxi/1p7
 8OzHPJEWKRrpN2ralvzd14pKtneO/0Hr6gpWGyeDTFCCaBdyHUXBrYZX5iJqd5Pa2FLB
 I/aA==
X-Gm-Message-State: AAQBX9frhqGRiZtJIp01JTZ4haPOZQyEbp7ml7oSQwyjOIAx/veGX8O/
 HfdIYg2wCYlYJTC0v7cf2/WVolQBb+Zp89FaaIQ=
X-Google-Smtp-Source: AKy350Z+H9pNBIOGEBhi9WLzQAdUZrDkubxkvbvkubCjpXxxlhg1A8ROmuOFKgMP7Xo4HtPvoOtRyg==
X-Received: by 2002:adf:e588:0:b0:2ce:a828:b248 with SMTP id
 l8-20020adfe588000000b002cea828b248mr4550912wrm.71.1681153542876; 
 Mon, 10 Apr 2023 12:05:42 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 s4-20020adff804000000b002e463bd49e3sm12372127wrp.66.2023.04.10.12.05.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Apr 2023 12:05:41 -0700 (PDT)
Message-ID: <c1eef250-6df4-7d6c-3963-bd5ad8c6a48d@mind.be>
Date: Mon, 10 Apr 2023 21:05:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-GB
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20230409210814.496117-1-arnout@mind.be>
 <20230410165157.GD2819@scaer>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20230410165157.GD2819@scaer>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1681153543;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bJr1lcFPbMd2crjVEcFrFhZVt0MMABzFdI503WXGl18=;
 b=F0PVV4o9lnoyEc2DB4ZwuLV0pwnQklmfwlGvP+CY/AOqsIc3bNrsYofk2Cr7WnHL0O
 X+q2tBSgyI00k5SpbmYVEzAs/k8p1G6F0rqKTUOUKnVbO+7H1o/xAKho82SNDMO5vMQI
 RrVOUZQqNmOB3T3nEuSpWq+YBibFp8W0DdpCD1F49v0AIeuk4MbWqyR/6f+KpPZ06QiQ
 6CTFBW5XdeGyhpJPJk4D4d1dk0cJ1lCiSpLpD9xUKwW7KK9SqxHESYWOtw3CHJPIfs2g
 ivdg7Yu8hp6dJQeuEv7ge+Ewmm7acID7xmM2D0spsteW3DO546RFSVU3LpcX0IH0x312
 anbA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=F0PVV4o9
Subject: Re: [Buildroot] [PATCH] package/skeleton: drop $(HOST_DIR)/usr
 compatibility symlink
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



On 10/04/2023 18:51, Yann E. MORIN wrote:
> Arnout, All,
> 
> On 2023-04-09 23:08 +0200, Arnout Vandecappelle spake thusly:
>> It has been years that we removed $(HOST_DIR)/usr. Because of this
>> symlink, however, there are still packages that install things in
>> $(HOST_DIR)/usr. Remove the symlink so those packages will start to
>> fail.
>>
>> Note that there's now a check-package check to detect such incorrectly
>> instaled things, so this should only affect external packages.
>>
>> Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
>> ---
>>   package/skeleton/skeleton.mk | 4 ----
>>   1 file changed, 4 deletions(-)
>>
>> diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
>> index 634c76e437..186cb60189 100644
>> --- a/package/skeleton/skeleton.mk
>> +++ b/package/skeleton/skeleton.mk
>> @@ -11,11 +11,7 @@
>>   SKELETON_ADD_TOOLCHAIN_DEPENDENCY = NO
>>   SKELETON_ADD_SKELETON_DEPENDENCY = NO
>>   
>> -# We create a compatibility symlink in case a post-build script still
>> -# uses $(HOST_DIR)/usr
>>   define HOST_SKELETON_INSTALL_CMDS
>> -# check-package DoNotInstallToHostdirUsr
>> -	$(Q)ln -snf . $(HOST_DIR)/usr
> 
> Should we have a kind of post-isntall test that checks that a package
> did not create that (e.g. because their makefile hard-codes something
> like DESTDIR/usr)?

  If we are going to keep dragging along stuff to support legacy forever, then 
it's probably simpler to just keep this symlink. If something installs in 
HOST_DIR/usr it's probably going to break somewhere down the line, right? So I 
don't think we need to bother.

  BTW, DESTDIR is empty for host builds. And PREFIX/usr would be completely crazy.

  Regards,
  Arnout

> 
> This is probably a good candidate for GLOBAL_INSTRUMENTATION_HOOKS, no?
> 
> Regards,
> Yann E. MORIN.
> 
>>   	$(Q)mkdir -p $(HOST_DIR)/lib
>>   	$(Q)mkdir -p $(HOST_DIR)/include
>>   	$(Q)case $(HOSTARCH) in \
>> -- 
>> 2.39.2
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
