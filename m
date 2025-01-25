Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82307C0218C
	for <buildroot@archiver.kernel.org>; Sat, 25 Jan 2025 12:23:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42FB781747;
	Sat, 25 Jan 2025 12:23:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SQb863y6hsTt; Sat, 25 Jan 2025 12:23:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51AF8816E9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51AF8816E9;
	Sat, 25 Jan 2025 12:23:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A39911183
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 12:23:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 914AA40BBD
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 12:23:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l1T4K0ncsSEe for <buildroot@buildroot.org>;
 Sat, 25 Jan 2025 12:23:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 055D040B0C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 055D040B0C
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 055D040B0C
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 12:23:34 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 1CDE25FFBA;
 Sat, 25 Jan 2025 13:23:30 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:34572])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 25 Jan 2025 13:23:30 +0100
MIME-Version: 1.0
Date: Sat, 25 Jan 2025 13:23:30 +0100
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250125081217.13606-1-bernd@kuhls.net>
References: <20250125081217.13606-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.9
Message-ID: <a29d7d18c0804ac74c87c135c0bf9c89@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737807811;
 bh=SQrgHqgf83UPCUDIey8Yxl50cWqgufW8dFRid2XLMBc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=KHfjuDuXt/Ga4/Y55rST4yS1AMgwGGineLuU4R1VbxQamWJLQtfrWPk3+pBHKMGiu
 AJjSgnQZs1bX8tj0sJTVrjvD3m8lGarWYWoGizKTd4JE0gBvgiIajdV7o4EuBL6u8O
 Lw6oBEExTou9tknj7WY6Jnj6y36FxUF7RGL5aYJW1CE83MghRuH+t39SKrdP8NCuXZ
 Pc36KJfHHGBvslA1EaXp4blI+5BopQZFq6CJuXM48kDCPj1VIgvZJPiMWopKhxrUqk
 sOauf5Q42fRXbGDQF+96yqu0YCaicZ5NuZzAytOAUeA/9yBbRNcxNvoQETPC9intuu
 eXgddQxtziGKw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=KHfjuDuX
Subject: Re: [Buildroot] [PATCH] package/apache: bump version to 2.4.63
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

On 25/01/2025 09:12, Bernd Kuhls wrote:
> Changelog: https://downloads.apache.org/httpd/CHANGES_2.4.63
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
