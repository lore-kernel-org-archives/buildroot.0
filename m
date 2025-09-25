Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46C3ECAC5B5
	for <buildroot@archiver.kernel.org>; Thu, 25 Sep 2025 20:16:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F85C411EC;
	Thu, 25 Sep 2025 20:16:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KdkJciLISOUF; Thu, 25 Sep 2025 20:16:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3DFFF411EF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3DFFF411EF;
	Thu, 25 Sep 2025 20:16:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C6A6F12D
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:16:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ADA7341275
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:16:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ejXHRTXnm2CT for <buildroot@buildroot.org>;
 Thu, 25 Sep 2025 20:16:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9DFE74129F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9DFE74129F
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9DFE74129F
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:16:42 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3b9edf4cf6cso1461443f8f.3
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 13:16:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758831401; x=1759436201;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Zs+5eICMtp0tQzux4SbErylkCZhodcdTzAX4QAKo3A4=;
 b=s38uLfePOfKksStsCFx1Wttt7ieXjrtgZ76OKjJYj52qEzrzo+F4Ub1vaxJOTpkcxt
 tbUeyHoc9iunej1nZNKc1fhOEeaKRtKTzI7ZWdQ8pSDk18GJd94xIDg3Hl5oXiATpinj
 Cnbm5ZjRCZT6pAwIb8D5yB6HmNFYXt3ckAJdHc0MrsczdMHDbBd8N2TU2XW/eWH3+E2K
 80MYEb0a3KPOopAUbF69v8Qw7t6s68FAWLL9dTPQezYAENOyE/AjvC4aTye8A8j5Qtyf
 oVn0kzZTh+sIr2IZIyF2oWFgO5CVuemd7XoXb2+MHYwf1anb/cV3xr/BkMGWDLt5vu7x
 fA3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3I2eFsWY/5imm04dXK5i8EV/S8kGYw1MwOfPgMbawswQpwqL0Wls+HOcDXN7GDuf8OcDELAzrhY8=@buildroot.org
X-Gm-Message-State: AOJu0YzZoJhlHg/IOsWdGv9/K2GpG+/K+kt/htaRbNg5wdiC9IlFrMsT
 uu18CbQRaT/iB3r2X87QIMy08G7KVeyzvmGyCBZ1cVyTZFsba+zKz2uF0J7mgijckGWVIZzjraH
 OVHKCQ9A=
X-Gm-Gg: ASbGncsiYsEuxcIRzqgy2EMMxDBWm4XYcAr0lKwkl1Dd2ObSJDLLWrtn+tmCaOM2Gk6
 AE4mHdZ3/c2RPEh2k4bbzIek9tW5hBzCXC9tGVoon+/O9r8vh8obCPeglelWXsGRflWn47iUL2o
 58+c5oNlYubXdX7XyH1NUf1vz7rkxGUGQqmDGuDCrqa/BDLlOgXLBRhHc7axV6qp9qNry6GDk0D
 whjHxh/Cu48DzBPEY0jovhHEysQ0CCpiQBV+DdZMOmDfXhVUM5PK/vTgYYGekwB+5StcnFy/sZ2
 4ymOm+RUZm6ByTLfzskOQYq/4x5foYi47/z524LlU4/mEWnQY2zCIkT6YBaDBt55BxlEr1bXqAt
 lyQANCxkfoaY0wt4=
X-Google-Smtp-Source: AGHT+IHF0+82xzOEZrYLHnCRTCXp0gkPKfkQcep0tq9GTOZn56uAN0sXfVBwWgdn+QdYBW1JVRannQ==
X-Received: by 2002:a5d:5f53:0:b0:3cf:74e0:55b9 with SMTP id
 ffacd0b85a97d-40e4dabf2a5mr4424711f8f.63.1758831400567; 
 Thu, 25 Sep 2025 13:16:40 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fc72b0aeesm4301055f8f.49.2025.09.25.13.16.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 13:16:40 -0700 (PDT)
To: Julien Olivain <ju.o@free.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 25 Sep 2025 22:16:39 +0200
Message-ID: <20250925201639.43175-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250915185448.11118-2-ju.o@free.fr>
References: <20250915185448.11118-2-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1758831401; x=1759436201; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Zs+5eICMtp0tQzux4SbErylkCZhodcdTzAX4QAKo3A4=;
 b=N2yJMhRuMebMwwTK4S2H5UXeTSSioYVy3ocxJTIZRlypvVuOoHKboFMJnG7rDv6B7m
 C4whCielNd9yschW3ayWfaaCmB3A/jei9y1XrBXD20dOMpQteul24w1imSDWPXhEReX+
 eN+M62jT2nUvRAOnto8KZfxU7OMmd1neap09+ER8/ps9oNFre0lG6ocnaSBP3mcJjJKi
 sG9YCdSnQ+cnAOnE3vw3SObNg80AqIdJRq5kfGGbGA76WyudIpYuvXyR6FgdMtZ802vR
 IafYnoC39rg+qOrEkZMZj58582EX0Ag7lvagFKbHgn10IkQ7eyYmXT3JKwfQFZTrV5jj
 i5SQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=N2yJMhRu
Subject: Re: [Buildroot] [PATCH 2/3] boot/boot-wrapper-aarch64: add hash file
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
> Since boot-wrapper-aarch64 introduction in commit [1]
> "boot-wrapper-aarch64: new package", the package never received a hash
> file. This commit adds it, including the source archive and license
> hashes.
> 
> [1] https://gitlab.com/buildroot.org/buildroot/-/commit/7689b72e00fd4d8c017880004e83a1c79144ab7b
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to 2025.02.x, 2025.05.x & 2025.08.x. Thanks

> ---
>  boot/boot-wrapper-aarch64/boot-wrapper-aarch64.hash | 5 +++++
>  1 file changed, 5 insertions(+)
>  create mode 100644 boot/boot-wrapper-aarch64/boot-wrapper-aarch64.hash
> 
> diff --git a/boot/boot-wrapper-aarch64/boot-wrapper-aarch64.hash b/boot/boot-wrapper-aarch64/boot-wrapper-aarch64.hash
> new file mode 100644
> index 0000000000..427653d55a
> --- /dev/null
> +++ b/boot/boot-wrapper-aarch64/boot-wrapper-aarch64.hash
> @@ -0,0 +1,5 @@
> +# Locally computed:
> +sha256  faa2843eaa3bc219da5ba9f69c02b45081a7634038faef5cba216d5e927ca2be  boot-wrapper-aarch64-ac6742520ded1da30d500f74e8affe86e27cabd5-git4.tar.gz
> +
> +# Hash for license files:
> +sha256  bdaa479b497358151fc1166dc75a613e68321320b945e92ea07a4b6dc9a63271  LICENSE.txt
> -- 
> 2.51.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
