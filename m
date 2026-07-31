Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17D95C54F54
	for <buildroot@archiver.kernel.org>; Fri, 31 Jul 2026 12:21:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1CC4410A9;
	Fri, 31 Jul 2026 12:21:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qsKwcallpifb; Fri, 31 Jul 2026 12:21:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 365EF41066
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785500516;
	bh=2B+ZB0GjJ/qhjmqyHpF5uT/iAuzTG+onqrkKGO74T74=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mAraOdcVnfggtZYFfwNYh0IwosiFznhaNQ86/1WZL6/jq6A3XRapa2f4lMQyI1ram
	 +FM+k4LMxrol5a0G1RtFXbDplc4PcxIl1pe7wthGNNxM2ZO5oyqtmOXPLNeKFcI3hC
	 2iCckAgaeXh/bX6DZLeuygMMPWm3nxR0Sh2PBZISbTiAOYFZ5XJqUwTzdjQOGGBrcV
	 XaDYVAFczjCg/HVmmXfWjL+6NBB60J5l5WZ+NRjbJTgv29wOba+JvWKprb/9aqrfce
	 2yAS4aP6K8l6avmrHYLNwYqIXZP+x4iiQi9id168mf4rd2t1jXs64ghRJzLArFePU3
	 zE+sR/igF5IsQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 365EF41066;
	Fri, 31 Jul 2026 12:21:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4B0802E9
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:21:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 31B0C41066
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:21:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Up0uVQqBnSnV for <buildroot@buildroot.org>;
 Fri, 31 Jul 2026 12:21:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8F40A40FF0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F40A40FF0
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8F40A40FF0
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:21:52 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-c1c4db7ca93so114787266b.2
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 05:21:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785500510; x=1786105310;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=99/sQRQn4ZP8EMbu6J9a3Pd4lDjNqC5luv5EoX7gCP8=;
 b=sBnE1wKotObgp+/dDMERhVGq5a7i4AUTJtdZWaO1YOZeGIYgSr3cNezX0E8MPnsQAX
 Dmda+nQOuoVupW1l+DtzJYj4bVNoo6pa+Q1glzll2y2HbclV7HYAnu8hSoMNi55Wbx2r
 zJcQ+9b5+CMJzbBcp/j3pCRkQIOKOzv+dE0b8k7g6D3yODhOqd78hXA9QiIQh4S8pCM8
 3msJVXZxmGjnT9wBstrw4YiR4WLQF93n4++X3tOzWkIxZYiwhTDWbePuyTJvDIaU3LMT
 ygsD41WqkA5ALygYsouelGI1ElEouMT8izrI1zAcVRxodzflZmX+WifbVkj6E0Dz5WXg
 Pa7w==
X-Forwarded-Encrypted: i=1;
 AHgh+Rrt6SDR229PAShzNgNNVls6mSXti+Ksmgf23NeHZt9SKar5WMH1HpIxw4Z1Xt69U2FONdluh3GV45M=@buildroot.org
X-Gm-Message-State: AOJu0YxnGc1H3DFjqVbOgoEjIbOdbMXzXpAqEzZ4dUzKXpZ/e0dJokuh
 6lfCFRohHC15WBHNAq298Q93LpVamrq9JFe7Pm1qIQHqOGjJ6WHkIXBX6U3Nc59zq6mLROTu0bM
 uMeU/
X-Gm-Gg: AR+sD10CUEsnThZ5qnoK1xqteDP78s/ZkhNTRabFALX9xiiOYtiU4i2O7TzttefCTcW
 LIpA2283ikZDRtKEU9M+jeUlmL47lOklBiyqAlDlyipBS5Gr5cYxXWXWSdiUkDKg5k3r+nDvfWu
 RFc5gRd6emQbaWQFsWkV1BrMNUybB8tQ2fKSxjZF9D0Zfnpot0vPvRcUiPvRePpCkHmL0IosjLO
 Nb5zjDZofYUG0zB0MqUpTqLSmfhmcEVSgUnU1blwKAXKr8Vzap2uXjyaqB2dIoTJt7HZrvIOQpi
 AVLSHFhologA+liJBZYOzrN1wA7zvtQu0SYvNHmMf06k0e/PeotJFIky0D6xvjC04pntC0Ojmo5
 GGtNL4R8YeLeThwokAzPagaWpq1PK4yxVNbnVQJhK7IG77gi8WUibwSesSfltRcHbi0FaIHxnWt
 Wg0b9VFYoUEfEy0Hmqapu9ev2LrI98ukJIUY3geNKgztCmIyRdS3ZsZK2QOjZQD49v46UN0keED
 b94p4ACaAGm7VqvTHYPEw==
X-Received: by 2002:a17:907:c0e:b0:c1f:7b9e:8400 with SMTP id
 a640c23a62f3a-c1fd21c32a0mr110536166b.30.1785500510347; 
 Fri, 31 Jul 2026 05:21:50 -0700 (PDT)
Received: from arch (213.219.161.200.adsl.dyn.edpnet.net. [213.219.161.200])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fd41d1756sm4239440f8f.4.2026.07.31.05.21.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2026 05:21:50 -0700 (PDT)
To: yann.morin@orange.com
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 31 Jul 2026 14:21:49 +0200
Message-ID: <20260731122149.155363-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <7d8b63ec3a6f67c7935cfbda74cadcb5864d8cbe.1784100678.git.yann.morin@orange.com>
References: <7d8b63ec3a6f67c7935cfbda74cadcb5864d8cbe.1784100678.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1785500510; x=1786105310; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=99/sQRQn4ZP8EMbu6J9a3Pd4lDjNqC5luv5EoX7gCP8=;
 b=aLoYW9mqeBMdaV28WGB3k88BHQ4I9DIX7MRKst2z/JvaU6qMpMdh0yuV4aoLO/JdeM
 CFdKnZtOiteqIct8rt4KrAuDZfrVOX6s1eDtefPz/waEMv5lRiQOr5U5Zns8Dz0Y6h5D
 fwty2idASyqXEqDnnYSUSZ4wXblnRjsKJ13VdVmATukDEv54vXprR+YwU8g4ZSYh3lPG
 y7nbBPu8836q1rPlCl8K/MjFncWAff6hc/h0FroTo3x6EzfBIl0aoFDmZZMx7eETtav3
 eXwb33SU6J9xa7PYQ7KzD1Rb1+E4pcOKRpNiZR4RNfSmnPx7xbkyw2Ajkm9PKOufHlTH
 WDQg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=aLoYW9mq
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: add Yann E. MORIN (Orange) for
 docker credential helpers
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>

Applied to 2026.05.x. Thanks

> ---
>  DEVELOPERS | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 1601e6b408..42418d01a2 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -3489,6 +3489,9 @@ F:	package/tpm2-pkcs11/
>  
>  N:	Yann E. MORIN <yann.morin@orange.com>
>  F:	.editorconfig
> +F:	package/amazon-ecr-credential-helper/
> +F:	package/docker-credential-acr-env/
> +F:	package/docker-credential-gcr/
>  F:	package/gpsd/
>  F:	package/mosquitto/
>  F:	package/python-humanfriendly/
> -- 
> 2.34.1
> 
> ____________________________________________________________________________________________________________
> Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
> pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
> a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
> Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.
> 
> This message and its attachments may contain confidential or privileged information that may be protected by law;
> they should not be distributed, used or copied without authorisation.
> If you have received this email in error, please notify the sender and delete this message and its attachments.
> As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
> Thank you.
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
