Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4E93CC6B38
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 15:06:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66F7C40C46;
	Fri, 16 Oct 2026 15:06:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cSjkU9vu5u6a; Fri, 16 Oct 2026 15:06:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7D1A540B30
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792163165;
	b=pxCxNEDpg3iqIsJ7dwSxNHQfAZseOUBJZIS2T5yL1Kt84L/8Z/zH1w0m9mhKpPIKrTpJ
	 b7WfOdIaJeSU9GKjDTkgj9qZg4f3YGdihk9IrUeiW5t+lD7sahJ52T8vvicxtw31Irpjd
	 +kkNQDjiBvLrO9Z852kS2D0Y8W8MZjsCreb5f04YBUsz3izqaWR5pPrzFyOXk1Lm83aKS
	 bTYCxYzxNuAHEkYqMV1ePU+f0w6eAFtSdV+xypHX4pTO/hIo/dR2HW1l0TM3V8+LbXGRX
	 9xRaEfDzgdBSKU4ewL0JwKw0TtBBrPLJG7HtKK5AxZjqYbk+CIz0pN130VTf5CtFc4w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792163165;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=hCc0cWVv4Yjp0LrGZfxaejc5kfDCUyZ58+gnOjN0Axk=;
	b=b4oGh7RLEAFOw0FHbFR+tqTAIEO/El7kJmldWYWt/PZjpItSgdocEF5exhaYg6NTiJMG
	 Xo+ZSmHQYy57K9JDSuqHHWBZYRDijyTW9N6HpfF8/AXO/vEzubnAD/MISs2oudODcAGTO
	 9p9zLQHDlIMM2rlurnEiFeJa195OHK3Izc9TEhd+vaZOoECuJ9XWweaHTSorfOOu5ZpNi
	 qH5dadKng+Oav35of0Rj1scE8pj9ORFWxVqO9CrvU7dPmD1z0N4yOdH7w0cyn/cTF59ax
	 YN6dOe1QZkOtS7woQvIkEPQWQRUODRNiIGOG1c3lVmYqRi/ExHNceDqlwFodb7KHlrw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792163165;
	bh=hCc0cWVv4Yjp0LrGZfxaejc5kfDCUyZ58+gnOjN0Axk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=dHP+PxtbzCxjj0Hq8SxBiddB/Pm8X/5PtPoRwAGdS/Gb9jOwoUUQLGWxG59feCUSA
	 RQdEGxUxu5bPWok86ACoCF4GEZ6q1jLAQSAaTabEWDCZglI+mXBnmsKxto02pp63pq
	 fmCb9YMKSw5H+NwKSuJ3uK4L6d8gvKM2AA2yfIIXTVP9hvn+hYcBKHcxwcgr8Ak7SW
	 ZfUERUJzxTK9wKTmeRYfWokJw7zgzDDvdEqjVnUDl0W4H7bLbcmktJZI8N8Sy0RbEz
	 NEv8N+k0Jb1t0QwMGg0bESwQpyrWIHD0oEdhlBiA01qeapigsa8fgRYVEG7wBhB2FD
	 OvQn4zceoLQJQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D1A540B30;
	Fri, 16 Oct 2026 15:06:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 71D66255
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:06:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6252140C42
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:06:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8dusEMn3Q3W3 for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 15:06:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B533540C39
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792163160;
 b=p/DjFHHLhTR78eYTmGmyxiukLdcKlOvTABuYux3Am3HJhGEVpMrIvKesCdL6C1HuaeHx
 F8hO676v0PybZgCohlJ0PUhOz6BU9ZqTe3dUUH+C6tu0z+sbuYuN4uC5hAqXXk5U9QDjs
 gJow90pskk62D32qSH6eOvv2MgSzBzASU7aqRubC8czoYv10jbnp67sc5Tdzd5R3vLeog
 myk+mnfpvY4vKM0Kld8tM+81A4sUPgviRItGAkXOHK9t9biRVvmBIp+RJeXRD80DFEoJx
 ztmfJKb65wLpUjRiuUzMxDHfqwE+JS+PgRXpNei3l+Djk+TLUJQ7Nsa0eo4dC0yofkg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792163160;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=6Fd4eWXQ6/spWa6FnnSjTqSYiW+dSzc/vORlJpF0Lmo=;
 b=LZN9/kmv8h/ICWvotwYTIGsL4hp9rn6c1zaGu0Xejo2s16Pf3NwKtw6lLIoVaHwJOsTN
 +hU6lX6nU7K0iHd6fDrSaBPBYyQgLmFevdkAfXuvAMAS7qFZ9yDm8GpuW7XGSnPwkG8Dw
 voAh8k8hAmSLgFmzK+cJwLX1asO7fhBJQ1AtUcZZTz8AYjyuECXjxYAyNSHTLPh32y0Vq
 tVFvZ43mgGiu8DQtaHjNBkwnLvU9mK1rKn1hEHhFksXdElUbKiagwI7cgCP4/gP7g5fvI
 ryjKBXIUpLoIk4OgP7VVIMLvpB81F2zQ9xPMCFWLnIGgCo8uCfn7vTV4nAr4rErIUHQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=IcGlkHmr; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::335"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B533540C39
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:05:59 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4a16af2a232so410015e9.1
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 08:05:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792163157; x=1792767957;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=6Fd4eWXQ6/spWa6FnnSjTqSYiW+dSzc/vORlJpF0Lmo=;
 b=IqqguJ0XFfS1k98hP0sUOLjLaRvucxTTAwYNtOK8roBgHiGxZtXHfeE9XWsDaLi8cb
 nRCEZzZM3nlFxL2OawEom0J0K46yGZhKZaJMddaru77ps2vHlcu7HrdLJUQKdQkJf7Wa
 6bMFudAcb8/570TEBfLB+CN3pk8K3uhNdCMUlIbKK8aRtsjdP4RPw7TdNJyqgv3Dqw5k
 89oivyVqqmxxIlKrxDcPCg/t1UIBG8t7AtGYjF5EF9YrwRtKpZ2R/olJ2MOsYKbXRLLz
 vNnStMJX7lxvSepmE7iTIW+ynkvURJYBeSMIeIl3n1QJSWeuD0B0AknRMeOzjHb5JgKG
 VTWw==
