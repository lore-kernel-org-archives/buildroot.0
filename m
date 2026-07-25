Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44C0FC531C9
	for <buildroot@archiver.kernel.org>; Sat, 25 Jul 2026 21:30:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D364C80E0F;
	Sat, 25 Jul 2026 21:30:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6KzOoXLbZE6t; Sat, 25 Jul 2026 21:30:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0AFF180D96
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785015036;
	bh=rZbVgwaAD1LIpkKxzGKF51nsZZPd+sywjQZPKXe4MG4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=q4yZ6PBxttG7MVfj66FPtKLSmtw4Iq3tO4HVfi5muLt6wnSO4QMsL/br00Ep8YhN4
	 ms724oQJbEOiZdW0ul0l6no2UDWxlqA5tafmaer/xHTXXFAN2gOb1d7hJu4bZrMSlL
	 F8+A1/BrQ1cJo5zuxdEehvy4XdsaNzLuAS8kK+iRVUAfeSOMwJhcWn/OtFtBjgOMf7
	 p2wYUtjjxzFmcGJErM1TvocfMC7Juu89mmst+SeAgqZKt4thOwtOc7Ezk6GrQovwE8
	 h6GQs+6krXwfnho4o2bf5spfeal9lBWswFB7WQGPJ5cMDBfy8KBk9WIk7e2c1yI8vI
	 RlgAo4pZenHmA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0AFF180D96;
	Sat, 25 Jul 2026 21:30:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4B7DA357
 for <buildroot@buildroot.org>; Sat, 25 Jul 2026 21:30:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 31FB4406EF
 for <buildroot@buildroot.org>; Sat, 25 Jul 2026 21:30:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uiYyvDtKiQJ9 for <buildroot@buildroot.org>;
 Sat, 25 Jul 2026 21:30:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 65657406EE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65657406EE
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 65657406EE
 for <buildroot@buildroot.org>; Sat, 25 Jul 2026 21:30:33 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id DEAED780368;
 Sat, 25 Jul 2026 23:30:29 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 25 Jul 2026 23:30:29 +0200
MIME-Version: 1.0
Date: Sat, 25 Jul 2026 23:30:29 +0200
To: Maxim Kochetkov <fido_max@inbox.ru>
Cc: buildroot@buildroot.org
In-Reply-To: <20260724061726.80583-1-fido_max@inbox.ru>
References: <20260724061726.80583-1-fido_max@inbox.ru>
User-Agent: Webmail Free/1.6.17
Message-ID: <0f6bcfb0b5331922c2a1c7d4559eab05@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1785015031;
 bh=ju0/rzlm9dgYeMG/8ZkmpqgxmxF7LOIwc7uChaV/Xn8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mB0WQrs3fkhif/oWWOJ3yONqQTXOATNq/GidpD6QmvW2OAe683gOoFnOH9YDtltlW
 jwEsEqcnVw/OVbtKLEyP/8cSuNtHeAXDyxLarDSPzKWboywQbzuo4MnexP5ePPti4j
 aNzLVw5vD6/CoyD3nWP+G1rINcl/mj4t9HZ53NR4dXByr8wZG4MbvqOlXworMrvtd8
 K5VFFsr9XPXGUPwNXRP17vi8A750hIq3h+JORzPAYvk5P/rBIUJVi+Lh4ZbuhoNh7D
 1mkvEJerQcRyHvVJoSzePdgZ/uYW3L9rlUp7V8K0hap3xXhM0TRyLK+plrvkIa80ds
 lWaGWiofmFyDg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=mB0WQrs3
Subject: Re: [Buildroot] [PATCH 1/1] package/libosmium: bump version to
 2.23.1
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

On 24/07/2026 08:17, Maxim Kochetkov via buildroot wrote:
> Changelog: 
> https://github.com/osmcode/libosmium/blob/v2.23.1/CHANGELOG.md
> 
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
