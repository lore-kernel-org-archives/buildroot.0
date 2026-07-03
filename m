Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E76DC44500
	for <buildroot@archiver.kernel.org>; Fri,  3 Jul 2026 14:32:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D47E4121B;
	Fri,  3 Jul 2026 14:32:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gU9z3GcfEfGf; Fri,  3 Jul 2026 14:32:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D016B4117D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783089141;
	bh=3M6qKni2a+j+xoVZoee/sqwdWUKjsMjs5xQOVgoevtQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MgE05gW8LxDHTzewe7GDKoN2oQK/PeluZ18g8JitQPjndpWxShSBbphRd1wSZCSoh
	 kIkullkZEwLpMMGe8D05fZp47v3D5F8wEuIdNvjXnKyUWCqlck59gTI7XMg1HvaQcF
	 KJ/3Xuq+HCBONtKSTARq1936ryGp1Ip9hJbpJlUvWaHLAGzE+Da97CUfF0F2dVhbCS
	 DlcXc12fnAmiw9eysQldCK6paMaoLBN/JAxFu5KG1ocZKfOSJRaXi4DFzuweRetoMq
	 349GV9LpNF+JEjV5T1mHQm8TN/SCxCtSMprf7aKhLak60tIGdonJ6xfL+lDcWZ+GXv
	 NZ1tiuhGtGCjQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D016B4117D;
	Fri,  3 Jul 2026 14:32:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id ABCC114F
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:32:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9CF6660AFF
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:32:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5aOuxRnQ2IPl for <buildroot@buildroot.org>;
 Fri,  3 Jul 2026 14:32:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A0F7260ADD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0F7260ADD
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A0F7260ADD
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:32:17 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-476a130c138so637789f8f.0
 for <buildroot@buildroot.org>; Fri, 03 Jul 2026 07:32:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783089135; x=1783693935;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=rq9EHUJIUHM4FUIe9wGmTvnuqU1JeGkhEubVgnwUAuM=;
 b=EOwjIgltLrNxApB5epyWjEv6FOoXnku9GCyH4a7uwnQPYnaqCcs58tIwXkDdyY+FW0
 Jv1QYRn7y89r2HvHwv4Tl73D/lzDZVnj34yIHkSdAzhoa8jzh8+nojZKnmruDl/5VA2T
 YbQ+ZNM0ThNCHGtaTrOTqB5sgwff8ZHQYg9DYtLpDd3yktJkQD97HocWCIzRh09+HZ/z
 y+tH3+3D+pUqCu+BZ5UuVIG37QKxApPAdIxsqDrkOiLJz1X+3wAC0x1Oz7l0UxZl67gR
 +Gj7Zq45Vl1YE3C8jQCzHbEU+F79dXfemZKo2n3BNnm0d3LWNQNgN0mnGjQLsDtf0QTl
 8ycg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8GuQNgJAXFiPBjhXcMFZPZ47Zl803GE0/hPz/VkZkF3hVNMUPeIYHQrhBWylu0T52ejbc9T0uQRtE=@buildroot.org
X-Gm-Message-State: AOJu0YzAPnoju0mZBYD3qjKZ5yW2wb6h82HCMHO0RhiudDk+fKKKWTzz
 S5nce9F2CAQkxOEMvQGHuNdcLA16k3JCyOtGhor5JNPy/7ZNbuCEeUtld2CQXvEVMofFu6SNa3e
 zmk4K
X-Gm-Gg: AfdE7cnoOQVVJFHjmSu2dndsbrniJ5Xabia5/Uc27E1wGWh/GPV+Sv0EYe1l+PSHM5z
 6OiVIJcwtFyHcZ6hUjR4RwbEI1fX0LeJihKVnbU4z0w7rsz3/4YUCGiKRwA+1W/Y0bGb4JlYrbc
 /e+lB74xrjsj8F54/iJKAIIgk0IISmBKeLrxaCYk5i+bcH/V6vnnSRpaL4RiKNCbnGtICKAafqj
 dqmCuY74GsEHWoQpcMQyY+1RsYkvcH257PYwFCpHtn5z0uXwk7Tj84MJeoMUb6AsDPaCbeQ2w+D
 XAFU0C1o4hLJFg8eXVDFic93G08P5IyIV0CoQ0rEB97W3B87R4OFhfy1JS1ttEp+ERsJ3bQbun7
 OSsxDF9B6/xnV/7zIhXgmTWdSAwenVn6Crn6D3rZ4/N0gq5ktgq6wrsUEsyGPHECGMxut82Ll1O
 ai/j6p
