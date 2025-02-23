Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6395C021B2
	for <buildroot@archiver.kernel.org>; Sun, 23 Feb 2025 18:20:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7BEF24065B;
	Sun, 23 Feb 2025 18:20:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XcwlKhRcXFe8; Sun, 23 Feb 2025 18:20:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5EBC04066F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5EBC04066F;
	Sun, 23 Feb 2025 18:20:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DEB01943
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 18:20:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CE250404EF
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 18:20:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ooV2EjuZwEji for <buildroot@buildroot.org>;
 Sun, 23 Feb 2025 18:20:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DA7D540531
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA7D540531
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DA7D540531
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 18:20:17 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 2CB9C6013B;
 Sun, 23 Feb 2025 19:20:12 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 23 Feb 2025 19:20:12 +0100
MIME-Version: 1.0
Date: Sun, 23 Feb 2025 19:20:12 +0100
From: Julien Olivain <ju.o@free.fr>
To: Neal Frager <neal.frager@amd.com>
Cc: buildroot@buildroot.org, thomas.petazzoni@bootlin.com
In-Reply-To: <20250218063001.4170296-1-neal.frager@amd.com>
References: <20250218063001.4170296-1-neal.frager@amd.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <68aff86cf7c895eff63c4c125159e0f8@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1740334814;
 bh=JH9frb/yEWnhffhYSxF8mvH55vUHK1XG2xTNjKJgQ9w=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ntnjWTmadQpWQVUfr4btoSMxVRBhqHVn8/IFvvIRmqWSdnbU+7QYq3ghOV3jpc+DO
 6BIB42iqnYIYF0NgqkfcpPv49hnxJ7iMDjWjMW1rE0IixlzJPySE5x5eviz+VqMU8V
 NU3w3w2tjQbsdzLhu5ujSXTAR4I+ZI4Fj7I6pfAFTueZ/0A+dOQpE98ShTxAQqPk8+
 UQpqNrAwSKnKCw7bRi/YYjr2BTRDkGqgOCm4Qt8BncQzntfY0SoznU/9Y8zRd1IaSX
 XmDA2xRCI02iX6soJWwLGBMm6ogRfHD2CljpJEIMtDZaDhrWb9d3BgPY8X3dCRKwjA
 AzzubBRVVZFkw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ntnjWTma
Subject: Re: [Buildroot] [PATCH v1 1/1] package/pkg-autotools: remove
 redundant configs
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

On 18/02/2025 07:30, Neal Frager via buildroot wrote:
> Since the following commit:
> https://github.com/buildroot/buildroot/commit/b07030a708293756e25edd6432ed02cc53ff758e
> 
> The following host configs are included with $$(HOST_CONFIGURE_OPTS)
> 	CFLAGS="$$(HOST_CFLAGS)"
> 	LDFLAGS="$$(HOST_LDFLAGS)"
> 
> As they are redundant, we can remove them from the autotools 
> infrastructure.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
