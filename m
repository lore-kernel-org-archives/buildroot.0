Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E641CD3424
	for <buildroot@archiver.kernel.org>; Sat,  2 May 2026 09:48:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6BC3410EE;
	Sat,  2 May 2026 09:48:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id frg1HXE6GWgM; Sat,  2 May 2026 09:48:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4867C4116F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777715314;
	bh=hBb3tqVNrK5YZ/4AUb7eFGGNpUwQXOZ8pFziIITtbpM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=sf6ncWrlvU5c4RfBJx7xUGKePzoCpSs3nc/cg8bsxwYJn++5BeLByRuusNy5AI3vz
	 6QlVO4n6et5P2b1U6iJ/koTE4YQXdT+wTA/P8A3hhJ/waNiUslXzcNif7WhW+ilFlI
	 aHGMQcukOlAwr9JYK0nss5jiis1ArnWzX8ZPtUd4XXhtkh0yrAZuLw5Us0NBdRYv61
	 HP9/RIboSxy48uXqXkMzYJXKPNxBhwrknc2P8Zgov+2T5+IVg8McWwQNODdF47acR/
	 ZwwcxO4YPYc60GKqrIzTHsB+DpLIyg5NkbH8mWftjeR2CfwYI8J1IJCUY28Gxh94+K
	 PPICVA56Zfxvw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4867C4116F;
	Sat,  2 May 2026 09:48:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7947E204
 for <buildroot@buildroot.org>; Sat,  2 May 2026 09:48:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6B0954116F
 for <buildroot@buildroot.org>; Sat,  2 May 2026 09:48:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RMbQlNvniYxF for <buildroot@buildroot.org>;
 Sat,  2 May 2026 09:48:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 871CE410EE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 871CE410EE
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 871CE410EE
 for <buildroot@buildroot.org>; Sat,  2 May 2026 09:48:31 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 90C8719F57E;
 Sat,  2 May 2026 11:48:26 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 02 May 2026 11:48:26 +0200
MIME-Version: 1.0
Date: Sat, 02 May 2026 11:48:26 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
In-Reply-To: <20260430044144.7757-1-bernd@kuhls.net>
References: <20260430044144.7757-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <bc62f27c9106f0fdb9a4aadce93b213d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1777715308;
 bh=aV835a5trwgNqup5a5oZPANtL7VEKUFcrY2IyNP+arU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PV5tzWNpWTdSL781dftDbKq2iieaO0OHciK3GxxXLlCNznWue8P3DOK91mJViyk61
 LyYM48Z4OjBF3OUKE0SgZ/4BpxyozOo7eMnMGKqqYtktFinaPjaQOPpLbDBsUrWqrc
 k0YtTW0r4p0oqQhMa2lp9ZJefY0/Vl1fkZuEK/JwgeqWrHbXtTa1uBVn9rCBkfq4k1
 HoXPVoSaD6zyUs3LuMyeSlriKsOQ50s55Se8R/RfQRMpU5h3tSHzVLjOk9vE2lmDM3
 XHjTMsu0ilOsbTE2QPnjYHV+BKvNS/U6JKrsi3bF7PHfuk1E4hhn05nEfGcZYqmT0S
 I32FDXQEqgGyw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=PV5tzWNp
Subject: Re: [Buildroot] [PATCH 1/1] package/exim: security bump version to
 4.99.2
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

On 30/04/2026 06:41, Bernd Kuhls wrote:
> https://lists.exim.org/lurker/message/20260429.121733.f58d9686.en.html
[...]
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
