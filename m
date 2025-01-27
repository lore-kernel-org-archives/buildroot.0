Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8738FC02188
	for <buildroot@archiver.kernel.org>; Mon, 27 Jan 2025 20:26:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38556810DE;
	Mon, 27 Jan 2025 20:26:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Q8T0mRRdIuD; Mon, 27 Jan 2025 20:26:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42481810E7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42481810E7;
	Mon, 27 Jan 2025 20:26:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id AA650AF7
 for <buildroot@buildroot.org>; Mon, 27 Jan 2025 20:26:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 97B3B40400
 for <buildroot@buildroot.org>; Mon, 27 Jan 2025 20:26:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DsFd_lFbAvMW for <buildroot@buildroot.org>;
 Mon, 27 Jan 2025 20:26:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7A461403DF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A461403DF
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7A461403DF
 for <buildroot@buildroot.org>; Mon, 27 Jan 2025 20:26:18 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 3BF3913F89C;
 Mon, 27 Jan 2025 21:26:14 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:59528])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 27 Jan 2025 21:26:14 +0100
MIME-Version: 1.0
Date: Mon, 27 Jan 2025 21:26:14 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>
In-Reply-To: <20250125213432.4188106-1-james.hilliard1@gmail.com>
References: <20250125213432.4188106-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <b4c5c8e8edd91276b46195cd6976f4c5@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1738009576;
 bh=i2lq6so5aSauCR3BYgjgzBcP2j3JibmxwV/sPoSpscU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=sS/AUs6G7ZxO9Sq3TJgzj5nBNwF8JmZmOhegyCy9vOqGOBXZmvkd9tW47atQHFIYC
 MuCFIeqbO2JuTMrY9ENzvpi/2HVl1ivNKYdF+PkF7ZL+wmQa84Zsb/842oi5hR8GnU
 13omDsoAYxeOKvdQ3hlkHO5WeWIUiMwcXmGqUPzHL0EiqjCzr+LyORG6pY6erHKMh9
 2dsf+5QteOOErfZcJjzFrnN0yOFuApSiIo7hgR7G13lYplTX0weGNB/+hJnuOvXhFH
 Z/TWkIuCcamJj4FSCdWsNZkilMVybN+6cN+3GyRaVB5ADz3+iByghgjhtq0D052RN5
 lmuV1Qbs3T4YA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=sS/AUs6G
Subject: Re: [Buildroot] [PATCH 1/1] package/rust: bump to version 1.84.0
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

Hi James,

Thanks for the patch.

On 25/01/2025 22:34, James Hilliard wrote:
> Set profile to dist since we are building from a dist archive.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

It fails the tests.package.test_rust.TestRustVendoring runtime test.
See: https://gitlab.com/jolivain/buildroot/-/pipelines/1643185041

Can you have a look, please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
