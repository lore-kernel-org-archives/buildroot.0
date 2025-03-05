Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2619C19F32
	for <buildroot@archiver.kernel.org>; Wed,  5 Mar 2025 21:50:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 845FB60894;
	Wed,  5 Mar 2025 21:50:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p6nCDfq3uU-9; Wed,  5 Mar 2025 21:50:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 970E6608EB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 970E6608EB;
	Wed,  5 Mar 2025 21:50:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5DBEAE2E
 for <buildroot@buildroot.org>; Wed,  5 Mar 2025 21:50:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4157040B3E
 for <buildroot@buildroot.org>; Wed,  5 Mar 2025 21:50:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Esahm1JDkYLN for <buildroot@buildroot.org>;
 Wed,  5 Mar 2025 21:50:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4212D40967
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4212D40967
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4212D40967
 for <buildroot@buildroot.org>; Wed,  5 Mar 2025 21:50:46 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 0F8DBB00563;
 Wed,  5 Mar 2025 22:50:41 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 05 Mar 2025 22:50:41 +0100
MIME-Version: 1.0
Date: Wed, 05 Mar 2025 22:50:41 +0100
From: Julien Olivain <ju.o@free.fr>
To: Boerge Struempfel <boerge.struempfel@gmail.com>
Cc: buildroot@buildroot.org, Boerge Struempfel <bstruempfel@ultratronik.de>
In-Reply-To: <20250305091307.815518-1-boerge.struempfel@gmail.com>
References: <20250305091307.815518-1-boerge.struempfel@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <1bb6b8df44ed33d77f47ef971abc697e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1741211444;
 bh=Z8+py52whxL+1sBuOeL/qX1mCFslL27sqgT0+PtlCus=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PZf8k4zY1tMTOoHg0sqM+X5gJ73OppH6m9+a9NBvTzHkqcphjCD+dg/9hyOu9M7rq
 x/qtUTI4tN7pCGeoBqVsNzf62K44POy2j6UEbNs3Q5YZiGruOEn51BfR2WigrT8d+B
 CoF4dWU9WDHyXMAHBoy611XSP2QFm0s2yZAmFw9tKADUD3+yAGGky5fUFCvuWfIas6
 LsWIOiUDbFQ+NhVPrQrNK7a5/uo+61eYZUsdEIIVEzb8vzfCRkcQwPAQAPbOkuwbhE
 ydeHCUELQ56zfXx70K/9A2PxaPRrlrZfgVRxibW1GbHBT6HiabsGdeUJgkkuMxKZWZ
 T/WwqTL/Z8B4w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=PZf8k4zY
Subject: Re: [Buildroot] [PATCH 1/1] package/libgpiod2: bump to version 2.2.1
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

On 05/03/2025 10:13, Boerge Struempfel wrote:
> multiple bugfixes, see [0]
> 
> [0] 
> https://web.git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/tree/NEWS?h=v2.2.1
> 
> Signed-off-by: Boerge Struempfel <boerge.struempfel@gmail.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
