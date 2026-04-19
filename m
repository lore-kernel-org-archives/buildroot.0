Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90525EA71A1
	for <buildroot@archiver.kernel.org>; Sun, 19 Apr 2026 20:57:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6039E40F9A;
	Sun, 19 Apr 2026 20:57:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bKro0nTV-bpT; Sun, 19 Apr 2026 20:57:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7063F41034
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776632248;
	bh=WvBsbFGmWxUP9W8sYNKXFKnbflYZHgTOK1tNH1BO798=;
	h=Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=qplEzX0+zItM5vkzQCPIaJthyvuodNlLJCr4dEuJSHJBPG/RVFIVNjr1C6t+VJwWm
	 HAxPMNPqKa4R9oI9cnG44jcwt1B4/A3bAeyiS/+dNBV9mt9sma+9/nWPGpHKTBjqLx
	 KQbYslle6L+AQU1elELIm1ej1wljJvY8BaOKPBBH2UYN9AEpqoB5b9Ip5PZpPTOiez
	 +js6V8lFWkaXq1N2sE1VpyacG0rNKrQt7lu+8Fmg2ocwn/cxPvD483nWdQDIeyjLz6
	 U+MUOE3m9Zfa/DXWjWVSx7shk0kVgZL9Q9kD++Pm90hrhJpmqZ2DAnV8uw8r4914jw
	 M3xwUg4u2+yiQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7063F41034;
	Sun, 19 Apr 2026 20:57:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 02DA82B8
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 20:57:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E8D6D404A2
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 20:57:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lj-0Nq6KLaDg for <buildroot@buildroot.org>;
 Sun, 19 Apr 2026 20:57:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 93A1540484
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 93A1540484
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 93A1540484
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 20:57:23 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MXGvG-1vuDSc49EM-00J9x8; Sun, 19
 Apr 2026 22:57:17 +0200
Message-ID: <88d9e096-c542-4abe-a366-91e7d3fc5550@gmx.de>
Date: Sun, 19 Apr 2026 22:57:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, de-DE-1901, de-DE
To: Buildroot ML <buildroot@buildroot.org>
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
Cc: Sen Hastings <sen@hastings.org>
X-Provags-ID: V03:K1:UgVZ2VM3pxWYFWMh0uToZ1ZyYx3ntAUUfE51sSxdG/wZvpJ2nKz
 FSQ2QLAvD3o3cMyaFUIKg4pRRULTyumWw87Ph26ZJcdRTaFdWame7GQHR8VjEaTMXFu4drz
 0MfJql6JOIUZGDfnDbcJDuYGP7YP12ovp45jZ1bRauaYd/ZVK3sKnJfw9CPleCsmeamYeZc
 GPtnCeYlE1qXk3DeDXWQg==
UI-OutboundReport: notjunk:1;M01:P0:s1AoQ79Xp7c=;w/hV2/aZ88zaC0t/gsMKBpz4L5a
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1776632237; x=1777237037; i=fiona.klute@gmx.de;
 bh=TcKM1TNkIH33R3aoLDJQf2lnEPDF1sWf6niv6HulOL0=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:From:Subject:
 Cc:Content-Type:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=SI9VVodLQSKaurg94EipDV/VMstue6mAEQxMXN+e2myNagU1T5SeDNSZrI0+maz/
 iYsplE46JRh7cDffQCRYsF9XchAVSaLNzvyJBNvH2s6eTDNlxQDw3Zo/f9t/mITbD
 ZNmNIfQjOrV9oDI79KhD99lP7cH6lbWKuL2WJxeQcHm0fSwiaB1s4c7vyuOgzOTPU
 cCIGUl73xWkEyOmFD/3iW/SrQv8YnswKgAtw000jSSQpqTSCoXkIbVKDMRD79YMHP
 SiAkjyTmq+yRQJgfnfPy/012j2bW42cnmnhrJOlrHp5h+jR/9NmtCpJelDHBPPk5B
 Ifja5kKIYJKo7mTTMQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=SI9VVodL
Subject: [Buildroot] pkg-stats: Linux kernel handling bugs
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

Hi everyone,

I tried "make pkg-stats" on one of my builds today, and noticed a few 
issues with the output for linux/linux.mk. Build is using:

BR2_LINUX_KERNEL_LATEST_VERSION=y
BR2_LINUX_KERNEL_VERSION="7.0"

The version 7.0 is correctly shown in the "Current version" column, but 
there are bugs in three others:

* Hash file: No

linux/7.0/linux.hash exists, maybe some issue parsing the symlinks involved?

* Latest version: 6.19.13

Links to https://release-monitoring.org/project/375247 which is 
"linux~6.x", there's also "linux" at 
https://release-monitoring.org/project/358810/. Grepping the project 
number doesn't yield anything, so it's not obvious to me how it's 
determined.

* Upstream URL: invalid 404

This is a weird one, it links to https://xenomai.org/downloads/ipipe/, 
which appears only in linux/Config.ext.in under config 
BR2_LINUX_KERNEL_EXT_XENOMAI (which I do not have enabled). That 404 
might be a reason to revisit that option, but in any case it shouldn't 
appear as the upstream URL for the mainline kernel.

I probably won't have time to dig into this any time soon, so I'm just 
reporting these as bugs. Happy to test patches though!

Best regards,
Fiona

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
