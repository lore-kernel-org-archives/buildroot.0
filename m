Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2796CA0EE4
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 20:32:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 731FC80F1A;
	Thu, 14 Aug 2025 20:32:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fVumJt3m4BQ8; Thu, 14 Aug 2025 20:32:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5544C80E4F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5544C80E4F;
	Thu, 14 Aug 2025 20:32:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F2011BA
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:32:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F380660810
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:32:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WOaxXBPJG64p for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 20:32:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0E61D607C0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E61D607C0
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0E61D607C0
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:32:20 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-afcb731caaaso187737566b.0
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 13:32:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755203539; x=1755808339;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z13OSsQ1NzX0UITw1fsWdz5aSkLdPxc/dS5sa+iMyOE=;
 b=prfIUCgLW1oBAzurGm034Zl++BvAtnrJKTl0/eXMHWfGOQCPf4oBkwLcKrI4mp+v7N
 X7l9vuOtNcfPjuG23mh4LzwDiSjn3xgZTsQ9Qbe2snpFlm9B7Tp0qSH62TL+BVDzCcmu
 jmdnVc0fTPDQ248CsQVqdgTIbOIUUWlZO7ykau6HNub1RpSeha/EKETLxKt4vwNx33Bp
 sKVBMFgwt6SCUa0hGN+W5wsRDyGvByGlIcQNN7YnRw27eLqLjHg7ieWIFiuHh/Kyim9i
 fkGXk52IzDRxkKV5Tqg48R5qWbW7dkUSVguWf+ODIeQAEYw5vsop69alZxsUhVNC7KNO
 XhBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJ69JjWAkVlb017SPYjY0PhBlPWaauofYXB9YHmdTV5qJ6rL4xYOwVctTNj102u85W3EA0+ECDAe0=@buildroot.org
X-Gm-Message-State: AOJu0Yz5m1DZAyR3mZ4fzlYhlEDvDmTaq115anmc33jYe49ou6g4z3z+
 r+gXXFrWI/K2m/bE+Cvsrk4PaHI8riePDuXQe9/97a/r7KeBH+6CaiG3lFNnBqkssls=
X-Gm-Gg: ASbGncsk4w3wEU9VxwRSNnButFr1giMcluyT4TYGo97FJq3y9nGoQ4r2rjlXEgwjBXk
 DfqQCvX5Ev+3iQy7zAwj7qXkMO0bK2pC2z+Z+zF7mxTeaVjCTMEaPJe/+Rs97R7xls2mCNbInRM
 xPzlVv9VxAxaC5h1FS4RGzwhTgefLPtdmsCdfU77QlyR6vo+bS+uFgtexszvRqMe3/5NnSBFd2o
 +Nvd0q9o2MZ/uIWy2N2lMaRGoaQ6p/WCGuXiqDwfxP2HozZbIkjD967mj8E2upXt7q1F23J2xct
 YV9sjq89SVJQIdIRV9U8E4ygRtj636pc9Na+gRKNa6cGMsqc7/FeTsg3gACq+0c2Vb/OuPEkXOd
 I2ElXJt0Jx9cHvA==
X-Google-Smtp-Source: AGHT+IEL2Aa2Y7nb2ZL9Hp1hgz4IIM5v2fwXiuCQQTdfY3yx8wPpIViTmXbQqDxqIjo0pH1VpPtmUA==
X-Received: by 2002:a17:906:4795:b0:ae3:6655:410f with SMTP id
 a640c23a62f3a-afcb9356c49mr455949566b.7.1755203538937; 
 Thu, 14 Aug 2025 13:32:18 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0df10asm2651702666b.59.2025.08.14.13.32.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 13:32:18 -0700 (PDT)
To: Thomas Huth <huth@tuxfamily.org>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 14 Aug 2025 22:32:18 +0200
Message-ID: <20250814203218.2817043-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250810095425.9828-1-huth@tuxfamily.org>
References: <20250810095425.9828-1-huth@tuxfamily.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1755203539; x=1755808339; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z13OSsQ1NzX0UITw1fsWdz5aSkLdPxc/dS5sa+iMyOE=;
 b=hQ32aKqFD0w7QR/Pc1hcYj1UqY5tx4Wtpp7vMUXVFFCLw7mAut598BxxKxAbXYvGXC
 ZdoF4zSNiVCRRuYRtY4ZKXulc2vBY1ApRCojr7UJPlcnHu52ii0o6T3us58EW8A30bGc
 wu3o+kUzQ4d3er6r2bvGqoyHE26fgBXVbClML/meJUj709K6YhPH31Iy9Vs368AiUCCw
 TGmRTugcwLHcoSRAvlg84bxhFFP9QCQl8HfUIbgOWToo7EogZGoRKVMUXTQaaW8/aqNs
 YsEJGbJ1xvW57wTnaBShV7ONwGvcOz5LVQb093QN1StsNjihGM6NNpb+hnPn0NffA3h6
 SWWw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=hQ32aKqF
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: Update email address of Thomas
 Huth
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
> Since tuxfamily.org is slowly fading away, update my mail address
> to something that is more future-proof.
> 
> Signed-off-by: Thomas Huth <huth@tuxfamily.org>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  Note: See https://forum.tuxfamily.org/post/3399/ for the info about
>        tuxfamily slowly going away
> 
>  DEVELOPERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 12a41597af..a28f3e8d57 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -3238,7 +3238,7 @@ N:	Thomas Devoogdt <thomas@devoogdt.com>
>  F:	package/fluent-bit/
>  F:	package/libsoup3/
>  
> -N:	Thomas Huth <huth@tuxfamily.org>
> +N:	Thomas Huth <th.huth+br@posteo.eu>
>  F:	package/ascii-invaders/
>  F:	package/kvm-unit-tests/
>  F:	package/xorcurses/
> -- 
> 2.50.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
