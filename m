Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16709C982DA
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 13:09:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D312A60E4C;
	Fri, 18 Sep 2026 13:09:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VXhuLhlYU2te; Fri, 18 Sep 2026 13:09:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 5B74760F8F
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789736956;
	b=PLtCnIGpdAxKWAYnCeNilRCB4KDxb9Jiv7B8iPlLFt6nwTIEMyhJx3c3uh+SjMxwQ/Uv
	 1L7pjhTgJRehXtauy5FcWMAZMYf5FmvpwRPJ3MOaPZHbFKJ8G4i7mb8/+1YqYrBwNArjj
	 X7AfQzh5dXuzYaeh4uxDcfI6DgRmC8zGQx3kqR5kaEb4dsjZ9tyQ9yxNtaDnxKNWcEypg
	 Mb1eHl9ZiOC+2cnVneCWWs4U5LfLMp+UdskbtZa6oS+c9jLTepMPmss9mRcRuKJ9shtO9
	 Kq7N/VFh8IDWKCgRFbXEbAaIJxowMelwq0dNg0Bz3sbwwIhCuZv2BHit/GOIfVMWvAQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789736956;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=lDLec/pRN4AkOJN5DafQRujzLcLpakqFlNKHVMKC/8s=;
	b=TqKI7mZL25jp8sxh9WUnklcg/Z4MQdcEVSfo7c9PmQWwQQ8o5ka+Hy98J5n8qqBjvv2r
	 BML+5V2JBxSFv1wpB62/dSKPC+xzAVV1YPABHRQNHb/ZzxKpJaT26c6xiB7OBX3ONkwB1
	 9y4556SBRGsHLCTgIa+F/pXfF7dKsbUCW/JzZtqlfWuTRokpJnys5ytfB5VWqvxutin1+
	 tTGsIMobudMoqbz9pX8DGGh0YpDfRe5L8SZio+MaTGljZQs7iJ33GskX1PyaKSlSG2KyL
	 /koGKPKFXxXyfkjanf8I83CD3d2Tm1ypYff1fj+4r/DauSv9fJYSpsGDJP2Rdo/I3tg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789736956;
	bh=lDLec/pRN4AkOJN5DafQRujzLcLpakqFlNKHVMKC/8s=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ab1MfA4phhm57dCkvBCiNXqF4wx2wcbyj7HAjdPzBsSYxKDaiMt0Zbiwpzqsuu6WQ
	 xI0tt19WLECtQasw58qHJPCNmQf89LwJy2OlHZsv2ez+9N3reYawbpO6yC1MiYaopo
	 AEcjLdJSFq99zfSloNqHGNfXBziDFqhrV4n0mWVXl4GSecsoheKPp0EpsBugdgF2Nr
	 CZcTalfWkbL9mvGELsHxczpWYoHy9798md9jJVUBcByNrP3Ga4M0czv6BHQvtk6tet
	 3qsOW8yKKEH0J/G+kztpvRykM0FizJrWVUjmKdlfA6/T9B/lfPskXguvmLhEX8zJML
	 wBrH2QR3FWVww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B74760F8F;
	Fri, 18 Sep 2026 13:09:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7889829B
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:09:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5C09840D20
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:09:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jlyO93FbpZaR for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 13:09:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 3D06440D71
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789736950;
 b=Q8Xtg/EcBESxaiNkMXN2jODGiJHelgLb+uEU7EckaPSlvxev5ysrv7rrON6nuvvJwdcL
 QpAew0RS9tLwzTkYBGXb8UBIB5pql28v6/zB4tXOQ17D4rG4hcAKmjGKPMMXhhRYDuXuI
 5ZHU/NWyAdGoAjdwEGjwKurvVSiZRgFlQBoNLlEw7KL63e9dHu8MSfuGxcWMfjhmYA9lx
 tz17YGt/fKBpxqzhNMY2YK+O5Vn+PzrLmHUAbQ0YLssxcfTRyt6LIUFbQLhfram2ndkCk
 m4/RdNgkD3RQJ8paRb3jAApkuRk2muWgZcgYAz5PuWubFjiUEtW1EEmvazexdPW8duA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789736950;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=OsTPQQmoRaJr4kLMtY+bIuz/i0+GLR+ezou/m7s44kE=;
 b=IEL9RgXTHOGehhXMRMWDoVnj4ET6NFMcsaHnx1WC1xW8M7cx6Pckj7a5TPTzYZerOYd7
 4GEX56nWbUVJz2hOBVe7m232VYbFbzrB29j4uUFMgTimFlGlR+UNfBpMfO+uD1/6o439x
 X34kRsmXpto9S3uNIxIbLigxmx8bH+6PRZY7mIZadGzvPEC+eloC5u92GFzT29UtjtSyO
 XJCXLv+XA0nCCwdJ/zb0tb7qPpprZitDa73zknG0QFFx1QYqZkxCvc8H7dDfw0f9xM+In
 CZoOGxBynnjsdIsDIkVuyD8uFiPYCuQlzUCwc/fQJtr7HwCo8wSG90Gh6vy3UtS+yRA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=ela8BMPr; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::11"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::11; helo=mail-wm2-x11.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm2-x11.google.com (mail-wm2-x11.google.com
 [IPv6:2a00:1450:4864:31::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3D06440D71
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:09:09 +0000 (UTC)
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-49b912e4ad9so4506975e9.2
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 06:09:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789736948; x=1790341748;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=OsTPQQmoRaJr4kLMtY+bIuz/i0+GLR+ezou/m7s44kE=;
 b=zIdPoOok54qWVud5LrCCsGEW8fP8FHeuqFiEULDb9aYw1cYIjmW799mu/ohtMoCz8h
 W8F9CMIPkU79FWbQWAfFI4DWFafAko1gS36uUYCtSRrM7W7coaKqK6RIXMAptNFrS/An
 9Mp5oS2EW2udySkWJ52xPbrenj19N4w0Wxm+3UOv9Qrh4GnD/H9JrO3A3PhX1RUCmaiz
 pBYsz5b2PmQ921wlLyPDHgrADn6Y91NEJL+o2UtQPIKacguLh4rdpv4FDOX70Mtxx54i
 MDKqoNXrkS4ypABTnnmUpVQWoQnp6VG8lyFoGsF14G8y9Xur8EFrGQT5UVHnow4cBqDo
 WgOQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBw6R17DO5BTKnR3goThKQ7vXNGfkNIY0aPT6CbBTERtO/bjnNrZYZ/5nk7+cZfPxJCsYTJjfDH0aT0=@buildroot.org
X-Gm-Message-State: AFuF++l+i/gNVVXJ6upfc8X42bH+rvYydKy/Vark3bNC4HTFVoFFASXj
 /CrbXcUxH9NRECOxXoF58GJfG1WSw4K4/f7Dvb9JmDsuHU5sW3Yv/PFVeguFwo6Xy7A=
X-Gm-Gg: AYBFou0m6qzEOgo37qCCINbN8K1hFhAvDG6Dbc/4AK2yJucdOVflEfJnR/U9czJoH+2
 9KfdAnQytRxvK5p1iRzeBjjqGGLt7Vd/6F2Od+vDzRJYXHKOttB8ke43PVKDP+Pcgs5zM+pCBTI
 8Vimf4RvMaIqbxTsyoiOzCmRlb87uXqHMAAzMzXS3OFHLPW72fzZCe6CDJIBv11eGU8eRhR2n1F
 +vZS0aIDumufvHSYm9sbPHaK4rHCeiP1Q/2JJLWRS6ERE0P3RJYsb4CJ9kZrwrso/kZcJLlX497
 qPW1rNsPOGgiiAjVvb4yK+XtBaHDC+HgDQBOYsSDMteu3XadT99CF9hmHM/ImvNUpLpq/B2SS2U
 jN4pLYoAIFDuNc1h0XiPqgiqSCpU2fiX+nqnmI5PJ1wNX3N+TVnYY1bjuByj239cZyJY5T8O2dl
 tnxgJzaqhzi7Z58imzZSYoxyEjob9b2D1EWAuJsEIsWR05gL0N7wfwLxW2TxbVRmv7
X-Received: by 2002:a05:600c:820e:b0:49e:6e46:2db with SMTP id
 5b1f17b1804b1-49fc57142e4mr28276375e9.8.1789736948027; 
 Fri, 18 Sep 2026 06:09:08 -0700 (PDT)
Received: from arch ([213.219.153.196]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fc7cfd1dasm55568985e9.9.2026.09.18.06.09.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2026 06:09:07 -0700 (PDT)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 18 Sep 2026 15:09:07 +0200
Message-ID: <20260918130907.163101-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260913170133.1695626-1-thomas.petazzoni@bootlin.com>
References: <20260913170133.1695626-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/webkitgtk: propagate gst1-libav
 architecture dependency
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
> BR2_PACKAGE_WEBKITGTK_MULTIMEDIA selects BR2_PACKAGE_GST1_LIBAV, which
> depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS, but doesn't propagate
> this dependency. In practice, there is no issue, as webkitgtk is only
> available on a subset of CPU architectures, while
> BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS makes ffmpeg available on pretty much
> all CPU architectures, except Cortex-M, m68k coldfire, and some
> specific cases of OpenRISC, which are not supported by webkitgtk.
> 
> But for the sake of having correct dependency propagation, let's fix
> this.
> 
> The other packages selected by BR2_PACKAGE_WEBKITGTK_MULTIMEDIA have
> dependencies that are already handled at the top-level
> BR2_PACKAGE_WEBKITGTK option.
> 
> Fixes: e6e549b9e40d42dbb6a551ecaeb040c1e401f21a ("ffmpeg: add BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS")
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x & 2026.08.x. Thanks

> ---
>  package/webkitgtk/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
> index cfb05fd0d3..13a65e57dc 100644
> --- a/package/webkitgtk/Config.in
> +++ b/package/webkitgtk/Config.in
> @@ -112,6 +112,7 @@ comment "webkitgtk https support needs a toolchain w/ dynamic library"
>  
>  config BR2_PACKAGE_WEBKITGTK_MULTIMEDIA
>  	bool "multimedia support"
> +	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS # gst1-libav
>  	select BR2_PACKAGE_GSTREAMER1
>  	select BR2_PACKAGE_GST1_PLUGINS_BAD
>  	select BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DEBUGUTILS
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
