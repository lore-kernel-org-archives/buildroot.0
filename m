Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33013C87FCE
	for <buildroot@archiver.kernel.org>; Fri, 25 Jul 2025 20:37:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA21983DC2;
	Fri, 25 Jul 2025 20:37:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f_M7dnTFZ5x7; Fri, 25 Jul 2025 20:37:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1A2C83DB0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1A2C83DB0;
	Fri, 25 Jul 2025 20:37:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 442E6909
 for <buildroot@buildroot.org>; Fri, 25 Jul 2025 20:37:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3681E41A72
 for <buildroot@buildroot.org>; Fri, 25 Jul 2025 20:37:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XAMuUL-O38pV for <buildroot@buildroot.org>;
 Fri, 25 Jul 2025 20:37:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 59E47412EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 59E47412EC
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 59E47412EC
 for <buildroot@buildroot.org>; Fri, 25 Jul 2025 20:37:43 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 65EDF5FFB7;
 Fri, 25 Jul 2025 22:37:40 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 25 Jul 2025 22:37:40 +0200
MIME-Version: 1.0
Date: Fri, 25 Jul 2025 22:37:40 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250725174251.114514-1-bernd@kuhls.net>
References: <20250725174251.114514-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <36b3c6396588554319f3fe186ed3918c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1753475861;
 bh=C2liypCFd9Ch8VLW1G62c6QL0uT5nqU2N0jPPvFCW2g=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bAFsQkvwDODfHTERwOoLMpTxjCskn0owOILZ9L7zHUdlWm1CR5WjDLjhTo+hSHzcI
 WbhQVpcafzlh529EH+NKLYdOWlkLJSyE0fnhqN9vip9TQgL5NHVUXvu/uSMKLQX5wi
 71eTBO/DW0fJSU32TTpevNrd8SLAnq6FSFVj7zmbKyAZ0luTB4qqrpMRMh0pAEYIXR
 2Q25j8Pkh+6oR53LTsaSUFPY3vZ+IoXPUDHBXaJx3aw37MGr3U3E42saeLmVMC8vGh
 vUgg7MEo9rwTbZx/0NkhZ07Y4OREcwBBDWlNHpW5DTaAfQKtJln3R3TIpA1iYk7rZW
 QfBmroUEeltiQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=bAFsQkvw
Subject: Re: [Buildroot] [PATCH 1/1] package/apache: security bump version
 to 2.4.65
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 25/07/2025 19:42, Bernd Kuhls wrote:
> Fixes CVE-2025-54090: https://downloads.apache.org/httpd/CHANGES_2.4.65
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
