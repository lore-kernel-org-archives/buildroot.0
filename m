Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 424FBE77188
	for <buildroot@archiver.kernel.org>; Thu, 26 Dec 2024 21:53:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3F3180A95;
	Thu, 26 Dec 2024 21:53:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rkG6Sp8u-YzP; Thu, 26 Dec 2024 21:53:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2C3A80AD5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F2C3A80AD5;
	Thu, 26 Dec 2024 21:53:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A1C8F1B
 for <buildroot@buildroot.org>; Thu, 26 Dec 2024 21:53:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 78769607D6
 for <buildroot@buildroot.org>; Thu, 26 Dec 2024 21:53:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y3OcdxdN6UqX for <buildroot@buildroot.org>;
 Thu, 26 Dec 2024 21:53:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 42FC3607D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 42FC3607D7
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 42FC3607D7
 for <buildroot@buildroot.org>; Thu, 26 Dec 2024 21:53:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 383F81C0002;
 Thu, 26 Dec 2024 21:53:11 +0000 (UTC)
Message-ID: <d4a439cf-8b1a-4730-a7e7-5054ebc22202@korsgaard.com>
Date: Thu, 26 Dec 2024 22:53:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>,
 Buildroot Development <buildroot@buildroot.org>
References: <20241213223056.2551262-1-peter@korsgaard.com>
Content-Language: en-US
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20241213223056.2551262-1-peter@korsgaard.com>
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/dahdi-linux: add patch to support
 Linux 6.11+
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

On 12/13/24 23:30, Peter Korsgaard wrote:
> Fixes:
> http://autobuild.buildroot.net/results/23f0f7386f7d430c402b24f3b58b1c20c1c8344a/
> 
> Linux commit d69d8048459 "driver core: have match() callback in struct
> bus_type take a const *", which was added in 6.11-rc1, changed the interface
> for sysfs match callback to accept a const struct device_driver, breaking
> the build of dahdi-linux:
> 
>   CC [M]  build/dahdi-linux-3.3.0/drivers/dahdi/dahdi-sysfs.o
> build/dahdi-linux-3.3.0/drivers/dahdi/dahdi-sysfs.c:275:27: error: initialization
>     of "int (*)(struct device *, const struct device_driver *)" from incompatible
>     pointer type "int (*)(struct device *, struct device_driver *)"
>     [-Werror=incompatible-pointer-types]
>    275 |         .match          = span_match,
> 
> Add a patch submitted upstream to fix that.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2024.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
