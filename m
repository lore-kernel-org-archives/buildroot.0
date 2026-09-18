Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D305C982DF
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 13:08:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 632FD60F6C;
	Fri, 18 Sep 2026 13:08:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b0P10aIYWDfT; Fri, 18 Sep 2026 13:08:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 7AB0060EFC
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789736926;
	b=Fi/sQ2QTSLDxK9GYQ99+QWoUZbm4CshJKHqBoFFu60c9gXvdPxd1nL4a3fxz/JzOuz88
	 ou0PHtHXsYoYeki9zPQwdzZiGrCh9VKG2EKtH4CgAy6JGraajaTuKvAd7aWqL4VZbYgcs
	 NfTaM85yX6PqFpPN2wvZ4Iu8jqSdo7o1QWvDOYcDjpCZAnYNnBLMJ6Km44Chi8ff3G6ei
	 2aaAKu58U/TcYh405XSXg9try/9mJfFExjbjq6zwb2KbAJocMlB4Mc74VHLdpGzWoJRnY
	 s7z1kmnhaInE97NHx46KE/XavQ0P1YEM29np7iXEOhSPTT4qhLfD45WyP63BRPTZVDA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789736926;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=w1fytBU7wAF643dyxSWIFPnlfo1ettkQg1ov7xTKut0=;
	b=DWlbthenKHnUTMSBvbDIezVlwfFO2PWHav1OfSTVQgdJZFoEi0DwHJWdY1PbMiVG5MSu
	 IvKe/Pjb9lVwWSys46+ZG/ONAlyVZVVk8/owJ8LX9kPDxa6vqeduqOAGMpRtJgcFbo8dO
	 71UvaN7ulVQWlM3C78BM7dONNEUZFdWR3jpVUag7hOflcE3Jx1YLo729zfh+6fUN4a+7+
	 RLeMoSYxvXnvBu70A0RLp8nlgDQXe6Bd5shDgvbY+BLtFxFd5YSsjp86vkD5Wg9RWu7n5
	 iyC1vp/P5yR/VwWLe6ERj6Mx+lDiRlzVNFPfPSlkGp5Su3uy/b6fuK5+uG6TZKNrnQw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789736926;
	bh=w1fytBU7wAF643dyxSWIFPnlfo1ettkQg1ov7xTKut0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qvPiZP8G0UgczE5zYVN456pVgsOGGj4n1x6Fi/2cO8UDzfHmG/oimHiF+rpbWNwD1
	 YgYzqEA+bDyrX1KdSsahlKznaAKlfycMO7mVNL08royyg840Ya16Gk8HTIpcePdBNC
	 0/phDPiRsLw29ka3gJeGIIVXK9SZcrDyqNnVhu3DHKoAwmUQriirPT2yF97ay+8KO9
	 LQvNqKk6lTGMgh44D6caLZ3UTaTQekX6CK40PQWaCtNwdRb83XRg6qd2mFH+738x5P
	 46IJNGqVhjONUwTVJAYXdYM2EFlrFwBqr3MOf2uz9Ojk2SOS0yrVMwNP8ur/IG8xNM
	 pIU2Ld4aX3Y0w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AB0060EFC;
	Fri, 18 Sep 2026 13:08:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 151A513D
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:08:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0741A40348
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:08:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zUdjhNoL1_iP for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 13:08:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org F0E96400B4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789736914;
 b=WUHHIbjAukzLh3pUE/J0tB58gmxlu5Y96WXObkM33R33hrLj2CNBvIAC8HCJqx5JdYJ/
 X02nc8vFjmCkjiyyvIswhxoS+NKI/WTQ5pL06aAq6QuVIjxrKgmat9GXP1tCILlwcb9TX
 vHshBHMY+xuooGN9cWUKQ1vtu0WNbJt/fECrPfxnDwtrOtmNSNEsG0Tthh2E5Y7m6ww5q
 XbyijhFzOfdHbrYp8idIcCPyoMJdgxfLciY7qd+uK8GsG4QtZS8jbjpn4/eGJzUyQsGZG
 KJADZvlz7jfJ9lNqxz8Vc4fzZ3A3CvHLU5gKPonLIlYgIDavWB7eW8VB6q5+pBsO5DA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789736914;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=eUcmDQeuOzjNDTgSyhH//g7vFfIkVSjj4L6IhrhRg4o=;
 b=XKeVOMpFTlbFw1CLUkyjCR2cogsE0EwKHT/6Y0LYcmb49n0yishhqjA75855x2VBCURK
 XtRvTD/H3rX3YaGPMkO7P4FBH7wFkl9+z2cGvOvElKLosKxtVX4tLOnLJhUzIGCME+WKP
 1CdZAWALymC8amPMtcEtwnAXDg3pUO2Z1TZGVEd3WC9Lb+ztGaupkCi4FlDEXh0cjNBUV
 l1uTKMMADJYCcoNWrHx/wKx7q1iYwq8iXlLF7J4/J7DX1RHSKf+gLEfeiJPg1vRpJ7VGJ
 paXFald1H9pd+p+tb8RYEjmlwgdbU6DZpRN/Xt/jP/iyD2p4vAV8zRRtwTeIfMJsxYA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Z0p1f45P; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::11"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::11; helo=mail-wm2-x11.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm2-x11.google.com (mail-wm2-x11.google.com
 [IPv6:2a00:1450:4864:31::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F0E96400B4
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:08:33 +0000 (UTC)
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-49e71cdb22bso5808435e9.2
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 06:08:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789736912; x=1790341712;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=eUcmDQeuOzjNDTgSyhH//g7vFfIkVSjj4L6IhrhRg4o=;
 b=hAY9vh9R5FWN11ODWSIHIo9x/dyAQxX7p8+hP/dMG52mHFpHLQx62WkUil2xkFoBmh
 krzDkYt66d0j2LfGx5s/2Z/1HrZ3M4y08/WAH9qvcJR4MXFK9ksLecRJZ+/SiUkYtvBR
 p/+vbaFctybz0B9/i+zsb519rP+bpl1Xwza9yJt+eL+rUKlATyjYvxxUDmOaMWOJrq4s
 7q9depGWTpxTVrY7iBz6DhITtLp7RFnLIbfP+2vRM8Yo7rVdXceaNzbwiFvAB3BknyzX
 9DM4mZBKD8iCXohGKrWaXcnHR0zpbpKFbUPa6Bn+knK3+Tf4jTV3WM3vYNBhGRsX6+vl
 I5ww==
X-Forwarded-Encrypted: i=1;
 AKwUvBytYrSW/b5gVSmM5JbMTMy+rVZIdcXD8jtBPthpUyUh/2o8vxBfSqDN+/fDRMTLGdGcsfgI/pP002s=@buildroot.org
X-Gm-Message-State: AFuF++k290OAh4iShtmlyyvH2S9JtUBV4abtE+/C15BrBu++gRGGtvG2
 TF/X3ScAMrYa/x/AKyXvKKEvAmVaAXn6WKS7rWV2lvxHiFErNJMGfAZ8I5JZVMG8KXpZRfOPC0V
 CX6gw
X-Gm-Gg: AYBFou3jpgiiAf5rp+oQXpm8ulhX7cEb06jiREigpIZRgxS0AcZu/Xkw7Utl/Jv6Sqo
 uxBLUtqc+Lf+DZRe5rdhm/VcvZishJE1Htzt/+D5FzQj8fRpQfEivjqjnUqJ0mIImpVue03qCyh
 keTyVGZyGBa9K/dt4U8rhrzvMuTAcI5b2lC1pmn31d3T6W9fhOfe+gA8dm0n6+WNQ2QZYm8cx7W
 Rv7JybQceN6tMd03GXgZyH1gGIR/28OyL7ehIhEx3M1xZ0EOT2sUBwdc0npYacbVaMPYOi9Ey8A
 iQVlEOkiVUxbvfDm0GHvzYCgU4ak0aCQV/o6xYHgMv9ctWZniIAfUp2476+3Sx5wGoc3iMha4mg
 K5PjYFlEIpDYHsCugtZ/Pc725Ixe01hiBSXsWwh80EjSjDbNiMq8UXtJ8ci0LBLi+hRDHkwbXz2
 fKlypYviZEpM/ixfPqLjVs2QaYETwt0dzC3WgJP6r/IcdS0ppoSeJUCAR7UQfpbTv5
X-Received: by 2002:a05:600c:35c9:b0:49f:bcce:13f5 with SMTP id
 5b1f17b1804b1-49fc5736229mr35716045e9.24.1789736911702; 
 Fri, 18 Sep 2026 06:08:31 -0700 (PDT)
Received: from arch ([213.219.153.196]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fc7d46399sm71137795e9.12.2026.09.18.06.08.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2026 06:08:31 -0700 (PDT)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 18 Sep 2026 15:08:30 +0200
Message-ID: <20260918130831.162312-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260912210147.1550484-1-thomas.petazzoni@bootlin.com>
References: <20260912210147.1550484-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/udisks: add missing BR2_USE_MMU
 dependency
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
> Commit 66ddec89e8867435e696dcd4e50473f62f3bc8d4 ("package/udisks: bump
> to version 2.92") mistakenly removed the BR2_USE_MMU dependency of
> udisks when dropping "select BR2_PACKAGE_LVM2". Indeed, BR2_USE_MMU is
> a dependency of many other packages selected by udisks.
> 
> Interestingly, the Config.in comments in the same file still had the
> "depends on BR2_USE_MMU" dependencies.
> 
> Fixes: 66ddec89e8867435e696dcd4e50473f62f3bc8d4 ("package/udisks: bump to version 2.92")
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x & 2026.08.x. Thanks

> ---
>  package/udisks/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/udisks/Config.in b/package/udisks/Config.in
> index 23eec1d79e..8e772cccd6 100644
> --- a/package/udisks/Config.in
> +++ b/package/udisks/Config.in
> @@ -8,6 +8,7 @@ config BR2_PACKAGE_UDISKS
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libblockdev -> cryptsetup -> json-c
>  	depends on !BR2_STATIC_LIBS # polkit -> duktape
>  	depends on !BR2_OPTIMIZE_FAST # polkit -> duktape
> +	depends on BR2_USE_MMU # dbus, dbus-glib, libblockdev, polkit, util-linux libmount
>  	select BR2_PACKAGE_DBUS
>  	select BR2_PACKAGE_DBUS_GLIB
>  	select BR2_PACKAGE_LIBATASMART
> -- 
> 2.55.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
