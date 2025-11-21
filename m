Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51D94CFC281
	for <buildroot@archiver.kernel.org>; Fri, 21 Nov 2025 22:10:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1583B84E87;
	Fri, 21 Nov 2025 22:10:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q4CKH0HXjcf5; Fri, 21 Nov 2025 22:10:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C0E584E7E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C0E584E7E;
	Fri, 21 Nov 2025 22:10:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 193F8158
 for <buildroot@buildroot.org>; Fri, 21 Nov 2025 22:10:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B6FF40FA9
 for <buildroot@buildroot.org>; Fri, 21 Nov 2025 22:10:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J85oemI1cylX for <buildroot@buildroot.org>;
 Fri, 21 Nov 2025 22:10:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 27F1440FA6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27F1440FA6
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 27F1440FA6
 for <buildroot@buildroot.org>; Fri, 21 Nov 2025 22:10:06 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 433D778035B;
 Fri, 21 Nov 2025 23:10:01 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 21 Nov 2025 23:10:01 +0100
MIME-Version: 1.0
Date: Fri, 21 Nov 2025 23:10:01 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Doug Kehn <rdkehn@gmail.com>
In-Reply-To: <20251101103530.124285-1-bernd@kuhls.net>
References: <20251101103530.124285-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <04db78efd50cedf9d137050cffef3a38@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1763763003;
 bh=rxsJTkgQUsU2zVl/lcuk3cnq+7C7Q05PK/+udfZLpeM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=o4odCVO87mYnnINmHL/SgB0zbON0Bpoumzde2y6/h2Sv5rRZS5XGHVaE+5ETDjD69
 Ob1iXdLVahHuOuwhNkIBlAgK0DhhikTuleBpOBupjBqiGcduWE+6AvJjD5cV2Dhdzh
 idUZjkCqhLI/6STTnmOAPogm0bGexi6Q8svF/se5X52ViPdH3RGpooIN+2w9Z/lFg1
 +HayzNpAM1i9GntwqxOM9s//1E48S9RqJlrERf82ZEzcErzCLsEP1eCU0KzR4Q37P8
 3WOc6cnWriuCl3qgJ8QOGra7loMuoRUsh+QFgwyVG60dRHtvRNozPK3FOVzOz0GewF
 +oxoncR/EER8w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=o4odCVO8
Subject: Re: [Buildroot] [PATCH 1/1] package/nss-pam-ldapd: fix build with
 gcc >= 15.x
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

On 01/11/2025 11:35, Bernd Kuhls wrote:
> Fixes:
> https://autobuild.buildroot.net/results/c30/c30b29723a2f3db6fed5ad0bf0e06c126a857953/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
