Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E68C2D72371
	for <buildroot@archiver.kernel.org>; Sun, 25 Jan 2026 21:49:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF42960B00;
	Sun, 25 Jan 2026 21:49:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M9pwGu4WA6w2; Sun, 25 Jan 2026 21:49:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B9F460AAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769377746;
	bh=sw8PT//bIEQHJ90Eh1HkX7PjMBk6J4yKScEaftCOoBA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kdS+sCNE2MoaXV1picXK7F9r9NnWtKmDA+0R8qMyewpuxcsxNqlZ+n34m1WKtugj2
	 n5z318SXE/oC8l0cGxZXWwNUWvK5mDVzEFYFwMZW8bGb2rouuzV+l/unuOzOhPDCXj
	 uqtsG9+2Xl64qxa+OAvUb7/rJ/FT2AGQeMkIeVLanDyaB9jMS+K4klLPQhopVYU58Q
	 Z7TnrWR8mxbYSpfy7LSKrmFc3LhGdWQw83NGNforX1Ed3F4FGTBpV3cNFtfX1tbg9B
	 QAidAejC6vIDaFq8zAyc7A9HEwbhZPAKyQppnkjLbpjKMcngwWsjPuSvhj8cl9zsR2
	 op4W8RicSeuaA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B9F460AAA;
	Sun, 25 Jan 2026 21:49:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E29435C
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 21:49:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 23C1D60AAA
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 21:49:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NT1DaCFf7mwN for <buildroot@buildroot.org>;
 Sun, 25 Jan 2026 21:49:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1AD2D60883
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1AD2D60883
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1AD2D60883
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 21:49:03 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id C0F6A780368;
 Sun, 25 Jan 2026 22:48:58 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 25 Jan 2026 22:48:58 +0100
MIME-Version: 1.0
Date: Sun, 25 Jan 2026 22:48:58 +0100
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Christophe Priouzeau
 <christophe.priouzeau@foss.st.com>, linux-amarula@amarulasolutions.com
In-Reply-To: <20260124153803.1077707-1-dario.binacchi@amarulasolutions.com>
References: <20260124153803.1077707-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <7c506fa90f2fd5b8ec41a82bdac58ae0@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1769377742;
 bh=50qqPCHJna7OmxRCre7ekAD/0ckF6wLBaknOaFlN+b4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kaaDt5CeBf1I/uqjwpWt9q3YlzFTrDtvdV0TncArI1wHgffKgznVJpB9kSdeFuJXb
 IuX760twzF7jv8snW28AT0qhypwbZsS7toCDc4IgEsP5iLw57Q8V/xVSMqQyKSVvvl
 aV0ta1CDbqqtBaiZMMPDpxryng1f93fwOgSG3XtN+H4LS7Kv8pyThSBn08gsnbFWOp
 4+Du4lL5R3QuSHwO9OA9sZeXbsPCF7/s4mnIAHh6dRp4JtEuWW5aBUn+ewVAGgI2mu
 MnaA29SuivYHNRtDV/P4L+WdgPvazrXcARgTd0KZK97YBIg4vJhBlc6CawQya6m+1D
 emFU5HfHy2fAg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=kaaDt5Ce
Subject: Re: [Buildroot] [PATCH 1/1]
 board/stmicroelectronics/stm32f469-disco: exit post-build.sh on error
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

On 24/01/2026 16:38, Dario Binacchi wrote:
> Add 'set -eu' to ensure that command failures or unset variables are
> properly reported to the 'make' process. This prevents silent failures
> during the image generation phase.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
