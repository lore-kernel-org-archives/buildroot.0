Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2412C83013
	for <buildroot@archiver.kernel.org>; Wed,  2 Jul 2025 12:16:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5DB4541950;
	Wed,  2 Jul 2025 12:16:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xt_BYBMIk9tN; Wed,  2 Jul 2025 12:16:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7115E41934
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7115E41934;
	Wed,  2 Jul 2025 12:16:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 91E80179
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 12:16:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 781814020D
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 12:16:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QJUstkBXTOun for <buildroot@buildroot.org>;
 Wed,  2 Jul 2025 12:16:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=elmehdi.younes@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 749E140121
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 749E140121
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 749E140121
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 12:16:49 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3a531fcaa05so2680189f8f.3
 for <buildroot@buildroot.org>; Wed, 02 Jul 2025 05:16:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751458607; x=1752063407;
 h=in-reply-to:from:content-language:references:to:subject:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=xAvSKEKEtnL3fs5W0R2P78XKaNCo+3Dr7+rxI+M0w9U=;
 b=jWtvegP8Q4x2syvlmxTJ3MfYP/Jj685FVjoIBEwDlUWUT4IPicpECWx0Ud9LbAQVh3
 JFVrnMfskv8iC9aQGfvdtgaVRePUYOwPZ8XiQvNlhfcZAA9z7kbZIwkEMwED5mU3u7MY
 6NiwS9Jyg2KF86ClhHNjtMejPT57XN2xlfx4VJi4MyfKtvG4okAoAs+vCmLdrO9Sw832
 1MYIQ7mZ9Lvqx7OSpVIxksUIqWFvTIVywNfMns21o8e3JhvLTJZlpnK+HUIwx3nLbP45
 hVWBqwPljs5i+TbZQJKnxvI0zqC5zFOauYiBRlDmYWx1Py0aSSbf7T/a06SMDAmIoyWa
 wbuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUE3VCx88Mk8m3uAFIYhKDR2wAVLL9kxp0JiYkaPZ/XIFsXIMneH4fcv+X3B5Vu6+Ijc96BytbTWfI=@buildroot.org
X-Gm-Message-State: AOJu0YybkdqHOX8pArOp+eh2u2ogOn0NyHnBepfksijY3m6QyCGN4XuJ
 4ZSkDKTf4BdyAUdhZ4EypW2pVCRn76WQPZT8IhPluYPJzW1qOYIpz5ciRS6HCIaU0GQWcWLhrGM
 LdC2+
X-Gm-Gg: ASbGncv723TMISGaZRUMjri/XYCxws+5rt0zQzS8alXQIkr1AylrhWXBROrerP2lbjW
 4cyYJXiOtTleLvefo1DOpzgSR7x7nxEHYnaMZnlyy5r4HiCKsCXMEZUXY6DelAkydDwdCId8XGX
 ZQUf31cZmF5rNHpn6Xp2vJiZps3ZcL7aZCtmy7BM4uu5qW4V5yiXLg7DfZKaIE6kEL/XIZEROXa
 Jj+iHVFUMler0HljgjQ3Q+pklsVHi2IqGgocC4e7rnCfYFLeSYhsiH71JZakWhuYFekazk180bo
 +4YmWhnfLzbxbDEq/5onwKNIngZbHKRTcayql27n7ADNXw/VtIz9x+bMCaa746MyBL0uV+cqyGT
 SuMKXfjmh+0sQurbA8N7xqHb/z8pabyw0BXs69DPxAysLYXOsy0/AI4miWSBE1dw=
X-Google-Smtp-Source: AGHT+IEI2BQlXNpflP8sU295PLJkSsbMM8hLVGfjCUX30T9DXyYfr4zCP/1KIYaSogE2Dc4+tIdecg==
X-Received: by 2002:a5d:64ca:0:b0:3a5:3b56:974e with SMTP id
 ffacd0b85a97d-3b1ff24459amr2225839f8f.6.1751458607075; 
 Wed, 02 Jul 2025 05:16:47 -0700 (PDT)
Received: from [10.5.90.83]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a88c7fa8aasm15741902f8f.27.2025.07.02.05.16.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jul 2025 05:16:46 -0700 (PDT)
Message-ID: <286de617-8a80-4bf9-a422-596a851c6dc2@smile.fr>
Date: Wed, 2 Jul 2025 14:16:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Alexander Shirokov <shirokovalexs@gmail.com>, buildroot@buildroot.org
References: <20250527171400.78560-1-shirokovalexs@gmail.com>
 <20250702105225.42296-1-shirokovalexs@gmail.com>
