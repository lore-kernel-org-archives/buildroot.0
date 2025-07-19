Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F64FC83F34
	for <buildroot@archiver.kernel.org>; Sat, 19 Jul 2025 12:16:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA83F844DE;
	Sat, 19 Jul 2025 12:16:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pf4NiELXIjNL; Sat, 19 Jul 2025 12:16:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29253844DF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29253844DF;
	Sat, 19 Jul 2025 12:16:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7E249DA
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 12:16:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 64AD841B6E
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 12:16:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pNZxFhlNuy8j for <buildroot@buildroot.org>;
 Sat, 19 Jul 2025 12:16:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C1E15419F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1E15419F6
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C1E15419F6
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 12:16:51 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 67F8160136;
 Sat, 19 Jul 2025 14:16:46 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 19 Jul 2025 14:16:46 +0200
MIME-Version: 1.0
Date: Sat, 19 Jul 2025 14:16:46 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Marcin Niestroj <m.niestroj@grinn-global.com>
In-Reply-To: <20250719004652.3087009-1-james.hilliard1@gmail.com>
References: <20250719004652.3087009-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <b2adbf901810ed2ffffb65296999a8a7@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1752927408;
 bh=ePICfOKFJV1mVIHzj4NjcgFxuuVcvzqN5BIeFl73c7Y=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dhK8qAkdhHc0iVkjxu2MWRKUad9azbuoF6htLf/08d7nDKSsQTosyMscrB+sxcp3u
 ELR22uUqGwq7msukisUpSPQXqQxmylBI3wc5LxwgKQZbZH+ebYcUmiXRO89LWSi8Nb
 QIsbNanHhBPbOGfltutjZi8bZdcyW01nHwb8/mZEQlzfkv7ERE4qkNtW/DVZK05GME
 rItHC2AtUaZ5LM2iHStQ+4kWubsYlLvL68GJGyMfYAMyWuIpZtN8dIIVGzgxKJjMvE
 7+BZ6JbhouwlLZ7kM6V6ALLhTm9QGpe5vtg6oSXrU0DOFLdZ+IYSb2bOkTGb8Ln6f7
 29PPB3b+T/MvQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=dhK8qAkd
Subject: Re: [Buildroot] [PATCH 1/1] package/python-dbus-fast: fix cython
 3.1.x compatibility
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

On 19/07/2025 02:46, James Hilliard wrote:
> Set --skip-dependency-check as dbus-fast specifies an unnecessarily
> strict maximum cython version.
> 
> Fixes:
> ERROR Missing dependencies:
> 	Cython<3.1.0,>=3
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
