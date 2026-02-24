Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD48DF55431
	for <buildroot@archiver.kernel.org>; Tue, 24 Feb 2026 23:45:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 02C29614AE;
	Tue, 24 Feb 2026 23:45:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9XdbaFOvI116; Tue, 24 Feb 2026 23:45:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 777BF6146D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771976751;
	bh=7OWYfQ3dPPYmDhWV3EA3VUSL3rbvZ+lE4WT6qzJLgQU=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=ZmXFr5muIDBBD7CMDVMpDot4cdUrcpdhjkmq+P4BdUYvISqytcqovcr+7H+WMVIK+
	 73o7C4rjU+HY2hvMTgLJb8vYc+oiAe6TJR/YiGnXidW8sJxsCOerupxzqN3fAK9xV9
	 lnrCLGt1A3KAl5Uc1+p6BethGkd08lc08XfgWBiv/uHpv96aocol73d9OrpM7yoScS
	 oMZtLd/k8vLy995jGXwgYyu2auZjrvItS+X6G2RhxLPHPaC77UPFZ61hTmIe+khQCw
	 /JXN0iUwz8wsZO5H2U3ZBYb4L1gp1/UEBe96L+Xwi7R1X94q3bmrcyv9YmBzxfTW2d
	 GdYHcd+UKV2+w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 777BF6146D;
	Tue, 24 Feb 2026 23:45:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A94C51B8
 for <buildroot@buildroot.org>; Tue, 24 Feb 2026 23:45:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8F0B540C96
 for <buildroot@buildroot.org>; Tue, 24 Feb 2026 23:45:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vrE-IOg4-HqF for <buildroot@buildroot.org>;
 Tue, 24 Feb 2026 23:45:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4DDA540C42
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4DDA540C42
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4DDA540C42
 for <buildroot@buildroot.org>; Tue, 24 Feb 2026 23:45:48 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MjS5A-1vRyvp3nnW-00bEU1; Wed, 25
 Feb 2026 00:45:40 +0100
Message-ID: <f3fd06cf-ef36-41a8-a1c7-3be67fad1a8b@gmx.de>
Date: Wed, 25 Feb 2026 00:45:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Afshin Pir <Afshin.Pir@gallagher.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <SYAPR01MB2784705D867B9F21DE6958119474A@SYAPR01MB2784.ausprd01.prod.outlook.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <SYAPR01MB2784705D867B9F21DE6958119474A@SYAPR01MB2784.ausprd01.prod.outlook.com>
X-Provags-ID: V03:K1:M66jNInv7azIZ/FPemW06MYYs079In4/K3aEO5uXmiNWPD96Bi0
 VQaYHC0dcwKdUNRKFcwshdTR/08lSZXEjk3CSYwxJr+/rQJmEVGvQgqKEBD4HCgimVyBlv5
 PWA8moodQBrSpEOjzDcB2+F4agklldckLSdE6DHaWq1+1XFN/aUOlg5jN2pp1B3PNCTiR3m
 UggVGX/B2njITtK1EDdcg==
UI-OutboundReport: notjunk:1;M01:P0:56a0yE9Ntvw=;VRvk7VEnUsdCzFwrVh4BH29tK9t
 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
 qFp/VYg0ViZU2Auom9tm/jV/5uxh8H3hcgfUxN
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1771976740; x=1772581540; i=fiona.klute@gmx.de;
 bh=1Uh2nWKi/wYpmR0mk0Xp+/T1bSx5q7QJImZyg9o/ARU=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=pHqaAd1N2j63e7hqu5jsY0XjlYIi7BOfK6L+cn56L15k4SftcgDkj7rjkL83/krp
 lQlZ1X9nkNAHto7Q/eecx8W+QtQKDqnGs2dD4W8dWv8MAtKeGTmaHWmbsX30308PH
 8H0QPUqVAR8qlLvBBIgnOjzVwdr91hiM6/GQ5g5ykafTj5yNkPEfuECv0eU1MCt+B
 YYyZ1D4XMkND5mviZ2RLCnMQBxXsEpnCj95C5oD8TqXgd/FDNKOUxgAigS8RIH3Bp
 Hdg/kHFOUOgUnHpZez4Is50UwBk0kTQNslUaTuIIuK7BJA4gaOCSWB8H0YsrV9HmH
 bJY8lm7HsLTpiyVWDQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=pHqaAd1N
Subject: Re: [Buildroot] Cargo package dependencies for local package
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

Am 24.02.26 um 20:51 schrieb Afshin Pir:
> Hi all,
> 
> When we have a cargo package in the buildroot, it tries to download package dependency as a part of post download process. This is normally fine until you want to use a local package. If your site method is 'local', post download process will not happen and as a result, your package dependencies will not be downloaded, and you will not be able to build any cargo package.
> I have reported this issue for this problem as well: https://gitlab.com/buildroot.org/buildroot/-/issues/162
> 
> Does anyone have a workaround for this problem?
If your local package is in a git repository: The "git" site method 
works with a local path as the <pkg>_SITE.

I've used that to test changes to package code before pushing them. To 
use this workaround your code must be committed, but as long as you 
haven't pushed rebasing is no big deal. One catch: Every new commit you 
use (as package version) will create a new archive with a new hash, that 
can get a bit annoying if you have frequent changes.

Best regards,
Fiona

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
