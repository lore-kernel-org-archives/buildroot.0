Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B1E0FEA83B
	for <buildroot@archiver.kernel.org>; Wed, 25 Mar 2026 10:19:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5816C410CB;
	Wed, 25 Mar 2026 10:19:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xqNaQq6RRuMN; Wed, 25 Mar 2026 10:19:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88B3940CD1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774433949;
	bh=BIKRpN71t1k3/df+/DcRXeUVsyVhND1O+Mzp+IDi1eg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jV/ZrvggdsxTj4OG/SvZV3upuv0FbJN0rVmbQpeaozZ+hJL6cIVyRSmpxrwew6aIT
	 Tobl2QDoQ5xwV59fNLgGx+ub25tqy91UGNtvVQuF+EjOUoCZp6P5U9tt3pwEyjjHxQ
	 Buzyzmc14FaW3kwWSjPWa6UMciayFxJku4iCeGNijnzDFlIEi5G9IU4FLp8L9Wfuat
	 lVCWsczuMEl3SpWe3lyw3e7c0/TUzYXcmEMjmAR9QIzV3JRxIAdjinehYuwMjySj4x
	 A3oWxWpeSHXkuot/UDbe1OHGnlKBDgRO4LC/krF9twm01UFogHWjMMz5D9MfvkOosX
	 r0DPn5sOBAhGg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88B3940CD1;
	Wed, 25 Mar 2026 10:19:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3630C1D3
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 10:19:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1BD6E40340
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 10:19:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 55koT7FgjBuJ for <buildroot@buildroot.org>;
 Wed, 25 Mar 2026 10:19:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4833140088
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4833140088
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4833140088
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 10:19:07 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-439cd6b09f8so4579206f8f.3
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 03:19:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774433945; x=1775038745;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ajHPSTuFu7TWzPY0KkT3DYz6lXh+hq2nrgPrJMD/07k=;
 b=kZ9Dq/V0EJSSZzAjaXNhy+R0txez2Dh/jeRvNf8a44Goqj1h3xKUdmzwoyxfHMFBtY
 5x6dpPfUWcnL6TzZaQjC153Ckk1MC8PS/93AHvh29O/ALmV+9HjTESCjOlFO3uV7cI54
 PFoKE/D7x/v6heWNB2Ho0Bg3RO1kDgkRskry5TqLWa2R5CDiZaIXCFLwKiAakm4kNyDu
 JGD3G7fbTzxjFAvh/7n8MXEvPlgb5rp9wcUGGSttKxvD51lV8bW8Fhr4AdQ79mi0vtiu
 +i2wz01QOhIux3ciTxAkxev34h1ki9abZl62jfI4sglC7O+Kqv8DsAGBDX1WQFPT3Boj
 wIjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2PcJG1TFgKmqNwRBj8Jwssqzh0H2Ndkc2qSenR/m62WqzUmbVvIGlqLxnZA4bqA5L3IrPW3nj22Y=@buildroot.org
X-Gm-Message-State: AOJu0Ywu+ivluRuKJP0ZpTzA/5Gmq+0XwqwQCbNlcLwiN0cOE+6aZSPr
 kAsFfj3CmKT9w0BfOijh60yhBHHhCxs7hDWX8OBYENXUr23XUnhZr8RK/LmXMAs/ZA5GI3nprvw
 OONWIeI8=
X-Gm-Gg: ATEYQzxUhvcxRO5TuDi1KR/+/e8LRXxzC57jgnIa7+cfz+Bvy1UCwQ7XvnGwpl7vRd3
 i+DOSxbPeO6p7FWglE7xxUfW4BhCz7rxw8sWfSCX4LaBuqPBc8XMwAlQDxK7t26tgi0P03Mpcpm
 ha81xKtFxRmmHMBaS+DY73blUDwCalw3B8LY7KoP+PlYT3ftoAmLtEeMO/32Peu0DQeVJx6GGJ/
 GhHtKIOVuw2wv5Vgq25IiI2H/B/YBrAMO/dzS1K2MMYqLk79Nda/NRvlYZ+l0N/6LXcgJKihGNL
 1lKXGDeks80QDe+n4QUqgwer5ohQJcv8t9L5pACDw3jNiAmYvxGSiuYAWI+aZaTChGhbrdFpcv+
 zJRLVYPVciRjtkc7aBTqdLYlHKzCExC5Hobzq0Fy5XM71Rq7c/ARg5AH9+tX2O1EOwxF0VRJDTi
 AZVD+EWtNMp5q4L1vF
X-Received: by 2002:a5d:634a:0:b0:43b:8ee9:165f with SMTP id
 ffacd0b85a97d-43b8ee91723mr1188468f8f.53.1774433945066; 
 Wed, 25 Mar 2026 03:19:05 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b8a106339sm5700448f8f.36.2026.03.25.03.19.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Mar 2026 03:19:04 -0700 (PDT)
To: Julien Olivain <ju.o@free.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Wed, 25 Mar 2026 11:19:04 +0100
Message-ID: <20260325101904.79397-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <70855a978c2bf9c568f6bc6cdb033c3b@free.fr>
References: <70855a978c2bf9c568f6bc6cdb033c3b@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1774433945; x=1775038745; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ajHPSTuFu7TWzPY0KkT3DYz6lXh+hq2nrgPrJMD/07k=;
 b=KRlj7WiEE1wAxVLFsD6vAEZ9yRLIFyLA01JdfJuna8dxaptSj5Mb51LDysIbdgwG/m
 b0Rzy3LJhUjcyKz4Ia3cvMz0e2M11KLL8j4E851pLdBCmR8AdlQNYmFtPeFo148XMx5E
 tfd4ywa98arhNG5EwAj/0qlVKXfqX+KQtfHeCbKen9llSmYpsmpmXbgaHeAXVzSMVZFL
 OnJ6XwGcSkSzV2P9u3ppsVBs4iv3GDyCzCq/y8XaNkYj2x58pi/NGXlLLZj/eF6TBrvv
 eG+KcIkYoox6Rb3K7dWeDZL2RR4vJkA3R9yPOkH9p49s4m78aKHwqX+WStX8Fy2O+xoB
 pfNg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=KRlj7WiE
Subject: Re: [Buildroot] [PATCH 1/6] website/sponsors.html: remove sense
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

Hi Julien,

> Instead of removing the sponsor, could you instead move it
> to the "Past Sponsors" section, and add the mention it was
> a LTS sponsor?

Thanks for the comment, I moved 'Sense' to past sponsor in my new series but
had to modify the css of the 'sponsors.html' page to make the "stack" easy to
work with in the future.

Best regards,
PERALE Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