X-Gm-Message-State: AFq9FYIKBGbUUk45G+XV9DEszZfb9W0QsDyVw/zxfRmTWR8EkgfrPMuR
 XT9N2FwMv7MSsgIRbMmXQ/yQJCJO5J//ZfmRlW0wpebDmwgQkm4ZzFeCNzRzAzSjS+aiwy0QIXm
 knO1lOvg=
X-Gm-Gg: AYBFou0Ct+wXCkDeuefEmzhlYDPJcDxoXvjAw8ZqI7P0gwSVV6A3GYQSMYaMVP3lxQP
 9+ZZSrYxYNESRZtAWkTRCZoZsXahiusaVvT4FsDWTyBjr/Jozkfjw3qWgZ2S47mojzNFfQBO+1K
 LL2m6k8PaRDnLGtopu8c9ybwt4c8YRvvO8e92OeuM3wRqpyqnhl9NTKj0K/dRWWYrOs9CfEhApV
 nLr7UBnmtoV/AUcbG5bofv0eLV847UZP7GgIO/C6iSnMvvETFwQAvuFmUXWUEOrorGSmZPoS6xg
 OSjjh1vO3BmLwIrKYBq659n5kQl6qwwGyGWYmK5Mm8caN6HsuCHPsgrW/QLgzWMww5BmtoCNZAf
 zl8+xeUGEIbOw8xkF922vwR1lDBdAFRsX8nd8RwpQJvBRqpiyUUAMOjviGka+Nm8GlQGyvXQtXa
 AO81+rlNpP9pCV/YA+QKk/QcuuRTJ/f4tzo1zepGXotcYD6GAg+MrnKM2tWutJn8VVLM6sCgVTq
 ZwibkTblE6ck+Abbz95QYsgZhdfVV9u76I2YSlzNy5qcuhGZAai
X-Received: by 2002:a05:600c:314f:b0:4a1:d41a:afbc with SMTP id
 5b1f17b1804b1-4a1d7608492mr1617115e9.23.1792163157498; 
 Fri, 16 Oct 2026 08:05:57 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48dfd4c5932sm5887510f8f.18.2026.10.16.08.05.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 08:05:56 -0700 (PDT)
