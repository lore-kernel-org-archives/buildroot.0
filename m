Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 397AAC83F1D
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 10:45:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C94F861420;
	Fri, 11 Jul 2025 10:45:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fx1zKzGKiraP; Fri, 11 Jul 2025 10:45:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CAF7B61437
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CAF7B61437;
	Fri, 11 Jul 2025 10:45:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5DA35199
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:44:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 447DF4053E
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:44:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YJ0J_RCDRKqi for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 10:44:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5BCE5404CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5BCE5404CA
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5BCE5404CA
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:44:56 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3a5123c1533so1052296f8f.2
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 03:44:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752230694; x=1752835494;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2hpz15nsCwUOM7djLXMFDBlzsg0dYXDoev41EaPd2Bs=;
 b=tuz5TQNnbqf6f5893ZUUbjVefFmojTscjly6dihT6Dzh5DNygPijWf8EOpR6xcggQR
 e2Lzmkl9bFjrtmLH/BRCGY3MIV2gRr6TOscJb+8SiKUjODML8KbinEs23K7Xeet/8z28
 TS6BCyNYdGoWI90JF3Pwgb4NrwCprC8QbcXmw8usPgSG2dzk++s6HZIh0n/NfqcvOYlk
 ilVPck8FUWL5JnD1UXCzrGkB3DMsOpQS4QXzAsUnlwZ8d9ta0Zb2P8hZlPzHRMirSofq
 CcK9fGIqsAS9UdAICyqFKHyIYF7q0QfuqRUsqVxvI4FWCdPiNZKftr42+11SwvFWxk9j
 CXvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2YZrbzuzxgb6gTfx9YSVXdbJc9y9eUSM8O/OPu7ADkABRNuQuCNjWxvpmq2fcbP1t57tvEDRpKck=@buildroot.org
X-Gm-Message-State: AOJu0Yz7JSZviuAqppFhwhagNMUztfVDaASkrhIRaSsj8eu/BSqmDRse
 YanV9aIg49Y7KwWxPk7JNGyw2dlFH2h1uqcaZmW9Jw7QDNKBxKpWztRGwJPemoStqNd3L8nZu+7
 MrFQu
X-Gm-Gg: ASbGncuJ5ftRJ8Gje8Ezzb9zjwXMckXs5BypVcZ4hhj+SFLxETDwijGWA8iVYpVcHFl
 5ndX7PgtIgtr6+O6g6rI/gpOunL0ZRphDmRYJG8DmQarhQTeZ9C9G6Zeb++ZFpV1XlPjJ3CKTXZ
 4EbP4Wn0NFcr41L77Axj8ttNBxtQ1kRxVOrguOcOxtL/ILnoEOQm6VqLDfdENVPkwPzdVLnFWm8
 qgqsaDazmYHthvBHOZwpajzJ1Ag9zPXAj2pUpTDhz1Sz+CiG7KlWPQEL6txnWJQFsPju0Kun1xY
 DOx8fqCAf4berwhzS839Sb1o7VActtW/HWEcJ6MY3LimmknFXGE4w2jyBL4liuljp64t7Oa2hHP
 +tjr3ihmWANK2REB3379GYrIj
X-Google-Smtp-Source: AGHT+IE0m78zT9f44zY69MGqAT3Fb6Q9d5eFKZlbeNiUeL4QIuEnU5fZPoilHbVZ2uG16/1yTirbPA==
X-Received: by 2002:a05:6000:270e:b0:3a5:3b56:974e with SMTP id
 ffacd0b85a97d-3b5f187ec9emr1749303f8f.6.1752230694358; 
 Fri, 11 Jul 2025 03:44:54 -0700 (PDT)
