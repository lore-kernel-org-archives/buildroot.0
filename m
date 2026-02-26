Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12380FD9E0A
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 20:14:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 556A540758;
	Thu, 26 Feb 2026 20:14:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cziuUkBkmkT7; Thu, 26 Feb 2026 20:14:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 686104060A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772136855;
	bh=6IgLDA0t3q92qLMW8Ta/R7gnsrE2VOktC4Gr6zV+EV4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ATOBLXAQA6CCjhmoxe0rQhf1SZG0rNfIomdnYm+0PZb86uFk4PEBNa8+lao+xEX6A
	 cFeM3JJABDIco4q5TVxqYw9AeYORa5gmOaON02pTCr28uIAcjSzEa6EQZ+2IKIs20N
	 if4zDCd8SaCz09vCCGjc5mwfz3WbrNtWcMNJ7dPx6I/KH8c8NcLg2yOHkQUrcheIF9
	 wt4U/gJigncIqvRwflZWqY5OavA5SDxbkTSBzTVNnSzDNZgIWGlYddozf0bCwAsd33
	 xIj2VoBaAAFP9miDiTaqLP9jKaOHcCONROBVBfFeWgHuqKvwlZ0zbbjP2tOY2+dQlv
	 GfJGhoDoLhoeg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 686104060A;
	Thu, 26 Feb 2026 20:14:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3243A1F3
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:14:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 17E734022F
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:14:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sz470ZV9ZO-z for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 20:14:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F2C9940122
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F2C9940122
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F2C9940122
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:14:12 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 51324780333;
 Thu, 26 Feb 2026 21:14:09 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 26 Feb 2026 21:14:09 +0100
MIME-Version: 1.0
Date: Thu, 26 Feb 2026 21:14:09 +0100
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
In-Reply-To: <20260224205227.263450-1-thomas.perale@mind.be>
References: <20260224205227.263450-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.13
Message-ID: <a0a5249ad7838ffd19dafb9d02b6692b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772136850;
 bh=2yR1jOhAzpnKE5SrGYC3Rua21Hh+AsRExi79tLbtaCk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=E8JwnUvOIEXxMJpGRUn5qq1efBLbLssxFmA+faYH2Nd4eW3CpPIZRSLAMH4844BUw
 Vs11kB726mM+JOYPgWCPLOfmnBIs9mSGLEArlOvlfFLmVXNAcigwKjbVx4wjL9Rq5I
 AN1BawX+JP0VGCYh7XlO3qP9TfsoHInJ20dNfmXmA9tFTFOEztqXMFN/ylRDWpJJew
 mqOaVqPf+SlEwFRPZmzX7ynuChgSFlrm5mc7xp1UDyhfEL3mvDkdbO6RDSn4xcJmxS
 3OAcNbS1mA1FRqI1TJJbUAgHjxC08YmEAxaAtaadIk0q9F5RgzwwfXMNwGjQu8Xqkf
 IkpIihwrBYfJw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=E8JwnUvO
Subject: Re: [Buildroot] [PATCH] package/tinyproxy: add patch for
 CVE-2025-63938
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

On 24/02/2026 21:52, Thomas Perale via buildroot wrote:
> Fixes the following vulnerability:
> 
> - CVE-2025-63938:
>     Tinyproxy through 1.11.2 contains an integer overflow vulnerability 
> in
>     the strip_return_port() function within src/reqs.c.
> 
> For more information, see:
>   - https://www.cve.org/CVERecord?id=CVE-2025-63938
>   - 
> https://github.com/tinyproxy/tinyproxy/commit/3c0fde94981b025271ffa1788ae425257841bf5a
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
