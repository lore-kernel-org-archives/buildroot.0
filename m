Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CC03CD11C2
	for <buildroot@archiver.kernel.org>; Wed, 10 Apr 2024 18:22:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B3B5440133;
	Wed, 10 Apr 2024 18:22:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pjrdYJBgwwwc; Wed, 10 Apr 2024 18:22:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA39540297
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AA39540297;
	Wed, 10 Apr 2024 18:22:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BC9F01BF5A2
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 18:22:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B687040297
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 18:22:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DoFntzE3r_Tz for <buildroot@lists.busybox.net>;
 Wed, 10 Apr 2024 18:22:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8B08840133
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B08840133
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8B08840133
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 18:22:31 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 9D6E85FF95;
 Wed, 10 Apr 2024 20:22:28 +0200 (CEST)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:38930])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 10 Apr 2024 20:22:28 +0200
MIME-Version: 1.0
Date: Wed, 10 Apr 2024 20:22:28 +0200
From: Julien Olivain <ju.o@free.fr>
To: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <e16166b5-9ca0-4d2e-9c69-80d74d5d7e07@mind.be>
References: <20240409212758.380547-1-ju.o@free.fr>
 <20240409212758.380547-2-ju.o@free.fr>
 <e16166b5-9ca0-4d2e-9c69-80d74d5d7e07@mind.be>
User-Agent: Webmail Free/1.6.5
Message-ID: <af4421720e276e1e58b1319732a75891@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1712773349;
 bh=M38OXsF72+EQX50PFh5XQX3Ptq1RVW6ME8g5D6r//NY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Q5gVdrPxbtnHPThVBff2K1g8fXF6pooUJ/oKCAKTpR2DfbPyWkFN84HCKCeND0Inm
 2CQ37I5My7lsvj9YE3EGEvjaLtx3zzCAdJINM7ZvrCvVBdLUalo1jZlhBfidxDzf6j
 DxSfmveQWJ9PKKMs4nz+6NAyp0OKx5OGbDWDQU2SkRUweQrcx9fnBpDhp28ePPnMO0
 Q/EEOi4niT7WbR41l43gnPk29S11faj74QZIW11wy35AJL3GKwFr8tg95tAWVVzsk2
 rohr+n7NvIhtPKY7ftJ9jA3mB73ridNNP/M3nikFjSlbs0CPwznQiXYYdon7tlXe9k
 QqgCOQpD/xfPg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Q5gVdrPx
Subject: Re: [Buildroot] [PATCH v2 2/2] package/rdma-core: bump to version
 v51.0
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

Hi Arnout,

On 10/04/2024 20:04, Arnout Vandecappelle wrote:
> On 09/04/2024 23:27, Julien Olivain wrote:
>> For change log, see:
>> https://github.com/linux-rdma/rdma-core/releases/tag/v51.0
>> 
>> Signed-off-by: Julien Olivain <ju.o@free.fr>
>> ---
>> Changes v1 -> v2:
>> - introduced this new patch for v51.0 bump.
> 
>  Why did you do this in two separate patches, instead of a single patch 
> that bumps to v51.0?

Well, the v50.0 patch was waiting in patchwork for quite some time. It 
is still valid as-is.
I just wrote the v51.0 on top of it and sent both as a remainder that 
v50.0 was still there.

Do you prefer I send a squashed version of those in a v3?

Best regards,

Julien.

> 
>  Regards,
>  Arnout
> 
>> ---
>>   package/rdma-core/rdma-core.hash | 2 +-
>>   package/rdma-core/rdma-core.mk   | 2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
>> 
>> diff --git a/package/rdma-core/rdma-core.hash 
>> b/package/rdma-core/rdma-core.hash
>> index 27fe7e208d8..f8b01e882dc 100644
>> --- a/package/rdma-core/rdma-core.hash
>> +++ b/package/rdma-core/rdma-core.hash
>> @@ -1,5 +1,5 @@
>>   # Locally calculated
>> -sha256  
>> ecb866caaec7ce13f40074c769860f9c36c3a37a70913c5218217e3293d7cb11  
>> rdma-core-50.0.tar.gz
>> +sha256  
>> a4065b0454249839dc75b61c6ee428e917d9cddf964ff7a33d479f00d1264ba0  
>> rdma-core-51.0.tar.gz
>>   sha256  
>> 99e0df1d009a21d0dfb031600c550fd8f4efc0c6b2a4ef8b34a995aa6f79c9f4  
>> COPYING.BSD_MIT
>>   sha256  
>> 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  
>> COPYING.GPL2
>>   sha256  
>> c46a557f25b8ef9bec76526c4e593fc13e6cba27e7ba30d73b6497a689cf06f6  
>> COPYING.md
>> diff --git a/package/rdma-core/rdma-core.mk 
>> b/package/rdma-core/rdma-core.mk
>> index 7818b396a46..834d9ea3efe 100644
>> --- a/package/rdma-core/rdma-core.mk
>> +++ b/package/rdma-core/rdma-core.mk
>> @@ -4,7 +4,7 @@
>>   #
>>   
>> ################################################################################
>>   -RDMA_CORE_VERSION = 50.0
>> +RDMA_CORE_VERSION = 51.0
>>   RDMA_CORE_SITE = $(call 
>> github,linux-rdma,rdma-core,v$(RDMA_CORE_VERSION))
>>   RDMA_CORE_LICENSE = GPL-2.0 or BSD-2-Clause
>>   RDMA_CORE_LICENSE_FILES = COPYING.GPL2 COPYING.BSD_MIT COPYING.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
