Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C2E0E7719C
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 17:57:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16F0B80893;
	Sat, 11 Jan 2025 17:57:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6RLeUdcojW-N; Sat, 11 Jan 2025 17:57:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 331CF808A9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 331CF808A9;
	Sat, 11 Jan 2025 17:57:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 18EBE940
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 17:57:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ED6FF410EC
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 17:57:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rbSHvKEahpdG for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 17:57:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F2CA1410CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2CA1410CA
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F2CA1410CA
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 17:57:29 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 1B5395FFAA;
 Sat, 11 Jan 2025 18:57:27 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:32830])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 11 Jan 2025 18:57:27 +0100
MIME-Version: 1.0
Date: Sat, 11 Jan 2025 18:57:27 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250111154210.2852396-1-james.hilliard1@gmail.com>
References: <20250111154210.2852396-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <79c99da26742d04355ed73e719b3cb0c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736618248;
 bh=wZCDwm3zxS2Jg57CnHQBhmujN9TwI5Y+RvkV0oQobqc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=h4lqhCNqdMWLqIf8KiE0cKkF9GwxxyftEFsIiksEOQ6TaAr3gnqrvaCQvJbuMaE80
 IkyPwMM6mVJgphi3r/fCagTWZ2FmeEM9aT0YcwSrNM7iO22mww2/UsoTRtxzNrprMI
 bFMLSCOUJhSE2iSzR7KIP8Q+OVWp+X0/6F1D2/vT7p3yfjpGqbC+jRf/LHCtgNLgj2
 jrURyziqJTDdes2GeVlC23738+PpX8J5yp2oZ4IjmU6VCSH6Fdqe3lqP0TSkp6ZbWs
 RxADuH+SJ7c2E0lFQcnAEy9v6vjsLj0pxG/07nMxx1cjYcpgVwyNxZBcn7gK49UjJP
 SsDiKOux1wABA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=h4lqhCNq
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pydantic: bump to
 version 2.10.5
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

On 11/01/2025 16:42, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
