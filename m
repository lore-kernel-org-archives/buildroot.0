Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2417CCA46C
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 15:04:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 91B1481664;
	Fri, 16 Oct 2026 15:04:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5VC283FSSolY; Fri, 16 Oct 2026 15:04:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org CE62C8165D
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792163044;
	b=QONAskG0TP+M/TUPYcP395JVP26eiGFc7GVVQDSciu7cZTi9BhuCl6540qa5E5gHisYh
	 bdpknq3Lm0/5oFrDEIs3iDs23B8hD/ACY5vS/QY2npvsS+Hskdp1asf1vtIFs9+YDgtr/
	 X0Vkoc4PPqRzYgWoSs+6fL6K3LN5j8sYPf2p6Zrqg7dxJuZatdVYrU5TmELe4eolkwP+J
	 1jDIkoCsTahOYy1TSs/eMNC9rrpOSl8grGhT/b+iVvhv9LIE2XaLcQMQ0T/HCk63KYKgi
	 kxJy4nW4EtR+Y5W7bSrs3IuKrp8r0eok6y/z3LJhEeGM5MScrUvwXOjHG6l+YhaovQg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792163044;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=c9wZKUoAFDlXa0NrU2wasRLq6N33vIHos38+1mZOdZo=;
	b=meeFoNC700v/K5734VSZ52QAgjxpS5YkjcHy1VIwHkUuZm/y9GVYRYcZz4l+CIxmyHAp
	 AYuc98ikqz9tV4bpxIz1N7kdWMhCEuI8LkOQQR/P5C371et8WJWM+Oe9fIaLcu72px/Cc
	 kO7qQwkRWuEsDn/A7eoFapOpBfxN+TZGe0ioEwJ090Hbd3xDV9E61+rClDuNzPsX37vpU
	 iWxPUYpyll3SxtpIK6gK3/NIJdzFWWPI+fNNPtePTWAisoX2Dt7+LBK7nsYiw4oVUnBpK
	 GWTeSLqQxksquk8Xgz9wat+dbvs2EaNZcgjQEIvODs8mNA8es55tNH+9sIeCyrfhGng==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792163044;
	bh=c9wZKUoAFDlXa0NrU2wasRLq6N33vIHos38+1mZOdZo=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=GJzTo/1jTEGi0TzCgkQcxVus/b1te5kLU7zJPOp6uFMtMii9PPQ0aMz5rdBD5iRa5
	 zmvvCTUJm/GHIDNuVQeKHCCpQjkWvdVhMZ3GdWUmWdAscJ2fIPjHsPq9LVHNXDM8tg
	 weOLXaXv5VgZlWkgEA0DdFcBpgUxAUdNe4yyytcbeaNhh1kVheTBpYJKdatLOkCipn
	 6Yq0F/GAcAXeEqlkNa7oCvbGFVZy1Gch5wnPIa6s53KgMMfVxfL5+NxOJcd+7BdtPD
	 pNpUd/5CDVGax5pecgzxyrXzgbQwPOnqvNu/a1y1iXvdpCJzqnX2OeKxHOvcv7O6Ms
	 PA8CXkFMt5ACg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE62C8165D;
	Fri, 16 Oct 2026 15:04:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8667F7AD
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:04:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6CD14606CB
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:04:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5MVHKIlHrYps for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 15:04:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9375A60671
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792163043;
 b=i4/ZPcNerM8g75XWrbL28SdFTTKM9GDbiweYgg+KBvvgHU2wfDNbdfz1PzxN4R/NQluu
 B5M/7gFIcVWKf5GEYlH4bM+ca6dEPsCAIyIMnVKrVmR6oLAlqzpljWi0PrHfhw/he1EqI
 RULuk235MjOtwIu3VvqgiPRcKcLcqDsfbCQJyX7+M+e1DJ5WXIuC+x/bKmrTUzvtunJF3
 o+h0lHGKaY6z34cnw5QuEsFXiLFDn1x6GiEV7A8lwcpZ4hdyZvcAys0hroqeAluMbbgnO
 3WAzaS/aBqDOWii+ktEQaKHeKZC7IlAcvWzlzuQzg5shQxJ4ZyebJWL5SD1oW/nWt5g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792163043;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=tdoIdOKVtGwgPi07GPTl8ZfANzxBjIzH/aR7nCccsYQ=;
 b=cm9yG7ti/1ONX9+MT/qDimIxHWsK1pzDBEewOIOAf0F8RfchixRjvsooOuRdHiAkSfpj
 ouaNVMGaWbyzxmGV/t8RRUtSttlzZJwJ62iaYVQW4cvMhi/sF8wG6jr7C+sGM8ys5qJN3
 UT0QE+JSB0RpHpFin7goBBLVVlQeCg4TeqEIEHnTrl5nf24gd2b8Utg2GpCtiVu8IXBeN
 0xh2DKBtXkwkWjdNLgvA2qs0xeyUMsu99WxC0poMwPyBMGxs89M+DYNcP3L7+YOg3Myvc
 2l4ZRlfT7nR5nppqNWYHQeNT/l4VNETW9k8OwatTBWEH05cm4j8oF6yaTdQAv6LuL7Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Vi20cesR; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9375A60671
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:04:02 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-49fbb2acc90so315895e9.2
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 08:04:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792163040; x=1792767840;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=tdoIdOKVtGwgPi07GPTl8ZfANzxBjIzH/aR7nCccsYQ=;
 b=ohxagU3OGMiDQbKUAPkIXxsRdvH5vdVw6oaNuTy6VXMkmXg8FanTnM5J53KMCHBCs8
 FSCW1s/QIUo76L8FNb8WkS+k82Jfk1zQDdcCUnuEUclbQ6hlkjcDNSMUTeIBuhL5czFp
 QNEMpLrFahDZdHhzerlzEadzrZ7tB6+kzJo0MG/Wq3KEhx366usoCJmXhGAl6V+NB7CC
 qb82X8UP0rqsFC3prEJFDs31fP5jf5m/xlcpQtmnQGuxOgIVLD9Oh2q2R0uIl9Ea/MHG
 E9Ecg6O0JPiJXy/aw/gaM8oJXtH83hEftQ9a3Em1Q/p/ZXhCH2WdeVTvB8RdlqorLF4Q
 K7xg==
