Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98573CAC581
	for <buildroot@archiver.kernel.org>; Mon,  8 Sep 2025 10:55:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B9B584EED;
	Mon,  8 Sep 2025 10:55:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PGtzs4lUkm15; Mon,  8 Sep 2025 10:55:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB85A84E85
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB85A84E85;
	Mon,  8 Sep 2025 10:55:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 89EA2186
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 10:55:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8773E423C1
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 10:55:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0D5-BGMVJ6td for <buildroot@buildroot.org>;
 Mon,  8 Sep 2025 10:55:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9CD56423BF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9CD56423BF
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9CD56423BF
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 10:55:51 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-45ddc7d5731so14303435e9.1
 for <buildroot@buildroot.org>; Mon, 08 Sep 2025 03:55:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757328950; x=1757933750;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sNN8GYXGS9AtgCUkHwgEApkEusqw/Eb8s9gX0PqDF2M=;
 b=CIg96GkOhsG5QtJR/Snz6NTe2hb+rTZhZn5ddH6mZnJ3BmwKaV5ZVweAVfnSjd785c
 PsDXum8uN2g3WCNUQ9ZknM+w11XzLZ3LjnDBHq97MZLmvFr6mFtxLzECq+Ue5lt+ypcu
 RByjP8qe53h99sxzhD3zkLywedtkDEmIPkWcJ5e6eyYPb0crjwVooBr+vkimNb+nuZyG
 D9Sq2UD77ZB3R3nw/7k9/inPTmdoSkqrvgbmFkOR+w8m2n5+o0NgLd/AUTGnvMzmbsd6
 Qm9kuNMhxIIV7EXhWTt+Tnttv0rgktLPdh20rSpIs6mwFbqa2WjA4fAkCSjXDWt5rV9B
 Q2VA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUDJiB3ha6u8U6vXyZ7ZZEGQSWXR8DOQSFGNCxNJN1YDvQu7MIA4Qv9Ws23GE/mghZVRcccaGtQ/g=@buildroot.org
X-Gm-Message-State: AOJu0Yy+jD+9FFPtLS40bp9B656PaPjHENkhUgOf0Q4gND9XiRohC92s
 lEdzD22tJfxvae04N9tWg0ND9NjQopq4vHSRpanZf8/E98j4WYs2y65MyF9E3Y3zJFg=
X-Gm-Gg: ASbGnctf15eG67P/Qm5kJQKfIEPoD7FWt6iYqknPIifGCPlV6eHa9Z9E99yTlRCrTrO
 1otvlGQ+zAhOdQkaq92naulgExhzZXGN08x6URHAVXo6EM5CRVN49/Ld/xh1nS9hK9KJJys+pn/
 FUByT5wC6qy63QeuMijrOoI3nGiejHrF9xuKcwoi/sP0rKXH850gwxIPbzp/zu0757n3k/e8/TC
 QGBYwJqBzs2VUvcewVfEgDSolxrxTHsLEzN+8Hg9LWEK/GCqUOOCryjDEKQDOMI87NKnmqHxhPR
 XYMyck8J84y0lR4h9LvDkS9oAEEBMzssNH5VQjtzAgqdHMxma4TXQO3EdirlvuyhsKaXH0e14hp
 FAvrc9VaEj3pG7pn8ZEC+GZk46NANOxc+S0mXd1VnxnLi5Ok/q2r+6tsYasyIq83herZ8L7ZhNl
 pf5WuF6Z6rneOoCg==
X-Google-Smtp-Source: AGHT+IElW+UmEKwSbwuQOCywl8WzeYcQttCFc+kAxOgqKi4I8/qr9U1+s8lbUBSr4Jhh6voaDZOeuw==
X-Received: by 2002:a05:600c:45cf:b0:45d:cfc7:a16a with SMTP id
 5b1f17b1804b1-45ddde9222amr46320995e9.9.1757328949612; 
 Mon, 08 Sep 2025 03:55:49 -0700 (PDT)
Received: from sah2lpt241.local.essensium.com
 (ip-94-140-185-241.reverse.destiny.be. [94.140.185.241])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45cb61377a7sm232660785e9.13.2025.09.08.03.55.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 03:55:49 -0700 (PDT)
To: Michael Trimarchi <michael@amarulasolutions.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Mon,  8 Sep 2025 12:55:48 +0200
Message-Id: <20250908105548.681777-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250819184017.3018959-1-michael@amarulasolutions.com>
References: <20250819184017.3018959-1-michael@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1757328950; x=1757933750; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sNN8GYXGS9AtgCUkHwgEApkEusqw/Eb8s9gX0PqDF2M=;
 b=LyCm4RyQ528IqLWpa8A5VLaULdlyO3R2VV+K/b29vT6pEfgaGNyA1sNGN5BnAZsVRa
 a/VvI0tUFx3VoFBMNfAW+ETu11Jb6SIQ16VKrTLww6fpakZTJdM1DHS6yjoQrnrQ6ky2
 pbujgtHtewnmF5m2I19TfV62bdLNlyM3we1qX4R/gPtJgADH7lcfuVkgAdp1LpQMWUHh
 LQlkI/oY8dcsyRd3Z8xaEF5XYQu6d3WDdq3fs3w3JagOofDO22M3sm/n6tU8tFK6ep4h
 6ZB9XHwybx/PN0vD7yMDFoAZQANkl/3S91dDwTXucVonmZ7WZyU/0xW/lkJKzEWSWTF5
 A+3w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=LyCm4RyQ
Subject: Re: [Buildroot] [PATCH] configs/imx6ulz_bsh_smm_m2_defconfig: Fix
 processor VFP
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
> imx6ull is compatible with VFPV4. Update it from VFPV3
> 
> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  configs/imx6ulz_bsh_smm_m2_defconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configs/imx6ulz_bsh_smm_m2_defconfig b/configs/imx6ulz_bsh_smm_m2_defconfig
> index 22d6c6263c..5aa41b6438 100644
> --- a/configs/imx6ulz_bsh_smm_m2_defconfig
> +++ b/configs/imx6ulz_bsh_smm_m2_defconfig
> @@ -1,6 +1,6 @@
>  BR2_arm=y
>  BR2_cortex_a7=y
> -BR2_ARM_FPU_VFPV3=y
> +BR2_ARM_FPU_NEON_VFPV4=y
>  BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
>  BR2_GLOBAL_PATCH_DIR="board/bsh/imx6ulz-bsh-smm-m2/patches"
>  BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
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
