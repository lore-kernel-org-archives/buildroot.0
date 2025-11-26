Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 037CAD10F5F
	for <buildroot@archiver.kernel.org>; Wed, 26 Nov 2025 14:57:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD69480E91;
	Wed, 26 Nov 2025 14:57:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LZ7Xg4OQNrVa; Wed, 26 Nov 2025 14:57:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8092808CD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8092808CD;
	Wed, 26 Nov 2025 14:57:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 64BD735E
 for <buildroot@buildroot.org>; Wed, 26 Nov 2025 14:57:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4A77140E5A
 for <buildroot@buildroot.org>; Wed, 26 Nov 2025 14:57:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 33iaB1drNrEh for <buildroot@buildroot.org>;
 Wed, 26 Nov 2025 14:57:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=bastien.curutchet@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 52FD640E7B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 52FD640E7B
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 52FD640E7B
 for <buildroot@buildroot.org>; Wed, 26 Nov 2025 14:57:29 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 2B42F1A1D7D
 for <buildroot@buildroot.org>; Wed, 26 Nov 2025 14:57:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id EE36F60721;
 Wed, 26 Nov 2025 14:57:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BFD94102F083D; Wed, 26 Nov 2025 15:57:26 +0100 (CET)
Message-ID: <e6094b95-4924-4c27-b508-51ea2c0d4e06@bootlin.com>
Date: Wed, 26 Nov 2025 15:57:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Fiona Klute <fiona.klute@gmx.de>
References: <20251126-rasdaemon-v1-0-38c590f3e591@bootlin.com>
 <20251126-rasdaemon-v1-1-38c590f3e591@bootlin.com>
 <20251126115954.1922ba41@windsurf>
Content-Language: en-US
In-Reply-To: <20251126115954.1922ba41@windsurf>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1764169047; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=NfDBbNEIo5rb3i31eEzLS2WDWz0522YhKVpf94fx/qg=;
 b=Nha5jgOScR0q5QmKpym5PEX+3T2llMxTgS3NS8JpkjGpBFPVXcX9vf+nsEPwq/hobmYUnB
 OFSyorlxFyqlDS4zGa7pWE9M/I+zXrqFokV4j6LTUaWcWUuY1WuyiOYZ3QoL5WKxfw7UbP
 WRAp4ZnI0gUJOaDXoUmyLk5hIppS2kPmyuaqKTv7+/Kuqf8X84s+4kbyG5r7yxSlReR7YR
 qZv5+/wQs5gsuvlxhIQlieSUykvt+ph/Z8Uv5OzcH4KCN7qhqAgoiFa1PpNybadCAIQ+z7
 bUQI01ykuJ2dRJZrVGXCdGh1vQ8H+4TR701CYq1l8zyxcep0C4Jo/EQEiowjGw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=Nha5jgOS
Subject: Re: [Buildroot] [PATCH 1/2] package/rasdaemon: Add rasdaemon package
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
From: Bastien Curutchet via buildroot <buildroot@buildroot.org>
Reply-To: Bastien Curutchet <bastien.curutchet@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On 11/26/25 11:59 AM, Thomas Petazzoni wrote:
> Hello Bastien,
> 
> Thanks for the patch! Some comments below.
> 
> On Wed, 26 Nov 2025 11:20:09 +0100
> Bastien Curutchet <bastien.curutchet@bootlin.com> wrote:
> 
> 
>> diff --git a/package/rasdaemon/Config.in b/package/rasdaemon/Config.in
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..f6ceb3585ce5612ba598b182e6538a49d1adb8f8
>> --- /dev/null
>> +++ b/package/rasdaemon/Config.in
>> @@ -0,0 +1,23 @@
>> +config BR2_PACKAGE_RASDAEMON
>> +	bool "rasdaemon"
>> +	depends on !BR2_STATIC_LIBS # libtraceevent
>> +	select BR2_PACKAGE_LIBTRACEEVENT
>> +	select BR2_PACKAGE_SQLITE
>> +	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL
>> +	help
>> +	  rasdaemon is a tool that collects all hardware error events
>> +	  reported by the Linux Kernel from several sources (EDAC, MCE
>> +	  PCI, ...) into one common framework.
>> +	  See https://github.com/mchehab/rasdaemon for details.
>> +
>> +if BR2_PACKAGE_RASDAEMON
>> +
>> +config BR2_PACKAGE_RASDAEMON_AER
>> +	bool "Enable AER support"
>> +	default y
>> +	select BR2_PACKAGE_PCIUTILS
>> +	help
>> +	  Enable handling of AER (Advanced Error Reporting) events on
>> +	  PCIe
>> +
>> +endif
> 
> You need here:
> 
> comment "rasdaemon needs a toolchain w/ dynamic library"
> 	depends on BR2_STATIC_LIBS
> 

Ok.

> Also, I'm in fact not sure the "default y" is good for
> BR2_PACKAGE_RASDAEMON_AER. We generally try to keep optional features
> disabled by default in Buildroot, and especially if they bring
> additional dependencies.
> 
> 

Yep, I agree, I'll remove it.

>> diff --git a/package/rasdaemon/rasdaemon.hash b/package/rasdaemon/rasdaemon.hash
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..768475ce597a63b1738388c2bdebcc3117f006a8
>> --- /dev/null
>> +++ b/package/rasdaemon/rasdaemon.hash
>> @@ -0,0 +1 @@
> 
> Please add:
> 
> # Locally calculated
> 
> here
> 
>> +sha256  7e12459f9477036491ac2b1e4c07cc3e8efea6dcd30525a263ab1f83910b773a  rasdaemon-0.8.4.tar.gz
> 
> And also, add the hash of the license file.
> 
Ok, I'll do it.


Best regards,
Bastien
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
