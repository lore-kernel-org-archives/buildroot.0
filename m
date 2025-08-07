Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 636D9C87FDA
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 18:24:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39CBD80D6A;
	Thu,  7 Aug 2025 18:24:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6fQk2h04t5Gx; Thu,  7 Aug 2025 18:24:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0495180CAC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0495180CAC;
	Thu,  7 Aug 2025 18:24:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 241724C4
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 09B3F80D7A
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mCoBhEW7diP8 for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 18:24:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0359280D7E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0359280D7E
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0359280D7E
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:04 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3b790dbb112so755323f8f.3
 for <buildroot@buildroot.org>; Thu, 07 Aug 2025 11:24:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754591043; x=1755195843;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oxRgViuGdfT5SGPMxX5B4NSZRyudJ6FHV7R+1OUlarY=;
 b=bHOeZY747fCearTqwNVGyEUDuHqs0jVwPLJX9MQ2qoS0gOUeHmVZENXFEuC+11oWul
 0oYMEWLHL451vvTA7iIoFLCtWG2/ee+d1hEh5WHh9QX8ivOb+s/LA7dM+E+DjT2k6M0i
 rlPiKbYIO0JYAe/LGki9kuYzHZ3p7OY//5FKGj0+NkQzuwNpKMG9zioA3lI8f7WKvdAB
 y6zp5+cKjRxTx9M444hN/3kC4mJVlBDeLhEO+0hHNB5X9l/G73fdPO3HuEWgovvdbp+e
 rFee+CFRAzOtQHYDEohIwU+w0aVwNIy+qq90WskHi3qEBC94XBPNcmCRHUfgJ0+r6eVD
 MkNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwyLnfOcqGHL49lqhOkBl+ZziJT1ksLieDxHgoQ1i0kvyw13o6aMdlU5/EbGCFfPxn4U4rhtbgoFw=@buildroot.org
X-Gm-Message-State: AOJu0YyPHzNE9phYkw5cJTIWGIVa7NzwpiZueHmTJ7xWUdCMTDxlXGmn
 F46YAVZ7/9hZkFKqzRuXUauRMcyN5bIjnVWiC3nrpCgck6qogOZfZZjIY2dSzT/mOSWPGUoy/ME
 z9WC9
X-Gm-Gg: ASbGncvP1lFSywUx3Jxj/tHBatOwhqtViJi27aGl4MBKH1HcVKlWYLREXlejfk+3Las
 3jlpxJxg2LCmjAmbhT18Wcc1cbygxWdXOV5aW4HZ9U4wA0xxZj8LCDUtaf0qiL5N/nwsl5G8nSH
 4XPvYLeX0QKrLm99TdumMkJXeZ8+Xx2LyO9b+2caw4GAfK/MDtdGRiPDZQtBy0nyLXFTkRuOit4
 6d/jumJ2FB1nFTpN/ykWAC9nbpzDIEzRbAEUSVDH7eDUdVEnnao+wLRcuS+jW1IZGM3heiEVx5n
 6P2wbCYR7AF/7NvIa3fCdx6Jce8EBNbSZcdD23rdCb9WrXpNwQh+DZLfwA31JBlmpJfAqoCZCpN
 XzUsW1zu6cDCZZvUKRxJYL6qX
X-Google-Smtp-Source: AGHT+IHC7hnbn7N/jNul6lRlPmwbn9RXoihc7kbYjKkgUeEOpTuUORYCg/SMvQXfrFCuZXI+mSuZYA==
X-Received: by 2002:a05:6000:4020:b0:3b7:8914:cd94 with SMTP id
 ffacd0b85a97d-3b900b55103mr214942f8f.41.1754591042805; 
 Thu, 07 Aug 2025 11:24:02 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b8fc6ef28esm2889799f8f.60.2025.08.07.11.24.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 11:24:02 -0700 (PDT)
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu,  7 Aug 2025 20:24:02 +0200
Message-ID: <20250807182402.724236-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250715112951.1211144-2-buildroot@bubu1.eu>
References: <20250715112951.1211144-2-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754591043; x=1755195843; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oxRgViuGdfT5SGPMxX5B4NSZRyudJ6FHV7R+1OUlarY=;
 b=Y5uPvIK+QJC+dkyPcUDPf3yJZFMK8zZesTlw3OXu22+oso5S5FXAZCK+kqBHfyg7OX
 HQKE0pawRP38tETcyFJqAib+3W7XZ5qjTbG6x+zj74bP2jKAxsG0t7SY66tKUzfIJChn
 RDUTQAPqGGarAYF7tT9RUknd3nEN9VRiWOpLk/5igexmQnbctSugZLTreX6ThjbS1jK5
 tobvqIKHuRsm+N8y7H806w1XP1SNzrVy8B9zzyDw/Rq1C/HwOgfvJcbbkp6F2Uo6tQao
 dHkRYHUMues1m1ieqirTxakyGeyJenCVDlVMzutLlH5UTZNXtZkWdYC95BgDHirrU3Fk
 rjnw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Y5uPvIK+
Subject: Re: [Buildroot] [PATCH 2/2] package/python-asgiref: switch upstream
 URL to https
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
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  package/python-asgiref/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/python-asgiref/Config.in b/package/python-asgiref/Config.in
> index d0b816c369..c56de97e6b 100644
> --- a/package/python-asgiref/Config.in
> +++ b/package/python-asgiref/Config.in
> @@ -11,4 +11,4 @@ config BR2_PACKAGE_PYTHON_ASGIREF
>  	    - Server base classes, asgiref.server
>  	    - A WSGI-to-ASGI adapter, in asgiref.wsgi
>  
> -	  http://github.com/django/asgiref/
> +	  https://github.com/django/asgiref/
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
