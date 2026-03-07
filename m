Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D1C0F55102
	for <buildroot@archiver.kernel.org>; Sat,  7 Mar 2026 20:50:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 25F8983DE8;
	Sat,  7 Mar 2026 20:50:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wAuFEaEuw447; Sat,  7 Mar 2026 20:50:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A6BF83DC4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772916646;
	bh=Eu4lU56aY2VuwhtuMZe/IElLYo5vUzsSzKS2oPLgVC4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=n63f5tAme+9YVBf/kWV1M6s9v4rEnyqDZagPFx3CHwuc6BH1RwsirrQeDN8RN5gEu
	 z/p207EcvroT6aDEHs9LLybYT6T/xhXNKArCYOxtvT2HyzPMMlkELJjbuNj9WPp1zv
	 qzdSltlQLGpoCyBj13weC+peAeb1Oh1FxBf2kAn5XSJKGnuJlESHGo+Gqfj+paY4Xs
	 R2sOvw23PAsIUEGVw7Yoss6cFnv9krXLPHv9TPpDW2xKkP2hB6Lfn+SATV0i/+Fp59
	 GKwMaxZkgAsR3OcrsWpQa/bYAMmJVfafZzBpidxPkhD1TKJSjRy6rDoiwH6BCqz3GN
	 ZeqtXoEIFcRCQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A6BF83DC4;
	Sat,  7 Mar 2026 20:50:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 58A5C158
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 20:50:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 561C740232
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 20:50:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R0p0GX-oUpgo for <buildroot@buildroot.org>;
 Sat,  7 Mar 2026 20:50:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6C04A40173
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C04A40173
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6C04A40173
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 20:50:42 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 9DDC619F59C;
 Sat,  7 Mar 2026 21:50:38 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 07 Mar 2026 21:50:38 +0100
MIME-Version: 1.0
Date: Sat, 07 Mar 2026 21:50:38 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Philipp Richter <richterphilipp.pops@gmail.com>
In-Reply-To: <20260307160600.2249410-1-bernd@kuhls.net>
References: <20260307160600.2249410-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.13
Message-ID: <19234ffc34bddd4e491c6abe5834ce9b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772916640;
 bh=HNCOpmNc3a0f8Zo7+ISCnw1U0LhGnQ6Grp4FNq+EER4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ju6QfZOJkO13KKNPRqqJNY1Yrf/Xy1js8MQK1h4Lbq9zRyMBeqwpItDiaCpNpogKg
 DzTGEo3+BkeUVnLw68tqKXFRUXfUBnqYGB2ZYM4Tkf7WkB7Qbv/UQ35mMo3oHvvgHv
 bAOdIjWvRccfBIh9E8WdNfwG+kQBJyMVahr0jh+zT9/kb2UyBljJW+ws8yN1tx8UZ9
 nV1P2IVuzgUziQ5l6N5Hp6cCTfxuMHJm7H79MCX9iHRwkw7V9OE1gaxWm5ZCcNmhoU
 rbnASTmxGxeqzGVQahNF8zp1lGXLaQvikUjrF8iw52M0UWtL+9pZu5T2n3mAZEo0Sm
 ZSPJOPHuqLN8Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ju6QfZOJ
Subject: Re: [Buildroot] [PATCH 1/1] package/libtorrent-rasterbar: bump
 version to 1.2.20
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

On 07/03/2026 17:06, Bernd Kuhls wrote:
> https://github.com/arvidn/libtorrent/releases/tag/v1.2.20
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
