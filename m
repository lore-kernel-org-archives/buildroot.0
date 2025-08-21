Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21E0FCA0EEB
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 22:44:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D394540587;
	Thu, 21 Aug 2025 22:44:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ghmz1z0Rdnix; Thu, 21 Aug 2025 22:44:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1448040583
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1448040583;
	Thu, 21 Aug 2025 22:44:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8EC411C8
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 22:44:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 75B5C40582
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 22:44:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UTOsQ7QUSTtd for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 22:44:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8A88040585
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A88040585
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8A88040585
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 22:44:54 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 75DF519F59C;
 Fri, 22 Aug 2025 00:44:50 +0200 (CEST)
Received: from [207.164.135.99:38734] via [207.164.135.99] by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 22 Aug 2025 00:44:50 +0200
MIME-Version: 1.0
Date: Fri, 22 Aug 2025 00:44:50 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
In-Reply-To: <20250819074737.3285946-1-thomas.petazzoni@bootlin.com>
References: <20250819074737.3285946-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <b3bbf7d9e840135a52a346ae402ed294@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1755816292;
 bh=sVj46PxMR3SEorL8ZPlDcbS+G/anKrq/C3qst/T3svo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tSFpA6KMApfPjL78HJdblhncz8+xSVWTbGDzvTkXzXqLcGTmYYdAewtll1eDSfjU1
 UyII8mXwTAvWcuSD2oyWrSTCQuR/MblB9NnO+H6836yTCRJMbJrSAenrvqaamG3goM
 7tm51POPyJNETJx5iUapcVS+2GfTpa3TKpwjz0Ge4gdnK8PaEJVj6rmZ0p9I+VHEOt
 sb7rQrtO+ZxSKKvKQvgM963XNeBdqb/C4XdUTN03c22KMCLcYQzH4xO/lepxDkyYwl
 ACkxVLTMtiO+U5KNrssNKBb+jRrbXd5bz2lLd4/JgNCfToP+scXru8UkItnmbsow77
 H3ZlqoGwKmvVw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=tSFpA6KM
Subject: Re: [Buildroot] [PATCH] configs/ci20: U-Boot needs host-openssl
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

On 19/08/2025 09:47, Thomas Petazzoni via buildroot wrote:
> Very likely since the bump of U-Boot from 2020.07 to 2024.01 in commit
> dedb7dc6d6543d5ce16ac73f927e0a33806075e1, U-Boot needs host-openssl,
> so let's add the necessary dependency.
> 
> With this change ci20_defconfig builds again:
> 
>   https://gitlab.com/tpetazzoni/buildroot/-/jobs/11054480107
> 
> Fixes:
> 
>   https://gitlab.com/buildroot.org/buildroot/-/jobs/11012273114
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
