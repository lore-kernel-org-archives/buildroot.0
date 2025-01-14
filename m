Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A99FDE77188
	for <buildroot@archiver.kernel.org>; Tue, 14 Jan 2025 20:19:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D0C283FAE;
	Tue, 14 Jan 2025 20:19:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0XGSyxZIvC2L; Tue, 14 Jan 2025 20:18:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F48883FC1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F48883FC1;
	Tue, 14 Jan 2025 20:18:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5220394B
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 20:18:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 336486101D
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 20:18:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jGCFT_0DU1AE for <buildroot@buildroot.org>;
 Tue, 14 Jan 2025 20:18:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2E7C460FB1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E7C460FB1
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2E7C460FB1
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 20:18:57 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 2C3B113FBD1;
 Tue, 14 Jan 2025 21:18:52 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:41346])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 14 Jan 2025 21:18:52 +0100
MIME-Version: 1.0
Date: Tue, 14 Jan 2025 21:18:52 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250114011524.1106877-1-james.hilliard1@gmail.com>
References: <20250114011524.1106877-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <8dff319fbbde3a80b9f1e40893eba950@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736885934;
 bh=G0Qd8PqeNFQggFZ4FzU5yw2HjmJ+0ZH+iivpZa8W6Go=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=GI3rozeFPC/PpQrbxqpkInKVpOvubFvwe0U/ukrAdvkbHwDti2NLKYAdCs2aFh2d8
 i8GZgbgvXZYY415T+NZZ8zrbeZJLJ0w+bOw3wihlbB5o0t2EYVCy7/Z8ppOEC3DztL
 HVy0gvJE9xU6QkW0VzjDKoFLbj4Zzm8USILbqft77KV4QIXp0PcV5jOZMvcXpvd7oW
 bj8BubwwWjmra/bgWxjhq6SBxpHbXW09AqQ9WujhbFEouvoFkMNCYPanhk+pGaEQNe
 64HP6RENr36hVSuugWHIq9DaHM509c7WgVjRbanJ5NesyF//0NKopmzZcu9wWdwzJ/
 PKC02owjASEzA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=GI3rozeF
Subject: Re: [Buildroot] [PATCH 1/1] package/python-betterproto: disable
 dependency check
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

On 14/01/2025 02:15, James Hilliard wrote:
> We need to bypass an unnecessarily strict dependency version check.
> 
> Bypasses this error:
> * Getting build dependencies for wheel...
> 
> ERROR Missing dependencies:
> 	poetry-core<2,>=1.0.0
> 
> Fixes:
>  - 
> http://autobuild.buildroot.net/results/0de/0de5b31bc649b97684deaa826e386ada50022d6a
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
