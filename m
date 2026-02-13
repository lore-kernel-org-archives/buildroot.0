Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9278EF99D0
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:37:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5D8241E36;
	Fri, 13 Feb 2026 19:37:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rf7JJ-BMbb3a; Fri, 13 Feb 2026 19:37:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B750D41ED5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011427;
	bh=RdpDNWXrLDO7xN0xiJkNnRCbSXisYvhkiUpHDG6vwYY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=B1GISd2zBBlJc4MG6CQsN+K4cgAXf+oFqys3i2UWA9Hiz3OjCctRX6y6u9CoT0HjA
	 9Rgwghsq+96VOXrTlVlhCpdio8PjozzoLekXzOQl+QZ0lIZANZyxIzaohN4pCjRi7T
	 caGuR02XOxrVN/RRBsMz4qMHUJ7iTjdLroI7DAQDJ/U1RDsiREt5Ls+4NJH8jA+isE
	 cF9Pbevac7CBO04SSW7ZabiiUWt7f27rsQJ/7oJ55cqpJgGD64TpixCscdXG9OjknD
	 UWCOU2d11WOOhoV9oDDTHPTXDuPOirrS0NtP9AS05eD2ljmSraBSVELaIG5qPInBeM
	 A0Qbg8Pdbat3g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B750D41ED5;
	Fri, 13 Feb 2026 19:37:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3728169
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:36:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C5C3C41280
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:36:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id knbi9XfnSGUP for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:36:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B0C22412A0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B0C22412A0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B0C22412A0
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:36:26 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-4359228b7c6so900432f8f.2
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:36:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771011384; x=1771616184;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=AIN1tUh0gRhgadZrGy0zB+VNNAWJUUU5JjQPtKOOvA0=;
 b=S/mlGK957Hsg6vm0BdZMa6XJxSGU0G7OFl24gIQ7ZU9reXZFzRbAmZashnhFWV+Bwg
 p2wCGvO6K6WHufWohYVrercSqu82qDDRsqZmrNalRY6jBezqhRGOGwjSmNFKy5K83D4I
 YGPanT/0ZNb9R9AmN9vpozskzB1cHGajEjBm2IHGjBdfkV+WdT6/ye5kNUos/93xLfDt
 A2/03mKqD+NkNKDJgeef65L4vIh5szbtJm7HoCuV0BYZKW6Fh7ikSIz5TlFo58pnV/Pr
 WBTWxE2bp/qk624tgi+SSLOVMRHwE1F1fPkehfBgrM0Oxv/f8hKmj/NZb6+ChIghuUhP
 of0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjhXNY0tCOW9CInWvmswYqfaxQPnvWcTMUj5z42iVdFUD0paDJHSk0m4SZnNwXN5JmWreYoo0cWNI=@buildroot.org
X-Gm-Message-State: AOJu0Yz9Uf9ywsMw7cOkMBlFtk3/q01tsVUYOH6L3J465yImQ50O4j31
 e+7hcIBjG9C1oWG++xI11xf7WvsVlH1RNvkjkNe+OZMS41ydmqqOrt4gXVD4oZSLAfVVehER1Ci
 QADX9
X-Gm-Gg: AZuq6aIghmJfQ2i7Ewg8l6AiMxYXcLs//r4wX54nvHg1XMqRN/migBstJ3ieyg6E21P
 Gb8F0lj7I+Uy0zw/0//kwoacnQda8baCdzn0Saqj2L+Yf0LZ8P5NAEBfFprirKw//tXrPXQiC21
 E6gG0RjBhujlRwwXaLiDw9PPyIAl0QAK0ZvKS/c7838HQPXhnpOYooNaJFC9IjmmYahoMmPgFnL
 mMeB+GmzY591oTusR9C68LSragg5jO4qjJyjd9NKArY57D6B2vVuUpDQ+kyAWVLEkaZe0BnR969
 fKQFjN3w0uoio3GaR0/TIZFXLo3tHpWzHXfI9dB7dbzLVXT3oamlm5qP+l3kB2Mxb3T669xFglW
 VBp9VdTXlLYfrk+c4lWgkV71B662j7iF/psY9q9eNKVDINCNseChGo2LkJm42B4ycCPgxiIc1/m
 qDbvijsZJ8JIRsM5CodKfE/WKOBg==
