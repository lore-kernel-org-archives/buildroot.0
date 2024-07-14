Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3CF9C3DA49
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 08:29:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47A984064D;
	Sun, 14 Jul 2024 08:29:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PO5IfAjXUM9u; Sun, 14 Jul 2024 08:29:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0CD9E4064F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0CD9E4064F;
	Sun, 14 Jul 2024 08:29:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 490041BF576
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 08:29:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3430080DEE
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 08:29:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lEPbVJoQQI8B for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 08:29:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E645C80DD3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E645C80DD3
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E645C80DD3
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 08:29:30 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-42726d6eca5so24332835e9.1
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 01:29:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720945768; x=1721550568;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2BjCgKWkA1F47g7QhpexYlx+3IJUbB53dQqz+wXuEd8=;
 b=hej1RXgEm1y8hA93iKPf/FgGWaABA8CdoSl5QF1lxP4yO1M5lJAlzJ8KgUoJqTTKUD
 xgzUFw5sQVde5UEeOrdkFIUqeRqENMXHm7gZgk+RImWKL1gVADuVPD/Pc1gnl3Zqyl0t
 V2jqeIZh8mDuHdrR6X+bSQYowNnjpOW7D/gJyNhc0kZRzvRoHd3piNVQ+veGXaZject5
 JFpTbg/YhZ7GyuPCQHyIBD0ik9kNobPoO2R784Td1wjo4qaDpYDbs4L4RET1qSAahzUG
 aBE478kmr85l3krK44Fu+udVpq8quf0JU3x/97PT+7rC0llHXbLFoMV+GtZhOsgAbaSo
 2y3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbkfRUhjrncmI3cvn9msE4KzZ6HbURz7yJd1si7PcIfRiM+VgB6n36eNywIhfZkiatDUaxx93W3YBXiTXkQrFYSZsd6IA8qw==
X-Gm-Message-State: AOJu0Yyq8DYwfowDkJI06mBs8/AhF/O0IGcPI2seEh3wcNbydORwdc52
 VoIguEzsckDRvwHQOhbvQ2v0xsLkZfAJS8Sn29FOxo6H+hB6qX8qGW86EZi+vxExRZslVUrvTPt
 YdG4=
X-Google-Smtp-Source: AGHT+IECgmLk8rYwxVmTw5QLBwOXtTw1XkwcQCXQVryUEshxaGIuYemGih8FPVbge8qbNlOT0+7hmA==
X-Received: by 2002:a05:600c:5596:b0:426:6edf:6597 with SMTP id
 5b1f17b1804b1-426707db700mr93296575e9.19.1720945768517; 
 Sun, 14 Jul 2024 01:29:28 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:b481:98b5:611f:e783?
 (2a01cb05949d5800b48198b5611fe783.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:b481:98b5:611f:e783])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279f23981fsm79516025e9.4.2024.07.14.01.29.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Jul 2024 01:29:28 -0700 (PDT)
Message-ID: <9aabe42e-d800-4307-85c5-9603be0421f9@mind.be>
Date: Sun, 14 Jul 2024 10:29:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <cover.1717779951.git.yann.morin.1998@free.fr>
 <39b3ed498086259b4e0ef8c48f0de724df05224e.1717779951.git.yann.morin.1998@free.fr>
Content-Language: en-GB
In-Reply-To: <39b3ed498086259b4e0ef8c48f0de724df05224e.1717779951.git.yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720945768; x=1721550568; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=2BjCgKWkA1F47g7QhpexYlx+3IJUbB53dQqz+wXuEd8=;
 b=B3T9LtoZeAZQSXetNLyk/uwCG1PYxIPX6xbpr68zxH+t/aoXcUb3cjLIadzRlYb55J
 8t/IM4Sf3VJYXPpwPjPPIt+4xYlVBpRbeYImMcPlAeocAIIdqHHE1SRWyjD4EbgKdeHi
 7ThQ783WTLHFIepn4ttjwrtJ/OnGJ/UnYMf7H6ewW5QTDgEwo/kAzQl6ky4mC8JXxb1P
 UWnUoY2go2AXaGwkRUO0BUBJIxHZX7bY1MNaMrx99W/sMQLsTnlR5JTmsEGdRs/HXOJ0
 ivswiRpHqnszIDdFsYOw1FX7ZCKu7ozfg0RoBktQjxIsuV5Q3U2Mjnxbl42sVXkZOu+v
 IkcQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=B3T9LtoZ
Subject: Re: [Buildroot] [PATCH 10/20 v2] pakcage/pkg-cargo: use
 post-process opts to pass manifest path
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/06/2024 19:05, Yann E. MORIN wrote:
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
>   package/pkg-cargo.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
> index 47ce68bf02..41dfcbd096 100644
> --- a/package/pkg-cargo.mk
> +++ b/package/pkg-cargo.mk
> @@ -192,7 +192,7 @@ $(2)_DL_ENV += CARGO_HOME=$$(BR_CARGO_HOME)
>   
>   # If building in a sub directory, use that to find the Cargo.toml
>   ifneq ($$($(2)_SUBDIR),)
> -$(2)_DL_ENV += BR_CARGO_MANIFEST_PATH=$$($(2)_SUBDIR)/Cargo.toml
> +$(2)_DOWNLOAD_POST_PROCESS_OPTS += -m$$($(2)_SUBDIR)/Cargo.toml

  I've applied as-is, however I wonder: why is the value attached to the option? 
Why not -m $$($(2)_SUBDIR)/Cargo.toml with a space in between?

  Regards,
  Arnout

>   endif
>   
>   # Because we append vendored info, we can't rely on the values being empty
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
