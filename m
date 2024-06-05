Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB7E0C25B76
	for <buildroot@archiver.kernel.org>; Wed,  5 Jun 2024 20:35:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7ABF484539;
	Wed,  5 Jun 2024 20:35:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z3TJtsPp1raq; Wed,  5 Jun 2024 20:35:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7916D848F1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7916D848F1;
	Wed,  5 Jun 2024 20:35:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 761881BF5A9
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 20:35:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6210C84539
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 20:35:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZMDlx0W2P1Nh for <buildroot@lists.busybox.net>;
 Wed,  5 Jun 2024 20:35:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B146584501
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B146584501
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B146584501
 for <buildroot@buildroot.org>; Wed,  5 Jun 2024 20:35:31 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-35dceef429bso87847f8f.1
 for <buildroot@buildroot.org>; Wed, 05 Jun 2024 13:35:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717619730; x=1718224530;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YLAs9tKRafvmxaMGZ2BnhfS+9kfqBKFCcfMiz+KXr6k=;
 b=IzQQHL/nnuX7l/R3imq1RJFXv0l1sj85WvAanmRRcj257GfOdJVtOr2PxfUL+RofVK
 sCV1hmUwOLnkkBGmwiB1arVAtysiC+wFkqbVkx/RcLmXGhg3qtBjnPsi6m0h6ZzN0vH5
 UJFNCnrAvONjCyJwJVjUxeZmEtwSqX6CBc+iFLOhp8jcrANztYpUNpKZNEsWWSIzgACv
 40wYbLJn+1kDRu9sl64DZHPBsvGSZk/wcocTfNINazfJ4orooAzRRp6N2YRFUwUVObj5
 GGvmFZIWgtxacfbb2lbjOkR7PmzIcO61KUBLBOA5jNkcn0CzdAKE9DzS9oz9mK26y8Jf
 YOWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJ3bSxBSXESdWtIbvMZbTDZgvCqXkfV/PV2Oq5lNodxx0hRhvbkzz5FToZfvGmRHK9oXPabGohHFsmEXanJvquMIh5TdY3AA==
X-Gm-Message-State: AOJu0YyxvMzwfnTZCgs7nsLqh/ven5wYLIIz2Drm1ou+l4k76m334TA+
 lz/L+C8mgPNGm8owlU1Y6FP5bJUP18RzZIxvV83CPE3yYc28YsC14yFLTy33Z+Y=
X-Google-Smtp-Source: AGHT+IH3agOf79dZojvTeaT6Zx+fBTO7nUjrmD6jI2PX7X6rHJ/EMOHZBfP9V8E/jA8+IfrrRRd7EA==
X-Received: by 2002:a05:6000:cca:b0:354:df32:69da with SMTP id
 ffacd0b85a97d-35ef0d7a119mr616693f8f.14.1717619729654; 
 Wed, 05 Jun 2024 13:35:29 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35dd04cad5bsm15779460f8f.38.2024.06.05.13.35.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jun 2024 13:35:28 -0700 (PDT)
Message-ID: <7b7a70a4-d469-43dd-93a4-69e4fcdf976a@mind.be>
Date: Wed, 5 Jun 2024 22:35:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
References: <20240604184127.1687685-1-peter@korsgaard.com>
Content-Language: en-GB
In-Reply-To: <20240604184127.1687685-1-peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1717619730; x=1718224530; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YLAs9tKRafvmxaMGZ2BnhfS+9kfqBKFCcfMiz+KXr6k=;
 b=EjjI3CioPPGuxedSaioMRZ7k7/LPB5Z+50NAlQ5twEPZGUYI3Dis5mTt43Jb9E1JVk
 vik2/djZ3FNP6L9OxAc2Qzpf8Q4woQ6ULcbYMfggoG4pR/MP0W36vDC4sbTHdfPJgK90
 KGbusQBm5pdm/EZ+7w+arlxNs6e+6mBPR3A7YzAcxVQRcgp+kr1NWKgaL4MriWbNjv71
 rw5Kpa8tmmNDGgJmSNYkJsjxIgiUQYubHKwigabhEOsqc9RdgsrDvTqN8Xc28AiVEVLu
 H9ESNhzGfKfhAwsBtb1fkaiTtTi5ynJMGYUz6HZ2lRphBUJgme6iTnmsG2lDCbrsFDhu
 8DtQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=EjjI3Cio
Subject: Re: [Buildroot] [PATCH] support/testing: sample_python_pybind.py:
 use python3 shebang
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
Cc: Guillaume William Brs <guillaume.bressaix@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 04/06/2024 20:41, Peter Korsgaard wrote:
> No functional change as we install a python symlink, but use python3 for
> consistency with the other scripts.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   support/testing/tests/package/sample_python_pybind.py | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/support/testing/tests/package/sample_python_pybind.py b/support/testing/tests/package/sample_python_pybind.py
> index 605c0bab15..9c605caf61 100644
> --- a/support/testing/tests/package/sample_python_pybind.py
> +++ b/support/testing/tests/package/sample_python_pybind.py
> @@ -1,4 +1,4 @@
> -#!/usr/bin/env python
> +#!/usr/bin/env python3
>   import example
>   print(example.add(1, 2))
>   print(example.says)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
