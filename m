Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 036A3CE8D6B
	for <buildroot@archiver.kernel.org>; Mon, 17 Nov 2025 22:51:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B05083BC0;
	Mon, 17 Nov 2025 22:51:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sNppB4KnXkry; Mon, 17 Nov 2025 22:51:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7CC782F51
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7CC782F51;
	Mon, 17 Nov 2025 22:51:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C75DD5
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 22:51:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 11D43826C0
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 22:51:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N78POifEX-Dd for <buildroot@buildroot.org>;
 Mon, 17 Nov 2025 22:51:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 04603826B4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04603826B4
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 04603826B4
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 22:51:24 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-42b2e9ac45aso3068327f8f.0
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 14:51:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763419883; x=1764024683;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=gGxnQMiSR1pBnOGnx8yE3BeCYAIP71An53UyAW0RxDM=;
 b=HxGw4MSFWsGBID9cm5JSYfVmnpihyN0+htsnNEtOVJWP6k7nmVZZt2lUapSSl3l3nX
 x1i4Rxf9hADaDHTaoXkyCfwwgbySWTVsdyEx7xsvVcc1U19drHd1uw+D/BJ1iR3s902f
 JA75yIpn/y9sT2DqUhxy3PfBaAP8HyJ6I3vabLNiESX9b5+0ZUNevxebmrf4s9LWLL4A
 zvfLIDVquIeWayC/83JpCJfQbZNH1JF9ySb0DYbPftEHByljFnUEcrkI0BQrhkbfb1uV
 P5pQ9zr7GMIKdDzZAOYYl7/3rcus0Eow3p2l8IXTu0rsSehrdtavTlYV7fbnccoKRrk+
 OgMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjIcof2nxl2pe+lZ2jwoX7ObxANfLL903Mdw13xraOrbuDd6yCYoOReGrr2ekAApkR47VvIccq3ps=@buildroot.org
X-Gm-Message-State: AOJu0Ywl76c9jtDa8pha12mJRzWO0GjZ0P9TRDYkVuJoIb1g+K8GVXb3
 JcQ/HtgU1++dpVAE4nVN6ZPNDzhz58TOrOt6mH3K+n4n7+afVzDr9bNm
X-Gm-Gg: ASbGncuDggD1v72IQJlK/FT4esr52kGqykxmsh2+gE0Jy1uZ6YaJE1AwJ/OJMLZX3cS
 m4OvjlJKuqIF78thD+ouUsC6RB7lsuQQK8srjzlou6Kq+1LNpmccHRNSzzBzhJKda9SLYl0cl+X
 2sEsLsfqF7UIKwtCbZhIethn4rM7QRNVlvprk6VDkNWO+zxA021wkLAeWjJYe5ENqmDhLXvISc7
 06kp6DwEA5R4W3qz37QhWkbr0pwNc3hG+s35dB0/3xfRbr1bHV3ah/BMq/7tpRvwf/UBGP0X2f2
 JCgrFe2K1V/d0aWm/YxPPz99nF8JB7VagbOodznqzf452FtOAV31Niv+BCpRMTYitHs0Xya5Vrg
 c2W2uhca2VRGNLv822rNlZK5FCq4YHIuV8ZTVB+U3OY8Y3B2eUMgTuF+02VrGfkkQEzrXvjGpC9
 M6zYZq4r2PD+qSZQ5rjlsK7VVhMXBx1tRUYqshlhyKTAk8kvFK
X-Google-Smtp-Source: AGHT+IHCsHZbA11ZD1L88GZ6DTAPytVZg6CwmPczXYchzph9uzn+6OV4KZjoO3TqudRPpv8yIEeuEg==
X-Received: by 2002:a05:6000:228a:b0:42b:324a:b9c8 with SMTP id
 ffacd0b85a97d-42b59345775mr14947947f8f.3.1763419882700; 
 Mon, 17 Nov 2025 14:51:22 -0800 (PST)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42b53e7b074sm27634960f8f.7.2025.11.17.14.51.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Nov 2025 14:51:22 -0800 (PST)
Date: Mon, 17 Nov 2025 23:51:19 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Message-ID: <20251117225119.GA5693@pevik>
References: <20251115230847.2727702-1-bernd@kuhls.net>
 <878qg5wv79.fsf@dell.be.48ers.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <878qg5wv79.fsf@dell.be.48ers.dk>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763419883; x=1764024683; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gGxnQMiSR1pBnOGnx8yE3BeCYAIP71An53UyAW0RxDM=;
 b=lIXzkvTfadNJ+x3c5UzgZvD0raarAK+Ew9SSMaG9p4RspdxscfbcpY8qpqL35LslhZ
 y02qCyP+vs8pHL13Mpyq1cbOp9lRDPjXWIAUTX3BYwoC7IgyjOhLyanZEWSD99elcSAn
 y918D1LRD5yMD0plJXDoR2NdOiPRppTk3LYdG4r8DM01REG7g/d3h8RhobTXhihywAZx
 uegPKEc3TJOjDdIyk+bSb90EasKtoXQvX1aecrXNzEg2Z8FYzTUa6hhD1bfLZztTtzHU
 rUHnqkfsPMfc5gCEuj2Xz540tJj98cur9DKY5mSwpa8Kc/A8yyVEdDWJFeAAwJLav/Hd
 wEsQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=lIXzkvTf
Subject: Re: [Buildroot] [PATCH 1/1] package/iputils: fix merged-bin
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Bernd, Peter,

> >>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

>  > mv: '/home/autobuild/autobuild/instance-2/output-1/per-package/iputils/target/usr/bin/arping'
>  >  and
>  > '/home/autobuild/autobuild/instance-2/output-1/per-package/iputils/target/usr/sbin/arping'
>  >  are the same file

>  > Fixes:
>  > https://autobuild.buildroot.net/results/dae/daeebb090f6d11d77840dd61add9bc422c6bc2fa/

>  > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

> Good catch. I see we have a number of other packages doing something
> similar. I'll send patches.

> Committed, thanks.

Thanks both for fixing this!

Kind regards,
Petr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
