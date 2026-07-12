Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 229B6C43458
	for <buildroot@archiver.kernel.org>; Sun, 12 Jul 2026 15:18:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD60C606BB;
	Sun, 12 Jul 2026 15:18:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id REddq7f_ErRl; Sun, 12 Jul 2026 15:18:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D3DA60646
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783869528;
	bh=gir5JnaDVCDpXbijD7I9XTXDFOZTlOK5zahcg6s9FDQ=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=on7I/8LBC7Mfzb4ZIBV/C9042C0kMFQGX0QkJ2pNIOsgWvHHSALTn28nmunxRCk5h
	 cvcLvK2FNhJPYADFXblx2ra5bMk+4SwIaz3rqSg04p6yi1gS0+KQBriT/gRSl9vmgW
	 u7vAbTD1Y9K0S4ZwHhLVJTNW3zjegwCnq00iQ7h4S3QUqUi/Gfk6ZQSPzEYEtmrsZt
	 bdhyPJOe4+zSfAhfzkfrp0X5kSAYMqc0ObGcpS2TL4mgf34QeevkWAutdU+Km8vbE4
	 SVZtB9m/TnJyedxH/sPMiu5E9xCeO8x4aB60/P9FpqirNU9h2Fr/rA3V7QPveFDlQX
	 Ztys+xO+SMQog==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D3DA60646;
	Sun, 12 Jul 2026 15:18:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C20822F
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 15:18:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7DB5A80F10
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 15:18:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fxpD6bDjQqzo for <buildroot@buildroot.org>;
 Sun, 12 Jul 2026 15:18:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0EA1080E11
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0EA1080E11
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0EA1080E11
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 15:18:44 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MCKFu-1wr9Qf0SiA-00H7pp; Sun, 12
 Jul 2026 17:18:43 +0200
Message-ID: <66cb4d5a-a764-4118-9248-2c1f9f97e8e4@gmx.de>
Date: Sun, 12 Jul 2026 17:18:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Baruch Siach <baruch@tkos.co.il>,
 Fiona Klute via buildroot <buildroot@buildroot.org>
References: <20260712001013.101890-1-fiona.klute@gmx.de>
 <87mrvw2vpz.fsf@tarshish>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <87mrvw2vpz.fsf@tarshish>
X-Provags-ID: V03:K1:Ocsb5XJ8QG+h2C4yQqT4sp73mmsTyEOI6QSBunXqufsVXuX/lhO
 YC/L4sJUhCtxmBKCAOjvdOIDJH1j3p40fyFhCm4YRMywfnxGjU1dNO5bss0mIMUwOi8/q7L
 VWw+0yt1CyvvfFOyLQ62mCq4FA34f5vb1eB6QQuPj5qzrn5kddVamFcUr3TKXk334W/+XK3
 xx1cl0sG9eTx9yT5p8A0g==
UI-OutboundReport: notjunk:1;M01:P0:+Xq68dxh0iQ=;3S7872eiq1/8wDvVxtYEwHRwuPv
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1783869523; x=1784474323; i=fiona.klute@gmx.de;
 bh=1RpQlxqVh/ke9iRDgYxUaSizr0BKCNaqEyx05YyOYeI=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=peh7RK7y7FjPq8ffohzoIOZgbAmgaiq/x4X6pExV+1tw2wzknwxaZUAJF5S1+Es1
 K5Tj9A9l/UOQRhc8wpZQCcwyT64rhSqjTiZ5bXYNrVLHrJ0o0EJeAY5FM9aKtg5AK
 W9AjSQrl6LmkEKFSiRr2S4rXrOJUPCoIXqpMqfP0kesrOMmiElDDL9lfhXUJxZlmY
 Bvq36P8kHQRUTsGqlIZtP0a3dtqdPSI5Shp5/OfJlvO9ii6hOKZ3t4pckIaXL1fuP
 5n5QK9e+5+IrvH3hC5dnLT4lTCzTfC68A5rNxo5EEsXOU7Wegqm49F5WuCuflBmhQ
 Ki9/jfvmpATstc4eUA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=peh7RK7y
