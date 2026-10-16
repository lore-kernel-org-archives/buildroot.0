Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC8F0CCA46C
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 15:03:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BCDD8087E;
	Fri, 16 Oct 2026 15:03:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xvuLCebE6u19; Fri, 16 Oct 2026 15:03:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7FE7880935
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792163021;
	b=mNUZVRaXniiiKZNzYEME62yNqdWvtRiBHX+AetZ1g1TVg9QxwMMJgidl+lZQN5kHlFbR
	 x5e2yYglwDQYYzwguLx7t5p0fPH8x5lyvB8jyWIxwWl/QizrfMW6BOOIef7Ho2ltNNhYw
	 YflLpX/dhbZ/hUYUtMbkGg/BTCSFhNries2qwl9WpiO349bknHQhBM+6mmo3Q6UxNb5+f
	 9h1xAoPvSGexX3gwD0YGLhLXS0ShSO9iwuPQu+cZW2TOD0VGPoa7rGfk23sNddl9pwCUH
	 bOZSjaC0/7UrLKzlOpOyYcOHD4W9m4SKTZmU0yt2tr4yzgRb7dhj8LGADVqBZXFMbwA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792163021;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=AfV+xu79Hn5noqjjETG6zIFhcr0KlhWyrdbetupSnxg=;
	b=JC5+pOabLCQu3rlXGEYCVMmotiP624HUUwtR9HNuLD5LQKuQYVTrCWflH7+KKYAz9y8v
	 ZTIFFVcJl+n+eydBSAF/7xyWXOHDhSwnr6BrwC4sDijXa4tOEBJXg+V6+PXgpUfg8lcrb
	 nanLvPkBJzI3dIHl5NEAnUmDkpnS8Ho8+qk+0LrH1QiewVynwT/HDvGLSWPC2IdCNkUi/
	 9SzvomlasJ4OqKYUprzCJlW/2xHPJb6t7SOk77bFhwF/qM0qAK2iowTnzyX4gmjDMnGDP
	 Vr/xecDrnIDTUvQJ9DtuRocOVhYSw25T+IdMtmTguzb6CnXVN7mIZTT3S9YeKFvRqAQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792163021;
	bh=AfV+xu79Hn5noqjjETG6zIFhcr0KlhWyrdbetupSnxg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=csCpa0npIrJcTDcJP77GkWqGN6q18CzppeT2m2vo0iU0Sn2CPbqKP0ykrRAahu5sX
	 fe/rHYzpPKnVdvtvj4uT8zMuiXTGgrtp7r06WF0+NAoxJFvguPN9+V68UJJcmyPZKO
	 87rdSKLSK/RWsSE/DlTWUHopmZ4XShSRmNh6atG31lEjOt0cnVAesK48jmkYbC0v7K
	 H33ju7g7v3sNurg+3VDKCA25gmD+uo82SPuGOe4GpzFae4T8djKhIotUnOmybNj0B7
	 L7SEzkSs0z2EmH96nbZHE0sSSxHuX6HM4L+w0VSmHT/OiJ82W5Ry7FPnNY/e/uHy0l
	 3NczSL5pDD6rQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FE7880935;
	Fri, 16 Oct 2026 15:03:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 89C71255
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:03:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7BF464016D
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:03:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jtewXJ9WPsHq for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 15:03:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 5257140042
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792163018;
 b=IiATzL/qq76M3glCtyrtUaOa8/07Tr+/Co34//osZBG42SCbjA5CqIseoccMOYH7mCQh
 b42XzmngIPLq9A/MZTB1hT2me7l1krHq/Qh7owazJ71Q6paM93zUxc+8/v9l5FMi49xsp
 l9Y6iUjYe2ASZE2GTbg9/8lwJXrkrqbC07o6OmE3biaYQxWs1gBYEVtEIAys58fxqL0BJ
 fpDK5O9HTjNe6b8lBFGj8zCPXTCHfFv8UsepJ1T+iRzuFoAjdl5Hs3wDTTlAuFFdi9oQ8
 29j8hUrJJYIqykchmS36Yma30dKsXh7HJ/ta1aocWIbsN9VbTYugYgCBKkttfN/JWyA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792163018;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=uqYQfukLJ7EIjwgAaRzz1siwUx41me13Z95+FaPS4JA=;
 b=DJB9qnqIhAv13W2Bl4wqq3cfYyhHfRa8wv0yPPvby5mQKFxr9/kck6Rj8F4MH0YzW84u
 +e6ILoNU6kWHqK81ZeFaC0lUAAsCyXhm2agTTCSFIU5LNY19hEokTOrLHU67svrJ8ovqY
 sEwPWLD2JMs3/6SkiK7wmbQeSMeMBWMfqfszoWomjOgrHOIyryJyZZz+12Ub1sQ8m0/h9
 o7rooRkGzf3RYhqgtFFWrukwGoLyVyYOFJvJ3dqZkCs9rv5MYAxh1c3FlCVaMZ5ADpXez
 33c6Ue4RqSa3V7Wu6poMbGeDL48Nr7YOxPAn8i5mHxVDWCiw8J4ICJmo3U1426tsxuw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=avujgCjq; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5257140042
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:03:38 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4a16aaf2067so715615e9.0
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 08:03:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792163016; x=1792767816;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=uqYQfukLJ7EIjwgAaRzz1siwUx41me13Z95+FaPS4JA=;
 b=MuGvPMIAOi3NRAico5k+nV5AEXl5zZXFDNtZaEbWSwaxjs0Fbcj5BVXhc8XeKTXYTf
 JAVDkuEwJ5dBGCXzpW+Mxz50b20+qlwd+PzTkDKFwlUAbYNSKbPqtvg2uaG5/xncUpiM
 k+XH58EQmBJeiipaD62UUENn6Ji7VezFouK5XbRW4mQH7n22Rq5xni1Ru/jCc38/KQXF
 UOrC/H1eHbx/XFbgiQxLG6121x7nOhymXjDSRUcySpkk3eqdeeLUGKby/00J7rRW2Byf
 +glFOqcJ/BzakN/JehqBj472Us9Hq0HeM8UmKHGEnH85Sk7omEktHia4bBShb4hBg2gt
 pv+A==
