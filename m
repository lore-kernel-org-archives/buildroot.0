Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FF0BC83F09
	for <buildroot@archiver.kernel.org>; Fri,  4 Jul 2025 06:48:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB69183ACF;
	Fri,  4 Jul 2025 06:48:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZNuFMAnRGo5h; Fri,  4 Jul 2025 06:48:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0274A83B34
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0274A83B34;
	Fri,  4 Jul 2025 06:48:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 60CD31EB
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:48:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 52A24820A1
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:48:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UP2JxXf2I2J5 for <buildroot@buildroot.org>;
 Fri,  4 Jul 2025 06:48:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 61D4F82098
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61D4F82098
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 61D4F82098
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:48:13 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3a5257748e1so415455f8f.2
 for <buildroot@buildroot.org>; Thu, 03 Jul 2025 23:48:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751611691; x=1752216491;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IR5OcLqSCIRY7juJOX5uGLqp9NQnVvEe20GqDgoAmqk=;
 b=ex6jqUBYAEHk5mjsZTRVC6sDBLbBUn0cvgFJUY3rk/u+iLpn3bEnYCQ/YQGHqJ6qXn
 pk8nlfmz19hXGA94Qh3aAgN6rWKf39/sSYtH7GT7V8Ust28fQOuOhBBaavvha6rCNwGM
 sIYE5FIIkMcEgmkM83V+Hk6edYVLStIQ3rO1SQJGwsFUTNMtS+NuAmw+SHZooCt5fFIb
 6OeF/H2wK5yUeNnEup1V1DKjveyqOnumiRap35QgjnwWbBnQ+lnOpZkLXMqhbnEDRPxA
 Cb9Vg0d2u2R7nlUHaOOCGqDKw+LSBOC9fvOeRR7wxACW3lC7jqshV4QDv7mYrS1dUyH2
 JzdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUnxxpZGzl/wDVdXPvb+FbWv1ABNwh3Ues2V/73IwZdjmp2iI6MyBsHibHEuS87wJO0ncfX2+2cmY=@buildroot.org
X-Gm-Message-State: AOJu0Yywc4mvEhMhggvEWqsyYdH8VrQatO+ClOj1HnUWdjp57M56u8R4
 gcKx37JgS3MZNQjkmhv0PCg0Q+4nXS42Lf3em/PrRST68ZB6GhBBtwLB7cCWONlfBNc=
X-Gm-Gg: ASbGncsd9ssGDQNTvoMKc7gV1pm8AM5cZO0br1AezWkbsBALSjNFxjtY/jX5FqB+e8c
 kf2PbAoCnVyRYPhfypg/nFVcq9nKVV+Q8kJudjRyMOKexNnOzWTsfZXk9k+yL7u1uV2/Cm6z0W3
 3zkdM+1FyOkNsckrXpyZHqOoKPlnkxTthhx1fPxB3b4amqCVHbWaXIGdYbW9dgvCe/hE2TU4e7E
 EouYGli/9OwVAtwU8YOPXKW8n4QSCiaekPAqat2MUXarg7nYmBkOQmKpl13WO8Bq3NiQwNDh+6R
 xE0CtiLCtokcu8rILmImqXB+MC2DNvsNtABm1D7btf547oJdvsLR1JQvRZcOhxrC62wzHTY6K7v
 AJ7DWOUFk3w==
X-Google-Smtp-Source: AGHT+IEvKjaJ7Rs/Ntyr39+kNuq954kvIAFdulfKyN7Tnk9KqKlIYv0oo23FU4qsju+p/3zDeYDo7Q==
X-Received: by 2002:a05:6000:480b:b0:3a4:dc93:1e87 with SMTP id
 ffacd0b85a97d-3b497011a59mr628917f8f.1.1751611691421; 
 Thu, 03 Jul 2025 23:48:11 -0700 (PDT)