Subject: Re: [Buildroot] [PATCH 1/2] package/fakeroot: bump to version 2.1.4
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 12.07.26 um 15:17 schrieb Baruch Siach via buildroot:
> Hi Fiona,
> 
> On Sun, Jul 12 2026, Fiona Klute via buildroot wrote:
>> The source archive does not contain a pre-build configure script any
>> more, so enable autoreconf. Fakeroot also contains an experimental
>> Meson build definition since 2.1.
>>
>> Since v6.10.1 btrfs-progs uses nftw() [1], which package/fakeroot did
>> not support before v2.0 [2]. This update allows updating btrfs-progs
>> past v6.10 without breaking build of btrfs rootfs images.
>>
>> Upstream changes:
>> https://salsa.debian.org/clint/fakeroot/-/compare/upstream%2F1.37.2...upstream%2F2.1.4
>>
>> [1]
>> https://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git/commit?id=c6464d3f99ed1dabceff1168eabb207492c37624
>> [2] https://salsa.debian.org/clint/fakeroot/-/commit/3502c515c73ee02e7f557e6a3bfc1af675dd3d34
>>
>> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
>> ---
>> I mentioned the Meson build definition for completeness, switching the
>> package to it should wait until it's no longer experimental.
> 
> I think this should be mentioned the commit message itself.

I thought "experimental" would be clear enough by itself, but if it 
helps someone I can elaborate.

>>   package/fakeroot/fakeroot.hash | 6 +++---
>>   package/fakeroot/fakeroot.mk   | 8 +++++---
>>   2 files changed, 8 insertions(+), 6 deletions(-)
>>
>> diff --git a/package/fakeroot/fakeroot.hash b/package/fakeroot/fakeroot.hash
>> index 82a6214380..0c330b7792 100644
>> --- a/package/fakeroot/fakeroot.hash
>> +++ b/package/fakeroot/fakeroot.hash
>> @@ -1,5 +1,5 @@
>> -# From https://deb.debian.org/debian/pool/main/f/fakeroot/fakeroot_1.37.2-1.dsc
>> -sha1  1a721c2b4093a4e83dc091dc41a028f19340c1b3  fakeroot_1.37.2.orig.tar.gz
>> -sha256  0eea60fbe89771b88fcf415c8f2f0a6ccfe9edebbcf3ba5dc0212718d98884db  fakeroot_1.37.2.orig.tar.gz
>> +# From https://snapshot.debian.org/archive/debian/20260711T202405Z/pool/main/f/fakeroot/fakeroot_2.1.4-1.dsc
>> +sha1  9d55e62a34612316058166f7c528d9fc2f30c719  fakeroot_2.1.4.orig.tar.xz
>> +sha256  0822bd5a9f0cf19d2ba0546b88b0432d4d3d9917db62c57b74044ccadba06e49  fakeroot_2.1.4.orig.tar.xz
>>   # License files, locally calculated
>>   sha256  fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
>> diff --git a/package/fakeroot/fakeroot.mk b/package/fakeroot/fakeroot.mk
>> index 12d7f1c4a1..216c62bc52 100644
>> --- a/package/fakeroot/fakeroot.mk
>> +++ b/package/fakeroot/fakeroot.mk
>> @@ -4,9 +4,9 @@
>>   #
>>   ################################################################################
>>   
>> -FAKEROOT_VERSION = 1.37.2
>> -FAKEROOT_SOURCE = fakeroot_$(FAKEROOT_VERSION).orig.tar.gz
>> -FAKEROOT_SITE = https://snapshot.debian.org/archive/debian/20260401T000000Z/pool/main/f/fakeroot
>> +FAKEROOT_VERSION = 2.1.4
>> +FAKEROOT_SOURCE = fakeroot_$(FAKEROOT_VERSION).orig.tar.xz
>> +FAKEROOT_SITE = https://snapshot.debian.org/archive/debian/20260711T202405Z/pool/main/f/fakeroot
>>   
>>   HOST_FAKEROOT_DEPENDENCIES = host-acl
>>   # Force capabilities detection off
>> @@ -18,4 +18,6 @@ HOST_FAKEROOT_CONF_ENV = \
>>   FAKEROOT_LICENSE = GPL-3.0+
>>   FAKEROOT_LICENSE_FILES = COPYING
>>   
>> +FAKEROOT_AUTORECONF = YES
> 
> We usually also add an inline comment that documents why autoreconf is
> needed.

I've sent v2 with that added.

Thanks,
Fiona

> baruch
> 
>> +
>>   $(eval $(host-autotools-package))
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
