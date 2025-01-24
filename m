Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89F61C02181
	for <buildroot@archiver.kernel.org>; Fri, 24 Jan 2025 21:45:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DF2D606C1;
	Fri, 24 Jan 2025 21:45:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o9ZqXeSqzlF4; Fri, 24 Jan 2025 21:45:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4419F607D3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4419F607D3;
	Fri, 24 Jan 2025 21:45:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CFF82941
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 21:45:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AFCBD607D3
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 21:45:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lPvSx9vvLJXv for <buildroot@buildroot.org>;
 Fri, 24 Jan 2025 21:45:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 868A0606C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 868A0606C1
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 868A0606C1
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 21:45:17 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-385df53e559so1930099f8f.3
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 13:45:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737755115; x=1738359915;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CzH74z4gWAKM1cLVPJMgX112qmia76WDvjRtxETR9xU=;
 b=ErUVHZcxZGllnV99OeFPNewsdeolZs/IYI05BUpxRRANPwo27GxSs4zSkkc8EdIAL5
 Ky8doWWIos4IjULvYIQjaexfQLTn9XmSA27h2Yl4MYkozEqtttWlpHGoq5tPSlsdL3zC
 52b/SNECn7zpNHR3pFxsh640OZtOkGF6BWpd2+hu34QpgYMP5QjKLCqTgEeslR52Zr9N
 A13VbGrmcfO/GPiQ95/U+8QyuhOx9plhss49uuvzbDb5AESvc/4zl6F6EVNfoM8TixJD
 AmO+WWkOAB9byR5IVwYU7hONIsIsIMyBQLfVwi2W3kk2+owBnmQ271JLosyBNuZ4xky5
 a2tg==
X-Gm-Message-State: AOJu0Yxau0iDk2+ttZ+dRmbyCSEi9/da4Og1j3x9REkdkTk1ojgwo6O9
 +n5ecY1zov4o/KGb6KDI59rOZhMgRMJxDXK1Pdie8YVaCaZLtTkXtGIQUern
X-Gm-Gg: ASbGncszpwrIC4VnRq75DI0yqoVUBL50M11lHivtWMU58k3DGA+LGRsN2PEgC7nWeUA
 6iHUYYwaJEVxeeaL/z6KQKU8hpb/vBBNl0ZA8TK5oLCGvTvNNZ1Eov2XDHKmOMRg55n9m4V6OuK
 7kk9A7NHYEKEVafXFhq0MwILCn7319hQyIQ9p+yalo6xaAJCzRXnaNXUX7x1ge8FvZdzcDA3cH/
 KneFp8VMZz9lIqSSf9uHpzbkk7Nam9cxc338qvD7/hphSPcl72b5Pq9eCVWqmcpZWQi86sKNTFj
 umeI6q3cTg==
X-Google-Smtp-Source: AGHT+IGu7SMtCFEqR0jJk7/+J92+YFFNUUw06a4/xvYLwDYVO4zcT5JSbbTVhC/Oym8tfOMqNQI/Kg==
X-Received: by 2002:a05:6000:1aca:b0:385:fb8d:8658 with SMTP id
 ffacd0b85a97d-38bf57b7fbdmr33613618f8f.40.1737755115262; 
 Fri, 24 Jan 2025 13:45:15 -0800 (PST)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a1764c8sm3750113f8f.3.2025.01.24.13.45.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 13:45:14 -0800 (PST)
Date: Fri, 24 Jan 2025 22:45:12 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: Akhilesh Nema <nemaakhilesh@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <20250124214512.GA224910@pevik>
References: <20250121074217.18241-1-nemaakhilesh@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250121074217.18241-1-nemaakhilesh@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737755115; x=1738359915; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CzH74z4gWAKM1cLVPJMgX112qmia76WDvjRtxETR9xU=;
 b=X2rp1fvyl+rVF43ITkWVEvy2swnBXARzeaLUtg2kFwVBEc/31da0meiM7OaGpX7pJD
 j4Nw+rC8Y6WozfmvlnPqBYliBNUoM/dYmWZCKZS7T3Elt4tnx9dMW8ppo1iEpgydmu0K
 zi2TRay2eqc/83XPg5rpOIh9NIcvlvN6vnSCl76+6yPMbuM7JUZRby68Nxq3JuLRGhIX
 lnOjhEFDngkx4UXLoH/wZO/Q4Qa7hcfYvIU0xJs1EBSOvLttwzJIfYySWXTGhCN/c3k+
 xHmiKaMhTVV2YmuHWS/kgaUhti4ZWCEXReORSUtSrN2iMBMHOgLEAWW7JNng/fEJGypg
 IpiQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=X2rp1fvy
Subject: Re: [Buildroot] [PATCH 1/1] package/iproute2: bump to version 6.13.0
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

Hi Akhilesh,

> Changelog - https://github.com/iproute2/iproute2/compare/v6.12.0...v6.13.0

> Drop 0001-Fix-implicit-declaration-of-function-htobe64-in-gcc-.patch
> Upstream commit - https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/commit/?id=c8b3ecc22ed0edaf0259eaf7d1a5c04f300ad6e4

> Drop 0002-Fix-implicit-declaration-of-function-basename-in-gcc.patch
> Upstream commit - https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/commit/?id=fa3949b792e275f75d7d6200dc2036ef7fff8816

> Fixes:
> https://autobuild.buildroot.org/?reason=iproute2-6.12.0

Thanks for update and noting the fix! I managed during the week only to found
fixing commit included in the update.

Feel free to add yourself to DEVELOPERS.

Kind regards,
Petr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
