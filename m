Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE1D1EB28E2
	for <buildroot@archiver.kernel.org>; Fri,  6 Feb 2026 08:12:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B62A612E7;
	Fri,  6 Feb 2026 08:12:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pM9XxalV8vVn; Fri,  6 Feb 2026 08:12:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 037C5612C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770365557;
	bh=f84hvRSMajWUv1XzPhcf1p71aUXJ9L7Q6QFcxkb2jTk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qmXuGYTZCVLptiyk0MCBWlqeGLYfjpcWuJRQLcrddT07cCFzZ5hWfXwvPDULJRias
	 allv62KqwIcgMBosCsN/tf2QCXL75Di3MoOqE5KPCjoUvrF8nLzi0TxOajO4XVOP1w
	 XW8k3+5yXLEL6/4VNUzH8Sekcxc1cmrA6UA7D5nrRZBTgN5XlqUjMl07a0CEO/xZKT
	 RwaVy3FFcxAIVHp9GTy8hkXejUXu+S9AEucWshjMvx2TeUj20pjVHFZ3ocBhaWdY75
	 aNX6ti5XgNSd+c4Y/3RXRtsYvBYE9k1Tee+qrOwgLkykf8WRGhtCRnzMQiDrZCw3+l
	 qhJ62hAtHQ3/g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 037C5612C7;
	Fri,  6 Feb 2026 08:12:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id EC623173
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:12:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 009B1834C7
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:12:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8SETW2zVMZl5 for <buildroot@buildroot.org>;
 Fri,  6 Feb 2026 08:12:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EC67A8403F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC67A8403F
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EC67A8403F
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:12:13 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-48069a48629so16565505e9.0
 for <buildroot@buildroot.org>; Fri, 06 Feb 2026 00:12:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770365532; x=1770970332;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=2zj5pCusbJnjoMjxiHjcxUJdkhA1uifP8Fq+5fDfenY=;
 b=oJeq4pgUnQYZy/tW0+q9OMxWpttbXbyIesC05L6SjRPLVGXzm9QZvRjpyqM8XvEVR4
 PNIr5/Po7qeKdSBaNeYt4f9oHvyfQdMe/e7igKWdszNswMA5fnAdKB3XSfqreHbm5y+U
 ijD2fE3CoO9cCVnmCmo3PcumNjTjdhUZRZEHNP2UraJS3wfOUmuU+BYbjWvB6D07f7Bo
 v4L+842lpAWZuR8O+YhpdzYE3UUUqrt7zvSDj1F8s3n8iUBpjDOE6/ggrAnpBsw9N0aP
 Ll4iALWE9m7WteD2lkisAfPxeV7Pl/FoULt/QXgkFRiTfq98/o8jMjQj42elYC+Bf05o
 dBtA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFHIrsHr1hJRzYf7DsQxbEfu4AKjtaLZU9U6BTeTW7goc7j9ToqFHOikUXvPBR91z1O6DqM5fhxMM=@buildroot.org
X-Gm-Message-State: AOJu0YzvJOgq4R5Ez0k6RlCf7pJgYoIZQoG16RkOvYjajXdqrMK85sA1
 ACz0JVCeGNTc06C4CC0AR2Tr17gH7S+/aLnUS/M/OBP3tNCJ4Wr3MZc1mTEekQtU0R8=
X-Gm-Gg: AZuq6aJzIw0UxARS6tQmJXjCZeJFiinxc0CsgH2UnIl5Yul6DJ+thftmqMmwrfLttwi
 rxop2daKv6msc00PARuz/b9FAjSF3Zf19rlpWnL7aIo5IP8jRz6Z0Y6uHIpDcRJbNlTydcISYW8
 f+A7wd+vdbMWMia5+iySCTli39vIWv/rclblQsk9ieU4+o0hid/r/js67AHzqm+Ci1eipKZzeqR
 3FoIGtemcCWYxPC10GQCDaRefTZ6noWoec9ZG5ZTLWAIrrszL4Ml0Rx1+Wv7JY2yYgQyV/SLVIi
 DyDK9TGq8AhMh5Xz8rYZqMDZAikDu7EaXoEqLydN1m7tSuR2pKnYQ4O/l/2HTYlz4jx0fF8vLJ1
 7MeHiw2sjt2P15eICWQualk9DOAyono6nV6iE0cMzaHUT5/oxUPIVRU3tS90+TUglzmAs7hlSk0
 nnVxEkOe+5PxPDZQ==
X-Received: by 2002:a05:600c:c84:b0:477:5af7:6fa with SMTP id
 5b1f17b1804b1-4832022120fmr23972565e9.32.1770365531867; 
 Fri, 06 Feb 2026 00:12:11 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4362972fa41sm3877866f8f.23.2026.02.06.00.12.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Feb 2026 00:12:11 -0800 (PST)
To: Frank Vanbever <fvb@funkworks.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  6 Feb 2026 09:12:11 +0100
Message-ID: <20260206081211.33411-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260201124015.29808-1-fvb@funkworks.be>
References: <20260201124015.29808-1-fvb@funkworks.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1770365532; x=1770970332; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2zj5pCusbJnjoMjxiHjcxUJdkhA1uifP8Fq+5fDfenY=;
 b=LjQb4lPrbrKhFVTd7gngokJfqizQZHBRou+CFd7pdHgfKXw2y+tRvagvppWADC+SNP
 Dx9RZcFccC5BeOgLn6clzx35Ejcxf6bPE69g9LnfmcGLXCjF6njO+Nb+kFN8qmPAZfsK
 xnujy1seVDy+7l77KwpXnB0JgP5w3hxWOSsACnCASPG6Cpld44hAPDXy7uRjnx+PF8kx
 gaBh2LnzX2TzrX7GLq1gGv9iC3eb43XQhnQeZjX9Q3qM6a1XDRQ6FdLuxxRQEHslq6Et
 h3xWC3K/GeYndol47B2pD04Asb94fLbK66P7BJB87089NLGAfk2v2+3RoNg/ZIeGjj+c
 otug==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=LjQb4lPr
Subject: Re: [Buildroot] [PATCH 1/1] DEVELOPERS: update e-mail for Frank
 Vanbever
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
> Signed-off-by: Frank Vanbever <fvb@funkworks.be>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  DEVELOPERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 08c98ec53b..aff26f8012 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1218,7 +1218,7 @@ F:	package/sane-backends/
>  F:	package/upx/
>  F:	package/zxing-cpp/
>  
> -N:	Frank Vanbever <frank.vanbever@mind.be>
> +N:	Frank Vanbever <fvb@funkworks.be>
>  F:	package/libmodsecurity/
>  F:	package/nginx-modsecurity/
>  
> -- 
> 2.48.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
