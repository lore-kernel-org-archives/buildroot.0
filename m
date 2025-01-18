Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4866DC02187
	for <buildroot@archiver.kernel.org>; Sat, 18 Jan 2025 20:04:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 092954252C;
	Sat, 18 Jan 2025 20:04:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lh4kUZIPYmMJ; Sat, 18 Jan 2025 20:04:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0B7E4252E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0B7E4252E;
	Sat, 18 Jan 2025 20:04:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E85F69
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 20:04:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0C1D5848D8
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 20:04:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c8elYlclPbzf for <buildroot@buildroot.org>;
 Sat, 18 Jan 2025 20:04:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 29B7C848C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29B7C848C3
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 29B7C848C3
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 20:04:47 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 42C8D60128;
 Sat, 18 Jan 2025 21:04:43 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:60034])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 18 Jan 2025 21:04:43 +0100
MIME-Version: 1.0
Date: Sat, 18 Jan 2025 21:04:43 +0100
From: Julien Olivain <ju.o@free.fr>
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250118131911.1954770-1-thomas@devoogdt.com>
References: <20250118131911.1954770-1-thomas@devoogdt.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <fb3ecc8b52ab4851d628503bec093f3c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737230684;
 bh=wjVozBPwFAs6HMLOXyY7j/v/IoankCJ/Ki0b0jipQFw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hMS1z5wTBADapSxeBXkWCdS2vicARBxkCCg79I7W4E08EhOCQPSI8yaT7Skk8BJoC
 uwtTSCu1gyCvaa+mQYQMgKp1dzdKzf+klK65z2xqm4BczUkX6L9gHV44gOq0SnSOtg
 plgsAfudjkPw/zoWZmoEgDiG4eMhNDpPW+NQ2l3p+UWKTSI4rRVuQ/iVblXO/unFf8
 TkatwT8Sc746RC7zyGOPMYqwJ50WAgwh862/V+x9Ar5gbHegJMezeYX0Iu7RFrDn2Y
 eBHQVI98hfIv3OxyTz4IIRkMgQbj+UcvhbiulgMPbdshQxAqLPULzOPB/BTaPYBKeo
 sshmynLveakew==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=hMS1z5wT
Subject: Re: [Buildroot] [PATCH 1/2] package/lighttpd: bump to 1.4.77
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

On 18/01/2025 14:19, Thomas Devoogdt wrote:
> News:
> - https://www.lighttpd.net/2025/1/10/1.4.77/
> 
> Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
