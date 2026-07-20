Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD052C44520
	for <buildroot@archiver.kernel.org>; Mon, 20 Jul 2026 19:25:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83FBC809C1;
	Mon, 20 Jul 2026 19:25:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FoamMaCOXn6A; Mon, 20 Jul 2026 19:25:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3F7B8096C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784575502;
	bh=jjbHcIAyRfjwr3JgBbrlLtn0hEOkaZaLNS4nC1nJHzA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kEY12h/8L5McFz3qNR9pmp1u3jg4hq5f90Uzzb7FECgnXOgwp9pQxziNHgz/X7YLM
	 MqYF6hqa1x7rtOL895446tkMPRNYI5PACKndtOyGJyKM5XxCRDtjrgFfZmN/ujL4nM
	 0GXOeLNc3O1m19km8PpzWCy5Imm2iQf3YAFyvH6SgZKZ2TH+/Bntx0gTy8Ev7uqxfZ
	 DJxOoMZKseDQIhHiDHCoovUoZ/uVXb8U0v2P1WoGI10hJltwgtUcXFWGW+UOZ1yjiN
	 dgOroEILnCSHZpfgemULGOBLTASZ5MjmqZar00Sm56HNbCmcmpTq02FEhI9hZDOgvB
	 x1ASG3Wb1nS0g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3F7B8096C;
	Mon, 20 Jul 2026 19:25:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 69593786
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 19:25:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5B0D78096C
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 19:25:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c0sVVNlL-1nM for <buildroot@buildroot.org>;
 Mon, 20 Jul 2026 19:25:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A659A80934
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A659A80934
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A659A80934
 for <buildroot@busybox.net>; Mon, 20 Jul 2026 19:25:00 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id CEF012003D3;
 Mon, 20 Jul 2026 21:24:56 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 20 Jul 2026 21:24:56 +0200
MIME-Version: 1.0
Date: Mon, 20 Jul 2026 21:24:56 +0200
To: Francois Perrad <francois.perrad.86@gmail.com>
Cc: buildroot@busybox.net
In-Reply-To: <20260720184652.252941-1-francois.perrad.86@gmail.com>
References: <20260720184652.252941-1-francois.perrad.86@gmail.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <2fde6cdf678889dce191256d684d35e2@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1784575498;
 bh=liKl7sV6p9BLCtWs4454jcMA4AQOS0PVdtGoIMhK3ig=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bkEeC/bg5vW0eB3cIyJfsf1h8J7mKuch3KOoDxVb2OsZ1fDTsQuosslk3IeGSstlg
 v7qmNJSzkqt7rjvw9TXL+wZfBMD1O3PIJ28Zcf78YKEN+rortkaUIaU7KVa7B4G4Qs
 RQJs/jhhnq1jZ7JNf118oyqQd7AQK+tfngQlKSgKJ2DdsEFEB6G6Jt2KzN/z6tuKPB
 AkZF0ZKO3OSavIQtyBKyKoXoFYJzP1FjgDqdYu6QK/Z6xcCtTjSjNQoy3rwpOMwcII
 96xzuleN0TDzVtZNTZWv8FPiuFqSQOBrStQu+ckzpvhqBRv0U6w4E/nYxdqnbUB+/r
 RZKFi6vIpouSQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=bkEeC/bg
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: update email for Francois Perrad
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

On 20/07/2026 20:46, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
