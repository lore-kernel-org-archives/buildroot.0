Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1370FCAC592
	for <buildroot@archiver.kernel.org>; Fri, 19 Sep 2025 12:56:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB36D80F75;
	Fri, 19 Sep 2025 12:56:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lPCvM1784ZRI; Fri, 19 Sep 2025 12:56:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7FC88101C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7FC88101C;
	Fri, 19 Sep 2025 12:56:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B4301D7F
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:56:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B168660F83
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:56:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8ZotLddL98ux for <buildroot@buildroot.org>;
 Fri, 19 Sep 2025 12:56:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B6BCE60738
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6BCE60738
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B6BCE60738
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:56:17 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3ee12807d97so1622613f8f.0
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 05:56:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758286576; x=1758891376;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RQmkp3WhvotpttvyKP5UXnKrTvkMaBFcW+E9KosDPqE=;
 b=ZXWl+j1lAFmL2olC6kaJTY4ZGqjp8u2dWS9hUTVf9YZRqUTec4I+QJhLesChUd16iM
 IK0Lr6x0N0XsVWDPLxGvEtnqB1tH70cmammTdcWbr7dywQLdhq6gMEynZI1n3EJt22Se
 h0ThYfNAUKB2CrC8aFmK9ucXtFY6UxLpnr76veJejGCq5LXHQ8QgVThJI6eb/Fb/Cz3y
 AuO3AOGkq6xsZeZ5UlcIVcH5QDDrIW/pyut9bs9aUdlIlrXy2qOQk9IsW8eUlhOtO7Et
 jZf4vswl+kkA8vNsS7px+ITw4+OFrl2TDnve0VmSqNXRwczmQBp6S4z0GXZLXjpF/QWw
 /hkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpnEdXlxvNGIVOcIocMhwDfPzSRA4wqfnRnMUaf4xS5ORfFN8G7iukN3u9Y+z5JEClCb/AyinlJyk=@buildroot.org
X-Gm-Message-State: AOJu0Yzl8f/RcbZRaZlxmbR/Yc4GhtBkkV5Jzd5w2jYc4tfsXM7b8Tu9
 l1YqDK7A7gsKEkwuj14ULvpwGVZS24lK2J6fp2epY3iI/p2zc4t6c9OVsNYN074eJI/9gvCr4Hy
 0Ed/jM50=
X-Gm-Gg: ASbGnctxXJISnG4bimudy05q2nihVYUU4/iGJSagfpN4Ej67Y4+kDKsJ0fg+miW8RI5
 rps8xTZibsMGgMcjJw7pyUHLUCUcdEW0Wx/Q0aSNkc9jZLcEKXzdPNnwDdWsX4CIlRd3CvuFeEi
 8STAYGwT8d0Fhl9B6/fII//wBJ2zLyjWZWlZJQ7Ll/PvK6f+Akh36t4vzAeD86XqHhclAQAMJLn
 J5erPwwHh5uCTLQ1rDX2ZRq15GwdvotlDrq/0K0X1mXgf4+80eI5pzewuUQR9zHsxHPXGvpehkR
 mnJg6Rq+bwFrdjuemH17zqE9Mae5swWZ1YCEqAKraVmAiv6s6KVC8b5BrBqIF7LHXJqW9DVl/zq
 aLCzqw+75PiEaoO8=
X-Google-Smtp-Source: AGHT+IEquyIUgGBjjy2VmLkkb4ExJTZ1SS9G1ZmRvtZg1EACsEWb1FhyE4k2uOVHywIOMdgdqwgiaw==
X-Received: by 2002:a05:6000:2881:b0:3d1:e1b1:9640 with SMTP id
 ffacd0b85a97d-3ee84171ba0mr1943009f8f.30.1758286575685; 
 Fri, 19 Sep 2025 05:56:15 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3ee0fbd64dbsm7426036f8f.50.2025.09.19.05.56.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Sep 2025 05:56:15 -0700 (PDT)
To: Victor Krawiec <victor.krawiec@arturia.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 19 Sep 2025 14:56:14 +0200
Message-ID: <20250919125614.136212-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250901082210.17331-1-victor.krawiec@arturia.com>
References: <20250901082210.17331-1-victor.krawiec@arturia.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1758286576; x=1758891376; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RQmkp3WhvotpttvyKP5UXnKrTvkMaBFcW+E9KosDPqE=;
 b=S5MDO02B7YNt+hxB/glPuhNs4MkOvq2XUmzrS2xbOxvgz8LqwMdvuBIIKDE7VREoFB
 1MHMQAoDg54OBayBbVKR8IVj+y/jlp0915Gfaj0moRGtNn92460jLxRQl4B5TgyG/bgD
 iOy08NB1AkYqCrcIwj/jRfoGABdM+P5afVlOhFmEBhiUClXRdl5/X0p36wtm9Q9YnU8f
 voEdZgvG7mt8f/v/DLi/er+CaiK8oMVKVlklXOgAdvanjLOri73A0dXWXwk9/MPTZlfJ
 hZvZmTMGGK8TqDKwmN38asjRTyOk1Rx3mVMg+umQzWmvQDNTixJJ7Mmxe00Z1nqTq93z
 uewg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=S5MDO02B
Subject: Re: [Buildroot] [PATCH v3] package/llvm-project/lld: fix broken
 symlink in SDK
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
> The symlink bin/lld -> $(GNU_TARGET_NAME)/bin/lld is broken inside a SDK containing host-lld package
> The symlink still points to the location of lld inside the build's host folder instead of the location of lld inside the SDK
> In consequence GCC is not able to find lld linker
> Changing the symlink to be relative during host-lld installation fixes the problem
> 
> Signed-off-by: Victor Krawiec <victor.krawiec@arturia.com>
> 

Applied to 2025.02.x, 2025.05.x & 2025.08.x. Thanks

> ---
> Changes v2 -> v3:
>   - Change commit Author to match SoB line
> 
> Changes v1 -> v2:
>   - Change SoB line to use full name
> 
> Signed-off-by: Victor Krawiec <victor.krawiec@arturia.com>
> ---
>  package/llvm-project/lld/lld.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/llvm-project/lld/lld.mk b/package/llvm-project/lld/lld.mk
> index c9a2d3796b..e7233e74ae 100644
> --- a/package/llvm-project/lld/lld.mk
> +++ b/package/llvm-project/lld/lld.mk
> @@ -20,8 +20,8 @@ HOST_LLD_CONF_OPTS += -DLLVM_COMMON_CMAKE_UTILS=$(HOST_DIR)/lib/cmake/llvm
>  # GCC looks for tools in a different path from LLD's default installation path
>  define HOST_LLD_CREATE_SYMLINKS
>  	mkdir -p $(HOST_DIR)/$(GNU_TARGET_NAME)/bin
> -	ln -sf $(HOST_DIR)/bin/lld $(HOST_DIR)/$(GNU_TARGET_NAME)/bin/lld
> -	ln -sf $(HOST_DIR)/bin/lld $(HOST_DIR)/$(GNU_TARGET_NAME)/bin/ld.lld
> +	ln -sfr $(HOST_DIR)/bin/lld $(HOST_DIR)/$(GNU_TARGET_NAME)/bin/lld
> +	ln -sfr $(HOST_DIR)/bin/lld $(HOST_DIR)/$(GNU_TARGET_NAME)/bin/ld.lld
>  endef
>  
>  HOST_LLD_POST_INSTALL_HOOKS += HOST_LLD_CREATE_SYMLINKS
> -- 
> 2.43.0
> 
> 
> -- 
> *t.+33 438 020 555 *
> 
> 
> 
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
