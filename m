Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C7D0C88E77
	for <buildroot@archiver.kernel.org>; Tue, 15 Sep 2026 17:05:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E43A880BB9;
	Tue, 15 Sep 2026 17:05:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qeNQDnpBOOdr; Tue, 15 Sep 2026 17:05:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 192A580AE7
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789491901;
	b=JmrPNlQzESPbLKJ001KQkeT77iI5f3nItejJTm3V/U7lXxk1gCAQD/TPcjlGWPprCXTE
	 sMsDF4Be8l/aZNp0KvRxoqixBCVluNLDr+o6ZjRCCmN/MN5W4gCh1Z5EOzRITtDF9X2F9
	 cqv2N1yFzcZ7bxtCue1PKm2NGPitur6rzzjuDqrnSBXpMvr+0AEhEeMm/ZRDgQJypqvIN
	 y10aXSDRLhPblZRoqs7AW5waP1UlrkvGV1tmOoPArTj3JCnZlkFz5/QV1UJPtG7pTKQcQ
	 KIBQBIfOPuPWZIKR0G0TYrnPqQ14tkHza45CsHFba7lTM9Ep8uI0MDoV8z9w4uOZbWQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789491901;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=CF09TYfP2La5xW7wMOJ0bQShKx+MeXiLLsmgkr8wwSE=;
	b=Igv9JL89pRlH74omcEzZVsIrYNHXxEqH5XLGQkaa4c9cVXRuQpoGr5oh/zU41x3c7q3Z
	 h0uHQbaPuhRi3RVFOgcfm+SBzULmRhlIFRqA346jKnbLpqqe1cBFc++Ehvzt4YI1JEoTu
	 NBopaYlsv4zUYD7kDoh7GP4F31Hlf2csmjKQt5f3RQ5lx8PzqloC3GIuiZK87fZ8IWYxG
	 LmBQA5c/KitH1Ie/Towr0iFHFuvbBIiUuiSQ8xvTUjVfO1l4ZDq4G+jx7pM5hG5+stquC
	 T6BiPJd5AIv6nRc+lF9b9wESVFqSCfWRFhbNugKs0rcbeBoFf5HpuDj7t5/A87bEUUw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789491901;
	bh=CF09TYfP2La5xW7wMOJ0bQShKx+MeXiLLsmgkr8wwSE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=IC/YIcODTpmKhk54v/NP3X7h/Ae8BuKa/RHBqadWxCvn6j4fhZDSpPVszsPWZ6AYk
	 3+lDZN7w2rTJSSRewzqryE2nnl6GM29s/RNXNMlrN6vWsYlLtckhmux10N80QqVsht
	 DtaH1p1j1zJlPn3ld8tohC5uXPBXrfgksBuc1DfOPziLudKcpiKGi0jP/8UxWPbrK9
	 XJzJIn93Rwrm+bz9/20+ZgiBSfzQyX7L9/u/ojyB1IVMX8DRhzDEpYwRWPIJ2TKqG3
	 wHLUJHdwDkgdi1PuPhf3/0tf0AK5y7zHTiI8NdjcSGn4EctRlc2OPJSxe9MllclvFQ
	 5nNwjpvDROemQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 192A580AE7;
	Tue, 15 Sep 2026 17:05:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 288F13AF
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 17:05:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 19978402EC
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 17:05:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RAxam2LF4UNY for <buildroot@buildroot.org>;
 Tue, 15 Sep 2026 17:04:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 1BBBF402C0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789491899;
 b=ZIaSs/X9S7BbRkCspMppeUcCVPq8pSfXxr3uQf95n53IIuOvHTeb6ZzZayNLAV8PId9i
 /T5Z190NN0GeAwqPyJzFP/kP3AvU03iSGGXfXKC23gWS1RO/7EoPxHmP7/nUay8Icc7eP
 IQmLRlBr41eJXROB97+AVqInfwUNdxhWnXG5g4LyJGmF2iRf9h/XxViItatX6W8oZMhg7
 HOw9MFu4c47saNqHGvTM6rRH6a1SajtekBFmEg0iEvsRoNX8gykJFun7ybGNQ6C7PVwAw
 neoHsUqiOWBSDOO74rG2koxq0abR797lBSNC3xBHoOYwdlO+Dm7BharT+03tzE8HJTg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789491899;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=iDErNwIBWc4BQ8CjOXXSVfT2qAtbdxGraBq/ZEUGKvA=;
 b=e9dB+WZrex09CQ4mmKgUHsV3fmxLH96h5oS00sRYqXAG8oEGWQTvlLdlZz4oq396BG3p
 rkPwQACVMjNlC59Z/1yf6SQ5MKQ7FEq2/YYkfutGOjjWZAfx9X/fTsVAR2YYbrquEC2vV
 0UPZ1enpH4MXD8n1ANtvm8Q2DdRZpa53y/aujpFowuihlMTfX76c/N50j0rQ8xPQni9Ge
 ZvCA1uQBxrapG3yHnGTXVBaW7T5Bmq5Ot+XYFAMDDZIXFRcu5+8vMmd5kTprNoTIChGfP
 YyFlccVDN3uN/eVZMp2lOEJvG7FbPwND79sMGHAP59HM4+roRsLVAphGoMJQAFe+fLw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=u77SYp3a; 
 arc=none smtp.remote-ip=212.27.42.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1BBBF402C0
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 17:04:58 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id A0D8919F576;
 Tue, 15 Sep 2026 19:04:54 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 15 Sep 2026 19:04:54 +0200
MIME-Version: 1.0
Date: Tue, 15 Sep 2026 19:04:54 +0200
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org, Alexey Lukyanchuk <skif@skif-web.ru>
In-Reply-To: <20260915095653.279455-2-thomas.perale@mind.be>
References: <20260915095653.279455-1-thomas.perale@mind.be>
 <20260915095653.279455-2-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.19
Message-ID: <c1adb5c909b235587e4f7652aa26e9b8@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/zabbix: security bump to v7.2.15
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

On 15/09/2026 11:56, Thomas Perale via buildroot wrote:
> Zabbix 7.2 is EOL since December 2025 [1]
> 
> For more info on the version bump, see:
>  - https://www.zabbix.com/rn/rn7.2.14
>  - https://www.zabbix.com/rn/rn7.2.15
> 
> This fixes the following vulnerabilties:
> 
> - CVE-2026-23920:
>     Host and event action script input is validated with a regex (set 
> by
>     the administrator), but the validation runs in multiline mode. If ^
>     and $ anchors are used in user input validation, an injected 
> newline
>     lets authenticated users bypass the check and inject shell 
> commands.
>     https://www.cve.org/CVERecord?id=CVE-2026-23920
> 
> - CVE-2026-23921:
>     A low privilege Zabbix user with API access can exploit a blind SQL
>     injection vulnerability in include/classes/api/CApiService.php to
>     execute arbitrary SQL selects via the sortfield parameter. Although
>     query results are not returned directly, an attacker can exfiltrate
>     arbitrary database data through time-based techniques, potentially
>     leading to session identifier disclosure and administrator account
>     compromise.
>     https://www.cve.org/CVERecord?id=CVE-2026-23921
> 
> [1] https://endoflife.date/zabbix
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