X-Gm-Message-State: AFq9FYLH6yI/YGZxZFtJEV5PpE2cohmbvIJorqxEQvckJBHfWd4m/AEv
 /IGKqOzye8GlPY/ABmxyOfAJyrR3DCxMBhHoT/kb7TmOL2woCHQsel12DgRNSXee7ziRAEWj3N5
 h8FS3jho=
X-Gm-Gg: AYBFou1HVuxXgytGD4AYKRh7NQ+sQrFVVvvOF7lKClOlgXEvjCqZ9ODa0rwaYKjFT7T
 rCrI7KUqsjSPWB5ua5rOGHeMQ5txHwFW5Q2BPONxWoar98LkruyGOdfMW2RPaM8fGd/foNasB9F
 JxLM44ZDaKfG08zLEK73cMtqxLBxOG/QYqTXMQ9wgoSQ97cp657np0ApXDKoY2oU69EOmJjspnh
 GbozRkDQHAyEmqE10z/0dABT7kf05VGjiRQqBWMj16NeMTdOlB+SjX2VowvdwA0id4c/OPrUNdF
 KrJeLkPU7OH5p6AO30rsQ3P1lT8CvlzQuO29Yu1LarcDTifdrNg0Avhwkgv3rDi7XmosYiFhP9o
 MK5WVG2+iPm1WOix5Qi7ct65DvzyVZ2oNbSICy5l/2Tmp7g6NH1DiQbqotlsUJStCnWzyqLcE3o
 9GQGdI7Qr707SfXHW6+DI9GrKiCVpbGs0e4nwZJVPMJAVdJ8jKU9vSMCF0FEzBN6OZ3X+tai8oS
 0kuR2+Zqx3LMFSalxV+sPjm5dVGNR9LyvrwORwW06mn73MMDWko
