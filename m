Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ED32C3DA59
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 14:02:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BFE5812AC;
	Mon, 15 Jul 2024 14:02:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EuO2t5Uc3Jxl; Mon, 15 Jul 2024 14:02:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A0B58129B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A0B58129B;
	Mon, 15 Jul 2024 14:02:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1F59F1BF3BE
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 14:02:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1927240586
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 14:02:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 88qe18mQZp-r for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 14:02:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22e; helo=mail-lj1-x22e.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1805B40608
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1805B40608
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1805B40608
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 14:02:32 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2ebe40673e8so58377091fa.3
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 07:02:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721052151; x=1721656951;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9o006fFPhzDaySIcs4V2zrj+cL1pIcGG2IJFcVu9xVA=;
 b=cPm+TkZhpb91LHl5MnZrajlM/2wQbQaow2VHFDJtmajRd7anFYypM3q0h/ee0a+5jc
 imtTRnlpyBtUA5SWk8QfHH1aa0zcs4uvnMOEWbeHDSGnNqIUc9B1EOktkBKAGo/VbyTC
 oo1fmIByaPrnEbK3YK9u3xaTzfDvtlXEfH0niE2SHipeDCS0alZENbeHtiES9wXTfoYh
 XJdLeZ80YaSMClbvfWYPwohPOuauVIAVKHK+P9UzYCUSeflxdiL5tS9trga0vTu3WcKJ
 lDrCCauLI9w9/hFB8P/MYLIXOX6TgtuJsCVRa0+Sgkok1P6RTmb9iG7luMmU9t2gn5l7
 mpMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV15AJE48try5DvbZZ6Odnc1RTfLfXdqa4UQrhhrLWDypNMq/JFSiVtH23G7J4SHKP3/fgK9Jbdatha/sIVaCwevQCuXsh/Rg==
X-Gm-Message-State: AOJu0YyKPwk6Zeg2YfW5XZUFnIAKZLefXPaoDzHIksKEe3QGNOlXhHvC
 qzh/6dTQ1yFR0uYJqtzHHNA9W5Zz8Q4talXUX7NgMG3GD/7LTL4InxXyBiLVq/U=
X-Google-Smtp-Source: AGHT+IFEH5SICQUM9cs6LN+K+MkZDxLBVJ211vIizQ3DNI3EkuswIY8Fnct9Co4d05UqWbihDuGQVQ==
X-Received: by 2002:a2e:95d9:0:b0:2ec:4487:6a8f with SMTP id
 38308e7fff4ca-2eeb31827e0mr112891001fa.37.1721052148822; 
 Mon, 15 Jul 2024 07:02:28 -0700 (PDT)
Received: from [10.8.0.42] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427a5e7751asm89727045e9.3.2024.07.15.07.02.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jul 2024 07:02:28 -0700 (PDT)
Message-ID: <46e6f7ef-88c9-4567-befd-26a4c08f6d01@mind.be>
Date: Mon, 15 Jul 2024 12:21:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Kory Maincent <kory.maincent@bootlin.com>, buildroot@buildroot.org
References: <20240712153509.2583089-1-kory.maincent@bootlin.com>
 <20240712153509.2583089-4-kory.maincent@bootlin.com>
Content-Language: en-GB
In-Reply-To: <20240712153509.2583089-4-kory.maincent@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1721052151; x=1721656951; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9o006fFPhzDaySIcs4V2zrj+cL1pIcGG2IJFcVu9xVA=;
 b=g/XxphbzsCW5CO562fybRDgMXS5CvOis7jG5UdH74uokEzooEdR1whe7aa2wO2vPQO
 O7s5ByWG+VGOj6m45v1LaZbJcUH8PsqYwygZGtcLRnlQ9jfAKnZqKEG/IW0zKS/wqTcd
 gpnl/ZMmMxxI1rnaAVZ7T+xRzTU4BQIRwdco+bo2VMu84VSCp9MGLS242e7df2eaJCtl
 rEY6Zx1NvUbVAs9rgzUsxfXZfUYEnaEYlCxH9S53KulRRLvbqjMlKFQ6Nq6KqJqpkD0b
 0OXnf4wXfXwii/9uRPZn6J1793lrQPdv1b6+/01YLDqF7px/f9QnfmI3KlFLiH7okJog
 0MEw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=g/Xxphbz
Subject: Re: [Buildroot] [PATCH v4 3/4] package/python-cbor2: Add support
 for host package
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>, thomas.petazzoni@bootlin.com,
 Asaf Kahlon <asafka7@gmail.com>, Mauro Condarelli <mc5686@mclink.it>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 12/07/2024 17:35, Kory Maincent via buildroot wrote:
> Add support for the host package to enable future support for
> TrustedFirmware-M, which depends on it.
> 
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> ---
>   package/python-cbor2/python-cbor2.mk | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/package/python-cbor2/python-cbor2.mk b/package/python-cbor2/python-cbor2.mk
> index 5040301867..e0e9bfd920 100644
> --- a/package/python-cbor2/python-cbor2.mk
> +++ b/package/python-cbor2/python-cbor2.mk
> @@ -12,5 +12,8 @@ PYTHON_CBOR2_LICENSE = MIT
>   PYTHON_CBOR2_LICENSE_FILES = LICENSE.txt
>   PYTHON_CBOR2_DEPENDENCIES = host-python-setuptools-scm
>   PYTHON_CBOR2_ENV = CBOR2_BUILD_C_EXTENSION=1
> +HOST_PYTHON_CBOR2_SETUP_TYPE = pep517

  The setup type is inherited from the target, and it would be weird that it 
needs to be different... Of course, the only difference between setuptools and 
pep517 is that the former adds an additional dependency on
host-python-setuptools.

  Bottom line: this should be removed, and perhaps the target's setup type 
should change to pep517.

  Regards,
  Arnout

> +HOST_PYTHON_CBOR2_DEPENDENCIES += host-python-setuptools-scm
>   
>   $(eval $(python-package))
> +$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
