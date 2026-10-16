Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CB16CC6B38
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 15:01:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1024040A0C;
	Fri, 16 Oct 2026 15:01:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f7YF-aX7hJmg; Fri, 16 Oct 2026 15:01:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 2BF7C40A24
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792162878;
	b=PS/vwjtOUZR+pBP5EJ0PkwNoil7H+wDAaiAhpdIJuV+QjjQkI8o/n8sMHYR01RYluNVB
	 5c8zPSjUT+IAw8yzb5Q6c74dOVI1AlXv3FRsLtBhqkzb9lcHRCAiVwGvn1zqHS0fbUWwP
	 uFc3BWMXFTqnoo1n/nBpalFLb1+mDb6ayE2Oo01cmNMH9lOczksu5I9RHQKtMYUUrK8yS
	 522+suB6NOj5j9ukTC5L0ODj5tJGCbVoGkRu1XItBEGxOYdBNQ/ZHR0Glld13PckmF8fh
	 M29dZ36ewB/NyQmd6P9lfudIJCgac1T7zRIuHkemBXvYRU+RwgGAtRGRbzLlN6QWrtw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792162878;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=YFsSdU4mvvmeOaVwPW+98hd07zZkc2vcs0cbw/f/wvM=;
	b=mWg3ZvRenk8iesIPEf57j3nnj7IxvVUVQM6iI2J5KhMU0n4RMY7loeqroqNMaHM7+SvR
	 Sn3g97V4EWedO406tOrHo+PqXywJZmeJ6k74Q3EcLd8bg0cCKS2HWjHC/jufUqTh5qxYJ
	 31L0rzm7jjRfGNy03lBbmW9gb5w1iqrIGq787fgg03O01Dw46AEA6/cboMeviqpA+siso
	 Oz2xipZpFpH2nlHSPF9BHddf+oz4gTMv+QHj56Ruql+6IIiM16G+osMbt3UJIa8EoYfxQ
	 kLTsA7k2CpQW/d2ng+rsxydXjkybaK33MprzXWTr03Gt4KktjM4a5wnmsE454At5IGw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792162878;
	bh=YFsSdU4mvvmeOaVwPW+98hd07zZkc2vcs0cbw/f/wvM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TuFY6VGL8klM4TfLzZFQag0IUdgbD6OwWX3RX4Vk6Z2mftAYIYZd9hPnLkm/M5YTr
	 yHWw7b90cyop1PfOIK0daSDdGpktkqRtawTJqOuKNr2mVDrF8NyRLQEutunj+80nEr
	 R1E/ChS8vRjnkviCVshu6+doK+tavQL9wR5WLvFgRyylevxJso34+yevhkubKIl0Gg
	 iy2+Vy9780yY/1OA33k/UzVGc7cfUwLQYahaPqpbFZrCAMgs7Ej706YnSLFeVNEXQV
	 CvqKx1QCDPVGhi138GobRLUbRa2CRW7POiTgEc4XHAqq1n437TIcrgEfOqaFwmXFJ6
	 9Mrc+Ttxzjm5g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2BF7C40A24;
	Fri, 16 Oct 2026 15:01:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A852A255
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:01:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9A62F40A08
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:01:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pnqiuYUulRKZ for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 15:01:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5D035409FE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792162873;
 b=QIU04159h9jnYJ3Xpf6W3mB0eExlhNr/AhzgDJN4sPltLAF2ATYaqllPyJJNYhiogEDD
 mQPYaOsY5v/XmQUb1EbttzNVA3Lw9hAP2gts67vqxsvwubTLg0eVwUni4bmtrJZFlw/km
 AsZguop0d5KiubYtWlBdQej/BuFLODCKqDGuU/K3zNK0CyEe7cmT4XsUvyQqoejM9eL31
 DauZtyghP7ZcjQLsYp7blbL0d0XsvEaENxaNfuDFm+6Pi7gc+9E0tlMm+adG/Bk3wN+kR
 xyr7LIyI57Sx7aODqVgo45nKZmH1VqGiu5Dp1XOuEOEdVuR8ZleTwMsCZSemhmF+mig==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792162873;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=x08TlKwdT3njWt3LGphoeRCHhF1SBKcRoARSteqDxac=;
 b=s1rFHf8CCZmK7RaAruYE7dlm/UanO+jfYqdiYYkPmEQgJSxmA+zmJH4O1VaO8JZfcScZ
 GgUy6JyrVlI8CdULnJPJH8l53a+ZRK4AqKB+DWM+ZV6WoKKajN+9pbbUbiiIOFc0sQw/D
 oq+p4Ws07MkiIfSknMekDbB5CS72W64gPiLaahaEMFqEJOmql/iKG5pqhjyFlFccqaRdE
 w8De+wrnJ45HZPlSRDEwqQ6bxHKkjXuJgmq5fF1ZCe+t+BQC5zcFqBuuq1wetltYjGFF/
 1oTx9vuXIJyzj50/7jkG8dXYvLFUXhcPLJ4Vk7LAJnrWkYJEkOe5j9NUNIOXdVxBQyw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b="SSz20/x2"; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5D035409FE
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:01:12 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4a021c809e3so618825e9.0
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 08:01:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792162871; x=1792767671;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=x08TlKwdT3njWt3LGphoeRCHhF1SBKcRoARSteqDxac=;
 b=RBsaRnsDwIMKL9s36pzf2SM+RzvOsMPBbE4C5RNVG3WTnhilJEaEb+qoCzeT3uyFhd
 8nXqHclpThNORBXFC7IjugmuzqLvOswPvV6wPP+lcfyhXn5zp0jfR3RiZWm6ryOWkcSC
 DGUyKaJY1M6fNTub7U+5TyxyCuEGtoRfTpn6F0iSj899I0BEBexLDScDeqLZPrtaKWnz
 AYZOqEDRWNKtJRNJ/6OG986lvJssnbcIr63tbRl+lfU/UG246xSUyAl2ZT3fxGv5jrB0
 dDeQQJDbZ3ndIwxcEqsSj1iBHU8VpBqnSlOJGcjZdQ2Hd1ARCPu//SWjf3Ty0U9e03Jt
 DR5g==
