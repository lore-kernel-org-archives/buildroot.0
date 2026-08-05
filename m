Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03347C55174
	for <buildroot@archiver.kernel.org>; Wed,  5 Aug 2026 16:06:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A65D5607BE;
	Wed,  5 Aug 2026 16:06:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kLwaq8pIeX27; Wed,  5 Aug 2026 16:06:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC65260675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785945961;
	bh=FHOlzasFM6ECfSQx8HiqZSqP72tZ/NQBvJexVLA7Tzw=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=HUbeg9zHphzdusIYv2htaf9RGvkBwaqmBkrjPamhKAE7L5UbQ05iQ/zN7xWNjyk35
	 UQYlXfxZGZ30WMW9L/Azwu3bSBodr5zL0wUNZPWeKOQyFFnmfB2D3+ql/aWMiE3l24
	 03Z6D6JiUv8t7nfnGoLwaMAsXbuBjOD074AaoKd/0RsiBZlRL8fpRwa+/Q7Tu+ZphA
	 pQHjZN1fZ6IoCoTbjEgx7m602CnC+78u6rif3cJTTBzfCDLjZTQe2rOtPvhldY0dZL
	 qU/lMUtwief6WG55v9xOm/wmGz/yiqIXN89WaTizmS5fWgDdD3dySLjP7WakxaqzZI
	 W9BEpJU5GKODw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC65260675;
	Wed,  5 Aug 2026 16:06:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 75A9D2B6
 for <buildroot@buildroot.org>; Wed,  5 Aug 2026 16:06:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5BD98400C4
 for <buildroot@buildroot.org>; Wed,  5 Aug 2026 16:06:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jlseSglW8qzg for <buildroot@buildroot.org>;
 Wed,  5 Aug 2026 16:05:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8266E400AE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8266E400AE
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8266E400AE
 for <buildroot@buildroot.org>; Wed,  5 Aug 2026 16:05:58 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 314A61A1449
 for <buildroot@buildroot.org>; Wed,  5 Aug 2026 16:05:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0765D602AB
 for <buildroot@buildroot.org>; Wed,  5 Aug 2026 16:05:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C5B6E11C34E6B; 
 Wed,  5 Aug 2026 18:05:51 +0200 (CEST)
Mime-Version: 1.0
Date: Wed, 05 Aug 2026 18:05:47 +0200
Message-Id: <DKH501Y6N1NZ.1HTLE63ORQKA5@bootlin.com>
To: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>
Cc: <buildroot@buildroot.org>
X-Mailer: aerc 0.21.0
References: <20260731-heaptrack-v1-1-c558715cb4c3@bootlin.com>
 <amzvreeFgp0eJyM4@windsurf>
In-Reply-To: <amzvreeFgp0eJyM4@windsurf>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1785945952; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=J0Jmv3gvk35vjpDlT4jRrrtJXW93gFxW2Q5C0Mg4LuY=;
 b=b3jxoFAAIcCpiWSUST2WGhM+R8mlmBLBNWMaUel5/pHBmSKzUhZgMpj4pKWz37YYOQj+RX
 Whs5FfVU+mUVOKwe3NvsYUJa3QFfUzHCH+t2y6HnQ6kTvyWUUx1LrtpIl1Lux+NiEluKqi
 RoCw+xjQ8So6wEd7aCdZcGbXfCx6W0S3fpT84NYEu1pCUVvIcnndXIscLXb10/tRTn+8iD
 6Tcqiq1T695P3Yved+3YcRCQ57wjFLl3MI+bBfwPk3mG1P4meqoGIUlD0hj/5IEb/a8EfZ
 OR6lVkhcVZZ62CgYoNRDL+UGOPX5eWYJIvDBlw/JkUkGBIKQtlIEc+mlY/oI9Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=b3jxoFAA
Subject: Re: [Buildroot] [PATCH] package/heaptrack: new package
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

thanks for reviewing!

On Fri Jul 31, 2026 at 8:59 PM CEST, Thomas Petazzoni wrote:
> Hello,
>
> On Fri, Jul 31, 2026 at 07:25:35PM +0200, Luca Ceresoli wrote:
>
>> diff --git a/package/heaptrack/Config.in b/package/heaptrack/Config.in
>> new file mode 100644
>> index 000000000000..ea54195c9318
>> --- /dev/null
>> +++ b/package/heaptrack/Config.in
>> @@ -0,0 +1,26 @@
>> +config BR2_PACKAGE_HEAPTRACK
>> +	bool "heaptrack"
>> +	depends on BR2_INSTALL_LIBSTDCPP
>> +	depends on BR2_LINUX_KERNEL
>
> You also need to replicate the "depends on" the things you select, so:
>
> 	depends on BR2_TOOLCHAIN_HAS_THREADS # boost, libunwind, elfutils
> 	depends on BR2_USE_WCHAR # boost, elfutils
> 	depends on BR2_PACKAGE_LIBUNWIND_ARCH_SUPPORTS
> 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libunwind
> 	depends on !BR2_STATIC_LIBS # libunwind, elfutils
>
> Also, I'm curious about the BR2_LINUX_KERNEL dependency. heaptrack
> builds its own kernel modules?

Nope, my mistake.

v2 incoming with that removed, plus the various changes you suggested
including a runtime test case.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
