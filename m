Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BC9DCCA46C
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 15:02:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CD3F40A73;
	Fri, 16 Oct 2026 15:02:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HzQ2hoGkGjx7; Fri, 16 Oct 2026 15:02:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5654640A4D
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792162953;
	b=WJZcHsWaZ3AowxmwDpT32Wz8ihDQM4KBwH/7uc6FvY6kuaD5Z3dASm6+dw+8Sdyj6GQg
	 CvHiGzHdmjawaHYr1auXz8gMF7rURWnV/p0teyG1RobLxfK90pZ+7xog4861WPf+DSETy
	 GJtj82mVjSIoNRP0+5PLbF8FDgkwGc7GAulG+TrRVayrOBcQTK7l++NtlaRd0rP5Vk0YT
	 gtQFnEJ7c58pzE+zQn6UnMF/SSu7GiZU1Iqo4XM+y9b8RREO2kUutLRTP8yz5/b9MORZP
	 lrxi7hqSTiisX//EDQa6ugQSsxCYeY7uS4AgT7VXf/Mutsj6yPNl+OVoPXj4xfayKXg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792162953;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Ih18rL/2H8JudXjR7jkhkzA/xfI8/QmiZscxf0lDNnc=;
	b=Z7eoInWoWK3M/XvsHEKZ54nvqWxxkSCTkKWa8Itb8aPsX73Z47kIWMLB16AXHuR3Zem/
	 Diq5pe9hHRxuzF2WXE1RdKUoHRX0ivbP0vHq9EIOPcn7oV1ZWtmEYICRtXvYw1LBOG3+c
	 dkEtgHQoprBzZFbjkboCQjtUWPoTTbBoKj0KoVZqk7hQX6Ik6PUIqjvhjvO5l9kK55Vh8
	 g2/McFe3RF651EnW6e5Vx9689schiAAObXgvL49fvWWI2hvUzoolZyPiEcMvXciVxOZHZ
	 e5lr9Sq1aVJwyXW+bgN18AhpDzaKKzI0HFHETw2eKi26QWGt+YIAWOIBRKVgLAj5lXg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792162953;
	bh=Ih18rL/2H8JudXjR7jkhkzA/xfI8/QmiZscxf0lDNnc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=K2l6N33GZL0BSUHikcMt9VrHXi4tcRMI/xJxLKG8fI1OH8NYX9BtGGsd+HZlhIwWE
	 mhEtr8I73cM+zpinAc/CYe+v7+j2nYelDHcNadhqYQSzlPoteIw8L9zRxCcP/51rDG
	 r+XL6vTcBr1/cTJVLoiwlhh1/tsK8akka7RksS7gJ6/qVkb1ZGQrP+pDTHeJ644NnK
	 5D9GR3aS6ABSbmneWFz8EXlSCeh9nZUV2qobzHHFdkY1Ag1Y91rhBJ+qTV/GoPx/gs
	 lZBqpAEp22g6Z3xc0GcnMr+J0Qj410wHKzRXfVey6oN2l1NYNOFQSmcCO0qV7j+OPz
	 +uHHh0QVl+azw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5654640A4D;
	Fri, 16 Oct 2026 15:02:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AA7A77AD
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:02:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 90CFD40A73
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:02:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5QN2VxPGMCgV for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 15:02:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B77A240A16
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792162952;
 b=ce5GSO1XmptZ2cE73RGxRdW4qX14putFwle6ZEwB3moQRI4j6fo/g9TWgldL+Xlzo1gE
 gxOQUUT98X7vlsWSWgcPXycOpk6eJlBpE2wyuFbenSst5/kMpaheItnU3BKSIj4buYQjY
 VIvGr0vRsIhnAlcozVFXmUqr45EY1QaOpg5s1lK4AJhzgZ7EIYcWGKqHp1yMlLtgNTmnE
 Oo9X811cAxN9SvCV6opylxoNzi9xsV0M0voZSedVl1pVZIBjvucuFypqD7UVPEVmLY9KW
 KV884yOOSvUK/MysSbKtW6er++bXkxJoV9CeGHiXv+byPfCiT+hfnpczdRCzPdTEeIQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792162952;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=sh41v3TAhra7ESRPdXlvx+ltVd2WTBHd2WtpodhZJ24=;
 b=dGT/ZIZ4MzwaHLVthBhO+tWn0K2XGUEJA5gH/t07v23Xtz5sCRkZqlW7ufr7HsZeptPN
 LCzEcuCsCywEEZuD4BE1R+c68GUiWbXuCnu2Z6XZBTMaTjJtU2meDdB1rw1Uf41tf1a8j
 kwWJpR+9ofyMOY6XQ8yph3Kif41KFu6CSsLlFXFqFR06cO2SyzXlDTc2s0WiHEYLRREZG
 So9SwZAcgtCpXlAZ29JV2GUMuiZ+WrDDeBH47Qw5KOsiWxAE9Xq2avG1a5HWBtCGFiSqn
 dyYWWLrEMOWqso2pUQbLQwyA0sRhTn/rdltUe24f99a4/I/mEAjoDVJjE3Lv6Ywdk4w==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=P3bfgLd9; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::636"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B77A240A16
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:02:31 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-c418e215671so994766b.0
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 08:02:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792162949; x=1792767749;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=sh41v3TAhra7ESRPdXlvx+ltVd2WTBHd2WtpodhZJ24=;
 b=ExQd54xQZWPZgVvv+axvehzR/Smy06gyjRQdUxy181lcx5VIROgV2z4gKPfXrwxcRB
 o1Db/f9DXSXj6+OLFzgB2Bal1944PpA+uGK1hbFSGSY9qAcaSVrUJ47KK4fw09GFxP42
 HSx4k9udwYnaEO9YaU2HCp+T1dibMn4oeb4v+XDb5Qq0kkXl+BC6/4oZhy8VVDDwk2xs
 x/msTSrKui4znBonXNhwb7Ta2AHaMpTsoOiswqknIQIg5Ac42pPFakzfYeHfsbYCL+ci
 t42P7XRyU7FlMQclpLxol6G+UykdUIcDSImmKVGcZfNWJsUOzdYoG7r2BkMb8f9O7JoD
 fbLA==
