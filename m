Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9931EC8303D
	for <buildroot@archiver.kernel.org>; Fri,  4 Jul 2025 20:02:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56E4D83FF3;
	Fri,  4 Jul 2025 20:02:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T-a3cdZCAcuG; Fri,  4 Jul 2025 20:02:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 92F6F84033
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92F6F84033;
	Fri,  4 Jul 2025 20:02:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B026812E
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 20:02:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ACF18408FA
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 20:02:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EUa1lSWRHqkq for <buildroot@buildroot.org>;
 Fri,  4 Jul 2025 20:02:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 042DD40090
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 042DD40090
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 042DD40090
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 20:02:06 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 2165F780372;
 Fri,  4 Jul 2025 22:02:03 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 04 Jul 2025 22:02:03 +0200
MIME-Version: 1.0
Date: Fri, 04 Jul 2025 22:02:03 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250704165349.3674427-1-bernd@kuhls.net>
References: <20250704165349.3674427-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <3109e4e5d74733ae6335d57fc06fc919@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1751659325;
 bh=qgarjbaaIWiiBgdKGsqWoT45IOrdkb0OslAOtQXaLA4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XdSm7pqUr8V+sRTBZRbl50o0bpFwWyB6EAXhR1nusISR1IdnQTNAQNXs4wq9ZMeXM
 v+WwUlAb00F8xLfrtL18CYH8SgvRG8xOquiV9rUmb8JjjkOcWiAfq86wHa4eZv8qwF
 ItNLzol3f0D8E7pU5ts5gBP59dKiL5DT1uUWoN7wKpxqVoPOKPwvrcsGdQuq3OK3sE
 WmGyWKS+sANdAQOhT93+r879g/jST8vTqKTiuykdBfSMNUvLfMBhRrAx0A12NBYWVV
 VTvFDRQ0oiHWzeFjl35I+aH/T3aE2VJafut30/HQLteN0tQfaZWmzr2KnGI1mB6y37
 YHXHfoVoyB+pQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=XdSm7pqU
Subject: Re: [Buildroot] [PATCH 1/1] package/hwdata: bump version to 0.397
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

On 04/07/2025 18:53, Bernd Kuhls wrote:
> Release notes: https://github.com/vcrhonek/hwdata/releases
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
