Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B277E7719A
	for <buildroot@archiver.kernel.org>; Wed,  8 Jan 2025 22:00:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4840660B2D;
	Wed,  8 Jan 2025 22:00:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vghxk7E32VaZ; Wed,  8 Jan 2025 22:00:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 577D460B39
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 577D460B39;
	Wed,  8 Jan 2025 22:00:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E19C47AA
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 22:00:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C2F7160B39
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 22:00:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GxDYEAyAo25x for <buildroot@buildroot.org>;
 Wed,  8 Jan 2025 22:00:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BCC6760B2D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BCC6760B2D
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BCC6760B2D
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 22:00:12 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -748777473; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 08 Jan 2025 22:00:09 +0000 (UTC)
Message-ID: <79277a8c-aa4c-4af5-a770-e2eb49df422f@korsgaard.com>
Date: Wed, 8 Jan 2025 23:00:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
References: <20250104213844.825123-1-thomas.petazzoni@bootlin.com>
 <20250104213844.825123-2-thomas.petazzoni@bootlin.com>
Content-Language: en-US
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20250104213844.825123-2-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=Vu482iD1MT4I3gO0Fl9eCrIY48476+i/OemCVRM0sPLH1T8HX1MvxxOj+EeJCzH1jciKYeiLYt1i33jE7fdCMV6Oh47ykxWcuDJtnJ1TnDXGdcX7HJz8ktAEyYsdP7gDEhsA336r/NgtFkD0GGZGCjYtPGvhTpEQBgN0rw6TqbZsEw/JGARfYsY++T1JUO5aFgRL9Gg9P8q52/DeHhDPeR6yQf96XRv2HZ4wkE5zPtr53JuHqsCmeelCodcAswa8mdaVh7OuMExeczy40TQDcy+JOrgHk9eHIQElUHJni4Us+/pRmDPJRBdlj1Sjsk1I+EQgUl8j+g8Hd9EybN8J2g==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=cfFcHhKFJH93Kj5YQpZrM+d040YePNunGyGo0ktgCy8=;
 h=Feedback-ID:Received:Date:Subject:To:From; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=Vu482iD1
Subject: Re: [Buildroot] [PATCH 2/2] package/pkg-kernel-module: disable
 CONFIG_TRIM_UNUSED_KSYMS
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

On 1/4/25 22:38, Thomas Petazzoni via buildroot wrote:
> The kernel option CONFIG_TRIM_UNUSED_KSYMS=y allows to trim unused
> kernel symbols... which basically prevents building external
> modules. This option has been enabled in the default MIPS architecture
> kernel defconfig since pretty much forever, and it causes build
> failures of all our external modules on MIPS in the autobuilders.
> 
> To fix this in a global manner, we handle the problem in the
> kernel-module infrastructure, by appending to the
> <pkg>_LINUX_CONFIG_FIXUPS variable provided by the package.
> 
> Fixes:
> 
>    http://autobuild.buildroot.net/results/c26abec4e24d06557079654b12825efb2211996f/ (cryptodev-linux)
>    http://autobuild.buildroot.net/results/699c618730cb33f0ccf54f90e4b722198fd3d3bc/ (emlog)
>    http://autobuild.buildroot.net/results/f1d5626f5698a955bf378217528fbf4f8f741435/ (rtl8812au-aircrack-ng)
>    http://autobuild.buildroot.net/results/c9a507757ce3a01cd08d596cb519ee9f19caf77c/ (mdio-tools)
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2024.02.x and 2024.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
