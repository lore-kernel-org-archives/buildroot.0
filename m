Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEF5DFED3F2
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 19:50:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A02E811D5;
	Fri, 24 Apr 2026 19:50:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gt2LOrwd8saC; Fri, 24 Apr 2026 19:50:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 05D3880CCC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777060225;
	bh=YHtoa/vAa/WO7BaUsCH6Ez0vMM1+VLLa0us/9sF2g7Q=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=elsGKo0hc2pAD+F1gGiTfokjXS9IKJEEw7bC5f6R4SWyOrVf9EfGYjpWxQwKHGxUo
	 GEVDBCDV3y0OYjdbHz/GBDEvCF+izrQwYaeXFGoClLUAwTd4YKnUAVD3RddnQwXkiU
	 uo6zKGgt+/wQckew4CwHN/980ErDdzBUDUE5LK2JwaxLZy1jQ8iw9AbGdaPlUWrAxO
	 EK7L0HPtp7jQnGFxIy2gIVW5CMRtrdaDyTiN1Dk9NxwiyiON4IUmFIHZdkeYULWIAS
	 KhHdq8+yAbYDem8Fi959hvSFihY3T+dh7zPToOqpL02cRYIxK5gDdZTqIdLJYGKkw/
	 cFZ3WNWzeFv5w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 05D3880CCC;
	Fri, 24 Apr 2026 19:50:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 53CCE194
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 19:50:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 45BDE40552
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 19:50:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R-WY165nH45U for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 19:50:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DB18C403D6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB18C403D6
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DB18C403D6
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 19:50:21 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 2E7245FFA3;
 Fri, 24 Apr 2026 21:50:18 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 24 Apr 2026 21:50:18 +0200
MIME-Version: 1.0
Date: Fri, 24 Apr 2026 21:50:18 +0200
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260423160156.21391-1-chakrabortyshubham66@gmail.com>
References: <20260423160156.21391-1-chakrabortyshubham66@gmail.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <12316f667ac4c230cdca45c960306710@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1777060219;
 bh=Dk4RZkTpCLxqzRINI7X7LfpACH/gib8wFKP9KJNFghw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BzvpQSurtL9WT9qiJaYnIKqerpbKEXbcAFF0EX7jCUURG16De99o2ArWAYXE+cZok
 UWGWFnIOJCT4tZUwNbbsiDjlWSHixXkwiABiyQcRn9bs0ucwWWsOLD4q7LPPcfEUQg
 E7a8zLuzqqjezO6XI1AH7Iujr/1tdyuw1RSwmBkdMhJmcBrGeHyuXIl1alVGAVKwil
 X7uVYawVnDKkG5ylEvVfqxSAnIdKkMhYcB8q5seKx5l/yM2ZnOPvaxZp76PYNH+2YY
 jMk4u6n2GM5cIHLnpLr5jhibL6V7vfCS7j8celq7IAHDipheFa6K3RMyusErJ4aDK3
 iQlKcuXqGMj2Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=BzvpQSur
Subject: Re: [Buildroot] [PATCH] package/mpfr: bump version to 4.2.2
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

On 23/04/2026 18:01, Shubham Chakraborty wrote:
> Update MPFR from 4.1.1 to 4.2.2.
> 
> Release notes:
> https://www.mpfr.org/mpfr-4.2.2/
> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