X-Gm-Message-State: AFq9FYIv/sAe3qsGZ/IPVm/KGvVU3knT8Mz1/WI+MWtMhvqm0R4gJPyi
 i5u51iAKb6zq+u8va9sKGnbeKLtIq7sSIP/PIYKeMQLRpZ1bJu6g3qg/1Dj6tY7rbC6tF5ruhic
 mKfy4vGE=
X-Gm-Gg: AYBFou3yqPzwURxVcyBR8wF7fRUNmzAhXTyeurMmLkfNe6yEbD7qKDWEuWjQTAtlhcq
 nDFHscESIKBb6/m0dN0RX6SUjPF5cjLsmSwZ9+sVEZrA1qGA3zgNg57tT3algPgTKTiu68pDqcz
 wpwLdglVNl/5V5NJRzV8r24fNlx5+iZZdqx1vJsf45DTqnQrJa8Si4WS50Og+taapPJVXtXOFW0
 YpiTJTyfMPhBU/+dkWIdhPJpTVcCtHnPRLopSp/6ICS6HPmGn1uTq6eI5BrCXszDc7x2io7DM0h
 e3Qv5BL5tTsqMPygxvRcBJYBtIsMDnWgGuccYNQCh4YpAEgcs6Y7fgh1K22WKSoIIUIAteRUL/I
 tYh4qpjWk24O93LwVpCXkZJfL9RN0qc0SUE9DKRCLXMqqX+mlqlEOQ3ixsElYLX4/hsNqgQlV50
 hRrKSytYdhd2owVrQGhWpSyY8sxF4osDYGCKrDJNNQlnrg0VgL+Z8oYrr5fpDQFXLAuU84xf+vW
 ZvjpRYbpsCJzwRl62WTcresDV+a1Q8PiEFdl5LhOQ==
X-Received: by 2002:a05:600c:81c8:b0:4a1:9661:14b5 with SMTP id
 5b1f17b1804b1-4a1d7616576mr1064675e9.29.1792162870571; 
 Fri, 16 Oct 2026 08:01:10 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48dfd5008e7sm5588160f8f.43.2026.10.16.08.01.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 08:01:09 -0700 (PDT)
To: buildroot@buildroot.org,
	Nikita Kiryushin <kiryushin@ancud.ru>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 16 Oct 2026 17:01:07 +0200
Message-ID: <20261016150109.59904-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20241122174608.12470-1-kiryushin@ancud.ru>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] docs/manual/contribute.adoc: mention
 mailing list subscription requirement
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
> The mail address used to contribute via buildroot mailing list
> is required to be subscribed to the mailing list. Otherwise,
> messages sent to the mailing list will be automatically rejected,
> as server only accepts email from mailing list subscribers.
> 
> This behavior is not explicitly stated in the documentation
> for contributors (aside from recommendation to subscribe
> as the first thing for contributor to do). This may lead to an
> unpleasent surprise to developers, who prefer reading mailing
> lists using archives.
> 
> Add mention of mailing list subscription requirement to 'Preparing
> a patch series' section of contribution manual.
> 
> Signed-off-by: Nikita Kiryushin <kiryushin@ancud.ru>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  docs/manual/contribute.adoc | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/docs/manual/contribute.adoc b/docs/manual/contribute.adoc
> index ffaff6f857..8de0520667 100644
> --- a/docs/manual/contribute.adoc
> +++ b/docs/manual/contribute.adoc
> @@ -375,6 +375,9 @@ $ git send-email origin/master
>  Note that +git+ should be configured to use your mail account.
>  To configure +git+, see +man git-send-email+ or https://git-send-email.io/.
>  
> +The mail account used has to be subscribed to the mailing list,
> +otherwise your message will be automatically rejected.
> +
>  If you do not use +git send-email+, make sure posted *patches are not
>  line-wrapped*, otherwise they cannot easily be applied. In such a case,
>  fix your e-mail client, or better yet, learn to use +git send-email+.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