Received: from arch (94.105.118.175.dyn.edpnet.net. [94.105.118.175])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b47225a720sm1650199f8f.77.2025.07.03.23.48.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jul 2025 23:48:10 -0700 (PDT)
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  4 Jul 2025 08:48:10 +0200
Message-ID: <20250704064810.4065534-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250624114059.1931308-1-buildroot@bubu1.eu>
References: <20250624114059.1931308-1-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1751611691; x=1752216491; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IR5OcLqSCIRY7juJOX5uGLqp9NQnVvEe20GqDgoAmqk=;
 b=U5Y0kdXguxEemso6eMQ2YyA+haRpL+isVJs978IOTHmvSWxJXekimMHZJMs+oxFIf2
 x0pc9sY7fvZk7BmiQRylpb2GZGd20GUFAR0kBHxUqncUv8V2IDtgv4kl8ncUu97NzDM1
 CjJ6qfd1YsOTlnVGo2W8sabl5ic14c9L3XR6WtYsSN10Ff2TJ+TPHGCH3p5FhH26aRhp
 5156To9SpOli+iROSYvz7qRy9B7wO8eGekSAPQcMk6KeukU3x2DciIJlffAhUJhAE5x6
 7w0x/DyVLkRAyQ4T6JH/ep6VyvfWGLYJMhQPRW8pZa2kGPnubicOl8JqMp6ZN5Dcp0oe
 Xa8Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=U5Y0kdXg
Subject: Re: [Buildroot] [PATCH] package/python-dotenv: bump to 1.1.1
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
> Release notes:
> https://github.com/theskumar/python-dotenv/releases/tag/v1.1.1
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to 2025.05.x. Thanks

> ---
>  package/python-dotenv/python-dotenv.hash | 4 ++--
>  package/python-dotenv/python-dotenv.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-dotenv/python-dotenv.hash b/package/python-dotenv/python-dotenv.hash
> index c591dcf9b9..5b4be41206 100644
> --- a/package/python-dotenv/python-dotenv.hash
> +++ b/package/python-dotenv/python-dotenv.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/python-dotenv/json
> -md5  9bdf50416b1c59832d2f77ad6afdf0d8  python_dotenv-1.1.0.tar.gz
> -sha256  41f90bc6f5f177fb41f53e87666db362025010eb28f60a01c9143bfa33a2b2d5  python_dotenv-1.1.0.tar.gz
> +md5  b3e9652d1974f8c7574c43f719799f3a  python_dotenv-1.1.1.tar.gz
> +sha256  a8a6399716257f45be6a007360200409fce5cda2661e3dec71d23dc15f6189ab  python_dotenv-1.1.1.tar.gz
>  # Locally computed sha256 checksums
>  sha256  80619b7049f08c81683ad0e01f08f257a840652dd71ee83146d36658c7d2c2b9  LICENSE
> diff --git a/package/python-dotenv/python-dotenv.mk b/package/python-dotenv/python-dotenv.mk
> index c565a3e681..8f11c5de8d 100644
> --- a/package/python-dotenv/python-dotenv.mk
> +++ b/package/python-dotenv/python-dotenv.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_DOTENV_VERSION = 1.1.0
> +PYTHON_DOTENV_VERSION = 1.1.1
>  PYTHON_DOTENV_SOURCE = python_dotenv-$(PYTHON_DOTENV_VERSION).tar.gz
> -PYTHON_DOTENV_SITE = https://files.pythonhosted.org/packages/88/2c/7bb1416c5620485aa793f2de31d3df393d3686aa8a8506d11e10e13c5baf
> +PYTHON_DOTENV_SITE = https://files.pythonhosted.org/packages/f6/b0/4bc07ccd3572a2f9df7e6782f52b0c6c90dcbb803ac4a167702d7d0dfe1e
>  PYTHON_DOTENV_SETUP_TYPE = setuptools
>  PYTHON_DOTENV_LICENSE = BSD-3-Clause
>  PYTHON_DOTENV_LICENSE_FILES = LICENSE
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
