Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1B74CCFA13
	for <buildroot@archiver.kernel.org>; Mon, 10 Nov 2025 19:11:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87A06405AF;
	Mon, 10 Nov 2025 19:11:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7T5Hqa_Nq42H; Mon, 10 Nov 2025 19:11:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A053140489
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A053140489;
	Mon, 10 Nov 2025 19:11:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D246A25D
 for <buildroot@buildroot.org>; Mon, 10 Nov 2025 19:11:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B8DC540475
 for <buildroot@buildroot.org>; Mon, 10 Nov 2025 19:11:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YmdM6ujpWl6I for <buildroot@buildroot.org>;
 Mon, 10 Nov 2025 19:11:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 70D2340467
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70D2340467
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 70D2340467
 for <buildroot@buildroot.org>; Mon, 10 Nov 2025 19:11:11 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 8700FB0054E;
 Mon, 10 Nov 2025 20:11:07 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 10 Nov 2025 20:11:07 +0100
MIME-Version: 1.0
Date: Mon, 10 Nov 2025 20:11:07 +0100
To: Akhilesh Nema <nemaakhilesh@gmail.com>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>
In-Reply-To: <20251110094007.434279-1-nemaakhilesh@gmail.com>
References: <20251110094007.434279-1-nemaakhilesh@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <6fa11beb7664af2d25e8837426c988d3@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1762801869;
 bh=2MWDssAjSW6WVObQU+w4F7lR8Fk15IGjriZ81/atVOg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=TdtKWZJOBIEyKarwti5PbgCUmGiawdvcftoy2SUyxNN1mlWVwfWs4hl63WFUxDja7
 ZITd1Ay1c76/AUrc8UhiO1ViLHhC3M7LJKohjymrbeU9GI8119GtXt4BfRiQEyIqNd
 +KNUgMVeb+ORa+1ywak/pCWEObNdKhJ9hqVqURlDtStmAviw9HtFY0ZOqG5+uv4ZpH
 jl463SioYliw4ojXw63k1qdlCFPk7W7t+Q/IlJXnf5ekZRZ32i8jb9qx1SG8J6Foc2
 8/RwNx9qbP+U3az8uLXnZrZ0Byyn7mKZwBFUpxXra1CGYdGPFDh71TWiRRiBrKKdTM
 JcOdiIiqj55lw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=TdtKWZJO
Subject: Re: [Buildroot] [PATCH 1/1] package/pppd: Add an option to
 enable/disable CBCP support.
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

On 10/11/2025 10:40, Akhilesh Nema wrote:
> Adds BR2_PACKAGE_PPPD_CBCP option.
> https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-cbcp/.
> 
> Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