To: buildroot@buildroot.org,
	Bernd Kuhls <bernd@kuhls.net>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 16 Oct 2026 17:05:54 +0200
Message-ID: <20261016150556.75542-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261008204640.3755842-1-bernd@kuhls.net>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/go: security bump version to
 1.27.2
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> https://go.dev/doc/devel/release#go1.27.2
> https://groups.google.com/g/golang-announce/c/U2fTuyDJznI/m/bAPU-QKAAQAJ
> 
> Fixes CVE-2026-56857, CVE-2026-56866, CVE-2026-78659, CVE-2026-78660,
> CVE-2026-78663, CVE-2026-78667, CVE-2026-78669, CVE-2026-94439,
> CVE-2026-94440, CVE-2026-94444, CVE-2026-94447, CVE-2026-94448,
> CVE-2026-97030, CVE-2026-97031 & CVE-2026-97032.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/go/go.hash | 14 +++++++-------
>  package/go/go.mk   |  2 +-
>  2 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/package/go/go.hash b/package/go/go.hash
> index bc6d026a6c..6a4b03ad35 100644
> --- a/package/go/go.hash
> +++ b/package/go/go.hash
> @@ -1,9 +1,9 @@
>  # sha256 checksum from https://go.dev/dl/
> -sha256  7002403d7cc44529ef6d26f69a44818263395ead7c16c05a5808ae047ebeb0e5  go1.27.0.src.tar.gz
> -sha256  eac4abaca4113170a1cf261b8bf1d38480e61e99deecbc6a14767deb8b19e8ad  go1.27.0.linux-386.tar.gz
> -sha256  675c26c449cbb18fc24b74650de1eabbae6e16f64326fd85a283fb3b58280685  go1.27.0.linux-amd64.tar.gz
> -sha256  51798d2c42d0e1c6ed7fd9f48728b4193abac9e8aad6dbac2fe96a81f5909bda  go1.27.0.linux-arm64.tar.gz
> -sha256  e337ecd9c321377c0d8832690c2cb10463447c0bd0e65e2e3413dfff63a3435b  go1.27.0.linux-armv6l.tar.gz
> -sha256  068085e257a6014c036c723ca62943edbf48fd168b8d00a6d39527d10b656255  go1.27.0.linux-ppc64le.tar.gz
> -sha256  cb5c89fa48cba4123c68aee62b217ca030f281546df0898a0c32889c340b928c  go1.27.0.linux-s390x.tar.gz
> +sha256  03495da2ba64894d40f5c4992e49454fa78b50690604ff92b6afff5081b76e62  go1.27.2.src.tar.gz
> +sha256  93dae4b7f463ed1e9c65e05561ce9fc5f7cd5c4ffca5e336248d48f3a2eab5fc  go1.27.2.linux-386.tar.gz
> +sha256  ecbadb99091a3f46e31f5f934b068b1864eafa7995211b39eaddf76996045fe5  go1.27.2.linux-amd64.tar.gz
> +sha256  94f3e30b8e374bc285e7dadc11e0865726b9bc6e85b841ccceaabc0214c6b7c8  go1.27.2.linux-arm64.tar.gz
> +sha256  e25a174051d8675f87ac720aedcd25bf89ac652c4b82f26aa47919524725ed95  go1.27.2.linux-armv6l.tar.gz
> +sha256  059d5f01b1607a724ea5ae87c5589041a51c577a6f3f20099e49d00f31c803fa  go1.27.2.linux-ppc64le.tar.gz
> +sha256  dfd01d1e08e4dbece2cd91e259953f87b858752037fd151da2f674c4fa09aeef  go1.27.2.linux-s390x.tar.gz
>  sha256  911f8f5782931320f5b8d1160a76365b83aea6447ee6c04fa6d5591467db9dad  LICENSE
> diff --git a/package/go/go.mk b/package/go/go.mk
> index a49dc206cc..df6f0049bf 100644
> --- a/package/go/go.mk
> +++ b/package/go/go.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -GO_VERSION = 1.27.0
> +GO_VERSION = 1.27.2
>  
>  HOST_GO_GOPATH = $(HOST_DIR)/share/go-path
>  HOST_GO_HOST_CACHE = $(HOST_DIR)/share/host-go-cache
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