X-Received: by 2002:a7b:cbca:0:b0:493:bc4a:c6b5 with SMTP id
 5b1f17b1804b1-493d0f549fbmr855415e9.39.1783089135346; 
 Fri, 03 Jul 2026 07:32:15 -0700 (PDT)
Received: from arch ([77.109.126.77]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-477dde19fd3sm19464005f8f.25.2026.07.03.07.32.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2026 07:32:14 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  3 Jul 2026 16:32:13 +0200
Message-ID: <20260703143213.274437-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260421190443.2722764-1-bernd@kuhls.net>
References: <20260421190443.2722764-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1783089135; x=1783693935; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=rq9EHUJIUHM4FUIe9wGmTvnuqU1JeGkhEubVgnwUAuM=;
 b=dM/BSWLfIAoz2vFP58fX0zzTeJEVRT8E6hx2zIivQ6ou/9MVAYHqebZE/QOjmVdVoD
 DeOx9HRZyj6Q9ebiM83Vje1AJFJDD+TMZJCfLD5V31w4c3ZNfpcid8zRYVbHAyqCTTKP
 DkZ08nX0BE9WxVWs0E+TcNWvtkD4HCSIUfz8rxUlh5xpx0watUOODZ+SOp4aLW8xsfCQ
 VnhqF+AZMATFwxum1RZ4HG9Oug3bvNHvDasCYPvkwyaum0w3tdSFQ2HPi9MgP5Q0YXzY
 8rNACQwb+pXWY99vnNLOKMH11dwtpHllHY90GsI7UwSe39widdlqVb5ystzrOkA5dJBk
 8BAg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=dM/BSWLf
Subject: Re: [Buildroot] [PATCH 1/1] package/cpp-httplib: bump version to
 0.43.1
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
> https://github.com/yhirose/cpp-httplib/compare/v0.41.0...v0.43.1
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x. Thanks

> ---
>  package/cpp-httplib/cpp-httplib.hash | 2 +-
>  package/cpp-httplib/cpp-httplib.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/cpp-httplib/cpp-httplib.hash b/package/cpp-httplib/cpp-httplib.hash
> index be9967f1e2..f3e05951e9 100644
> --- a/package/cpp-httplib/cpp-httplib.hash
> +++ b/package/cpp-httplib/cpp-httplib.hash
> @@ -1,3 +1,3 @@
>  # Locally computed:
> -sha256  6d38a6b74ea33ac3133b8352f2b55b557c1d42f36e1ed0c01f852e3218329d39  cpp-httplib-0.41.0.tar.gz
> +sha256  000832a5b50b67b82a77845c09d832f6e492011cd0ef1d4f72f808eb6a4fbeb3  cpp-httplib-0.43.1.tar.gz
>  sha256  4b45cbe16d7b71b89ae6127e26e0d90a029198ca5e958ad8e3d0b8bbed364d8b  LICENSE
> diff --git a/package/cpp-httplib/cpp-httplib.mk b/package/cpp-httplib/cpp-httplib.mk
> index c4a77b869d..e8bc0a56fe 100644
> --- a/package/cpp-httplib/cpp-httplib.mk
> +++ b/package/cpp-httplib/cpp-httplib.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -CPP_HTTPLIB_VERSION = 0.41.0
> +CPP_HTTPLIB_VERSION = 0.43.1
>  CPP_HTTPLIB_SITE = $(call github,yhirose,cpp-httplib,v$(CPP_HTTPLIB_VERSION))
>  CPP_HTTPLIB_LICENSE = MIT
>  CPP_HTTPLIB_LICENSE_FILES = LICENSE
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
