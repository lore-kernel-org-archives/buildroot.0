Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17A6AD116E2
	for <buildroot@archiver.kernel.org>; Fri, 28 Nov 2025 20:30:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E060E81E9E;
	Fri, 28 Nov 2025 20:30:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PU1RUxgllP8v; Fri, 28 Nov 2025 20:30:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E97181E33
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E97181E33;
	Fri, 28 Nov 2025 20:30:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 92EB61A9
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 20:30:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 850D9414EC
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 20:30:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x1aacv3Jy_PL for <buildroot@buildroot.org>;
 Fri, 28 Nov 2025 20:30:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 782B0414E8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 782B0414E8
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 782B0414E8
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 20:30:10 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id A039C78034D;
 Fri, 28 Nov 2025 21:30:06 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 28 Nov 2025 21:30:06 +0100
MIME-Version: 1.0
Date: Fri, 28 Nov 2025 21:30:06 +0100
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20251124170411.3128797-1-buildroot@bubu1.eu>
References: <20251124170411.3128797-1-buildroot@bubu1.eu>
User-Agent: Webmail Free/1.6.11
Message-ID: <fd0545c5410b8c3db83f4e852774cabb@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1764361808;
 bh=x7uKZMxf/9mCKFpnO58DfazKsAm32vHKLsFU8JpQj8k=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=slIijiNwe92zie1NftUkHDQ0v0QqKrhsiVaakJhxkk89mPh39LwAZ35Cx/SzX6cDi
 yX2ReIP0Z6TjKdnd0EtpX2Et2AF27I13hTYBBoKw5Cs1RASkvLKMG6GT5vHSxf1+tV
 XklzyXk+KiK9TUsrLW5TDFyRQJV28PmXAP9Zrnxe6fqTD4ehRN9t2AVOX4Se4MfOxG
 l22zNT8DlcqHVnn5DiWOWEV2Zq6+GvV8QnqH60HzzZ3j1IIipZiEZU8zQ8+elCiCon
 DJ0P/cqSErEzKmbAWzFO2t20MG3iHcbzWwUXXx4km9zJVq2sl9SJS7HT1HBiGyICzD
 SvON/Mnf+CiDQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=slIijiNw
Subject: Re: [Buildroot] [PATCH] package/python-asgiref: bump to 3.11.0
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

On 24/11/2025 18:04, Marcus Hoffmann wrote:
> Changelog: https://github.com/django/asgiref/blob/3.11.0/CHANGELOG.txt
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
