Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B126F10F286F
	for <buildroot@archiver.kernel.org>; Fri, 27 Mar 2026 20:56:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8877083CF7;
	Fri, 27 Mar 2026 20:56:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yxU8lk-yUHRJ; Fri, 27 Mar 2026 20:56:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B98D683CD2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774644992;
	bh=8qLWtlmep+eJfw+fkcBfst/wjSPjh8ZLTZ+WbGwfqIs=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=I6dVznUIlJ9eRS+npb8IFAJ8AenrsVbtyGEj7qxu8rzXuZP3p03BDyyEcPkpq4UTd
	 kB1LRCtzn+zMSOkwhOOtuXHJWw8fozIIKx8nAbEi2R54ZtNhMFYqjf8ZQ1Sj2nsNWk
	 eciU8m+tg8WraczLRmYmgoHbstj8PrC6tr/YQ/5G1+vcX9LsDepo2vuXtWBbzKJM2q
	 Mz30Kt7aqEZtFZKnsW78hz6GkHWzmhTGPlSFbORST8q+o2wHt4aygpbGbbAVxchFtn
	 FneuO3dt0D75ffPGeJPzswMIsBvkOr43EIhE52mEmY3qLeTOLEa6k9jkL8Keu6VrCd
	 uu/3z0FNq7Rog==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B98D683CD2;
	Fri, 27 Mar 2026 20:56:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 385B81D3
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 20:56:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E7DA40142
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 20:56:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xusD8f6PqB-H for <buildroot@buildroot.org>;
 Fri, 27 Mar 2026 20:56:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4ECC740029
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4ECC740029
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4ECC740029
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 20:56:30 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 39EC32003C6;
 Fri, 27 Mar 2026 21:56:27 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 27 Mar 2026 21:56:27 +0100
MIME-Version: 1.0
Date: Fri, 27 Mar 2026 21:56:27 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260327180219.1985026-1-bernd@kuhls.net>
References: <20260327180219.1985026-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <79f3199a61db61f0db865bda5ffd66c7@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1774644988;
 bh=dKw9WjLb9W71g1MqpC9WvqJrhbAfd9MoGb5nuZ2bo78=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tUuv0Ii9HG4iCw3yXKbe2T8/NzHMK+FG68YMa8yMKQrRMwD6DqtMx2iNmtxax2V4i
 iDvNTQsmCOWhyAgmn1ARWd0hY0AdAgD5dFZiW+9HjL7AeSKa6Czym5y3XCiGm0IV/r
 ZYTAZJ9Roum4k/4KkTztzYbZLw2cNjo4mCwQMcIYZAIHQwFKDp5y5oTJaG+iDbCcRy
 uxbk2qkdWr8HjXGajCqeU5Tl9QlMwfncKfoTo2JbJqjc1bDtnvzYFWrHLyRi0Qrn1R
 +fUQE1yH/dbnQU06O094PgtenlnVJzyIQ1gd6FVsThb/mggJU3+OaerKY7LC0GQ4xv
 ThzSpFx7va5Mw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=tUuv0Ii9
Subject: Re: [Buildroot] [PATCH 1/1] package/jpeg-turbo: bump version to
 3.1.4
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

On 27/03/2026 19:02, Bernd Kuhls wrote:
> https://github.com/libjpeg-turbo/libjpeg-turbo/blob/3.1.4/ChangeLog.md
> 
> Updated license hash due to copyright year bump:
> https://github.com/libjpeg-turbo/libjpeg-turbo/commit/e9b497016cde1ab96498a9ee1822d83c06ce5bee
> https://github.com/libjpeg-turbo/libjpeg-turbo/commit/e82016c6bf5a14b68f4c9f0f3747af8cf1af917b
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
