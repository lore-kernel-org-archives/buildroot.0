Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BD8BD277EE
	for <buildroot@archiver.kernel.org>; Sat, 10 Jan 2026 16:42:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F0894076A;
	Sat, 10 Jan 2026 16:42:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9BG8Rrhqhspy; Sat, 10 Jan 2026 16:42:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3CAF140682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768063369;
	bh=888+7v1Fjdk8D1umBS6Y7u1h1H9YyLqh0TX2P0WJUK0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SzO+/LIyQnmDP0JHSZakLp2By6it6HYWyyIBCDnreZf49+Dut2CxgOAHFsE0+rBR6
	 7UtJw3ER9blwH9VgnkhyUB4RRwT88N9Y01sNVIs1+q1NlQ7QlixpGGssa9AmbNoLgm
	 0fLLHycePMeb7KBq1KTYIEiCi/h2SzGjsJq1TRh33HXcjgrP5Ca3ISLAQYvV6eOdKV
	 QgSDNM6KtFkGyzTc4sEDNh0iqwN8y5P8jgqAsb46MFDlm68ijoVe0NWordLZSiDda5
	 +0E2xHkXUrops9K4C/WAIY1+TB5wZ9FQ6wtPwMoNTlF10eEfJdnEppKj3oPKg//uyO
	 BbBJ3EwGIXvqQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3CAF140682;
	Sat, 10 Jan 2026 16:42:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6FD94131
 for <buildroot@buildroot.org>; Sat, 10 Jan 2026 16:42:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 61858821ED
 for <buildroot@buildroot.org>; Sat, 10 Jan 2026 16:42:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EWJOkM9KabrK for <buildroot@buildroot.org>;
 Sat, 10 Jan 2026 16:42:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6761A821E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6761A821E9
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6761A821E9
 for <buildroot@buildroot.org>; Sat, 10 Jan 2026 16:42:47 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id BFC5260136;
 Sat, 10 Jan 2026 17:42:43 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 10 Jan 2026 17:42:43 +0100
MIME-Version: 1.0
Date: Sat, 10 Jan 2026 17:42:43 +0100
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
In-Reply-To: <aWJdHyFAsJcw6JYP@waldemar-brodkorb.de>
References: <aWJdHyFAsJcw6JYP@waldemar-brodkorb.de>
User-Agent: Webmail Free/1.6.12
Message-ID: <eedfb3bfb7480d75bb712e77215ebf77@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1768063364;
 bh=MRGdE57wn6U/OLvT7zDyyhIc3qSXX4RLT849OU0ic1c=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=EE1AP8QhRnJJNMut+ozZenhuio4/vvUOINal36/d5hcPnLt3ZH+6ohsMYhHe3sM2i
 wrsO2gTpHvQRzaOz3pL5J0dX467H9IgCwlcNbnsvE0Ofp0h/2C0N8E3n3J4goMmScl
 AI08ebbRc2a41OKR3qYYcsaqkXX1CxcOnYctFIOTUXyF1MZsvcibRD0eTO0PvZlKee
 5VJRqtWHGUWhTSt6ohXEf9y1EYONFtcxJqGAJIaZCowdtdpdbgRa/op2zjcPAAKMek
 FyiaUOaZ1POLdzOPBs20MJr8cqBtj+fkyNW2Fah+wbcgbHBxqGKPA4EH5Vtr0DGfJY
 8WbcSxtI1QFNg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=EE1AP8Qh
Subject: Re: [Buildroot] [PATCH] package/uclibc: bump to 1.0.56
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

On 10/01/2026 15:07, Waldemar Brodkorb wrote:
> Changes in this release:
> 
> Julian Vetter (1):
>       libc: kvx: add {get,set,swap,make}context functions
> 
> Waldemar Brodkorb (6):
>       Add glibc internal macros for 64 Bit architectures
>       fix verbose output with make 4.4.1
>       nds32: add missing define for TLS
>       NPTL: remove attribute_protected from function
>       add gettid syscall wrapper
>       bump version for 1.0.56 release
> 
> tinyusbboard .matrixstorm (1):
>       avoid crashes in statical linked binaries when dlopen()
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
