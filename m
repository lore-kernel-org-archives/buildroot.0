Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E79BC5B572
	for <buildroot@archiver.kernel.org>; Sat, 22 Aug 2026 12:05:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B0CD60615;
	Sat, 22 Aug 2026 12:05:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qURIeJlxXKqo; Sat, 22 Aug 2026 12:05:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787400330;
	bh=2BLwytjfi8znx1bakI6zPfloJuewrDgewVmbwnj0JzI=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=j/lUfhjjg+wefFzCxA6v7zZC4O6hhjlKlmyr+M17yu/ncb7OW6WBcYyERfKwiQl7S
	 jDqRQXrc//+Mm98D4wvcQTdt96wBUN+BUrOOsxrm8O28+YJUgacdlwyF2hHSujXr8N
	 dptAWyvYuFfRy8l8xUqCBYmcQlSZbLBxnfqf1c6vwzx27vAsFKYv47AsDQ2iwvJOSg
	 oiDs74JHIBq83oOJ9TIsaFjEv6BKHuZ5zPyBdPOQ3N9bpVYc3Oe2HM8d/nDIdAScf6
	 wUezD7jq/LtXVejqaHd1Sj0ewoSWr3JeoTQL9EDNqYiG49whe8ehmOv4+Y1SAftDBa
	 u2LvabX4r85TQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 956AB605DB;
	Sat, 22 Aug 2026 12:05:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id EB042476
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 12:05:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C897440073
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 12:05:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SMeUQ01gWftt for <buildroot@buildroot.org>;
 Sat, 22 Aug 2026 12:05:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C01284005F
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 12:05:25 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-6a41191c9a9so3915768a12.3
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 05:05:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787400323; x=1788005123;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=BEv/MEPd4R+0YlR7cjrbbrcGRF0jKls9C49wzdxmy0k=;
 b=JxLf2hIFhVQK2W0lB9nadX3K3Q0fffVe0y+1ya0jYZ+31+JoGFW2Gzi5CUm7hKwD8o
 FrlcK+dmCDj2JOuw+I88A5kyYLs3b8WyQdUwZbh0XwQ2/bf/nZ/N48YJuHD7e29ttF5n
 RaEkDNubWArT1fMB82ZdrrFlxiOzrMrtJu1jOeYffRkuLwWEb86Ouw0uAkcqvm3BelQx
 EGjnFymYGysn5uQRtEp9xFa1wDN06d5G7JWGS4VewuyqkVJ0c1m8D5dqWQzCm+X2CCSc
 3zof/tz+BQjKlJ9I5gb8lhPczBGbXWIqgNlIpXaovJQzaIkPzCFcD/2QbUmGB+lDmBfA
 Zxdw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq24MbfhCmnNUYEU1kTyPLU+JBL5AOZfZwz3XL5nlPDoyaIzbLROImeadAJQDLADAo6RxAnDYspiNQ=@buildroot.org
X-Gm-Message-State: AFuF++nZ27TH+N+wUD9lFiKV9fDvE2n5W+do6jUzuPqyy2B/0wc6ybAA
 OxRQ1oRWpkHj6lxRNhqBrRqRo2q4iGTiu7nJBS/nCOQiD3GNWke6uDRgIso5wxSltiy0SM51eoJ
 epvxj
X-Gm-Gg: AR+sD13WreU6lZFi9VTmkLa9gbx+VTSEmJjnyD7/ZQctQlJkmHSvgNNkkkFY5rVqL5D
 7I2TPInzCV4Uij0+3FKpTs0mgX1KLSxZuf0cNWjjfEXlqgoc0NT2Ma56ZQDvKjHbTFzyIUc8bl1
 8nRRqr7nd5L3cOciJxLSyzYW9wpzVRF4jcUSaTWnatdDWJ7QzicvWM8eIdmvbdy2E7Qq/BfvTv9
 Ez8rdqW7u+9OfBhgf4jVc2Wr3p/Nk2DfRQG6OW9OFrQNHRrojnj7na4hDkXYe+6bbMGpKocm+l/
 6rntZv4WpBTRp459NZgjVv7MJV8iHl8AQZKlAoXkvHcU1TPaK4wk5IBzNzoTVpOTAOpgqCDbZAI
 m+/CkeBOtb3LrJIUomVXeSKpuRHhDhwl0UzEcxs7ULpCzKf3yaxzRhAsm33BEQAnO4uba6DGs2F
 u9uGzBRBMM19S5SuOrwO/8hlTX5ed2iXYpK0WiYfiCMOEI4JFaUNmcTzivXD/7/UyisOqm5ulSJ
 1XrtBNBn2ujebfHaVaKMxaZYUgss0dmfa8RsJp7QwtWIdh6J+TqUAdZWnw=
X-Received: by 2002:a05:6402:3647:b0:6a5:7aad:e75c with SMTP id
 4fb4d7f45d1cf-6a57aade7fdmr6602135a12.6.1787400323487; 
 Sat, 22 Aug 2026 05:05:23 -0700 (PDT)
Received: from [192.168.129.33] (154.186-200-80.adsl-dyn.isp.belgacom.be.
 [80.200.186.154]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a3feeca188sm12048195a12.6.2026.08.22.05.05.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Aug 2026 05:05:23 -0700 (PDT)
Message-ID: <679e5d44-ecc6-4332-8532-efb286245e6a@mind.be>
Date: Sat, 22 Aug 2026 14:05:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>,
 buildroot@buildroot.org
References: <20260810084351.22262-1-nicolas.cavallari@green-communications.fr>
Content-Language: en-US
In-Reply-To: <20260810084351.22262-1-nicolas.cavallari@green-communications.fr>
Subject: Re: [Buildroot] [PATCH 1/1] package/libgit2: security bump version
 to 1.9.6
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 10/08/26 10:43, Nicolas Cavallari wrote:
> v1.9.5 fixes CVE-2026-53586, CVE-2026-53587, CVE-2026-53585,
> CVE-2026-53584, CVE-2026-53583.  v1.9.6 fixes other non-security issues.
>
> Release notes:
> https://github.com/libgit2/libgit2/releases/tag/v1.9.5
> https://github.com/libgit2/libgit2/releases/tag/v1.9.6
>
> v1.9.5 also replaces a bundled vulnerable libpcre with libpcre2 and
> updated the PCRE license in COPYING as a result.  This is mostly useful
> on Windows; On POSIX systems, libgit2 can use regcomp() and Buildroot
> already asks for it.
>
> Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>

Applied to 2025.02.x and 2026.05.x, thanks !

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
