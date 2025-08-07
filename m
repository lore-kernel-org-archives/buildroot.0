Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF359C87FDA
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 18:25:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA49780EB5;
	Thu,  7 Aug 2025 18:25:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4BGguOt4SLme; Thu,  7 Aug 2025 18:25:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9280480E5F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9280480E5F;
	Thu,  7 Aug 2025 18:25:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D0104C4
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1EF83605F0
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TpJnz4xJz33N for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 18:24:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3EF4E605F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3EF4E605F1
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3EF4E605F1
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:37 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3b783ea5014so693840f8f.0
 for <buildroot@buildroot.org>; Thu, 07 Aug 2025 11:24:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754591075; x=1755195875;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MlgDnhb9T2/BD3XiQfZe215CjpwTO+hUt4WMYfFSXIo=;
 b=AMopu4QelYE19QmehnXbn1e2wcke5g9bivKdxH7kShif1LpZsOnWwdhWW6PzIWPaMp
 Z7gdr6NTfQ854Styd9vRIk+R2ckhegmxx7RRv4WLpWscf77eckNcT7iWqkKYsVHp4FfA
 L4uFuYz/sT564JOkwhK6K2mA88MQO7ACmEU1P+gr/M3w9gxNrmdumEcoPBEmank/nrd4
 AFDGKCs4Epm95UbOE5j/uPkboFNfWYC2dUN/CoJROAjTXUggOdQsbx7aNiXnat1HAK2E
 7l1qjqS+S55kuVW1oyocff8Q3FfV4o2VO61n3VganvotMie3n6AH2oziSyIwdNCqfGI4
 xIjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2TcyFJ+2kr8trmhz4UXyQxlP2xQRiRUvXePUH/js9OMA3sG6CJH/Ic4Lhh983GB7uq1Gwn7togak=@buildroot.org
X-Gm-Message-State: AOJu0YwLNa6mEV61DnSR2igpiAJd3RLHQEzYFd5kq55bCqWAASs9pr5S
 XSKWSQC335PHw7hYqjdVNu7fO5RgP5PtAIxd35Jam6hgzABS95XosH/0fuq/E9JqfAk=
X-Gm-Gg: ASbGncskPlFZ7ReqKrMU1z9ZiI72hy5gySWmlHXKYRs09+IpEfnceqQtwhXebGEa99Z
 pScVWMSc6qFcsKAdr7whDyg/pyBDOrMbqoSmWlrlVinMrvlBbddSgwum7S0I7aU9cdhku0mImUP
 JO+iv5uYysGuc/BToAquiDHULY6+9VH8qfEtihddTM0bYpw4yyvgsDtVgl4IVuc6qKTGBIGMrks
 FmwQQr/Yjz1cq3WY4WDQUG0Hz8BI3m7O9MTnLBEhCOZZ0AFXlTTjk3kkcJ1d16aMqG0uTPvsVdV
 ayNl3ol3W/srCHTXGZ0PgipYdsdA+EypgQHjnei/k+olYunjYN5kQaVMlJNE422/i5EKSGubOo9
 2jGTa5vj8Zlg5Cg==
X-Google-Smtp-Source: AGHT+IGpteiTJRYVMai9SEO8hPtU8qpYLRgSbQXMCqm76ThbuBKZcb39UrjZKws7JOrQykJLezGWBQ==
X-Received: by 2002:a05:6000:2908:b0:3b8:d082:42a with SMTP id
 ffacd0b85a97d-3b900b5509amr196143f8f.45.1754591075362; 
 Thu, 07 Aug 2025 11:24:35 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c338c7dsm27695628f8f.0.2025.08.07.11.24.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 11:24:35 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu,  7 Aug 2025 20:24:34 +0200
Message-ID: <20250807182434.725735-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250726055908.3395125-2-bernd@kuhls.net>
References: <20250726055908.3395125-2-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754591075; x=1755195875; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MlgDnhb9T2/BD3XiQfZe215CjpwTO+hUt4WMYfFSXIo=;
 b=an+PQLDF/MRqMhrBhUo0WnunwvCecv9Ofm0gpWlARe+4S4LJ5XIrZIlzNto2W51jcP
 DU/PwzftZ3VCUqDGpiGx1xvL4/5wIZcpPvOML1UqGFKV4VW3eHgbxROqZP2GBmWNsR1/
 DOrM0/HI1gJK7FZscNKkNnasJQe1y9mBGCWmLejllhBj8SdWSdy30k/KAmGHUItZCpJu
 t0MCx19Ix/7D+5V0O27aTL2DVSkWjdxsY+wjwyIaT8My6adgjFmj0vuDEaiKGFRsf40L
 EkVeEm7LYO/lIRxPKlfvBt283HI5Jrd5sZX03jTctQRRanUyAGcSIyiDedbVJiA3VsCA
 PwUQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=an+PQLDF
Subject: Re: [Buildroot] [PATCH 2/3] package/libcurl: remove configure
 option --with-random
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
> Upstream removed this configure option in version 8.10.0:
> https://github.com/curl/curl/commit/269fdd4c6ed5d837d57448ac977f6f300968df15
> which was added to buildroot with commit
> d68b999787a0e0838c3bb2d5966f11d8a349a49b.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  package/libcurl/libcurl.mk | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
> index 114ff3d70b..51716cd45b 100644
> --- a/package/libcurl/libcurl.mk
> +++ b/package/libcurl/libcurl.mk
> @@ -20,7 +20,6 @@ LIBCURL_INSTALL_STAGING = YES
>  LIBCURL_CONF_OPTS = \
>  	--disable-manual \
>  	--disable-ntlm \
> -	--with-random=/dev/urandom \
>  	--disable-curldebug \
>  	--disable-libcurl-option \
>  	--disable-ldap \
> -- 
> 2.39.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
