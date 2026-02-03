Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50DCBE83065
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 09:11:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 147C260B78;
	Tue,  3 Feb 2026 09:11:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OnBUmbWinUTq; Tue,  3 Feb 2026 09:11:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C07060C26
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770109889;
	bh=KeRI6+rXo6TwuIVlnX9eH+1XwF1ARQ9RsPDzLNWyxvo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TV0O3fcskfcQttoIfY14vXg4+4Tx13dp1kaqxq7FDLahS4O+tQzsaqFolCg49ZxDR
	 qQTONBN7w8m2qGQWywytjNkllaZcTBW3g9rqKp3JaVpIVOyrJdB9ItWOaZNayLHJRP
	 KL7licMaSCKaEtT5100ksqTV5DHAO87WBSAH/N8w45YeH7fWUEBo4pHzRSBJ88QfuI
	 6Y/DCkK3IQezqixNOzPBPEQZdOfTxOkfTxIfLnKZuUWcRQTANyi4BJW26rCe3exv6P
	 RgEcRhMguBUbJuoCEzphqAtu4R0v6AxPfZWCCb03bcoxUXvnndXQJtzfd6MGcziOrU
	 DyQgrHVPeyIrA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C07060C26;
	Tue,  3 Feb 2026 09:11:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C0562F4
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 09:11:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B76FE405ED
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 09:11:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id deJ0NrPhVpeu for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 09:11:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8166B405B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8166B405B9
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8166B405B9
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 09:11:26 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 6EC2FB005AF;
 Tue,  3 Feb 2026 10:11:22 +0100 (CET)
Received: from host-109-89-232-55.dynamic.voo.be ([109.89.232.55:35968])
 via host-109-89-232-55.dynamic.voo.be ([109.89.232.55])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 03 Feb 2026 10:11:22 +0100
MIME-Version: 1.0
Date: Tue, 03 Feb 2026 10:11:22 +0100
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20260202181527.2584850-1-romain.naour@smile.fr>
References: <20260202181527.2584850-1-romain.naour@smile.fr>
User-Agent: Webmail Free/1.6.12
Message-ID: <e01a60b7317839ea8f15807ee7d9f93a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1770109883;
 bh=+zkbORGaMrbCAZL31iFFSy6bdbsEBUuQE+9oHfYrrUY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dl8wsCLxf9PNWP0s96xR/+eXnyqG/HbTsxHf56I5H9FlFK5dC6WPSVWF+vHoJC5g/
 x/dYJ3j5WYase2OyfLfRCG3qnRVHCSwnb+KNqVsAUUxxRWuVl3bW+/guncahNqt3yj
 X/fyoFykiq8Nob1kOGdfzZSCYWWMvH8GJL6nCepQ6hA9ypJ0paAOx42Bfeu00QisuU
 6DJ2uLR7RwEgmkv4ChYMo7DhYvYs/Gd29jJSLPgZEeC/LuhaIy2PPOaWBOXoLYm3S7
 dxuD/1/zMkfOB/TcaJFto36qbgl58iPQGDeax9LdOWBL6UiQxIJVwQmp/MMGojG7sV
 UuzdW/wlpDTTg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=dl8wsCLx
Subject: Re: [Buildroot] [PATCH 1/2] package/python3: add optional zstd
 support
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

On 02/02/2026 19:15, Romain Naour via buildroot wrote:
> Python 3.14 introduced a new zstd module [1][2] that requires zstd
> package as dependency.
> 
> Packages that requires this new module should select
> BR2_PACKAGE_PYTHON3_ZSTD.
> 
> [1] https://docs.python.org/3/library/compression.zstd.html
> [2] https://peps.python.org/pep-0784/
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