Content-Language: en-US
In-Reply-To: <20250702105225.42296-1-shirokovalexs@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1751458607; x=1752063407; darn=buildroot.org;
 h=in-reply-to:from:content-language:references:to:subject:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xAvSKEKEtnL3fs5W0R2P78XKaNCo+3Dr7+rxI+M0w9U=;
 b=ZWSq8u+Q0BR2+srvUzn2epVLZsHVVw/nO/QBTii6R6hNWf/XuQ85gwkxSQvxk7zu27
 OC8Bz+WrBABLMCcie58yi65PXWIMmEhRloKO0kqwhKgahGinhCX1rrRst+S2il665xzA
 dJmOedns/cpUDa8vHtb/rvCcViuHPy1tqc6yk=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=ZWSq8u+Q
Subject: Re: [Buildroot] [next, v5,
 1/3] package/uutils-coreutils: new package
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
From: El Mehdi YOUNES via buildroot <buildroot@buildroot.org>
Reply-To: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Content-Type: multipart/mixed; boundary="===============6849818669186226219=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a multi-part message in MIME format.
--===============6849818669186226219==
Content-Type: multipart/alternative;
 boundary="------------2kev7nht2GGzlS66F5AopFEj"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------2kev7nht2GGzlS66F5AopFEj
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Le 02/07/2025 à 12:52, Alexander Shirokov a écrit :
> It seems we can provide a brief summary at this point:
>
> 1. Reading the list of packages from `feat_common_core` is currently the best
> available approach. It results in minimal and simple code while still providing
> sufficient functionality. I tested it on my side, and it works very well.
> Therefore, I’d like to proceed with this approach and can provide v6 patches
> with the change.

Looks good for me. Although, I'm still not entirely sure whether it's objectively
better than v5, so maybe it would help to get a maintainer's (or someone else's)
opinion on which version fells more appropriate in the long term. Since we agree
that both versions are valid, having a third perspective might help us choose more
confidently.

> 2. I’ll contact the uutils-coreutils developers to understand their ideas
> regarding the configuration of the app list. At the same time, I’ll try several
> approaches on the Buildroot side — just to experiment, gain experience, and
> compare methods. I expect this will take some time. I’d like to deliver the
> configuration-related changes later, separately from the "new package" changes
> (if that matches Buildroot’s approach and vision).

Thank you again in advance for moving this forward!

> What do you think?
>
> Thank you
>
Best regards,
El Mehdi

--------------2kev7nht2GGzlS66F5AopFEj
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">Le 02/07/2025 à 12:52, Alexander
      Shirokov a écrit :<br>
    </div>
    <blockquote type="cite"
      cite="mid:20250702105225.42296-1-shirokovalexs@gmail.com">
      <pre wrap="" class="moz-quote-pre">It seems we can provide a brief summary at this point:

1. Reading the list of packages from `feat_common_core` is currently the best
available approach. It results in minimal and simple code while still providing
sufficient functionality. I tested it on my side, and it works very well.
Therefore, I’d like to proceed with this approach and can provide v6 patches
with the change.</pre>
    </blockquote>
    <pre>Looks good for me. Although, I'm still not entirely sure whether it's objectively 
better than v5, so maybe it would help to get a maintainer's (or someone else's) 
opinion on which version fells more appropriate in the long term. Since we agree 
that both versions are valid, having a third perspective might help us choose more 
confidently.
</pre>
    <blockquote type="cite"
      cite="mid:20250702105225.42296-1-shirokovalexs@gmail.com">
      <pre wrap="" class="moz-quote-pre">2. I’ll contact the uutils-coreutils developers to understand their ideas
regarding the configuration of the app list. At the same time, I’ll try several
approaches on the Buildroot side — just to experiment, gain experience, and
compare methods. I expect this will take some time. I’d like to deliver the
configuration-related changes later, separately from the "new package" changes
(if that matches Buildroot’s approach and vision).</pre>
    </blockquote>
    <pre>Thank you again in advance for moving this forward!
</pre>
    <blockquote type="cite"
      cite="mid:20250702105225.42296-1-shirokovalexs@gmail.com">
      <pre wrap="" class="moz-quote-pre">What do you think?

Thank you

</pre>
    </blockquote>
    <pre>Best regards,
El Mehdi
</pre>
  </body>
</html>

--------------2kev7nht2GGzlS66F5AopFEj--

--===============6849818669186226219==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6849818669186226219==--
