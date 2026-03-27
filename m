Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ABB610ED640
	for <buildroot@archiver.kernel.org>; Fri, 27 Mar 2026 10:03:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0331F416A2;
	Fri, 27 Mar 2026 10:03:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OExVF6AQZPAD; Fri, 27 Mar 2026 10:03:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5888641718
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774605789;
	bh=NEWS/kYR/Kc1smrSM70q6eqPSIjgBGKSc70sg+17F1M=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DQ/ROy3OPQ2YJoPsgF5/ESjtHogW/66j2trST6a6kWLqlsHVeGxHZjyl+QOCcxCy6
	 UbrX0aTOJ+5Sj9MYwjrAkFj6MCNuDWzw8hS84hJr/2mqQN9yIZgObkwj3wZ5GR8a2p
	 HknwZcOGmamoxSH8DsVXxCHgSgYu7ob7lhTB9llxkSW1KtRBBHSVQGPi2fkZL+ZeXG
	 80KSR7tyBd2TO5m50P3BiVsT00SuZQtk+qtmywltesXNwmEzfuJ9BYFtNvzMRm3nLF
	 HsvFrNYIzjUWWknI2hUMQqF5cD0DVdOfuBxgo37QZyVJ0bXheRC0zSO75MQuJdX7C3
	 UMsv3d7CLAD7Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5888641718;
	Fri, 27 Mar 2026 10:03:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 28CAB249
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:03:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1AD8A83D62
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:03:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KKNCsu2bkDDz for <buildroot@buildroot.org>;
 Fri, 27 Mar 2026 10:03:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3ADC183D61
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3ADC183D61
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3ADC183D61
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:03:05 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-439c6fc2910so1281525f8f.0
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 03:03:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774605783; x=1775210583;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=OFdOsr+fLSMwtei4reGhgN3t9i2DVN2T/hIHFz9ql2o=;
 b=NIXB+oLPySlj/4zs7VnHP9mf5lerYeiRcW66+LbTchfndBu7ADcYqoDfQcGt5daL7Y
 An3WEDUMNetWO0e1DrQi4fFIO2hq9nL38nQHV9wbN2sC7R8sNi3hnKEMVFkHNDnX+1S4
 Eqj0z7XvOYrB+4HC3ayE1wVMZlwcAx1qm9gmqB3wwEO+/uwUWeEPaXGrGeVs4HVEp6LE
 C73JEcVFVcz2Kok2GO5rcfSHPqDpQo7bAFtYmTN7pGUpdWNpKoaFc9+IObFLp8DrHeX4
 VQ5TZEcTLduBP1xLgFTTFaPLFz65F+nYT5yt0p83vRUPoVbLdBTmfHKHjzUwS1YXoiTe
 Zl3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUx+t2FN5LRM0GgYnKi08r0dFIh56aWNe2VeFSZ00wkFEhciEPB7yvdz10ilUTOJ/gXu2xfMrKj11Y=@buildroot.org
X-Gm-Message-State: AOJu0YzAnWcwvJmlX9hLSDZKH8al3GYOVWwRyUu0hMYJuyExL4Ylwyqh
 9U/LQtYIO+7P/+On4PguW5GfwijeguqF9beUJDeF/YEzqCiAtxPF7dj5FGXb8AeYhEQ=
X-Gm-Gg: ATEYQzzw/38GVQRtKUgYxgbKJNWRIFeynYc52dAzL3kP8KXK06yzcozpCwtUcNLrMaz
 tf1gjfLeN2GaVnHbRzeKxLbwj79fyqk8HHATAgBzFbNjX4+nbzCV9guZlWe61Lv7skAyLwZWgpD
 9Uk4OKhLZdGd5gBAodYEBxHymIbTF3n0kVPjL80TyLi4FSfgs08y9USFAA/PBKnwvt5SIM0Z33P
 4JJ8OVCVOxc1Xxyu87xH8pEtRWvEYRNP5mz6jytrqdTNtjrjOqMzVhgU2IEWQXzGZenlCeGyV5N
 Fah1+lUMCUinV/r1IkaSamsZle4CSbbysgwuiy9vFrdQgYzN036sZkHZR9N1ny2B5WZqPvekciA
 9Uwfh9ZaFUw1fVPkPY4sjjEzBzA9Pu2yqXaTev6I5B+EdMUHZlnKojS3/M2QWNe4lMNOhIeeRV7
 46DErv0FLOxRDuERerQrTbPsOqaNs=
X-Received: by 2002:a05:600c:8b03:b0:485:3c66:e230 with SMTP id
 5b1f17b1804b1-48727ef1756mr30148695e9.29.1774605783121; 
 Fri, 27 Mar 2026 03:03:03 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4872712acb7sm12664105e9.18.2026.03.27.03.03.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2026 03:03:02 -0700 (PDT)
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 27 Mar 2026 11:03:01 +0100
Message-ID: <20260327100301.46746-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260218063123.546067-2-james.hilliard1@gmail.com>
References: <20260218063123.546067-2-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1774605783; x=1775210583; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OFdOsr+fLSMwtei4reGhgN3t9i2DVN2T/hIHFz9ql2o=;
 b=JgSexh1dExrMrRZebT91FbCAfuSwK4MHdj7LZjxc9EzaPAuzHJLoU6UaU/u7y8EFWa
 DA0Pqzosqg03WMzI4q3sZ/OZ0R3TKsmS8H5QSTKGCRepVkGKwdEC40FUexS4spq1aVEa
 QhwbJPAek02uK5cECYoMSGNWg2T8vcdno/smHvZvx4kmO1ooQeuhLN/NXWTihiURniVy
 x+S6OZJscwMXHzr+xH7N+jsAiYUqsjESSymd28sErcD6CDGAphKt96fQfVDVWCedOLas
 Fw1yhr7vRutaZx756DYon1lxZAG7mqwsz1nZYt6Vy2O8FAulbKtekhjxiqRwZhqxbmDK
 2uqA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=JgSexh1d
Subject: Re: [Buildroot] [PATCH 2/2] package/wpebackend-fdo: fix
 EGL_NOT_INITIALIZED crash
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
> Commit 4cd4b2e1e6e8816555db38771d18daad46df3a6c updated mesa3d
> past version 25.2.0 which deprecated the legacy wayland
> EGL_WL_bind_wayland_display interface, as wpebackend-fdo
> currently still relies on this functionality ensure that we
> enable EGL_WL_bind_wayland_display in mesa3d.
> 
> Fixes:
>  - https://lore.kernel.org/all/CADvTj4pYf0uymrkZUuWgahWK=pm5CgTJL5U+gwbwKExK1so5jA@mail.gmail.com/
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to 2026.02.x. Thanks

> ---
>  package/wpebackend-fdo/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/wpebackend-fdo/Config.in b/package/wpebackend-fdo/Config.in
> index 9b4dd28741..bd0ab5421e 100644
> --- a/package/wpebackend-fdo/Config.in
> +++ b/package/wpebackend-fdo/Config.in
> @@ -14,6 +14,7 @@ config BR2_PACKAGE_WPEBACKEND_FDO
>  	select BR2_PACKAGE_LIBGLIB2
>  	select BR2_PACKAGE_LIBWPE
>  	select BR2_PACKAGE_WAYLAND
> +	select BR2_PACKAGE_MESA3D_LEGACY_BIND_WAYLAND_DISPLAY if BR2_PACKAGE_MESA3D
>  	help
>  	  WPEBackend interface using freedesktop.org API.
>  
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
