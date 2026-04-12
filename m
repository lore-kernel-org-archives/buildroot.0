Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F3B9E937F6
	for <buildroot@archiver.kernel.org>; Sun, 12 Apr 2026 17:59:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD7EE423F4;
	Sun, 12 Apr 2026 17:59:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cCom8UfrSC3L; Sun, 12 Apr 2026 17:59:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18AFA423C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776016760;
	bh=PMWpbKRmVTOd7MJOUkKV3nBnKhESyzxlql4AKzkOPnM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=eqBkTpJCNq+c/Dc54+0GB0J7wd1Ya++KMAxm3pXfJ6T6t752K+SqV6iz+pghmiS1I
	 qvmcm4WADl8qrIMgEmSlGqMyPp+tDmNZKkp4JDUESFBBNCG0Gkl1K2YE2JUgOOhA6v
	 ngg3yrdwZisb8weTJKJw1JWxcRTIRyDpkUdeSVGmESoXmFbjfVUGT4yKQ5KtXhDIrK
	 5BnAvb8EkhPkMh+y6PtGvcSIX25o2R3H4/tmiki9GRtT84z6MMsHTOutBDLLNyh4b9
	 JdSYhZn646cVB8TId4o5UOLI1+hsjqilF/9cxJCQNfvTjLMryB8sCjizs9g05/VvRk
	 jzEs3N61XczUQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18AFA423C8;
	Sun, 12 Apr 2026 17:59:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 92188283
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 17:59:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 83D2740693
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 17:59:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eR4fgJyr39ZA for <buildroot@buildroot.org>;
 Sun, 12 Apr 2026 17:59:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2E0C34009A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E0C34009A
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2E0C34009A
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 17:59:17 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 15A78B0053E;
 Sun, 12 Apr 2026 19:59:15 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 12 Apr 2026 19:59:14 +0200
MIME-Version: 1.0
Date: Sun, 12 Apr 2026 19:59:14 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260410052000.26329-1-bernd@kuhls.net>
References: <20260410052000.26329-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <a99be6a8d362dbe19583b3f904e7c681@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776016756;
 bh=JCmSM5G9rt8VfdBS0n1ZYRS+kItLo9Lhi4Oz0EI+jnQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ecKqZxM4aUbttTFMyf9ewHI9B/pCSTCgI0+d0YjMknUlJ70frsnEAdh1l0dsbT9KC
 ST8N1PEI38mQ7Z9/eRaA6uT2OFEvCPw3DwAfhAuFa8i9YjbtKvjjZ2P+b2fhHtsB9V
 FDKBWM8Ugp2Dwq5zxKFxEP+t5Y0kypskCxXXlbGcP25sEwhsQjgW9pMhgluR4l3w/G
 W994XuxWJ65I3cb4lkzpirm4bLAte9r0E1FPh/yU803hXD2129htXgBAuqa6/lTEm6
 ZmkfomjMz8mpRD1FwsoqD/HzFm9SELv4ztlnKPRw8PspA2a+dVa/X8lf3duUEJEnX5
 nzfgHwmxIe+MA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ecKqZxM4
Subject: Re: [Buildroot] [PATCH 1/1] package/php: bump version to 8.5.5
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

On 10/04/2026 07:20, Bernd Kuhls wrote:
> https://www.php.net/ChangeLog-8.php#8.5.5
> https://news-web.php.net/php.announce/488
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
