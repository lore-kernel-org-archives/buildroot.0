Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D53D0C54E67
	for <buildroot@archiver.kernel.org>; Tue, 26 Mar 2024 16:03:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8853940385;
	Tue, 26 Mar 2024 16:03:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gBaMyWuCZMqh; Tue, 26 Mar 2024 16:03:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 87E014038B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 87E014038B;
	Tue, 26 Mar 2024 16:03:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2EBE91BF3BA
 for <buildroot@lists.busybox.net>; Tue, 26 Mar 2024 16:03:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2922E4038B
 for <buildroot@lists.busybox.net>; Tue, 26 Mar 2024 16:03:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WCdql5ZhgVuR for <buildroot@lists.busybox.net>;
 Tue, 26 Mar 2024 16:03:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.243.197.33;
 helo=mail3.hostpark.net; envelope-from=christian@klarinett.li;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6315940385
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6315940385
Received: from mail3.hostpark.net (mail3.hostpark.net [212.243.197.33])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6315940385
 for <buildroot@buildroot.org>; Tue, 26 Mar 2024 16:03:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail3.hostpark.net (Postfix) with ESMTP id 0366E16756;
 Tue, 26 Mar 2024 17:03:21 +0100 (CET)
X-Virus-Scanned: by Hostpark/NetZone Mailprotection at hostpark.net
Received: from mail3.hostpark.net ([127.0.0.1])
 by localhost (mail3.hostpark.net [127.0.0.1]) (amavisd-new, port 10224)
 with ESMTP id ScQfQcsMotHM; Tue, 26 Mar 2024 17:03:20 +0100 (CET)
Received: from roundcube.hostpark.net (unknown [10.100.20.114])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail3.hostpark.net (Postfix) with ESMTPSA id 9241216404;
 Tue, 26 Mar 2024 17:03:20 +0100 (CET)
MIME-Version: 1.0
Date: Tue, 26 Mar 2024 17:03:20 +0100
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20240326154434.7734ca6f@windsurf>
References: <20240228145642.436509-1-christian@klarinett.li>
 <20240228145642.436509-2-christian@klarinett.li>
 <20240326154434.7734ca6f@windsurf>
Message-ID: <2e226b32ddd0dbfde7aa120b5263c638@klarinett.li>
X-Sender: christian@klarinett.li
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=klarinett.li; h=
 content-transfer-encoding:content-type:content-type:message-id
 :references:in-reply-to:subject:subject:from:from:date:date
 :mime-version; s=sel2011a; t=1711469000; bh=b8K9o7Z2dAmmbh/vyFw8
 h1lpUE5htm8FIMeW6wiMLWQ=; b=299Ys9Jort7ylLB9kK+8HP+9zvNj2IzBo4pk
 ByX8Jl9aQ8Q4SQOUZqmv25GSskAvgP9rfZE0Qgr6zyHm3b1+MgoinWDg/7c1vvWU
 z5nwYTp3ZkZP8tIv+Pm/xvX+xbvE7VJMKAQ2v7F0Fc94Y4DCw5HtO5s4c16qQiis
 XxpHd/U=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=klarinett.li
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=klarinett.li header.i=@klarinett.li header.a=rsa-sha256
 header.s=sel2011a header.b=299Ys9Jo
Subject: Re: [Buildroot] [PATCH 2/2] package/zic: enable installation on
 target
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
From: christian--- via buildroot <buildroot@buildroot.org>
Reply-To: christian@klarinett.li
Cc: Christian Hitz <christian.hitz@bbv.ch>, Martin Bark <martin@barkynet.com>,
 Christian Hitz via buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas

Am 2024-03-26 15:44, schrieb Thomas Petazzoni:
> Hello Christian,
> 
> On Wed, 28 Feb 2024 15:56:41 +0100
> Christian Hitz via buildroot <buildroot@buildroot.org> wrote:
> 
>> From: Christian Hitz <christian.hitz@bbv.ch>
>> 
>> Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>
> 
> Thanks, but for a patch like this, we definitely need a non-empty
> commit log. Why do you need zic on the target, what is the use-case?

When we configure a time zone on our device's GUI we use the standard
time zones. This gives us the usual benefits e.g. automatic daylight
saving time switching.
We also need to support an API that wants to set the "time zone" by
specifying the offset in minutes from GMT. The given information
is not enough to reliably selecting one of the existing time zones.
Instead, when the time zone is set over this API we dynamically create
and configure a "Custom" time zone with the given offset. For this
we use the `zic` tool on target.

> 
>> diff --git a/package/zic/Config.in b/package/zic/Config.in
>> new file mode 100644
>> index 0000000000..11a8c99a66
>> --- /dev/null
>> +++ b/package/zic/Config.in
>> @@ -0,0 +1,6 @@
>> +config BR2_PACKAGE_ZIC
>> +	bool "zic"
>> +	help
> 
> No dependency on toolchain-specific features? Did you test this package
> with ./utils/test-pkg ?

Yes, ./utils/test-pkg -a is successful.

> 
>> diff --git a/package/zic/zic.mk b/package/zic/zic.mk
>> index a915f6d256..12bb9e9943 100644
>> --- a/package/zic/zic.mk
>> +++ b/package/zic/zic.mk
>> @@ -10,6 +10,19 @@ ZIC_SITE = 
>> https://www.iana.org/time-zones/repository/releases
>>  ZIC_STRIP_COMPONENTS = 0
>>  ZIC_LICENSE = Public domain
>>  ZIC_LICENSE_FILES = LICENSE
>> +ZIC_INSTALL_STAGING = YES
>> +
>> +define ZIC_BUILD_CMDS
>> +	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" -C $(@D) zic
> 
> Can we use $(TARGET_CONFIGURE_OPTS) instead of CC="$(TARGET_CC)" ?

Yes, this works.

> 
>> +define ZIC_INSTALL_STAGING_CMDS
>> +	$(INSTALL) -D -m 644 $(@D)/tzfile.h 
>> $(TARGET_DIR)/usr/include/tzfile.h
> 
> So just the header file is needed, no library is installed?

Actually, this is not required at all. I'll drop it in v2.

Thanks for the review. I'll update the patch and will send a v2.

Regards,
Christian
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