X-Received: by 2002:a05:600d:8496:10b0:4a0:159b:d2a2 with SMTP id
 5b1f17b1804b1-4a1d762c59cmr845205e9.29.1792163016300; 
 Fri, 16 Oct 2026 08:03:36 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1cca31234sm38188435e9.4.2026.10.16.08.03.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 08:03:35 -0700 (PDT)
To: buildroot@buildroot.org,
	Bernd Kuhls <bernd@kuhls.net>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 16 Oct 2026 17:03:30 +0200
Message-ID: <20261016150333.65900-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260920175043.369725-1-bernd@kuhls.net>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 1/1] package/cpp-httplib: link with
 libatomic if needed
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
> Buildroot commit 8dad17ea06260ef0bd23eebc47c95a8510310bf5 bumped the
> package from 0.27.0 to 0.37.2. This bump includes upstream commit
> https://github.com/yhirose/cpp-httplib/commit/464867a9cedef2b6185e25e3e912d3f796fe58fd
> which added WebSocket support to version 0.33.0 and causes a build error
> detected by the Gitlab pipelines for bootlin-sparc-uclibc:
> 
> /builds/bkuhls/buildroot/br-test-pkg/bootlin-sparc-uclibc/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/14.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld:
>  /tmp/cciyXsAR.ltrans6.ltrans.o: in function
>  `httplib::ws::WebSocket::close(httplib::ws::CloseStatus,
>  std::__cxx11::basic_string<char, std::char_traits<char>,
>  std::allocator<char> > const&)':
> <artificial>:(.text+0x6408): undefined reference to `__atomic_exchange_1'
> 
> To fix the problem we add -latomic to LDFLAGS when needed.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
> v2: Added -latomic to LDFLAGS (Thomas)
> 
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/2364b86e92f24042ca7f9494b427321527b26adb
> 
>  package/cpp-httplib/Config.in      | 2 ++
>  package/cpp-httplib/cpp-httplib.mk | 6 ++++++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/package/cpp-httplib/Config.in b/package/cpp-httplib/Config.in
> index 9bd93ee0af..83251e8eeb 100644
> --- a/package/cpp-httplib/Config.in
> +++ b/package/cpp-httplib/Config.in
> @@ -1,9 +1,11 @@
>  comment "cpp-httplib needs a toolchain w/ C++, wchar, threads"
> +	depends on BR2_TOOLCHAIN_HAS_ATOMIC
>  	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
>  
>  config BR2_PACKAGE_CPP_HTTPLIB
>  	bool "cpp-httplib"
>  	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_HAS_ATOMIC
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on BR2_USE_WCHAR
>  	help
> diff --git a/package/cpp-httplib/cpp-httplib.mk b/package/cpp-httplib/cpp-httplib.mk
> index 94f270df94..c9649936e4 100644
> --- a/package/cpp-httplib/cpp-httplib.mk
> +++ b/package/cpp-httplib/cpp-httplib.mk
> @@ -13,6 +13,12 @@ CPP_HTTPLIB_INSTALL_STAGING = YES
>  CPP_HTTPLIB_CONF_OPTS = \
>  	-Dtest=false
>  
> +CPP_HTTPLIB_LDFLAGS = $(TARGET_LDFLAGS)
> +
> +ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
> +CPP_HTTPLIB_LDFLAGS += -latomic
> +endif
> +
>  ifeq ($(BR2_PACKAGE_CPP_HTTPLIB_COMPILE),y)
>  CPP_HTTPLIB_CONF_OPTS += -Dcompile=true
>  CPP_HTTPLIB_DEPENDENCIES += host-python3
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
