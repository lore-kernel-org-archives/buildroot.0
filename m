Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E62E0D6CFA3
	for <buildroot@archiver.kernel.org>; Thu, 22 Jan 2026 19:09:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9683606C8;
	Thu, 22 Jan 2026 19:09:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VOHK4i9pRVN0; Thu, 22 Jan 2026 19:09:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CFF2606A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769108982;
	bh=j6q147I+/2H9yJ+HPdr4U5RvLXJ5TwAVMoo24SohcEs=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZCFCAIQg/ZWksLxioIHzTkrLd/FUHUSNA9/gnDzFvJaCTi2tBmlQuiN+dlGPLAI2G
	 aLLb/m79ut/SY1XtHBjWdWAsYe9sD4LkDdnhq0FXVDEenM1W9Q9Qg75fbi+gsngQoa
	 k6c3QCLcrJdFgDrR9C0QGrBIdfMDf8lFzTBbMsy8kNiH+U8ssqdE/3qp+ibApsgdo+
	 Qkkt9FgRpH90B76wyM6+8WGwZs8FdQbxZogc16ro5IgLJmZBxUMTkrtBTE9/9sF8OH
	 +pS8gsv6pXl707VREZ6jR2OOQRDc2eAtUSFUkd47uZnoS4xH+80t9xNwNG3l7agxpj
	 qh3RZi1Lap/UQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CFF2606A9;
	Thu, 22 Jan 2026 19:09:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 827544DF
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 19:09:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 722E8606A3
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 19:09:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4jaDyWpR4Ozr for <buildroot@buildroot.org>;
 Thu, 22 Jan 2026 19:09:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4A1A8606A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A1A8606A9
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4A1A8606A9
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 19:09:40 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 2F88AB0053E;
 Thu, 22 Jan 2026 20:09:37 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 22 Jan 2026 20:09:37 +0100
MIME-Version: 1.0
Date: Thu, 22 Jan 2026 20:09:37 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260121180719.47597-1-bernd@kuhls.net>
References: <20260121180719.47597-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.12
Message-ID: <5ae5d63b4ad03f3d190992c987deec4c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1769108978;
 bh=enwzvn/xQOzqUTJT41PfACxQnzKEYk34vJoz378xV5o=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FbeHcoc0bBmvjHVSQ4x1VwX1J6TMPwIqQd4mv1dA5fyweuEM6W4pTtzYAuZ/Hsy5E
 zOqHP2/a592hgCu6WysrAf6BB+EH0vsrRaqvGbVVN1eLmU6ft79bktyD38kwE2X71H
 X03sqjYVXuZ8ZkluztKhDfRC4lGkUW6hUZokM8l9ovutOqAmvIzZVWufJKQp6CI1l1
 SmZQ7/o1ER8b1g/hJ57OfRj5NqGNQl321oN74DPysG8VC8s6rYpizqQnwQikZnrzkq
 q3nK6zdFzu/vfWbATjuoxB85vHhceefcUmb/tn4FjNSpgqPUoaayaJh1stUKNy/P9J
 /PHu+nHy1ngdA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=FbeHcoc0
Subject: Re: [Buildroot] [PATCH] package/libopusenc: bump version to 0.3
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

On 21/01/2026 19:07, Bernd Kuhls wrote:
> https://opus-codec.org/release/dev/2026/01/03/libopusenc-0_3.html
> 
> Removed patch which is included in this release.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
