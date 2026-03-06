Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA926FCC062
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 18:58:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 967C461417;
	Fri,  6 Mar 2026 18:58:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HBpNMeuA2Kbe; Fri,  6 Mar 2026 18:58:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B2A4613C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772823491;
	bh=IEvsSnylaVDV3DURN7YcmPVc9zLXLm9Iq2y04uujBHw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZYsMtYZLnVU08E/7GV4n0sCWObmi7YZdmBVyxGgvpZi06VEk5ELFHq+ntY9y/5jyq
	 LaUrbm1kNBnS2rPXeQayPGj4/p8YUHz+PRR/ueqAtt9gWMwrvqjI7dVvPqTY8VK2yg
	 JXS/C0UiIwmhSSYxHZ+OfragcCnPNgsKLTIfm6OJTVVeb9q5GD10lMNTf39OXtIHey
	 5cqahOCkIE8iXn/mbaDsVdrEGrZqWzht8AXvx+E4c9y6KweDda/2Ok7KwT4YTwYAVt
	 gXKD8PdMUwvfuAYtXt9WVksfLMPmExXJ2LLl+KgLfusSHjcTHfjre3g99MQBTfK5sN
	 iWFZFkin0vJhA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B2A4613C3;
	Fri,  6 Mar 2026 18:58:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E9FB339
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 18:58:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0047D419FB
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 18:58:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lCL5y8a6c3M4 for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 18:58:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D0CB341906
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0CB341906
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D0CB341906
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 18:58:08 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 384A55FF95;
 Fri,  6 Mar 2026 19:58:05 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 06 Mar 2026 19:58:05 +0100
MIME-Version: 1.0
Date: Fri, 06 Mar 2026 19:58:05 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260304191217.3487635-1-bernd@kuhls.net>
References: <20260304191217.3487635-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.13
Message-ID: <b640ffe9759177d052d717946d23628c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772823486;
 bh=JplmvIzZlhr75xJEW1Pp/i+QWMJgxzZOyd9EuFrRjws=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BRcDhcWFg1ERTpYGcHY21C7LxED0t2EWHFTdS0xR0mriSA0Oho7Ks5QlsFFTmj9xO
 oR6t9Ln26C5s/EUGGn5IoiPU8IikPQ8dPF1FY50oXKiyzCgFCEeE8HfI6R8C4B1o0V
 ftHd42Tl5cWfM0mljfAIk9oqGznB2xuiVs5VTJGQLuH9ugdp/SivQoT4cAEEWK2tjr
 wn5btZ06YZsEoXHmoJMfxrb5x/gqd2tCo8OyluoZ7rsiIRC/OCaBLzdEp0fzgA36/Y
 EhSZJ5DZt5WLZutOJ70D+ZXk29zggph8rXN2yCXo85Y4I0cUqfZ8P6PRcq2BAOmaU5
 xObC0auFKNpXQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=BRcDhcWF
Subject: Re: [Buildroot] [PATCH 1/1] package/libid3tag: bump version to
 0.16.4
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

On 04/03/2026 20:12, Bernd Kuhls wrote:
> https://codeberg.org/tenacityteam/libid3tag/releases/tag/0.16.4
> "We now provide our own source packages instead of using Codeberg's
>  pre-generated sources, guaranteeing that the hash won't change."
> 
> Removed patches which are included in this bump.
> 
> Used tarball and its hashes provided by upstream.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