X-Gm-Message-State: AFq9FYLKQbEoOfK410IqAoaNBuitnVpUKS8gs70N7l9LJpuxPbEWDYga
 Og2T3LL/j/yaXf386933990KFzuzu81nGElsj501rdsQRgVcex/wUDQLgS9sEyySKwF0HlpSPPt
 MKbRmbGM=
X-Gm-Gg: AYBFou2IKFlGAltW98YLc/Ooain5q2uKQRPq20GxoTbPJ4sQRY6dtbbm3VQeLzpzSI2
 JDbuyktgpXg9Kla3y2AMhnAl2CgWNtlM0CjjJsfq/144zo0kbvzNMu6zgMdtS4LN5NGKd5NL6rO
 UnVbeoEfzH2XcLuYqABf9Vplzbc/E/jlEpzgr1+b0e2xssRldWdvSZk2cNt3/KB9zX+X8oloD3l
 sn9M3QV1LMNrMqwn+CdDD0Y/iJi6W1560zWzuW4RpHpa3RkaBOmSKAdhWE2sQyAnFPpLrLxc4Uh
 Qtq0X6FP2xRuUN4e378cSyKaBSP0DxOCd4NqK6J/C8jjnhN31L161FnhkVmFY52SsAIo4TMmJVW
 R4ipi+wDHk223XXm5lXfETWvqBGFRw43DrAikPKXM/BElEld3uiUZXAtjqHRlJb/4YsSCnWMEgM
 3s78jHbqSjIkaFRpQmxx/9J16teqZn7cSEaFir6w0HgdV64PJeMEoI9+fTYSpbr6MFNZBI6N2hI
 9wJAX2b4ccZyr1phexDEmKyn39Ezsl+8sQt2YNPGg==
X-Received: by 2002:a05:600c:3555:b0:4a1:d52e:c2d9 with SMTP id
 5b1f17b1804b1-4a1d762c1bdmr1180095e9.23.1792163040303; 
 Fri, 16 Oct 2026 08:04:00 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1c8a81587sm127649575e9.1.2026.10.16.08.03.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 08:03:59 -0700 (PDT)
To: buildroot@buildroot.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 16 Oct 2026 17:03:56 +0200
Message-ID: <20261016150359.67190-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260928074641.1017968-1-thomas.petazzoni@bootlin.com>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] utils/docker-run: add NO_NETWORK variable
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> It is sometimes useful to be able to do an offline build, to make sure
> the build works properly without network access, so this commit adds a
> NO_NETWORK environment variable to our docker-run script, which for
> example allows to do:
> 
> $ ./utils/docker-run make source
> $ NO_NETWORK=1 ./utils/docker-run make
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  utils/docker-run | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/utils/docker-run b/utils/docker-run
> index 27c169db72..60a12455d9 100755
> --- a/utils/docker-run
> +++ b/utils/docker-run
> @@ -21,7 +21,7 @@ declare -a docker_opts=(
>      --user "$(id -u):$(id -g)"
>      --workdir "$(pwd)"
>      --security-opt label=disable
> -    --network host
> +    --network "$([[ "${NO_NETWORK:-0}" == 1 ]] && echo none || echo host)"
>  )
>  
>  declare -a mountpoints=(
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
