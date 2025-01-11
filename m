Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21B84E7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 16:48:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBC9040143;
	Sat, 11 Jan 2025 16:48:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7GNgi4L1y9cW; Sat, 11 Jan 2025 16:48:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C69D04063A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C69D04063A;
	Sat, 11 Jan 2025 16:48:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D6648950
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 16:48:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B386C400F9
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 16:48:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MPZYec0t_XxK for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 16:48:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DAB3140017
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DAB3140017
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DAB3140017
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 16:48:54 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id B31E32003DE;
 Sat, 11 Jan 2025 17:48:50 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:43616])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 11 Jan 2025 17:48:50 +0100
MIME-Version: 1.0
Date: Sat, 11 Jan 2025 17:48:50 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Ludovic Desroches
 <ludovic.desroches@microchip.com>
In-Reply-To: <20250109220118.2427877-1-james.hilliard1@gmail.com>
References: <20250109220118.2427877-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <71ce045ce43b70527a7aa0dc2948ae36@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736614133;
 bh=/P+wNo5rgiBGQYxvw2sE4yPmkKazluYyp+ImOKRaRHc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gvnvm3eAqfajbNxhWe7nFbnpKySUFBXVMjNh8DInFbyv+tcEI6Z++Spzs2iVHTGu1
 b5/Sr+Rq3+n3bRQVN/3seVzNlZ3rMuqRBr4TNSYwE3brRdlkq97rD7LfakRhpHti6C
 RCDs4aLOym9EC9B1IW/3I8T1DuRSVKo4aU75jYi/6aQGv27ftS+IcPcRv4G0k9LUG3
 FEW9UJEuqPTExccLo/Z1UXpeJNckjmOlomkGGVmCcBJBAuhBfHyfnFnASZT5n988Dl
 GQpSwsfN57sqnrc9iuDfsXAdwgyj+lLoxqUGHvp0f7srEbrBLKzfB3ruy/ywi9dLNa
 J2ksuP6Lz0GKQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=gvnvm3eA
Subject: Re: [Buildroot] [PATCH 1/1] package/python-keyring: bump to version
 25.6.0
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 09/01/2025 23:01, James Hilliard wrote:
> Drop no longer required python-entrypoints runtime dependency.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
