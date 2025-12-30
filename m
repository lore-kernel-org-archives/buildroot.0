Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6156BE95A8B
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 13:04:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3394581E3E;
	Tue, 30 Dec 2025 13:04:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id skPbBOpFlP8H; Tue, 30 Dec 2025 13:04:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 62F6C81DEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767099860;
	bh=2V3BSBVmFhTR07nDHVKo8ULw5ByYU3F4WT918j+ajyU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TkiigCvjh25Mp8DHTCv7so8WgrQH1xDdPukKdZ6O5XBMxxzwz8zki4nyo1glsDRmw
	 XW6v5g2qDLxkWMoGkdjqZruPI3ht4U03WBiCNBMTBgC7wNEWH9KwJKEyaejkN0eTdT
	 zPERB9nvfEy9fpi7pUKGwMY6WCv1fu/5m9ycQJABDFL+Utj16vtsK7vfiKpF2Hag9v
	 ZeEWeql+ddkDC1/wjgY6DqIqzd98/+LXsV+Fo5NFVj0GR9NskY5pcYEAFQ+WMm4z5o
	 c0PioXpVekYmbmtyMk8iQDG1MO9f58pPbOWgBmWU1HEWC5RSgQSj6sDZQRYe752ZMr
	 WS+czA2k6fNXw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 62F6C81DEC;
	Tue, 30 Dec 2025 13:04:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C6B99177
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:04:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AD4F160B3F
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:04:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RuzsVb4T9Ze3 for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 13:04:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D08BD60B92
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D08BD60B92
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D08BD60B92
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:04:17 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 01E2C4E41E82;
 Tue, 30 Dec 2025 13:04:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id CB6076072C;
 Tue, 30 Dec 2025 13:04:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8C82A113B0392; Tue, 30 Dec 2025 14:04:13 +0100 (CET)
Date: Tue, 30 Dec 2025 14:02:38 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Julien Olivain <ju.o@free.fr>, Mauro Condarelli
 <mc5686@mclink.it>
Message-ID: <20251230140238.524b34b1@windsurf>
In-Reply-To: <20251228234350.2887246-1-james.hilliard1@gmail.com>
References: <20251228234350.2887246-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767099855; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=/YwRcrUIAJbn8WwRti47ZcrAjpg+he/x+Vlhksnjon8=;
 b=kwrHaJi95DIlj1HGuVhFIJ9NwzKqqhLj54T+JwXAoVd9D0edM8+IOLFvnYx7nNXXu8HPxh
 af7X894kejSu1495zzrWtmtD7qs7X05BE2HrJt3TClGlKfRRUe6o/TW3m2+IOIf2vJC9JK
 7V5UU5GCLaz7RtNYiFpDFk+jZUagb+51yGzTFK8QMIcmt8+0OkFgkQngGveaAkUXdvSSB7
 ifBDvjbRTMMSUveApL4XtbLN2Hh6wBfyFqpdvNZPajnJz+vcHH0dY6lcyYjSbBRd8xC9ER
 pEpAfJQrrfn+3cUK4nDMr1/f82AJGWdWM1pA5W/6Z//uN+tgRZ2VYETkSF2gLQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=kwrHaJi9
Subject: Re: [Buildroot] [PATCH 1/2] package/python-base58: new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 28 Dec 2025 16:43:49 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/Config.in                        |  1 +
>  package/python-base58/Config.in          |  6 ++++++
>  package/python-base58/python-base58.hash |  5 +++++
>  package/python-base58/python-base58.mk   | 14 ++++++++++++++
>  4 files changed, 26 insertions(+)
>  create mode 100644 package/python-base58/Config.in
>  create mode 100644 package/python-base58/python-base58.hash
>  create mode 100644 package/python-base58/python-base58.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
