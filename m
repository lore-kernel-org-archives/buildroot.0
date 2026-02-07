Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40A22EE0AE8
	for <buildroot@archiver.kernel.org>; Sat,  7 Feb 2026 21:29:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11AB761257;
	Sat,  7 Feb 2026 21:29:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KUgLDTgbIjdK; Sat,  7 Feb 2026 21:29:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2FF98606E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770499743;
	bh=/ivJBEQGplUBlnMPVzcnqxo1ixaW1QlYA57hx4tv/ac=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Xx13WJHAC17sadlMSGxIn6FseMhV7y1KOE4SxPHjtop35VQcxb/TUaPrtGCs3zAJY
	 fMeIDELXO2vLVzycS6NY2gmzLGdPYsBbtppcVUGHpkLG7049GtfYPO+hZY8FbMvQ0P
	 C2mOl3JTC8CNCvwsMuJCx9tOfBd6cn7U3I4ngY4LeBTuEUTx0a473JeNgggOPgoYRA
	 poFaTfYXcJO+aO6kyTlu+Xu3Ymo7z86A4xsQErlwwZCZgOgsGmYgFoWZ6rDan/ei2J
	 pHbyPrrfPjLqLngYIfw9guvwWMvhqnEYTuz3guVOv+7cTuzhWMnhqIbcsqgK2HBqox
	 JHzjRrt5AERsQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FF98606E8;
	Sat,  7 Feb 2026 21:29:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 60915173
 for <buildroot@buildroot.org>; Sat,  7 Feb 2026 21:29:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4ECE640862
 for <buildroot@buildroot.org>; Sat,  7 Feb 2026 21:29:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 31V9axbcvm2r for <buildroot@buildroot.org>;
 Sat,  7 Feb 2026 21:29:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6C39C403BB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C39C403BB
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6C39C403BB
 for <buildroot@buildroot.org>; Sat,  7 Feb 2026 21:29:00 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 5ACF62003C3;
 Sat,  7 Feb 2026 22:28:56 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 07 Feb 2026 22:28:56 +0100
MIME-Version: 1.0
Date: Sat, 07 Feb 2026 22:28:56 +0100
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org, Raphael Pavlidis <raphael.pavlidis@gmail.com>
In-Reply-To: <20260204135639.2603782-1-peter@korsgaard.com>
References: <20260204135639.2603782-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <5f3f7fdc71b7f3fe029b287c7afdf554@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1770499738;
 bh=eAk0JDMvnhyxMcxdZv+Wby2Lk9eqC0ZZ+UFf8qjbOcs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=IomYbqEUkwjW5d7nrVtFRtNhxopoqNsw6kykUip1wFjfjfabLkyXaD+GKtKoSPotN
 nraA6zJ6NeYSkuGcNElJg8+Z25b3yxomi90PEmfxm8cBiBTqNDv11bL4rvCY0oj/Kw
 pftEZpem7vDBYHgTLXjSbXCelASsGsSwnHkiGm5UF7M7JtZNBdMSCbF6FyYrPg27GP
 +0nQxIumCun7rMxx/RTykSb8OaBKEJX8QI/5vBqXo/M+jGRWG1EkYhjpxt8sxwr+nB
 Tf2zcDCU8PO7xY8H1yVNg6mWG8DQuJbb5dLFKMV7jMi2Y/RLFB1hTEq8ubt5V3V1yj
 sxT7B77V7PBKg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=IomYbqEU
Subject: Re: [Buildroot] [PATCH 1/2] package/shadow: default to
 BR2_TARGET_GENERIC_PASSWD_ algo
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

On 04/02/2026 14:56, Peter Korsgaard wrote:
> Make shadow follow the the BR2_TARGET_GENERIC_PASSWD_* system 
> configuration
> option when changing password rather than DES.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/issues/134
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
