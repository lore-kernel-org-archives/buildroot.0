Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9667E77188
	for <buildroot@archiver.kernel.org>; Wed,  8 Jan 2025 22:03:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 811EA814BA;
	Wed,  8 Jan 2025 22:03:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xqNw7pmjl5dv; Wed,  8 Jan 2025 22:03:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A57A781501
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A57A781501;
	Wed,  8 Jan 2025 22:03:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 455E11EB8
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 22:03:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2FEC860AD5
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 22:03:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LYBczb9Qq4JE for <buildroot@buildroot.org>;
 Wed,  8 Jan 2025 22:03:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2F43B60B6F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F43B60B6F
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2F43B60B6F
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 22:03:20 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1759852330; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 08 Jan 2025 22:03:17 +0000 (UTC)
Message-ID: <0ccbc066-056f-47d0-b3bc-6cb4c94049e4@korsgaard.com>
Date: Wed, 8 Jan 2025 23:03:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
References: <20250104214947.828041-1-thomas.petazzoni@bootlin.com>
Content-Language: en-US
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20250104214947.828041-1-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=mJ++WOZXVIrtmXFxxQF6dzex38i/L+NuQn//cZSYkDFFb3dhFwpPArHZWETRhXWe9xEnZfqwzSB3a+AXNQ1wSln3bc7OyToMfbKFu429AJJkpddg9DiATIMz9vwmQJ0QF6jMsZjEOgnk/tdF/n3eo0SIEkzvrnTM3DUWtTkUqXESa+NkGB3q1802HlJmdu+vakxYMcinpuZDIbugFS3vgcHfdVZ8DcTofW1NNJV66a5t0gstZfZdvFYfeYxpAKyTRqbOnC7QUicMjYMXpLp1Tdc/6JYa7gUjYj/G4xeFVn2h+LNVk+6fmODLcp3r+EqknKBKVWVy5oTHOhOVIJvZKQ==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=wRfI7vblXkqaD3rWqX7ot8PJr2KAc7PfwdWd/TM3JPE=;
 h=Feedback-ID:Received:Date:Subject:To:From; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=mJ++WOZX
Subject: Re: [Buildroot] [PATCH] package/gobject-introspection: disable on
 Microblaze
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

On 1/4/25 22:49, Thomas Petazzoni via buildroot wrote:
> The build of GOI on Microblaze fails as qemu-user hangs forver when
> running the GOI programs. Considering how small Microblaze targets
> are, the use-case for GOI is very small if not inexistant, and it's
> unlikely anybody is ever going to debug this, so just disable GOI on
> Microblaze.
> 
> This issue is causing timeouts in the autobuilders on a regular basis:
> 
>    http://autobuild.buildroot.net/?status=TIMEOUT&reason=gobject-introspection%
> 
> Fixes:
> 
>    http://autobuild.buildroot.net/results/f8e5ef74478c63c89e7b99fb928b97ac4518f943/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2024.02.x and 2024.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
