Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01520C52D7C
	for <buildroot@archiver.kernel.org>; Thu, 22 Aug 2024 20:21:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C486781AAB;
	Thu, 22 Aug 2024 20:21:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 96UtKCfWF_Iu; Thu, 22 Aug 2024 20:21:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD73B81AD1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD73B81AD1;
	Thu, 22 Aug 2024 20:21:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0BCD71BF59F
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 20:21:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ED92160E0A
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 20:21:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1L5ZqfgwIL36 for <buildroot@lists.busybox.net>;
 Thu, 22 Aug 2024 20:21:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B6FD060612
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6FD060612
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B6FD060612
 for <buildroot@buildroot.org>; Thu, 22 Aug 2024 20:21:27 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a7ac469e4c4so220801466b.0
 for <buildroot@buildroot.org>; Thu, 22 Aug 2024 13:21:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724358086; x=1724962886;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=svmVu930juQZkGiSmQBv1FnYxxo3M1lwIaroZQgM8nc=;
 b=DJMgbAU8lVm+rM8SHLvM/sWLJgW5RuveJONKIJk7HZEbzGh0OUwowoQf+od6ntzrcv
 SrB41HgSbd8RAEN9sZJuvj9GyT5q2AMC8H4BwWftb/E0ROl6lUL0eZCi6BZmVcoOe/Al
 Xi983uUHlWcogzpVSvYVVUe52jUSvJSImskJjhQXKIehhGXPeElB3dWuCG3IniKjmmR9
 pZ1XKV3m1gkGDzqo2h9B2JE+2whC8/zYsFTyKZrcVY7s3D70DByu5d1cX0Skl8oFluZb
 HWEk9vNMFDKLpzHKSXWbxhlbksRty0IbTGL41ukfhVJyl0+VZSCXDJuPGW8fUEmqlewP
 tYzQ==
X-Gm-Message-State: AOJu0Yy31Ieq5VNgPqPEOc9EydlkxaGUssyNx/IRWUKtCIRLgvj39Nc5
 51elmAL3RWQjD8qpGaCKEj3xCbkDC7K8HdrQYDxQLtpX6Xsf4sYp
X-Google-Smtp-Source: AGHT+IESyE6j5dUn/Ch9h9jRTPmfoYNsUmKwqQZFC8kAdtRL7NouZ96kAmilvWDYYblsSynoEAf/dg==
X-Received: by 2002:a17:907:3e10:b0:a7a:afe8:1013 with SMTP id
 a640c23a62f3a-a86a2f14535mr21703766b.1.1724358085169; 
 Thu, 22 Aug 2024 13:21:25 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a868f222b23sm163045566b.19.2024.08.22.13.21.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2024 13:21:24 -0700 (PDT)
Date: Thu, 22 Aug 2024 22:21:22 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240822202122.GF1160317@pevik>
References: <20240822182050.65230-1-bernd@kuhls.net>
 <20240822182050.65230-5-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240822182050.65230-5-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724358086; x=1724962886; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=svmVu930juQZkGiSmQBv1FnYxxo3M1lwIaroZQgM8nc=;
 b=gGqUSk28ph7dGsFY9FwsOfRwT7Kjl55tsxoYzTp+fgy6u551SNsDRs+u6ueFyQfxQg
 dC8K4VFmRo0w2QukSfjDaqZr4RxPIRE7VJnirhW7eLeorG16dscpiUQzdw8pbXeJgA/n
 UJPwUPJiyq3uQhD2gJy2WI+yYdovUstESqv+JpkAlBAe2puWdFHNZOmcdfooO/zYofdZ
 IPHpip6CSbUQt+rxMkcAghuZ0I25wZetyWR304NNfLWw6JWGysp/Z29kZ4f3MiPmY5rM
 WlscezwpTDg5Qu4UVNPoBasNH0P39Kv0/c/8TTOUN14F+tEZ7uuUhOG8fhSYnN8gj2Pm
 TCsg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=gGqUSk28
Subject: Re: [Buildroot] [PATCH/next 05/13] package/libcurl: bump to version
 8.9.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Marcin Bis <marcin@bis.org.pl>,
 Grzegorz Blach <grzegorz@blach.pl>, Asaf Kahlon <asafka7@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Louis-Paul Cordier <lpdev@cordier.org>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Bernd,

Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

+1 for Baruch's note about CVE-2024-7264 (the commit message could be amended
merging the commit).
https://curl.se/docs/CVE-2024-7264.html

Kind regards,
Petr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
