Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20580F531CF
	for <buildroot@archiver.kernel.org>; Mon, 13 Apr 2026 21:08:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D42E83F8C;
	Mon, 13 Apr 2026 21:08:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EEIRAh2D_hkn; Mon, 13 Apr 2026 21:08:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F59C83F4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776114483;
	bh=zyeOTn1sbzCPBHKt9EYY73AKJZDE7KQdhRKIOjAkTM8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Md0P7eLMmyCbtkXZI3CKOs82+V0US3/rBVewM7OSPQfeNgcd7L0MRcsVdgxzBB3Sa
	 CB9GT01B0qnIFfZUA7gRP/Z6DxKBp/MA/wvrD9nTwGG+OZD7zEYNObZDsqTl0PJwif
	 Hr8Hkg8rJCvLBwB5yw64a2r1PTteTM/0HnFYPFIHVueRGQHR/aJ5jtZsqjmxM5SfV5
	 IKrIjuzfijSGtWS6+Tx+j+AI/xAtJoYRoeywZ0IA6PlLDoEBdHdrYWio077ZwFcbGJ
	 5R4T6ZgLfJfC+gkDnmgwUbcTx/0+tDvJemEpy5wWuqi2YqUKk7k1JyqS5tAUP1AX8J
	 Fe/UUdkHWBMDg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F59C83F4C;
	Mon, 13 Apr 2026 21:08:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 524BB237
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 21:08:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4429F83F4C
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 21:08:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F9R2ql9zICFZ for <buildroot@buildroot.org>;
 Mon, 13 Apr 2026 21:08:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 18F9083F42
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 18F9083F42
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 18F9083F42
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 21:08:00 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 323752003B4;
 Mon, 13 Apr 2026 23:07:58 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 13 Apr 2026 23:07:58 +0200
MIME-Version: 1.0
Date: Mon, 13 Apr 2026 23:07:58 +0200
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
In-Reply-To: <20260413114051.20941-1-thomas.perale@mind.be>
References: <20260413114051.20941-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.14
Message-ID: <3724a6ea3933cffa2b9587f87290020c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776114479;
 bh=M6YTYhTvW8ciRLswIcQ8npphQIp7ZN73CMImS5lhyh4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=eTi8ZWaaqOWpR37LVgQPuPBo9XE6ryd/xbDg+WUPq1mpgl9cJlbv1BxYNQC/t+LlJ
 uRhd4C3DXVTgHO9f9pEnEDOl9/QBStrdoHKm4tqaxu1ieeBAPFaIPvFYg05oCQbah+
 3lFWFnDCipJUh10YyliBDTcqLDomONYQmu2C9MJvjU4CtWBAlOWHih5M1Q6RsjKI//
 u/m6zHQf5h1RBSFFsElG5x4Wokmpd1WmuOWZaicih75W7sR+6Rsukgmo7IvXiM7Hnl
 pgNMp7b5IIQzHdDZ3MlNC/JUmKIXqMI6rArwf1jE5GhXnGvkXvgWMT8yOnA+b6nvzS
 VwXZN7FNhbtVA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=eTi8ZWaa
Subject: Re: [Buildroot] [PATCH 1/1] docs/website: add SMC-Gateway as a
 bronze sponsor
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

On 13/04/2026 13:40, Thomas Perale via buildroot wrote:
> SMC Gateway creates applications to enable communications simpler.
> 
> They produce an intelligent hub that connects radio networks with
> various external systems.
> 
> We thanks them for contributing to the LTS maintenance as a bronze
> sponsor.
> 
> [1] https://smc-gateway.com/
> [2] https://www.linkedin.com/company/smc-gateway-ltd
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