X-Received: by 2002:a05:6000:2f83:b0:435:975a:131c with SMTP id
 ffacd0b85a97d-4379db987aamr1027344f8f.36.1771011384563; 
 Fri, 13 Feb 2026 11:36:24 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796ad009bsm7566297f8f.39.2026.02.13.11.36.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 11:36:24 -0800 (PST)
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:36:23 +0100
Message-ID: <20260213193623.37380-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260202135512.3833917-1-buildroot@bubu1.eu>
References: <20260202135512.3833917-1-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771011384; x=1771616184; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AIN1tUh0gRhgadZrGy0zB+VNNAWJUUU5JjQPtKOOvA0=;
 b=T9Ny1D1Yrc92PAj5RLn3xfOuan97wrvOBeNsxa/W1QPVVVgDQc7WSNez7psMCnr0HE
 pKmNf1Fa+psH5rwvhWdou9dP6B+QzjgIKhOWQSWc9J1lKZdEn3A8GMMBE/ON3nq73ejo
 1tikmUWolC/i8RoWZjAHoAx2yUKIoZWLsZF7jYLeGQkM1v9J6NKcVaeQfw2mrOeYj/Zz
 +sYbHBTp4JtNAuXnJ0V3my73OhOZMJQArW01A1tisHUYi2ZZg4Ap8C8BiczaN/lq/N5K
 f+W6J/M4SlUhNmzbiU8UEm4or6GuAer4RsI6pcXWAxSpgSVeYng3zPd5L3oq834bMhGE
 uz2w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=T9Ny1D1Y
Subject: Re: [Buildroot] [2025.02.x] package/python-django: bump to 5.2.10
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
> Django 5.1 support ended December 3, 2025, bump to 5.2 LTS that's
> supported until April 2028 [1].
> 
> [1] https://www.djangoproject.com/download/
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to 2025.02.x. Thanks

> ---
>  package/python-django/python-django.hash | 4 ++--
>  package/python-django/python-django.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
> index 0c9b70959f..1c2b9bcd29 100644
> --- a/package/python-django/python-django.hash
> +++ b/package/python-django/python-django.hash
> @@ -1,6 +1,6 @@
>  # md5, sha256 from https://pypi.org/pypi/django/json
> -md5  232748d1f2d6d1074f873dde91f7d75b  django-5.1.15.tar.gz
> -sha256  46a356b5ff867bece73fc6365e081f21c569973403ee7e9b9a0316f27d0eb947  django-5.1.15.tar.gz
> +md5  98e667c17123f7bbd2d7d1db32f9ccdd  django-5.2.10.tar.gz
> +sha256  74df100784c288c50a2b5cad59631d71214f40f72051d5af3fdf220c20bdbbbe  django-5.2.10.tar.gz
>  # Locally computed sha256 checksums
>  sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
>  sha256  dcac1c86cb7ab491702bdb4c41be680fafde51536748cc8aaee3840eec53ed17  django/contrib/gis/measure.py
> diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
> index 32821e19a0..184f91bfa1 100644
> --- a/package/python-django/python-django.mk
> +++ b/package/python-django/python-django.mk
> @@ -4,10 +4,10 @@
>  #
>  ################################################################################
>  
> -PYTHON_DJANGO_VERSION = 5.1.15
> +PYTHON_DJANGO_VERSION = 5.2.10
>  PYTHON_DJANGO_SOURCE = django-$(PYTHON_DJANGO_VERSION).tar.gz
>  # The official Django site has an unpractical URL
> -PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/10/45/1ac68964193cfcc0b0912a0f68025d5bdb54f71ba7b8716e85b959874bd0
> +PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/e6/e5/2671df24bf0ded831768ef79532e5a7922485411a5696f6d979568591a37
>  PYTHON_DJANGO_LICENSE = BSD-3-Clause, MIT (jquery, utils/archive.py), BSD-2-Clause (inlines.js)
>  PYTHON_DJANGO_LICENSE_FILES = LICENSE \
>  	django/contrib/gis/measure.py \
> -- 
> 2.52.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
