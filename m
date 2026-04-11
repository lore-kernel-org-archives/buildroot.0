Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24F74F36BA5
	for <buildroot@archiver.kernel.org>; Sat, 11 Apr 2026 07:31:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FE1A41E55;
	Sat, 11 Apr 2026 07:31:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GVvmyAhjRYqw; Sat, 11 Apr 2026 07:31:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A230941E23
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775892677;
	bh=9f4f0OxpiqkWQQMWtB1hPRuKiUIEJvQVlihmSZkzIdg=;
	h=Date:From:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Reply-To:From;
	b=FEZ3xEQENp/7oaq2WjOqwXF0wIrETrAbC5PryRIn4fra1x0/CwLb+UWg4o75aLjhE
	 1iL7V7rThJ2X+qWbdoxmJefsXO1qgIEEspVFKaTSNnr0MWHnsEiJsfi+aETklZT4YO
	 jsuDmtkuhurhGc4s4wEx3MAGEVjUelE4I4mtIMdSQgokVV1RyfFdXWeJCVMc3/g66m
	 rnqQpMKjuzsw4pJDm6oPopell9xcf1LgkcfEsJl0vKWUJR/qSORTnvQgza5SP2BeGG
	 z5VsmSeAjy22H9NP6lHLj39HmkS1WOpeLAUKTG8cOlODbOqNt+jgFGtatcMrPFWjBZ
	 vwGOirNFcr/UA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A230941E23;
	Sat, 11 Apr 2026 07:31:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7631A237
 for <buildroot@buildroot.org>; Sat, 11 Apr 2026 07:31:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5C5D061154
 for <buildroot@buildroot.org>; Sat, 11 Apr 2026 07:31:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eUApXZwlJp2y for <buildroot@buildroot.org>;
 Sat, 11 Apr 2026 07:31:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7545F6111D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7545F6111D
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7545F6111D
 for <buildroot@buildroot.org>; Sat, 11 Apr 2026 07:31:15 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-488971db0fdso27318495e9.0
 for <buildroot@buildroot.org>; Sat, 11 Apr 2026 00:31:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775892673; x=1776497473;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=veGvPfJY89iyfTIvVoFTESkkbBspPTeNtgJRrqA8tlI=;
 b=Qu7BzTOi/i6QmnXAQP3XlVgDmnA8UeCfBCP+Z+EIIZSWVgn8H5rk4mMC7ONOh8aDKF
 glsKsXXwxsDNEWfOUeDvYAguxEc68Gukxy49D0AFfFM9cl3UHMYhjlPxFQTVpE7VNG4c
 RAnvpZsdXP4q9PFfL0Vl+s1YvcCHUb/lIl0etqjhznXQLp571APXl5RgUJGDCelbwtxE
 5zXw51w9VQMKljSGLXxq16Dx9HGg263F70q/RUfC7tsrIOM0lTzsZmfLO//JRIK4mSGU
 6mw2kvXvR/5k3wd2XtQDR8bm1NSypQJZ9yPptgIYLEifcNRdim2qdvZf5QLimJBt8NnX
 17rg==
X-Gm-Message-State: AOJu0YwnCG/W8zTK39SW8idU5ofdE34AERmYPkOj3/G1Uw15sEe4c10r
 PaKYdnpZ+atQhR1ZlrlC2SWV3OosnD16fWfnCwpEsziYg9flRO7LbeklCOd1IA==
X-Gm-Gg: AeBDiesAoQfQn5OGZUACeF5JxKGDQjMAF/TxE/F8qCKR3ZvsQt/Kxn/ipz4fMjiraA5
 lkMJQlaJHcsjbBRNVjgqrrmunkcPHzDQUO4bubcxBTP0B/4Fhv+TFdhDDWqSGpBaZcpumfsi1M4
 Tw3kJKwWduPAZ0SoSep8OnFYiLKs7bGQLLsbsKJC0BIYmG8bEUBlDLb+yxNfY0suWMrRviIdz8V
 j6XoUTJST8WxXb5gLZq62PJfxHmUMj8X2jaT+FKZlleJcyAtyoRS5CzUMv0THWoxbNV0L+4BAWQ
 Lk3kPCmMHFkWhMpA4fYsiP+rvCIeYEAqGPBc9aQlZJDNsUYXDcpjLJMWGboCHCMyqaqmTMuO0jG
 jTx5kIOmO+9gA3lwk49Wdt2Evc2BAqVQQXmI3c25VKpfBQJp2srWU6C4OU4QKzVq2pH3jJyFKuP
 znVQ5E04/knWc5/Nb9lGjZLUU/GvWDR6rysU/aUEVt7y+CAng2B/AZEYZZLMKxm2egqoZVsmk5R
 RaX9g==
X-Received: by 2002:a05:600c:45c9:b0:488:869c:edaa with SMTP id
 5b1f17b1804b1-488d67e269amr75630605e9.7.1775892673291; 
 Sat, 11 Apr 2026 00:31:13 -0700 (PDT)
Received: from pevik (cst-prg-2-237.cust.vodafone.cz. [46.135.2.237])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488d5cfd7d4sm56885585e9.0.2026.04.11.00.31.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Apr 2026 00:31:12 -0700 (PDT)
Date: Sat, 11 Apr 2026 09:31:10 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20260411073110.GB179902@pevik>
References: <20260408193359.4047938-1-giulio.benetti@benettiengineering.com>
 <20260408193359.4047938-2-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260408193359.4047938-2-giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1775892673; x=1776497473; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=veGvPfJY89iyfTIvVoFTESkkbBspPTeNtgJRrqA8tlI=;
 b=SsT8KPMBDn10hHvookC/hVGYC0RxfgaB6/gxBwJJYKdBS0U6S1vht9Q1fOrAiAQzZY
 IIJJ/A49Lf4kUhKdNNqAewqghQ59mpb4ppkGt9ElltKdFiwLePvoCGMI4RNbrr3vYDKk
 4TiCt7GjgTnMBc1Lixl+3H9uJHIFzyMFdU3itohnFfmar/4Nq2fqmZqF1XHXDveUz8Fk
 IS77DdC2PGmQC7mamJsqSAhOL8dRo4vAuMkwkLdHBk8HgioBc3yKjQAN0/Lt+h1ftSrH
 1nYUKrolt8ZYgFz6pWUvmHZH6TWgxVPb+twIq4/ETEOyLdvRXfPSmqM0X1+jslCmBPol
 Pvmw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=SsT8KPMB
Subject: Re: [Buildroot] [PATCH v2 2/2] package/nfs-utils: bump version to
 2.9.1
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Giulio,

Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

Kind regards,
Petr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
