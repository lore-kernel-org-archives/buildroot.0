Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6149C88E53
	for <buildroot@archiver.kernel.org>; Sat, 12 Sep 2026 13:35:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9FBDA80E68;
	Sat, 12 Sep 2026 13:35:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r7V94LSvgFje; Sat, 12 Sep 2026 13:35:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org C2A9280E3F
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789220118;
	b=A3vpyK6YgSz0f0ioHikxYjyW3HFm9c4LPk1IbqnQWs+GpRBFM8DYaqkBKKxj6RWM/00D
	 58Rrn5/5Evi2mPgWHqDpXHX9XLslavoyyjOhQFw8FW37iNX3/gzsqdySO98EG7u4tgEXU
	 YKv82kX4VNsFwZlUJASZM7DWyMbKb12u/XOuQ8SlnNlSxrhQSWSICjFxKdaSPWC3EbrNv
	 j2dk8yCawrX/vcyV3yI1r/2Mlix52GdxyTYEaYXYh9Itvwu6NW/22xu+OWsrn99PzFNNh
	 QKhgONmrtnIDz/iovxNOfHJqM7mhbmyKBOzT626KgNwJOmsql++NKJexEWw1PyqhztA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789220118;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=/bn3gbNLC4Le5t9lw+Vltu8TvLXZ4HCfw3kCQVySLqU=;
	b=h0sL2p0Wqwrlse6KSWi5cJsyBZ/LoEACdkcc6pzJ+KXw1+M4ueL2/x8OdzFTWqTvvIy3
	 C34bQdGoKA1Hb6hfgzara86KSCMVeqNzMYvFzX0equ2tdAZmBM0vVlN6kkvJEd+e/i5Za
	 mksvSoF2z/P8kYqNzZnrI0QPzPqVY315S4uQqjMXKIWN3zqbL2AFX2Hw1yDvz8KSalEVF
	 YbLJpAxduvxJ5uLZJUWPDxu4xHZ6ecqN7qSi0zhKIR8IzyMX5J1AeQConDq8jrTESrqDU
	 x9kJk0PMmB7JWZ2FOy2yCu3L4nz/qIZ3T9yamwSCkC0btpyDUoroUUyVXYbSSzGT+Qg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789220118;
	bh=/bn3gbNLC4Le5t9lw+Vltu8TvLXZ4HCfw3kCQVySLqU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=sTx1XLWHyYWLKK2OmqOFe79pjznNSgAbm9/K0lGWPYIgp5YoC1HIZyOgjl/LvKIv9
	 akB/PkgCoZpH6KvHAhmSBWWmk88GjCrVE0qaRKvUsrykWIoe1VoJ7woVKSEPfG4/nz
	 8MvStV5vI3wrRStzuZAbeCSsxV+yJCVBv8cZBD7WvglUhpcGfkZLklMjoTipnVE6Ed
	 CV0CERpsBUncklSh8h5hcPfVdf0EUe5FnOk8Xxat9R21h5mc2W971iMSxeJmjjMiuL
	 qMaWVh/pc4s66u9jwDEYPaXQFPdTsNpNJfkKxbJrKAXTIG16JfMaan2YkbJ1wLA9c2
	 uFYrOhEVU9NIg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2A9280E3F;
	Sat, 12 Sep 2026 13:35:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1505A32F
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 13:35:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 070D64072C
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 13:35:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sMsyaN2YNvtW for <buildroot@buildroot.org>;
 Sat, 12 Sep 2026 13:35:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org F3F1040722
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789220116;
 b=dGKgbRQXdKmawNpnX+1ViOw5iLrmFmpitGDs0u1AWYL+4DnkDYG0J+4nBUt04oGxb7ch
 vfuuUfOOHVoRrviGBNuN401TGWWbsOOXhXWdvgCKQQFj/Z+USDpGX4isuPGG3LoIKJCfA
 FRzlfeE2XsT7eIRE+bUJ/sjr1GTwLbNVBQDynWhdzonZAmPWSXAIMauLYrEi0G8a6lZi/
 lQrCEOmXS5K8m3QlsRRAphLlVriNYPYqiWS+29yRAnhZCd/zApexzd/IYXLmGIO7L7Xqd
 3oruXyzkU2h2McpIPyam9cc63LN7E4s1nxC7n259LL0uj5XbEWuD2iEuqUfR/qcoVdQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789220116;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=UgvrI2Lx14FWbU7b5M3sWT9HAOCpV94aY4I2wU/KBNw=;
 b=VJxlWGwGHPlSXxv7osi0xEpXwFdSi0wwEsEHw0ZD376irWPR5kjSQrxe/6ZDHIyg7JmQ
 KPuV1mqO+E34qLhCEayV5Wg5cgXwU/ugMGeYY0wgCX6gK/PWfWCFqWuGemNkTzExh14N7
 Y428xX+7em5aAEtMKQjK3BTpzYp0Wf6b/NCGF+Z7ea+OTO1DPq/syeIRJCZB7bszwxzgt
 VRts+InsTNXLoQ0oslLcM5joChWohQWIgG0lNFD0dH0rD+K3rwrmVGO+m+Od0N9eeJ8ks
 ZB5h5OVzMocVhfHseFcwKl+rFOqDbi+UmQg7hsKMLC/hdoMPRo8UkarGZ7SP5N1JYZA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=MUyKTo5Y; 
 arc=none smtp.remote-ip=212.27.42.1
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F3F1040722
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 13:35:15 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id A54D8B00571;
 Sat, 12 Sep 2026 15:35:12 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 12 Sep 2026 15:35:12 +0200
MIME-Version: 1.0
Date: Sat, 12 Sep 2026 15:35:12 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260904184245.875865-1-bernd@kuhls.net>
References: <20260904184245.875865-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.19
Message-ID: <af089728916d5a0a52a5de47c9b951e9@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/omniorb: bump version to 4.3.4
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

On 04/09/2026 20:42, Bernd Kuhls wrote:
> https://sourceforge.net/p/omniorb/svn/HEAD/tree/tags/4_3_4/omniORB/ReleaseNotes.txt
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