Received: from arch ([79.132.233.65]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8dc3a62sm4061983f8f.40.2025.07.11.03.44.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 03:44:53 -0700 (PDT)
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 11 Jul 2025 12:44:53 +0200
Message-ID: <20250711104453.824048-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250703035752.5032-1-f.fainelli@gmail.com>
References: <20250703035752.5032-1-f.fainelli@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1752230694; x=1752835494; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2hpz15nsCwUOM7djLXMFDBlzsg0dYXDoev41EaPd2Bs=;
 b=Ow88a7t0Bt56iVXOW01TCAgm3tlJog2kcrYOVGq7MRdz8VdfmIWNf6IOIrMoIJwrid
 fM/Vz4pwFos10XiGh5ppJH3iEYA87SIGPU1DibzSNE/4ZYaWsrPw7CdrpxQjIV5tsS7a
 4MKBHjYzX3mpzgjftH9jICtPBsxrSwBWh1d1AWjq4q1PoAcn0wR+iYiyf0b7FiBz5WIE
 AWKXhlRiGTbvS8WA2bIyvuEkCEvGx+WxEvjkV5qlfH2eU5kYuhc7qeeYki8R+VSTWoO4
 RAGRdjv5+RQk99Dzz6nbGqUoAmn9FJimDntSKqwSUwVy9VISozRguICq4THDp8jrr4me
 9KKQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Ow88a7t0
Subject: Re: [Buildroot] [PATCH] package/cpulimit: Backport fix for function
 signature
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
> Backport the upstream pull request patch fixing the incorrect function
> signature passed to pthread_create()
> 
> Fixes: https://autobuild.buildroot.org/results/5308cb8239f31ef39e5c67d65ff1d69cdec1cedc
> Fixes: https://autobuild.buildroot.org/results/6722247e3c830558ac0377352d05f4bb1684978d
> Fixes: https://autobuild.buildroot.org/results/adc385fe35432be28453b8ed9f40e8a6647a4b28
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  ...0005-Correct-loop-function-signature.patch | 49 +++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 package/cpulimit/0005-Correct-loop-function-signature.patch
> 
> diff --git a/package/cpulimit/0005-Correct-loop-function-signature.patch b/package/cpulimit/0005-Correct-loop-function-signature.patch
> new file mode 100644
> index 000000000000..5e143fdbb1a0
> --- /dev/null
> +++ b/package/cpulimit/0005-Correct-loop-function-signature.patch
> @@ -0,0 +1,49 @@
> +From 74e95c96e8d82e4e374f86142972fcf4305fe1f2 Mon Sep 17 00:00:00 2001
> +From: Florian Fainelli <f.fainelli@gmail.com>
> +Date: Wed, 2 Jul 2025 20:47:58 -0700
> +Subject: [PATCH] Correct loop function signature
> +
> +loop is passed to pthread_create() which requires the following
> +prototype to be used: void *(*start_routine) (void *)
> +
> +Correct the signature to avoid such warnings:
> +
> +In file included from busy.c:3:
> +/home/buildroot/instance-0/output-1/host/mips-buildroot-linux-uclibc/sysroot/usr/include/pthread.h:164:36: note: expected 'void * (*)(void *)' but argument is of type 'void * (*)(void)'
> +  164 |                            void *(*__start_routine) (void *),
> +      |                            ~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
> +busy.c:6:7: note: 'loop' declared here
> +    6 | void *loop()
> +      |       ^~~~
> +
> +Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> +[Upstream: https://github.com/opsengine/cpulimit/pull/127]
> +---
> + tests/busy.c | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/tests/busy.c b/tests/busy.c
> +index b3afb7cd853b..93f0bcce67a8 100644
> +--- a/tests/busy.c
> ++++ b/tests/busy.c
> +@@ -3,7 +3,7 @@
> + #include <pthread.h>
> + #include <unistd.h>
> + 
> +-void *loop()
> ++void *loop(void *)
> + {
> + 	while(1);
> + }
> +@@ -23,7 +23,7 @@ int main(int argc, char **argv) {
> + 			exit(1);
> + 		}
> + 	}
> +-	loop();
> ++	loop(NULL);
> + 	return 0;
> + }
> + 
> +-- 
> +2.43.0
> +
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
