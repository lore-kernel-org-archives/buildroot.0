Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A09C1CD6E4C
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:31:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 62FF084388;
	Fri, 29 May 2026 08:31:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MIQR7XUdXrFQ; Fri, 29 May 2026 08:30:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E47384389
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043459;
	bh=zZO/JN1hLHYtyWJ3jGm52f6T0oUfwhF7Chs4os9P3bA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=i1dfu9tqEhC8r/btqIxONPoKBvb1+zvL4I197Z2H2VptYesZViXJeKS6IqYz1V5Me
	 rRBtgTq5dXUColNBwHvouSqI1/pnsYR0Hg+YEKGsDsF5vezSpq5/3aR0R5ZKmeIDIH
	 G2H6NCmr77fM5xo0n0+VNE/hAQzqdFL9V2ZksencjyGt1bc3+czT5ug88rDxvhEXcj
	 CzGORHBtBDo9X4xF65ma8q7lZ9iOT34UI0XftuA3wO0Yq3WzjvByAznrdoikXkJgTX
	 nl/Jp5qqJI6L/0P4jZISOVtX+cecJ7pp1E6Wo3u5w++l61V2kfXSfv4/WmGh8Q/157
	 0izp1FkebVyuw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E47384389;
	Fri, 29 May 2026 08:30:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8CAB8288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7B40142372
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aRJLb8SuYEq9 for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:30:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4ACC742367
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4ACC742367
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4ACC742367
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:41 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4904fd4f6aeso59458885e9.2
 for <buildroot@buildroot.org>; Fri, 29 May 2026 01:30:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780043439; x=1780648239;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Z1bjz/7rhaTeuh+tPHkWYahNeapPNCsSFjc4nvAMGms=;
 b=l83Ll/CPqW7ok29oVJm4J+M1zpdcFuynruIqKkLgnCSCfWDyJy0RnSPYeJZo7x/nc1
 g9b+7n7pFlMFK4RXoVt1F6n9XhW+gR+JaJuPe+U5Uc8uOePZP/zAuluEIGJ2HEXrFEza
 9RDZmrJKz3GjdOoVTtYw9aRnz+jIuVQlxM7Rm4gBRxPGC3B0N3minoj/+KznMPqJCnux
 sk6Md6T991D0YooKnoSswYJdu0HmUxiafo0bCItHrmJeyGx40pROjriovfuPZhJa/GiN
 H7mbZR2EXt3l4JvC1TXWZDefkzWfRLYnb1TYZRbFfbXoxPr9xtyhPVcIggzJo9cJgkXl
 b0bg==
X-Forwarded-Encrypted: i=1;
 AFNElJ9IvZgnfyF6aQQMUYYUcXQXcdNd7RfLqv8BO0RTb5sLX1ZUDZFGC32bZSVY8rZqUglTop5mKDZ52f8=@buildroot.org
X-Gm-Message-State: AOJu0YxP4uwWmvFkZjV/AxLneVScRIfPmvSHnILwp1SzP2MaUhE3u6K2
 jpO8sfpbaApMrsNZVBLOd7XhKelPSVxZ0lZY2A7DeDlPR85m4/6oownWcQKfd2EY/J+7OZqJRIq
 1+z1C
X-Gm-Gg: Acq92OHOO4/r0tJPXGvx+5YCMIDYM/Ic9AYADEwPVx8y3xkEmcOiX6OuZA+7KvTrpnn
 SoTwXPNYdw/AHYOm2K4LeR254fyeerVNkVKwGGmnvkt18Jd3pA7dprsbSMMRnmLsjSFb+aML7xy
 zplIBlrDn40/bqlsc+gMzx3Spz1/jHm4Tlf0DuLC8c3ntJJaki43QeBLjyqhe+qNgamR0jAZyS7
 nL6G3wCaLz10MeY0Ud2ZfGUp/B3lesvhnO3UGRKlXs1505R0Dqdtk8bJV+I4y9bY9kMYZoEj7Ae
 AOPL6YzQnkHDoC2hJ09FOhUoZ3Ts5pMXIDTNhpG00U3MSGrF7xAuG8v7DAmVdTXNwiECMFDLo/Y
 iSc6Htl9SHjB3QEmvvL3nH3tIlJH9gHXBXVS1x0GEKC4AjdYrXr98WYSM/aupURUIb3DxZbh1C0
 46jNTeaOmX23+Xf+RvfgR5sCV2zo6ObBxeMBtvKVaz5baetEOy7Rf/BVSl+g==
