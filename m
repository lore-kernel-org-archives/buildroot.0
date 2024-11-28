Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7912D70DEE
	for <buildroot@archiver.kernel.org>; Thu, 28 Nov 2024 20:59:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7752381E7D;
	Thu, 28 Nov 2024 20:59:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kwQfei6L1lp6; Thu, 28 Nov 2024 20:59:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59E868198D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59E868198D;
	Thu, 28 Nov 2024 20:59:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5F9B2A6A
 for <buildroot@buildroot.org>; Thu, 28 Nov 2024 20:59:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3D18E4024E
 for <buildroot@buildroot.org>; Thu, 28 Nov 2024 20:59:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k4a9OM9KiJS2 for <buildroot@buildroot.org>;
 Thu, 28 Nov 2024 20:59:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0B96F400DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B96F400DC
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0B96F400DC
 for <buildroot@buildroot.org>; Thu, 28 Nov 2024 20:59:15 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id B45ED20039E;
 Thu, 28 Nov 2024 21:59:11 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:49414])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 28 Nov 2024 21:59:11 +0100
MIME-Version: 1.0
Date: Thu, 28 Nov 2024 21:59:11 +0100
From: Julien Olivain <ju.o@free.fr>
To: Andy Yan <andyshrk@163.com>
Cc: buildroot@buildroot.org
In-Reply-To: <2486874f.8976.19371ec13aa.Coremail.andyshrk@163.com>
References: <20241127032336.345826-1-andyshrk@163.com>
 <8acb5897b8fc142d1e91cf5e68bfb378@free.fr>
 <2486874f.8976.19371ec13aa.Coremail.andyshrk@163.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <1dbd915a5d0cab413a679724a42bd08b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1732827552;
 bh=OLyKNnRoeGtpKCD5W16+T0x0NNSXOSnTUn4NHJHGdMI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=A5x08IRm6K9NB2CdiCQPEoAwe7VylsK+0e//6EdnHi9Mft/Dc7pNxoeyvV+J8BW2j
 3G5gMOinC0WD0OoR44L2fbkWyMMh8aiiHgF1vqZkhaAw7uOwrQFAQgApOy2xuazRDP
 PLA5WzaLvhbMzTh9hNFsPsZg9hXMcyptTLSfYL8duspU6dI+nl2dyfsA5mIQnSJpWa
 wWwlCNxUfERFfKZ7mVwU2N6luOkfDBrM8sJcN47XgwYYLr23T6tkToUiAiTHdRZvj7
 VuQK1PL4XFCKJfCSk9FRTz6NzQ1qwQmlZJ7oGXgzCbJtxVc6Cq5yVq6fZViWspob2m
 sm8Dpa4UUPvew==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=A5x08IRm
Subject: Re: [Buildroot] [PATCH] configs/rock5b_defconfig: Increase the
 filesystem size to 512MB
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Andy,

On 28/11/2024 09:38, Andy Yan wrote:
> Hi Julien,
> 
> At 2024-11-28 05:58:49, "Julien Olivain" <ju.o@free.fr> wrote:
>> Hi Andy,
>> 
>> On 27/11/2024 04:23, Andy Yan wrote:
>>> The current 250MB filesystem size is not enough which will casue
>>> failure like bellow:
>>> 
>>> Copying files into the device: __populate_fs: Could not allocate 
>>> block
>>> in ext2 filesystem while writing file 
>>> "libharfbuzz-subset.so.0.60900.0"
>>> mkfs.ext4: Could not allocate block in ext2 filesystem while 
>>> populating
>>> file system
>>> *** Maybe you need to increase the filesystem size
>>> (BR2_TARGET_ROOTFS_EXT2_SIZE)
>> 
>> Building this defconfig with the commands:
>> 
>>     make rock5b_defconfig
>>     make
>> 
> 
> I also run with the cmd above, but before that, I had compiled other 
> board without doing a make clean,
> and I'm not sure if the compilation results from the previous boards 
> affected this compilation.
> 
> I try do make clean before make rock5b_defconfig, it did compile 
> successfully.

Since the build failure was due to an unclean build on your side and a
clean build is working, I will not merge this patch (I'll simply mark it
as rejected).

>> succeed. See for example:
>> https://gitlab.com/buildroot.org/buildroot/-/jobs/8429067667
>> 
>> The filesystem size is usually increased when the defconfig is
>> no longer building (without adding packages). So if you get the
>> build error when adding packages to your config, you should increase
>> the filesystem size to the right size for your project.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
