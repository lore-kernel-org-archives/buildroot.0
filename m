Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A514ECCA46C
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 15:03:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 71C308164B;
	Fri, 16 Oct 2026 15:03:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zG8VdNbLCwuC; Fri, 16 Oct 2026 15:03:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8AD0F81657
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792163035;
	b=Vna1te0YVump2zoMXgfWhUh9thiEkbULi2HsW3bc93s71lq17oS9iB+mRFELKRnETUBy
	 HWQSbQ5T6UaJBnh0cFpfUu4apXr/8eWcpYMOffRHlkFsEAdokVE9042uD7paeN8c5GHz3
	 bN00QXZBGlLAmLwTGFy/uHVsvFwOLlbt2rKoQemVkPxupw2xGiy0OTjh9Pm7/WvFQfb9Z
	 D9zZgxBqU3h1W9FodEsvANy232f2shdx0ELeBgS0DfhjgAATZcMsmKi3D1CYhi9lvItkB
	 ZiuDHcuG1jRtafGMVWw2utFSTdjv5b+K9MwuPCnQa1amphtESrNFwyE2rmh0FUSIbCA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792163035;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=0BOX5SIDbgiBikNSxfLZUhe1U+/A4YHFLkDq/WCJJzQ=;
	b=Pcl0BvfbDJJsdxVuyVcOEhdVqJ8MMq+yvb6PLrZFbpCZ8fqC5IUrBvWJQNMXt1fGAZDk
	 TrQf1w3C/JPWGz7rK7KFKZflvprvhF6VYW8Tswj4PNMKfF5DBPyRslny2ZGhuZKOk/K38
	 o0uFRfs5NtJ0doK2+yVfLXKUfGZRANcyEKyK6GrD7hnk70BPpU0ZeUKJpQpX6xbmxnaS7
	 geTYeoCc3qPIpqoVlghJKD6/k+Zz6eAeFeLQbQO58XjoWKRQ3JiFETEI1rakRN9upzHmx
	 fonSXrtR3ijGOIXkpj/+CBkhz1A8QBCf9b5RgpjRcUrtdPA25fuSid2CyCgZ8lXInQA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792163035;
	bh=0BOX5SIDbgiBikNSxfLZUhe1U+/A4YHFLkDq/WCJJzQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SDJRgs4kwEQSvkIIC+iObfl3Dilj2IC0utElMPlZDqFWSwl48BasX6svJvhzdzgbp
	 M7nPo6/uEeDkvWpQuKTUGg9I6LGj7wgMLROs6OMpBaUGuhDWNPpKedKxf1xhogdFlu
	 6xHaQkVcfeFOeUSEnYI/lmCexjMyRJg0uqQwl5cwo4WVgv3Et7CKlVEAJR+kief93R
	 q94A82gM4syg18+QaGPoGkqNxnhHFkA6QN931owA5wrUP10neWIGziBC/iVGFMC6ju
	 KFW73x5FLuKh5rKzJetM33wrGdaIaqnCdYHkUVENu0H5dH6eBlbviT+/5BY1Rdgys3
	 slOWAkpFiVc9Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8AD0F81657;
	Fri, 16 Oct 2026 15:03:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 76D95255
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:03:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5D9064016D
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:03:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fDd1Ocpt3zVe for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 15:03:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 3A37740042
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792163032;
 b=b0YlrGGDh9+rT5GgL+V/z6a0ilcM/AVpTvfStM0tZZXUDrldMAvay71hlZaflG7WbETW
 fJGJAFpa3QG6TvKa2GAKqf8NP83CPhxqJE0NuTb07cZk8ZKXEBUDVrOMarWj+gV5Qf1xC
 GYQea4z/IG46X0Mq5EoSGTxWjR8k1nfQP2VNS0mvcQlSmjMu8Gz3We/T33dNGSy+0HPso
 E1jmO7HsLwu7XQ44d+04ohLlidkVANwXTsDiitWC6UwG4lqmTd7A6HxBRQ4Z8zmlrA4LX
 ctTa1Z7jqZCV52IQRnN6bg/d3Rkh6YODzB/Derhn3bHW+rBKiYSFPVcRy86ZAweMLlw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792163032;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=kJ2jVaqY3EpUU9BIyGd5uiWGt4pGKULR9gWaOoxVikM=;
 b=GeShNIz6K5gwwMH8yCe8SEY06p3JhcZmNjN3e3fwoOyp7skH4CZlKU7vlGxmHSVmphRj
 wcd5TmedXpZvOXdD3v3NOkTsEPeZqi6cbVRAn3J6fbsUv/sZcaKXc8W+eBqIeexdBvhza
 0Q8KWq5c0gM55hKW0RPsppXGdlFQzpDguiy3ipZ+7AeBq3dMVkGbq6SJCVtp9sN+UC62A
 ljTZSCcdjq9dO9k6IHHyynAn9bk4WELBsj0irRxQVQeygLeJDy2LX5/3BFEZBe3k+JwoN
 gK54YlH1S0pDJ4AaNXqvklRM0LBx8+j0e9KMITpGHDC/r2+azGkkh71weh4HBIckyFA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=YNGtSgE9; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::336"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3A37740042
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:03:52 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4a061a13884so288145e9.3
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 08:03:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792163030; x=1792767830;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=kJ2jVaqY3EpUU9BIyGd5uiWGt4pGKULR9gWaOoxVikM=;
 b=i1UfH82unGGcUPrIufdcl87vyv7OQHvmrkR2zVjoiW+3/0qdLW9UtxvXlxdGvCQNfI
 j2m2vQ4QHa3ja0Alb3OGm13v0MlXAFCJX8G/ltKd0qXXaPS72ILZfueu1V6jZybYGLUN
 CtJ/rCKQfgx8foqWWYyP7wUkZspcUuYruRVNlw42evuUXv/O1ApUZUij9f+UNIXbkK83
 Od8hjo+sjY48CfRd7QQFAkvoWq0820eTNVfvZZpsL0jqAJBxiiCrRHqtXNnTGJaM9eZr
 fw0KvLFbKtLyoZR1jsEDz4M5voPRVacamVg0P9i9FOvM65dXsZQ827BOgHpyX3tJuFQC
 vSHg==
