Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE7ADC87FCB
	for <buildroot@archiver.kernel.org>; Sat,  9 Aug 2025 15:07:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 892A340BA8;
	Sat,  9 Aug 2025 15:07:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2cYbai5o6m6H; Sat,  9 Aug 2025 15:07:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7FC440BAA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7FC440BAA;
	Sat,  9 Aug 2025 15:07:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DADD01D3
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 15:07:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D872040B76
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 15:07:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ekrJlCveAM8Q for <buildroot@buildroot.org>;
 Sat,  9 Aug 2025 15:07:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1394440B6C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1394440B6C
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1394440B6C
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 15:07:40 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 949D7B0057C;
 Sat,  9 Aug 2025 17:07:36 +0200 (CEST)
Received: from 2001:18c0:a22:bf00:5c2b:f296:f108:6612
 via 2001:18c0:a22:bf00:5c2b:f296:f108:6612 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 09 Aug 2025 17:07:36 +0200
MIME-Version: 1.0
Date: Sat, 09 Aug 2025 17:07:36 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250806122510.3950409-1-peter@korsgaard.com>
References: <20250806122510.3950409-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <ddf3b26bf2a205d886a7c1547c544751@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1754752057;
 bh=g5Ilb8ivtP8v0zsZ79A05mRuvY8j/r0X+3lN14o4Xuw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kAMyhvvfYfdKIWfDBhm9IzFY4Os1BQ4Pi0YnPdoknkE0CL/pPlUF60zqYFJVeldp+
 QUU1W5666tLxH8tS/DfumVTSfSJ/S1EzMJvJbAgFo+pvpT1Tj5WeJehJjyetCRKiCh
 mhHoU+ykkSEkyEp1acmDeOkAIAuaK7vMS7VN/vhuD5JxoqVBky1w05Sfr5OnEugfC7
 I2IzyR9k1v0qkMdFQUPyCqdnwWzmjBnCZ/SOC81uyi+R531mmgpxS/B3zuR25q2n+8
 +X2kbd27cPsWfrUowE03/ZsFc1G+8axJaUhBtA9K7Bf4hJsUzkHpkOvQVT0paGuhYY
 kxQNCW0cvYjRg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=kAMyhvvf
Subject: Re: [Buildroot] [PATCH] package/libopenssl: bump version to 3.5.2
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

On 06/08/2025 14:25, Peter Korsgaard wrote:
> Bugfix release:
> 
> - Miscellaneous minor bug fixes.
> 
> - The FIPS provider now performs a PCT on key import for RSA, EC and 
> ECX.
>   This is mandated by FIPS 140-3 IG 10.3.A additional comment 1.
> 
> https://github.com/openssl/openssl/releases/tag/openssl-3.5.2
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
