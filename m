Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE1FDC3DA49
	for <buildroot@archiver.kernel.org>; Thu, 25 Jul 2024 10:21:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F0A74046D;
	Thu, 25 Jul 2024 10:21:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CsxM1RMF-vzT; Thu, 25 Jul 2024 10:21:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C8CA4058F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C8CA4058F;
	Thu, 25 Jul 2024 10:21:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EC3081BF422
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 10:21:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA7DB40576
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 10:21:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id shNUbQslgcJq for <buildroot@lists.busybox.net>;
 Thu, 25 Jul 2024 10:21:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::232; helo=mail-lj1-x232.google.com;
 envelope-from=gael.portay@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BBAFC4022B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BBAFC4022B
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BBAFC4022B
 for <buildroot@buildroot.org>; Thu, 25 Jul 2024 10:21:37 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2f035ae1083so9275471fa.3
 for <buildroot@buildroot.org>; Thu, 25 Jul 2024 03:21:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721902895; x=1722507695;
 h=in-reply-to:references:cc:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=nXKU0oLlYUtkS6EIHqNDHbajEqwzVqGaAydoiHmkcnM=;
 b=epGDiiIxLsewwVfucoGJk/PHQduXi9E39Rt0Hm4V4IECRMu8c+0WF3F7PfpJJyvk57
 p7csh6sXHlF7XAyek4hn3DkW3BndpkmB4JIliwzeS1J0WNX978AyBr63T5vpIlw+Gt1c
 VXl+WFYZ17Pa2uNukKl6Tb04MJaIPVdyw8wMBRHRfDW+K6cuvTUxITCOeBwRQg7RofcE
 VQfQe4qIJrevhIA3UMXNdmZKItav1izEv7IOYp7ZBmy/6X8C8in/vTGC1lw2sgzEyUwL
 HEESuFrmwjiht+79R4MdnyA+VvvT7Jr0iGyCiWn/NJ7fd/PK5wcJML/BSYlOd8LabcH4
 nvJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJauEwdi+CZAQ/WRz4vAQGUvCGlh2UUmSWQxwNsUv9YlPrVSVmW0o2Ek+kpv+CYvmJCGjijFo+iI8Ms1V8gl7K3vglP2nxMQ==
X-Gm-Message-State: AOJu0YwfV267wRSR34xjrcZHyF38nVYe0L5fow1jsGkO3qilfxgektPE
 tDVVgnlPy4u8iNptJ8nKogjqizRG8Y0iK6iZMa30IdCHzoNG/TkW
X-Google-Smtp-Source: AGHT+IFxMHk63SByoIXNcLJngJ73w5dEDdNAdtOEo66ASHdXq/y5r9Yl0HN+UgS/qbN6XUjOJKU4hQ==
X-Received: by 2002:a2e:b5b7:0:b0:2ef:32b9:85f6 with SMTP id
 38308e7fff4ca-2f03db9028bmr9508541fa.11.1721902894997; 
 Thu, 25 Jul 2024 03:21:34 -0700 (PDT)
Received: from localhost ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4280573e944sm28466935e9.13.2024.07.25.03.21.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jul 2024 03:21:34 -0700 (PDT)
Mime-Version: 1.0
Date: Thu, 25 Jul 2024 12:21:34 +0200
Message-Id: <D2YJMT8SLXRT.3MX6TCQOY1W7U@gmail.com>
From: =?utf-8?q?Ga=C3=ABl_PORTAY?= <gael.portay@gmail.com>
To: "Waldemar Brodkorb" <wbx@openadk.org>
X-Mailer: aerc 0.18.1-0-gaa8319bc591f
References: <20240723212011.23048-1-gael.portay@rtone.fr>
 <20240723212011.23048-2-gael.portay@rtone.fr>
 <20240724182122.6a1f75ee@windsurf> <D2YGQXWLNLWG.2S6K4TCJ7EDN6@gmail.com>
 <20240725101027.77f7b4e4@windsurf> <D2YITL40TOEJ.98932ZGHH1A9@gmail.com>
 <ZqIjh9iw1hgT8D/D@waldemar-brodkorb.de>
In-Reply-To: <ZqIjh9iw1hgT8D/D@waldemar-brodkorb.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721902895; x=1722507695; darn=buildroot.org;
 h=in-reply-to:references:cc:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nXKU0oLlYUtkS6EIHqNDHbajEqwzVqGaAydoiHmkcnM=;
 b=TK0z2eDFlwFyJ3c+06TAcDmgJ6Lxg0c8DRNZ6qTJTw+QhNwc86AN6LlnAe/NnImQz7
 yd7BP9R8mPTkqKvqQGw4QnyFQ97VoNPEOff2lsO0mXFH+HOhBTHBj4U8AiItKRYlsqC+
 20gX176hXg3nEcNYqdHEQg95egMsb8eEu7ttsoKNcGUrOdZ+BNPrD9tCmblFv8/Wugge
 DfPScV/sozGNFQN+F/IP25c8qt2UALmjTBdimfVcUwSe++Zw/zYxJRjkq770RntJKrPC
 C4O/1QlT4lQ4/qIP4lNUsigHBSjGwM5n+H8Ypksc5hhcRF/lbfkNEaqzYCNpN4hkE1I9
 VdbQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=TK0z2eDF
Subject: Re: [Buildroot] [PATCH 1/2] package/rpi-utils: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: =?utf-8?q?Ga=C3=ABl_PORTAY?= <gael.portay@rtone.fr>,
 Samuel Martin <s.martin49@gmail.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Waldemar,

On Thu Jul 25, 2024 at 12:05 PM CEST, Waldemar Brodkorb wrote:
> reallocarray was added in uClibc-ng 1.0.47. uClibc-ng 1.0.48 is in
> Buildroot 2024.05.1. 
> @Thomas: Would it be possible to rebuild bootlin toolchains?
>

Oh cool, I have (just) resent a version with the filtering on uclibc. I
will remove it in v3.

Thanks!
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
