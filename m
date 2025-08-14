Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A878CA0EE4
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 20:31:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FBA780C55;
	Thu, 14 Aug 2025 20:31:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7IwDcgVQar82; Thu, 14 Aug 2025 20:31:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5C1D80DDF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A5C1D80DDF;
	Thu, 14 Aug 2025 20:31:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E70CA1BA
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:31:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CC515402F5
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:31:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mx5l2Hear6HW for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 20:31:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6F4D040459
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F4D040459
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6F4D040459
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:31:32 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3b9e414ef53so1196692f8f.2
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 13:31:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755203490; x=1755808290;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TyrTwRtd9lfKn8vMWKQTdkLISY64jWcy/FZjWZE5z9o=;
 b=H40xSyDqOvjX42tXxK+XQSLYAZriLV5tta4Wi2hsk+4fG3tAxt9ooDWoQNWBNAn0dN
 CjANwF/nmIE0d/SU0aFV4fMGxArtz7fz7KpL06y7H3PSJoGTMaiKmfX3IXi2ssF9cHeW
 PmwRszHW02lbiaOIZmnkW+VH+FoeQnj230RluuRjo5IUBhyAj7qkJ8dwkygcUJCoD75n
 PMUAqObbfhTNRw79OLJ1dYsplu47cZ1x1ga70EAZaQCycmKcu8DGWehQV6bIBMJJ2JDs
 V29AM+7mbTMujiyGQcDu824D651TmBu/QRsUnimXrwTGX/S53eoyZezlU/uUZJ0IsoDS
 ze6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIBkqYlLQHxqTz4tMZ8TYs5ewzDb4k+Q0jfOce4LYCe2ecyp3cIeh95VtQaIRJequ5A5qVA79aggA=@buildroot.org
X-Gm-Message-State: AOJu0YyI54qytgUsEeONkyS1GHqIr9I+lmR5+KGiK4ASrohSnGg95Wy8
 TSy8LWYTqUGSrFCE+gQTatGruBB3wVdUg/FDax4m5Hrg1YCeAeKNs1L945FaVOInK9RWJ2+6VgT
 z9v0mrX8=
X-Gm-Gg: ASbGncvMqv3qlZ87Gz+ETTux7YdySo90FqymbADKB1f/plvnAK7OUY9a12NItHGJ4tt
 dy8JCCuCqGosoI4kZL1BcGDF1mR6gYI7yaghZpDYbkUgKExLw7bWAzLJ/o4n4P59452ZqUVtKke
 FOcVIVDjmrKIwPTPmS/PBlewM7YT+egC8oviuQrcBAHQZxHUn4bzIj1FK7q5DFlVTVXV+eH+2D7
 4A8hKeTBnce+sngsJPVY5V8wnFUPOrM6O8JFkSbec7nq0jY/ExXsCRhrNoEVTEXiIK5GPZfM79h
 VHzXygpf2DuPpXmw050X9hy133ST90gAJ4BD7phV/b3BzJMDHHFEAl+CxUnGa36lKD3IR6RaLU6
 SuPCe49FvZokbRA==
X-Google-Smtp-Source: AGHT+IE6v5KPWZibprXi+E9/iSBcpw66roo9Lnn5U2yG6aZKkKafGjHoRvrzqRPGYRPHfD6zgI/f1g==
X-Received: by 2002:a05:6000:2410:b0:3b7:83c0:a9e0 with SMTP id
 ffacd0b85a97d-3b9e4189fb5mr4137358f8f.25.1755203490509; 
 Thu, 14 Aug 2025 13:31:30 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45a1c70b2c2sm35765165e9.26.2025.08.14.13.31.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 13:31:30 -0700 (PDT)
To: Maxime Leroy <maxime@leroys.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 14 Aug 2025 22:31:29 +0200
Message-ID: <20250814203129.2815002-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250806150636.20937-1-maxime@leroys.fr>
References: <20250806150636.20937-1-maxime@leroys.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1755203490; x=1755808290; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TyrTwRtd9lfKn8vMWKQTdkLISY64jWcy/FZjWZE5z9o=;
 b=cqoJhxL6Q/qyRjJJqex98hBBcU3aNbycCn8um+z9YiweKz8AkZEkF6/GCRp0xESE61
 15GSK0AaRaqYHJyw/ODy18GiT1eO9CUkbybl1qPOLTFct+g+0EKcNeNKnTLpIWmfTWWI
 Ji+frmgGPB2eTuTLMFwboy9uvAzwSl/z1jcTfnEVWkICFZEf82w4vSSP9SOoZaq2pFKF
 w7kZ4NKImNkoN5nW8evH8CGd4RhUAhkhtWgFLoW0dKGmrUGQnkhoF/NLLSxTco///Dq/
 +owwL+6Y48Y0Ey+rJt6llz7e3KS60EK+ZEUHfUHWmcAnypt6CiENewAgQZKqNyEIGY/5
 ts2g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=cqoJhxL6
Subject: Re: [Buildroot] [PATCH 1/2] package/grout: add kernel TUN dependency
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
> Grout automatically creates a TUN interface at runtime, so the target
> kernel must have CONFIG_TUN enabled.  Add a fix-up to ensure that option
> is selected.
> 
> Signed-off-by: Maxime Leroy <maxime@leroys.fr>

Applied to 2025.05.x. Thanks

> ---
>  package/grout/grout.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/grout/grout.mk b/package/grout/grout.mk
> index 46d3cf5f0a..53271dd913 100644
> --- a/package/grout/grout.mk
> +++ b/package/grout/grout.mk
> @@ -20,4 +20,8 @@ GROUT_DEPENDENCIES = \
>  	libecoli \
>  	util-linux
>  
> +define GROUT_LINUX_CONFIG_FIXUPS
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_TUN)
> +endef
> +
>  $(eval $(meson-package))
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
