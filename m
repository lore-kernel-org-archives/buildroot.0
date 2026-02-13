Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43D7AEF99D0
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:41:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 183E361414;
	Fri, 13 Feb 2026 19:41:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id StwBvXxodugQ; Fri, 13 Feb 2026 19:41:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3559F61427
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011684;
	bh=lQBJANIbi+bLKOPI44HC4MYsGu8Wslmnc9+p7R0PSYo=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kW4DVOn8t6zgpb2yS7eLEhGMz3hVfNL5BgLQN9dOwyyNJ6xV8j/E6y/8iQDq5XHTX
	 cBrj5bAn+Q2gMXdaCcrmAmMvHvtnjnqr3OgETJ8XNHCoX9z1NUluti3MhH79Za5mwz
	 W1wYAQV6i9Ir5RgbuC7DEFNW5rmXNtTM3owqqWUmy7ren+gutnVzUx0XvCGejlpBrA
	 SOvKAh/oo10JScVSmUml/cYzoFyCOGu84vDlrQ0TxQOmhiPIbxw8HfqUXfDcSSTWrv
	 ry5SgjdPKHzTudqT+s0XQ4E5h+1W/FvtowY5zV5B/ZehSndelwI8B073LnNB9TpjZp
	 6VRBOPIeAAf1Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3559F61427;
	Fri, 13 Feb 2026 19:41:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D8F169
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:41:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6F1034090B
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:41:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VfXCXJALfwCh for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:41:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6848E4085E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6848E4085E
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6848E4085E
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:41:17 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-483487335c2so11620445e9.2
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:41:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771011675; x=1771616475;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Q6wA0EZYgoXQQHICczZQcdvoo9b35R2IoEPrDjDXHGo=;
 b=D0kQCCQeq4/ibPeRu1Hwej9e5cmTDNCIpjHeJcxYs2xd69wkeIR1dkY0iJl+0mnUIi
 wDNRAZk8mXg1gLiRHzJTq4UogFzZY+KOoGOVn+vwG0l/mc/zJcSYMr0VJKgjGwrGSooi
 sP23xFHPnHszWxP28crr57brKrapN1A5kEWIeR+dktm+/NfhD8K0jjFcipoOx6fEnAWt
 BdqwtfYrzWu29M0GbTGW5O+CsnsAsnVnqfgzfjsQHV5jvtU5yZK656D7d52FG4QewKaL
 mR62UFNlFVGpRApO9YvWinKrXdW2AN1wxPo5dwrmu5GC0cKaih9vsihiuIMfjz3MvXPR
 XrkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCULrYyC81edLKxFkRYwo+f74sLFAZ3vRhJn6nWkuOxb/kly5/4EpyBuLqz72UKcwmVUB/qeW5Bzd/g=@buildroot.org
X-Gm-Message-State: AOJu0YykjSC2MyQTWfyyy8D25EhdUOCVOnG3ttl5U5lm+/u5DbG50grH
 2noQP4OT2WUZYjWCib+Nx2YHGJ9N6Uq+L81j8fD4IrLRYGKYl/6B6459Iu/nV/NiCDs=
X-Gm-Gg: AZuq6aJgKotMDVomJNXhIpm6cl4NEjKGrrGXtk0g8YYyAesmEf7dNyTBkDLtSv8Ajoo
 YcgonzAs20vVQkQjGfKvs7FU8634tNxbzvvml0C/D+msnG0l3uadICCY1lWAvrJFxLy9/qRciJM
 Sb9Pos1WsERd0c5dEhYo2YusjaakBqkWWMSxF4rRXv+9/bjFUuXY1BFYXqQJXDi60Druxb2JIoW
 jotPKibCUOWdASOHmHhcJA/yIw+252TrwqmdsoWKb+0BiNn3Ua+gc+pjJxFyPXfxLwl5m+4As+F
 pfRC5ye1DcVzZudPoYEOOcYRt1wBDZAi+USh16zEaLL4otnayAMhOlbFikuBwyZnfCmANfyxiu0
 XamnjGqMe1IzOk7dgmvihsFNXiGJ8x2bFv3fLxjYAL19Fj9dhXmJVuWNKIfmdXVP16g3Qf5kQAR
 A4aLODvB4x7+9VVTs=
X-Received: by 2002:a05:600c:8706:b0:477:73e9:dbe7 with SMTP id
 5b1f17b1804b1-48373a58a97mr44831835e9.35.1771011675432; 
 Fri, 13 Feb 2026 11:41:15 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4835d99e194sm168274505e9.8.2026.02.13.11.41.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 11:41:15 -0800 (PST)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:41:14 +0100
Message-ID: <20260213194114.48752-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260204135639.2603782-2-peter@korsgaard.com>
References: <20260204135639.2603782-2-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771011675; x=1771616475; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q6wA0EZYgoXQQHICczZQcdvoo9b35R2IoEPrDjDXHGo=;
 b=S5J5eIFVNHuQjn/iQyRHK3QcH4pxMVgovDbxfjbM22bu7ji97JFICplvqlnJK3aTZi
 8JlOtq7zDvfbOb/mZ8GsL9eqWhxujTolhFaqL76wzS/YrsoLZvTuHWWyaFce9GKq8Vod
 kn8N8vtlztoCnirPVEGWiheEKWXVxQ9pDbIYufjiOesMtU562E/SKgZfnDNXzgX+W+/K
 NrMDWEgxkNR8QAKZAGOUWWuX28rtzLPLP+HUUGjrXp3imUu1XRUdo/J/Pvnno5573Emz
 mKoDk/bZOWLA6ZFSG1mWQFPpwOpEC1srxXLwNRUzZXm+83DaUNEek64ej8/yYXye2v+n
 cpwA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=S5J5eIFV
Subject: Re: [Buildroot] [PATCH 2/2] package/shadow: ensure that SHA support
 is enabled when requested
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
> Ensure that the SHA_CRYPT option is enabled when the system configuration is
> set to SHA256/512, as otherwise passwd complains when a password is changed:
> 
> passwd
> ...
> Invalid ENCRYPT_METHOD value: 'SHA512'.
> Defaulting to DES.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  package/shadow/Config.in | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/shadow/Config.in b/package/shadow/Config.in
> index bbbea811ce..93216bd14c 100644
> --- a/package/shadow/Config.in
> +++ b/package/shadow/Config.in
> @@ -3,6 +3,9 @@ menuconfig BR2_PACKAGE_SHADOW
>  	depends on !BR2_STATIC_LIBS
>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
> +	select BR2_PACKAGE_SHADOW_SHA_CRYPT if \
> +	       (BR2_TARGET_GENERIC_PASSWD_SHA256 || \
> +	        BR2_TARGET_GENERIC_PASSWD_SHA512)
>  	help
>  	  Utilities to deal with user accounts.
>  
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