X-Gm-Message-State: AFq9FYIAPVniUACLijESwYMH8JZPoD8lRRVCuVIfTMV6KPKdj73jafLX
 c9hz7/ZaDGvWUqCFvKQbXBYbp3aFPDCIfTmantASWhQUYdX4T2vxl3/WUclThOVrr+MEBCKyNLe
 c0YNs4es=
X-Gm-Gg: AYBFou2iJfyMr8PNxPFZQhYuVIcchTR7UeaamXO8+5M2hEwgyLoZUrOhrPcMAiRS0ZR
 bXObYmxOsHpOhLYZ9EghozG4MIux6A/3ROMxdrsyYxOdecKGChWqHSDplnNLTHrmp762U4Liycr
 lNH3wxi3lq1WWYbdcCLQN2pQtOTtVVdCmhb7uy5qtFInE1yxaifv0qrIfUaZ7vc8U1nq0WmLqhE
 WDq0+V/edzwkxj0jJzNJ6E44l+bIefoBh+kzTuk8UNefWRZjnP9qJDFQUaqxnfBxPD3GceaR5Z2
 JC53yYLiq63iEXBn13zGqT4awnLNeXlggGZIJA9rtrX1u3Buj2+0tDggOHRoSItqrCNlqoKJgqr
 xruT68C33rzz09Tfgs1mjog5ERgWTRGBEzkVnXLHVhuolzUsDWtC/j1a0yRmvra2+266qdu8dlm
 ybiixSSIW/RS/akPg/4mwNseSz5AFYo3sVnBdwOxB8FCU0z4Wwfto84AulKNVcNButkqLQCYTeb
 OAgve7Jal4HT47JsICZ2Ge5QF+bJ1ekG0c7meAgzKg=
X-Received: by 2002:a05:600d:4446:20b0:49e:6050:9fbe with SMTP id
 5b1f17b1804b1-4a1d75f9e85mr1210115e9.15.1792163030254; 
 Fri, 16 Oct 2026 08:03:50 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1cca26dc8sm42305925e9.3.2026.10.16.08.03.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 08:03:49 -0700 (PDT)
To: buildroot@buildroot.org,
	Yegor Yefremov <yegorslists@googlemail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 16 Oct 2026 17:03:46 +0200
Message-ID: <20261016150349.66660-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260922132648.3229462-3-yegorslists@gmail.com>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] package/iproute2: fix build failure due
 to missing BR2_PACKAGE_LIBTIRPC_RPCDB
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
> iproute2's configure script enables HAVE_RPC as soon as libtirpc is
> found, and misc/ss.c then calls getrpcbynumber() from its RPC service
> resolver. Since the bump of libtirpc to version 1.3.7 in Buildroot
> commit 3f3d6e43de9b4aac7df8545fd811171256f878d3, which includes upstream
> commit:
> https://git.linux-nfs.org/?p=steved/libtirpc.git;a=commit;h=7cea8ad66aecc21e6caae330b5d31075af399193
> that symbol is only exported when libtirpc is configured with
> --enable-rpcdb. On non-glibc toolchains there is no libc fallback
> either, so linking ss fails:
> 
>   ld: ss.o: in function `init_service_resolver':
>   ss.c:(.text+0x2558): undefined reference to `getrpcbynumber'
> 
> Select BR2_PACKAGE_LIBTIRPC_RPCDB when libtirpc is enabled, like lsof
> and other users of these functions already do.
> 
> Fixes:
> https://autobuild.buildroot.org/results/390b7ed00da20c2349fe069ade4a65404834a484/
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> Assisted-by: Claude:claude-opus-5

Applied to 2026.08.x. Thanks

> ---
>  package/iproute2/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/iproute2/Config.in b/package/iproute2/Config.in
> index ab9e515eca..106a0aaf2c 100644
> --- a/package/iproute2/Config.in
> +++ b/package/iproute2/Config.in
> @@ -2,6 +2,7 @@ config BR2_PACKAGE_IPROUTE2
>  	bool "iproute2"
>  	depends on BR2_USE_MMU # fork()
>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4 # __kernel_{u,}long_t
> +	select BR2_PACKAGE_LIBTIRPC_RPCDB if BR2_PACKAGE_LIBTIRPC
>  	help
>  	  Kernel routing and traffic control utilities. Provides things
>  	  like ip and tc.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