X-Gm-Message-State: AFq9FYJQgQaJZ0dTyKR+zvh7JJ8aDtqqm+H0jdze5S6r9iZpG6xGHPbL
 /t08FNYsmadsQtJkjMkRF86nEwncMCUM0aa0QVBelDzQgmugYmAdAqejt2hQqkxvwZLFIygvl9K
 7BGvxkIM=
X-Gm-Gg: AYBFou3Cg7iELUvP5bfQNiGd8GKbZ46r/fegd/TA3M4F28FLVrjJk2RBuxdA8Of3Wf1
 uZkIDHJ/xfTyL8zBzaKxhyZQ8qDugGL1xuBOWEnl0gUpxGIL02Rs4pSC+/bqGz1e0CIYcypznq4
 B+JnUlwdwa5RVoFzWhZLsrq0a+sCclhtSUVy5+XJ5OumYgYGGN++jvnZrLVx//FgbnXU1Jr7moi
 dn7jftvprsahWYqBxxSKT50xjHZ8E2Dr1QUzQWAh6tCxHiyKkyNH/WyTboK0UmaxXrbzo/AWdBc
 h9gVBCB6E/LHPq9Zm7AbTfKqEj/ZIYtAFnQwRxdZITLYgM1RqaZsq8udlQBm2w7PjtJPIr+YBuj
 FkajMZ8Yu+Z5NApaQnqR+CrjktWRfGIoHgQjzOzBo/CdUp+ZORgjvkrq5tCxEQ8ss7tG7r0WOes
 VjARuWp2HcNY34+tg2YPjf9w489Nn3F9xWjRbVZ80Lfh+W6DCvsLU4p6jHnGhZgNkUimBU2WSK+
 VdjrZ0FZuKYHOEdNjHMA7xmjGhLCGmTiI2WPn3q6Q==
X-Received: by 2002:a17:907:9721:b0:c40:7381:1b92 with SMTP id
 a640c23a62f3a-c419fbfd6aemr4479766b.41.1792162949372; 
 Fri, 16 Oct 2026 08:02:29 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48dfd4ee183sm5498332f8f.29.2026.10.16.08.02.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 08:02:25 -0700 (PDT)
To: buildroot@buildroot.org,
 =?iso-8859-1?q?S=E9bastien_Guillaume?= <sebastien.guillaume@vendeeconcept.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 16 Oct 2026 17:02:21 +0200
Message-ID: <20261016150224.60544-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260612121516.1634-9-sebastien.guillaume@vendeeconcept.com>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 08/11] package/qt6/qt6declarative: add CPE
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
> Signed-off-by: Sebastien Guillaume <sebastien.guillaume@vendeeconcept.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/qt6/qt6declarative/qt6declarative.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/qt6/qt6declarative/qt6declarative.mk b/package/qt6/qt6declarative/qt6declarative.mk
> index edec67649f..a21aaa62f6 100644
> --- a/package/qt6/qt6declarative/qt6declarative.mk
> +++ b/package/qt6/qt6declarative/qt6declarative.mk
> @@ -8,7 +8,8 @@ QT6DECLARATIVE_VERSION = $(QT6_VERSION)
>  QT6DECLARATIVE_SITE = $(QT6_SITE)
>  QT6DECLARATIVE_SOURCE = qtdeclarative-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6DECLARATIVE_VERSION).tar.xz
>  QT6DECLARATIVE_INSTALL_STAGING = YES
> -
> +QT6DECLARATIVE_CPE_ID_VENDOR = qt
> +QT6DECLARATIVE_CPE_ID_PRODUCT = qtdeclarative
>  QT6DECLARATIVE_SUPPORTS_IN_SOURCE_BUILD = NO
>  
>  QT6DECLARATIVE_CMAKE_BACKEND = ninja
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