X-Received: by 2002:a05:600c:6995:b0:490:8a16:fd49 with SMTP id
 5b1f17b1804b1-4909c070100mr35413065e9.6.1780043439129; 
 Fri, 29 May 2026 01:30:39 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909c123406sm11642125e9.5.2026.05.29.01.30.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 01:30:38 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 29 May 2026 10:30:38 +0200
Message-ID: <20260529083038.60273-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260520163653.1086908-1-bernd@kuhls.net>
References: <20260520163653.1086908-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780043439; x=1780648239; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z1bjz/7rhaTeuh+tPHkWYahNeapPNCsSFjc4nvAMGms=;
 b=aZcHCY2pHda4C8Y6907XILx0HhduxAPTa3mgjKPmGFRecqqTQFuDT6A237jQhWfN6t
 R7IVDZOHw8eoeLsG5MpMczfq4biYuJFUMQA+LB2SIDyIpnuURsTURXJTuio7NTk+dFXS
 PoK9DJTnXZHgsPmctgJxWbT6YqOtbCwK34pN08oFK+s2jNgLxpHW4+2NKAl1nPSg+Lu9
 ZInhnOszpu5d6dA5izgxf0+ZVp47yket1Xam+9Q2qIeIctm3+H2FhKI8N3CANaDfikHH
 pLWV2yq7oW7/LiidMDu47qonaE7aQuAyudJ1JHVQPrq8H/qtAkXUFq//acZyunVbahhl
 LTJg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=aZcHCY2p
Subject: Re: [Buildroot] [PATCH 1/1] package/rsync: security bump version to
 3.4.3
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
> https://download.samba.org/pub/rsync/NEWS#3.4.3
> 
> Fixes CVE-2026-29518, CVE-2026-43617, CVE-2026-43618, CVE-2026-43619,
> CVE-2026-43620 & CVE-2026-45232.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/rsync/rsync.hash | 4 ++--
>  package/rsync/rsync.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/rsync/rsync.hash b/package/rsync/rsync.hash
> index 933d330323..666bb5cf99 100644
> --- a/package/rsync/rsync.hash
> +++ b/package/rsync/rsync.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated after checking pgp signature
> -# https://rsync.samba.org/ftp/rsync/src/rsync-3.4.2.tar.gz.asc
> -sha256  ff10aa2c151cd4b2dbbe6135126dbc854046113d2dfb49572a348233267eb315  rsync-3.4.2.tar.gz
> +# https://rsync.samba.org/ftp/rsync/src/rsync-3.4.3.tar.gz.asc
> +sha256  c72e63ca3021cbc80ba86ec30102773f4c5631fbc492b52e773b3958f82a53d3  rsync-3.4.3.tar.gz
>  # Locally calculated
>  sha256  85c19ea50a224c2d0067a69c083584e5717b40b76610ec1218f91385775067dd  COPYING
> diff --git a/package/rsync/rsync.mk b/package/rsync/rsync.mk
> index 3282a759c6..5b4345d036 100644
> --- a/package/rsync/rsync.mk
> +++ b/package/rsync/rsync.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -RSYNC_VERSION = 3.4.2
> +RSYNC_VERSION = 3.4.3
>  RSYNC_SITE = https://rsync.samba.org/ftp/rsync/src
>  RSYNC_LICENSE = GPL-3.0+ with exceptions
>  RSYNC_LICENSE_FILES = COPYING
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
