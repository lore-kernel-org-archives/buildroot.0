Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9D8ECA0FED
	for <buildroot@archiver.kernel.org>; Fri,  5 Sep 2025 17:43:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB0144083E;
	Fri,  5 Sep 2025 17:43:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id prZ7m9YurwxN; Fri,  5 Sep 2025 17:43:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B236640813
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B236640813;
	Fri,  5 Sep 2025 17:43:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B5751CA
 for <buildroot@buildroot.org>; Fri,  5 Sep 2025 17:43:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9BA4261120
 for <buildroot@buildroot.org>; Fri,  5 Sep 2025 17:43:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pZ1sb50M4HEZ for <buildroot@buildroot.org>;
 Fri,  5 Sep 2025 17:43:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EDC6B610E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EDC6B610E9
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EDC6B610E9
 for <buildroot@buildroot.org>; Fri,  5 Sep 2025 17:43:09 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 8878B2003DD;
 Fri,  5 Sep 2025 19:43:06 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 05 Sep 2025 19:43:06 +0200
MIME-Version: 1.0
Date: Fri, 05 Sep 2025 19:43:06 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250905055016.76056-1-bernd@kuhls.net>
References: <20250905055016.76056-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <432761cca865b8e7feacecc3006f697f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1757094187;
 bh=9TxOno9oJANvz/alMFC/vWOd+6AnMVEjbkxF/kvSzkw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kspxBQi9mFJQK/lpMebBevqOnhpscOCnDob/f1K/Jbl4BtqAcYWvt1UNT2UzuKsAq
 bUrpo49ANodEg3niu22JV3oaF+W8dybebFZMMamQtjrmFpZcPSSVmzsF1S22CURaf4
 pe4eqVmpmJN6pW8Q8MTtuWssGIq95Ucb1reK/HvoA7XEsyLELVdjW5xvFKt9aHlCpW
 JLxGVE64ctiBToNAWUvsug3bkieRgta4JegIWrqW1AusgeTPL4yuUFv8PFq2F1DdGN
 QhYMfCJQqtvzXoT768PmMo5EQ/6mBSMr/2XmiEHEr7TsQULKU2nCb/b7hJ5Ga4H0a/
 yG+NuoRH74qow==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=kspxBQi9
Subject: Re: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 5.{4, 10,
 15}.x / 6.{1, 6, 12, 16}.x series
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

On 05/09/2025 07:50, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
