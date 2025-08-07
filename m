Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B21AC87FCA
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 18:24:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 519C24055A;
	Thu,  7 Aug 2025 18:24:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gpGFJt156RDs; Thu,  7 Aug 2025 18:24:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85C0B4056C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85C0B4056C;
	Thu,  7 Aug 2025 18:24:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BBC6210A
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A2577400C8
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id okrbG9XuHKKU for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 18:24:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AD7A340057
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD7A340057
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AD7A340057
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:05 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3b7910123a0so1130734f8f.1
 for <buildroot@buildroot.org>; Thu, 07 Aug 2025 11:24:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754591044; x=1755195844;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CDQVZTGAwItWrkpiIAAyRlUrEs680MWB0oTzL4O8+eU=;
 b=lR5IvMikPWCEZmDLITsgvSxm5MoZhsjCA58pKedRWGle058LYa0hlddFC2aWMyUw1a
 sr3UV5vNlOx5vT0H1FIGvq39kF0osFEoEoaM1EIj5DNb9nPlTXsH7ZppPpptfglvzOQ/
 qSxjnJsrEPZ9o3qUPBJEl80nOYVDgOxqfVeIkCj2HKLOXDs91GOvN6u0cxxVMC2lQ5M6
 zAl9G7mu9ZjkCR/3Lqb9IbFckcMrtOo6klYdB3B6vL27gq7Bg0pE343COuWpB1AKSFXR
 0jWTwT6evZAV/nmrtswq8I/sy5mwac7nfvwLBz8OINEKvaba8FBtLW5t6MAJbMQtn7ki
 USXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHtHPqyWkLhY2npjSsFzBE/yR0EW/xj9AbEK7MlpgPwY34U8F4jq3d0tNchVp0Wf50L+tSM1bdIhk=@buildroot.org
X-Gm-Message-State: AOJu0YxObaehUj5mCaqFqk/PN59DsvHVl+3TBbtLXWz6ipW0H4sHSMNp
 VnTB/sSZJOZT1tHyBhzNfX708vRnuvxr+twdwN/yNI/ZWw/7nJapLpF5ipNpJUjBlaM=
X-Gm-Gg: ASbGncuIl0Rl9pRr+4xfaSThkG8ipcp19kylcxBcU73o3G2Gdu+yrlVuXO6RYo+2K8p
 hBTU4gBbRjODgA+ZfZ0Ra1rm1kS15X9it7XD9f5GLYn3B2xg9UbuG0WZvYMNy+Cu65VrWL0YlF+
 HQZwsq/4UhNdPscFr15ykYjb+O1ooshrhgbWCu0IuwxvrTgEHhrD0fk7hL4ofVBz+TYZPCwkwqo
 Q6PaujV5fGZ8v1iZGsSO6KCni3zh0D9z59QCeJwgCNfzcYsm7YRCduzdd3lnbV3ReOvjXQGUN4y
 eaCl6lIyZ1h99cnOkEvpPnti97S+SMGDS74CdLUqOd8QOS4rLNkC8gQNHHJ8lgkpWsfHc2gD0Ed
 0vOFGqLZgKyugKg==
X-Google-Smtp-Source: AGHT+IGFGx89LHFM1DNHmB4kAXzyZOvV+83dtCxIeeBnqcE69cyGW1BLNBT48XKwMRGoOgsZsSp9ww==
X-Received: by 2002:a05:6000:24ca:b0:3b7:806e:7773 with SMTP id
 ffacd0b85a97d-3b900b50262mr261869f8f.15.1754591043775; 
 Thu, 07 Aug 2025 11:24:03 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b8fc28a830sm3079403f8f.16.2025.08.07.11.24.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 11:24:03 -0700 (PDT)
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu,  7 Aug 2025 20:24:03 +0200
Message-ID: <20250807182403.724287-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250715120924.1223648-2-buildroot@bubu1.eu>
References: <20250715120924.1223648-2-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754591044; x=1755195844; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CDQVZTGAwItWrkpiIAAyRlUrEs680MWB0oTzL4O8+eU=;
 b=BUpIkpVTO7SnyqodskiNUnvh0NOdzW7z6G2wutKlPoF6Dgf7Ojp5ZLHm4H5IFVP+Tx
 Bo2G/nCtdx59PMCl4676kgXSqjB7DJ71p/OV+Z0I6vQAkiTT749dsYgVWTr+XxjefoYC
 yAk4YfYR3i//z9pmi5yeFrL7qMID8HMgP9eQNTnNxihoUUiRIxuJ26G0R5pjTpQQhsWS
 z2K2Zjzo39feNLeUa1zjbPSA7sldd8ov+wwxgu6EfbEezPc3ya7GGMhrZIQysHGGJDCH
 /exeJ27bXpQ3KZIMRVS2J0iApWMyrXlbS77Y3+aBejenCLHRgWgVoeOFrQ1sptWSvZ/4
 nzlw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=BUpIkpVT
Subject: Re: [Buildroot] [PATCH 2/2] package/python-msgpack: fix project url
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
> The previous url pointed to an unrelated but similarly named project.
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  package/python-msgpack/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/python-msgpack/Config.in b/package/python-msgpack/Config.in
> index 2050d4f078..82b8c08417 100644
> --- a/package/python-msgpack/Config.in
> +++ b/package/python-msgpack/Config.in
> @@ -6,4 +6,4 @@ config BR2_PACKAGE_PYTHON_MSGPACK
>  	  This package provides a pure python library for reading
>  	  and writing MessagePack data.
>  
> -	  https://pypi.python.org/pypi/msgpack-python/
> +	  https://pypi.org/project/msgpack/
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
