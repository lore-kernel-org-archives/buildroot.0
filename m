Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBEA7C83F05
	for <buildroot@archiver.kernel.org>; Sun,  6 Jul 2025 16:31:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9935881E96;
	Sun,  6 Jul 2025 16:31:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KWE0nEJV2rXr; Sun,  6 Jul 2025 16:31:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D47F282026
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D47F282026;
	Sun,  6 Jul 2025 16:31:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AFE6019C
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 16:31:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9658C40AFB
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 16:31:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gi5cW87FgxVT for <buildroot@buildroot.org>;
 Sun,  6 Jul 2025 16:31:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 34C3540884
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34C3540884
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 34C3540884
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 16:31:17 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 562012003C1;
 Sun,  6 Jul 2025 18:31:13 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 06 Jul 2025 18:31:13 +0200
MIME-Version: 1.0
Date: Sun, 06 Jul 2025 18:31:13 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250706151706.2547241-1-bernd@kuhls.net>
References: <20250706151706.2547241-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <bf8ad7b498801d4b2c505d99b71c2960@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1751819474;
 bh=7eAd6+wsUf+hJFkYXeFHawBdWQuUsaxjZpfifpmwqoU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Fkyw9O7RA+nuz8k+gZPL54I353pX78lQWjqZtYJyxETUfVTFLhmlaUelaNT1dwLOY
 hGaqnJ1BpPy0rDLb6do+jRCUlRj7+qxSuG7tm5uuo8EXATKgr5nd0adBpt6DMAyWMB
 fpDTKmfaeywT5bBIHLHbmA7gw1PyifNe6Ozn0Oj7LEznFPSu7pIP8EIh7S5RfyP9hj
 R0LABIvJn2KEs1J962jRNOZowGBfo1EUNwnnv0Fepxk9pAdUTldPwuUlHsDFKe3Zqp
 5AVkx6WjOKTCs6auNTuFLmKqY5OWFvN29Wy2DI/jzpvRKPPDEHK5XjI2J/T2mNTvD+
 ZGtuKK/3PxyjA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Fkyw9O7R
Subject: Re: [Buildroot] [PATCH 1/1] package/stellarium: bump version to 25.2
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

On 06/07/2025 17:17, Bernd Kuhls wrote:
> Release notes:
> https://stellarium.org/release/2025/06/22/stellarium-25.2.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
